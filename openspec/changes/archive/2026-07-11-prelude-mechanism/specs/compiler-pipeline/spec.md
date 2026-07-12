## ADDED Requirements

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
