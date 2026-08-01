## MODIFIED Requirements

### Requirement: Library definition and export surface

The compiler SHALL accept a `define-library` form naming a library `(p₁ … pₙ)` and
containing `(export …)` declarations and body definitions. Each `export` declaration lists
either a bare name `<name>` or a rename pair `(rename <internal> <external>)`. The
**internal** name (the bare name, or `<internal>` in a rename) MUST be a name the library
defines at its top level; exporting a name the library does not define SHALL be a
compile-time error. The **external** name (the bare name, or `<external>` in a rename) is the
spelling under which importers see the binding. In this stage exports are procedures; `only`/
`except`/`prefix` import-set transforms remain out of scope.

A library body MAY contain, besides `define` and `define-syntax`, **commands** (expressions
evaluated for effect) and **`define-record-type`** declarations. Every body form SHALL be lowered;
no body form SHALL be discarded silently. The remaining R7RS library declarations — `include`,
`include-ci`, `include-library-declarations`, and `cond-expand` — remain out of scope.

A `define-record-type` in a library body SHALL introduce its whole group of bindings (descriptor,
constructor, predicate, accessors, and modifiers) as mutually visible top-level bindings of that
unit, so that sibling body forms MAY reference them and the `export` declaration MAY export them.

#### Scenario: A library exports a procedure it defines

- **WHEN** a `define-library (mylib)` defines a top-level procedure `greet` and declares
  `(export greet)`
- **THEN** the library compiles without error and `greet` is available to importers under
  the external name `greet`

#### Scenario: A library exports a procedure under a renamed external name

- **WHEN** a `define-library (mylib)` defines a top-level procedure `%fast-map` and declares
  `(export (rename %fast-map map))`
- **THEN** the library compiles without error, importers see the binding under the external
  name `map`, and the internal name `%fast-map` is not visible to importers

#### Scenario: Exporting an undefined name is an error

- **WHEN** a `define-library` declares `(export missing)` (or `(export (rename missing m))`)
  but defines no top-level `missing`
- **THEN** compilation reports a compile-time error naming the undefined export

#### Scenario: A library declares and exports a record type

- **WHEN** a `define-library (reclib)` body contains
  `(define-record-type point (make-pt x y) point? (x pt-x) (y pt-y))`, a sibling procedure that
  calls `pt-x`, and `(export make-pt pt-x)`
- **THEN** the library compiles without error, the sibling procedure resolves `pt-x` to the
  library's own binding, and an importing program can construct a `point` and read its field

## ADDED Requirements

### Requirement: A library body's commands run during initialization, in source order

A body form that is not a definition is a **command**. The compiler SHALL emit each command as part
of the library unit's one-time initialization, and SHALL evaluate the body's declarations in the
order they appear in the source, so that a command observes the definitions written above it and not
those written below it. A command SHALL NOT be discarded.

#### Scenario: A command in a library body is evaluated

- **WHEN** a library body defines a mutable cell, then contains a command that stores into it, then
  defines an accessor procedure, and a program imports the library and calls the accessor
- **THEN** the program observes the value the command stored

#### Scenario: Declarations are evaluated in source order

- **WHEN** a library body contains a command that appends to a log, a definition, and a second
  command that appends to the same log
- **THEN** the recorded order matches the source order of the two commands

#### Scenario: A top-level `set!` in a library body takes effect

- **WHEN** a library defines `f`, then contains the top-level command `(set! f <other-lambda>)`, and
  a program imports the library and calls `f`
- **THEN** the program observes the assigned value
- **AND** the export table records no call label for `f`, as for any binding its unit assigns

### Requirement: Tree-shaking covers a body form that defines no name

The closed-world AOT tree-shake SHALL preserve the meaning of a pruned unit for every body-form
shape. A form that defines **no** name — a command — SHALL always be kept, and the unit's own
bindings it references SHALL be treated as reachability roots, so that the shake cannot prune a
binding a surviving command calls.

A command's effects are not modelled by reachability analysis, so a command SHALL NOT be dropped on
the grounds that nothing references it; dropping one would reintroduce the silent
lost-initialization failure this behaviour exists to prevent.

A record type's bindings SHALL be reachable independently of one another. Each of the constructor,
predicate, accessors, and modifiers references the type's descriptor, so reaching any one of them
keeps the descriptor; reaching one SHALL NOT require keeping the others.

#### Scenario: A pruned unit still runs its commands

- **WHEN** a program imports a library with a command in its body and is built through the AOT
  tree-shaking path
- **THEN** the pruned unit still contains the command, and the program's value matches the value it
  has when the unit is compiled whole

#### Scenario: A command's references survive pruning

- **WHEN** a library body's command calls a procedure the library defines but the importing program
  never references
- **THEN** the pruned unit still defines that procedure, and the program links

#### Scenario: A reached record accessor keeps the descriptor it needs

- **WHEN** a program reaches a library's record constructor and one accessor, and is built through
  the tree-shaking path
- **THEN** the pruned unit defines the record type's descriptor alongside them, and the program
  links and reads the field correctly
