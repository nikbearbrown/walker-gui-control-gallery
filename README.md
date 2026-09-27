# Walker — Control Gallery

**What this is.** An independent local copy of Godot's `gui/control_gallery`
demo: one screen that shows Godot's Control nodes (buttons, text fields, tabs,
sliders, lists, a tree, a graph, foldable containers) with each control's name
written on it. It is a tech demo, not a game: there is no goal, score or ending.

**Why it is in Walker.** It is one of the upstream Godot demos Walker has
copied and checked headless; two native-4K Liam films are pending for it.
Its exact purpose inside Walker has not been written down yet (see
`design/decisions.md`, Q-01).

**What was found and verified.** The only runtime adaptation is the Walker
project title. Import and runtime pass. A separate headless diagnostic,
`test_controls.gd`, passes 35 control/state checks. Visual review, the remaining
control interactions and both native-4K Liam films remain pending.

## How to run

Open `godot/project.godot` in Godot 4.7 (the logs record 4.7.2) and run the main
scene, `control_gallery.tscn`.

Controls: there are no custom input actions. Use the mouse and keyboard on any
widget as you would in any desktop UI. Drag the empty space between the three
main panels ("Basic controls", "Numbers", "Lists") to resize them.

## Design

- [`GDD.md`](GDD.md) — the recovered game design document (identical copy of
  `design/GDD.md`). It was reverse-engineered from the code by Walker's Zelda GDD
  skill in silent mode on 2026-09-27. It describes what exists; it is **not an
  approved design**, and no design gate is signed.
- [`design/DECK.html`](design/DECK.html) — slide version for review.
- [`design/IMPLEMENTATION-MAP.md`](design/IMPLEMENTATION-MAP.md) — every feature
  mapped to its real scene nodes and line numbers.
- [`design/decisions.md`](design/decisions.md) — open questions (purpose,
  audience, goals, scope, visual QA, films).

## Source & license

Independent local copy of Godot `gui/control_gallery`, source commit
`a3b5c113112f77291d5f3d1360f33a882fdc52f7`. Original source untouched.
Godot contributors' MIT notice is retained in LICENSE.md; original README,
icon, screenshot, scenes and UIDs remain under `godot`.

## Status

- Only runtime adaptation is the Walker project title.
- `test_controls.gd` is a separate headless diagnostic, not a capture driver.
- Import and runtime pass; 35 control/state checks pass.
- Visual review, remaining control interactions and both native-4K Liam films
  remain pending.

See FRICTIONAL.md.

Repository: https://github.com/nikbearbrown/walker-gui-control-gallery
