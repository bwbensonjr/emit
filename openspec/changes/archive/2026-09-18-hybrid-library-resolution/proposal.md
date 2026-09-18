# Proposal

## Why

Emit currently requires an explicit manifest entry for every non-baked library, even when an R7RS
library name has an obvious conventional `.sld` path. That makes small projects repeat information
already present in `define-library`, while the recent deferred-initialization work and the existing
shared compile-unit pipeline provide the foundation for resolving conventional libraries on demand
without weakening separate compilation or REPL-to-executable fidelity.

## What Changes

- Add one shared hybrid library resolver used by the Chez driver and every `emit` path: baked
  libraries first, exact manifest mappings as overrides, then ordered conventional library roots.
- Map an eligible library name such as `(my stats)` to `my/stats.sld` beneath each root, require the
  resolved file's `define-library` name to match the requested name, and retain manifests for
  exceptional layouts, explicit overrides, artifact locations, and named program metadata.
- Add repeatable `-L DIR` / `--library-path DIR`, an `EMIT_LIBRARY_PATH` environment variable, a
  project default rooted at `./lib`, and relocatable installed roots beside the real `emit` binary
  and at the compiled installation prefix. Add an opt-out for conventional lookup so a caller can
  retain manifest-only resolution.
- Preserve project-before-install precedence: a project manifest or conventional project library
  may override a non-baked shipped library, while baked members remain authoritative and cannot be
  replaced from disk.
- Keep manifest libraries eagerly registered in the REPL, preserving their startup validation, but
  resolve and register a conventional-path library and its dependency closure on the first
  interactive import. Preserve deferred initialization, dependency order, once-only initialization,
  macro interfaces, and use of the same compile-unit core as `run` and `build`.
- Allow a simple application to be delivered directly from a source operand, with an optional
  output override, while retaining manifest `(program ...)` entries for named multi-target builds.
- Preserve artifact identity, tree shaking, transitive dependency ordering, diagnostics, and
  byte-identical library IR across the REPL, run, lib, and AOT paths regardless of which provider
  resolved the source.
- Update system/design documentation for resolver precedence, path derivation, caching, REPL
  loading, installation layout, and path parity; update user documentation, examples, help text,
  and project walkthroughs to make conventional one-file and `lib/` layouts the default path while
  documenting when manifests remain appropriate.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `module-system`: Replace manifest-only discovery with deterministic hybrid resolution while
  preserving separate compilation, import-closure construction, artifact reuse, and cross-path
  byte identity.
- `interactive-repl`: Admit conventional-path libraries on first import while preserving eager
  registration for enumerated manifest libraries and deferred, dependency-ordered initialization.
- `emit-cli`: Add library-path configuration and manifest-only opt-out options consistently to all
  applicable paths.
- `distribution`: Install shipped `.sld` sources in the conventional hierarchy and make the
  executable-relative and prefix roots discoverable without requiring per-library mappings.
- `project-build`: Permit direct source delivery without a `(program ...)` entry while retaining
  named manifest targets.

## Impact

- `src/emit.cpp`, `src/repl-core.ss`, `src/compile.ss`, and the import-discovery protocol will gain a
  shared provider order and on-demand REPL registration path.
- CLI parsing and help for `run`, `repl`, `build`, and `lib` will gain library-root options; direct
  source delivery changes the accepted `emit build` operand forms.
- `Makefile` and installation tests will establish the conventional installed library hierarchy;
  the installed manifest remains supported for exceptions and compatibility.
- Module, REPL, project-path, installation, artifact-cache, output, and cross-path equivalence tests
  will cover manifest overrides, conventional lookup, collisions, missing/mismatched sources,
  transitive imports, and warm/cold cache behavior.
- `README.md`, `docs/PROJECTS.md`, `docs/MODULES.md`, `docs/OUTPUT.md`, relevant source architecture
  documentation, and command help will be revised together with the behavior.
