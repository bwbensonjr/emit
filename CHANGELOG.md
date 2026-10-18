# Changelog

## 0.1.0

Initial public source release of Emit.

- Provides the `emit` command for Scheme compilation, execution, REPL, and library workflows.
- Builds from committed bootstrap IR with LLVM and libgc, without Chez Scheme.
- Establishes the initial release identity and source-build compatibility baseline.
- Adds `emit --version` and read-only `emit doctor` installation diagnostics.
- Verifies relocatable installed payloads and automates source archives, checksums,
  compatibility checks, and tagged release publication.
