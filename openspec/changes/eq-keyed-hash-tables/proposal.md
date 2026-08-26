## Why

Emit's mutable hash tables are `equal?`-keyed only, so consumers that require object identity must fall back to linear association lists. The Pitch port now reaches that limitation in its complete print/configuration/format corpus: document-identity memoization is a blocker even though the smaller layout corpus did not expose the cost.

## What Changes

- Add an `eq?`-keyed mutable hash-table constructor whose tables use the existing `hash-table-*` operation family.
- Give identity-keyed tables an identity-consistent hash so distinct heap objects distribute across buckets without structural traversal.
- Preserve the existing `make-hash-table` constructor and all of its `equal?`-keyed behavior.
- Cover identity semantics, cyclic keys, mutation, deletion, growth, and development/AOT parity.
- Verify the capability by replacing Pitch's association-list identity-table backing store and running the previously blocking corpus without narrowing it.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `core-language`: Extend the existing mutable hash-table requirement with efficient `eq?`-keyed tables while retaining the current `equal?`-keyed default.

## Impact

- `src/prelude.scm` and `src/prelude-surface.scm`: constructor, equality-mode dispatch, and surface publication.
- `src/runtime/runtime.c`, `src/parse.ss`, and `src/emit.ss`: identity-hash primitive and compiler/runtime wiring.
- Generated `(scheme base)` artifacts, demos, and hash-table backend tests.
- Bootstrap IR regenerated through the compiler-source barrier.
- The adjacent Pitch port can change `src/pitch/table.sld` internally without changing its table interface or layout callers.
