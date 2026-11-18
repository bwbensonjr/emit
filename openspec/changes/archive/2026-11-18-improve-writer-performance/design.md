# Design

## Context

See proposal.md for motivation and the two delta specifications for contracts. The exploration identified these distinct facts:

- `src/runtime/runtime.c:3173-3194` bypasses traversal allocation for atoms and opaque records, but allocates an 80-byte context and a 128-slot, 3,072-byte table for each ordinary compound print on the inspected arm64 layout. Table growth starts over each time. Before `8c69a18`, graph tables reused storage and generations. Same-options optimized runtime LLVM confirms the new allocations survive optimization; this does not quantify their timing contribution.
- `print_custom_record` additionally allocates a 56-byte invocation token, may copy a borrowed port, interns a mode, and calls the registering module's bridge. The adapter in `lib/emit/write.sld` allocates the recursive-rendering closure; retained emitted IR confirms that allocation, but final optimization must also be inspected.
- `rt_print_restore` participates in trap and continuation recovery. Traversal contexts cannot leave references to abandoned C stack frames. The existing 61-assertion custom-writer fixture covers nested labels, modes, failures, escapes, borrowed ports, and port-table growth across source, JIT, standalone, and artifact paths.
- `docs/MALT-MEASUREMENTS.md` combines writer support with tensor representation changes. Its 6.2% XOR CPU increase is not writer attribution. Seven alternating retained-binary pairs in the exploration measured 0.765155 versus 0.794897 seconds CPU (3.89%), with identical output; those binaries were not freshly rebuilt/source-verified. These are preliminary observations, not acceptance evidence.
- Ordinary demo IR changed only by added declarations/bridges in the prior scaffold proof. Their presence in unoptimized IR does not establish retained executable size or execution cost.

## Goals / Non-Goals

**Goals:** Make the ordinary path cheap without relying on a global absence-of-writers shortcut; retain independent nested traversals; measure callback-specific costs; produce an investigation process other maintainers and agents can repeat.

**Non-Goals:** Beyond proposal.md, do not pool escapable callback identities, assume C stack storage survives longjmp, or replace safe stable-address port slots merely to remove an indirection. Avoid public profiling primitives, new runtime dependencies, and permanent benchmark counters on the shipped hot path.

## Decisions

### 1. Separate historical attribution from candidate evaluation

Use three named source baselines: the pre-writer parent of `8c69a18`, the released writer implementation, and the candidate. Resolve and record full commit ids and all dirty inputs when running. Build isolated snapshots with the same toolchain. Historical ordinary-print controls can link identical compatible program IR against the two runtime versions to isolate runtime effects. Do not link new writer calls against the old runtime or silently mix incompatible descriptors/artifacts. Use the released writer implementation for active-writer candidate comparisons.

Commit fixtures under `test/performance/` and a small opt-in runner under `tools/`. Capture fixture hashes, complete build commands, optimization/LTO settings, source fingerprints where relevant, binary hashes, and machine/toolchain metadata. Store machine-readable samples and generated-code evidence under an explicitly selected report directory. Check in a concise report and enough raw evidence to reproduce conclusions; temporary paths alone are not durable evidence.

The runner reuses narration conventions in `docs/OUTPUT.md`: actions and metrics on stderr, machine-readable samples on stdout or in the named artifact. Invalid workloads, missing tools, failed children, output mismatches, and incomplete pairs fail visibly. Test those failure cases and the report statistics, not timer fluctuations.

### 2. Use controls that distinguish absence, non-use, and use of writers

| Workload | Question |
|---|---|
| Atomic strings/numbers and opaque records | Does the existing cheap path stay cheap? |
| Repeated small acyclic lists/vectors | Is repeated bookkeeping allocation removed? |
| Repeated larger lists/vectors within retained bound | Is capacity growth amortized? |
| Oversized graph followed by small graphs | Is retained memory bounded and state reset? |
| Cyclic and shared graphs | Are label semantics preserved at comparable cost? |
| Unrelated registered writer; register/remove transitions | Does ordinary performance depend incorrectly on global registration? |
| Flat custom writer with atomic and compound children | What do invocation, adapter, and child traversals cost? |
| Nested custom writers, explicit and borrowed ports | What do depth, lifetimes, and cycle tracking cost? |
| Seeded XOR and fixed Malt core | Does the printer change affect real applications or retained size? |

Exercise all four print modes across representative fixtures. Construct input graphs outside timed repeat loops. Hold iterations and emitted bytes constant within each comparison, verify expected bytes or a stable digest, and reuse a destination. Use a fixed file sink with output sent to the platform null device for throughput, plus bounded string-port cases to exercise memory destinations without letting output-buffer growth dominate. Exclude graph construction, file opening, compilation, and startup from an explicitly labelled in-process timing region; also retain end-to-end process timings.

Use at least ten alternating pairs after warm-up, reversing the first side between sessions, with timed batches calibrated on the baseline to at least 0.5 seconds. Run two independent sessions without concurrent regeneration or suites for final timing evidence. Keep calibration and iteration counts fixed between sides. Record median, min/max, paired deltas, wall and CPU times; include allocations/bytes, collection activity, retained capacity, and executable size. Use a benchmark-only C harness/instrumented runtime build to observe printer allocation sites and lifecycle state, cross-checked with collector totals; time uninstrumented production builds separately. Collector totals include unrelated allocation and must not be presented as printer-only counts. RSS is not allocation volume.

### 3. Start with one reusable outermost traversal

Retain one stable-address outermost traversal context and reusable graph table. Nested traversals continue to acquire independent GC-visible contexts/tables. This removes the pervasive cost while retaining the current nested control flow and unwind model. The outermost context is installed in the same active chain as a new context, so encountering a custom record at any depth still works. Do not add a prepass invoking callbacks or select behavior using only whether any writer has ever been registered.

Start with 128 slots, retaining grown outermost capacity up to 4,096 slots (96 KiB of table storage on the inspected layout). Larger transient tables are released on traversal completion, returning to a bounded retained table. This bound is a documented engineering default, not an ABI. Report actual bytes on the target layout. Repeated graphs exceeding the bound may allocate; benchmark that trade-off explicitly. Nested storage is not cached in the first implementation.

On normal completion and supported unwind, detach the context and clear inactive references to graph keys, destination, port, parent context, and writer marks. Keep live graph storage scanned/rooted while callbacks can allocate or mutate data. Reset labels, counts, flags, used slots, and generation state correctly; handle generation wrap explicitly. Begin with straightforward cleanup and measure its cost. Add occupied-slot tracking only if clearing bounded capacity is demonstrated to dominate.

Alternatives: a context pool by nesting depth could accelerate nested callbacks, but adds retention and lifecycle complexity; evaluate only if nested measurements justify it. Stack contexts simplify normal return but are rejected because host recovery can outlive their frames. Reverting to a single global graph table is rejected because nested printing needs independent labels. Reusable unscanned graph storage is not an acceptable shortcut without a separate GC-liveness proof.

### 4. Separate reusable storage from callback capabilities

Keep invocation tokens uniquely allocated with their current expiry semantics; a saved token must not become active again when later printing reuses traversal storage. Borrowed ports remain tied to the invocation, explicit ports retain identity, and restoration invalidates tokens before releasing traversal references. Preserve catchable errors, supported nonlocal exits, active-record cycle detection, and partial output.

Extend the existing semantic fixture rather than duplicate it: reuse after graph growth; nested growth while outer labels are live; raise/trap/escape after growth; saved handles used while a later same-depth callback is active; allocation/collection during rendering; and register/remove transitions. Add focused C-level resource checks for warm allocation counts, cleanup, capacity bounds, and generation wrap where Scheme cannot directly observe the invariant.

### 5. Inspect and compare generated code before broadening optimization

For each candidate, write down its predicted affected allocation/call and workloads. Preserve source-to-lowered-form/LLVM mappings using existing dumps and emitted IR, inspect same-options optimized LLVM, and inspect final disassembly and retained symbols. For AOT use the shipped `-O2 -flto` profile; for `emit run`/REPL include the development default and targeted O0/O2 checks, since per-module optimization can differ from LTO. Record when evidence comes from the runtime-only compilation rather than the final linked executable.

After outermost reuse, evaluate at least one focused active-writer alternative, initially caching the four interned mode symbols. Preserve identity and initialization behavior. Compare a depth pool or adapter/cycle-tracking changes only if profiles justify them. Unconditional bridge emission is a build/JIT/size hypothesis, not a reason to change the compiler without measurements. Reject changes that add complexity for an inconclusive benefit and retain the negative result.

Acceptance defaults, declared before candidate timing:

- Deterministic resource checks show zero new traversal bookkeeping allocations after warm-up for atomic/opaque values and outermost ordinary graphs within retained capacity that invoke no custom writers, including unrelated registrations; simple writing allocates no discovery table. Independent nested traversals remain outside the reuse guarantee.
- The repeated small compound primary workload improves median CPU throughput by at least 5% against the released writer baseline in both final sessions. Ordinary behavior relative to the pre-writer baseline is reported, not assumed equivalent.
- Atomic, representative active-writer, and seeded XOR controls have no repeatable median CPU regression above 5%. A noisy or failed gate requires investigation and a documented plan revision; do not silently relax it or call inconclusive timing success.
- Ordinary no-Malt executable size grows by no more than 1 KiB; all size changes and the bounded table retention trade-off are reported. Optional writer dependencies remain optional.
- All semantic and changed-input validation gates pass. No absolute timing assertion enters normal CI; CI checks deterministic allocation/lifecycle properties and correctness.

### 6. Make the process durable and agent-independent

Add `docs/PERFORMANCE-EVALUATION.md` and a reusable report template, linking the fixture/runner commands and the writer worked example. The report contains claim and oracle, provenance, workload matrix, raw samples, generated-code evidence, hypothesis and candidate table, acceptance decisions, rejected alternatives, limits, and reproduction instructions.

Implement a thin `.agents/skills/evaluate-performance/SKILL.md` using the skill-creator workflow during apply. It references the shared process/template and records hypotheses before experiments; it must not duplicate release policy, authorize external actions, or bypass an explicitly selected exploration/planning boundary. Check the instructions against a second documented case such as P9's removed-call/null-speedup result. Generic evidence and runner mechanics stay usable without the skill.

Update P25 only from isolated evidence, retaining tensor traversal/representation debt that this change does not address. Newly found correctness defects follow the issue policy; deferred speed/memory/size work remains in `docs/PERFORMANCE.md`.

## Risks / Trade-offs

- Cached graph keys can retain entire heaps: clear inactive roots on normal and abnormal exits and inspect retained state after growth.
- Bounded cleanup may replace allocation with excessive scanning: measure small-after-large workloads and compare simpler cleanup with occupied-slot tracking if necessary.
- Context reuse can revive stale handles or corrupt nested labels: reuse only internal traversal storage and extend lifecycle regressions.
- Microbenchmarks can overstate application benefit: pair them with atomic controls, active callbacks, and Malt workloads; never infer XOR causality from printing alone.
- Instrumentation can perturb timings: use it for mechanism evidence and use separate production builds for acceptance timing.
- Optimizer behavior varies by host: retain AOT and development-path evidence, and describe platform limits rather than extrapolate unsupported speedups.

## Migration Plan

1. Add fixtures, instrumentation, and reproducible baseline evidence before runtime optimization. Record acceptance settings before candidate runs.
2. Implement outermost reuse, then evaluate focused active-writer alternatives independently. Keep compiler inputs unchanged unless evidence justifies expanding the implementation.
3. Run the change classifier and required native/runtime/tool checks. Preserve the custom-writer source-driver reference coverage. If compiler/partition/assembly inputs change, finish them, format, explicitly regenerate, then run full native, source units, classified reference suites, and source consistency without intervening compiler edits.
4. Complete documentation, worked example, and skill validation; bump the current patch version once with a matching changelog section. The expected bump from today's 0.9.0 is 0.9.1, rebased to the actual version at implementation time.
5. Finish through `emit-finish-change` for spec sync, archive, preflight, and a reviewable PR. No merge is part of this plan. Roll back runtime and any generated/compiler artifacts together if validation fails; retain investigation evidence independently.
