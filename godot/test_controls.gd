extends SceneTree

var failures := 0
func _initialize() -> void:
	call_deferred("run")
func check(ok: bool, label: String) -> void:
	print("PASS " if ok else "FAIL ", label)
	if not ok:
		failures += 1
func key(code: Key, target: Viewport = root) -> void:
	for pressed in [true, false]:
		var event := InputEventKey.new()
		event.keycode = code
		event.pressed = pressed
		target.push_input(event, true)
func click(point: Vector2) -> void:
	for pressed in [true, false]:
		var event := InputEventMouseButton.new()
		event.position = point
		event.global_position = point
		event.button_index = MOUSE_BUTTON_LEFT
		event.pressed = pressed
		root.push_input(event, true)
func run() -> void:
	root.size = Vector2i(1920, 1080)
	root.gui_embed_subwindows = true
	var scene: Node = load("res://control_gallery.tscn").instantiate()
	root.add_child(scene)
	for i in 4:
		await process_frame
	var basic: Node = scene.get_node("MainPanel/HSplitContainer/BasicControls/VBoxContainer")
	for name in ["CheckBox", "CheckButton"]:
		var control: BaseButton = basic.get_node(name)
		click(control.get_global_rect().get_center())
		check(control.button_pressed, name + " mouse toggles on")
		click(control.get_global_rect().get_center())
		check(not control.button_pressed, name + " mouse toggles off")
	var tabs: TabContainer = basic.get_node("TabContainer")
	var bar := tabs.get_tab_bar()
	bar.grab_focus()
	for i in range(1, 7):
		key(KEY_RIGHT)
		check(tabs.current_tab == i and tabs.get_tab_control(i).visible, "tab keyboard selection " + str(i + 1))
	var line: LineEdit = basic.get_node("LineEdit")
	line.grab_focus()
	key(KEY_END)
	var letter := InputEventKey.new()
	letter.keycode = KEY_X
	letter.unicode = 120
	letter.pressed = true
	root.push_input(letter, true)
	check(line.text == "LineEditx", "LineEdit typed character")
	key(KEY_BACKSPACE)
	check(line.text == "LineEdit", "LineEdit backspace")
	var numbers: Node = scene.get_node("MainPanel/HSplitContainer/VSplitContainer/HSplitContainer/Numbers/VBoxContainer")
	var slider: HSlider = numbers.get_node("HSliderContainer/HSlider")
	slider.grab_focus()
	key(KEY_END)
	check(slider.value == 100, "slider keyboard maximum")
	key(KEY_HOME)
	check(slider.value == 0, "slider keyboard minimum")
	check(numbers.get_node("ProgressBarContainer/ProgressBar").value == 50, "progress bar remains independent display")
	var lists: Node = scene.get_node("MainPanel/HSplitContainer/VSplitContainer/Lists/VBoxContainer/HBoxContainer")
	var radios: Node = lists.get_node("VBoxContainer/RadioButtons")
	for i in 3:
		var radio: CheckBox = radios.get_child(i)
		click(radio.get_global_rect().get_center())
		var active := 0
		for child in radios.get_children():
			if child.button_pressed:
				active += 1
		check(active == 1 and radio.button_pressed, "radio group exclusive selection " + str(i))
	var tree: Tree = lists.get_node("VBoxContainer2/Tree")
	var item := tree.get_root()
	check(item.get_child_count() == 2 and item.get_child(0).get_child_count() == 1, "script built tree hierarchy")
	check(item.get_button_count(0) == 2 and item.is_button_disabled(0, 1), "tree enabled/disabled buttons")
	var first: FoldableContainer = lists.get_node("VBoxContainer2/FoldableContainer")
	var second: FoldableContainer = lists.get_node("VBoxContainer2/FoldableContainer2")
	click(second.global_position + Vector2(40, second.size.y - 12))
	await process_frame
	check(first.folded and not second.folded, "bottom foldable opens and closes sibling")
	click(first.global_position + Vector2(40, 12))
	await process_frame
	check(not first.folded and second.folded, "top foldable opens and closes sibling")
	var option: OptionButton = lists.get_node("VBoxContainer/OptionButton")
	option.grab_focus()
	key(KEY_SPACE)
	await process_frame
	var popup := option.get_popup()
	check(popup.visible, "option popup opened via keyboard")
	print("OPTION_INITIAL_FOCUS ", popup.get_focused_item())
	for i in 5:
		if popup.get_focused_item() == 1:
			break
		key(KEY_DOWN)
		await process_frame
	key(KEY_ENTER)
	await process_frame
	check(option.selected == 1, "option selection routed through popup")
	var spin: SpinBox = numbers.get_node("SpinBox")
	var spin_line := spin.get_line_edit()
	spin_line.grab_focus()
	spin_line.select_all()
	for digit in [52, 50]:
		var typed := InputEventKey.new()
		typed.unicode = digit
		typed.keycode = digit
		typed.pressed = true
		root.push_input(typed, true)
		typed = typed.duplicate()
		typed.pressed = false
		root.push_input(typed, true)
	key(KEY_ENTER)
	await process_frame
	print("SPIN_TEXT ", spin_line.text, " VALUE ", spin.value)
	check(spin.value == 42, "SpinBox accepts typed 42")
	var text_edit: TextEdit = basic.get_node("TextEdit")
	text_edit.grab_focus()
	var old_lines := text_edit.get_line_count()
	key(KEY_ENTER)
	check(text_edit.get_line_count() == old_lines + 1, "TextEdit accepts newline")
	var items: ItemList = lists.get_node("VBoxContainer/ItemList")
	for index in [0, 1, 3]:
		click(items.global_position + items.get_item_rect(index).get_center())
		check(items.is_selected(index), "ItemList mouse selects enabled " + str(index))
	click(items.global_position + items.get_item_rect(2).get_center())
	check(not items.is_selected(2), "ItemList rejects disabled row")
	var menu: MenuButton = lists.get_node("VBoxContainer/MenuButton")
	click(menu.get_global_rect().get_center())
	await process_frame
	check(menu.get_popup().visible, "MenuButton opens popup")
	key(KEY_ESCAPE)
	await process_frame
	check(not menu.get_popup().visible, "Escape dismisses menu")
	var color: ColorPickerButton = basic.get_node("ColorPickerContainer/ColorPickerButton")
	click(color.get_global_rect().get_center())
	await process_frame
	check(color.get_popup().visible, "color picker opens")
	key(KEY_ESCAPE)
	await process_frame
	check(not color.get_popup().visible, "Escape dismisses color picker")
	var split: HSplitContainer = scene.get_node("MainPanel/HSplitContainer")
	var left: Control = split.get_child(0)
	var boundary := left.global_position + Vector2(left.size.x, 200)
	var offset_before := split.split_offset
	var press := InputEventMouseButton.new()
	press.position = boundary
	press.global_position = boundary
	press.button_index = MOUSE_BUTTON_LEFT
	press.pressed = true
	root.push_input(press, true)
	var drag := InputEventMouseMotion.new()
	drag.position = boundary + Vector2(80, 0)
	drag.global_position = drag.position
	drag.relative = Vector2(80, 0)
	drag.button_mask = MOUSE_BUTTON_MASK_LEFT
	root.push_input(drag, true)
	press = press.duplicate()
	press.position = drag.position
	press.global_position = drag.position
	press.pressed = false
	root.push_input(press, true)
	await process_frame
	check(split.split_offset != offset_before, "horizontal split mouse drag changes offset")
	print("HEADLESS STATE ONLY; visual QA and remaining interactions pending; failures=", failures)
	scene.queue_free()
	await process_frame
	quit(1 if failures else 0)
