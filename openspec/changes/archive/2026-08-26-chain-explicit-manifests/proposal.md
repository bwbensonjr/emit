## Why

An explicitly selected project manifest currently disables the installed-manifest chain, so a
build invoked outside the project checkout cannot both resolve manifest-relative project paths and
import Emit's non-baked standard libraries. This blocks portable build-system invocation and makes
the documented promises that manifests work from any directory and need list only project entries
incompatible (GitHub issue #114).

## What Changes

- Make a readable manifest selected by `--manifest FILE` or `EMIT_MANIFEST` the first manifest in
  the library-resolution chain, followed by the readable installed-manifest candidates. The current
  working directory's `./emit-libs.scm` is not inserted between an explicit manifest and the
  installed manifests.
- Preserve first-entry precedence: project library entries override installed entries, and every
  relative entry path remains relative to the manifest that contains it.
- Keep program lookup confined to the first, explicitly selected manifest; installed manifests
  supply libraries only.
- **BREAKING**: `--manifest FILE` and `EMIT_MANIFEST` no longer imply hermetic library resolution.
  Add `--no-manifest-chain` to the four `emit` doors as the explicit way to resolve libraries
  against only the highest-priority manifest; used with `--manifest FILE`, it preserves the former
  behavior.
- Keep a missing explicit manifest an immediate error instead of falling through, and continue to
  narrate every resolved and supplying manifest according to `docs/OUTPUT.md`.
- Add installed-layout coverage for `run` and `build` invoked from an unrelated working directory,
  including `EMIT_MANIFEST`, the chaining opt-out, precedence, path ownership, and program lookup.
- Update project/module documentation to separate manifest location from manifest-chain policy and
  describe the compatibility migration for hermetic callers.

## Capabilities

### New Capabilities

<!-- None. -->

### Modified Capabilities

- `module-system`: Explicit project manifests join the installed library-manifest chain by default,
  with a dedicated opt-out for single-manifest resolution and unchanged first-manifest program
  ownership.

## Impact

- `src/emit.cpp`: manifest candidate construction, common option parsing/usage for `run`, `repl`,
  `build`, and `lib`, and chain narration inputs.
- `test/install-layout-tests.sh` and focused door tests: replace the old explicit-non-extension
  assertion and cover out-of-tree project builds/runs against installed standard libraries.
- `docs/PROJECTS.md`, `docs/MODULES.md`, and command help: document chaining defaults and
  `--no-manifest-chain`.
- Existing callers that relied on `--manifest` alone for hermetic library resolution must add
  `--no-manifest-chain`; missing explicit files, library precedence, relative paths, and program
  selection otherwise retain their current behavior.
