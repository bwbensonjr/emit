# Spec Delta

## MODIFIED Requirements

### Requirement: `emit run` runs a program in-process (Chez-free)

`emit run [--manifest F] [--no-prelude] [FILE]` SHALL compile and run a whole program
in-process without Chez, resolving user-library imports through the manifest, with
behavior identical to the prior `scheme-run`. The program source SHALL be read from
`FILE` when given, otherwise from stdin. `emit run --emit` SHALL write the emitted IR
to stdout instead of running (the Chez-free AOT front half used by `emit build` and the
self-hosting regen), and `emit run --resolve-program NAME` SHALL resolve a manifest
program entry (as in slice #2), printing its source and output without running.

#### Scenario: Run a program that imports a user library

- **WHEN** `emit run` runs a program importing `(mylib)` with `(mylib)` in the manifest
- **THEN** it loads/initializes the imports and prints the program's value, identical
  to the prior `scheme-run`

#### Scenario: `--emit` writes IR without running

- **WHEN** `emit run --emit` is given a program on stdin
- **THEN** it writes the program's IR (units joined by the boundary marker) to stdout
  and runs nothing

## ADDED Requirements

### Requirement: emit run stops option parsing at the program source

The executing form of `emit run` SHALL accept `emit run [OPTIONS] [FILE [ARG ...]]` and SHALL stop
option parsing at the first positional FILE (`-` names stdin). Before FILE, Emit options SHALL retain
their meanings, unknown options SHALL be rejected, and `--` SHALL end option parsing so the next token
is FILE. Every token after FILE, including `--`, SHALL be forwarded to the Scheme program unchanged.

#### Scenario: A dash-prefixed program argument is forwarded

- **WHEN** `emit run cli.scm --check input.scm` is invoked
- **THEN** `--check` and `input.scm` reach the Scheme process context in order and neither is treated
  as an Emit option

#### Scenario: A separator after FILE is forwarded verbatim

- **WHEN** `emit run cli.scm -- -x` is invoked
- **THEN** the program receives `--` and `-x` as its arguments, in that order

#### Scenario: Stdin source receives arguments

- **WHEN** `emit run - --check ''` is invoked with a program on standard input
- **THEN** the program's command line is `("-" "--check" "")`

#### Scenario: An unknown tool option remains an error

- **WHEN** `emit run --bogus cli.scm` is invoked
- **THEN** the command reports `--bogus` as an unknown Emit option and exits non-zero

#### Scenario: A separator before FILE ends option parsing

- **WHEN** `emit run -- -odd.scm a` is invoked and `-odd.scm` is a program source
- **THEN** `-odd.scm` is compiled and run as the program and receives `a` as its one argument

#### Scenario: An Emit option after FILE is a program argument

- **WHEN** `emit run app.scm --manifest m.scm` is invoked
- **THEN** `--manifest` and `m.scm` reach the program as its arguments and no manifest is loaded from
  them

#### Scenario: A second positional token is a program argument

- **WHEN** `emit run first.scm second.scm` is invoked
- **THEN** `first.scm` is the program and `second.scm` is its first argument, not a second source

### Requirement: Non-executing run modes reject program arguments

`emit run --emit` and `emit run --resolve-program` SHALL treat any program argument (a token after
FILE) as a usage error, reporting that program arguments require execution, and SHALL write nothing
to stdout.

#### Scenario: Arguments conflict with emit-only mode

- **WHEN** `emit run --emit cli.scm value` is invoked
- **THEN** the command reports that program arguments require execution and emits no IR

### Requirement: A program source may begin with an interpreter line

When `emit run` or `emit build` compiles a program source whose first line begins with `#!/` or
`#! `, that line SHALL be ignored up to and including its line terminator, as if it were a comment.
No other line, and no other `#!` spelling, SHALL be treated this way; reader directives such as
`#!fold-case` keep their meaning on every line. The same source SHALL produce the same program with
or without the interpreter line.

#### Scenario: A shebang script runs with arguments

- **WHEN** an executable file beginning `#!/usr/bin/env -S emit run` and printing `(command-line)` is
  invoked as `./tool.scm --check a.scm`
- **THEN** it prints `("./tool.scm" "--check" "a.scm")` and exits zero

#### Scenario: Script and executable see the same arguments

- **WHEN** the same source is invoked once as a shebang script and once as its `emit build`
  executable, each with the arguments `-- -x`
- **THEN** both programs receive `--` and `-x` after their command name

#### Scenario: A space after the bang is an interpreter line

- **WHEN** a program source begins with `#! /usr/bin/env -S emit run`
- **THEN** `emit run` ignores the first line and runs the program

#### Scenario: A leading case directive is still a directive

- **WHEN** a program source begins with the line `#!fold-case` followed by `(display 'ABC)`
- **THEN** the directive applies and the program prints `abc`

#### Scenario: An interpreter line is recognized only on the first line

- **WHEN** a program source contains `#!/usr/bin/env` on a line other than its first
- **THEN** compilation reports a read error, as it does today

#### Scenario: Standard input sources accept the line too

- **WHEN** a program beginning with `#!/usr/bin/env -S emit run` is piped to `emit run -`
- **THEN** the first line is ignored and the program runs

## REMOVED Requirements

### Requirement: emit run separates tool options from program arguments

**Reason**: The mandatory `--` cannot be placed after the script path by a shebang line, and it made
`emit run` forward a different command line than the built executable receives. Replaced by "emit run
stops option parsing at the program source".

**Migration**: Write program arguments directly after FILE: `emit run f.scm a` instead of
`emit run f.scm -- a`, and `emit run - a` instead of `emit run -- a` for stdin source. A `--` after
FILE is now forwarded to the program.
