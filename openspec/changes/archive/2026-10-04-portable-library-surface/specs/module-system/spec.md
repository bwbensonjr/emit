# Spec Delta

## REMOVED Requirements

### Requirement: Whole-module import surface

**Reason**: Import sets are now supported, so a requirement that every import is all of a
library's exports, and that an import set is rejected by name, no longer holds.

**Migration**: Replaced by "Import surface" and "Import sets select and rename exports in the
importer" below. A whole-library `(import (lib))` behaves exactly as before. A source that
relied on the import-set diagnostic now compiles.

## MODIFIED Requirements

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

When a program's own imports include an import set whose innermost library is `(scheme base)`,
that import set SHALL be the program's whole view of `(scheme base)`: the implicit import SHALL
NOT also make the library's other exports visible. `(scheme base)` is still linked or loaded and
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
  reference to a prelude name (procedure or macro) is an unbound/undefined error

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
  `(b:map (lambda (x) (+ x 1)) '(1 2))`
- **THEN** the program produces `(2 3)`, and an unprefixed reference to `map` is reported as unbound
- **AND** a primitive the compiler integrates, such as `car`, and a core syntactic keyword, such as
  `if` or `lambda`, stay visible under their own names, as they are under `--no-prelude`, because
  neither is a binding `(scheme base)` exports

### Requirement: `cond-expand` selects library declarations by feature

The compiler SHALL accept `(cond-expand ⟨clause⟩ …)` as a library declaration, where each clause is
`(⟨feature requirement⟩ ⟨declaration⟩ …)` and the last clause MAY be `(else ⟨declaration⟩ …)`. A
feature requirement SHALL be a feature identifier, `(library ⟨library name⟩)`,
`(and ⟨requirement⟩ …)`, `(or ⟨requirement⟩ …)`, or `(not ⟨requirement⟩)`. The declarations of the
**first** clause whose requirement is satisfied SHALL be spliced at the position of the `cond-expand`
and expanded recursively; the other clauses SHALL have no effect. If no clause is satisfied and
there is no `else`, the `cond-expand` SHALL contribute nothing.

The set of advertised feature identifiers SHALL be a single declaration in the compiler, so that
every compilation path answers a feature requirement identically. A feature identifier SHALL NOT be
advertised unless Emit provides the corresponding feature. The set SHALL include `r7rs`, `emit`,
`ieee-float`, and `srfi-0`.

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
- **THEN** the requirement is satisfied and that clause's declarations are spliced, rather than the
  form being reported as unsupported

#### Scenario: `srfi-0` is advertised

- **WHEN** a library declares `(cond-expand (srfi-0 (begin (define ok #t))) (else (begin (define ok #f))))`
  and exports `ok`
- **THEN** `ok` is `#t`

#### Scenario: `cond-expand` can contribute imports and exports

- **WHEN** a `cond-expand` clause contains `(import (scheme inexact))` and `(export root)`
- **THEN** the selected clause's `import` and `export` are treated exactly as declarations written in
  place, and the import participates in dependency resolution on every path

## ADDED Requirements

### Requirement: Import surface

The compiler SHALL accept `(import ⟨import set⟩ …)`, where an import set is a library name or one of
the R7RS transforms `only`, `except`, `prefix`, and `rename` applied to another import set. A bare
library name SHALL make every export of the library visible in the importing unit under its
external name: a runtime export resolved as an `imported` binding, and a **macro** export merged
into the importing compile's macro environment as a transformer keyed on that external name. A
transform SHALL select and rename those same exports without changing what each one denotes.

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
Sets SHALL nest. A transform SHALL apply to runtime and macro exports alike, SHALL run in the
importer over the library's existing compile-time interface, and SHALL NOT change any library
artifact. Every path SHALL produce the same bindings for a given import set.

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

### Requirement: Overlapping imports resolve deterministically

When two imports in one unit make the same name visible with different bindings, the compiler SHALL
choose one by a single documented precedence rule that is identical on every path, and SHALL NOT
report an error. A definition in the importing unit SHALL take precedence over every import, as
today.

#### Scenario: Two libraries export one name

- **WHEN** a program imports `(liba)` and `(libb)`, both export `f` with different definitions, and
  the program calls `f`
- **THEN** the call resolves to the same library's `f` on every path, and that library is the one
  `docs/MODULES.md` says the precedence rule selects

### Requirement: A `(library ⟨name⟩)` feature requirement is answered by the import resolver

A `(library ⟨name⟩)` requirement SHALL be satisfied exactly when importing that name in the same
compilation would resolve it, through baked libraries, manifests, or library roots. The answer SHALL
NOT depend on whether the library compiles. A name that resolves SHALL resolve to the same provider
an `import` of it in that compilation selects. Every path SHALL give the same answer.

#### Scenario: A library under a root satisfies the requirement

- **WHEN** a library root contains `srfi/8.sld` defining `(srfi 8)`, and a library declares
  `(cond-expand ((library (srfi 8)) (import (srfi 8))) (else (begin (define-syntax receive …))))`
- **THEN** the first clause is selected and the library imports `(srfi 8)`

#### Scenario: An unresolvable library selects the fallback

- **WHEN** no provider for `(srfi 8)` exists and the same declaration is compiled
- **THEN** the `else` clause is selected and the library compiles using its own `receive`

#### Scenario: A malformed library name is an error

- **WHEN** a requirement is `(library srfi-8)` or `(library)`
- **THEN** compilation reports the requirement as malformed, naming it

#### Scenario: A requirement inside an include is answered the same way

- **WHEN** a `(library …)` requirement arrives through `include-library-declarations`
- **THEN** it is answered exactly as one written directly in the `define-library`

### Requirement: `include` and `cond-expand` splice at a program's top level

`include`, `include-ci`, and `cond-expand` SHALL be accepted as top-level forms of a program and of a
REPL input. Each SHALL splice its forms in place before imports are collected, so a spliced `import`
or definition behaves as one written there. A filename SHALL resolve relative to the file naming it,
or the current directory for standard input.

#### Scenario: A program includes its definitions

- **WHEN** a program at `app/main.scm` contains `(include "defs.scm")` followed by `(f 1)`, and
  `app/defs.scm` defines `f`
- **THEN** the program compiles from any working directory and `(f 1)` calls the included `f`

#### Scenario: A program selects its imports by feature

- **WHEN** a program begins `(cond-expand (emit (import (mylib))) (else (import (otherlib))))` and
  calls `greet`
- **THEN** `(mylib)` is imported, participates in dependency resolution on every path, and
  `(otherlib)` is never resolved

#### Scenario: The REPL splices an include

- **WHEN** a REPL session evaluates `(include "defs.scm")` and then `(f 1)`
- **THEN** `f` is defined in the session and the result matches the batch path's

### Requirement: `include` and `cond-expand` splice into a body

In a `lambda`, `let`-family, or `define` body, or a library `begin`, `include`, `include-ci`, and
`cond-expand` SHALL splice their forms in place before the body's definitions are collected. In
expression position each SHALL behave as `begin` over its forms. A local binding of the keyword
SHALL shadow it. A nested filename SHALL resolve relative to its own file.

#### Scenario: An included file supplies internal definitions

- **WHEN** a procedure body is `(include "helpers.scm") (helper 1)` and `helpers.scm` defines
  `helper`
- **THEN** `helper` is an internal definition of that body and the call returns its value

#### Scenario: `cond-expand` in expression position

- **WHEN** a program evaluates `(display (cond-expand (emit 'emit) (else 'other)))`
- **THEN** it prints `emit`

#### Scenario: A body `cond-expand` contributes definitions

- **WHEN** a body contains `(cond-expand (emit (define x 1)) (else (define x 2)))` followed by `x`
- **THEN** the body's value is `1`

#### Scenario: A local binding shadows the keyword

- **WHEN** a procedure binds a parameter named `include` and its body calls `(include "x")`
- **THEN** the call is an ordinary application of the parameter and no file is read

#### Scenario: An include inside an included library body resolves beside its file

- **WHEN** `lib/a/a.sld` declares `(include "impl/body.scm")` and `impl/body.scm` contains
  `(include "more.scm")`
- **THEN** `lib/a/impl/more.scm` is read, and the include-cycle and unreadable-file diagnostics
  apply to it as to a declaration-level include

### Requirement: The `features` procedure

`(scheme base)` SHALL export `features`, a procedure of no arguments returning a newly allocated list
of the advertised feature identifiers. The list SHALL contain the same identifiers `cond-expand`
tests, derived from the single declaration, so the two cannot disagree.

#### Scenario: `features` reports the advertised set

- **WHEN** a program evaluates `(memq 'emit (features))` and `(memq 'r7rs (features))`
- **THEN** both are true values, on every path

#### Scenario: `features` agrees with `cond-expand`

- **WHEN** a test enumerates `(features)` and, for each identifier, compiles a `cond-expand` on it
- **THEN** every identifier selects its clause, and an identifier absent from the list does not
