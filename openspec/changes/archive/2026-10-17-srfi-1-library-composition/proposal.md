# Proposal

## Why

`portable-library-surface` made unmodified SRFI 2 and SRFI 8 usable, but its attempted
SRFI 1 acceptance exposed two library composition defects: imported runtime bindings
cannot be re-exported (#121), and an exported macro cannot reliably carry an imported
macro dependency (#120). Closing these gaps makes SRFI 1 and its SRFI 227 dependency
the next concrete demonstration of portable Scheme code working in Emit.

## What Changes

- Accept re-exports of imported procedures and values, including import-set and
  export renaming, while preserving the original binding location and any valid
  direct-call metadata.
- Carry imported macro dependencies transitively through a library's compile-time
  interface, preserving their original resolution and private helpers without
  exposing additional public names.
- Vendor pinned, unmodified snow-fort SRFI 1 and SRFI 227 sources with provenance
  and license notices. Extend acceptance to exercise their procedures and macros
  through the Chez driver, `emit run`, `emit build`, and `emit repl`.
- Verify explicit `emit lib` artifacts for composition fixtures and SRFI units have
  the same full unit IR and serialized export interfaces as the Chez driver, and
  that normal cache reuse preserves behavior on warm runs. Retain base export
  comparisons; defer its pre-existing full-IR ordering discrepancy to #125.
- Update library documentation to replace the two recorded limitations with the
  supported composition rules and a practical SRFI 1 usage example.

Out of scope: SRFI 64, running every upstream package test, package installation or
Snow integration, adding SRFIs to the baked set or global feature identifiers,
procedural macros, full syntax-object hygiene, import conflict errors (#118), and
integrated primitive/core-keyword aliasing (#119), and adding manifest artifact-directory
consumption or new freshness metadata for `emit lib` outputs (#123), and the
pre-existing generic-lowering order defect affecting full base IR (#125). Further package blockers must
be reproduced and filed rather than hidden by editing vendored sources.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `module-system`: imported runtime binding re-exports, origin-preserving export
  artifacts, transitive imported macro dependencies, and unmodified SRFI package
  acceptance across interactive and standalone execution.

## Impact

- Shared compiler: `src/core.ss` export validation, runtime export rows, call rows,
  compile-time dependency composition, and both whole and pruned unit emission;
  `src/passes/expand.ss` export-time macro resolution.
- Consumers to audit: `src/repl-core.ss`, `src/compile.ss`, and `src/emit.cpp`,
  especially assumptions that every export belongs to its publishing unit.
  Host-specific implementations of the new semantics are not intended.
- Tests: focused module regressions, `test/snow/`, `test/snow-package-tests.sh`,
  cross-host artifact equivalence, direct-call and AOT reachability checks.
- Documentation: `docs/MODULES.md` and the existing library-source exploration.
- Compiler-source changes require the `make regen` barrier and both test suites.
  Existing export-table shapes should suffice; compiler identity invalidates old
  generated artifacts. No new runtime dependency or command is planned.
