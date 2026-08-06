## MODIFIED Requirements

### Requirement: Hygiene for macro-introduced identifiers

Expansion SHALL be hygienic with respect to identifiers a template introduces: an
identifier written in a template that is not a pattern variable and does not name a core
keyword, primitive, or known top-level/prelude binding SHALL be consistently renamed to a
fresh identifier per expansion, so a macro's introduced bindings can neither capture user
identifiers nor be captured by them. Syntax substituted from the macro use SHALL retain
its original identifiers.

A transformer that arrives from an **imported library** carries template identifiers already
resolved in the library that defined it — unit-qualified symbols naming that library's own or its
imports' bindings. Those identifiers SHALL count as known bindings in the importing unit and SHALL NOT
be renamed as introduced, since renaming one would break the reference the exporting library resolved.
The same SHALL hold for the unit-qualified keyword of a private macro carried alongside an exported
one.

#### Scenario: Introduced temporary does not capture user code

- **WHEN** a macro introduces a temporary binding (e.g. `or`'s `t`, or `swap!`'s `tmp`)
  and is used with argument expressions that reference an identifier of the same name
- **THEN** the user's identifier and the macro's temporary remain distinct and the program
  produces the correct result

#### Scenario: Referenced primitive stays bound to its definition

- **WHEN** a template references a core keyword or primitive (e.g. `let`, `if`, `cons`)
- **THEN** that identifier is left unrenamed and resolves to its usual definition

#### Scenario: A resolved identifier from an imported transformer is not renamed

- **WHEN** an imported macro's template references its own library's binding as the unit-qualified
  symbol the exporting library resolved it to, and the macro is used in the importing unit
- **THEN** that identifier is left unrenamed and lowers as a reference to the exporting unit's global

#### Scenario: Two imported macros' resolved identifiers coexist

- **WHEN** a unit imports two libraries that each export a macro whose template references a private
  helper of the same spelling in its own library
- **THEN** each expansion references its own library's binding, and neither is renamed away
