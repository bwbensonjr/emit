## MODIFIED Requirements

### Requirement: Library export table

Alongside the library unit the compiler SHALL produce a readable export table mapping each
export's **external** name to the **internal-name-based** mangled symbol. For a bare export the
external name equals the internal name; for `(rename <internal> <external>)` the table key is
`<external>` while the mangled symbol is derived from `<internal>`. A driver reading the table
together with the unit module SHALL have everything needed to resolve references into the library
with no access to the library's source.

For an export whose top-level initializer is a lambda, the table SHALL additionally record the
binding's **code label** and accepted arity shape. A fixed-arity lambda SHALL record its exact arity.
A lambda with a rest parameter SHALL record its minimum arity and SHALL be explicitly distinguished
from a fixed-arity lambda with that arity. A program compiled against the table alone SHALL emit a
direct call to the procedure's code when a statically known argument count satisfies that shape:
equal to the exact arity for a fixed procedure, or at least the minimum arity for a variadic one.
Calls with a statically invalid argument count, calls made through `apply`, and calls whose operator
is not the imported binding directly SHALL continue to be lowered indirectly.

The table SHALL record a code label only for a binding whose slot cannot be reassigned after the
unit's initialization. A binding that the defining unit itself **assigns** SHALL therefore record
no label, however its initializer is shaped, and calls to it SHALL be lowered indirectly. This is
the property a cross-unit direct call depends on: an importer learns a callee's label only from
this table, so withholding the label is what keeps a direct call from binding code that the slot no
longer points to. The binding SHALL still be exported and callable.

The table SHALL further carry a **compile-time interface** — the library's exported macro
transformers, any private transformers those templates reach, and the mangled bindings the templates
reference, split into the unit's own bindings and other units'. The interface SHALL be readable data
requiring no evaluation, SHALL be written only to the export artifact and never into the emitted
unit, so that a standalone executable carries no compile-time payload, and SHALL be deterministic, so
that a library's interface is byte-identical however and wherever it is compiled.

A reader SHALL accept an export table written without a compile-time interface, treating it as a
library that exports no macro, so that an artifact produced before this change is read rather than
crashed on. It SHALL also interpret the existing three-field procedure call row as fixed arity, so
previously produced library artifacts remain usable.

A library that exports no macro SHALL produce an empty compile-time interface and an emitted unit
byte-identical to the one it produced before this change.

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
- **THEN** its export table additionally records `greet`'s code label and the exact arity 2
- **AND** a two-argument call can target that label without reading the library's source or unit
  module

#### Scenario: A variadic procedure export records its code label and minimum arity

- **WHEN** `(mylib)` exports `collect`, defined as a lambda with two required parameters and a rest
  parameter
- **THEN** its export table records `collect`'s code label, minimum arity 2, and variadic shape
- **AND** calls passing two or more statically counted arguments target that label and construct the
  same rest list as the indirect call path

#### Scenario: Too few arguments retain the existing arity error path

- **WHEN** a call to that variadic `collect` export passes fewer than two arguments
- **THEN** the call is lowered indirectly and reports the same arity error as before

#### Scenario: Apply and value-position use stay dynamic

- **WHEN** the variadic export is passed as a value or invoked through `apply`
- **THEN** its closure remains a first-class value and the eventual call is lowered indirectly

#### Scenario: A non-procedure export records no label

- **WHEN** `(mylib)` exports a value binding whose initializer is not a lambda
- **THEN** the table records no code label for it, and calls to it are lowered indirectly

#### Scenario: An export the unit assigns records no label

- **WHEN** `(mylib)` exports `f`, defined as a fixed or variadic lambda, and some procedure in
  `(mylib)` assigns `f`
- **THEN** the export table records `f`'s mangled symbol but no code label for it
- **AND** an importing program lowers every call to `f` indirectly, reading the slot on each call

#### Scenario: The stable label is not claimed twice within a unit

- **WHEN** a library defines `f` as a top-level lambda and also assigns a lambda to `f` from inside
  another procedure's body
- **THEN** only the top-level initializer takes the stable, name-derived label `mylib:code:f`; the
  assigned lambda is hoisted under an ordinary counter-derived label
- **AND** the emitted unit defines each code label exactly once and links

#### Scenario: The export table carries an exported macro's transformer

- **WHEN** `(mymac)` exporting the macro `swap!` is compiled
- **THEN** its export artifact records `swap!`'s transformer, and the emitted unit contains no
  representation of it

#### Scenario: An export table without a compile-time interface is still readable

- **WHEN** a driver reads an export table written in the pre-change shape
- **THEN** it resolves the library's runtime exports as before and treats the library as exporting no
  macro

#### Scenario: An existing fixed-arity call row is still readable

- **WHEN** a driver reads a three-field procedure call row written before variadic descriptors existed
- **THEN** it treats the recorded arity as exact and preserves fixed-arity direct-call behavior

#### Scenario: A macro-free library's unit is unchanged

- **WHEN** a library that exports no macro is recompiled after this change
- **THEN** its emitted IR is byte-for-byte identical to what it produced before
