## ADDED Requirements

### Requirement: A library body has its imports' exported macros in scope

A `define-library` body SHALL be compiled with every macro its imports export in scope, under the
external names those libraries export them by, so a macro use in a library body expands exactly as
the same use expands in a program. This SHALL hold for the baked `(scheme base)` as for any other
library: a library that imports `(scheme base)` SHALL be able to use `cond`, `case`, `when`,
`unless`, `let*`, `and`, `or`, `guard`, and `parameterize` in its body.

A library's own `define-syntax` SHALL take precedence over an imported keyword of the same spelling,
matching the user-wins shadowing the runtime environment already gives a `define`.

This SHALL hold identically on all three doors — the Chez batch driver, the REPL, and the Chez-free
embedded run door — per dev→ship fidelity.

#### Scenario: A library body uses a derived form

- **WHEN** a `define-library` imports `(scheme base)` and its body defines a procedure whose body is
  `(when (> x 1) 42)`
- **THEN** the library compiles without error and the procedure returns `42` for an argument greater
  than 1, rather than reporting `unbound variable when`

#### Scenario: `and` and `or` are available in a library body

- **WHEN** a `define-library` importing `(scheme base)` defines `(define (f x) (and x 7))`
- **THEN** the library compiles and `(f 1)` is `7`

#### Scenario: The three doors agree on a library body's derived forms

- **WHEN** the same library using a derived form in its body is compiled by the Chez driver, loaded
  by the REPL, and linked by the Chez-free run door
- **THEN** all three compile it without error and a program using it produces the same value on each

#### Scenario: A library's own macro shadows an imported one

- **WHEN** a library imports `(scheme base)` and its body defines `(define-syntax when …)` with a
  different expansion
- **THEN** uses of `when` in that body expand by the library's own transformer

#### Scenario: A derived form without the import is still an error

- **WHEN** a `define-library` that does **not** import `(scheme base)` uses `(cond …)` in its body
- **THEN** compilation fails, because a library receives macros only from libraries it imports

### Requirement: A library may re-export a macro it imports

An `export` declaration SHALL accept a name bound as a macro in the library's compile-time
environment whether that binding came from the library's own `define-syntax` or from one of its
imports. A re-exported transformer SHALL travel in the re-exporting library's compile-time export
interface with the identifier resolution its defining library performed left intact, so an importer
two units away expands it against the original library's bindings.

Re-export SHALL be available to any library, not only to the shipped ones: a rule keyed on a
particular library name would reintroduce the two-tier privilege this capability removes.

`(rename <internal> <external>)` SHALL be valid on a re-exported macro as on any other.

#### Scenario: A library re-exports an imported macro

- **WHEN** library `(relib)` imports `(macro-helper-lib)`, which exports the macro `twice`, and
  `(relib)` declares `(export twice)`
- **THEN** `(relib)` compiles without error, and a program importing only `(relib)` can use
  `(twice 5)`

#### Scenario: A re-exported macro keeps its original resolution

- **WHEN** a program imports `(relib)` and uses a macro `(relib)` re-exported, whose template
  references a **private** binding of the library that originally defined it
- **THEN** the expansion references that original library's binding, and the binding is not added to
  either library's public export surface

#### Scenario: Re-exporting a name bound as neither is still an error

- **WHEN** a library exports a name that is neither one of its own top-level definitions nor a macro
  in its compile-time environment
- **THEN** compilation reports that the library does not define the name

### Requirement: A macro that is not in scope is reported as a macro

When a form's head names a macro the compiler knows about but that is not in the compiling unit's
macro environment, the diagnostic SHALL report a macro that is not in scope and SHALL name the
library whose import would bring it in, rather than reporting an unbound variable. The message
SHALL be the same on every door.

#### Scenario: A derived form used in a library that does not import (scheme base)

- **WHEN** a `define-library` with no `(import (scheme base))` uses `(when …)` in its body
- **THEN** the diagnostic names `when` as a macro that is not in scope and names `(scheme base)` as
  the library that exports it, and does not say `unbound variable when`

## MODIFIED Requirements

### Requirement: Library definition and export surface

The compiler SHALL accept a `define-library` form naming a library `(p₁ … pₙ)` and
containing `(export …)` declarations and body definitions. Each `export` declaration lists
either a bare name `<name>` or a rename pair `(rename <internal> <external>)`. The
**internal** name (the bare name, or `<internal>` in a rename) MUST be a name the library
defines at its top level **or a macro bound in its compile-time environment, including one that
arrived from an import**; exporting a name that is neither SHALL be a compile-time error. The
**external** name (the bare name, or `<external>` in a rename) is the
spelling under which importers see the binding. `only`/`except`/`prefix` import-set transforms
remain out of scope.

**An export SHALL be a procedure, a value, or a macro.** A name bound by a `define-syntax` in the
library body counts as a name the library defines, and MAY appear in an `export` declaration — as a
bare name or as the `<internal>` of a rename. Its transformer travels in the library's compile-time
export interface rather than in the emitted unit, and an exported name that is neither a top-level
definition, nor a `define-syntax` binding, nor a macro the library imports SHALL still be reported as
a name the library does not define.

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

`define-syntax` SHALL remain recognized only at a library body's top level. An inner `define-syntax`,
`let-syntax`, and `letrec-syntax` remain out of scope.

#### Scenario: A library exports a procedure it defines

- **WHEN** a `define-library` declares `(export greet)` and its body defines `greet`
- **THEN** the library compiles and importers see `greet`

#### Scenario: A library exports a macro it defines

- **WHEN** a `define-library` declares `(export twice)` and its body binds `twice` with
  `define-syntax`
- **THEN** the library compiles without error, and it is not reported either as exporting a macro or
  as exporting a name it does not define

#### Scenario: A library exports a macro it imports

- **WHEN** a `define-library` declares `(export twice)`, does not define `twice`, and imports a
  library that exports it
- **THEN** the library compiles without error and importers see `twice` as a macro

### Requirement: A macro that leaves its library is resolved in the library that defines it

An exported macro is instantiated in the **importer's** scope, so the names its templates mention
SHALL be resolved before the transformer leaves the exporting library. For each exported macro the
compiler SHALL rewrite every template identifier that is none of the following to the spelling it
resolves to in the exporting library:

- a pattern variable of that rule's pattern, the ellipsis, the wildcard, or an identifier under
  `quote`;
- a **literal** of that rule's `syntax-rules` literal list, which is matched by identity against the
  use site and SHALL therefore survive verbatim even when the library also defines a top-level
  binding of that name;
- a core keyword, a primitive, or an integrable intrinsic — these SHALL be classified **before** the
  library's own bindings, so a template's `(+ a b)` still reaches inline arithmetic in the importer
  instead of becoming a call to a global named `+`;
- a macro of the baked `(scheme base)` set **when the importing unit is a program**, which needs no
  rule of its own: it falls under the leave-as-written case below and expands in the importer against
  the baked set the program path merges. When the importing unit is a **library**, the derived forms
  arrive instead through the compile-time interface of the library it imported them from, already
  resolved, and are governed by the ordinary imported-transformer rule rather than by this exception.

The rewritten spelling SHALL be the exporting unit's mangled symbol for one of its own top-level
bindings, or the already-mangled symbol for a name the exporting library imports. A template MAY
therefore reference a binding the library does **not** export, and doing so SHALL NOT add that
binding to the library's public export surface.

An identifier the compiler cannot resolve SHALL be left as written and renamed per expansion by the
existing hygiene rule, unchanged. Emit's hygiene is a name-set test with no syntax objects, so a
template-introduced temporary and a reference to a name nothing defines are indistinguishable; a
macro that expands correctly today SHALL therefore not be altered by this resolution.

A macro keyword a template mentions SHALL be rewritten to a unit-qualified spelling and its
transformer carried in the compile-time interface, transitively, whether or not that macro is also
exported publicly. A library MAY therefore export a macro whose template uses one of its **private**
macros.

#### Scenario: An exported template's reference to a private helper is resolved

- **WHEN** a library exports a macro whose template calls a procedure the library does not export
- **THEN** the template travels with that reference spelled as the exporting unit's mangled symbol,
  and an importer's expansion links against it

#### Scenario: A library importer receives a derived form through its import

- **WHEN** a library imports a library that exports a macro whose template uses `cond`
- **THEN** the `cond` resolves through the compile-time interface chain rather than failing, because
  a library importer now receives the derived forms from the library it imported them from

### Requirement: Prelude split into (scheme base) runtime and macro halves

The compiler SHALL treat the standard prelude as the library `(scheme base)`, split into two
halves driven from one prelude source: a **runtime half** — the prelude's procedure
definitions, compiled as a `(define-library (scheme base) …)` unit that exports its **declared
public surface** (see "The public surface of (scheme base) is declared, not derived") and is
linked (AOT) / loaded (REPL) like any library — and a **compile-time half** — the
prelude's derived-form macros (`and`, `or`, `when`, `unless`, `let*`, `cond`, `case`,
`guard`, and their helpers), carried in a library's compile-time export interface rather than
emitted into the artifact. The runtime half SHALL be compiled with the derived-form macros in scope,
because prelude procedures use them internally. Every prelude definition SHALL be present in the
unit's body whether or not it is exported, so a private helper is available to the procedures that
call it. The two halves SHALL stay consistent with the
single prelude source (no divergent hand-maintained copies).

**The derived-form macros SHALL be declared with a home in the partition, like any other prelude
definition, and SHALL reach the other members by import rather than by body-injection.** Their home
SHALL be a member that every other member imports directly or transitively; because the partition's
dependency order makes `(emit internal)` the only member importing nothing, the macros are homed
there and `(scheme base)` re-exports them, so a unit importing `(scheme base)` — including any user
library — receives them without importing the substrate. A member's body SHALL NOT receive a copy of
a transformer it does not define.

The surface declaration SHALL be able to name a macro, so a `define-syntax` binding can be assigned a
home and a re-export the same way a `define` binding is.

#### Scenario: The runtime half is a linkable/loadable library exporting the prelude procedures

- **WHEN** `(scheme base)` is compiled
- **THEN** it produces `scheme.base.ll` + `scheme.base.exports` exporting the prelude's declared
  public procedures (e.g. `map`, `assq`, `append`) and not its internal helpers, with a guarded
  `@"scheme.base:__init"` and no `@scheme_entry`

#### Scenario: The runtime half compiles using the derived-form macros

- **WHEN** a prelude procedure whose body uses `cond`/`case` (e.g. `case` expands to `memv`)
  is compiled into the `(scheme base)` unit
- **THEN** the derived-form macros are in scope for that compilation and the unit compiles
  without an unbound-macro error

#### Scenario: A partition member receives the derived forms by import

- **WHEN** `(scheme read)`, whose reader procedures use `cond` and `case`, is compiled
- **THEN** it compiles without error, and its body contains no copy of any transformer it does not
  itself define

#### Scenario: The substrate's compile-time half does not widen program scope

- **WHEN** a program imports nothing beyond the auto-imported `(scheme base)`
- **THEN** the derived forms are usable, and names private to `(emit internal)` remain out of scope

#### Scenario: Curating the surface does not change the library's emitted code

- **WHEN** names are removed from `(scheme base)`'s export list with no change to the prelude's
  definitions
- **THEN** the emitted library IR is byte-identical (library emission and code labels are derived
  from binding names, not export status), and only importing **program** modules change — each loses
  one external-global declaration per removed export
