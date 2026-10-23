# Changelog

## 0.1.1

Distribution channels and validation fixes. No incompatible language or CLI changes.

- Installs through a Homebrew tap (`brew install bwbensonjr/emit/emit`, Apple Silicon), a
  Nix flake (`aarch64-darwin`, `x86_64-linux`), and a `ghcr.io/bwbensonjr/emit` image
  (`linux/amd64`), each built from this release's source archive against LLVM 22.
- Adds `make install TOOLCHAIN_PIN=1`, which records a package's toolchain so `emit build` uses
  the declared clang and libgc instead of whatever clang is first on `PATH`; explicit
  environment overrides still win. `emit doctor` reports the toolchain origin and pin.
- Shares one installed acceptance check (`tools/channel-accept.sh`) across source-release and
  channel validation, and documents downstream packaging in `docs/PACKAGING.md`.
- Makes exported library metadata canonical, so `.exports` bytes no longer depend on binding
  graph sharing (#136).
- Streamlines development validation and CI toolchain provisioning, and completes the pinned
  LLVM backend tools and Chez compatibility used by reference verification (#137).

## 0.1.0

Initial public source release of Emit.

- Provides the `emit` command for Scheme compilation, execution, REPL, and library workflows.
- Builds from committed bootstrap IR with LLVM and libgc, without Chez Scheme.
- Establishes the initial release identity and source-build compatibility baseline.
- Adds `emit --version` and read-only `emit doctor` installation diagnostics.
- Verifies relocatable installed payloads and automates source archives, checksums,
  compatibility checks, and tagged release publication.
