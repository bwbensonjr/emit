## MODIFIED Requirements

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

## ADDED Requirements

### Requirement: A library body may be included from other files

The compiler SHALL accept `(include ⟨string⟩ …)` and `(include-ci ⟨string⟩ …)` as library
declarations. Each names a file whose top-level forms SHALL be spliced into the library body at the
position of the declaration, in the order the filenames appear, exactly as if those forms had been
written inside a `begin` declaration there. `include-ci` SHALL additionally fold the symbol case of
the forms it reads, so that source written for a case-insensitive Scheme reads correctly; a
bar-quoted symbol is folded as well, because the distinction is not observable after reading.

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

#### Scenario: The same source includes identically on every door

- **WHEN** a library using `include` is compiled by the Chez driver, by `emit lib`, by `emit run`
  through the manifest, and by the REPL's library loader
- **THEN** all doors produce the same unit, and the emitted IR agrees byte for byte where the
  existing cross-door equivalence checks compare it

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
  as reported to the doors' dependency resolution include `(scheme inexact)`

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
every door answers a feature requirement identically. A feature identifier SHALL NOT be advertised
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
  place, and the import participates in dependency resolution on every door

### Requirement: An included filename resolves relative to the file that named it

A filename in `include`, `include-ci`, or `include-library-declarations` SHALL be resolved relative
to the directory of the file in which the declaration appears — for a nested inclusion, relative to
the **including file**, not to the original `define-library` — matching the rule the manifest applies
to a library's `(source …)`. An absolute filename SHALL be used as written. When the source has no
filename (it was read from standard input), a relative filename SHALL resolve against the current
directory.

Reading files is the door's responsibility, not the compiler core's: the core SHALL obtain forms
through a reader the door installs, and SHALL perform no file access itself.

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
