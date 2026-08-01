## 1. Pin the present behaviour first

- [ ] 1.1 Add failing-by-design fixtures under `test/modules/` for the three shapes established in the design table: a library with a command (silently dropped today), a library exporting a record type (`export of a name the library does not define`), and one using a record type internally (`unbound variable`)
- [ ] 1.2 Capture `build/lib/scheme.base.ll` from a clean build as the byte-identity baseline — the check that no existing unit moves, and the one thing that cannot be reconstructed after the edit

## 2. Lower every body form, in source order (design D1)

- [ ] 2.1 In `compile-library*` (`src/core.ss`), replace the `filter define-form?` narrowing so both lowering paths fold over the whole of `runtime`; keep `fold-left` (cross-host determinism — Chez's `map` and the prelude's `map` apply in different orders and would diverge the two doors' bytes)
- [ ] 2.2 Keep `defined-names` meaning "names this unit defines" — it now draws from defines AND record-type groups, and is what `export`-validation and the shake's dependency filter test against
- [ ] 2.3 Give a command a positional dump tag in `unit-def-lcode`, which today tags with the define's name; confirm `--dump` output is still readable and that `test/dump-stages-tests.sh` passes
- [ ] 2.4 Verify the emitted shape: one `@"L:__init_N"` thunk per body form, called from `@"L:__init"` in source order, with the command's thunk between its neighbours' — not appended after them

## 3. `define-record-type` in a library body (design D2)

- [ ] 3.1 In `repl-lower-form*` (`src/parse.ss`), make the `record-type-form?` arm respect the unit binder the way the `define` arm respects `register?`: a unit's record bindings must get PLAIN names (`unit-env-define!`), not generation-mangled ones (`pt-x.g0`), because the export table mangles the internal name
- [ ] 3.2 Pre-register a record-type group's names in phase 1 alongside the defines, so a sibling body form may reference an accessor and `(export make-pt)` validates
- [ ] 3.3 Confirm the group's `seq` spine still reaches `lower-top`, so each binding keeps its stable, name-derived code label (`reclib:code:pt-x`) and the whole/pruned label stability of `cross-unit-direct-calls` D1 holds for records
- [ ] 3.4 Confirm the REPL path is untouched: interactive `define-record-type` still allocates generations, so redefining a record type at the REPL still binds fresh globals (`test/record-type-syntax-tests.sh`, REPL suites)

## 4. Tree-shaking rules (design D3)

- [ ] 4.1 Generalize the pruned path's `expanded` from `(name . form)` to `(names . form)` — one name for a define, the group's names for a record type, `'()` for a command — and keep a form when ANY of its names is reachable, which makes a record group all-or-nothing for free
- [ ] 4.2 Always keep a command, and add the unit's own names it references (its `all-symbols` intersected with `defined-names`) to the root set, so the shake cannot prune a binding a kept command calls into a link-time undefined symbol
- [ ] 4.3 Confirm the shake's narration still reports what it kept, per `docs/OUTPUT.md`, so the pruning loss a command imposes is visible rather than silent

## 5. Verification

- [ ] 5.1 The fixtures from 1.1 now pass: the command runs, and the record type is usable internally and exportable
- [ ] 5.2 Source ordering is observable, not assumed: a body with command / define / command records the two effects in source order
- [ ] 5.3 All three doors agree — AOT (with and without the tree-shake), run, REPL — on both a command library and a record library
- [ ] 5.4 The tree-shake cases: a pruned unit still runs its command; a procedure only the command calls survives pruning and the program links; reaching one accessor keeps the whole record group
- [ ] 5.5 **Interaction with `library-toplevel-set` (design D5):** a library *top-level* `(set! f …)` now takes effect, and `f`'s call row is still withheld from the export table — the failure mode is silent misdispatch, so assert the table, not just the value
- [ ] 5.6 `build/lib/scheme.base.ll` is byte-identical to the 1.2 baseline, and `bootstrap/scheme.base.ll` is unchanged by the regen — the proof that no existing unit is affected
- [ ] 5.7 Register the new suite in `run-all-tests.sh`; `./run-all-tests.sh` and `./run-dev-tests.sh` green
- [ ] 5.8 `make regen` reconverges (a second regen reproduces `bootstrap/*.ll` byte-for-byte) and `test/trust-check.sh` passes on the commit

## 6. Close-out

- [ ] 6.1 Update `docs/MODULES.md`: the library body surface admits commands and `define-record-type`, declarations run in source order, and the `library-toplevel-set` note that a top-level `set!` is dropped is no longer true — remove it
- [ ] 6.2 Record the deferred items where they belong: `include`/`include-ci`/`include-library-declarations`/`cond-expand` as an issue if still wanted, and the "shake could drop a provably dead command" optimization in `docs/PERFORMANCE.md` only if a real library makes it measurable
- [ ] 6.3 Commit referencing `Fixes #16`
