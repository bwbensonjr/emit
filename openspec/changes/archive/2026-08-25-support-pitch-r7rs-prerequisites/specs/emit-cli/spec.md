## ADDED Requirements

### Requirement: emit run separates tool options from program arguments

The executing form of the run door SHALL accept `emit run [OPTIONS] [FILE] [-- ARG ...]`. Before
`--`, existing Emit options SHALL retain their meanings, at most one positional source file SHALL be
accepted, and unknown options SHALL still be rejected. After `--`, every token SHALL be forwarded to
the Scheme program unchanged and SHALL NOT be interpreted by Emit. Program arguments SHALL be a
usage error with a non-executing mode such as `--emit` or `--resolve-program`.

#### Scenario: A dash-prefixed program argument is forwarded

- **WHEN** `emit run cli.scm -- --check input.scm` is invoked
- **THEN** `--check` and `input.scm` reach the Scheme process context in order and neither is treated
  as an Emit option

#### Scenario: An unknown tool option remains an error

- **WHEN** `emit run --bogus cli.scm` is invoked without a separator
- **THEN** the door reports `--bogus` as an unknown Emit option and exits non-zero

#### Scenario: Multiple source files are rejected

- **WHEN** two positional source files appear before `--`
- **THEN** the door reports a usage error rather than silently using the last file

#### Scenario: Arguments conflict with emit-only mode

- **WHEN** `emit run --emit cli.scm -- value` is invoked
- **THEN** the door reports that program arguments require execution and emits no IR

