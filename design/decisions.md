# Open questions log — walker-gui-control-gallery

Gate — unsigned at time of writing. Written by `/gdd reverse` (silent), 2026-09-27. Every `[MISSING]` in `GDD.md` is one row here. Format: THE QUESTION / THE STAKES / DECISION DEADLINE / OPTIONS / OWNER / STATUS. Decided items move into their GDD section before the next session.

| # | Question | Stakes | Deadline | Options | Owner | Status |
|---|---|---|---|---|---|---|
| Q-01 | Why is this demo in Walker? | Without it, "done" is undefined and the films have no thesis | before the first film script | (a) reference specimen for GUI chapters; (b) film subject only; (c) baseline for a Walker UI theme | Nik Bear Brown | Open |
| Q-02 | Who is it for? | Decides narration level and which controls matter | with Q-01 | Godot beginners · Walker students · general viewers | Nik Bear Brown | Open |
| Q-03 | Are there pillars, or is "upstream-faithful" the only rule? | Any change (theming, handlers) needs a rule to be judged by | with Q-01 | (a) upstream-faithful, title only; (b) Walker may extend with logged changes | Nik Bear Brown | Open |
| Q-04 | What should a viewer know or be able to do after using it? (PX goal / success criterion) | No goal means no test of success and no film verdict | before H-02 | recognise N controls by sight · know which controls have disabled states · none (pure reference) | Nik Bear Brown | Open |
| Q-05 | Scope beyond upstream: any tour, checklist, or progression? MVP? | Feature creep vs. staying a copy; CORE % cannot be computed without it | before any code change | none (default today) · guided tour · per-panel checklist | Nik Bear Brown | Open |
| Q-06 | Who does the visual QA (layout, colors, highlighting, graph) and when? | Headless passes keep being mistaken for verification (R-01) | before any film | named reviewer + date | Nik Bear Brown | Open |
| Q-07 | Film plan: are both native-4K Liam films still wanted, and what do they claim? | README lists them pending; no script, no capture | when the capture blocker lifts | keep both · one film · none | Nik Bear Brown | Open |
| Q-08 | Should MenuButton check/radio items toggle (add handlers) or stay upstream-faithful? | A film could imply behavior that does not exist (R-02) | before film scripting | (a) leave as upstream and say so; (b) add handlers as a logged Walker change | Nik Bear Brown | Open |

## Decisions logged

None. Nothing in this folder records an approved design decision.
