# module-system Specification

## Purpose

Defines the compiler's separate-compilation foundation: how free identifiers are resolved
into typed bindings (local, imported, or primitive), how a compilation unit's own emitted
symbols are named through a deterministic, unit-parameterized function so that separately
compiled units do not collide at link time, and the byte-identity guarantee that this
scaffolding introduces no behavior change for programs that import no library. It covers the
Modules v0 design's separate compilation of `define-library` units into artifacts that are
both linked into an AOT executable and loaded into the REPL: the library/export/import
surface (including export-rename), transitive lib→lib imports with topological dependency
ordering and diamond-safe one-time initialization, and stale-artifact rebuild driven by a
readable manifest.
## Requirements
### Requirement: Typed binding resolution

Free-identifier resolution SHALL classify every resolved binding by a kind — `local` (the
current unit's own top-level definition), `imported` (another unit's export), or `primitive`
(a built-in operator/keyword) — resolving lexical locals first, then the unit's own
top-level definitions, then imported bindings, then primitives, and otherwise reporting an
unbound-variable error. In this change no imported bindings exist yet; the resolution
results for any program that imports no library SHALL be identical to the prior flat model.

#### Scenario: A program's own top-level define resolves as local

- **WHEN** a program references a name it defines at top level
- **THEN** resolution classifies the binding as `local`
- **AND** the emitted reference targets the same global the flat model produced

#### Scenario: A primitive resolves as primitive

- **WHEN** a program references a built-in operator or keyword (e.g. `car`, `if`)
- **THEN** resolution classifies it as `primitive` and emits the same intrinsic as before

#### Scenario: An unbound identifier still errors

- **WHEN** a program references a name that is neither local, imported, nor primitive
- **THEN** resolution reports an unbound-variable error, as it did before

### Requirement: Deterministic module-qualified symbol naming

The compiler SHALL name a compilation unit's own emitted symbols — top-level globals and
lifted code-block labels — through a deterministic, unit-parameterized function. For a
library named `(p₁ p₂ … pₙ)` and an internal name `x`, the function SHALL produce the symbol
`p₁.p₂.….pₙ:x`, a pure function of the library name and the internal name with no dependence
on compile order or counters. The **program** (non-library) unit SHALL use the empty prefix,
so its emitted symbol names are unchanged from today.

#### Scenario: Library name maps to a canonical symbol

- **WHEN** the naming function is applied to library `(scheme base)` and internal name `map`
- **THEN** it returns the symbol string `scheme.base:map`

#### Scenario: The same input always yields the same symbol

- **WHEN** the naming function is applied twice to the same `(library, name)` pair, in
  separate compilations
- **THEN** it returns the identical symbol both times (no counter or order dependence)

#### Scenario: Program-unit symbols are unprefixed

- **WHEN** a lifted code block or top-level global is emitted for the program unit (no
  enclosing library)
- **THEN** its symbol name is exactly what the pre-change compiler emitted (empty prefix)

### Requirement: Scaffolding preserves emitted IR

Introducing the typed-scope resolver and the unit-parameterized naming SHALL NOT change the
LLVM IR emitted for any program that imports no library **and** is compiled `--no-prelude`.
The compiler's own regenerated IR (`bootstrap/*.ll`) SHALL remain a stable self-hosting fixed
point after any change. Re-homing the prelude as `(scheme base)` intentionally changes the
emitted IR of a prelude-enabled program (its prelude procedures become imported externals and
`scheme.base.ll` is linked/loaded); such a program's observable **behavior** (its printed
value) SHALL be unchanged.

#### Scenario: Library-free, prelude-free programs emit byte-identical IR

- **WHEN** a program that imports no library is compiled `--no-prelude` before and after a
  change
- **THEN** the emitted `.ll` is byte-for-byte identical

#### Scenario: A prelude-using program's behavior is preserved across the re-home

- **WHEN** a demo that relies on prelude procedures is compiled and run before and after
  re-homing the prelude as `(scheme base)`
- **THEN** it prints the same value both times, even though its emitted IR changed

#### Scenario: Existing suites and the trust-check pass

- **WHEN** `run-all-tests.sh` and `run-dev-tests.sh` are run after `make regen`
- **THEN** all suites pass, including self-emission-equivalence and the anti-stale
  trust-check (regenerated committed IR is reproduced byte-for-byte from source)

### Requirement: Library definition and export surface

The compiler SHALL accept a `define-library` form naming a library `(p₁ … pₙ)` and
containing `(export …)` declarations and body definitions. Each `export` declaration lists
either a bare name `<name>` or a rename pair `(rename <internal> <external>)`. The
**internal** name (the bare name, or `<internal>` in a rename) MUST be a name the library
defines at its top level **or a macro bound in its compile-time environment, including one that
arrived from an import**; exporting a name that is neither SHALL be a compile-time error. The **external** name (the bare name, or `<external>` in a rename) is the
spelling under which importers see the binding. `only`/`except`/`prefix` import-set transforms
remain out of scope.

**An export SHALL be a procedure, a value, or a macro.** A name bound by a `define-syntax` in the
library body counts as a name the library defines, and MAY appear in an `export` declaration — as a
bare name or as the `<internal>` of a rename. Its transformer travels in the library's compile-time
export interface rather than in the emitted unit, and an exported name that is neither a top-level
definition, nor a `define-syntax` binding, nor a macro the library imports SHALL still be reported
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
  but defines no top-level `missing`
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

### Requirement: A library body may be included from other files

The compiler SHALL accept `(include ⟨string⟩ …)` and `(include-ci ⟨string⟩ …)` as library
declarations. Each names a file whose top-level forms SHALL be spliced into the library body at the
position of the declaration, in the order the filenames appear, exactly as if those forms had been
written inside a `begin` declaration there. `include-ci` SHALL additionally fold the symbol case of
the forms it reads, so that source written for a case-insensitive Scheme reads correctly.

**The fold SHALL happen while the file is being read**, not over the forms reading returned, so that
R7RS §7.1.1's distinction survives it: an identifier written **between vertical bars** SHALL NOT be
folded — the characters between the bars are the symbol's name literally — while every unquoted
identifier SHALL be. The fold SHALL reach every symbol the file produces, including symbols inside
vector and bytevector literals and inside quoted structure. (The vector case is verified at the
reader rather than through a library, because a quoted vector cannot currently be lowered as a
constant at all — an unrelated gap, GitHub issue #64.)

Both compilation paths SHALL implement this rule and SHALL agree on it for ASCII source. Case folding outside
ASCII is **not** guaranteed to agree between paths and is a recorded limit, not a promise.

An included form SHALL be subject to every rule a directly written body form is subject to —
definitions, `define-syntax`, `define-record-type`, and commands all behave identically, and source
order across the splice is preserved.

#### Scenario: A library body is included from a file

- **WHEN** a `define-library (mylib)` declares `(export greet)` and `(include "greet.scm")`, and
  `greet.scm` defines `greet`
- **THEN** the library compiles without error and importers see `greet`

#### Scenario: Included forms keep source order relative to the body

- **WHEN** a library body contains a definition, then `(include "more.scm")`, then a command that
  references a name `more.scm` defines
- **THEN** the command observes the included definition, because the splice happens at the position
  of the declaration

#### Scenario: `include-ci` folds case

- **WHEN** an included file names `(DEFINE (Greet) ...)` and the declaration is `(include-ci …)`
- **THEN** the form is read as `(define (greet) …)` and the library defines `greet`

#### Scenario: `include-ci` does not fold a bar-quoted identifier

- **WHEN** an included file contains `(define (|MixedCase|) 1)` and the declaration is
  `(include-ci …)`
- **THEN** the library defines `MixedCase`, not `mixedcase`, and a body form that calls
  `(|MixedCase|)` resolves to it

#### Scenario: A bar-quoted name survives while its body still folds

- **WHEN** an included file contains `(DEFINE (|KeepCase|) (QUOTE KEPT))` and the declaration is
  `(include-ci …)`
- **THEN** the library defines `KeepCase` and calling it yields the symbol `kept` — the name is
  left literal and the unquoted identifiers around it are folded

#### Scenario: both paths fold an included file identically

- **WHEN** a library whose `include-ci` file mixes unquoted mixed-case and bar-quoted ASCII
  identifiers is compiled by the Chez driver and by the shipped compiler
- **THEN** both produce the same names, and the emitted IR agrees byte for byte where the existing
  cross-path equivalence checks compare it

#### Scenario: The same source includes identically on every path

- **WHEN** a library using `include` is compiled by the Chez driver, by `emit lib`, by `emit run`
  through the manifest, and by the REPL's library loader
- **THEN** all paths produce the same unit, and the emitted IR agrees byte for byte where the
  existing cross-path equivalence checks compare it

### Requirement: Library declarations may be included from another file

The compiler SHALL accept `(include-library-declarations ⟨string⟩ …)`. Each named file's top-level
forms SHALL be spliced at the position of the declaration and interpreted as **library
declarations**, not as body forms — so an included file MAY contribute `export`, `import`, `begin`,
or a further splicing declaration. Splicing SHALL be recursive: a declaration produced by an
inclusion is expanded on the same terms as one written in the `define-library`.

#### Scenario: A shared export list lives in its own file

- **WHEN** two libraries each declare `(include-library-declarations "exports.scm")` and that file
  contains `(export a b c)`
- **THEN** both libraries export `a`, `b`, and `c`

#### Scenario: An included import is a real import

- **WHEN** an included declarations file contains `(import (scheme inexact))` and the library body
  calls `sqrt`
- **THEN** the import resolves as though written in the `define-library`, and the library's imports
  as reported to the paths' dependency resolution include `(scheme inexact)`

#### Scenario: An included import set is rejected identically

- **WHEN** an included declarations file contains `(import (only (scheme base) car))`
- **THEN** compilation reports the same import-set diagnostic naming the offending form as it does
  for an import set written directly in the `define-library`

### Requirement: `cond-expand` selects library declarations by feature

The compiler SHALL accept `(cond-expand ⟨clause⟩ …)` as a library declaration, where each clause is
`(⟨feature requirement⟩ ⟨declaration⟩ …)` and the last clause MAY be `(else ⟨declaration⟩ …)`. A
feature requirement SHALL be a feature identifier, `(and ⟨requirement⟩ …)`, `(or ⟨requirement⟩ …)`,
or `(not ⟨requirement⟩)`. The declarations of the **first** clause whose requirement is satisfied
SHALL be spliced at the position of the `cond-expand` and expanded recursively; the other clauses
SHALL have no effect. If no clause is satisfied and there is no `else`, the `cond-expand` SHALL
contribute nothing.

The set of advertised feature identifiers SHALL be a single declaration in the compiler, so that
every compilation path answers a feature requirement identically. A feature identifier SHALL NOT be advertised
unless Emit provides the corresponding feature.

A `(library ⟨name⟩)` feature requirement SHALL be reported as a recognized R7RS form this stage does
not support, naming it, rather than being answered — answering it is library availability, which
this stage's parser does not resolve, and a wrong answer would silently select the wrong clause.

A malformed clause SHALL be a compile-time error naming the clause.

#### Scenario: A satisfied clause is spliced

- **WHEN** a library declares `(cond-expand (emit (begin (define impl 'emit))) (else (begin (define impl 'other))))`
  and exports `impl`
- **THEN** the library compiles and `impl` is `emit`

#### Scenario: An unsatisfied clause contributes nothing

- **WHEN** a clause's requirement names a feature Emit does not advertise and a later clause matches
- **THEN** only the later clause's declarations take effect, and nothing in the skipped clause is
  read, expanded, or lowered — including an `include` it contains

#### Scenario: `else` is taken when nothing matches

- **WHEN** no clause requirement is satisfied and the final clause is `(else …)`
- **THEN** the `else` clause's declarations are spliced

#### Scenario: A `library` feature requirement is named

- **WHEN** a clause requirement is `(library (scheme base))`
- **THEN** compilation reports it as a recognized R7RS form this stage does not support, naming it

#### Scenario: `cond-expand` can contribute imports and exports

- **WHEN** a `cond-expand` clause contains `(import (scheme inexact))` and `(export root)`
- **THEN** the selected clause's `import` and `export` are treated exactly as declarations written in
  place, and the import participates in dependency resolution on every path

### Requirement: An included filename resolves relative to the file that named it

A filename in `include`, `include-ci`, or `include-library-declarations` SHALL be resolved relative
to the directory of the file in which the declaration appears — for a nested inclusion, relative to
the **including file**, not to the original `define-library` — matching the rule the manifest applies
to a library's `(source …)`. An absolute filename SHALL be used as written. When the source has no
filename (it was read from standard input), a relative filename SHALL resolve against the current
directory.

Reading files is the host's responsibility, not the compiler core's: the core SHALL obtain forms
through a reader the host installs, and SHALL perform no file access itself.

#### Scenario: A library finds its pieces from any working directory

- **WHEN** a library at `lib/mylib/mylib.sld` declares `(include "impl.scm")`, `impl.scm` sits beside
  it, and the compile is run from an unrelated working directory
- **THEN** `impl.scm` is found beside the `.sld`

#### Scenario: A nested include resolves relative to its own file

- **WHEN** `lib/a/x.sld` includes `sub/y.scm`, and `y.scm` includes `z.scm`
- **THEN** `z.scm` is resolved in `lib/a/sub/`, beside `y.scm`

#### Scenario: A missing file names the path and the declaration

- **WHEN** an included file cannot be read
- **THEN** compilation reports a recoverable error naming the filename as written, the path it
  resolved to, and the declaration that named it — not an empty body or an unbound variable

#### Scenario: An include cycle is named

- **WHEN** a file includes itself, directly or through a chain
- **THEN** compilation reports a recoverable error naming the cycle, rather than not terminating

#### Scenario: The same file may be included twice in different branches

- **WHEN** two different libraries, or two sibling declarations, include the same file
- **THEN** both inclusions succeed — the cycle check applies to the chain currently being expanded,
  not to every file read

### Requirement: An artifact is stale when a file it included changes

A compiled library artifact SHALL be considered fresh only when it is newer than **every** source
that contributed to it, including files reached through `include`, `include-ci`, and
`include-library-declarations`. The artifact's stamp sidecar SHALL record the resolved list of
included files so that freshness can be checked without recompiling, and the rebuild reason reported
for a stale artifact SHALL distinguish a changed source from a changed compiler as it does today.

#### Scenario: Editing an included file rebuilds the library

- **WHEN** a library is compiled, an included file is then edited, and the build is re-run
- **THEN** the unit is rebuilt rather than reused, and the narration reports it as rebuilt

#### Scenario: An untouched library with includes is still reused

- **WHEN** a library with `include` declarations is compiled twice with no file changed in between
- **THEN** the second build reuses the artifact and reports it as fresh

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

### Requirement: An exported macro is usable in an importing unit

A unit that imports a library SHALL be able to use that library's exported macros under their
external names, in the same positions and with the same expansion behaviour as a macro the unit
defines itself. The transformers SHALL travel in the library's compile-time export interface and be
merged into the importing compile's macro environment before expansion, alongside the runtime
bindings merged into its environment.

This SHALL hold identically on all three paths — the Chez batch driver, the REPL, and the Chez-free
embedded `emit run` command — and for both `emit run` and `emit build`, per dev→ship fidelity: a macro
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

#### Scenario: The three paths agree on an exported macro

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
- a macro of the baked `(scheme base)` set **when the importing unit is a program**, which needs no
  rule of its own: it falls under the leave-as-written case below and expands in the importer
  against the baked set the program path merges. When the importing unit is a **library**, the
  derived forms arrive instead through the compile-time interface of the library it imported them
  from, already resolved, and are governed by the ordinary imported-transformer rule rather than by
  this exception — so a template mentioning a derived form now works in a library importer too.

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

#### Scenario: A library importer receives a derived form through its import

- **WHEN** a **library** imports a library whose exported macro's template uses `when` or `cond`
- **THEN** the derived form resolves through `(scheme base)`'s compile-time export interface rather
  than failing, because a library body now receives the derived forms from the library it imports
  them from

### Requirement: A `define-library` that cannot be compiled as a library is reported as one

A `define-library` form SHALL be compiled as a library unit only where a library unit is what the
path produces: as the sole top-level form of a source. Where that condition does not hold, the
compiler SHALL report the form as a misplaced `define-library`, naming the rule it violates, rather
than passing it to ordinary expression parsing — where `define-library` is not a form, so it is read
as an application over internal defines and reported as a malformed body.

This SHALL hold on the interactive execution path as well: a `define-library` entered at the REPL prompt SHALL
be reported as not supported at the prompt, naming libraries as something imported through the
manifest, rather than producing a parse error about an empty body.

Whether the interactive execution path should *accept* a `define-library` is a separate question and is not
settled by this requirement; what is required here is that the current limit be stated.

#### Scenario: A define-library alongside another top-level form

- **WHEN** a source contains a `define-library` form followed by another top-level form
- **THEN** compilation reports the `define-library` as needing to be the only form in its source,
  and does not report a parse error about internal defines with no following body expression

#### Scenario: A define-library at the REPL prompt

- **WHEN** a `define-library` form is entered at the interactive prompt
- **THEN** the session reports that libraries are not defined at the prompt, and remains alive and
  usable for subsequent forms

### Requirement: Library artifact emission

Compiling a `define-library` SHALL emit an LLVM module (the library unit) that:
contains one external-linkage global per exported binding, named by the Stage 0 symbol namer
(`@"p₁.….pₙ:x"`); contains an initialization function `@"L:__init"` that runs the library's
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

### Requirement: A variadic export may advertise a minimum-arity fast entry

If the benchmark gate for the empty-rest fast entry passes, a separately compiled immutable
variadic procedure export SHALL be able to publish both its ordinary closure-entry label and an
optional fast-entry label for its exact minimum arity. An importer compiling from the export table
alone SHALL target the fast entry only when the statically counted argument count equals the
minimum; it SHALL target the ordinary label when the count is greater than the minimum.

The optional field SHALL preserve backward artifact compatibility: a new compiler reading an
existing variadic call row without a fast label SHALL use its ordinary direct-call behavior. A
binding assigned by its defining unit SHALL publish neither direct-call label. Every cross-unit
fast-label reference SHALL retain the corresponding closure-global reference required for captured
environments and AOT tree-shaking. Newly published fast labels SHALL use the compiler's disjoint,
reversible generated-label namespace rather than a suffix that a Scheme procedure name can reproduce.

#### Scenario: Exact minimum arity selects the advertised fast entry

- **WHEN** an immutable exported variadic procedure advertises minimum arity two and a fast label,
  and an importing program calls it with exactly two statically counted arguments
- **THEN** the importer loads and passes the exported closure as `self` and directly calls the fast
  label

#### Scenario: More than the minimum selects the ordinary label

- **WHEN** that importing program calls the same export with three statically counted arguments
- **THEN** it directly calls the ordinary variadic label and the callee receives the third argument
  in its rest list

#### Scenario: An older variadic row retains ordinary direct calls

- **WHEN** a new compiler reads a variadic procedure call row that records only its ordinary label,
  minimum arity, and variadic marker
- **THEN** every statically valid call continues to target the ordinary label as it did before this
  change

#### Scenario: Assignment withholds both labels

- **WHEN** a library exports a variadic lambda binding that its defining unit assigns
- **THEN** the export table records neither the ordinary direct-call label nor a fast-entry label,
  and importing calls remain indirect

#### Scenario: Tree shaking retains a fast-entry callee and its closure

- **WHEN** an AOT program's only reference to an imported variadic procedure is an exact-minimum call
  through its fast entry
- **THEN** tree shaking retains the fast entry, the closure and environment needed as `self`, and all
  code reachable from that entry

#### Scenario: Exported names cannot alias an advertised fast label

- **WHEN** a library exports a variadic `foo` and a distinct procedure whose Scheme name is
  `foo.min`
- **THEN** `foo`'s advertised fast label differs from both ordinary labels and importing either
  procedure resolves to the intended definition

### Requirement: An export table represents every datum faithfully or fails

The export table SHALL record an exported macro's transformer such that every datum in its patterns
and templates reads back as the datum the library author wrote. A datum the table writer has no
external representation for SHALL be a compile-time error naming that datum; it SHALL NOT be written
as a placeholder, and the library SHALL NOT compile successfully with a table that misrepresents it.

Vector literals SHALL be written in the `#(...)` form both readers accept, so a table containing one
round-trips through the Chez-hosted driver's `read` and Emit's own in-language reader identically.

A **bytevector** literal has no such form: R7RS spells it `#u8(...)`, which Emit's reader accepts and
the Chez-hosted driver's `read` rejects, while Chez's `#vu8(...)` is rejected by Emit's reader. A
bytevector literal in an exported macro template SHALL therefore be a compile-time error naming the
reason, under the rule above — not a table written in a spelling one path cannot read back. This
constrains only the table: a bytevector *constant* elsewhere in a library or program is unaffected.

This makes explicit for the table what has always been true of it: the table is a compilation
artifact consumed by other units, so a lossy rendering is a miscompile rather than a cosmetic defect.

#### Scenario: A macro template containing a vector literal round-trips

- **WHEN** `emit lib` compiles a library exporting a macro whose template contains `#(1 2)`
- **THEN** the export table records that template with the vector written as `#(1 2)`, and an
  importer expanding the macro produces that vector

#### Scenario: A macro template containing a bytevector literal fails the library

- **WHEN** `emit lib` compiles a library exporting a macro whose template contains `#u8(1 2)`
- **THEN** it reports a compile-time error naming the bytevector literal as having no external
  representation both readers accept, and exits non-zero without writing a table that
  misrepresents it

#### Scenario: A bytevector constant outside a macro template is unaffected

- **WHEN** a library body defines a procedure returning `'#u8(1 2)` and a program imports it
- **THEN** the library compiles, its export table is written, and the program prints `#u8(1 2)`

#### Scenario: A datum with no external representation fails the library

- **WHEN** a macro template contains a datum for which the table writer has no representation
- **THEN** `emit lib` reports a compile-time error naming that datum and exits non-zero, writing no
  export table that misrepresents it

#### Scenario: A table is never written with a placeholder datum

- **WHEN** any exported macro's patterns or templates are written to an export table
- **THEN** no datum in the written table is a `?` placeholder standing for a datum the writer could
  not represent

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

### Requirement: Imported binding resolution

Free-identifier resolution SHALL resolve an imported name against an in-memory import
environment (built from the imported libraries' export tables), classifying it as an
`imported` binding whose symbol is the exporter's mangled symbol, and SHALL emit a reference
to it as an `external global` resolved by name at link/load time. The importing unit SHALL
NOT define that global. A name the importing unit defines itself SHALL take precedence over
an imported name of the same spelling.

#### Scenario: Imported reference emits an external global

- **WHEN** a program importing `(mylib)` references the exported `greet`
- **THEN** resolution classifies `greet` as `imported` with symbol `mylib:greet` and the
  program module references it as an external global it does not define

#### Scenario: A local definition shadows an import

- **WHEN** a program imports `(mylib)` (which exports `greet`) but also defines its own
  top-level `greet`
- **THEN** references to `greet` resolve to the program's own definition, not the import

### Requirement: Program initialization ordering

A program that imports libraries SHALL, in its `@scheme_entry`, call the imported libraries'
`@"L:__init"` functions in an order consistent with the dependency graph — every library's
`__init` runs after the `__init`s of the libraries it depends on and before the program body
— so every imported global (direct or transitive) is populated before first use.

#### Scenario: A transitive dependency is initialized before its dependents

- **WHEN** a program imports `(a)`, `(a)` imports `(b)`, and the program body uses an export
  of `(a)` that internally calls an export of `(b)`
- **THEN** `@scheme_entry` calls `@"b:__init"` before `@"a:__init"` and both before the
  program body, and the call observes both globals populated

#### Scenario: Imported library is initialized before the program body

- **WHEN** a program imports `(mylib)` and calls `greet` in its body
- **THEN** `@scheme_entry` calls `@"mylib:__init"` before the body runs, and the call to
  `greet` observes the populated global

### Requirement: AOT path — build and link an importing program

An import-aware build path SHALL resolve a program's imports and each library's imports through the
shared hybrid resolver, build the transitive dependency graph, reject import cycles with a
compile-time error, compile each unit against the import environment built from its dependencies'
export tables, and link the program module, every unit in the transitive closure, and the runtime
into a single working executable in dependency order. A library that is not in the program's
transitive import closure SHALL NOT be linked.

#### Scenario: A program importing a library builds and runs

- **WHEN** the build path is run on a program that imports `(mylib)`, resolved through either an
  exact manifest entry or a conventional library root, and prints the result of `greet`
- **THEN** it produces an executable that prints the value `greet` returns

#### Scenario: A transitive import chain builds and runs

- **WHEN** the build path runs a program importing `(a)`, where `(a)` imports `(b)` and the two
  libraries are resolved by any supported providers
- **THEN** it compiles `(b)`, `(a)`, and the program, links all three plus the runtime, and the
  executable runs correctly

#### Scenario: An import cycle is reported

- **WHEN** the resolved graph has `(a)` importing `(b)` and `(b)` importing `(a)`
- **THEN** the build reports a compile-time error naming the cycle rather than looping or linking

### Requirement: REPL — import a library interactively

The interactive REPL SHALL obtain the standard library by registering the baked set at startup. It
SHALL eagerly register libraries enumerated by resolved manifests, preserving startup validation of
those exact entries. A library available only through a conventional root SHALL instead be resolved
and registered when a prompt first imports it; its transitive dependencies SHALL be resolved and
registered dependency-first before the import is committed.

On evaluating `(import (<lib>))`, the REPL SHALL ensure the selected library and its dependency
closure are registered, initialize every not-yet-initialized member in dependency order, and merge
the imported library's runtime exports and compile-time interface into the session scope. A baked
dependency SHALL be satisfied by the registered baked member. Every library initializer SHALL run
at most once, and a failed resolution, registration, compilation, or initialization SHALL leave the
requested library's names out of scope while the session remains usable.

#### Scenario: A conventional library is registered on first import

- **WHEN** a session has a library root containing `my/tools.sld`, no manifest names `(my tools)`,
  and the user enters `(import (my tools))`
- **THEN** the REPL resolves, compiles or cache-loads, registers, initializes, and imports `(my
  tools)`, after which its procedures and macros are available

#### Scenario: An unimported conventional library is untouched

- **WHEN** a configured root contains a malformed or unreadable library that no prompt imports
- **THEN** the REPL reaches and retains its prompt without reading or reporting that source

#### Scenario: A manifest library retains startup validation

- **WHEN** a manifest explicitly names an unreadable or invalid library source
- **THEN** the REPL reports that entry during eager startup registration as before

#### Scenario: A transitive path dependency initializes first

- **WHEN** a prompt imports a conventional-path `(a)` whose source imports conventional-path `(b)`
- **THEN** both are registered, `(b)` initializes before `(a)`, each initializes once, and `(a)`'s
  exports observe `(b)`'s populated bindings

#### Scenario: Imported procedure is callable in the REPL

- **WHEN** the user imports `(mylib)` through any provider and calls `greet` in a later form
- **THEN** the REPL initializes the library once and returns the value `greet` produces

#### Scenario: Imported macro is usable in a later form

- **WHEN** the user imports a macro-exporting library through any provider and uses its macro later
- **THEN** the macro expands and remains available for subsequent forms

#### Scenario: A failed form does not lose an imported macro

- **WHEN** a macro is imported, a later form fails to compile, and another form uses the macro
- **THEN** rollback of the failed form retains the imported transformer

#### Scenario: A transitive dependency is loaded and initialized in the REPL

- **WHEN** the user imports `(a)` where `(a)` imports `(b)`, with either library resolved by any
  enabled provider
- **THEN** both register and initialize dependency-first and `(a)` observes `(b)`'s values

#### Scenario: A session in a project directory has the standard library

- **WHEN** a REPL starts in a project whose providers name no baked member
- **THEN** `(scheme base)` procedures and macros remain available from the baked set

#### Scenario: A project library importing (scheme base) loads in the REPL

- **WHEN** a project library resolved through a manifest or root imports `(scheme base)`
- **THEN** its dependency resolves from the baked set and its export works after interactive import

#### Scenario: A substrate name stays out of scope in a session

- **WHEN** a session references an internal substrate name without explicitly importing it
- **THEN** the name remains unbound regardless of library providers

### Requirement: `emit run` command — run an importing program in-process (Chez-free)

The in-process runner (`emit run`) SHALL resolve a program's imports and each library's imports
through the shared hybrid resolver, build the transitive dependency graph, reject cycles, load each
unit in dependency order, invoke each initializer exactly once, and compile and run the program
against its dependencies' export tables, all without Chez or a second resolution path.

A program importing only baked libraries SHALL require neither a manifest nor a library root. A
non-baked library absent from every enabled provider SHALL be reported by name. A library outside
the program's transitive closure SHALL NOT be loaded into the program's initialization sequence and
SHALL have no observable effect.

#### Scenario: A program importing a library runs in-process

- **WHEN** `emit run` executes a program importing `(mylib)` and an enabled root contains a matching
  `mylib.sld`
- **THEN** it loads and initializes the library and prints the program's value

#### Scenario: A transitive import chain runs in-process

- **WHEN** a project path library imports a shipped library resolved from an installed provider
- **THEN** the runner loads both dependency-first and produces the expected value

#### Scenario: An import cycle is reported

- **WHEN** the resolved import graph contains a cycle
- **THEN** `emit run` reports the cycle rather than looping and exits nonzero

#### Scenario: A program with no user imports is unaffected

- **WHEN** a program imports only baked libraries or nothing, with no manifest or project library
  root present
- **THEN** it behaves as before and requires no discovery configuration

#### Scenario: `--manifest` outranks the environment variable

- **WHEN** `emit run` receives `--manifest FILE` while `EMIT_MANIFEST` names another manifest
- **THEN** `FILE` supplies the first exact manifest provider, as before

### Requirement: `emit run` command matches the AOT path (dev→ship fidelity)

A program run through `emit run` with a given resolver configuration SHALL produce the same value as
the same program built and run through `emit build` with that configuration. The emitted program
module and each imported unit's module SHALL be byte-for-byte identical across the run and AOT
paths because all providers feed the same compile-unit core.

#### Scenario: run-path value matches AOT-path value

- **WHEN** an importing program is run and built with the same manifests, library roots, and
  conventional-lookup policy
- **THEN** the two printed values are identical

#### Scenario: A unit's module bytes match across the run and AOT paths

- **WHEN** a library is loaded by the `emit run` command and compiled for the AOT link from the same resolved
  source
- **THEN** the two unit modules are byte-for-byte identical

### Requirement: Dev→ship fidelity for library units

A library unit's emitted module SHALL be byte-for-byte identical whether it is produced for
the AOT path or the REPL, because both paths drive the same compile-unit core entry.

#### Scenario: A unit's module bytes match across paths

- **WHEN** `(mylib)` is compiled for the AOT link and for REPL loading
- **THEN** the two unit modules are byte-for-byte identical

### Requirement: Separately compiled units link without symbol collision

Two libraries compiled independently, each with an internal helper and lifted code blocks of the same spelling, SHALL link together into one program with no duplicate-symbol conflict, because every unit-owned symbol is qualified by the unit's library name.

#### Scenario: Two units with same-named internals coexist

- **WHEN** libraries `(liba)` and `(libb)` each define an internal `helper` and each lift
  code blocks, and a program imports both
- **THEN** the units link into one executable with no symbol collision and both libraries'
  exports work

### Requirement: Library manifest

A manifest SHALL remain a readable s-expression configuration file containing exact library entries
of the form `(library NAME (source S) [(artifacts DIR)])` and optional program entries. An exact
library entry SHALL override conventional lookup for that name within the same resolution tier and
SHALL support names or layouts that conventional derivation cannot represent. Compiled artifacts
SHALL continue to default under the build directory.

Every path SHALL locate manifests using the existing precedence: `--manifest FILE`, then
`EMIT_MANIFEST`, then `./emit-libs.scm`, then executable-relative and compiled-prefix installed
candidates. Explicit missing manifests SHALL remain errors; searched missing candidates SHALL remain
nonfatal. Explicit selection SHALL skip an unrelated `./emit-libs.scm`, and readable installed
manifests SHALL extend the selected project unless `--no-manifest-chain` is given. Program lookup
SHALL remain confined to the first manifest.

Library providers SHALL be ordered by tier: baked members; the first project manifest's exact
entries; explicit `-L` roots in command-line order; `EMIT_LIBRARY_PATH` roots in listed order; the
project conventional root; and then each installed manifest followed by the conventional root
beside it. Within any provider, the first answer wins. This ordering SHALL let project configuration
override a non-baked shipped library while installed providers fill names absent from the project.
A baked member SHALL always win by name and SHALL never be loaded a second time.

The project conventional root SHALL be `lib` beside the first project manifest when one is selected
or discovered, and `./lib` otherwise. Installed conventional roots SHALL be `lib` beside each
installed manifest candidate, including the executable-relative and compiled-prefix locations.
Duplicate physical manifests and roots SHALL be used once at their first position.

`--no-manifest-chain` SHALL retain its existing meaning of suppressing later manifests and SHALL not
silently disable explicit or project library roots. A new `--no-library-paths` option SHALL disable
all conventional-root providers while leaving baked and manifest resolution intact; combining it
with `--manifest FILE --no-manifest-chain` SHALL provide exact single-manifest library resolution.

Relative paths in each manifest SHALL continue to resolve against that manifest's directory. A
relative explicit library root SHALL resolve against the invocation's current directory, while
environment roots SHALL follow the same rule. Every selected provider and successful non-baked
resolution SHALL be narrated on standard error according to `EMIT_VERBOSITY`, naming whether the
source came from a manifest or a conventional root; narration SHALL never alter standard output.

#### Scenario: An exact manifest entry overrides a conventional file

- **WHEN** the project manifest maps `(mylib)` to `vendor/mylib.sld` while the project root also
  contains `mylib.sld`
- **THEN** the manifest source is selected

#### Scenario: A conventional project library overrides an installed library

- **WHEN** no project manifest entry names `(mylib)`, the project root and an installed provider
  both supply it
- **THEN** the project-root source is selected

#### Scenario: An installed shipped library needs no project mapping

- **WHEN** a project imports `(scheme inexact)` without naming it and the installed conventional
  root contains `scheme/inexact.sld`
- **THEN** the installed source resolves and the project manifest, if any, contains no mapping or
  installation path

#### Scenario: Explicit roots preserve their order

- **WHEN** repeated `-L` options provide the same library in two directories
- **THEN** the first option's source wins

#### Scenario: Manifest-only mode disables conventional files

- **WHEN** `--no-library-paths` is present and an imported non-baked library exists only beneath a
  conventional root
- **THEN** the import is unresolved, while exact manifest entries continue to work

#### Scenario: Single-manifest mode remains available

- **WHEN** `--manifest FILE --no-manifest-chain --no-library-paths` is used
- **THEN** non-baked imports resolve only from exact entries in `FILE`

#### Scenario: Program entries remain distinct from libraries

- **WHEN** a manifest mixes library and program entries
- **THEN** import resolution ignores program entries, and named program lookup consults only the
  first manifest

#### Scenario: Relative manifest paths retain their base

- **WHEN** a manifest maps a library to a relative source and the path runs from another directory
- **THEN** the source resolves relative to that manifest

#### Scenario: The selected provider is narrated

- **WHEN** a non-baked library resolves at default verbosity
- **THEN** stderr names the library, source, and provider kind, quiet verbosity omits the narration,
  and stdout is unchanged

#### Scenario: Manifest resolves a library name to its source

- **WHEN** an exact manifest entry maps `(mylib)` to a source and a build imports it
- **THEN** that source is selected and artifacts use the entry's configured or default directory

#### Scenario: An unresolved import is reported

- **WHEN** an imported non-baked library is absent from every enabled manifest and root
- **THEN** resolution reports a compile-time error naming the library

#### Scenario: A project manifest keeps the installed standard libraries

- **WHEN** a project manifest omits `(scheme inexact)` and an installed provider supplies it
- **THEN** the import resolves without an installation path in the project manifest

#### Scenario: An explicit project manifest keeps the installed standard libraries

- **WHEN** `--manifest FILE` selects an out-of-tree project and an installed provider supplies an
  omitted standard library
- **THEN** the project remains first and the standard library resolves from the installed tier

#### Scenario: An explicit project build resolves its own program and installed imports

- **WHEN** a named program comes from an explicit project manifest and imports installed libraries
- **THEN** program paths come only from that first manifest and imports may fall through to installed
  providers

#### Scenario: EMIT_MANIFEST chains installed libraries

- **WHEN** `EMIT_MANIFEST` selects a project manifest that omits an installed standard library
- **THEN** later installed manifest and root providers remain available unless disabled

#### Scenario: An explicit manifest excludes the unrelated working directory manifest

- **WHEN** `--manifest FILE` is used while the current directory contains another manifest
- **THEN** the unrelated current-directory manifest is not a provider

#### Scenario: A project entry overrides a shipped library of the same name

- **WHEN** the first project manifest names a non-baked library also supplied by an installed tier
- **THEN** the project entry wins and its relative source resolves from its own manifest directory

#### Scenario: An explicitly named manifest is not extended

- **WHEN** `--manifest FILE --no-manifest-chain --no-library-paths` is used and an omitted library
  exists only in installed providers
- **THEN** the import is unresolved

#### Scenario: A program name is resolved against the first manifest only

- **WHEN** the first manifest lacks a requested program name but an installed manifest has it
- **THEN** named program lookup reports the first manifest and does not fall through

#### Scenario: (scheme base) needs no manifest entry on any path

- **WHEN** any path auto-imports or explicitly imports `(scheme base)` with no exact entry
- **THEN** the baked member satisfies it without filesystem lookup

#### Scenario: (scheme base) resolves through the manifest

- **WHEN** the Chez bootstrap driver uses a repository manifest entry for `(scheme base)` while a
  Chez-free path has already registered the baked member
- **THEN** the driver can compile the committed source and the Chez-free path admits no second copy

#### Scenario: A program entry is parsed and does not affect library resolution

- **WHEN** a manifest mixes library and program entries
- **THEN** imports ignore program entries and exact library mappings retain their precedence

#### Scenario: A program entry is resolvable by name

- **WHEN** the first manifest contains `(program my-app (source "app.scm") (output "build/app"))`
- **THEN** named lookup returns both paths resolved against that manifest

#### Scenario: An installed manifest is found from an unrelated directory

- **WHEN** no project manifest exists and an installed manifest and root sit beside the real binary
- **THEN** shipped libraries resolve from that installed tier

#### Scenario: A symlinked executable locates its installed manifest

- **WHEN** the running executable is reached through a symlink outside its installation
- **THEN** the real executable path determines its installed manifest and conventional root

#### Scenario: Manifest sources resolve against the manifest's own directory

- **WHEN** an exact entry uses a relative source and the path runs elsewhere
- **THEN** the source resolves against the entry's manifest directory

#### Scenario: An explicitly named manifest that is missing is reported

- **WHEN** `--manifest FILE` or `EMIT_MANIFEST` explicitly names a missing file
- **THEN** that file is reported rather than silently replaced by current-directory configuration

#### Scenario: The resolved manifest is narrated

- **WHEN** one or more manifests participate at default verbosity
- **THEN** stderr names them in order, including chained suppliers, while quiet mode omits the lines
  and stdout remains unchanged
### Requirement: A manifest containing no datum is an empty manifest

A manifest file that exists and is readable but contains no datum — a zero-byte file, a file of
only whitespace, or a file of only comments — SHALL be equivalent to a manifest that declares no
entries. It SHALL NOT be an error to *locate* such a manifest, and no path SHALL fail on account
of one except where that path requires an entry it cannot find, in which case it SHALL report the
absence rather than terminate abnormally.

This extends "Finding no manifest at all SHALL remain non-fatal" to the case where a manifest is
found but declares nothing: the two SHALL be indistinguishable to every path in what they resolve,
differing only in narration, which continues to name the manifest that was located.

No path SHALL terminate on a signal, and no path SHALL exit without a diagnostic, for any manifest
text.

A manifest that is *truncated* — one whose text ends inside an unterminated list or string — SHALL
be reported rather than accepted as complete. This is enforced at the reader rather than in the
manifest parsers: `core-language`'s "An unterminated construct is reported, not read as end of
input" makes an unterminated construct an error in every source, so a manifest inherits it along
with every other consumer of the whole-source read. A truncated manifest therefore reports the
construct it left open, rather than resolving as though the missing entries were never written.

#### Scenario: An entryless manifest resolves like no manifest

- **WHEN** a path locates an `emit-libs.scm` that is empty, whitespace-only, or comment-only
- **THEN** it resolves the same set of libraries it would have resolved had no manifest been found
  — the baked set alone — and narrates the manifest it located

#### Scenario: A program importing only baked libraries runs under an entryless manifest

- **WHEN** `emit run prog.scm` is invoked with an entryless manifest present and `prog.scm` imports
  only baked-in libraries
- **THEN** the program runs and produces its normal output, with no error and no crash

#### Scenario: An unresolved import under an entryless manifest names the library

- **WHEN** `emit run prog.scm` is invoked with an entryless manifest present and `prog.scm` imports
  a library that is neither baked nor declared
- **THEN** import resolution reports a compile-time error naming the unresolved library, and the
  path exits non-zero without crashing

#### Scenario: A library source holding no datum is reported, not crashed on

- **WHEN** a manifest names a library whose source file exists but holds no datum — a zero-byte file,
  whitespace only, or comments only — and a program imports that library
- **THEN** the path reports a compile-time error naming that source as containing no
  `define-library`, and exits non-zero without crashing

#### Scenario: A manifest that is not a list of entries does not crash a path

- **WHEN** a path locates a manifest whose top-level form is not a proper list — a bare symbol, a
  number, a string, or an improper list such as `(a . b)`
- **THEN** the path resolves no entries from it and exits with a status it chose, never on a signal

#### Scenario: A truncated manifest is reported, not built from

- **WHEN** a path locates a manifest whose text is `((program p (source "hello.scm") (output "h")`
  — one closing paren short — and a program is built
- **THEN** the path reports the unterminated list and exits non-zero, rather than resolving the
  entry and writing an executable

### Requirement: A manifest is exactly one top-level form

A manifest SHALL consist of exactly one top-level form — the list of entries. A manifest holding
**more than one** top-level form SHALL be reported as an error naming the manifest and the number of
forms found, and SHALL NOT have its extra forms silently discarded.

The mistake this prevents is writing one parenthesized group per entry:

```scheme
((library (a) (source "a.sld")))
((library (b) (source "b.sld")))   ; a second top-level form
```

which looks like a list of entries and reads as several. Discarding the second form leaves `(b)`
unresolvable and reports the failure at whatever imports it, naming the importer rather than the
manifest that dropped the entry.

Rejecting rather than concatenating is a deliberate grammar decision. Treating several top-level
lists as one entry list would make the shape above simply work, and would let a manifest be assembled
by appending files — but it widens the documented grammar rather than enforcing it, and it is the
more permissive of the two, so it is the one that cannot be taken back. Rejecting now keeps the
choice open: admitting concatenation later is purely additive, while withdrawing it after a tagged
release would be a breaking change.

A manifest holding **no** datum remains an empty manifest and is not an error — see "A manifest
containing no datum is an empty manifest". The requirement here constrains only the case of more
than one form.

#### Scenario: A second top-level form is reported, not ignored

- **WHEN** a path locates a manifest whose text is two top-level lists, each holding one entry
- **THEN** the path reports an error naming the manifest and that it holds two top-level forms, and
  exits non-zero — rather than resolving only the first list's entries

#### Scenario: The dropped entry is not reported as an unresolved import

- **WHEN** a program imports `(b)`, which is declared in the **second** top-level form of the
  manifest
- **THEN** the reported error names the manifest's form count, not an unresolved import of `(b)` —
  the diagnostic points at the file that holds the mistake

#### Scenario: A single-form manifest is unaffected

- **WHEN** a path locates a well-formed manifest — one top-level list of any number of entries,
  with any surrounding whitespace and comments
- **THEN** it resolves every entry in that list, exactly as before

#### Scenario: No path crashes on a degenerate manifest

- **WHEN** any path is invoked with a manifest that is absent, empty, whitespace-only,
  comment-only, or not a proper list of entries
- **THEN** the path exits with a status it chose — never on a signal — and every non-zero exit
  carries a diagnostic on standard error

### Requirement: Transitive library imports

A `define-library` SHALL be permitted to contain `(import (<other-lib>))` declarations. When
compiling such a library, the compiler SHALL build its import environment from the export
tables of the libraries it imports and resolve its free identifiers against that environment
exactly as it does for a program — a name exported by an imported library resolves to an
`imported` binding referencing the exporter's mangled symbol as an external global the
importing library does not define, with the library's own top-level definitions taking
precedence over an imported name of the same spelling.

#### Scenario: A library references another library's export

- **WHEN** `(a)` imports `(b)`, `(b)` exports `add1`, and `(a)`'s body calls `add1`
- **THEN** the reference to `add1` in `(a)` resolves to the `imported` binding `b:add1` and
  `(a)`'s emitted unit references it as an external global it does not define

#### Scenario: A library's own definition shadows a transitive import

- **WHEN** `(a)` imports `(b)` (which exports `helper`) but `(a)` also defines its own
  top-level `helper`
- **THEN** references to `helper` inside `(a)` resolve to `(a)`'s own definition, not `(b)`'s
  export

### Requirement: Diamond-safe one-time initialization

The compiler SHALL ensure a library reachable by more than one path in the transitive import
graph (a diamond) executes its top-level body exactly once across the whole program run, even
though its `@"L:__init"` may be invoked from more than one dependent — guaranteed by the
one-shot `@"L:__inited"` guard.

#### Scenario: A shared dependency initializes once in a diamond

- **WHEN** a program imports `(a)` and `(b)`, both of which import `(c)`, and `(c)`'s body has
  an observable one-time effect
- **THEN** running the program executes `(c)`'s body exactly once even though both `(a)` and
  `(b)` cause `@"c:__init"` to be invoked

### Requirement: Stale-artifact rebuild

The build driver SHALL rebuild a library's `.ll` and `.exports` artifacts when they are
missing, older than the library's source, **or produced by a different compiler**, and SHALL
reuse existing artifacts only when they are newer than the source **and** were produced by the
current compiler, so a multi-unit build does not recompile units whose source is unchanged yet
never reuses a unit compiled by a different (e.g. older) compiler.

Compiler identity SHALL be captured as a **compiler-identity stamp** — a version marker
combined with a content hash over the compiler sources that determine the emitted IR — and
SHALL be recorded alongside each unit's artifacts when they are written. An artifact whose
recorded stamp differs from the current compiler's stamp SHALL be treated as stale and
recompiled, even when its source is unchanged.

#### Scenario: A changed source triggers a rebuild

- **WHEN** a library's source is newer than its committed `.ll`/`.exports` artifacts (or the
  artifacts are absent) and a build resolves an import of that library
- **THEN** the driver recompiles the library, writing fresh `.ll` and `.exports`

#### Scenario: Fresh artifacts are reused

- **WHEN** a library's artifacts are newer than its source and carry the current compiler's
  identity stamp, and a build resolves an import of that library
- **THEN** the driver reuses the existing artifacts without recompiling the library

#### Scenario: A compiler change invalidates unchanged-source artifacts

- **WHEN** the compiler that determines emitted IR has changed (its identity stamp differs
  from the stamp recorded with a unit's artifacts) but the library's source is unchanged, and
  a build resolves an import of that library
- **THEN** the driver recompiles the library instead of reusing the stale artifact, so the
  emitted IR reflects the current compiler (e.g. a boolean literal re-encoding is not served
  from a unit compiled by the old emitter)

### Requirement: The baked library set is a partition emitted in dependency order

The compiler's baked-in prelude source SHALL be compiled into a **set** of libraries described by
the declared partition, not into a single fixed library. The portable derivation SHALL emit each
partition member as its own `define-library` — with its own export list, its own body forms, and an
`import` of the members it depends on — and SHALL emit them in dependency order, so a member is
compiled and initialized after everything it imports.

Every member of the baked set SHALL be reachable **without a manifest**, exactly as `(scheme base)`
is: the guarantee that a program importing only `(scheme base)` (or importing nothing) needs no
manifest present SHALL extend to whatever `(scheme base)` itself imports. A library the baked set
depends on SHALL NOT be resolved through the manifest.

**Every compiler host SHALL register the baked set before it consults the manifest.** This holds for
the Chez driver, the embedded host used by `emit run` and `emit build`, the REPL host, and `emit lib`
alike: a host SHALL NOT require a manifest entry to obtain the standard library, and the directory a command is invoked from
SHALL NOT determine whether the standard library is available. Registration makes each member's
export table and declared imports known to the compile session, so a program or library that imports
a baked member resolves it with no file access.

A host with no program entry to drive initialization — the REPL — SHALL additionally run each
registered member's initializer exactly once, in the dependency order the members were emitted in,
before it evaluates any user form. A host that emits a program SHALL continue to leave initialization
to the program's entry, which calls each `__init` in topological order as an AOT executable does.

**A manifest entry naming a member of the baked set SHALL resolve to the baked member** rather than
loading a second copy of that library. The determination SHALL be by library name, so it covers every
member of the set rather than an enumerated subset. A manifest that names a baked member SHALL
therefore remain valid on every compilation path and SHALL contribute no additional module, and a
manifest that names none SHALL work equally well.

A baked library MAY import another baked library. All compiler hosts — the Chez driver, the REPL's
eager preload, and the embedded host's lazy import closure and auto-import — SHALL handle a baked
library that has imports and SHALL continue to emit byte-identical modules across compilation paths
for the same program.

#### Scenario: A program with no imports needs no manifest, still

- **WHEN** a program that imports nothing (or only `(scheme base)`) is run from a directory with no
  manifest present, after the prelude has been partitioned into more than one baked library
- **THEN** it compiles and runs exactly as before, with no manifest consulted and no library
  resolution failure

#### Scenario: The baked set initializes in dependency order

- **WHEN** a program is compiled and the baked set contains a library that `(scheme base)` imports
- **THEN** that library's module is emitted before `(scheme base)`, its initializer runs before
  `(scheme base)`'s, and each initializer runs exactly once

#### Scenario: Compilation-path parity survives partitioning

- **WHEN** the same program is compiled through the AOT path, the `emit run` command, and the Chez-hosted
  driver against the same partition
- **THEN** the emitted program module is byte-identical across all three, as it was before the
  prelude was partitioned

#### Scenario: Every command has the standard library without a manifest entry for it

- **WHEN** each of the four commands is exercised in a directory whose manifest names only a project's
  own libraries and no member of the baked set
- **THEN** every command resolves `(scheme base)`, so a program referencing a standard-library name
  compiles and runs, a REPL session resolves that name, and a library importing `(scheme base)`
  compiles to its artifact

#### Scenario: A manifest entry for a baked member loads no second copy

- **WHEN** a command starts against a manifest that names `(scheme base)` and the internal substrate,
  after the baked set has been registered
- **THEN** each baked member contributes exactly one module to the session, the manifest entry
  resolves to the baked member, and no duplicate-symbol failure occurs

#### Scenario: The REPL initializes the baked set before the first form

- **WHEN** a REPL session starts with the prelude enabled and the user's first form calls a
  standard-library procedure
- **THEN** each baked member's initializer has already run, in dependency order, and the call
  observes populated globals

### Requirement: Relocated names live in their R7RS-small libraries

Names that R7RS-small places outside `(scheme base)` SHALL be exported by the library the standard
assigns them to, and SHALL NOT be exported by `(scheme base)`. Specifically:

| library | names |
|---|---|
| `(scheme cxr)` | `caaar` `caadr` `cadar` `caddr` `cdaar` `cdadr` `cddar` `cdddr` `cadddr` |
| `(scheme read)` | `read` |
| `(scheme file)` | `open-input-file` `open-output-file` `with-input-from-file` `with-output-to-file` `call-with-input-file` `call-with-output-file` |

Each SHALL be an ordinary library — resolved through the manifest, compiled to a unit artifact, and
linked like any other — not a baked one, and each SHALL be installed alongside the other shipped
libraries so an installed `emit` can import it. `(scheme base)` SHALL retain the depth-2 accessors
`caar`, `cadr`, `cdar`, `cddr`, which R7RS-small does place there.

The procedures' behaviour SHALL be unchanged by relocation; only the library that exports them
changes. There SHALL be no compatibility re-export from `(scheme base)`.

#### Scenario: A relocated name is unbound without its library

- **WHEN** a program that does not import `(scheme read)` references `read`
- **THEN** compilation fails with an unbound-variable error

#### Scenario: A relocated name works when its library is imported

- **WHEN** a program imports `(scheme read)` and calls `read` on an input port, or imports
  `(scheme cxr)` and evaluates `(caddr '(1 2 3))`, or imports `(scheme file)` and opens a file
- **THEN** each behaves exactly as it did when the name was exported from `(scheme base)`

#### Scenario: The depth-2 accessors stay in (scheme base)

- **WHEN** a program with no explicit import evaluates `(cadr '(1 2 3))`
- **THEN** it compiles and returns `2`, because R7RS-small places the depth-2 accessors in
  `(scheme base)`

#### Scenario: The relocated libraries are reachable from an installed emit

- **WHEN** an installed `emit` runs a program importing `(scheme cxr)`, `(scheme read)`, or
  `(scheme file)` from a directory containing no manifest of its own
- **THEN** the library resolves through the installed manifest and the program runs

### Requirement: An internal substrate library carries shared private machinery

Machinery that more than one shipped library needs but that is not public API — the port
representation and the reader's lexeme and datum helpers — SHALL live in a single **internal**
library, named outside the `(scheme …)` namespace that R7RS reserves for the standard.

That library SHALL be part of the baked set, because `(scheme base)` depends on it. It SHALL NOT be
auto-imported, so its exports are in scope only for a library or program that names it explicitly;
an ordinary program SHALL therefore still see none of these names. It is not API and carries no
stability guarantee.

Because `(scheme base)` imports it, the substrate SHALL NOT depend on `(scheme base)`: every name its
body reaches SHALL be defined within it. A name that `(scheme base)` also exports and that the
substrate needs only internally SHALL be defined in the substrate without being exported by it.

**No mutable binding SHALL be shared between the substrate and `(scheme base)` by duplication.** A
top-level binding that is assigned after initialization, or that holds an object whose identity is
observable (a record type descriptor), SHALL be assigned to exactly one library, and every procedure
that assigns it SHALL live in that same library — a unit's top-level bindings are written only by its
own initializer, so assigning an imported binding is not available and duplicating a stateful one
would split the state. Consequently the substrate SHALL NOT contain the exception-handler chain, and
machinery that raises errors SHALL be assigned to the libraries that consume it rather than to the
substrate.

Its resolution SHALL be identical on every path: the paths that build the baked set from the
compiler's baked-in prelude source SHALL resolve it baked, and the paths that resolve `(scheme base)`
through the manifest SHALL find the substrate through the manifest too, so `(scheme base)`'s import of
it resolves on either path. It SHALL be installed alongside the other shipped library sources.

#### Scenario: The substrate does not depend on the library that imports it

- **WHEN** the substrate's unit is compiled
- **THEN** it resolves every name its body references without importing `(scheme base)`, and a name
  `(scheme base)` also exports but the substrate needs only internally is absent from the substrate's
  export list

#### Scenario: A port made through a relocated library is a port everywhere

- **WHEN** a program imports `(scheme file)`, opens a file, and passes the resulting port to a
  `(scheme base)` procedure such as `read-char`, `port?`, or `close-port`
- **THEN** the port is recognized and the operation behaves as it did when both procedures lived in
  `(scheme base)`, because the port's type descriptor is created in exactly one library

#### Scenario: An error from relocated machinery is still catchable

- **WHEN** a program guards an expression that calls a relocated procedure which signals an error —
  for example reading from a non-port or a closed port
- **THEN** the guard catches it, exactly as it did before the relocation, because the exception-handler
  chain is a single binding rather than one copy per library

#### Scenario: The substrate resolves on the manifest-driven paths too

- **WHEN** a path that resolves `(scheme base)` from the manifest starts up, and `(scheme base)`'s
  source imports the substrate
- **THEN** the substrate resolves through the same manifest and `(scheme base)` loads, rather than
  failing because an internal library was reachable only when baked

#### Scenario: Substrate names are not in scope in an ordinary program

- **WHEN** a program with no explicit import references a substrate name such as `rd-atom`,
  `rd-skip-ws`, or `%make-port`
- **THEN** compilation fails with an unbound-variable error, exactly as it did when those names were
  private to `(scheme base)`

#### Scenario: A relocated library reaches the substrate

- **WHEN** `(scheme read)` is compiled, whose `read` calls the reader helpers and the port accessors
- **THEN** it resolves them by importing the substrate, and `(scheme base)` does not export them

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
definition, and SHALL reach the other members by import rather than by body-injection.** A
transformer SHALL be homed only in a library where every procedure its template calls is in scope,
because a template's free identifiers are resolved in its defining library and an unresolvable one
is left as written. `(emit internal)` imports nothing, so it SHALL hold only transformers whose
templates call no procedure; the rest SHALL be homed in `(scheme base)`. `(scheme base)` SHALL
re-export the substrate's transformers, so a unit importing `(scheme base)` — including any user
library — receives every derived form without importing the substrate. A member's body SHALL NOT
receive a copy of a transformer it does not define.

The surface declaration SHALL be able to name a macro, so a `define-syntax` binding can be assigned
a home and a re-export the same way a `define` binding is.

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

#### Scenario: Curating the surface does not change the library's emitted code

- **WHEN** names are removed from `(scheme base)`'s export list with no change to the prelude's
  definitions
- **THEN** the emitted library IR is byte-identical (library emission and code labels are derived
  from binding names, not export status), and only importing **program** modules change — each loses
  one external-global declaration per removed export

#### Scenario: A partition member receives the derived forms by import

- **WHEN** `(scheme read)`, whose reader procedures use `cond` and `let*`, is compiled
- **THEN** it compiles without error, and its body contains no copy of any transformer it does not
  itself define

#### Scenario: The substrate's compile-time half does not widen program scope

- **WHEN** a program imports nothing beyond the auto-imported `(scheme base)`
- **THEN** the derived forms are usable, and names private to `(emit internal)` remain out of scope

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
definition to a library that defines it without exporting it. This is required because a library or
program may import two members of the set at once, and one name offered by two imports resolves
silently to whichever is found first rather than being reported — so a member that needs a name only
for its own body SHALL be able to keep it out of its export list.

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
  reference to a prelude name (procedure or macro) is an unbound/undefined error

#### Scenario: The embedded runner re-homes the prelude like the Chez driver

- **WHEN** a prelude-using program is compiled by the Chez-free embedded runner
  (`scheme-run --emit`) and by the Chez batch driver, both with the prelude enabled
- **THEN** both resolve prelude procedures through `(scheme base)` and emit byte-identical
  program IR — the embedded runner assembles `(scheme base)` from baked-in prelude source
  instead of reading `lib/scheme/base.sld` from disk

### Requirement: (scheme base) links or loads exactly once

The compiler SHALL link `(scheme base)` into an executable exactly once and initialize it
exactly once even when it is auto-imported alongside explicit imports, guaranteed by the
transitive-closure dedup and the one-shot `@"scheme.base:__inited"` guard.

#### Scenario: Auto-import plus explicit import links (scheme base) once

- **WHEN** a program is compiled with the prelude enabled and also explicitly imports another
  library
- **THEN** `scheme.base.ll` appears exactly once in the link and its `__init` runs once

### Requirement: (scheme base) is library zero for the compiler's own build

The compiler binaries themselves — `schemec`, `embed` (the `scheme-run` runner), and `embed-repl`
(the REPL host) — SHALL consume the baked library set as linked libraries rather than carrying a
prepended copy of the prelude's procedures. Their source SHALL be compiled with `(scheme base)`
auto-imported (procedures resolving to `scheme.base:*` external globals, derived-form macros merged
compile-time), and MAY additionally import the internal substrate explicitly where the compiler uses
machinery that `(scheme base)` does not export — the compositional accessors its passes use, and the
reader lexeme helpers the REPL's input-completeness probe reuses. Each binary SHALL link the
committed IR for every member of the baked set, initializing each once via its `__init` guard.

This makes the baked set library zero for the compiler, the largest consumer of the module system,
exactly as it is for user programs. Because the compiler reaches internal machinery by importing the
substrate, no name SHALL be added to a standard library's export list solely to satisfy the
compiler.

#### Scenario: A compiler binary references the prelude through the baked set

- **WHEN** a compiler binary's committed IR is inspected
- **THEN** the prelude procedures it uses appear as external globals resolved against the linked
  baked-set IR, not as the binary's own inlined top-level definitions

#### Scenario: The compiler links each baked library exactly once

- **WHEN** any of the compiler binaries is built from committed IR
- **THEN** it links exactly one module per baked library and runs each `__init` once, and the binary
  behaves identically to the build it replaces

#### Scenario: The compiler's internal use does not widen a public surface

- **WHEN** the compiler uses a name that R7RS-small does not place in `(scheme base)`, such as
  `caddr` or a reader lexeme helper
- **THEN** it resolves that name by importing the substrate, and the name is absent from
  `(scheme base)`'s export list

### Requirement: A library body has its imports' exported macros in scope

A `define-library` body SHALL be compiled with every macro its imports export in scope, under the
external names those libraries export them by, so a macro use in a library body expands exactly as
the same use expands in a program. This SHALL hold for the baked `(scheme base)` as for any other
library: a library that imports `(scheme base)` SHALL be able to use `cond`, `case`, `when`,
`unless`, `let*`, `and`, `or`, `guard`, and `parameterize` in its body.

A library's own `define-syntax` SHALL take precedence over an imported keyword of the same spelling,
matching the user-wins shadowing the runtime environment already gives a `define`.

This SHALL hold identically on all three paths — the Chez batch driver, the REPL, and the Chez-free
embedded `emit run` command — per dev→ship fidelity.

#### Scenario: A library body uses a derived form

- **WHEN** a `define-library` imports `(scheme base)` and its body defines a procedure whose body is
  `(when (> x 1) 42)`
- **THEN** the library compiles without error and the procedure returns `42` for an argument greater
  than 1, rather than reporting `unbound variable when`

#### Scenario: `and` and `or` are available in a library body

- **WHEN** a `define-library` importing `(scheme base)` defines `(define (f x) (and x 7))`
- **THEN** the library compiles and `(f 1)` is `7`

#### Scenario: The three paths agree on a library body's derived forms

- **WHEN** the same library using a derived form in its body is compiled by the Chez driver, loaded
  by the REPL, and linked by the Chez-free `emit run` command
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
SHALL be the same on every path.

#### Scenario: A derived form used in a library that does not import (scheme base)

- **WHEN** a `define-library` with no `(import (scheme base))` uses `(when …)` in its body
- **THEN** the diagnostic names `when` as a macro that is not in scope and names `(scheme base)` as
  the library that exports it, and does not say `unbound variable when`

### Requirement: Conventional library names resolve beneath ordered library roots

For a library name whose components can be represented safely as path components, the shared
resolver SHALL derive a relative source path by rendering each component, joining the components
with the host path separator, and appending `.sld` to the final component. Symbol components SHALL
be rejected from conventional lookup when their names are empty, `.`, `..`, contain a path
separator, or contain a NUL; exact nonnegative integer components SHALL be rendered in decimal.
Names ineligible for conventional lookup SHALL remain resolvable through an exact manifest entry.

For example, `(my stats)` SHALL derive `my/stats.sld`, and `(example net 2)` SHALL derive
`example/net/2.sld`. The resolver SHALL test the derived relative path beneath each configured root
in order and SHALL use the first readable regular file. It SHALL parse the selected source and
require its sole `define-library` form to declare the requested library name before admitting any
artifact or binding from it.

Library discovery SHALL be a host responsibility. The compiler core SHALL continue to perform no
filesystem access and SHALL receive the selected source, source-home, imports, and compile-time
interfaces through the existing path protocol.

#### Scenario: A conventional project library resolves without a mapping

- **WHEN** a configured root contains `my/stats.sld`, that file declares `(define-library (my stats)
  ...)`, and a program imports `(my stats)` with no manifest entry for it
- **THEN** the shared resolver selects that file and the program compiles without a manual
  name-to-source mapping

#### Scenario: Roots are searched in order

- **WHEN** two configured roots both contain a valid `my/stats.sld`
- **THEN** the file beneath the earlier root is selected and the later file is not read

#### Scenario: A declared name mismatch is rejected

- **WHEN** conventional lookup for `(my stats)` selects `my/stats.sld` but that source declares
  `(define-library (other stats) ...)`
- **THEN** resolution fails with a diagnostic naming the requested name, declared name, and selected
  source path, and no artifact from that source is used

#### Scenario: A path-unsafe name requires an exact mapping

- **WHEN** an imported library name contains a component that conventional lookup cannot represent
  safely and no manifest entry names it
- **THEN** resolution reports the library as unresolved without probing a path outside a configured
  root

### Requirement: every path uses one resolved library identity

The Chez driver and the `run`, `build`, `lib`, and `repl` paths SHALL apply the same provider
precedence, conventional path derivation, declaration-name validation, import-closure ordering, and
source-home rules. Once a provider resolves a library, every path SHALL compile that source through
the existing shared compile-unit core, preserving deterministic unit-qualified symbols, compile-time
export interfaces, artifact freshness, tree shaking, and byte-identical full unit IR.

An artifact SHALL continue to be identified by the declared library name, compiler identity, source
content and included-source content, and any existing root-set input for a pruned unit. The provider
kind or spelling by which the same source was reached SHALL NOT create semantically different
artifacts.

#### Scenario: Manifest and path resolution produce the same unit

- **WHEN** one invocation resolves a library through an exact manifest entry and another resolves
  the same source through a conventional root under otherwise identical inputs
- **THEN** both produce byte-identical full unit IR and compile-time interfaces

#### Scenario: REPL and delivered program agree for a path library

- **WHEN** a conventional-path library is imported and exercised in `emit repl`, then the same
  program and resolver configuration are used by `emit build`
- **THEN** both observe identical values, macro expansion, dependency initialization order, and
  once-only initialization

#### Scenario: A warm cache does not change provider precedence

- **WHEN** a cache contains a unit previously reached through one provider but the current resolver
  selects a different source for the same non-baked name
- **THEN** the cache entry is reused only if its recorded source identity matches the selected
  source; otherwise the selected source is compiled
