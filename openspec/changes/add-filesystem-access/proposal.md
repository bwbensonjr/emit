## Why

Emit programs can open, create, test, and delete individual files, but they cannot enumerate directories, distinguish directories from symbolic links, or atomically replace a file. Pitch requires those operations to preserve its recursive CLI and safe in-place formatting behavior through both `emit run` and standalone executables.

## What Changes

- Add an ordinary non-standard `(emit filesystem)` library available through the same manifest, development, standalone-build, and installation paths as Emit's standard libraries.
- Export `directory-list`, `file-directory?`, `file-symbolic-link?`, and `replace-file` with explicit path, result, failure, symlink, and atomicity contracts.
- Add the minimal runtime primitives needed to implement those operations without exposing a general-purpose FFI or moving filesystem policy into applications.
- Verify identical observable behavior through `emit run` and AOT executables, including directory listing, linked-directory classification, failed operations, and same-directory atomic replacement.

## Capabilities

### New Capabilities

- `filesystem-access`: Defines Emit's non-standard Scheme filesystem library, its four operations, error behavior, door parity, and installed availability.

### Modified Capabilities

None.

## Impact

The change affects the runtime primitive layer, compiler primitive declarations, the generated/prelude library surface as needed, the shipped library manifest and installation layout, and focused JIT/AOT/install tests. It adds no external dependency beyond the host operating-system filesystem APIs already used by Emit and does not expand the R7RS `(scheme file)` surface.
