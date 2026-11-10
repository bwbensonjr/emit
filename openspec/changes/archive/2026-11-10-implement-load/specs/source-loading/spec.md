# Spec Delta

## Purpose

Defines procedure-based sequential evaluation of Scheme source files in a host interaction environment, including persistence, failure behavior, and standalone availability restrictions.

## ADDED Requirements

### Requirement: First-class source loading procedure

`(scheme load)` SHALL export a first-class one-argument `load` procedure accepting a filename string and returning the unspecified value. Non-string filenames and unsupported argument counts SHALL raise catchable errors. The optional R7RS environment argument SHALL be documented as unsupported in this release.

#### Scenario: Indirect call with a computed filename

- **WHEN** a program imports `(scheme load)` and calls `load` through a variable with a computed existing filename
- **THEN** the file is evaluated and the call returns the unspecified value

#### Scenario: Invalid arguments

- **WHEN** `load` receives a non-string filename or a second environment argument
- **THEN** it reports an argument error rather than silently ignoring the argument

### Requirement: Sequential persistent interaction scope

In `emit repl`, loaded forms SHALL use the existing session interaction scope. In `emit run`, they SHALL use a separate persistent interaction scope seeded with the standard library. Loaded forms SHALL NOT capture caller lexical or batch top-level bindings. Definitions, macros, imports, and redefinitions SHALL follow REPL semantics; batch compilation semantics SHALL remain unchanged.

#### Scenario: Definitions and macros are available to later forms

- **WHEN** a REPL loads a file defining a macro and a procedure and later forms use them
- **THEN** later file forms and subsequent prompt forms observe those definitions

#### Scenario: Repeated loads execute again

- **WHEN** the same file is loaded twice
- **THEN** its expressions execute twice and redefinitions follow the existing prospective REPL rules

#### Scenario: Run scope persists without lexical capture

- **WHEN** an `emit run` program loads one file defining `x` and another file using `x`
- **THEN** the second file sees the loaded binding, while neither loaded file implicitly sees the caller's local or batch bindings

#### Scenario: Loaded imports use existing module behavior

- **WHEN** a loaded file imports a library and then uses its exports
- **THEN** normal resolution and dependency-first once-only initialization occur before use

#### Scenario: Library declarations remain unsupported

- **WHEN** a loaded form is a `define-library` declaration
- **THEN** it reports the existing named interaction-context diagnostic and does not install a library

### Requirement: Loading preserves output and port behavior

`load` SHALL suppress expression result echoes and leave current input and output ports unchanged. Explicit output from loaded code SHALL use the caller's current ports. Ordinary loading SHALL emit no host narration at default or quiet verbosity; verbose narration SHALL name the file and report form count and elapsed time on stderr.

#### Scenario: Only explicit file output appears

- **WHEN** a file containing `(+ 1 2)` and `(display "hello")` is loaded under redirected current ports
- **THEN** only `hello` is written to the current output port, no result value is echoed, and both current ports retain their original identities

### Requirement: Nested loads resolve paths without changing process directory

An outer `load` SHALL resolve a relative filename against the process working directory. A nested `load` SHALL resolve a relative filename beside its immediately loading source file. Source-relative includes SHALL retain their existing rules. Completion or failure SHALL restore the previous source context without changing process working directory.

#### Scenario: Nested sibling file

- **WHEN** a file outside the working directory loads a sibling by relative name
- **THEN** the sibling is loaded and subsequent independent loads still resolve against the working directory

### Requirement: Failure stops loading and preserves completed effects

Missing files, reader errors, compile errors, and runtime exceptions SHALL stop the current load and propagate a catchable error naming the file. Earlier completed effects SHALL remain; later forms SHALL not execute. Loader-owned resources and nested contexts SHALL be restored. A caught failure SHALL leave the host usable for subsequent loads and REPL forms.

#### Scenario: Error after an effect

- **WHEN** a file increments a counter, raises an error, and then increments it again
- **THEN** the caller can catch the error, the counter has increased once, and a later valid load succeeds

#### Scenario: Reader error after completed forms

- **WHEN** a valid side-effecting form precedes malformed source
- **THEN** its effect occurs before the reader error is raised and no subsequent form executes

### Requirement: Standalone executables retain a small runtime

Standalone executables SHALL resolve the `load` binding without a compiler or LLVM dependency and SHALL raise a catchable unsupported-host error when it is called. Documentation SHALL explicitly state this host restriction and recommend libraries or `include` for statically built programs.

#### Scenario: Standalone call is explicit and catchable

- **WHEN** a standalone program imports `(scheme load)` and guards a call to `load`
- **THEN** the program links without compiler dependencies and its handler receives an unsupported-host error

### Requirement: Escape continuations preserve loader cleanup

A live escape continuation invoked by loaded code SHALL retain its normal Scheme behavior. Escaping out of a load SHALL close its source port and restore nested source contexts through dynamic-wind cleanup, leaving subsequent loads usable.

#### Scenario: Escape from a loaded file into its caller

- **WHEN** a loaded file invokes a live caller continuation and skips the remaining file forms
- **THEN** the caller receives the escape value, unwind thunks run once, and another load resolves paths and evaluates normally
