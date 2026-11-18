---
name: evaluate-performance
description: Investigate performance, allocation, retained memory, or executable-size costs in Emit using reproducible measurements, generated-code inspection, and controlled alternatives. Use for a reported regression or an optimization evaluation, including optional runtime behavior such as custom writers.
---

Use the repository's [performance evaluation process](../../../docs/PERFORMANCE-EVALUATION.md)
and [report template](../../../docs/PERFORMANCE-REPORT-TEMPLATE.md) as the shared methodology.
Read those before starting the investigation. Resolve paths from this skill's
repository root, not from a temporary report directory.

Preserve the user's chosen scope and mode. In an explicitly selected exploration
or planning workflow, investigate and report within that workflow's boundaries;
this skill does not authorize implementation, publication, or other external
mutation. During an authorized implementation, proceed with the measurements and
changes needed for the selected issue under the repository's existing rules.

Start from the reported operation and correctness oracle. Capture provenance and
controls, then record a falsifiable mechanism prediction before each candidate.
Follow the operation through emitted IR, optimized IR, and relevant final machine
code, distinguishing the AOT and development execution paths. Measure mechanisms
with instrumentation and acceptance timing with ordinary production builds.

Use the process/template to retain raw paired samples, rejected alternatives,
resource and size trade-offs, uncertainty, and an explicit verdict against the
criteria declared before timing. Do not infer speed from code shape, allocation
volume from RSS, or a component's causal cost from a release that changed several
components together. If evidence is missing, label it; do not invent a baseline,
raw samples, or provenance.

For writer work, use the documented fixtures and opt-in runner linked by the
process. Read the [writer report](../../../docs/performance/writer-report.md) for
the concrete reconstruction recipe. For a historical example of a failed
performance hypothesis, read the [P9 walkthrough](../../../docs/performance/p9-walkthrough.md)
only when that comparison is relevant. Select correctness and source/native
validation according to the actual changed inputs and the repository's current
build instructions; performance results do not replace those checks.
