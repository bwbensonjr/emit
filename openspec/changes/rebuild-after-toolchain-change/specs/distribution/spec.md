# Spec Delta

## ADDED Requirements

### Requirement: Installation refreshes configuration-sensitive build outputs

`make install` SHALL install a binary built for the command's effective native toolchain and
`PREFIX`, even when an older `build/emit` already exists. `DESTDIR` SHALL affect only the staging
destination and SHALL NOT become part of the binary's compiled-in installation prefix.

#### Scenario: Install follows a toolchain upgrade

- **WHEN** `build/emit` was produced with one LLVM installation and `make install` later resolves a
  different effective LLVM configuration
- **THEN** the command rebuilds and relinks `build/emit` before copying it into the prefix
- **AND** the installed binary starts successfully against the newly resolved LLVM installation

#### Scenario: Install uses a changed prefix

- **WHEN** an existing `build/emit` was compiled with one `PREFIX` and `make install` is invoked with
  a different `PREFIX`
- **THEN** the installed binary contains the new compiled-in prefix and is copied to that prefix

#### Scenario: Staging does not change the compiled-in prefix

- **WHEN** `make install PREFIX=/usr/local DESTDIR=<staging>` is invoked for an otherwise current
  build
- **THEN** the installed binary retains `/usr/local` as its compiled-in prefix while being written
  beneath `<staging>/usr/local`

#### Scenario: Repeated install with the same configuration is incremental

- **WHEN** `make install` is repeated with unchanged sources, toolchain, flags, and `PREFIX`
- **THEN** it recopies the required install payload without needlessly recompiling or relinking the
  native binary
