# Spec Delta

## Purpose

Defines `(emit process)`, the non-standard library through which Emit programs run host programs directly with an argument vector and observe their exit status or captured output, with the same behavior under `emit run` and in standalone executables.

## ADDED Requirements

### Requirement: The process extension is an ordinary importable library

Emit SHALL provide an ordinary non-baked `(emit process)` library exporting exactly `run-program` and `program-output`. It SHALL resolve like other shipped ordinary libraries, be installed with Emit, and add no name to `(scheme base)` or `(scheme process-context)`.

#### Scenario: An installed program imports the extension

- **WHEN** an installed Emit runs a program importing `(emit process)` from a directory with no manifest
- **THEN** both exports resolve and the program runs

#### Scenario: The extension remains explicit

- **WHEN** a program does not import `(emit process)`
- **THEN** neither `run-program` nor `program-output` is bound

### Requirement: run-program runs a program and returns its status

`(run-program program args)` SHALL run `program` with the argument strings in `args`, wait for it, and return its status:

- `program` is a string; a name with no slash is searched for on `PATH`;
- no shell interprets the program name or the arguments;
- the child inherits the environment, the working directory, and standard input, output and error;
- a normal exit returns its exact exit code;
- termination by a signal returns the negated signal number.

#### Scenario: Arguments reach the child verbatim

- **WHEN** `(run-program "printf" '("%s|" "a b" "$HOME" "*"))` runs
- **THEN** standard output receives `a b|$HOME|*|` and the result is 0

#### Scenario: Exit codes and signals are reported

- **WHEN** `run-program` runs `sh` with `("-c" "exit 3")`, and separately with `("-c" "kill -TERM $$")`
- **THEN** the results are 3 and -15 respectively

### Requirement: Output written before a spawn precedes the child's output

Before starting a child, `run-program` and `program-output` SHALL flush pending output on Emit's current output and error ports. This guarantees that text the program wrote first appears first on a shared stream.

#### Scenario: Parent text precedes child text

- **WHEN** a program writes `before` to its current output port without a newline, then calls `run-program` on `printf` with `("after")`
- **THEN** standard output contains `beforeafter`

### Requirement: program-output captures standard output

`(program-output program args)` SHALL run the program as `run-program` does, with these differences:

- the child's standard output is captured rather than inherited;
- the result is two values: the status and a string holding the complete captured output, decoded as a textual file port decodes it;
- standard input and standard error remain inherited.

#### Scenario: Output is captured whole

- **WHEN** `(program-output "printf" '("%s\n" "one" "two"))` is called
- **THEN** it returns 0 and the string `"one\ntwo\n"`, and nothing is written to the parent's standard output

#### Scenario: Failure still returns captured output

- **WHEN** `program-output` runs `sh` with `("-c" "echo partial; exit 4")`
- **THEN** it returns 4 and `"partial\n"`

### Requirement: A program that cannot be started raises a file error

When the program cannot be started, both procedures SHALL raise a catchable error for which `file-error?` is true, naming the program. This covers a program that is absent from `PATH`, a missing path, and a path that is not executable. A wrong argument type SHALL raise an ordinary error before any process starts.

#### Scenario: A missing program is catchable

- **WHEN** a program catches the object raised by `(run-program "no-such-program-xyz" '())`
- **THEN** `file-error?` returns `#t` and the error message names `no-such-program-xyz`

#### Scenario: A non-string argument is rejected

- **WHEN** `(run-program "echo" '(1))` is called
- **THEN** an error is raised and no process is started

### Requirement: Process behavior has development-to-ship fidelity

For the same host state, `(emit process)` SHALL produce the same results, raised error classifications, and child-visible arguments, environment and standard streams under `emit run` and in a standalone executable built by `emit build`.

#### Scenario: A process probe agrees across paths

- **WHEN** the same probe runs a program, captures output, observes an exit code and a signal, and catches a missing program, once under `emit run` and once as a built executable
- **THEN** both produce identical output and exit status
