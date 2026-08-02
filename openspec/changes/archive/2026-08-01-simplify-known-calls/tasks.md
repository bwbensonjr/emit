## 0. Baseline (record before touching the ladder)

- [x] 0.1 Record the `demos/square.scm` baseline: the `--dump` IL after every stage, the emitted `scheme_entry` from `emit run --emit`, and the fact that `opt -O2` on the extracted program unit leaves it unchanged (the P6 measurement — re-derive it so the change carries its own evidence) — re-derived: `-O2` leaves the alloc + store + masked reload + indirect call verbatim
- [x] 0.2 Record the committed binary sizes (`build/emit`, `build/emit-boot`) and the demo-suite wall time, so task 5 can show the pass shrinks rather than grows the output — build/emit 1111752, build/emit-boot 929712, demo suite 20.4s
- [x] 0.3 Pick 2–3 additional shapes from `demos/` that the pass should and should not fire on (one singly-called helper, one recursive function, one procedure passed as a value) and record their current IL as the before-picture — square (single-use helper), fact (self-recursive), counter (`make-counter` called once, `f` called twice), toplevel (the `let`+`set!` shape)

## 1. The pass

- [x] 1.1 Create `src/passes/simplify.ss` with the pass entry point `(simplify e)`, matching the house style of `src/passes/recognize-let.ss` (one `match` traversal, no framework)
- [x] 1.2 Implement occurrence counting over the whole term, including nested lambda bodies, respecting shadowing (an inner binder of the same name does not count toward the outer binding) — `sfy-uses` returns a list of occurrence *shapes* (`ref`, or an arity for an operator use), so counting and the operator/arity test are one traversal
- [x] 1.3 Implement rule 1 — inline a `letrec`/`let` binding whose RHS is a `lambda`, whose name occurs exactly once, whose occurrence is the operator of a `call`, and whose fixed arity matches the argument count; form the `let` at the call site and drop the binding (design D2)
- [x] 1.4 Implement rule 2a — constant propagation: substitute a `let` binding of a `(const …)` into the body and drop the binding — restricted to **immediates** (design D3a): a string/pair/flonum/symbol constant materializes at run time, so copying it would allocate a second object and break `eq?`
- [x] 1.5 Implement rule 2b — constant folding: fold a `primcall` whose arguments are all `(const …)`, for the integer primitives whose runtime behavior is exactly defined; leave every other primitive alone — `%+ %- %* %= %<`
- [x] 1.6 Implement the fixnum range guard (design D3): refuse to fold unless the result is representable as a 61-bit signed target fixnum, so a compile-time fold can never disagree with `rt_*`. This is the highest-risk line in the change — write it deliberately and test it at the boundary (task 5.2) — **reworked mid-implementation**: the exact boundary test could not survive self-hosting (`encode-const` cannot represent the boundary literals, so the guard silently disabled all folding in the shipped compiler). Replaced by a ±(2^30 − 1) window, the largest bound for which no `+`/`-`/`*` can leave the fixnum range. See design D3
- [x] 1.7 Implement rule 3 — drop `letrec`/`let` binders with no remaining references whose RHS is syntactically effect-free (a `lambda` or a `const`)
- [x] 1.8 Iterate the rule set to a fixed point with a small cap (design D4); narrate/log if the cap is ever reached — cap 10, never reached

## 2. Ladder registration

- [x] 2.1 `src/compile.ss:24` — add `(include "src/passes/simplify.ss")` alongside the other pass includes
- [x] 2.2 `src/compile.ss:433` — add the pass file to the compiler-source list that feeds the artifact `.stamp` hash, so a change to the pass invalidates cached units — verified live: the first run after the edit reported `recompile: source changed`
- [x] 2.3 `src/core.ss` — insert the pass and its `dump` call between `convert-assignments` and `convert-closures` in all three ladders: the program ladder (`:62-67`), the unit ladder (`:286-289`), and the program-with-imports ladder (`:441-444`). Resolve the design's open question on library units here — add it uniformly and measure — added uniformly; it runs over all 120 `(scheme base)` defines and rewrites none (`scheme.base.ll` byte-identical)
- [x] 2.4 `tools/regen.sh:44` and `test/self-host-fixpoint.sh:36` — add `src/passes/simplify.ss` to the ordered flat-source concatenation (correct position in the ladder order)
- [x] 2.5 Add the include to the pass-ladder test harnesses that build their own ladder: `test/repl.ss:20`, `test/repl-batch.ss:18`, `test/repl-frontend.ss:15`, `test/repl-frames.ss:16`, and wire the call where each invokes `recognize-let`/`convert-assignments`

## 3. Observability

- [x] 3.1 Confirm `--dump` prints the `simplify` stage in ladder order on every door (`emit run`, `emit lib`, `emit repl`), following `docs/OUTPUT.md`
- [x] 3.2 `test/dump-stages-tests.sh:47` — update the hard-coded expected stage list (currently "seven stages in ladder order") to include `simplify`, and update the assertion text
- [x] 3.3 `test/dump-parity-tests.sh` — confirm the Chez driver and the shipped binary still agree stage-for-stage with the new stage present — 9/9; this suite is what caught the self-hosting guard failure in 1.6

## 4. Documentation

- [x] 4.1 `docs/PIPELINE.md` — add `simplify` to the ladder diagram (`:66`) and to the per-stage IL table (`:122-131`) with its input/output IL shape; note that it is the first pass that removes work rather than translating it — also added to the Chez pass-mapping table as a `cp0`-style optimizer subset
- [x] 4.2 `docs/PIPELINE.md` — record the accepted asymmetry: the inlining rule fires on program files (whose top-level defines are `letrec`-bound) and not in the REPL or across library units (whose top-level defines are globals); values are identical on every door — plus the sharper limit found during implementation: `build-program` only emits a `letrec` when *every* top-level define has a lambda initializer
- [x] 4.3 `src/README.md:27,36,48` — add the pass to the ladder listing
- [x] 4.4 `docs/PERFORMANCE.md` — tick P6-A in the item heading and the status table; add the outcome paragraph (measured sizes and timings from task 5), and confirm P6-B is still recorded as unscheduled

## 5. Verification

- [x] 5.1 Pass-level unit tests: a new `test/simplify-tests.ss` in the style of `test/expander-tests.ss`, covering each specs scenario — inlined single-use binding; NOT inlined when multiply-referenced, self-recursive, shadowed, non-operator position, or arity-mismatched; constant propagation and folding; dead-binding removal — 32 tests, registered in `run-dev-tests.sh`
- [x] 5.2 Range-guard boundary tests: products and sums that land just inside and just outside the 61-bit fixnum range in both directions, asserting the outside cases are left unfolded (design D3 — end-to-end demos use small numbers and would not catch this) — rewritten for the window rule: the largest in-window product folds and is asserted to be a fixnum; operands one past the window in both directions are refused; a large constant still propagates
- [x] 5.3 `demos/run-tests.sh` — every demo produces byte-identical output to its baseline (task 0.2) — 72/72 stdout byte-identical, verified directly against a `build/emit` relinked from the previous committed IR
- [x] 5.4 `demos/run-backends.sh` — AOT/JIT/bitcode stay byte-identical to each other — 50/50
- [x] 5.5 `test/self-host-fixpoint.sh` and `make regen` — the fixed point reconverges and the committed `bootstrap/*.ll` seeds are regenerated; `test/trust-check.sh` passes from a clean tree — fixed point at iter 1; independent-host re-derivation and trust-check both pass
- [x] 5.6 Re-measure binary sizes against task 0.2 — expect a shrink from removed dead closures; a growth means a rule is misfiring, investigate before proceeding — **it grew, and was investigated**: +4.7% is the pass's own code in the self-hosted compiler. Compiling the *same* source with the new compiler is −1.1% and −15 functions; user program modules shrink up to −35.6% and never grow
- [x] 5.7 `./run-all-tests.sh` and `./run-dev-tests.sh` both green — 11/11 and 20/20
- [x] 5.8 Add `demos/square.scm` (or an equivalent) to the demo suite as the regression case for this pass, with its expected output — registered in `demos/run-tests.sh` and `demos/run-backends.sh`, and recorded in the module-scaffold baseline

## 6. Close-out

- [x] 6.1 Commit the regenerated `bootstrap/*.ll` together with the source change (a compiler edit without `make regen` fails the trust-check) — staged together; trust-check green
- [x] 6.2 Re-read the design's Open Questions and record the answers actually taken (library-unit scope; iteration cap value) — both resolved in design.md, plus a third finding (`build-program`'s letrec condition) that bounds where inlining fires

## 7. Follow-ups raised by this change (not in scope)

- [x] 7.1 File the `encode-const` overflow defect as a GitHub issue — filed as [#7](https://github.com/bwbensonjr/emit/issues/7)
- [x] 7.3 **Clamp the fold window from ±(2^30 − 1) to ±(2^28 − 1)** — the original window bounded the arithmetic but not the *encoding*: `encode-const` mis-emits any literal at or above 2^57 (issue #7), so a folded result in [2^57, 2^60) came out wrong on the self-hosted door. This shipped briefly as a value-changing regression (`(* 1073741823 1073741823)`). Added `demos/fold-boundary.scm`, which evaluates each folded expression alongside the same expression computed at run time and asserts they agree — it reproduces the bug on the unclamped compiler and passes on the clamped one. Verified no existing demo's IR changed
- [x] 7.4 **Fix issue #7 and widen the window back** — `encode-const` now multiplies in decimal on the digit string instead of computing `(* d 8)` in the compiler's own fixnums, so literals across the whole fixnum range round-trip on both hosts. With the encoding ceiling gone, `sfy-fold-limit` returns to ±(2^30 − 1), its arithmetic ceiling. Added `demos/fixnum-literals.scm`; the decimal routine was checked against exact arithmetic on every boundary, 2^0..2^60, and 200000 random values (0 mismatches)
- [x] 7.2 Widen `build-program` to emit a `letrec` for the lambda-initialized subset of top-level defines, so a program with one non-lambda define does not lose top-level inlining entirely — done. Boxed defines go in an enclosing `let`, lambda-initialized ones in a `letrec` between it and the `set!`s. 9 of 75 demos' IR changed, all smaller (up to −22.4%), none larger, all stdout-identical; the compiler's own IR −10.3% and `build/emit` −4.7%, repaying the pass's own cost
- [x] 7.5 Prerequisite for 7.2: fix `set!` on a `letrec`-bound name compiling to a crash — filed as [#8](https://github.com/bwbensonjr/emit/issues/8) and fixed; assigned letrec bindings now split out into an enclosing boxed `let`
