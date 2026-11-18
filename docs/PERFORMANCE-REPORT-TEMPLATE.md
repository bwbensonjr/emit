# Performance report: TITLE

## Claim and correctness oracle

- Observed symptom and user-visible operation:
- Suspected mechanism (a hypothesis, not a conclusion):
- Metric and scope (build/startup/in-process/output/end-to-end):
- Fixture paths, hashes, sizes, seeds, and expected output/digest:
- Compilation and execution paths:

## Provenance and reconstruction

| Field | Baseline | Candidate |
|---|---|---|
| Full source revision and dirty input evidence | | |
| Source/bootstrap fingerprint where relevant | | |
| Platform, architecture, SDK | | |
| Compiler, linker, libgc versions | | |
| Build command, optimization/LTO flags | | |
| Cache state | | |
| Binary hash and size | | |

Provide complete commands to reconstruct both sides and rerun the comparison.
Record unavailable provenance explicitly; distinguish newly reproduced evidence
from historical documents or retained binaries of uncertain origin.

## Workloads and controls

| Workload | Question it tests | Work/iterations/output bytes | Correctness oracle |
|---|---|---|---|
| Primary | | | |
| Unaffected control | | | |
| Behavior-specific control | | | |
| Application | | | |

Record graph/input construction, sink choice, timed-region boundaries, and any
differences that prevent equivalent-work attribution.

## Acceptance criteria declared before candidate timing

- Primary metric and required effect:
- Control regression limits:
- Allocation/collection/lifecycle invariants:
- Retained-memory and artifact-size budgets:
- Correctness and changed-input validation:
- Sampling policy, minimum batch duration, warm-up, number/order of pairs:
- Conditions that make the result inconclusive:

Any revision to these criteria needs its reason and timing relative to the data.
Do not silently lower a gate after seeing a failed candidate.

## Hypotheses and generated-code evidence

For each candidate, record the predicted change before its measurement.

| Candidate | Predicted mechanism | Affected workload | Expected unchanged controls |
|---|---|---|---|
| | | | |

Trace the source operation through relevant lowered forms/emitted IR, optimized
IR, and final machine code. Include exact extraction commands, annotated excerpts,
and hashes or paths of reproducible evidence. Identify which code/profile was
inspected and whether the suspected operation survives final optimization/linking.

## Samples and resource measurements

- Raw sample/report paths and hashes:
- Actual sample order, warm-up, calibration and fixed iteration counts:
- Background load and measurement limitations:
- Instrumented build and counter definitions:
- Uninstrumented timing build:

| Workload/metric | Baseline median and spread | Candidate median and spread | Paired deltas |
|---|---|---|---|
| In-process CPU/wall | | | |
| Process CPU/wall | | | |
| Printer allocation count/requested bytes | | | |
| Total collector allocation/collection activity | | | |
| Retained capacity/references | | | |
| Peak resident memory | | | |
| Executable bytes | | | |

Mark missing metrics unavailable. RSS does not establish allocation volume or
object liveness. Keep code-size effects separate from execution-time effects.

## Alternatives and decision

| Candidate | Correctness | Measured benefit and cost | Complexity | Accept/reject/inconclusive and why |
|---|---|---|---|---|
| | | | | |

Retain negative results. Explain what was learned when an expected mechanism
changed without an execution benefit. Give a verdict for each declared gate.

## Validation, limits, and follow-up

- Commands, selected suites/profiles, reports, and results:
- Regeneration/source verification required and performed:
- Applicable platforms, profiles, input ranges, and timer resolution:
- Claims the evidence does not establish:
- Remaining questions and deferred debt location:
- Correctness issues found and issue references, if any:
