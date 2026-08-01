## 1. Pin the present behaviour first

- [x] 1.1 Add failing-by-design fixtures under `test/modules/` for the three shapes established in the design table: a library with a command (silently dropped today), a library exporting a record type (`export of a name the library does not define`), and one using a record type internally (`unbound variable`)
- [x] 1.2 Capture `build/lib/scheme.base.ll` from a clean build as the byte-identity baseline — the check that no existing unit moves, and the one thing that cannot be reconstructed after the edit

## 2. Lower every body form, in source order (design D1)

- [x] 2.1 In `compile-library*` (`src/core.ss`), replace the `filter define-form?` narrowing so both lowering paths fold over the whole of `runtime`; keep `fold-left` (cross-host determinism — Chez's `map` and the prelude's `map` apply in different orders and would diverge the two doors' bytes)
- [x] 2.2 Keep `defined-names` meaning "names this unit defines" — after the task 3.1 splice it still draws from defines alone, and is what `export`-validation and the shake's dependency filter test against
- [x] 2.3 Give a command a positional dump tag in `unit-def-lcode`, which today tags with the define's name; confirm `--dump` output is still readable and that `test/dump-stages-tests.sh` passes
- [x] 2.4 Verify the emitted shape: one `@"L:__init_N"` thunk per body form, called from `@"L:__init"` in source order, with the command's thunk between its neighbours' — not appended after them

## 3. `define-record-type` in a library body (design D2 — splice, revised during apply)

- [x] 3.1 Normalize the body before it is split: replace each `(define-record-type ...)` with the `(define <name> <init>)` forms `record-type-bindings` returns, in place, exactly as `collect-toplevel` already does for a program (`src/parse.ss:548`). Everything downstream then sees only defines and commands
- [x] 3.2 Confirm the spliced defines register in phase 1 and validate as exports with no further change — a sibling body form resolves `pt-x`, and `(export make-pt pt-x)` passes
- [x] 3.3 Confirm the descriptor's gensym name (`rtd.N`) is IDENTICAL in the whole and pruned compiles — normalization runs after `reset-counter!` over the same body list in both, so the counter is in the same state; a divergence here would break `cross-unit-direct-calls` D1 for records
- [x] 3.4 Confirm `repl-lower-form*` is untouched, so interactive `define-record-type` still allocates generations (`test/record-type-syntax-tests.sh`, REPL suites) — the whole point of preferring the splice

## 4. Tree-shaking rules (design D3)

- [x] 4.1 Extend the pruned path's `expanded` keying to cover a form that defines NO name (a command); after task 3.1 every other body form is a plain define, so the one-name-per-form node stays
- [x] 4.2 Always keep a command, and add the unit's own names it references (its `all-symbols` intersected with `defined-names`) to the root set, so the shake cannot prune a binding a kept command calls into a link-time undefined symbol
- [x] 4.3 Confirm the shake's narration still reports what it kept, per `docs/OUTPUT.md`, so the pruning loss a command imposes is visible rather than silent

## 5. Verification

- [x] 5.1 The fixtures from 1.1 now pass: the command runs, and the record type is usable internally and exportable
- [x] 5.2 Source ordering is observable, not assumed: a body with command / define / command records the two effects in source order
- [x] 5.3 All three doors agree — AOT (with and without the tree-shake), run, REPL — on both a command library and a record library
- [x] 5.4 The tree-shake cases: a pruned unit still runs its command; a procedure only the command calls survives pruning and the program links; a reached accessor keeps the descriptor it needs (and NOT, per design D3, the rest of the record's bindings)
- [x] 5.5 **Interaction with `library-toplevel-set` (design D5):** a library *top-level* `(set! f …)` now takes effect, and `f`'s call row is still withheld from the export table — the failure mode is silent misdispatch, so assert the table, not just the value
- [x] 5.6 `build/lib/scheme.base.ll` is byte-identical to the 1.2 baseline, and `bootstrap/scheme.base.ll` is unchanged by the regen — the proof that no existing unit is affected
- [x] 5.7 Register the new suite in `run-all-tests.sh`; `./run-all-tests.sh` and `./run-dev-tests.sh` green
- [x] 5.8 `make regen` reconverges (a second regen reproduces `bootstrap/*.ll` byte-for-byte) and `test/trust-check.sh` passes on the commit

## 6. Close-out

- [x] 6.1 Update `docs/MODULES.md`: the library body surface admits commands and `define-record-type`, declarations run in source order, and the `library-toplevel-set` note that a top-level `set!` is dropped is no longer true — remove it
- [x] 6.2 Record the deferred items where they belong: `include`/`include-ci`/`include-library-declarations`/`cond-expand` filed as **#18**. The `docs/PERFORMANCE.md` half was conditional on a real library making it measurable — no library in the repo has a command, so nothing was added (the condition did not hold)
- [x] 6.3 Commit referencing `Fixes #16`
