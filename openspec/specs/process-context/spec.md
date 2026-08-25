# process-context Specification

## Purpose

Defines the R7RS-small process context visible to Scheme programs, including arguments, termination status, and environment variables with JIT-to-AOT fidelity.

## Requirements

### Requirement: The process-context standard library

Emit SHALL provide an ordinary importable `(scheme process-context)` library exporting `command-line`, `exit`, `emergency-exit`, `get-environment-variable`, and `get-environment-variables`. The library SHALL be included in build, install, and manifest discovery alongside the other standard libraries.

#### Scenario: The complete library imports from outside the checkout

- **WHEN** an installed Emit compiles a program importing `(scheme process-context)` from a directory with no local Emit manifest
- **THEN** every declared export resolves through the installed standard-library manifest

### Requirement: Scheme programs receive their command line

`command-line` SHALL return a list of strings whose first element is the implementation-dependent command name and whose remaining elements are the program arguments in order. Repeated calls SHALL not expose mutable runtime storage whose modification changes later results.

For a standalone executable, the first element SHALL be the operating system's `argv[0]`. For `emit run FILE -- ARG ...`, it SHALL be `FILE`; for source read from standard input it SHALL be `-`. The remaining elements SHALL be exactly the arguments following `--`.

#### Scenario: A standalone Pitch-style CLI receives arguments

- **WHEN** an AOT executable is invoked as `tool --check a.scm`
- **THEN** `(command-line)` contains its command name followed by `--check` and `a.scm` in that order

#### Scenario: The development door forwards option-like arguments

- **WHEN** `emit run formatter.scm -- --check a.scm` executes a program that prints `(command-line)`
- **THEN** the program receives `("formatter.scm" "--check" "a.scm")`, and `--check` is not parsed as an Emit option

### Requirement: Normal exit unwinds and communicates status

`exit` SHALL accept zero or one argument, run every outstanding `dynamic-wind` after thunk exactly once from innermost to outermost, and terminate without returning or raising. With no argument, the unspecified value, or `#t`, it SHALL communicate success; with `#f`, it SHALL communicate failure; and when the host can represent an exact integer status, it SHALL communicate that status.

#### Scenario: Exit preserves cleanup

- **WHEN** `exit` is called inside nested `dynamic-wind` extents whose after thunks write markers
- **THEN** both markers are written in innermost-to-outermost order before the process terminates

#### Scenario: Pitch's status reaches the shell through both doors

- **WHEN** the same program calls `(exit 2)` once under `emit run` and once as an AOT executable
- **THEN** both processes terminate with operating-system status 2

### Requirement: Emergency exit bypasses cleanup

`emergency-exit` SHALL accept the same optional status argument and status mapping as `exit`, but SHALL terminate without running outstanding `dynamic-wind` after thunks and without returning or raising.

#### Scenario: Emergency exit does not run an after thunk

- **WHEN** `emergency-exit` is called inside a `dynamic-wind` whose after thunk would write a marker
- **THEN** the process terminates with no marker written

### Requirement: Environment variables are exposed as strings

`get-environment-variable` SHALL return the named variable's string value or `#f` when absent. `get-environment-variables` SHALL return an alist of string names and string values representing the process environment; its order is unspecified. Results SHALL be snapshots whose mutation cannot alter the actual process environment.

#### Scenario: A present and absent variable are distinguished

- **WHEN** a program queries one environment variable supplied to the process and one name not present
- **THEN** it receives the supplied string and `#f` respectively

#### Scenario: The complete environment has the R7RS shape

- **WHEN** a program calls `get-environment-variables`
- **THEN** it receives a proper list in which every element is a pair of strings
