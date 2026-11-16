# Proposal

## Why

Emit 0.7.0 rejects `(import (malt learner))` in a fresh REPL because its automatically imported scalar arithmetic conflicts with Malt's differentiable arithmetic. Users should be able to select a library naturally, while portable programs and libraries retain explicit namespace rules.

## What Changes

- Explicit program imports override overlapping names supplied only by Emit's implicit `(scheme base)` import, consistently through source compilation, `emit run`, and standalone builds.
- Successive REPL import declarations replace earlier imported bindings for subsequent forms, following R7RS-small section 5.2's interactive recommendation. Existing compiled code retains its resolved bindings.
- Conflicting bindings within one import declaration remain errors; explicit imports in programs and library declarations retain strict conflict validation.
- Preserve explicit base selection, prefixing, origin identity, macro hygiene, local-definition precedence, and transactional import publication.
- Document the program convenience as an Emit extension; update Malt examples and acceptance coverage without special treatment of Malt in the compiler.
- **BREAKING**: Inputs previously rejected for these conflicts may now succeed. Implementation takes a minor version bump; planning alone takes none.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `module-system`: Distinguish implicit defaults from explicit imports, and interactive import replacement from program/library validation.
- `malt-learner`: Require direct learner import to work with implicit defaults and in the REPL, retaining exclusions for explicit program base imports.

## Impact

Shared binding resolution in `src/core.ss`, interactive state in `src/repl-core.ss`, and program import assembly in compiler entry programs and `src/compile.ss`; module/import-set and Malt tests; `docs/MALT.md` and module documentation. Compiler regeneration and current-source verification are required during implementation. No new dependency or artifact format is planned.
