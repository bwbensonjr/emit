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

## ADDED Requirements

### Requirement: Library procedure code labels are stable across pruning

A library top-level procedure's code label SHALL be derived from its mangled binding name rather
than from the compilation's gensym counter, so that the label is identical whether the unit is
compiled whole or recompiled as a tree-shaken subset. Labels for inner and anonymous lambdas, and
for all program-unit code, SHALL be unaffected.

This is what makes a cross-unit direct call possible at all: the AOT tree-shake recompiles a unit
against a root set derived from the very program that must name the callee, so a counter-derived
label is not knowable by that program.

#### Scenario: The same procedure has the same label whole and pruned

- **WHEN** a library is compiled whole, and then recompiled as a tree-shaken subset that still
  contains a given exported procedure
- **THEN** that procedure's code label is identical in both units

#### Scenario: Program-unit and inner-lambda labels are unchanged

- **WHEN** a program with nested and anonymous lambdas is compiled
- **THEN** its code labels are numbered exactly as before this change
