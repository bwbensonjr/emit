# compiler-pipeline Specification

## Purpose

Defines how the compiler's pass pipeline is structured and justified: the choice of
framework for expressing passes (nanopass versus stylized hand-rolled Scheme), and the
documented boundary between the frontend passes the compiler owns and the work delegated
to LLVM.

## Requirements

### Requirement: Pass-pipeline framework decision is evidence-backed and recorded

The project SHALL record a decision on how the compiler's pass pipeline is expressed —
the nanopass framework versus stylized hand-rolled Scheme — supported by a direct
comparison of representative passes translated both ways, together with the rationale
and the scoring that produced it.

#### Scenario: Representative passes are translated both ways

- **WHEN** the framework decision is made
- **THEN** at least three representative Chez passes (a trivial-traversal pass, an
  assignment-conversion pass, and a closure-conversion pass) have been translated into
  both nanopass and stylized hand-rolled Scheme
- **AND** each pair produces equivalent output on the same shared test inputs

#### Scenario: Decision is recorded with rationale

- **WHEN** the comparison is complete
- **THEN** the frontend/pass-ladder design doc records the chosen framework, the
  scoring (line count, boilerplate share, readability, safety lost), and the rationale
- **AND** `LLVM.md`'s framing of the pass pipeline is consistent with the recorded
  decision

### Requirement: Frontend pass-ladder and LLVM boundary are documented

The project SHALL document the transferable frontend pass spine
(`read → expand → core → assignment-conv → closure-conv → lambda-lift → emit .ll`) and
the boundary below which LLVM subsumes the work (ANF, calling conventions, basic-block
layout, instruction selection, register allocation, code generation).

#### Scenario: Pipeline doc distinguishes owned passes from LLVM-subsumed work

- **WHEN** the frontend/pass-ladder design doc exists
- **THEN** it identifies which passes the compiler owns and which are delegated to LLVM
- **AND** it notes that the minimal subset requires neither CPS nor ANF, with CPS tied
  to future `call/cc` support

### Requirement: Standard prelude prepended to programs

The compiler SHALL support a standard **prelude** — a file of Scheme definitions — whose
top-level forms are prepended to every compiled program's forms before the program is
assembled, so prelude definitions are in scope for every program. If a user program defines
a name the prelude also defines, the user's definition SHALL win (the prelude's definition
for that name is dropped), so the prelude never collides with or clobbers user code. The
compiler SHALL provide a way to compile a program without the prelude.

#### Scenario: Prelude procedures are available to a program

- **WHEN** a program that defines none of the prelude names calls a prelude procedure (e.g.
  `(map f (list 1 2 3))`)
- **THEN** it compiles and runs using the prelude's definition, producing the correct result

#### Scenario: User definitions shadow the prelude

- **WHEN** a program defines a name that the prelude also defines
- **THEN** the program's definition is used and the prelude's definition of that name is
  dropped (no duplicate-binding error), and the program produces the result of its own
  definition

#### Scenario: Prelude can be disabled

- **WHEN** a program is compiled with the prelude disabled
- **THEN** it is compiled from its own forms alone, and a program that does not reference any
  prelude procedure produces the same result as with the prelude enabled
