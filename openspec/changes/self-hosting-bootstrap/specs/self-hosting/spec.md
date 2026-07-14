## ADDED Requirements

### Requirement: The compiler core compiles its own source

The compiler core SHALL be expressible in the language scheme-llvm accepts, such that the
core's own source can be compiled by scheme-llvm to produce a working compiler. Building the
core with the host-hosted compiler SHALL yield a native `schemec` that maps source text to
LLVM IR without Chez at compile time.

#### Scenario: Core builds to a native compiler

- **WHEN** the core source is compiled by the (Chez-hosted) compiler
- **THEN** a native `schemec` is produced that, given a program's source text, emits the same
  IR the Chez-hosted compiler emits for that program

### Requirement: Self-compilation reaches a stable fixed point

Compiling the core with a self-built `schemec` SHALL reproduce the compiler: the IR emitted
for the core by stage-1 `schemec` SHALL be byte-identical to the IR emitted for the core by
the Chez-hosted compiler (the triple test). This stability is the acceptance criterion for
self-hosting.

#### Scenario: Stage-1 and stage-2 IR are identical

- **WHEN** the core is compiled by the Chez-hosted compiler (stage 1) and again by the
  resulting `schemec` (stage 2)
- **THEN** the two IR outputs are byte-identical

### Requirement: Compiled compiler replaces Chez at compile time (path C)

The driver/REPL host SHALL be able to invoke the compiled `schemec` in place of
`chez … compile.ss`, so that compiling a program (or a REPL form) requires no Chez at
runtime.

#### Scenario: Driver uses schemec, not Chez

- **WHEN** a program is compiled through the driver configured for the self-hosted path
- **THEN** compilation is performed by `schemec` (no Chez process), and the program's result
  is unchanged
