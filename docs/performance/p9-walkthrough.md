# P9 walkthrough: fewer indirect calls, unchanged timing

This is a retrospective application of the
[performance evaluation process](../PERFORMANCE-EVALUATION.md) and
[report template](../PERFORMANCE-REPORT-TEMPLATE.md) to the P9 record in
[`docs/PERFORMANCE.md`](../PERFORMANCE.md#p9--an-optional-argument-costs-every-call-site-its-cross-unit-direct-call).
It does not claim a fresh historical build or benchmark execution. The sources are
the checked-in P9 narrative, the initial [archived measurements](../../openspec/changes/archive/2026-08-24-cross-unit-variadic-direct-calls/measurements.md),
and the follow-up [archived measurements](../../openspec/changes/archive/2026-08-25-variadic-min-arity-fast-entry/measurements.md).

## Claim and oracle

Adding an optional parameter made calls to a prelude export use an indirect
closure call rather than its cross-unit code label. The initial hypothesis was
that restoring direct calls would recover the observed execution regression.
The archived [benchmark fixture](../../openspec/changes/archive/2026-08-24-cross-unit-variadic-direct-calls/number-to-string-benchmark.scm)
performs 3,000,000 one-argument `number->string` calls and prints `19888890`.
It is selected through an archived [manifest](../../openspec/changes/archive/2026-08-24-cross-unit-variadic-direct-calls/benchmark-manifest.scm).
The narrative's `demos/exact-range.scm` demonstrates the original call-shape
change; it is distinct from the timed repeat-loop fixture.

## Provenance limits

P9 names `cross-unit-variadic-direct-calls` (archived 2026-08-24) and the later
`variadic-min-arity-fast-entry` change. The initial measurements preserve the
fixture, output, grouped elapsed samples, code-shape counts, and the use of
`/usr/bin/time -p` with stdout discarded. They name temporary baseline artifacts,
but do not identify their full producing source revisions, hashes, or complete
machine/toolchain metadata.

The follow-up record adds Apple arm64/macOS 26.5.2, Apple clang 21.0.0, compiler
and baseline executable hashes, a baseline build command, raw sample tables, and
validation results. Those values belong to the follow-up and must not silently
fill missing provenance for the initial null-result binaries. This walkthrough
does not reconstruct either historical build or independently verify a retained
binary's hash. Exact hardware model, cache state, and an end-to-end reconstruction
of the initial comparison remain unavailable from the cited evidence.

Consequently this is an example of interpreting the historical result accurately,
not a reproducible new acceptance report. A new experiment must rebuild verified
baselines and preserve the missing provenance before claiming a fresh comparison.

## Predicted mechanism and observed code

The first candidate published minimum-arity/rest metadata for immutable variadic
exports so compatible imported calls could use the direct-call ABI. It removed
the callable check and code-pointer load chain while still passing the closure as
`self`. The recorded 80-demo capture changed 97 call sites in 40 demos, reduced
those files by 7,772 bytes total, and left the other 40 byte-identical.

That is evidence for a code-generation change. It does not by itself establish
that this overhead dominated the timed workload, nor that the changed calls
retained equivalent cost after final optimization on every execution path.

## Recorded measurements and decision

The six alternating before/after pairs had these recorded summaries:

| Initial candidate | Median | Best | Range |
|---|---:|---:|---:|
| Preserved indirect executable | 0.40 s | 0.39 s | 0.39-0.42 s |
| Regenerated direct executable | 0.40 s | 0.39 s | 0.39-0.40 s |

The grouped raw elapsed samples retained in the initial archive are
`0.39, 0.39, 0.40, 0.40, 0.40, 0.42 s` before and
`0.39, 0.39, 0.40, 0.39, 0.40, 0.40 s` after. The record says the six pairs used
alternating order; it does not provide a single timestamped interleaved event log.

Both printed `19888890`. The observed median improvement was 0% at a 0.01-second
timer resolution. The valid conclusion is that this experiment did not establish
the predicted execution benefit. It cannot prove exactly zero overhead at finer
resolution or on other workloads.

The metadata/lowering change was retained as a compiler improvement, but it did
not recover the earlier timing regression. The investigation therefore followed
the remaining operation into the callee. Even an empty optional-argument list
still caused positional-slot spilling and an out-of-line `rt_build_rest` call.
Although that helper allocated no pairs for the empty list, those operations
still had a cost. This narrowed the next experiment to the minimum-arity entry.

## Follow-up experiment, kept separate

The later `variadic-min-arity-fast-entry` candidate supplied a same-ABI entry that
binds the empty rest argument directly. It avoided the callee's check, spill, and
`rt_build_rest` for statically known minimum-arity calls while preserving other
call forms.

P9 records ten source-driver pairs with 0.38 s versus 0.35 s medians (7.89% less
time) and another ten post-regeneration pairs with 0.40 s versus 0.38 s medians
(5.00% less time), both printing `19888890`. It also records an 88-byte delivered
executable increase, from 70,600 to 70,688 bytes. Raw 80-demo IR grew by 6,748,035
bytes (8.17%) because variadic bodies were duplicated; tree shaking and LTO made
the delivered size effect much smaller. Those distinct denominators explain the
accepted trade-off in the historical record.

These follow-up summaries are historical evidence, with the same provenance limits
above. They must not be substituted for the initial direct-call result or treated
as a fresh rerun under the current writer investigation's sampling policy.

## Process and skill check

Applying the report template and `evaluate-performance` instructions yields three
separate decisions: the original causal hypothesis was not supported by timing;
the callee prologue became the next focused hypothesis; and the later candidate
had a measured benefit with an explicitly recorded size trade-off. A skill that
reported the 97 removed indirect calls as a measured speedup would fail this check.

The process keeps the null result, distinguishes code shape from elapsed time,
states timer/provenance limits, and uses available archived samples without
inventing missing provenance. This example
also shows why raw IR growth and delivered executable growth require separate
reporting, and why source-driver observations need confirmation after regeneration.
