## 1. Separate the stable top-level label from `global-set!` (design D2)

- [x] 1.1 Add `lower-top` in `src/passes/lower.ss`: walk one lowered form's top-level spine — a `global-set!`, and the `seq` chain a `define-record-type` expands to — applying `lower-global-init` there; anything else falls through to `lower` with the same empty `locals`/`fmap`/`self` `lower-program` passes today
- [x] 1.2 Enter through it from `lower-program`, and reduce `lower`'s `global-set!` arm to `(global-set! s (L rhs))` so a NESTED one lowers its rhs through the ordinary anonymous-lambda arm
- [x] 1.3 Confirm this is a no-op for everything that compiles today: the program/REPL unit never took the stable path (`*unit*` is the empty prefix), and a library define's form is exactly one `global-set!` at the spine — check by diffing `build/lib/scheme.base.ll` before and after (must be byte-identical)

## 2. Permit the assignment and record it (design D1)

- [x] 2.1 Add `*unit-assigned*` beside `*unit-procs*` in `src/passes/lower.ss` with `reset-unit-assigned!` / `add-unit-assigned!` / `unit-assigned?`, commented as the record of which bindings may not be advertised as direct-callable
- [x] 2.2 Filter `unit-procs` — the single reader, consumed by `export-call-rows` on both the whole-unit and the pruned path — against `unit-assigned?`, so the withholding happens once and cannot be forgotten by a caller
- [x] 2.3 In `assign-global` (`src/parse.ss`), replace the "cannot assign to a unit's top-level binding" error with the store, recording the name via `add-unit-assigned!` when the resolved symbol IS the plain name (a unit top level) and not when it is a session global (`n.gN`); leave the `imported` and `primitive` arms erroring
- [x] 2.4 Reset the set per unit in `compile-library*` (`src/core.ss`) next to `reset-unit-procs!`, so an assignment in one library cannot withhold another library's row
- [x] 2.5 Rewrite the D4 rationale comment at `assign-global` — it currently states the prohibition as the reason cross-unit direct calls are sound — to state the withheld-row invariant instead, and point at design D4 here

## 3. Verification

- [x] 3.1 The issue #14 reproduction compiles: `build/emit lib /tmp/mut.sld` succeeds where it previously reported `cannot assign to a unit's top-level binding f`
- [x] 3.2 Semantics, the test that actually matters (design D4 leg 2): an importing program that calls `f`, calls `bump`, then calls `f` again observes the OLD value then the NEW one — it cannot, if the call was lowered direct
- [x] 3.3 The export table for that library records `f`'s symbol and NO call row, while an unassigned sibling of the same shape keeps its row — so the withholding is per binding, not per unit
- [x] 3.4 The emitted unit defines `mylib:code:f` exactly once and links (the D2 collision; without task 1 the unit does not link at all)
- [x] 3.5 `(set! car …)` in a library body is still rejected, and so is assignment to a primitive — the arms that must not have moved
- [x] 3.6 Same program through the AOT and run doors, and through the tree-shaking path, agrees on the value (design D3: the pruned table is discarded, so the program's indirect call must survive pruning)
- [x] 3.7 Register the new suite in `run-all-tests.sh` (Chez-free, like `test/cross-unit-direct-call-tests.sh`)
- [x] 3.8 `./run-all-tests.sh` and `./run-dev-tests.sh` green
- [ ] 3.9 `make regen` reconverges (a second regen reproduces `bootstrap/*.ll` byte-for-byte) and `test/trust-check.sh` passes on the commit; the IR diff must be compiler churn only, with no change to `build/lib/scheme.base.ll`

## 4. Close-out

- [x] 4.1 Amend `openspec/changes/cross-unit-direct-calls/design.md` D4: reason (2) is superseded — record the withheld-row invariant and cross-reference this change, since that change is complete but unarchived and its delta modifies the same requirement
- [x] 4.2 Update `docs/MODULES.md` for the export-table rule (a binding its unit assigns records no call row) and note the R7RS §5.3.1 behaviour is now supported inside a library
- [ ] 4.3 Commit referencing `Fixes #14`, and confirm issue #16 (a library body's non-define top-level form is dropped) records the part deliberately left out
