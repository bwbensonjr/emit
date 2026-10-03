# Spec Delta

## ADDED Requirements

### Requirement: Native build outputs track the effective build configuration

The native build SHALL treat the resolved toolchain and command-affecting build variables as inputs
to every output compiled or linked from them. A later `make` invocation SHALL rebuild affected
outputs when those effective values change and SHALL leave them current when the values do not
change.

#### Scenario: Discovered LLVM changes between builds

- **WHEN** a completed build is followed by another `make` invocation that discovers a different
  LLVM location, identity, compile flags, or link flags
- **THEN** the toolchain-sensitive host objects and binaries are rebuilt and linked against the new
  LLVM before `make` succeeds
- **AND** the committed bootstrap IR is not regenerated

#### Scenario: An explicit override changes between builds

- **WHEN** a completed build is followed by another `make` invocation with a different effective
  compiler, LLVM, libgc, or native flag override
- **THEN** every native output affected by that override is rebuilt before it is used or installed

#### Scenario: The effective configuration is unchanged

- **WHEN** source inputs and the effective native build configuration are unchanged between two
  `make` invocations
- **THEN** the second invocation does not recompile or relink native outputs merely because it
  checked the configuration
