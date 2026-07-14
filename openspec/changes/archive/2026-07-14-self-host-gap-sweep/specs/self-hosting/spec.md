## ADDED Requirements

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
