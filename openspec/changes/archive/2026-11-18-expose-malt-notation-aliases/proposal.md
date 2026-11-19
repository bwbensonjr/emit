# Proposal

## Why

Little-learning executes book examples through Emit's `(malt learner)`, but the port currently requires ASCII replacements for Malt's mathematical identifiers. Exposing the corresponding Unicode spellings lets users enter book-style Scheme without translating each example.

## What Changes

- Export a `lambda` syntax alias using the UTF-8 lowercase lambda spelling from `(malt learner)`.
- Add aliases for primal and backprop accessors, both gradient procedures, the primal extension procedures, all supported `-primal` operations, and the primal-gradient diagnostic using their upstream Unicode spellings.
- Preserve every existing ASCII export and numerical contract. Continue excluding upstream's unimplemented extension-gradient stubs.
- Document the spelling map and verify ordinary imports, prefixed imports, interactive evaluation, standalone compilation, installed-library use, and little-learning's UTF-8 adapter.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `malt-learner`: Extend the explicit public export inventory with equivalent Unicode spellings and lambda syntax.

## Impact

Changes belong in `lib/malt/learner.sld`, export provenance, focused Malt acceptance checks, and documentation. Existing module export renaming can expose both syntax and procedures without compiler changes or runtime wrappers. Little-learning already passes source as UTF-8 to `emit repl`; no adapter change is expected. Implementation adds public API and therefore takes one minor version bump and matching changelog section; this planning-only change takes no bump.
