# self-hosting Specification

## Purpose

Defines the path toward compiling the compiler with itself: assembling the compiler core
into a single program expressed in the subset scheme-llvm accepts, and maintaining a complete
inventory of the remaining constructs the language does not yet support, so the stage-1
self-hosting build can proceed without discovering gaps ad hoc.

## Requirements

### Requirement: The core is assembled into a single self-hostable program

There SHALL be a repeatable step that assembles the compiler core into one program in the
language scheme-llvm accepts — inlining the passes and de-`library`ing `match`/`util` into
top-level `define-syntax`/`define`s, with the source reader provided by the in-language
`read-all-from-string` — so the core can be fed to scheme-llvm as a single compilation unit.

#### Scenario: Assembled core is a single subset program

- **WHEN** the assembly step runs over the core sources
- **THEN** it produces one file containing no `library`/`import`/`include` forms, and that file
  behaves like the current core when run under the bootstrap host

### Requirement: Remaining self-hosting gaps are fully enumerated

Compiling the assembled core with scheme-llvm SHALL yield a complete inventory of the
constructs the language does not yet accept, each classified (missing primitive, missing
prelude procedure, unsupported special form, or reader gap) and assigned a fix path, recorded
as the self-hosting gap backlog.

#### Scenario: Gap inventory is complete and sized

- **WHEN** the sweep has compiled the assembled core as far as it can
- **THEN** every remaining unsupported construct is recorded in the self-hosting gap list with
  a location and a fix path, so no further gap is discovered ad hoc during the stage-1 build

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

Compiling the compiler source with self-built `schemec` binaries SHALL reproduce the compiler:
the IR emitted for the source by stage-1 `schemec` (call it stage-2), linked into `schemec2`
and used to recompile the source (stage-3), SHALL yield stage-2 byte-identical to stage-3 (the
triple test). This fixed point across self-compiled binaries is the acceptance criterion for
self-hosting.

The stage-1 IR emitted by the *Chez-hosted* compiler is NOT required to match stage-2: Chez and
scheme-llvm are different host runtimes and intern the constant pool in different orders, so
stage-1 legitimately differs. The compiler converges after one recompile off Chez, not zero.

#### Scenario: Stage-2 and stage-3 IR are identical

- **WHEN** the compiler source is compiled by stage-1 `schemec` (yielding stage-2), and stage-2
  is linked into `schemec2` and used to recompile the same source (yielding stage-3)
- **THEN** the stage-2 and stage-3 IR outputs are byte-identical

### Requirement: Compiled compiler replaces Chez at compile time (path C)

The driver SHALL be able to invoke the compiled `schemec` in place of `chez … compile.ss`, so
that compiling a program requires no Chez at runtime. The REPL host's removal of Chez is
delivered separately by path A (in-process embedding), not path C.

#### Scenario: Driver uses schemec, not Chez

- **WHEN** a program is compiled through the driver configured for the self-hosted path
- **THEN** compilation is performed by `schemec` (no Chez process), and the program's result
  is unchanged
