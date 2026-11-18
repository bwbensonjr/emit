# Tasks

## 1. Reproducible measurements and baseline evidence

- [x] 1.1 Add versioned `test/performance/` fixtures for atomic/opaque output, small and large compound graphs, cyclic/shared graphs, unrelated registration and removal, and flat/nested custom writers with explicit/borrowed destinations. Verify expected bytes or digests and keep graph construction outside repeat loops.
- [x] 1.2 Add an opt-in measurement runner under `tools/` that accepts isolated baseline/candidate builds and records full provenance, calibration, alternating raw samples, CPU/wall timing, and binary sizes. Verify report statistics, failed child/output mismatch/incomplete-pair handling, and `docs/OUTPUT.md` stream/verbosity behavior with focused runner tests.
- [x] 1.3 Add benchmark-only printer allocation/lifecycle instrumentation and a C harness without exposing new Scheme primitives or shipping counter overhead. Verify it observes the released implementation's compound allocations, atom bypass, table growth, and distinction between printer counters and total collector allocation; document instrumented versus production builds beside the fixtures.
- [x] 1.4 Begin `docs/PERFORMANCE-EVALUATION.md` and a reusable report template with the fixture/runner reproduction commands and declared acceptance settings. Rebuild isolated pre-writer and released-writer baselines, verify fixture compatibility and correctness, and retain baseline manifests/samples without depending on old temporary binaries.
- [x] 1.5 Capture baseline source/dump mappings, emitted and optimized LLVM, and relevant final disassembly/symbols for ordinary printing and the writer adapter. Verify the report distinguishes runtime-only optimization, final AOT LTO, and development-path evidence and does not attribute combined Malt costs to writers.

## 2. Ordinary traversal reuse and lifecycle correctness

- [x] 2.1 Implement stable-address outermost traversal reuse in `src/runtime/runtime.c`, preserving independent nested contexts and the atomic bypass. Add resource regressions proving zero warmed bookkeeping allocations for in-bound outermost graphs that invoke no custom writers, including unrelated registrations and removals, and no discovery table for simple writing; document the initial 128-slot and retained 4,096-slot policy.
- [x] 2.2 Implement bounded table retention and normal/unwind cleanup of keys, destinations, and context links. Verify C-level growth, oversize release, inactive root clearing, label reset, and generation-wrap cases, including small-after-large printing, while live tables remain GC-visible.
- [x] 2.3 Extend `test/custom-writers.scm` and its existing harness for saved handles used during a later active same-depth callback, nested growth with outer labels, and raise/trap/supported escape after growth. Verify recovery, expiry, allocation during rendering, modes, destinations, and output across the existing native and source-driver paths; update assertion counts and coverage records as needed.
- [x] 2.4 Rebuild the native host and run the relevant registered writer, cyclic-datum, printer recovery, and port suites, plus classifier-selected checks. Verify ordinary byte output remains unchanged and record the local results and reuse/lifetime rationale in the writer worked example as this group lands.

## 3. Compare active-writer alternatives and accept measured results

- [x] 3.1 Evaluate caching the four writer mode symbols as a separate candidate against the released-writer and reuse-only builds. Preserve symbol identity and initialization/error semantics, inspect optimized/final code, and record timing/allocation/size results; retain the change only when evidence justifies it, otherwise retain the rejection rationale.
- [x] 3.2 Measure nested traversal and adapter/cycle-tracking costs. Compare at least the chosen simple design with the applicable alternative identified by those measurements, or document why additional machinery is rejected; verify every candidate has a prior prediction and equivalent-work correctness check. Do not change compiler inputs solely because a bridge appears in unoptimized IR.
- [x] 3.3 Run the final uninstrumented comparison in two independent sessions of at least ten alternating pairs after warm-up, using baseline-calibrated batches and fixed iterations. Verify the design's primary 5% improvement target, control regression limits, allocation invariants, retention bound, and size budget; retain raw samples and explicitly investigate any failed or inconclusive gate before marking this task complete.
- [x] 3.4 Rebuild the fixed Malt core and seeded XOR controls and verify their existing numerical results, sizes, and timing limits. Complete the checked-in writer report with reproduction commands, provenance, code evidence, accepted/rejected candidates, and limitations; update P25 to reference the evidence while retaining unresolved tensor-related debt.

## 4. Reusable evaluation process and agent skill

- [x] 4.1 Complete the shared process and report template using the writer investigation: claim/oracle, provenance, controls, measurements, generated-code inspection, falsifiable predictions, alternative decisions, validation, and uncertainty. Verify a maintainer can follow the documented commands to reproduce a representative comparison without an agent.
- [x] 4.2 Use the skill-creator workflow to create `.agents/skills/evaluate-performance/SKILL.md` as a thin entry to the shared documentation/template. Validate the skill and verify it respects selected planning/exploration boundaries, project validation, and existing authorization rather than adding independent permission rules.
- [x] 4.3 Exercise the process/template and skill instructions against P9's documented null-speedup result, without claiming a fresh historical rerun. Verify the resulting walkthrough separates removed calls from measured benefit and records missing provenance; incorporate any process corrections and link both examples from the documentation.

## 5. Integration and release preparation

- [x] 5.1 Run the change classifier against the recorded base and complete its native/runtime/library/tooling obligations, including relevant writer source-driver reference coverage. If compiler assembly inputs changed, finish and format those edits, run explicit `make regen`, full native, source units, classified reference suites, and source consistency; retain reports and verify no compiler edits occurred between regeneration and its validation.
- [x] 5.2 Run `make format-check` for covered Scheme changes and verify benchmark tooling does not add mandatory timing gates or production instrumentation. Reconcile test coverage inventory, source/generated artifact changes, documentation commands, and the report's actual platform limits.
- [x] 5.3 Bump the current patch version once and add a matching nonempty changelog section for the accepted runtime fix; verify SemVer and changed-input checks against the final diff. Do not bump for this planning-only stage.
- [x] 5.4 Validate the completed change artifacts with `openspec validate improve-writer-performance --strict`, confirm every acceptance criterion has evidence or an explicitly reviewed plan revision, and verify all tracked tasks are genuinely complete before the finish workflow.

## Workflow follow-up

- Use `emit-finish-change` to sync specs, archive the completed change, run release preflight, and prepare one reviewable pull request. These steps follow implementation and are outside tracked completion tasks.
- Do not merge automatically. A reviewed versioned PR merge is the project's release approval; follow its release only when that workflow is invoked.
