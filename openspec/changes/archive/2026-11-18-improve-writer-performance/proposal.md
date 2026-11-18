# Proposal

## Why

The custom-writer release replaced reusable graph-printing storage with allocations on every compound print, including programs that never register a writer. We need to recover ordinary-print efficiency, keep active writers simple and performant, and establish a reproducible way to distinguish plausible performance explanations from measured causes.

## What Changes

- Add reproducible writer workloads and before/after evidence separating ordinary printing, active callbacks, generated-code overhead, and Malt tensor traversal.
- Remove repeated printer context/table allocation from warmed ordinary printing within a documented retained-capacity bound, preserving atomic output and all existing printing semantics.
- Evaluate reusable outermost traversal storage first; compare alternatives using allocation measurements, optimized code, execution time, memory retention, and binary size. Optimize active callbacks only where measurements justify the added complexity.
- Document a reusable performance evaluation process and package a thin repository agent skill that follows it, using this investigation as the worked example. Keep measurement tooling usable without an agent.
- Preserve raw evidence, rejected alternatives, and explicit limitations; reconcile the findings with performance backlog item P25 without attributing tensor costs to generic writers.

## Capabilities

### New Capabilities

- `performance-evaluation`: Reproducible performance investigations with controlled workloads, generated-code inspection, alternative evaluation, and evidence-based acceptance, accessible through documentation, tools, and a repository skill.

### Modified Capabilities

- `custom-writers`: Add resource-efficiency requirements for ordinary printing and safe reuse of internal traversal storage without reviving expired callback capabilities.

## Impact

Primary implementation areas are `src/runtime/runtime.c`, writer regression fixtures, new benchmark/report tooling, performance documentation, and `.agents/skills/`. Inspect `lib/emit/write.sld`, `src/emit.ss`, `src/emit.cpp`, and their generated code, but change them only for demonstrated costs. Preserve the writer API, tensor representation, artifact compatibility unless an actual ABI change requires invalidation, and REPL-to-standalone behavior. No new production dependency or mandatory timing gate is planned.

The eventual runtime fix takes one patch version bump and a matching changelog section; planning alone takes no bump. Validation follows the actual changed inputs, with regeneration required only if compiler assembly inputs change.

## Non-goals

No tensor representation redesign, general optimizer project, custom reader or pretty-printer redesign, automatic performance scheduling, or broad benchmark platform. Recovering the entire observed XOR slowdown is not an acceptance condition for a generic printer fix.
