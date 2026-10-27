# Spec Delta

## MODIFIED Requirements

### Requirement: Scheme programs receive their command line

`command-line` SHALL return a list of strings whose first element is the implementation-dependent command name and whose remaining elements are the program arguments in order. Repeated calls SHALL not expose mutable runtime storage whose modification changes later results.

For a standalone executable, the first element SHALL be the operating system's `argv[0]`. For `emit run FILE ARG ...`, it SHALL be `FILE`; for source read from standard input it SHALL be `-`. The remaining elements SHALL be exactly the tokens following `FILE`, including any `--`.

#### Scenario: A standalone Pitch-style CLI receives arguments

- **WHEN** an AOT executable is invoked as `tool --check a.scm`
- **THEN** `(command-line)` contains its command name followed by `--check` and `a.scm` in that order

#### Scenario: The development path forwards option-like arguments

- **WHEN** `emit run formatter.scm --check a.scm` executes a program that prints `(command-line)`
- **THEN** the program receives `("formatter.scm" "--check" "a.scm")`, and `--check` is not parsed as an Emit option

#### Scenario: The development path forwards a separator unchanged

- **WHEN** `emit run formatter.scm -- --check a.scm` executes a program that prints `(command-line)`
- **THEN** the program receives `("formatter.scm" "--" "--check" "a.scm")`, as the built executable would for the same arguments
