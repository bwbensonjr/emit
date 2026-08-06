## ADDED Requirements

### Requirement: An exported macro is usable in an importing unit

A unit that imports a library SHALL be able to use that library's exported macros under their
external names, in the same positions and with the same expansion behaviour as a macro the unit
defines itself. The transformers SHALL travel in the library's compile-time export interface and be
merged into the importing compile's macro environment before expansion, alongside the runtime
bindings merged into its environment.

This SHALL hold identically on all three doors — the Chez batch driver, the REPL, and the Chez-free
embedded run door — and for both `emit run` and `emit build`, per dev→ship fidelity: a macro
developed against a library in the REPL SHALL expand the same way in the linked executable.

An exported macro's keyword SHALL be a known binding in the importing unit, so a macro use is not
mistaken for an application of an unbound variable, and so another macro's template may mention it.

#### Scenario: An importing program uses a library's exported macro

- **WHEN** `(mymac)` defines `swap!` with `define-syntax`, declares `(export swap!)`, and a program
  imports `(mymac)` and uses `(swap! a b)`
- **THEN** the library compiles, the program compiles, and running it observes `a` and `b` exchanged

#### Scenario: A library uses a macro exported by a library it imports

- **WHEN** `(uses-mac)` imports `(mymac)` and one of its own procedure bodies uses `(swap! x y)`
- **THEN** `(uses-mac)` compiles, and a program importing it observes the swap

#### Scenario: The three doors agree on an exported macro

- **WHEN** the same program using an imported macro is run through `emit run`, built and executed
  through `emit build`, and evaluated form-by-form in `emit repl`
- **THEN** all three produce the same output

#### Scenario: A renamed macro export is visible under its external name

- **WHEN** a library binds `%swap` with `define-syntax` and declares `(export (rename %swap swap!))`
- **THEN** an importer may use `(swap! a b)`, and `%swap` is not visible to the importer

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
- a macro of the baked `(scheme base)` set, which needs no rule of its own: it falls under the
  leave-as-written case below and expands in the importer against the baked set. In a **program**
  importer that set is always present. In a **library** importer it is not — a library body does not
  receive the baked macro set at all, so a template mentioning a derived form fails there for the
  same reason writing one directly in a library body fails, independently of macro export.

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

Because a macro keyword and a top-level binding would then share the unit-qualified spelling, a
library that binds the same name with both `define` and `define-syntax` SHALL be a compile-time error
naming that name.

Resolution SHALL be a pure structural rewrite with no fresh-name generation, so a library's
compile-time interface is byte-identical however and wherever it is compiled.

#### Scenario: An exported template calls a private helper

- **WHEN** `(mymac)` defines a private `helper`, exports only the macro `twice!` whose template calls
  `helper`, and a program imports `(mymac)` and uses `twice!`
- **THEN** the program compiles, links, and produces the value `helper` computes — and `helper` is not
  visible to the program under any spelling

#### Scenario: An exported template uses a private macro

- **WHEN** `(mymac)` binds a private macro `%inner` with `define-syntax`, exports a macro `outer`
  whose template uses `%inner`, and a program imports `(mymac)` and uses `outer`
- **THEN** the program compiles and produces the expected value, and `%inner` is not usable in the
  program

#### Scenario: An exported template using a derived form needs no copy of it

- **WHEN** a **program** imports a library whose exported macro's template uses `when` or `cond`
- **THEN** the identifier is left unresolved in the compile-time interface and expands against the
  baked `(scheme base)` macro set, with no copy of that transformer in the interface

#### Scenario: A recursive exported macro's self-reference is not captured by the importer

- **WHEN** a library exports a recursive variadic macro whose template refers to itself, and a
  program imports it and shadows both the macro's keyword's helper and uses it at a width requiring
  several levels of recursion
- **THEN** the expansion recurses through the library's own transformer and calls the library's own
  helper, not the program's

#### Scenario: A literal survives a same-named binding in the exporting library

- **WHEN** an exported macro's `syntax-rules` literal list names `else`, its template mentions
  `else`, and the library also defines a top-level `else`
- **THEN** the template's `else` is unchanged in the compile-time interface, so a use of the macro
  matching on `else` still matches in the importer

#### Scenario: A template's introduced temporary is still hygienic

- **WHEN** an exported macro's template introduces a temporary (e.g. `tmp` in a `let`) and an importer
  uses the macro with an argument mentioning an identifier of the same spelling
- **THEN** the two remain distinct, exactly as for a macro defined in the importing unit

#### Scenario: A name bound as both a definition and a macro is rejected

- **WHEN** a library body contains both `(define f …)` and `(define-syntax f …)`
- **THEN** compilation reports a compile-time error naming `f`

### Requirement: Tree-shaking keeps a binding an exported macro's template reaches

The closed-world AOT tree-shake prunes a unit to the bindings the program reaches, nominating
candidates from the unit's export list. A binding reachable only through an **exported macro's
template** is not an export, so it SHALL be added to the candidate set from the compile-time
interface's record of the unit's own bindings its templates reference; otherwise the shake would drop
a binding the expansion references and the program would fail to link with an undefined symbol.

The reachability gate SHALL be unchanged: a candidate is kept only when the program's emitted IR
actually references it, so a program that imports the library without using the macro SHALL still have
the binding pruned.

#### Scenario: A private helper reached only through a macro survives the shake

- **WHEN** a program uses an imported macro whose template calls a private helper of the exporting
  library, and is built through the AOT tree-shaking path
- **THEN** the pruned unit still defines that helper and the program links and runs correctly

#### Scenario: An unused macro's helper is still pruned

- **WHEN** a program imports a library that exports such a macro but never uses the macro, and is
  built through the AOT tree-shaking path
- **THEN** the pruned unit does not define the helper, and the program links

## MODIFIED Requirements

### Requirement: Library definition and export surface

The compiler SHALL accept a `define-library` form naming a library `(p₁ … pₙ)` and
containing `(export …)` declarations and body definitions. Each `export` declaration lists
either a bare name `<name>` or a rename pair `(rename <internal> <external>)`. The
**internal** name (the bare name, or `<internal>` in a rename) MUST be a name the library
defines at its top level; exporting a name the library does not define SHALL be a
compile-time error. The **external** name (the bare name, or `<external>` in a rename) is the
spelling under which importers see the binding. `only`/`except`/`prefix` import-set transforms
remain out of scope.

**An export SHALL be a procedure, a value, or a macro.** A name bound by a `define-syntax` in the
library body counts as a name the library defines, and MAY appear in an `export` declaration — as a
bare name or as the `<internal>` of a rename. Its transformer travels in the library's compile-time
export interface rather than in the emitted unit, and an exported name that is neither a top-level
definition nor a `define-syntax` binding SHALL still be reported as a name the library does not
define.

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

#### Scenario: A library exports a macro it defines

- **WHEN** a `define-library` body binds `swap!` with `define-syntax` and declares `(export swap!)`
- **THEN** the library compiles without error, and it is not reported either as exporting a macro or
  as exporting a name the library does not define

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
`<lib>` visible in the importing unit under its external name: a runtime export resolved as an
`imported` binding, and a **macro** export merged into the importing compile's macro environment as a
transformer keyed on that external name. Import-set transforms (`only` / `except` / `prefix`) are out
of scope for this stage, so an import is all of a library's exports of both kinds or none.

An import spec that is an **import set** — a form whose head is `only`, `except`, `prefix`, or
`rename` — SHALL be rejected with a compile-time error naming the form and stating that imports are
whole-library, rather than being read as a library name. The error SHALL be the same on every path
that resolves imports, so the message for a given form does not depend on whether it was written in
a program or in a `define-library`.

`rename` SHALL be rejected only in **import** position. `(rename <internal> <external>)` remains
valid in an `export` declaration — for a macro export as for a procedure — so the rejection keys on
the declaration the form appears in, not on the keyword alone.

#### Scenario: An imported name becomes referenceable

- **WHEN** a program contains `(import (mylib))` and `mylib` exports `greet`
- **THEN** a reference to `greet` in the program resolves to the imported binding rather than
  reporting an unbound-variable error

#### Scenario: An imported macro keyword becomes usable

- **WHEN** a program contains `(import (mymac))` and `mymac` exports the macro `swap!`
- **THEN** a use of `(swap! a b)` expands rather than reporting an unbound variable

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

### Requirement: Library export table

Alongside the library unit the compiler SHALL produce a readable export table mapping each
export's **external** name to the **internal-name-based** mangled symbol. For a bare export the
external name equals the internal name; for `(rename <internal> <external>)` the table key is
`<external>` while the mangled symbol is derived from `<internal>`. A driver reading the table
together with the unit module SHALL have everything needed to resolve references into the library
with no access to the library's source.

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

The table SHALL further carry a **compile-time interface** — the library's exported macro
transformers, any private transformers those templates reach, and the mangled bindings the templates
reference, split into the unit's own bindings and other units'. The interface SHALL be readable data
requiring no evaluation, SHALL be written only to the export artifact and never into the emitted
unit, so that a standalone executable carries no compile-time payload, and SHALL be deterministic, so
that a library's interface is byte-identical however and wherever it is compiled.

A reader SHALL accept an export table written without a compile-time interface, treating it as a
library that exports no macro, so that an artifact produced before this change is read rather than
crashed on.

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

#### Scenario: The export table carries an exported macro's transformer

- **WHEN** `(mymac)` exporting the macro `swap!` is compiled
- **THEN** its export artifact records `swap!`'s transformer, and the emitted unit contains no
  representation of it

#### Scenario: An export table without a compile-time interface is still readable

- **WHEN** a driver reads an export table written in the pre-change shape
- **THEN** it resolves the library's runtime exports as before and treats the library as exporting no
  macro

#### Scenario: A macro-free library's unit is unchanged

- **WHEN** a library that exports no macro is recompiled after this change
- **THEN** its emitted IR is byte-for-byte identical to what it produced before

### Requirement: REPL door — import a library interactively

The interactive REPL SHALL obtain the standard library by registering the **baked set** at session
startup — not from the manifest — and SHALL run each registered member's initializer once, in
dependency order, before evaluating any user form. The manifest SHALL be consulted only for libraries
outside the baked set. A session started in a directory whose manifest names no member of the baked
set SHALL therefore have the standard library and the derived-form macros, and SHALL be able to load
a library that imports `(scheme base)`.

The REPL SHALL, on evaluating `(import (<lib>))`, resolve the library and its
transitive dependencies through the manifest, load each unit module into the running session
in dependency order, invoke each unit's `@"L:__init"` exactly once, and merge the imported
library's export table into the session scope so subsequent forms may reference the imported
names. A dependency that is a member of the baked set SHALL be satisfied by the registered member
rather than requiring a manifest entry.

The merge SHALL include the library's **compile-time interface**: its exported transformers SHALL
join the session's macro environment, and the names they reference SHALL join the session's known
bindings and environment, so that a form entered later may use an imported macro. Both SHALL persist
across forms for the life of the session, as an imported procedure does, and SHALL be restored with
the rest of the session state when a form's compilation fails and the session rolls back.

The REPL door SHALL remain **eager** over the manifest's remaining libraries: a session is an open
world in which any prompt may import anything, so the laziness of the run door does not apply.

#### Scenario: Imported procedure is callable in the REPL

- **WHEN** the user evaluates `(import (mylib))` and then calls `greet` in a later form
- **THEN** the REPL loads `mylib`, initializes it once, and the later form returns the value
  `greet` produces

#### Scenario: Imported macro is usable in a later form

- **WHEN** the user evaluates `(import (mymac))` and then, in a later form, uses the exported macro
  `swap!`
- **THEN** the form expands and evaluates, and the macro remains usable in every subsequent form

#### Scenario: A failed form does not lose an imported macro

- **WHEN** the user imports a macro-exporting library, then enters a form that fails to compile, then
  uses the macro again
- **THEN** the session rolls the failed form back and the macro still expands

#### Scenario: A transitive dependency is loaded and initialized in the REPL

- **WHEN** the user evaluates `(import (a))` where `(a)` imports `(b)`
- **THEN** the REPL loads both `b` and `a` in dependency order, initializes each once, and a
  later form calling an export of `(a)` that relies on `(b)` returns the expected value

#### Scenario: A session in a project directory has the standard library

- **WHEN** `emit repl` starts in a directory whose manifest names only that project's own libraries
- **THEN** a form calling a `(scheme base)` procedure such as `map` returns its value, and a
  derived form such as `cond` expands, with no warning that the standard library is unloaded

#### Scenario: A project library importing (scheme base) loads in the REPL

- **WHEN** a manifest names one project library whose source declares `(import (scheme base))`, and
  the user evaluates `(import (thatlib))`
- **THEN** the library's import of `(scheme base)` resolves against the registered baked member, the
  unit loads and initializes, and calling its export returns the expected value

#### Scenario: A substrate name stays out of scope in a session

- **WHEN** a REPL session starts with the prelude enabled and the user references an internal
  substrate name such as `rd-atom` without importing the substrate
- **THEN** the form reports an unbound variable, because registering a baked member does not
  auto-import one that nothing auto-imports

## REMOVED Requirements

### Requirement: A name an exported macro template mentions is exported under that spelling

**Reason**: The rule described a template that travels verbatim and is resolved in the importer's
scope, which forced a library to export every helper its templates mention and prohibited
`(rename …)` for those names. An exported macro's templates are now resolved in the exporting
library before the transformer leaves it, so a template may mention a private name and `(rename …)`
is safe. The part of the rule that still applies — the baked `(scheme base)` macro set, which is
merged as source and does resolve in the importer — is carried by the new requirement.

**Migration**: See *A macro that leaves its library is resolved in the library that defines it*. The
declared-surface convention of recording a template's helper as exported-but-unstable remains
correct for `(scheme base)` and is no longer required of a user library.
