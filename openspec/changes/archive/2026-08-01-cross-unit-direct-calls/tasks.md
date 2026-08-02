## 0. Settle the assumption the whole change rests on

- [x] 0.1 **Confirm library globals are never reassigned after `__init`, on both doors** (design D4). Read the REPL preload path and the generation-mangling scheme; then test it: redefine a `(scheme base)` name at the REPL, call both it and a previously-compiled procedure that used the library binding, and check each resolves to the binding it captured. This decides whether the lowering is door-independent or needs an AOT-only carve-out
- [x] 0.2 (not needed -- D4 held on both doors, so no carve-out) If it needs a carve-out: **stop and re-propose**. Varying the *program* module between doors is a far larger departure than P1's (which varies only library units), and it should not be absorbed into this change silently
- [x] 0.3 Record the baseline: `emit`/`schemec` sizes, AOT link wall time, demo-suite time, and the 30M-call probe at 0.06s, so parts 1–3 can each be shown neutral before the combination pays

## 1. Stable code labels for library procedures (design D1)

- [x] 1.1 Give a library top-level lambda binding the label `<unit>:code:<internal-name>`, mangled through the same function as its value symbol; leave inner lambdas, anonymous lambdas, and all program-unit labels on the gensym counter
- [x] 1.2 Make the pruned (tree-shaken) recompile produce the *same* label for a kept binding as the whole-unit compile — this is the property the change exists to establish
- [x] 1.3 Verify directly: compile a library whole and pruned, and diff the label of a procedure present in both. This is the check that would have caught `code_168` vs `code_216`
- [x] 1.4 Confirm program-unit IR is unchanged by the renaming (only library units should move), and re-record the module-scaffold baseline with a before/after capture showing the diff is confined to label spellings

## 2. Export table carries label and arity (design D2)

- [x] 2.1 Extend the `.exports` table to record, for each fixed-arity lambda export, its code label and arity; leave value and variadic exports without one
- [x] 2.2 Ensure the pruned path writes the same table as the full path for the bindings it keeps
- [x] 2.3 Thread label + arity through import resolution alongside the mangled symbol, so a `global-ref` operator can be recognized as a known callee
- [x] 2.4 Confirm no linkage change is needed — library code labels are already external (`define fastcc i64 @"scheme.base:code_1"`, no `internal`), which is why the hand-patched probe linked; correct the stale claim in `docs/PERFORMANCE.md` that said otherwise
- [x] 2.5 Check artifact freshness: the `.exports` format change must invalidate cached artifacts via the existing compiler stamp, not silently load a stale table

## 3. Direct call at the call site

- [x] 3.1 In `lower`, turn `(call (global-ref sym) args)` into the existing `known-app` node when `sym` has a recorded label and the arity matches; reuse the emitter path added for P5-B-general unchanged
- [x] 3.2 Leave arity mismatches and label-less bindings on the indirect path, so arity errors trap exactly as now — add a test for that, since it is the easy thing to get wrong
- [x] 3.3 Emit a `declare` for each external code label a module direct-calls
- [x] 3.4 Verify the emitted call: the global is still loaded (it carries the environment) and only the code-pointer load chain is gone

## 4. LTO on the ship path (design D3)

- [x] 4.1 Add `-flto` to the AOT link (`link_clang` in `src/emit.cpp`, and the `ship-opt` sibling in `src/compile.ss`); leave the JIT/REPL door untouched
- [x] 4.2 Measure delivered binary size against the same programs without LTO. Binary size is a first-class concern here — a regression is a reason to reconsider the setting, not a footnote
- [x] 4.3 Measure AOT link wall time; record it, since it is a per-build cost paid by every user
- [x] 4.4 **Measure LTO standalone**, before the direct calls land: `runtime.c` is in the same link, so LTO may inline `rt_add`/`rt_car` into Scheme code. If that is a large independent win it belongs in its own backlog item and must not be used to justify this change (design Open Questions)

## 5. Verification

- [x] 5.1 The 30M-call probe reaches ~0.01s from 0.06s — the number this change was proposed on
- [x] 5.2 Re-measure the indirect call sites surviving `-O2` in the compiler's module (was 755 direct / 2073 indirect after P5-B-general) and report how many of the 808 cross-unit sites converted
- [x] 5.3 Ackermann and mandelbrot for regression; neither is library-call-heavy, so both should be flat
- [x] 5.4 `demos/run-tests.sh` — every demo's value unchanged; `demos/run-backends.sh` — AOT/JIT/bitcode agree
- [x] 5.5 If D4 held, assert the program module is still byte-identical across doors (`self-emit-equiv`, `dump-parity`); if it did not, this is where the carve-out's tests would go
- [x] 5.6 `test/modules/` — confirm a *user* library gets the same treatment, not just `(scheme base)`
- [x] 5.7 `make regen` reconverges (verified idempotent: a second regen reproduces bootstrap/*.ll byte-for-byte) and `test/trust-check.sh` passes -- **trust-check runs on the commit**: it skips while `bootstrap/` is dirty by design, so it must be re-run once these artifacts are committed; expect a large but mechanical IR diff from the label rename
- [x] 5.8 `./run-all-tests.sh` and `./run-dev-tests.sh` both green

## 6. Close-out

- [x] 6.1 Update `docs/PERFORMANCE.md` P5: tick the cross-unit half, record the measured result, and correct the linkage claim (task 2.4)
- [x] 6.2 Update `docs/PIPELINE.md` and `docs/MODULES.md` for the export-table format and the direct-call lowering
- [x] 6.3 Record in the design what D4 actually resolved to, and what the immutability argument depends on — so a future library-reload feature knows it must revisit this
