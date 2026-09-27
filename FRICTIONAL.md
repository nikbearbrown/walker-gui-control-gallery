# Verification and friction — 2026-09-24 09:08 UTC

Read original README, project settings, complete scene and tree.gd before copying.
No gui source AGENTS.md found; target did not exist. Preserved original assets and
root MIT license. No existing Godot/ffmpeg/repoloop process found. Title only changed.

Godot 4.7.2 headless import and normal 120-frame runtime completed without script
errors (import-20260924.log, runtime-20260924.log). No visible windows opened.

`test_controls.gd` uses a 1920x1080 headless viewport and embedded subwindows.
Actual mouse events toggle checkbox/checkbutton, radio selection and grouped
foldable titles. Keyboard events traverse tabs 2–7, insert/remove a LineEdit
character, move slider to bounds and open/select an OptionButton popup. Additional
assertions inspect generated tree hierarchy, disabled tree button and independent
progress display. Final controls-routing-fixed-20260924.log exits 0 with 24 passes.

Initial controls-20260924.log and controls-focus-fixed-20260924.log retain a failed
popup-selection assertion. Directly sending keys to the embedded popup did not
activate its selection; routing through the root viewport with a frame between
navigation events worked. Only diagnostic routing changed, not demo behavior.

Headless state checks are not visual verification or film evidence. Remaining
bounded checks: item-list disabled selection, split dragging, editable multiline
and numeric controls, and graph/menu/color picker behavior where safely testable.
Do not claim menu check items toggle automatically: source has no signal handlers.
Both films await the existing user-closed visible capture session; no new approval,
recording, publication or upload performed. Keep current item for remaining checks.

## 09:53 UTC — expanded headless checks

Expanded diagnostics now pass 35 assertions in
controls-expanded-input-20260924.log (exit 0, no script errors). Added real input
for SpinBox entry of 42, TextEdit newline, enabled ItemList selections and refusal
of disabled row, MenuButton and ColorPickerButton opening/Escape dismissal, and
80-pixel horizontal splitter drag changing its offset. The earlier expanded log
retains one failed numeric-entry assertion: diagnostic was corrected to send
complete keycode/Unicode press-release pairs and wait a frame after submission.
No demo behavior change was needed.

These checks do not verify rendered layout, color changes, code highlighting,
graph manipulation, or every toolkit interaction. Those remain explicit visual
session work, not evidence of completed films. Headless bounded verification is
sufficient to proceed to the next feasible item under the existing capture
blocker; retain both films and human review as pending.
