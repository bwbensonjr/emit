# Proposal

## Why

Malt arithmetic currently exposes vectors containing procedures at the Emit prompt, obscuring correct numerical answers. Libraries need a general way to give their own objects useful printed representations, including tensors, without replacing the global printer or changing ordinary vectors.

## What Changes

- Add an optional `(emit write)` library that attaches Scheme custom writers to record types, with recursive printing, destination-port and output-mode support.
- Use the shared printer for nested custom objects in REPL results, program final values, and explicit `write`, `display`, `write-simple`, and `write-shared` calls.
- Define reentrancy, cycle boundaries, failure recovery, and ordinary graph-writing compatibility. Custom writers run during rendering, never during the graph scan.
- **BREAKING**: represent Malt scalar duals and constructed tensors as distinct records, retaining vector-backed tensor storage and raw-vector input compatibility through Malt operations. Ordinary vector predicates/accessors no longer expose constructed tensor storage.
- Print scalar duals as their primal numbers and tensors as `(tensor ...)` automatically; retain explicit diagnostics and configurable truncation.
- Document representation, equality, conversion, and printing contracts and validate them across interactive, source-driven, artifact, and standalone execution.

## Capabilities

### New Capabilities

- `custom-writers`: Per-record-type Scheme writers integrated with recursive native printing, with explicit mode, port, graph-boundary, and failure contracts.

### Modified Capabilities

- `core-language`: Preserve opaque record printing by default while allowing custom writers; retain record identity equality.
- `write-library`: Define custom-object representations as an explicit exception to readable graph output while preserving ordinary pair/vector behavior.
- `malt-learner`: Introduce distinct tensor/dual objects and automatic value printing, superseding the explicit-only printing adaptation and vector-only representation contract.

## Impact

Affects record descriptors and the native printer in `src/runtime/runtime.c`, record support and callback trampolines in the compiler, optional library packaging/manifests, and result-print error boundaries in native hosts. Malt tensor, autodiff, operations, diagnostics, recording, training fixtures, and documentation must use the new abstraction consistently. No dependency on Racket or Malt-specific runtime tags is added. Implementation requires compiler regeneration and classified validation; this planning-only change requires no version bump. The eventual implementation warrants one minor version bump and matching changelog entry.
