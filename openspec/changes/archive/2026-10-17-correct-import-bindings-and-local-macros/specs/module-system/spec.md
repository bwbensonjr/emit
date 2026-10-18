# Spec Delta

## MODIFIED Requirements

### Requirement: Typed binding resolution

Identifier resolution SHALL distinguish lexical and unit-owned variables, imported runtime
bindings, integrated primitives, core syntax, auxiliary syntax, and transformers by binding
identity. Lexical bindings and the unit's own definitions SHALL take precedence over a valid
import environment. In ordinary source, primitive and syntax bindings SHALL be available only
through that environment, including the implicit base import; spelling alone SHALL NOT restore
hidden bindings. The explicit no-prelude compiler environment SHALL retain its built-in
primitive and core syntax facilities.

#### Scenario: A program's own top-level define resolves as local

- **WHEN** a program references a name it defines at top level
- **THEN** resolution classifies the binding as `local`
- **AND** the emitted reference targets the same global the flat model produced

#### Scenario: A primitive resolves as primitive

- **WHEN** a program references an available integrated primitive such as `car`
- **THEN** resolution classifies it as `primitive` and emits the same intrinsic as before

#### Scenario: A core keyword resolves as syntax

- **WHEN** an identifier resolves to the imported core syntax binding for `if`
- **THEN** it is classified as core syntax and lowered as a conditional, not as a runtime variable

#### Scenario: An unbound identifier still errors

- **WHEN** a program references a name with no available variable, primitive, syntax, or transformer binding
- **THEN** resolution reports an unbound-variable error, as it did before

#### Scenario: A hidden built-in does not reappear through fallback

- **WHEN** a program imports `(except (scheme base) car)` and references `car` without defining it
- **THEN** resolution reports an unbound identifier rather than restoring the integrated primitive

#### Scenario: Local bindings shadow syntax aliases

- **WHEN** a program imports core syntax under an alias and binds that alias as a lexical procedure
- **THEN** its use in that lexical scope calls the procedure rather than invoking core syntax


### Requirement: Library definition and export surface

The compiler SHALL accept a `define-library` form naming a library `(p₁ … pₙ)` and
containing `(export …)` declarations and body definitions. Each `export` declaration lists
either a bare name `<name>` or a rename pair `(rename <internal> <external>)`. The
**internal** name (the bare name, or `<internal>` in a rename) MUST be a name the library
defines at its top level, a runtime binding visible through its imports, an imported primitive
or core/auxiliary syntax binding, **or a macro bound in its compile-time environment, including
one that arrived from an import**; exporting a name absent from these categories SHALL be a compile-time error. The **external** name (the bare name, or `<external>` in a rename) is the
spelling under which importers see the binding. Import sets SHALL select and rename the
bindings available for re-export under the ordinary import-set rules.

**An export SHALL denote a runtime binding, a primitive, core or auxiliary syntax, or a macro.** A name bound by a `define-syntax` in the
library body counts as a name the library defines, and MAY appear in an `export` declaration — as a
bare name or as the `<internal>` of a rename. Its transformer travels in the library's compile-time
export interface rather than in the emitted unit, and an exported name that is neither a top-level
definition, nor an imported runtime binding, nor a `define-syntax` binding, nor any imported primitive, syntax, or macro binding SHALL still be reported
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

Library bodies SHALL support internal `define-syntax`, `let-syntax`, and `letrec-syntax` with
the lexical scope and hygiene specified by `macro-system`. Local syntax bindings SHALL NOT
become public exports merely because they occur inside a library body.

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

### Requirement: Import surface

The compiler SHALL accept `(import ⟨import set⟩ …)`, where an import set is a library name or one of
the R7RS transforms `only`, `except`, `prefix`, and `rename` applied to another import set. A bare
library name SHALL make every export of the library visible in the importing unit under its
external name, preserving whether it denotes a runtime binding, integrated primitive,
core or auxiliary syntax, or macro transformer. A transform SHALL select and rename those
same exports without changing their original binding identities.

`rename` SHALL have its import-set meaning only in **import** position. `(rename <internal>
<external>)` remains an `export` specification in an `export` declaration — for a macro export as
for a procedure — so the form's meaning keys on the declaration it appears in, not on the keyword
alone.

#### Scenario: An imported name becomes referenceable

- **WHEN** a program contains `(import (mylib))` and `mylib` exports `greet`
- **THEN** a reference to `greet` in the program resolves to the imported binding rather than
  reporting an unbound-variable error

#### Scenario: An imported macro keyword becomes usable

- **WHEN** a program contains `(import (mymac))` and `mymac` exports the macro `swap!`
- **THEN** a use of `(swap! a b)` expands rather than reporting an unbound variable

#### Scenario: An import set is accepted in a program

- **WHEN** a program contains `(import (only (scheme inexact) sqrt))` and calls `(sqrt 16.0)`
- **THEN** it compiles and produces `4.0`, and does not report the form as an unsupported import
  set or as a library missing from the manifest

#### Scenario: An import set is accepted inside a library

- **WHEN** a `define-library` contains `(import (only (scheme inexact) sqrt))` and its body uses
  `sqrt`
- **THEN** the library compiles, and its dependency on `(scheme inexact)` participates in import
  resolution on every path

#### Scenario: A renamed export is unaffected

- **WHEN** a `define-library` declares `(export (rename %fast-map map))` and imports no library
- **THEN** the library compiles without error, and the `rename` is read as an export
  specification rather than an import set

### Requirement: Import sets select and rename exports in the importer

`(only s id …)` SHALL keep just the named exports of `s`, `(except s id …)` SHALL drop them,
`(prefix s p)` SHALL prepend `p` to every name, and `(rename s (a b) …)` SHALL rename `a` to `b`.
Sets SHALL nest. A transform SHALL apply to runtime, primitive, core syntax, auxiliary syntax,
and macro exports alike, SHALL run in the importer over the library's existing compile-time
interface, and SHALL NOT change any library artifact. Every path SHALL produce the same bindings
for a given import set. An absent name SHALL be rejected against the actual library's published
surface; belonging to the `(scheme ...)` namespace SHALL NOT publish unrelated built-ins.

#### Scenario: `except` hides a name

- **WHEN** a program contains `(import (except (mylib) helper))`, `mylib` exports `greet` and
  `helper`, and the program calls `greet`
- **THEN** `greet` resolves, and a reference to `helper` is reported as unbound

#### Scenario: `prefix` renames every export

- **WHEN** a program contains `(import (prefix (mylib) m:))` and calls `(m:greet)`
- **THEN** the call resolves to `mylib`'s `greet` and an unprefixed `greet` is unbound

#### Scenario: `rename` renames one export

- **WHEN** a program contains `(import (rename (mylib) (greet hello)))` and calls `(hello)`
- **THEN** the call resolves to `mylib`'s `greet`, and `greet` itself is unbound

#### Scenario: Import sets nest

- **WHEN** a program contains `(import (prefix (only (mylib) greet) m:))`
- **THEN** exactly `m:greet` is visible from `mylib`

#### Scenario: A macro export is renamed with its library

- **WHEN** a program contains `(import (prefix (mymac) k:))` and `mymac` exports the macro `swap!`
  whose template calls a private helper of `mymac`
- **THEN** `(k:swap! a b)` expands and runs correctly, and `swap!` alone is not a keyword in the
  program

#### Scenario: A set naming an absent export is an error

- **WHEN** a program contains `(import (only (mylib) no-such-name))`
- **THEN** compilation reports that `no-such-name` is not exported by `(mylib)`, naming the import
  set, on every path

#### Scenario: A malformed import set is an error

- **WHEN** a program contains `(import (prefix (mylib)))` or `(import (rename (mylib) greet))`
- **THEN** compilation reports the import set as malformed, naming it, rather than reading it as a
  library name

#### Scenario: The REPL imports through a set

- **WHEN** a REPL session evaluates `(import (only (mylib) greet))` and then `(greet)`
- **THEN** the call returns what the batch path returns, and a later reference to `helper` is
  reported as unbound

#### Scenario: Prefixed primitives work in call and value positions

- **WHEN** a program imports `(prefix (scheme base) b:)` and evaluates `(b:car (b:quote (1 2)))`, `(b:map b:car (b:quote ((1) (2))))`, and `(b:apply b:+ (b:quote (1 2 3)))`
- **THEN** the results are `1`, `(1 2)`, and `6`, retaining primitive call and first-class value behavior
- **AND** unprefixed `car` and `+` are unavailable unless introduced separately

#### Scenario: Core definition and binding forms can be renamed

- **WHEN** a program imports `(prefix (scheme base) b:)` and uses `b:define`, `b:lambda`, `b:let`, `b:if`, `b:set!`, and `b:quote`
- **THEN** they behave as their original bindings, including definition discovery and assignment checks
- **AND** unprefixed core keywords do not become usable through spelling alone

#### Scenario: Quoted symbols are data

- **WHEN** a program with a prefixed base import evaluates `(b:quote (car if b:car))`
- **THEN** the datum is exactly `(car if b:car)`, without imported aliases rewriting its symbols

#### Scenario: Auxiliary syntax follows binding identity

- **WHEN** a program renames `cond`, `else`, and `=>` through an import set and uses the aliases together
- **THEN** the clauses retain their original meaning, and a distinct lexical binding of an auxiliary alias does not match that literal

#### Scenario: A different standard library does not publish base syntax

- **WHEN** a source imports `(only (scheme inexact) define car)`
- **THEN** the import is rejected because those names are not exported by `(scheme inexact)`

#### Scenario: Primitive and syntax bindings can be re-exported

- **WHEN** a facade imports renamed base primitive and core syntax bindings, exports them under new names, and an importer consumes its saved artifact
- **THEN** the final aliases denote the original primitive and syntax bindings without runtime wrapper globals


### Requirement: Overlapping imports resolve deterministically

After import transforms, exposing different bindings under the same visible identifier SHALL
be a compile-time error naming the identifier and both contributing libraries/import views,
independent of import order or binding kind. Repeated imports of the same original binding SHALL
be legal. Conflicts SHALL be checked before local-definition precedence, including collisions
created within one import set. Every compilation path SHALL enforce this rule.

#### Scenario: Two libraries export one name

- **WHEN** a program imports `(liba)` and `(libb)`, both export `f` with different definitions, and
  the program calls `f`
- **THEN** compilation fails with an import-conflict diagnostic naming `f`, `(liba)`, and `(libb)`, including when the unit also defines its own `f`

#### Scenario: A diamond imports one original binding twice

- **WHEN** two facades re-export the same owner's runtime binding or transformer, including through renames, and both expose it under one final name
- **THEN** the imports are accepted and initialization remains once-only

#### Scenario: Equal transformer text does not imply the same binding

- **WHEN** two libraries independently define identical `syntax-rules` transformers and expose them under the same imported keyword
- **THEN** the imports conflict, even though their transformer data is structurally equal

#### Scenario: Cross-kind and within-set conflicts are rejected

- **WHEN** a procedure and macro, or primitive and core syntax, receive the same visible name, or a rename maps an export onto a different retained binding's name
- **THEN** the compiler reports an import conflict before expansion or execution

#### Scenario: A rejected REPL import preserves session state

- **WHEN** an import conflicts with an existing explicit session import
- **THEN** the REPL rejects the complete import transaction before initializing the requested closure or publishing names
- **AND** earlier bindings, transformers, call metadata, and initialization state remain usable


### Requirement: A macro that leaves its library is resolved in the library that defines it

An exported transformer SHALL preserve the binding identity and lexical context of its
definition-site references, including runtime bindings, primitives, core syntax, auxiliary
syntax, literal identifiers, and private or imported transformers. Template binders SHALL be
distinguished from free references, and pattern substitutions SHALL retain their use-site
context. A template's lexical binding SHALL take precedence over a same-spelled library global
or built-in. Unbound free references SHALL remain unbound rather than capturing importer bindings.

Private references SHALL NOT widen the public surface. Quoted data SHALL preserve its source
symbols. Literal identifiers SHALL compare by binding identity at definition and use sites,
including aliases of the same binding and equal-spelled identifiers with different bindings.

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

Compile-time interfaces SHALL preserve deterministic origin identities and lexical context,
so identical full-library inputs produce byte-identical interfaces across hosts and fresh
processes. Expansion-local fresh identities SHALL NOT become nondeterministic serialized state.

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
- **THEN** the literal retains that library's `else` binding identity, matches an alias of that binding, and does not match a different binding merely spelled `else`

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

### Requirement: Implicit import of (scheme base)

Unless `--no-prelude` is given, the compiler SHALL make the prelude available to a user
program (and REPL session) without an explicit import, as though it began with `(import
(scheme base))`: the prelude procedures resolve to `(scheme base)` and the derived-form macro
set is merged into the compile's `macro-env`. This SHALL hold identically on all three paths —
the Chez batch driver, the REPL, and the Chez-free embedded runner (`scheme-run` /
`scheme-compile`): on each, the procedures resolve as imported bindings referencing `scheme.base`
external globals and `scheme.base.ll` is linked/loaded/concatenated into the result. On the
Chez-free embedded runner, `(scheme base)` is compiled from the compiler's baked-in prelude
source with no filesystem access, so the runner re-homes rather than prepends. A name the
program defines itself SHALL take precedence over the auto-imported one (user-wins shadowing, per
the Stage 0 resolution order).

When a program's own imports include explicit views of `(scheme base)`, their union SHALL be
the program's whole view of `(scheme base)`: the implicit import SHALL NOT also make the
library's other exports visible. `(scheme base)` is still linked or loaded and
initialized exactly as for the implicit import. A bare `(import (scheme base))` is the same view as
the implicit one and changes nothing.

#### Scenario: A program uses prelude procedures with no explicit import

- **WHEN** a program that references only prelude procedures (e.g. `(map (lambda (x) (+ x 1))
  '(1 2 3))`) is compiled without `--no-prelude` and without any `import`
- **THEN** it builds and runs; on every path the prelude procedures resolve to
  `(scheme base)` exports and `scheme.base.ll` is linked/loaded/concatenated into the result

#### Scenario: A derived-form macro works without a prepended prelude

- **WHEN** a program uses `cond`/`case`/`when` without `--no-prelude` on any path
- **THEN** the derived-form macro expands correctly (its expansion's procedure calls resolve
  to `(scheme base)` exports) and the program produces the expected value

#### Scenario: A user definition shadows an auto-imported prelude name

- **WHEN** a program defines its own top-level `map` while the prelude is enabled
- **THEN** references to `map` resolve to the program's own definition, not the `(scheme base)`
  export

#### Scenario: --no-prelude skips both halves

- **WHEN** a program is compiled `--no-prelude` (on any path, including the embedded runner)
- **THEN** `(scheme base)` is not auto-imported, the derived-form macros are not merged, and a
  reference to a runtime prelude procedure or derived macro is an unbound/undefined error
- **AND** the explicit compiler environment retains core syntax and integrated primitives

#### Scenario: The embedded runner re-homes the prelude like the Chez driver

- **WHEN** a prelude-using program is compiled by the Chez-free embedded runner
  (`scheme-run --emit`) and by the Chez batch driver, both with the prelude enabled
- **THEN** both resolve prelude procedures through `(scheme base)` and emit byte-identical
  program IR — the embedded runner assembles `(scheme base)` from baked-in prelude source
  instead of reading `lib/scheme/base.sld` from disk

#### Scenario: An explicit import set narrows the implicit import

- **WHEN** a program contains `(import (except (scheme base) map))` and references `map` without
  defining it
- **THEN** compilation reports `map` as unbound, on every path

#### Scenario: A prefixed (scheme base) is the program's only spelling

- **WHEN** a program contains `(import (prefix (scheme base) b:))` and evaluates
  `(b:map (b:lambda (x) (b:+ x 1)) (b:quote (1 2)))`
- **THEN** the program produces `(2 3)`, and an unprefixed reference to `map` is reported as unbound
- **AND** integrated primitives and core syntax are available under their prefixed names only, unless another import or local binding supplies a bare name

#### Scenario: Explicit base views replace the implicit view together

- **WHEN** a program explicitly imports multiple sets over `(scheme base)`
- **THEN** the union of those explicit views replaces the implicit binding view, with duplicate and conflicting names checked normally

#### Scenario: A REPL replaces its implicit base view

- **WHEN** a session's first explicit base import uses a prefix or selection set
- **THEN** its complete explicit view replaces the implicit view for subsequent forms while existing compiled procedures retain their resolved bindings
- **AND** additional explicit imports accumulate subject to conflict validation


### Requirement: The public surface of (scheme base) is declared, not derived

The set of names each shipped library exports SHALL be **declared** in a single artifact of the
tree, and SHALL NOT be a mechanical consequence of which definitions the prelude happens to contain.
The declaration SHALL be a **partition**: it assigns each prelude definition to the library that
exports it, or marks it as belonging to no export list. A prelude definition that is not part of any
declared surface SHALL remain in its library's **body** — the exported procedures call it — while
being absent from the `export` list, so it is neither in scope in a program that imports the library
nor part of the published surface.

The partition MAY assign one definition to **more than one** library, which SHALL emit an
independent definition into each. This is the mechanism by which a name can serve both an internal
consumer and a standard library without either re-exporting the other's binding.

Which library's **body defines** a name and which library's **export list publishes** it SHALL be
separate questions, decidable independently **per library**: the declaration SHALL be able to assign a
definition to a library that defines it without exporting it. A library or program may import two members at once, and distinct bindings exposed under one
name SHALL conflict, so a member that needs a name only for its own body SHALL be able to keep it
out of its export list. Integrated primitive and core/auxiliary syntax publication SHALL also
have explicit library ownership, without inventing runtime definitions for those bindings.

Every derivation of an export list SHALL read that one declaration, so the Chez-hosted driver (which
resolves the committed `.sld` files) and the Chez-free portable derivation (which builds the baked
set from the compiler's baked-in prelude source) SHALL produce **identical export lists in identical
order** for every library they both derive. The order SHALL be the prelude's own definition order, so
the declaration's internal arrangement cannot affect emitted IR.

Adding a prelude definition SHALL force a visibility decision: a definition that is neither assigned
to a library nor declared as belonging to no export list SHALL fail a test that runs in the default
suite (one that does not require Chez), rather than defaulting to public. A declaration that has
rotted — a name assigned to a library the prelude no longer defines, a name that is a macro, a
duplicated export, or an assignment to a library that does not exist — SHALL be reported as an error
rather than silently producing a different surface.

The declared surface SHALL distinguish the tiers that make a name's status legible: names
R7RS-small defines, and **extensions**, which Emit adds with no R7RS home. A name exported only
because some consumer outside the library must resolve it SHALL record the reason it is exported;
the compiler is not such a consumer, since it imports the internal substrate directly rather than
reaching internals through `(scheme base)`.

The non-R7RS list extensions `filter`, `fold-right`, and `iota` SHALL be exported by
`(emit list)`, not by `(scheme base)`. The compiler SHALL retain its internal access
without adding these extensions to the implicit user environment.

#### Scenario: Emit list extensions require an explicit import

- **WHEN** a program imports `(scheme base)` and `(emit list)`
- **THEN** `filter`, `fold-right`, and `iota` retain their existing Emit behavior
- **AND** those names are not exported by `(scheme base)` alone

#### Scenario: Standard base and SRFI 1 imports do not conflict

- **WHEN** an unchanged pinned package imports `(scheme base)` and `(srfi 1)`
- **THEN** the three list names denote the SRFI 1 bindings without an import conflict
- **AND** importing distinct Emit and SRFI 1 versions under the same visible names still conflicts

#### Scenario: An internal helper is not in scope in a user program

- **WHEN** a program with no explicit import references a prelude-internal name such as `rd-atom`
  or `%map1`, and is compiled on any path
- **THEN** compilation fails with an unbound-variable error, while a program referencing a public
  name such as `map` in the same position still compiles and runs

#### Scenario: A new prelude definition cannot become public by accident

- **WHEN** a definition is added to the prelude and is neither assigned to a library's surface nor
  declared as belonging to none
- **THEN** the default (Chez-free) test suite fails, and the author's only ways forward are to
  declare the definition internal or to commit the diff that publishes it

#### Scenario: A rotted declaration is an error, not a silent surface change

- **WHEN** an export list is generated while the declaration assigns a name the prelude does not
  define, names a `define-syntax`, would yield a duplicate export, or names an unknown library
- **THEN** generation fails with a message naming the offending names

#### Scenario: The two derivations agree

- **WHEN** the same program is compiled by the Chez-hosted driver and by the Chez-free portable
  derivation
- **THEN** both resolve each shipped library against the same export list in the same order, and the
  emitted program module is byte-identical between the two paths

#### Scenario: A private binding still serves the procedures that call it

- **WHEN** an exported procedure whose implementation calls a private helper (e.g. the reader's
  entry point over its lexeme helpers) is called from an importing program
- **THEN** it behaves exactly as before, because the helper is present in the library body or in the
  substrate the library imports, and those calls resolve without a public export

#### Scenario: A definition assigned to two libraries is emitted into both

- **WHEN** the partition assigns one definition to both an internal library and a standard one
- **THEN** each library's emitted unit defines it independently, and neither re-exports the other's
  binding

### Requirement: Library export table

Alongside the library unit the compiler SHALL produce a readable export interface.
Runtime export rows SHALL map external names to original owner globals; locally defined
runtime exports use the defining unit's mangled symbols, while re-exports retain the original
target. Renaming changes the key only. Primitive, core syntax, and auxiliary syntax exports
SHALL instead record their binding kinds and original identities in compile-time metadata,
without inventing runtime globals. An importer SHALL resolve every binding kind from the
interface without access to the library's source.

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

A reader SHALL accept a legacy runtime-only export table without a compile-time interface,
treating it as a library that exports no macros or explicit primitive/syntax metadata.
Existing three-field procedure call rows SHALL retain their fixed-arity meaning and existing
variadic descriptors SHALL retain their meaning. An older macro interface lacking the context
needed for hygienic expansion SHALL be rebuilt from source or rejected with a named rebuild
diagnostic, never interpreted using guessed binding identities.

A library that exports no macro, primitive, or syntax binding SHALL need no transformer or syntax payload in its compile-time interface. Existing
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

- **WHEN** a library exports a name that is neither one of its own top-level definitions, nor an imported runtime, primitive, or core/auxiliary syntax binding, nor a macro
  in its compile-time environment
- **THEN** compilation reports that the library does not define the name

## ADDED Requirements

### Requirement: Compile-time interfaces preserve original binding identity

Library artifacts SHALL retain the original identity and required definition context of every
published binding, independently of alias spelling and forwarding library. Macro origin identity
SHALL distinguish independent definitions and survive re-exports and artifact round trips.
Compile-time context SHALL remain absent from delivered runtime payloads.

#### Scenario: Artifact-only imports retain identity

- **WHEN** facades are compiled, their interfaces are saved, and a fresh compiler consumes those interfaces
- **THEN** same-origin re-exports remain equal bindings and independently defined bindings remain distinct
- **AND** macro literals and private helper references resolve as they did before serialization

#### Scenario: Repeated compilation is deterministic

- **WHEN** Chez and the native compiler compile the same full library closure in fresh processes
- **THEN** their readable compile-time interfaces and normalized full unit IR are byte-identical

#### Scenario: Older interface formats fail safely when context is insufficient

- **WHEN** an older interface lacks the origin or lexical context needed for a macro
- **THEN** the compiler rebuilds it from available source or reports a named incompatibility requiring rebuild
- **AND** it does not guess binding equality or silently expand using the importer's scope

