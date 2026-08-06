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

**Exports are procedures, and a macro export SHALL be rejected as one.** A name bound by a
`define-syntax` in the library body is not exportable in this stage. When such a name appears in an
`export` declaration the compiler SHALL report that a library cannot export a macro, naming the
macro, rather than reporting it as a name the library does not define — the compile-time half of a
library body is lifted out before the export check runs, so the undefined-name message would
describe an artifact of that lifting rather than the user's error.

**A declaration the compiler does not recognize SHALL be rejected, not absorbed into the body.**
The recognized declarations are `export`, `import`, and `begin`. Any other declaration SHALL be a
compile-time error naming the offending declaration, and the diagnostic SHALL distinguish two
cases:

- the remaining R7RS library declarations — `include`, `include-ci`,
  `include-library-declarations`, and `cond-expand` — SHALL be reported as recognized R7RS
  declarations that this stage does not support;
- anything else SHALL be reported as not being a library declaration at all.

The distinction is the point: the first is a feature Emit has not implemented, the second is an
error in the source, and the user's next action differs.

A library body MAY contain, besides `define` and `define-syntax`, **commands** (expressions
evaluated for effect) and **`define-record-type`** declarations. Every body form SHALL be lowered;
no body form SHALL be discarded silently. The remaining R7RS library declarations — `include`,
`include-ci`, `include-library-declarations`, and `cond-expand` — remain out of scope, and SHALL
be rejected by name as above rather than treated as body forms.

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

#### Scenario: Exporting a macro is reported as a macro export

- **WHEN** a `define-library` body binds `swap!` with `define-syntax` and declares `(export swap!)`
- **THEN** compilation reports that a library cannot export a macro, naming `swap!`, and does not
  report `swap!` as a name the library does not define

#### Scenario: An unsupported R7RS declaration is named

- **WHEN** a `define-library` contains `(include "body.scm")`, `(include-ci …)`,
  `(include-library-declarations …)`, or `(cond-expand …)`
- **THEN** compilation reports that declaration as a recognized R7RS library declaration this stage
  does not support, naming it — whether or not the library also exports a name the declaration
  would have provided

#### Scenario: An unrecognized declaration is named as not a declaration

- **WHEN** a `define-library` contains `(frobnicate 1 2 3)` in declaration position
- **THEN** compilation reports that it is not a library declaration, naming it, rather than
  lowering it as a body form and reporting an unbound variable

#### Scenario: A library declares and exports a record type

- **WHEN** a `define-library (reclib)` body contains
  `(define-record-type point (make-pt x y) point? (x pt-x) (y pt-y))`, a sibling procedure that
  calls `pt-x`, and `(export make-pt pt-x)`
- **THEN** the library compiles without error, the sibling procedure resolves `pt-x` to the
  library's own binding, and an importing program can construct a `point` and read its field

### Requirement: Whole-module import surface

The compiler SHALL accept a whole-module `(import (<lib>))` form that makes every export of
`<lib>` visible in the importing unit under its external name, resolved as an `imported`
binding. Import-set transforms (`only` / `except` / `prefix`) are out of scope for this
stage.

An import spec that is an **import set** — a form whose head is `only`, `except`, `prefix`, or
`rename` — SHALL be rejected with a compile-time error naming the form and stating that imports are
whole-library, rather than being read as a library name. The error SHALL be the same on every path
that resolves imports, so the message for a given form does not depend on whether it was written in
a program or in a `define-library`; today the two produce unrelated diagnostics (a missing manifest
entry, and an unresolved or cyclic import), neither of which mentions the import set.

`rename` SHALL be rejected only in **import** position. `(rename <internal> <external>)` remains
valid in an `export` declaration, so the rejection keys on the declaration the form appears in, not
on the keyword alone.

#### Scenario: An imported name becomes referenceable

- **WHEN** a program contains `(import (mylib))` and `mylib` exports `greet`
- **THEN** a reference to `greet` in the program resolves to the imported binding rather than
  reporting an unbound-variable error

#### Scenario: An import set is rejected by name in a program

- **WHEN** a program contains `(import (only (scheme inexact) sqrt))`
- **THEN** compilation reports that import sets are unsupported and imports are whole-library,
  naming the form, and does not report a library missing from the manifest

#### Scenario: An import set is rejected identically inside a library

- **WHEN** a `define-library` contains `(import (only (scheme inexact) sqrt))`
- **THEN** compilation reports the same diagnostic a program receives for the same form, and does
  not report an unresolved or cyclic import

#### Scenario: A renamed export is unaffected

- **WHEN** a `define-library` declares `(export (rename %fast-map map))` and imports no library
- **THEN** the library compiles without error, because the import-set rejection applies only to
  `rename` in import position

## ADDED Requirements

### Requirement: A `define-library` that cannot be compiled as a library is reported as one

A `define-library` form SHALL be compiled as a library unit only where a library unit is what the
door produces: as the sole top-level form of a source. Where that condition does not hold, the
compiler SHALL report the form as a misplaced `define-library`, naming the rule it violates, rather
than passing it to ordinary expression parsing — where `define-library` is not a form, so it is read
as an application over internal defines and reported as a malformed body.

This SHALL hold on the interactive door as well: a `define-library` entered at the REPL prompt SHALL
be reported as not supported at the prompt, naming libraries as something imported through the
manifest, rather than producing a parse error about an empty body.

Whether the interactive door should *accept* a `define-library` is a separate question and is not
settled by this requirement; what is required here is that the current limit be stated.

#### Scenario: A define-library alongside another top-level form

- **WHEN** a source contains a `define-library` form followed by another top-level form
- **THEN** compilation reports the `define-library` as needing to be the only form in its source,
  and does not report a parse error about internal defines with no following body expression

#### Scenario: A define-library at the REPL prompt

- **WHEN** a `define-library` form is entered at the interactive prompt
- **THEN** the session reports that libraries are not defined at the prompt, and remains alive and
  usable for subsequent forms
