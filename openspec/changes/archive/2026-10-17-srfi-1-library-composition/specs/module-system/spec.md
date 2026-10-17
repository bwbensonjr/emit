# Spec Delta

## MODIFIED Requirements

### Requirement: Library definition and export surface

The compiler SHALL accept a `define-library` form naming a library `(p₁ … pₙ)` and
containing `(export …)` declarations and body definitions. Each `export` declaration lists
either a bare name `<name>` or a rename pair `(rename <internal> <external>)`. The
**internal** name (the bare name, or `<internal>` in a rename) MUST be a name the library
defines at its top level, a runtime binding visible through its imports, **or a macro bound
in its compile-time environment, including one that arrived from an import**; exporting a
name absent from all three SHALL be a compile-time error. The **external** name (the bare name, or `<external>` in a rename) is the
spelling under which importers see the binding. Import sets SHALL select and rename the
bindings available for re-export under the ordinary import-set rules.

**An export SHALL be a procedure, a value, or a macro.** A name bound by a `define-syntax` in the
library body counts as a name the library defines, and MAY appear in an `export` declaration — as a
bare name or as the `<internal>` of a rename. Its transformer travels in the library's compile-time
export interface rather than in the emitted unit, and an exported name that is neither a top-level
definition, nor an imported runtime binding, nor a `define-syntax` binding, nor a macro the library imports SHALL still be reported
as a name the library does not define.

**The recognized declarations are the seven of R7RS §5.6.1** — `export`, `import`, `begin`,
`include`, `include-ci`, `include-library-declarations`, and `cond-expand`. A declaration the
compiler does not recognize SHALL be rejected, not absorbed into the body: it SHALL be a
compile-time error reporting that the form is not a library declaration at all, naming it. There is
no longer a class of recognized-but-unsupported library declaration.

The four splicing declarations SHALL be expanded **before** the remaining declarations are
interpreted, so that a declaration they produce is treated exactly as one written in place — in
particular, an `import` that arrives through `include-library-declarations` or `cond-expand` SHALL be
validated by the same import-spec check as one written directly, and SHALL contribute to the
library's imports.

A library body MAY contain, besides `define` and `define-syntax`, **commands** (expressions
evaluated for effect) and **`define-record-type`** declarations. Every body form SHALL be lowered;
no body form SHALL be discarded silently.

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
  but neither defines nor imports `missing`
- **THEN** compilation reports a compile-time error naming the undefined export

#### Scenario: A library exports a macro it defines

- **WHEN** a `define-library` body binds `swap!` with `define-syntax` and declares `(export swap!)`
- **THEN** the library compiles without error, and it is not reported either as exporting a macro or
  as exporting a name the library does not define

#### Scenario: Every R7RS library declaration is accepted

- **WHEN** a `define-library` contains `(include "body.scm")`, `(include-ci "old.scm")`,
  `(include-library-declarations "decls.scm")`, or `(cond-expand (r7rs (begin …)))`
- **THEN** the declaration is expanded rather than rejected, and the library compiles as though its
  contribution had been written in place

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

#### Scenario: A library exports a macro it imports

- **WHEN** a `define-library` declares `(export twice)`, does not define `twice`, and imports a
  library that exports it
- **THEN** the library compiles without error and importers see `twice` as a macro

### Requirement: Library artifact emission

Compiling a `define-library` SHALL emit an LLVM module (the library unit) that:
contains external-linkage globals for its own runtime definitions, named by the Stage 0
symbol namer (`@"p₁.….pₙ:x"`); represents a re-exported imported runtime binding through
its original owner's symbol without allocating or initializing a duplicate location; contains an initialization function `@"L:__init"` that runs the library's
top-level definitions to populate those globals and is guarded by a one-shot flag
(`@"L:__inited"`) so repeated calls run the body at most once; names the library's internal
top-levels and lifted code blocks through the same unit-qualified namer; and defines **no**
`@scheme_entry`. Library-free programs SHALL remain byte-identical to Stage 0 (only library
units carry the qualified names).

#### Scenario: The library unit exposes exports and an init, not an entry

- **WHEN** `(mylib)` exporting `greet` is compiled to its unit module
- **THEN** the module declares `@"mylib:greet"` with external linkage, defines `@"mylib:__init"`,
  and defines no `@scheme_entry`

#### Scenario: Init runs the body at most once

- **WHEN** `@"mylib:__init"` is called more than once
- **THEN** the library's top-level definitions execute on the first call only (the
  `@"mylib:__inited"` guard suppresses re-execution)

#### Scenario: A library-free program is unchanged

- **WHEN** a program that imports no library is compiled after this change
- **THEN** its emitted IR is byte-for-byte identical to the Stage 0 output

### Requirement: Library export table

Alongside the library unit the compiler SHALL produce a readable export table mapping each
export's **external** name to its binding's mangled symbol. For a locally defined export,
the symbol is derived from the exporting library and the internal name; for a re-exported
imported runtime binding, it is the original symbol obtained from the import interface.
For `(rename <internal> <external>)` the table key is `<external>` while the target is
resolved through `<internal>` in the exporting library's environment. A driver reading the table
together with the unit module SHALL have everything needed to resolve references into the library
with no access to the library's source.

For a locally defined export whose top-level initializer is a lambda, the table SHALL additionally record the
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

A re-exported imported procedure SHALL preserve its source interface's call descriptor,
including any optional minimum-arity entry, under the new external name. No descriptor
SHALL be invented for a binding whose source interface provides none.

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

A library that exports no macro SHALL produce an empty compile-time interface. Existing
libraries that do not re-export imported runtime bindings SHALL retain byte-identical emitted
units unless another requirement explicitly changes their compilation.

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

- **WHEN** a library exports a name that is neither one of its own top-level definitions, nor an imported runtime binding, nor a macro
  in its compile-time environment
- **THEN** compilation reports that the library does not define the name

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
  instead of becoming a call to a global named `+`.

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
macros, or a macro it imports from another library. Imported transformers SHALL retain
their defining library's resolved identifiers and transitive dependencies; carrying one
SHALL NOT resolve its body again in the forwarding library's environment. This rule applies
equally to baked and non-baked library imports.

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
- **THEN** the program uses the dependency supplied through the library's compile-time interface
  without defining a program-local copy of the transformer

#### Scenario: An exported template using an imported derived form retains its dependency

- **WHEN** a **program** imports a library whose exported macro's template uses `when` or `cond`
  imported by that library from `(scheme base)`
- **THEN** the dependency remains available through the compile-time interface and expands
  against its defining library's bindings even when the program hides that public keyword

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

#### Scenario: A library importer receives a derived form through its import

- **WHEN** a **library** imports a library whose exported macro's template uses `when` or `cond`
- **THEN** the derived form resolves through `(scheme base)`'s compile-time export interface rather
  than failing, because a library body now receives the derived forms from the library it imports
  them from

## ADDED Requirements

### Requirement: Runtime re-exports preserve the original binding
A library SHALL be able to re-export a visible imported runtime binding, under its
visible name or an export rename. The re-export SHALL denote the original location,
preserve valid call metadata, and remain an imported binding for assignment checks.
Local definitions SHALL retain precedence. This SHALL hold transitively on every
compilation path.

#### Scenario: A facade re-exports an imported value and procedure
- **WHEN** a facade imports a library's value and procedure and exports both without defining them
- **THEN** an importing program uses both through the facade, and its references target the
  original library's globals without duplicate facade globals

#### Scenario: Import and export renames compose
- **WHEN** a facade imports a procedure through nested selection and renaming sets, exports it
  under another name, and a program imports that name with a prefix
- **THEN** the final name denotes the original procedure, and excluded names remain unavailable

#### Scenario: A local definition wins over an imported binding
- **WHEN** a facade imports `f`, defines its own `f`, and exports `f`
- **THEN** the export denotes the facade's definition and uses only that definition's call metadata

#### Scenario: Re-exported state observes updates by its owner
- **WHEN** a library exports a value and an operation that changes that value's binding, and a
  facade re-exports both
- **THEN** reads through the facade observe owner updates, including replacement of a procedure,
  and assignment to that imported binding remains a compile-time error

#### Scenario: Call metadata survives a chain of facades
- **WHEN** a stable fixed or variadic procedure is re-exported through two facades
- **THEN** valid direct calls retain the original label and arity descriptor, including an optional
  minimum-arity entry, while a binding without a descriptor remains indirectly called

#### Scenario: A diamond shares one binding and initialization
- **WHEN** a program imports two facades over the same stateful owner library
- **THEN** both facades denote the same owner location, and the owner's initialization runs once

### Requirement: Imported macro dependencies survive library composition
An exported macro whose template uses an imported macro SHALL carry that dependency
and its transitive private transformers and runtime references in its compile-time
interface. Their original resolution SHALL survive forwarding, re-exporting, import
sets, and artifact serialization. Carried dependencies SHALL NOT become additional
public exports or depend on matching names at the eventual use site.

#### Scenario: A non-baked macro dependency reaches a third unit
- **WHEN** library A defines a macro using its private macro and runtime helper, library B imports
  A and exports a new macro using A's macro, and a program imports only B
- **THEN** B's macro expands and calls A's helper with no extra imports in the program

#### Scenario: Renamed and hidden macro dependencies retain their origin
- **WHEN** B imports A's macro under a renamed keyword, exports a macro using it, and a program
  imports only B's outer macro while defining a conflicting helper keyword
- **THEN** expansion uses A's transformer and private helpers, and A's public keyword is not
  introduced into the program's scope by carrying the dependency

#### Scenario: Multi-hop forwarding preserves resolved identifiers
- **WHEN** a facade re-exports B's outer macro and a program consumes the facade's saved artifact
- **THEN** expansion still uses A's bindings without adding the facade's prefix to resolved names

#### Scenario: Recursive helper dependencies are finite
- **WHEN** reachable helper transformers refer to one another recursively
- **THEN** the serialized interface contains a finite dependency closure and a terminating macro
  use expands normally without repeated forwarding changing its bindings

#### Scenario: Runtime helpers survive standalone compilation
- **WHEN** a built program uses a macro whose imported dependency references a private runtime helper
- **THEN** the linked executable retains the helper and any required closure environment, with
  the same output as interactive execution

### Requirement: Portable SRFI sources work through reusable library artifacts
Emit SHALL compile pinned, unmodified SRFI 1 and SRFI 227 sources from a conventional
library root. Uses SHALL agree through Chez, `emit run`, delivered `emit build`
executables, and `emit repl`. Focused/SRFI artifacts and supporting libraries SHALL
match Chez's full IR and readable interfaces, except that `(scheme base)` requires
interface parity only (#125). Normal cache reuse SHALL preserve behavior.

#### Scenario: SRFI 1 list procedures work through a prefixed import
- **WHEN** a program imports `(prefix (srfi 1) s1:)` and exercises `s1:fold`, `s1:filter`,
  `s1:append-map`, and a re-exported accessor
- **THEN** every supported compilation path produces the same expected results from the
  unmodified package sources

#### Scenario: SRFI 227 optional arguments exercise imported macro dependencies
- **WHEN** a program uses SRFI 227's `opt-lambda` with omitted and supplied optional arguments,
  and uses a SRFI 1 procedure implemented with it
- **THEN** all paths agree on default and supplied argument behavior without a package-local workaround

#### Scenario: Normal cache reuse preserves package behavior
- **WHEN** the SRFI acceptance program warms a dedicated native cache and is run and imported
  at the REPL again from an unrelated working directory
- **THEN** the existing unit-cache entries are reused and the output is unchanged

#### Scenario: Hosts agree on the full library interface
- **WHEN** the same source closure is compiled whole by the Chez driver and the embedded compiler
- **THEN** each focused fixture, SRFI unit, and supporting library's full unit IR,
  with host-added target headers normalized identically, and readable export
  interface are byte-identical
- **AND** `(scheme base)` has a byte-identical readable export interface; its full-IR
  ordering discrepancy is tracked separately in #125

#### Scenario: The delivered executable runs independently
- **WHEN** the built acceptance executable is moved outside the source and artifact directories
  and run without library search configuration
- **THEN** it produces the expected output without Emit, Chez, package sources, or compile-time
  interfaces being required at runtime
