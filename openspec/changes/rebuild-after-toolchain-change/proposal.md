# Proposal

## Why

`make` can treat `build/emit` as current after the discovered LLVM or other build configuration has
changed, and `make install` can then copy a binary linked against an incompatible toolchain. This
happened when an Emit linked against LLVM 22's unversioned dylib remained installed after the
Homebrew `llvm` keg advanced to LLVM 23, even though a freshly built local Emit worked.

## What Changes

- Make the native build notice changes in the resolved toolchain and other values compiled into
  `emit`, instead of relying only on source-file timestamps.
- Rebuild the affected host objects and relink `build/emit` before installation when that build
  configuration changes, without regenerating the committed bootstrap IR.
- Make a changed `PREFIX` take effect in the binary installed by the same `make install` command;
  keep `DESTDIR` staging from changing the compiled-in prefix.
- Add regression coverage for a toolchain identity change, a prefix change, a no-change rebuild,
  and installation of the refreshed binary.
- Keep install-tree pruning and package-manager distribution outside this change: no stale files
  were present in the reproduced installation, and the failure occurred before Emit read its
  support files or cache.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `toolchain-discovery`: require the native build graph to invalidate toolchain-sensitive outputs
  when the effective discovered or overridden build toolchain changes.
- `distribution`: require `make install` to install a binary built for the command's effective
  toolchain and `PREFIX`, while preserving `DESTDIR` semantics and avoiding needless rebuilds when
  the configuration is unchanged.

## Impact

- Affected build logic: `Makefile` and the generated build configuration under `build/`.
- Affected tests: focused Make/install regression coverage and the existing installed-layout suite.
- No compiler-source, bootstrap IR, runtime semantics, cache format, installed layout, or external
  package-manager change.
