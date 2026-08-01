## ADDED Requirements

### Requirement: A library unit may assign its own top-level binding

A compilation unit SHALL be permitted to `set!` a name it defines at its own top level, per R7RS
§5.3.1 (a definition introduces a mutable location). The assignment SHALL store into that unit's
global slot, so that every subsequent read of the binding — from within the unit, and from every
importing unit or program — observes the assigned value.

Assignment to a binding the unit does **not** own SHALL remain an error: an **imported** binding
(the slot belongs to the exporting unit) and a **primitive** (there is no slot) SHALL both be
rejected at compile time with a diagnostic. A REPL session global SHALL remain assignable.

#### Scenario: A library assigns its own exported procedure

- **WHEN** a library defines `f` and also defines `bump` as a procedure whose body is
  `(set! f <new-lambda>)`, and the library is compiled
- **THEN** the library compiles without error
- **AND** an importing program that calls `f`, then calls `bump`, then calls `f` again observes the
  original value first and the assigned value second

#### Scenario: Assignment to an imported binding is still rejected

- **WHEN** a library imports `(scheme base)` and its body assigns an imported name such as
  `(set! car …)`
- **THEN** compilation fails with a diagnostic naming the binding, and no unit is emitted

## MODIFIED Requirements

### Requirement: Library export table

Alongside the library unit the compiler SHALL produce a readable export table mapping each
export's **external** name to the **internal-name-based** mangled symbol (procedures only; a
macro slot is reserved but unused). For a bare export the external name equals the internal
name; for `(rename <internal> <external>)` the table key is `<external>` while the mangled
symbol is derived from `<internal>`. A driver reading the table together with the unit module
SHALL have everything needed to resolve references into the library with no access to the
library's source.

For an export whose top-level initializer is a **lambda of fixed arity**, the table SHALL
additionally record the binding's **code label** and that arity, so that a program compiled
against the table alone can emit a direct call to the procedure's code without loading a code
pointer out of its closure. Exports that are not fixed-arity lambdas SHALL record no label, and
calls to them SHALL continue to be lowered indirectly.

The table SHALL record a code label only for a binding whose slot cannot be reassigned after the
unit's initialization. A binding that the defining unit itself **assigns** SHALL therefore record
no label, however its initializer is shaped, and calls to it SHALL be lowered indirectly. This is
the property a cross-unit direct call depends on: an importer learns a callee's label only from
this table, so withholding the label is what keeps a direct call from binding code that the slot no
longer points to. The binding SHALL still be exported and callable.

#### Scenario: Export table maps external name to mangled symbol

- **WHEN** `(mylib)` exporting `greet` is compiled
- **THEN** its export table records that external name `greet` maps to symbol
  `mylib:greet`

#### Scenario: A renamed export keys on the external name but mangles the internal name

- **WHEN** `(mylib)` declares `(export (rename %fast-map map))`
- **THEN** its export table records that external name `map` maps to symbol
  `mylib:%fast-map`

#### Scenario: A procedure export records its code label and arity

- **WHEN** `(mylib)` exports `greet`, defined as a two-argument lambda
- **THEN** its export table additionally records `greet`'s code label and the arity 2
- **AND** a program that imports `(mylib)` can emit a call to that label without reading the
  library's source or its unit module

#### Scenario: A non-procedure export records no label

- **WHEN** `(mylib)` exports a value binding, or a procedure of variable arity
- **THEN** the table records no code label for it, and calls to it are lowered indirectly

#### Scenario: An export the unit assigns records no label

- **WHEN** `(mylib)` exports `f`, defined as a fixed-arity lambda, and some procedure in `(mylib)`
  assigns `f`
- **THEN** the export table records `f`'s mangled symbol but no code label for it
- **AND** an importing program lowers every call to `f` indirectly, reading the slot on each call

#### Scenario: The stable label is not claimed twice within a unit

- **WHEN** a library defines `f` as a top-level lambda and also assigns a lambda to `f` from inside
  another procedure's body
- **THEN** only the top-level initializer takes the stable, name-derived label `mylib:code:f`; the
  assigned lambda is hoisted under an ordinary counter-derived label
- **AND** the emitted unit defines each code label exactly once and links
