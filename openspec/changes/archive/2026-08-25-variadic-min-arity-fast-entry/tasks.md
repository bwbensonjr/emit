## 1. Preserve the Baseline

- [x] 1.1 Build P9's checked-in `number-to-string-benchmark.scm` and manifest with the current
  compiler before any compiler-source edit, preserve the executable plus program/library IR outside
  the build tree, and verify it prints `19888890`.
- [x] 1.2 Warm the preserved executable once, collect at least ten elapsed-time samples with the
  command and environment recorded in `measurements.md`, and verify the recorded median and best are
  computed from the raw samples rather than the warm-up.
- [x] 1.3 Capture baseline byte sizes for the benchmark executable and its emitted IR plus the
  existing 80-demo module scaffold, and verify every measured path and byte count is recorded in
  `measurements.md`.

## 2. Build the Source-Driver Prototype

- [x] 2.1 Add a deterministic minimum-entry label and make the source emitter produce a second
  same-signature definition for a variadic body that binds rest to `()` without an arity check,
  positional spill, or `rt_build_rest`; verify focused emitted IR contains both the unchanged
  ordinary entry and the stripped prototype entry.
- [x] 2.2 Carry minimum/rest shape through the prototype's known-callee descriptors and select the
  derived label only for statically known exact-minimum calls, using a temporary same-build
  derivation for the cross-unit benchmark; verify exact-minimum calls select it while above-minimum,
  too-few, `apply`, and value-position calls keep their existing paths.
- [x] 2.3 Exercise required arguments, empty and non-empty rest lists, a captured environment, an
  exact-minimum self tail call, and argument counts above the positional-slot width through
  `chez --libdirs src --script src/compile.ss`; verify values match the ordinary path and the tail
  call remains `musttail` and bounded-stack.
- [x] 2.4 Run the relevant direct-call, assigned-library, tree-shaking, and source-driver focused
  checks without regeneration, and verify the prototype introduces no failure before timing it.

## 3. Apply the Prototype Gate

- [x] 3.1 Build the prototype P9 executable through the source driver, verify it prints `19888890`,
  and inspect its program IR to confirm `number->string` targets the minimum entry and that entry
  contains neither `rt_build_rest` nor the generic variadic spill.
- [x] 3.2 After one explicit warm-up per executable, run at least ten alternating preserved-before
  and prototype-after pairs, record every raw sample and artifact size in `measurements.md`, and
  verify the median delta calculation against the 5% gate.
- [x] 3.3 Record an explicit PASS or NO-GO decision. On NO-GO, reverse all prototype compiler/test
  edits with scoped patches, verify the affected source files match their baseline contents, update
  P9 with the measured result, mark Sections 4–7 not applicable, and finish without `make regen`; on
  PASS, verify the retained prototype still has at least a 5% median improvement and continue.

## 4. Turn a Passing Prototype into the Production Path

- [x] 4.1 Extend variadic unit-procedure and export call rows with an optional explicit fast label,
  keeping fixed rows byte-identical and accepting existing four-field variadic rows as ordinary-only;
  verify artifact-cache/core tests cover all three shapes and reject malformed rows.
- [x] 4.2 Replace the prototype's blind imported-label derivation with the explicit optional field
  and complete self, intra-unit known, and imported known-call selection; verify exact-minimum calls
  use the fast label, above-minimum calls use the ordinary label, and old artifacts never name an
  undefined fast entry.
- [x] 4.3 Keep the closure code pointer on the checked ordinary entry and pass that closure as `self`
  to the fast entry; verify capturing procedures return identical values through direct, indirect,
  and `apply` calls.
- [x] 4.4 Preserve the defining-unit assignment filter for the whole call row and extend assigned
  variadic coverage; verify an assigned export advertises neither label and all importing calls stay
  indirect.
- [x] 4.5 Extend external-label discovery and tree-shaking for the closure/fast-label pair, and verify
  a program whose sole imported use is an exact-minimum call retains the fast body, its closure and
  captures, and every reachable dependency without retaining unrelated bindings.
- [x] 4.6 Add focused IR and behavior coverage for non-tail and `musttail` fast calls, ordinary calls
  with rest arguments including overflow, too-few arity errors, first-class calls, `apply`, old
  variadic rows, and fixed-row byte identity; verify the focused suites pass under the source driver.
- [x] 4.7 Replace suffix-derived fast labels with a reversible encoding in a disjoint generated
  namespace, add a library fixture containing variadic `foo` beside ordinary `foo.min`, and verify
  its LLVM labels are distinct and the library compiles, links, and calls both definitions correctly.

## 5. Re-measure the Final Representation

- [x] 5.1 Rebuild the final source-driver benchmark and repeat at least ten alternating pairs against
  the same preserved baseline; verify the final median still improves by at least 5% and record raw
  samples, medians, bests, and result parity in `measurements.md`.
- [x] 5.2 Capture the final benchmark executable/IR sizes and the 80-demo module-scaffold deltas,
  reporting how many files changed, their aggregate byte delta, and the ordinary/fast call-site
  counts; verify the size accounting reconciles with the captured files.
- [x] 5.3 If the final representation misses the speed gate, take the Section 3 NO-GO path and skip
  Sections 6–7; otherwise record why the measured speed/size trade-off is acceptable and verify all
  compiler-source edits are final before crossing the regeneration barrier.

## 6. Regenerate, Document, and Verify a Retained Change

- [x] 6.1 Update `docs/PERFORMANCE.md` P9 and the relevant module, pipeline, and LLVM/calling-convention
  documentation with the retained entry shape, compatibility boundary, raw measurement summary, and
  size trade-off; verify no documentation still says every exact-minimum variadic call enters
  `rt_build_rest`.
- [x] 6.2 Run all affected source-driver and focused suites one final time, inspect the compiler-source
  diff, and verify no compiler-source edit remains before starting `make regen`.
- [x] 6.3 Run `make regen` to convergence and verify the bootstrap artifacts reach one fixed point;
  make no further compiler-source edits until both full test collections finish.
- [x] 6.4 Run the direct-call, assigned-library, AOT tree-shaking, module-scaffold, backend/parity,
  self-emission, and dump-focused suites against the regenerated compiler and verify every suite
  passes.
- [x] 6.5 Run `./run-all-tests.sh` and `./run-dev-tests.sh` individually, verify both complete with no
  failures, and record durations and any expected trust-check skip in `measurements.md`.
- [x] 6.6 Rebuild and remeasure the P9 executable with the regenerated compiler, verify the retained
  result still clears the 5% median gate, and record the confirmation samples and sizes.

## 7. Validate the Change

- [x] 7.1 Run `openspec validate variadic-min-arity-fast-entry --strict` and `git diff --check`, and
  verify both pass with every applicable task and measurement filled in.
- [x] 7.2 Review the final diff for unrelated edits, confirm bootstrap changes correspond to the
  converged compiler sources when the gate passed (or are absent on NO-GO), and verify the change is
  ready for review and later archival.
