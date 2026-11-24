# Performance evaluation

A useful investigation explains which operation costs time, memory, or bytes,
tests that explanation in generated code, and compares alternatives using the
same work. A smaller IR file, fewer calls, and lower RSS are observations with
different meanings; none alone establishes faster execution or fewer allocations.

Use the [report template](PERFORMANCE-REPORT-TEMPLATE.md) to record a claim before
experimenting. The [writer investigation](performance/writer-report.md) is the
worked example with executable fixtures. The [P9 walkthrough](performance/p9-walkthrough.md)
shows how to retain a negative result when an attractive code change does not
improve measured speed. The repository's `evaluate-performance` agent skill uses
this document; the process and tools also work without an agent.

## Establish the claim and the oracle

Name the user-visible operation, source revision, input size, compilation path,
execution path, and metric that prompted the investigation. State what counts as
correct output before changing the implementation. Preserve the actual input as
a versioned fixture with its hash, seed, iteration count, and expected result or
digest. Construct repeat-loop inputs outside the measured region unless input
construction is the operation being investigated.

Distinguish a suspected cause from an observation. For example, a release that
changes tensor representation and printing together does not isolate writer
cost. A time increase measured for `emit run` includes work that a delivered
executable may not perform. Record compilation, startup, guest execution, and
output separately where they contribute to the claim, and keep a clearly named
end-to-end measurement as well.

## Make both sides reconstructable

Record full revisions, dirty source inputs or their preserved patch, fixture and
binary hashes, build commands, optimization and LTO flags, platform/architecture,
compiler/linker/libgc versions, and cache state. Identify the source fingerprint
and bootstrap relationship when compiler inputs matter. An existing executable
whose producing source is unknown can supply exploratory evidence; label that
limit and rebuild verified baselines before acceptance.

Use isolated source snapshots and build directories. Keep the toolchain and
equivalent work fixed. Linking identical compatible program IR against different
runtimes is useful for runtime attribution, but do not cross an incompatible ABI
or descriptor layout. A historical runtime without custom writer support is an
ordinary-print control, not a valid active-writer baseline.

The report must include commands that reconstruct its inputs. A temporary
directory name or the assertion that a benchmark once existed is insufficient.

## Choose controls before optimization

Pick the smallest workload that exposes the suspected mechanism, then add
controls that can disprove the explanation. Include the ordinary path when
investigating optional behavior, cases that exercise the behavior, and an
application workload that establishes the practical denominator.

For writers the fixture matrix covers:

| Control | Purpose |
|---|---|
| Atoms and opaque records | Preserve the allocation-free traversal path |
| Repeated small lists and vectors | Expose per-print context/table allocation |
| Larger in-bound graphs | Expose capacity growth and amortization |
| Oversized graph followed by a small graph | Expose retained-memory and cleanup costs |
| Shared and cyclic graphs | Preserve the distinct writer label contracts |
| Unrelated registration and writer removal | Separate registration from callback invocation |
| Flat and nested callbacks | Attribute invocation, recursive-rendering, and depth costs |
| Explicit and borrowed destinations | Preserve port identity and callback lifetime |
| Fixed Malt core and seeded XOR | Bound application timing and delivered-size effects |

Exercise all four modes on representative inputs. Use a fixed sink and constant
output byte count within each comparison. A null-device sink measures formatting
without terminal speed; bounded string-port cases cover memory destinations.
Avoid an unbounded output buffer that turns a printer benchmark into a buffer
growth benchmark. Verify the bytes using a separate correctness run or bounded
capture, then time the unchanged work with the declared sink.

## Measure mechanisms and execution separately

Use instrumented builds for allocation counts, requested bytes, graph capacity,
and lifecycle invariants. Cross-check collector totals, but label their scope:
collector totals include unrelated Scheme/runtime allocation. Use production
builds without counters for acceptance timing. Resident memory is a process
observation, not an allocation counter or proof that objects became unreachable.

Preserve individual samples and their order. Calibrate on the baseline, keep
batch sizes fixed between sides, warm both sides, and alternate paired samples.
Reverse the starting side between independent sessions. Record median, spread,
and paired deltas; do not report only the best run. Document concurrent work,
thermal or scheduling disturbances, and timer resolution. A 0.01-second timer
cannot establish an improvement smaller than the noise at that scale.

The writer change declares these local acceptance settings before candidate
timing: at least ten alternating pairs per session, two independent sessions,
baseline batches of at least 0.5 seconds, at least 5% improvement in the primary
small-compound workload in each session, and no repeatable regression above 5%
in atomic, representative callback, and XOR controls. It also checks deterministic
allocation, bounded retention, and an ordinary executable growth budget of 1 KiB.
Those are this change's declared gates, not universal thresholds for every issue.
If a gate fails, investigate and explicitly revise the plan rather than silently
changing the threshold after seeing the result.

Timing tools must reject failed children, output mismatches, missing tools, and
incomplete pairs. Unavailable metrics stay explicitly unavailable. Keep reporting
and sample selection deterministic, and test those mechanics with synthetic
results. Do not make unstable wall-clock thresholds mandatory CI gates.

## Follow the operation into generated code

For each candidate, write a prediction before running it: which allocation,
check, lookup, dispatch, spill, or retained dependency should disappear; which
workload should change; and which controls should remain stable.

Trace the relevant source operation through the compiler's existing dumps and
emitted LLVM. Inspect optimized LLVM with the actual profile and then final
machine code and retained symbols. Record whether an allocation or call survives
the final link, not just whether it appears in emitted IR. Keep annotated excerpts
and exact extraction commands with the report rather than dumping every module
into prose. Large raw files may remain in the reproducible evidence directory;
preserve their hashes and the commands needed to regenerate them.

Use the actual execution path. AOT `-O2 -flto` can remove boundaries that a
per-module development JIT cannot. Runtime-only compilation can reveal a mechanism
but is not the final linked program. For build-time claims, record emission,
optimization, linking, and cache costs rather than treating them as guest execution.

P9 provides a useful counterexample: the compiler removed 97 indirect-call sites,
yet the measured median remained 0.40 seconds. The next experiment needed to
inspect the callee prologue, not announce a speedup from the IR change.

## Compare alternatives and decide

Keep a candidate table with prediction, changed mechanism, correctness result,
timing/allocation/size effects, complexity cost, and decision. Prefer focused
experiments so one change does not obscure another. An alternative that fails to
improve its target still contributes evidence; retain the result and rejection
rationale. State separately whether a result is accepted, rejected, or inconclusive.

Measure retained memory and lifecycle costs when introducing reuse or caches.
For printer storage, inactive graph keys and destinations must be cleared, nested
traversals must remain independent, and expired callback handles must never become
valid during a later invocation. Reusing internal storage and reusing a capability
with an escaped identity have different correctness obligations.

Accept only against the predeclared criteria and correctness oracle. Report limits
on platform, input, profile, and measurement resolution. A microbenchmark gain does
not imply the same percentage application gain; use application controls to show
its practical effect or lack of one. A code improvement with inconclusive timing
must not be described as a measured speedup.

## Validate the resulting change

Choose validation from the changed inputs using the existing test classifier and
project build instructions. Runtime-only work requires native rebuilds and its
classified suites; compiler assembly edits require the explicit regeneration
barrier and subsequent source/native/reference checks. Performance evidence does
not replace semantic regression tests or source verification.

Keep deterministic resource checks in ordinary regression coverage. Keep expensive
sampling opt-in, with narration on stderr and machine data on stdout or in the named
report directory, following [OUTPUT.md](OUTPUT.md). Preserve raw samples, manifests,
accepted/rejected decisions, and a concise checked-in report. Deferred speed,
memory, or size work belongs in [PERFORMANCE.md](PERFORMANCE.md); newly discovered
correctness defects follow the repository's issue policy.

## Writer commands

The writer fixtures and build modes are documented in
[`test/performance/README.md`](../test/performance/README.md). Inspect the runner's
arguments with:

```sh
python3 tools/performance-measure.py --help
```

Build the isolated harnesses and provenance manifests with the reconstruction
tool described by that README, then run a representative comparison:

```sh
EMIT_PACKAGES_DIR=../emit-packages python3 tools/writer-performance-build.py --output build/writer-performance
build/writer-performance/bench-released --workload small-list --verify
build/writer-performance/bench-candidate --workload small-list --verify
python3 tools/performance-measure.py \
  --before build/writer-performance/bench-released \
  --after build/writer-performance/bench-candidate \
  --before-metadata build/writer-performance/released-metadata.json \
  --after-metadata build/writer-performance/candidate-metadata.json \
  --fixture test/performance/writer-bench.c \
  --arg=--workload --arg=small-list \
  --arg=--iterations --arg='{iterations}' \
  --metric-field cpu_seconds \
  --oracle-field output_digest --oracle-field output_bytes \
  --pairs 10 --warmups 1 --min-seconds 0.5 --start before \
  --report build/writer-performance/session-1.json
```

The reconstruction tool builds the named executables and metadata; the measurement
runner only consumes them. Use absolute paths when invoking it outside the repository. Each
metadata JSON object supplies `source_revision`, `dirty_inputs`, `build_commands`,
`toolchain`, `compiler_options`, `linker_options`, `execution_path`, and `cache_state`.
Record concrete values and preserved dirty-input hashes/patches; the runner marks
omitted provenance fields unavailable. `--fixture` is repeatable for every input
whose identity matters. The harness validates its render against independent
expected bytes before each timed batch, while the runner also checks agreement
on the stable digest and byte-count fields. A report using only before/after
agreement still needs a separately stated independent correctness oracle.

`cpu_seconds` is the harness's timed region. The runner retains process CPU,
process wall time, peak resident memory, and the entire harness JSON separately.
Calibration scales the literal `{iterations}` argument using baseline results,
then freezes the count for both sides. To repeat the final comparison in another
session, use the same command with `--start after` and a different `--report` path,
with no concurrent build or validation work. A deliberate smoke run can use
`--min-seconds 0 --pairs 1`; label it as a smoke run, not acceptance timing.

For a plain application executable such as seeded XOR, omit the harness arguments,
`--metric-field`, and `--oracle-field`. The runner then measures process CPU and
compares stdout hashes; pass `--expected-output` with the committed expected bytes
when appropriate. Process measurements include startup and output, so do not label
them as the training loop alone. For a JSON fixture with an independent field
oracle, `--expected-oracle` accepts a JSON mapping for the selected oracle fields.

The runner always emits a machine-readable report on stdout and also retains it
at `--report` when supplied. It records failed runs with an error status and exits
non-zero; check the exit status and report status before using any samples.
`--quiet` or `EMIT_VERBOSITY=quiet` suppresses narration, and `--verbose` exposes
per-child execution details. These controls leave report data unchanged except
for naturally varying measured values.

The worked report names the exact baseline revisions, commands, output oracles,
settings, and evidence files used for acceptance. Follow its reconstruction recipe
when repeating the writer comparison; use the template when applying this process
to a different issue.
