## Why

An optional or rest argument currently removes every cross-unit direct call to a library
procedure: a 3,000,000-call `number->string` workload measured 22% slower after that R7RS procedure
became variadic. This is the highest-value explicitly open item in `docs/PERFORMANCE.md`, and the
existing closure ABI already supports direct calls to variadic code, making the remaining gap much
smaller than the backlog's original fix sketch.

## What Changes

- Publish a stable code label and minimum accepted arity for an immutable variadic library export,
  distinguishing that descriptor from the existing fixed-arity call row.
- Lower a statically sized call to that export directly when its argument count is at least the
  minimum; retain the indirect path for too-few arguments, `apply`, value-position use, and exports
  whose slots may be reassigned.
- Reuse the existing direct-call ABI and the callee's existing rest-list prologue. No calling
  convention, closure representation, or open-world REPL rule changes.
- Preserve the closure load passed as `self`, so captured environments and AOT tree-shaking's
  cross-unit root discovery remain unchanged.
- Measure the original `number->string` workload after implementation and update P9 with the result.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `module-system`: Extend library call interfaces and cross-unit direct-call lowering from only
  fixed-arity exports to immutable variadic exports at every statically valid argument count.

## Impact

- `src/passes/lower.ss`: call-interface metadata and known-import arity matching.
- `src/core.ss`: export-table call-row production and import-table decoding.
- Module/direct-call and AOT tree-shaking tests, pipeline/module documentation, and
  `docs/PERFORMANCE.md` P9.
- Compiler-source changes require bootstrap regeneration and the full trust/test workflow.
