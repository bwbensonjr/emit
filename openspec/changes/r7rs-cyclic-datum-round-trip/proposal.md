## Why

Emit can construct and print cyclic data safely now that pair mutation and cycle-aware datum
labels have landed, but it cannot complete the lifecycle: `list?` and `equal?` can loop on cycles,
and the reader cannot reconstruct the labels that `write` emits. Combining issues #75 and #108
closes that round trip behind one expensive `src/prelude.scm` regeneration barrier and removes the
six associated R7RS exclusions, including the remaining timeout cases.

## What Changes

- Make `list?` return `#f` for circular cdr chains instead of recursing forever.
- Make `equal?` terminate on cyclic pairs and vectors by remembering object pairs already compared;
  retain its existing structural behavior for acyclic values, strings, bytevectors, and numbers.
- Extend every public reader route to accept R7RS datum labels `#N=` and `#N#`, including cycles and
  shared references, and report malformed, duplicate, and unresolved labels as read errors.
- Make quoted constants containing datum labels compile without recursive-encoder hangs and retain
  their shared/cyclic object topology. This is a necessary dependency of the existing contract that
  every datum accepted by the shared reader is usable as a compiled constant.
- Add persistent `#!fold-case` and `#!no-fold-case` reader directives whose state applies to
  subsequent data from the same source or port.
- Add direct cyclic/shared read-write round-trip tests, equality/list-predicate termination tests,
  directive-state tests, and malformed-label tests.
- Remove the four `issue-75` and two `issue-108` entries from the R7RS exclusion manifest.
- Keep `length`, `append`, `list-copy`, `write-shared`, and `write-simple` outside this change unless
  implementing the required behavior exposes one as a necessary dependency.

## Capabilities

### New Capabilities

<!-- None. -->

### Modified Capabilities

- `core-language`: require cycle-safe `list?` and `equal?`, readable datum labels with validated
  label scope, persistent reader case directives, and the resulting cyclic datum write/read round
  trip.
- `io-ports`: require `read` to preserve directive state across successive reads from one port and
  to scope datum labels to one read operation.

## Impact

- `src/prelude.scm`: circular-list detection, reader state, datum-label parsing/fixups, and shared
  reader entry points. This file is baked into the compiler and therefore requires `make regen`.
- `src/runtime/runtime.c`: the actual `equal?` implementation (currently around line 1916) gains a
  visited object-pair traversal; `equal?` is not implemented in the prelude.
- `src/emit.ss`: constant lowering becomes graph-aware for labelled shared/cyclic constants,
  allocating aggregates before filling their edges.
- Reader surface/partition metadata may need adjustment if new internal helpers are introduced.
- Direct reader/runtime tests and `test/r7rs/exclusions.tsv` change; the vendored R7RS suite remains
  byte-for-byte unchanged.
- No new external dependencies or public procedures are introduced.
