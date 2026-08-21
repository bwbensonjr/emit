## ADDED Requirements

### Requirement: JIT optimization preserves the REPL's incremental open world

Every LLVM module admitted to the persistent REPL JIT SHALL be transformed with the session's
selected optimization profile before materialization.  This includes baked-library modules,
manifest-library modules, and each independently compiled interactive form.  Optimization SHALL
preserve externally visible definitions and references between modules; it SHALL NOT merge forms,
internalize a binding that a later form can reference, assume the set of future forms is closed,
or change the session's definition and redefinition semantics.

The profile SHALL be fixed when the session starts and SHALL apply uniformly for the lifetime of
that session.  A profile changes backend optimization only: the embedded Scheme compiler's pass
ladder, the IR it emits, macro state, globals, heap, symbol table, error recovery, and result
printing SHALL retain their existing behavior.

#### Scenario: A later optimized form sees an earlier definition

- **WHEN** a session at `-O1` or `-O2` enters `(define (square n) (* n n))` and then enters
  `(square 9)` as a separate form
- **THEN** the later form prints `81`, resolving the externally visible binding from the earlier
  optimized module

#### Scenario: Redefinition remains prospective under optimization

- **WHEN** a session at `-O1` or `-O2` defines a procedure, captures it in another value,
  redefines the procedure, and calls both the name and the previously captured value
- **THEN** the name resolves to the new definition while the captured value retains the old
  procedure, exactly as in an unoptimized session

#### Scenario: Heap and symbol identity survive optimized module boundaries

- **WHEN** an optimized form stores a heap value and an interned symbol in persistent globals and
  a later optimized form reads and compares them
- **THEN** the heap value remains valid and the equal symbol is `eq?`, because optimization does
  not replace the persistent runtime state

#### Scenario: Imported libraries use the session profile

- **WHEN** a session at `-O1` or `-O2` starts with baked and manifest libraries and later imports
  and calls one of their exported procedures
- **THEN** the libraries and form modules materialize successfully under that profile and the call
  produces the same value as at `-O0`

#### Scenario: Compile and runtime errors remain isolated

- **WHEN** an optimized session receives a form that fails to compile or traps at runtime and is
  then given a valid form
- **THEN** the failure is reported through the existing channel and the valid form still
  evaluates, as it does at `-O0`

#### Scenario: Optimization does not change compiler-stage observation

- **WHEN** an optimized session is started with `--dump` and a form is entered
- **THEN** the Scheme compiler's existing pass stages are printed unchanged before the backend
  optimization, and the form's result is identical to the result without `--dump`
