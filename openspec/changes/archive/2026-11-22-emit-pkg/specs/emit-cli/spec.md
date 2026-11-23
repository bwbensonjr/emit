# Spec Delta

## MODIFIED Requirements

### Requirement: Single `emit` binary is the sole user-facing entry point

The project SHALL ship one compiled `emit` binary that dispatches on its first argument (the
*verb*) to `lib`, `build`, `run`, `repl`, `doctor`, or `pkg`, and SHALL report a usage error
naming the known verbs when given an unknown or missing verb.

#### Scenario: A verb dispatches to its command

- **WHEN** the user runs `emit run`, `emit repl`, `emit build`, `emit lib`, `emit doctor`, or `emit pkg`
- **THEN** the corresponding command executes

#### Scenario: An unknown verb is an error

- **WHEN** the user runs `emit frobnicate` (or `emit` with no verb)
- **THEN** it prints a usage error naming the known verbs (`lib`, `build`, `run`,
  `repl`, `doctor`, `pkg`) and exits non-zero

#### Scenario: The old entry points are gone

- **WHEN** the repository is built
- **THEN** no `build/scheme-run`, `build/repl-host`, `bin/scheme-compile`, or
  `bin/emit` is produced or required; every command is reached through `emit <verb>`

## ADDED Requirements

### Requirement: The `emit` binary is the sole user-facing entry point

The `emit` binary SHALL be the only user-facing entry point to the compiler's four compilation commands, its diagnostic command, and its package command. The previously separate entry points (`build/scheme-run`, `build/repl-host`, `bin/scheme-compile`, and the `bin/emit` bash wrapper) SHALL be removed, and no user-facing invocation SHALL depend on them.

#### Scenario: No separate entry point is built

- **WHEN** the repository is built
- **THEN** no `build/scheme-run`, `build/repl-host`, `bin/scheme-compile`, or `bin/emit` is produced, and every command is reached through `emit <verb>`

### Requirement: Top-level help and version are answered before verb dispatch

`emit --version`, `emit --help`, `emit -h`, and `emit help` SHALL be handled before the first argument is dispatched as a verb, so none of them is reported as an unknown verb.

#### Scenario: Version is not a verb

- **WHEN** the user runs `emit --version`
- **THEN** the version line is printed on standard output, the exit status is 0, and no unknown-verb diagnostic appears

### Requirement: The pkg verb runs the shipped package program

`emit pkg` SHALL run the shipped package-manager program through the in-process `emit run` path, giving it the remaining arguments verbatim along with the running Emit version and the user data directory. If the program's files cannot be found, it SHALL name the missing file and exit with status 1.

#### Scenario: Help is answered by the verb

- **WHEN** `emit pkg --help` or `emit help pkg` runs
- **THEN** the package subcommands and options are printed on standard output and the exit status is 0

#### Scenario: Pkg works from an installed prefix

- **WHEN** an installed Emit runs `emit pkg list` from an unrelated directory with an empty user data directory
- **THEN** it prints nothing on standard output and exits 0
