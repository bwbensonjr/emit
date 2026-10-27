# Modules

Emit implements a subset of the R7RS-small module surface — `define-library`, `import`, and
`export` — where **a library is the shared unit of compilation**: a `.sld` source compiles once to
an artifact (`.ll` IR + a compile-time `.exports` table) that is consumed identically whether it is
linked into a batch build or loaded into the REPL. The prelude itself is "library zero," re-homed as
`(scheme base)` and auto-imported into every program (see [`(scheme base)`](#scheme-base) below).

This is a v0 slice — see [Scope & limits](#scope--limits). The runnable examples under
`test/modules/` are the source of truth for syntax; every snippet below is drawn from them.

## Writing a library

A library source is one `(define-library …)` form, conventionally in a `.sld` file:

```scheme
;; test/modules/mylib.sld
(define-library (mylib)
  (export greet)
  (begin
    (define (helper x) (+ x 100))          ; internal (not exported)
    (define (make-adder n) (lambda (x) (+ x n)))
    (define (greet) (helper ((make-adder 5) 37)))))   ; => 142
```

- **`(export spec …)`** — each `spec` is a bare name, or `(rename internal external)` to publish an
  internal binding under a different name. Importers see only exported names.

  ```scheme
  ;; test/modules/rename-lib.sld
  (define-library (rename-lib)
    (export (rename %fast-map fmap))       ; importers see `fmap`; `%fast-map` stays private
    (begin (define (%fast-map) 77)))
  ```

- **`(import (lib) …)`** — a library may import other libraries and use their exports; the build
  resolves the transitive closure (see [Semantics](#semantics)).

  ```scheme
  ;; test/modules/chain-a.sld
  (define-library (chain-a)
    (import (chain-b))                      ; chain-a uses chain-b's export
    (export a-plus)
    (begin (define (a-plus) (+ (base-val) 5))))   ; base-val comes from chain-b => 15
  ```

- **`(begin form …)`** — the library body: a mutually-recursive group of top-level `define`s and
  `define-syntax` forms.

- **A macro is exportable** (change: `library-macro-export`, issue #48). A name bound by
  `define-syntax` at the body's top level goes in the export list like any other, bare or renamed,
  and importers use it as a macro:

  ```scheme
  ;; test/modules/macro-helper-lib.sld
  (define-library (macro-helper-lib)
    (export twice)                          ; `helper` and `%inc` stay PRIVATE
    (begin
      (define (helper x) (* x 3))
      (define-syntax %inc (syntax-rules () ((_ e) (+ e 1))))
      (define-syntax twice (syntax-rules () ((_ e) (helper (%inc e)))))))
  ```

  A template may reference names the library does not export — a private procedure, a private
  macro — because each is resolved in the *exporting* library before the transformer leaves it (see
  [How an exported macro travels](#how-an-exported-macro-travels)). One name may not be bound both
  by `define` and by `define-syntax`; that is rejected by name.

- **A library body may use the macros it imports** (change: `library-body-macro-scope`, issue #55).
  A library that imports `(scheme base)` gets `cond`, `case`, `when`, `unless`, `let*`, `and`, `or`,
  `guard` and `parameterize` in its own body, exactly as a program does:

  ```scheme
  (define-library (derived-form-lib)
    (import (scheme base))                  ; without this, `when` is not in scope
    (export dfc)
    (begin
      (define (dfc x) (cond ((> x 5) 'big) ((> x 2) 'mid) (else 'small)))))
  ```

  Use one without the import and the diagnostic says so by name —
  `macro not in scope -- add (import (scheme base))` — rather than reporting an unbound variable.

- **A macro export may be a macro the library imported** (same change). Re-exporting is ordinary
  R7RS, and it is how `(scheme base)` publishes the derived forms that are homed in the substrate:

  ```scheme
  (define-library (reexport-lib)
    (import (macro-helper-lib))
    (export twice (rename twice thrice))    ; `twice` is not defined here
    (begin (define (rl-marker) 1)))
  ```

  A re-exported transformer travels with the resolution its **defining** library performed, so an
  importer two hops away still reaches that library's private bindings.

- **A library may re-export an imported runtime binding.** Its export row names the original
  library's global location; the facade does not allocate a second slot or copy the value. Renaming
  changes the public name only, and a later assignment by the owner remains visible through every
  facade. Imported procedures also retain their source call descriptor when one exists:

  ```scheme
  (define-library (list-facade)
    (import (only (scheme cxr) cadr))
    (export (rename cadr second)))
  ```

  An importer sees `second`, while the artifact points to the original `(scheme cxr)` location.
  The `only` set is intentional: an import set may hide or rename a binding before it is
  re-exported, and only the visible spelling can be named by the facade.

- **An exported macro may depend on an imported macro.** If a transformer defined in a library's
  body invokes a transformer from an imported library, the compiler carries that imported
  transformer and its reachable private macro dependencies in the compile-time interface. Their
  original qualified names and runtime references are retained, so a downstream importer does not
  need to import the helper library directly. Explicit macro re-exports use the same rule.

Beside `export`, `import`, and `begin`, Emit recognizes the four R7RS splicing declarations,
`include`, `include-ci`, `include-library-declarations`, and `cond-expand` (see
[Semantics](#semantics) and [Portable sources](#portable-sources)). Anything else in declaration
position is **rejected by name** rather than absorbed into the body — see
[When you break a rule](#when-you-break-a-rule).

## Importing in a program

A program imports a library with a top-level `import` and then uses its exports:

```scheme
;; test/modules/prog-mylib.scm  => 142
(import (mylib))
(greet)
```

### Using the SRFI 1 package

Procedure bodies in libraries support internal definitions with fixed, dotted,
or rest-only formals, just as program bodies do. For example,
`(define (callback . args) #f)` inside another procedure defines a variadic
callback. All internal definitions share their body's scope, and each procedure's
formals shadow imported macro keywords within that procedure's body.

The vendored, unmodified snow-fort SRFI 1 0.1.3 package is available from the ordinary
`lib/srfi/` hierarchy in checkouts and installations. Prefix it when `(scheme base)` may provide overlapping names, so the source makes
clear which implementation each call uses. This representative example also exercises SRFI 227's
`opt-lambda` dependency:

```scheme
;; test/snow/srfi-1-smoke.scm
(import (prefix (srfi 1) s1:)
        (srfi 227))

(define optional-value (opt-lambda (x (y 9)) (list x y)))
(list (s1:fold + 0 '(1 2 3))
      (s1:filter even? '(1 2 3 4))
      (s1:append-map (lambda (x) (list x (* 10 x))) '(1 2 3))
      (s1:caddr '(1 2 3 4))
      (s1:iota 4 2)
      (optional-value 'x)
      (optional-value 'x 10))
```

Run it through the embedded compiler from the repository root:

```sh
build/emit run --no-manifest-chain --manifest emit-libs.scm \
  test/snow/srfi-1-smoke.scm
# => (6 (2 4) (1 10 2 20 3 30) 3 (2 3 4 5) (x 9) (x 10))
```

The same source is used for the Chez driver, `emit build`, and `emit repl` acceptance paths.
The shipped sources are optional: they are compiled and registered only when imported,
and project providers can override installed copies. Availability uses
`(cond-expand ((library (srfi 64)) ...) (else ...))`, not new global SRFI features.
External portable packages can still be supplied with `-L /path/to/packages`.

| Library | Pinned version | Upstream package assertions |
|---|---|---|
| SRFI 1 | 0.1.3 | 147 passes |
| SRFI 2 | 0.1.1 | 29 passes |
| SRFI 8 | 0.1.2 | 2 passes |
| SRFI 227 | 0.1.3 | 13 passes |
| SRFI 64 Emit port | 0.1.7 | 47 passes, 2 upstream-declared expected failures |

The four target package suites execute unchanged through source-driven Chez and
native run/build/REPL acceptance. Their runner checks exact counts and completion
before upstream `(exit 0)`; a successful process alone is not sufficient. This
is evidence for those versions, not a blanket SRFI conformance claim. SRFI 64's
port removes evaluator/complex dependencies, provides real absolute-error
approximate comparison, and explicitly diagnoses `test-read-eval-string` as
unsupported because `(scheme eval)` is absent. It adds no evaluator or fake
implementation feature. See `test/snow/README.md` for provenance, the reproducible
port patch, exact coverage, and the two expected-failure self-tests.

Measured on macOS arm64 with LLVM 23.1.2 and the default native build profile,
comparing the pre-change bootstrapped compiler with the regenerated compiler:

| Delivered program | Before | After | Symbol check |
|---|---:|---:|---|
| `(write 42)` without SRFI imports | 35,152 bytes | 35,152 bytes | 58 symbols in both; no SRFI symbols |
| `test/snow/srfi-1-smoke.scm` | 91,504 bytes | 91,536 bytes | 245 to 246 symbols; only `scheme.base:values` added |

The 32-byte SRFI case increase accompanies multiple-value continuation delivery;
installing optional sources does not add payload to the no-SRFI executable.

A name the program defines itself shadows an imported one of the same spelling (**user-wins
shadowing**).

### Import sets

An import may select and rename what it brings in, with the four R7RS import sets, nested to any
depth (change: `portable-library-surface`):

```scheme
;; test/import-sets/prog-nest.scm  => 42
(import (prefix (only (iset a) greet) m:))
(m:greet)
```

| set | visible names |
|---|---|
| `(only S id …)` | just the named ones |
| `(except S id …)` | all but the named ones |
| `(prefix S p)` | every name, spelled `p` + name |
| `(rename S (from to) …)` | every name, with each `from` spelled `to` |

- **A set is a compile-time view, not code.** It rewrites the imported library's export table in
  the importer, and the library's `.ll` and `.exports` do not change. A renamed procedure still
  reaches the same global, and a call to it is still a direct cross-unit call.
- **Macros come along.** `(prefix (iset a) k:)` makes the macro `swap!` usable as `k:swap!`. A macro
  that is hidden or renamed does not break another macro written on top of it, because the library
  resolved that reference when it was compiled.
- **Naming what is not there is an error.** `(only (iset a) nope)` reports
  `import: nope is not exported by (iset a) in (only (iset a) nope)`, and a misshapen set such as
  `(prefix (iset a))` reports `import: malformed import set: (prefix (iset a))`.
- **One library through two sets gives both views.** It is still one dependency, resolved,
  linked, and initialized once.
- **Sets work everywhere `import` does**: in a program, in a `define-library`, and at the REPL
  prompt, where a later import of the same library through another set adds names.
- **An explicit `(scheme base)` set replaces the implicit import.** A program normally sees all of
  `(scheme base)` without asking. If it imports `(scheme base)` through a set, that set is its whole
  view: `(import (except (scheme base) map))` leaves `map` unbound, and
  `(import (prefix (scheme base) b:))` turns `cond` into `b:cond`. A bare `(import (scheme base))`
  changes nothing.
- **Primitives and syntax follow sets too.** Integrated primitives (`car`, `+`, `eq?`) and
  core/auxiliary syntax (`if`, `lambda`, `define`, `else`, `=>`) have explicit compile-time
  exports. Under `(prefix (scheme base) b:)`, write `(b:car (b:quote (1 2)))`; bare `car` and
  `quote` are unavailable. Primitive values such as `b:car` still work as arguments to `b:map`.
  A different standard library does not publish these names merely because its name starts
  with `scheme`. The explicit `--no-prelude` compiler environment retains builtins for low-level
  compiler inputs; it does not restore hidden names in an ordinary import view.

### Overlapping imports

When two imports expose different bindings under the same visible name, compilation fails
with a diagnostic naming the identifier and both libraries. This applies across procedures,
macros, primitives, and syntax, including collisions introduced within one `rename` set:

```scheme
;; test/import-sets/prog-overlap.scm: rejected import conflict
(import (iset over1))   ; f => 1, macro m => 'one
(import (iset over2))   ; f => 2, macro m => 'two
(list (f) (m))
```

Use selection or renaming to choose explicitly. Re-importing the same original binding is
legal, including through re-exports and diamonds; identical transformer text from independent
definitions does not make them the same binding. A local definition wins over a valid import
view, but cannot conceal a conflict between imports. At the REPL, the complete import is
validated before initialization or publication, so a rejected import preserves the previous view.

### Lexical macros and compile-time interfaces

`let-syntax`, `letrec-syntax`, and internal `define-syntax` support `syntax-rules` transformers.
`let-syntax` transformer specifications see the enclosing environment; `letrec-syntax`
specifications see all keywords in their recursive group. Internal syntax definitions share
the body definition group with variables, including definitions exposed by prefix macros and
splicing `begin`. These local scopes do not publish names outside their bodies.

Templates preserve definition-site references and the lexical context of substituted source.
Introduced binders are fresh even when they share a spelling with a known global or keyword.
Literal matching compares original binding identities, including imported aliases. This keeps
private helpers working under user bindings with the same spelling, including `%do-step`,
while a user-written reference to a shadowing procedure still calls that procedure.

Source names and lowered storage names are separate. Generated local targets cannot collide
with qualified imported globals, and colon-bearing source names retain their original public
spellings through exports and REPL registration. Primitive-shadowing source definitions likewise
receive distinct storage, so imported macro references retain their original primitive binding.
A later source definition also cannot overwrite
a private slot retained by an earlier transformer merely by guessing its generated spelling.

The readable export interface retains runtime symbol rows and call descriptors and adds tagged
compile-time binding metadata. Primitive/core/auxiliary exports carry kinds and origin identities;
transformers carry origin identities and finite definition contexts. Forwarding and renaming
retain those origins. Context is absent from the runtime unit and delivered executable.
Full interfaces are deterministic across Chez and native compilation. Older runtime-only
tables and existing fixed/variadic call descriptors remain readable. Macro artifacts lacking
the required context must be rebuilt: source-backed caches invalidate automatically, and an
incompatible artifact supplied without source reports a rebuild diagnostic.

`display` and `write` retain their established base extension bindings. `(scheme write)`
re-exports those same primitive identities, so importing both libraries is legal and prefixed
aliases still denote the same binding. First-class calls preserve the optional output port.

Malformed local bindings, transformers, and `case-lambda` clauses report the offending syntax
rather than a compiler-internal pair-access error. Dotted `define-values` remains unsupported
and is reported by name. A rejected REPL form leaves earlier valid definitions usable.

## Portable sources

R7RS lets one source serve several Schemes: `include` and `cond-expand` work in **every** position,
and a source asks which implementation it is on with feature identifiers and `(library ⟨name⟩)`.
This is how a snow-fort.org package, an SRFI's reference implementation for example, carries its
per-implementation choices (change: `portable-library-surface`).

**Everywhere, not only in `define-library`.** At a program's top level, at the REPL prompt, in a
library `begin`, and inside any body, `include`, `include-ci`, and `cond-expand` splice their forms
in place. An included definition is an ordinary definition there, internal to the body if it is in
a body, and an `import` a top-level `cond-expand` selects is a real import. In expression position
each behaves as `begin`. A local binding of `include` or `cond-expand`, or a macro of that name,
shadows the keyword.

```scheme
;; test/import-sets/app/body-include.scm  => 10
(define (g)
  (include "helpers.scm")       ; defines helper2, internal to g
  (helper2 1))
(g)
```

A filename resolves **beside the file it is written in**, however deep: an include inside a lambda
body in `sub/a.scm` reads `sub/b.scm`. Source from standard input resolves against the current
directory. At the REPL a typed `(include "defs.scm")` runs its forms one at a time, as if typed, and
the first one that fails stops the rest.

**Feature identifiers.** `(features)` returns them, and `cond-expand` tests them. They come from one
declaration in the compiler, so the two cannot disagree:

| identifier | why it is true |
|---|---|
| `r7rs`, `emit` | the language and the implementation |
| `ieee-float` | inexact numbers are IEEE 754 doubles |
| `srfi-0` | `cond-expand` itself, in every position |
| `srfi-6`, `srfi-9`, `srfi-16`, `srfi-23`, `srfi-30`, `srfi-39`, `srfi-62`, `srfi-87` | string ports, `define-record-type`, `case-lambda`, `error`, nested block comments, parameters, datum comments, `=>` in `case`: each provided natively, and each checked by a test of the SRFI's behavior |

Deliberately absent: `exact-closed` (fixnum overflow traps rather than promoting), `full-unicode`,
`ratios`, `exact-complex`, OS and CPU flags (they describe the target), and SRFIs Emit does not
provide, such as `srfi-2` and `srfi-8`. An identifier says a *feature* is present. It does not
promise a `(srfi N)` library; ask that with `(library (srfi N))`.

**`(library ⟨name⟩)`** holds exactly when importing that name in the same compilation would resolve
it, through the baked set, manifests, or library roots, by the resolver `import` uses. A library
that is available is available whether or not it would compile, and the provider that satisfies
the requirement is the one the import then gets:

```scheme
;; test/import-sets/lib/iset/needs8.sld
(define-library (iset needs8)
  (import (scheme base))
  (export got)
  (cond-expand
    ((library (iset eight)) (import (iset eight)))
    (else (begin (define (eight-val) (quote fallback)))))
  (begin (define (got) (eight-val))))
```

With `-L test/import-sets/lib8` the first clause is taken. Without it the fallback is. A cached unit
records the answers it was compiled under, so adding or removing a library recompiles the units
that asked about it. That covers both the `emit` cache and the Chez driver's `.stamp`.

The `emit` binary's resolver is C++ on the far side of the compiler's mode protocol, so it answers
by query rather than by callback. The imports query (mode 12) leaves an unanswered requirement
*pending*, the host reads the pending names (mode 23), resolves them, answers (mode 24), and asks
again until nothing is pending. Answering one can expose another, for a `cond-expand` nested inside
a selected clause. Compilation runs only after that, and a requirement still unanswered then is an
error naming it, never a silent `#f`. `EMIT_VERBOSITY=verbose` narrates each answer
(`answer (library (iset eight)) -> available`).

## Hybrid library resolution

Most libraries need no name-to-file mapping. Emit maps an eligible R7RS name beneath an ordered
library root: `(my stats)` becomes `my/stats.sld`, and `(example net 2)` becomes
`example/net/2.sld`. Each symbol or nonnegative exact integer is one path component. Empty
symbols, `.`, `..`, NUL, and symbols containing `/` or `\` are deliberately not mapped;
use an exact manifest entry for those names. The first readable regular file wins, but Emit admits
it only when its sole form is `define-library` with exactly the requested name.

The resolver constructs provider records in this order:

1. baked libraries;
2. exact entries in the project manifest;
3. repeated `-L DIR` / `--library-path DIR` roots;
4. roots in `EMIT_LIBRARY_PATH`;
5. `lib` beside the project manifest, or `./lib` without one;
6. each installed manifest followed by its sibling `lib` root.

Physical roots and manifests are deduplicated at their first occurrence. A successful answer is
memoized for the compilation session, so a library cannot change providers midway through its
dependency graph. Baked names are authoritative; project providers may override non-baked shipped
libraries. The host owns filesystem access and hands source text, source home, imports, and
compile-time interfaces to the same compiler core used by every compilation path.

### Exact manifests

A manifest is an s-expression file (default `emit-libs.scm`) for exceptional layouts, exact
overrides, artifact directories, and named program targets:

```scheme
;; each entry: (library NAME (source PATH) [(artifacts DIR)])
((library (scheme base) (source "lib/scheme/base.sld"))
 (library (mylib)       (source "mylib.sld"))
 (library (chain-a)     (source "chain-a.sld"))
 (library (chain-b)     (source "chain-b.sld")))
```

- `source` is the `.sld` path. `artifacts` is where the compiled `.ll`/`.exports` land (default
  `build/lib`). **Entry order is irrelevant** — the build computes the topological order itself.
- **A relative path in a manifest is relative to that manifest**, not to the directory you ran
  from (change: `manifest-search-path`). Absolute paths are used as given. So a manifest carries
  its library sources with it and resolves identically from anywhere — which is exactly what lets
  an installed `<prefix>/share/emit/emit-libs.scm` say `lib/scheme/base.sld` and mean the file
  beside itself. The rule covers a library's `source`, an explicit `artifacts`, and a program
  entry's `source`/`output`; the *default* artifact dir (`build/lib`) is the driver's own and
  stays relative to the invocation.
- The compatibility `emit-libs.scm` at the repo root lists the shipped libraries — `(emit internal)`,
  `(emit filesystem)`, `(scheme base)`, `(scheme cxr)`, `(scheme read)`, `(scheme file)`, `(scheme inexact)`,
  `(scheme case-lambda)`, `(scheme char)`, `(scheme process-context)`, and `(scheme write)`; point
  `--manifest` at your own for additional libraries (as the test
  suites do with `test/modules/emit-libs.scm`). These mappings are not required when the sources
  occupy their conventional paths. Listing a library costs a program nothing unless
  it imports it: the `emit run` command preloads lazily (see below) and `emit build` links only the
  program's import closure. Your own manifest need not name `(scheme base)` or `(emit internal)`:
  every compiler host registers the baked set before reading the manifest (see *The shipped libraries*).

### Where manifests and roots are found

Every compiler host looks for the manifest the same way (change: `manifest-search-path`, issue #35):

| # | candidate | for |
|---|---|---|
| 1 | `--manifest FILE` | an explicit request |
| 2 | `$EMIT_MANIFEST` | an explicit request |
| 3 | `./emit-libs.scm` | the in-repo / in-project case |
| 4 | `<dir of the real path of the running exe>/../share/emit/emit-libs.scm` | a relocatable install |
| 5 | `<build-time PREFIX>/share/emit/emit-libs.scm` | the prefix the binary was built for |

- **1–2 select the first manifest; 4–5 extend it for libraries** (change:
  `chain-explicit-manifests`, issue #114). `--manifest FILE` wins over `$EMIT_MANIFEST`. A readable
  explicit file is the project: candidate 3 is skipped, so the caller's unrelated working directory
  cannot leak into that project, and every readable installed candidate follows it. If the explicit
  file is missing that is still an error rather than a fallback to different project inputs.
- **Without an explicit selection, 3–5 are a search and chain** (change:
  `installed-emit-completeness`, issue #44). Every readable candidate is used in order. Under either
  route, a **library name** comes from the first manifest that names it, so a project manifest
  **extends** the installed one rather than replacing it. Your project keeps every shipped library
  without naming it or embedding an install path; define a name yourself and yours wins.
- **`--no-manifest-chain` selects only the first readable manifest.** It controls manifests only.
  **`--no-library-paths`** independently disables explicit, environment, project, and installed
  directory providers. Use both with `--manifest FILE` for exact single-manifest resolution.
- A physical manifest reached through more than one spelling (an explicit symlink, the
  executable-relative candidate, and the same build-time prefix, for example) is used only once;
  the first spelling owns narration and relative paths.
- A missing candidate is ordinary, and finding no manifest at all is *not* an error: `(scheme base)`
  is baked into the binary, so a program that imports only baked-in libraries needs no manifest
  anywhere. Anything else is reported by name at import resolution.
- **Each entry's relative `(source …)` still resolves against its own manifest's directory.** The
  rule has not changed; it simply now applies to more than one manifest, so a library inherited
  from a later candidate reads the sources that shipped beside *it*.
- **Program lookup does not chain.** `emit build NAME` resolves a `(program …)` entry against the
  **first** manifest only. A program is project-specific by nature, so an unknown name is reported
  against your own manifest — the file you can fix — rather than searched for in an installed one.
- Candidate 4 resolves the executable through symbolic links, so a Homebrew-style symlink in
  `<prefix>/bin` finds what was installed beside the *real* binary. Candidate 5 covers the case
  where the install is not where it was built for.
- Because candidate 3 is searched first, **installation is additive**: inside the repo you always
  get the repo's own `emit-libs.scm`, even with an `emit` installed system-wide. Chaining does not
  weaken that — a later candidate is consulted only for a name the earlier one does not resolve.
- Each compiler host narrates every manifest it resolved on stderr (`resolve manifest -> …`, the later ones
  tagged `[chained]`), and names the manifest that supplied a library when it was not the first
  (`chain <manifest> -> <libraries>`). All of it is silenced by `EMIT_VERBOSITY=quiet` and none of
  it touches stdout. `make install` produces the layout candidates 4–5 look for; see
  `test/install-layout-tests.sh`.

The Chez driver (`src/compile.ss`) is a bootstrap-only path, but accepts the same `-L`,
`--library-path`, `EMIT_LIBRARY_PATH`, and `--no-library-paths` controls and uses the same safe
name mapping. It is never installed; the shipped C++ host owns executable-relative installed roots.

A manifest may also carry **program entries** — the deliverables `emit build` produces (change:
`emit-build-bin-entry`):

```scheme
;; a program entry: (program NAME (source PATH) [(output EXE-PATH)])
((library (scheme base) (source "lib/scheme/base.sld"))
 (library (mylib)       (source "mylib.sld"))
 (program mylib-app     (source "prog-mylib.scm") (output "build/mylib-app")))
```

- `NAME` is a bare symbol (distinct from a library name, which is a list), `source` is the
  program's top-level source file, and the optional `output` is the delivered executable's path
  (default `build/<NAME>`).
- A program entry is **not** a library: it is never a target of `import`, and library import
  resolution ignores it. See [`emit build`](#emit-build--deliver-a-program) below.

## Building and running

Three compilation paths exercise the module system: the Chez driver, the REPL, and the Chez-free
embedded runner used by `emit run` and `emit build`. All share one compiler core, so a library's
compiled bytes are identical across them (dev→ship fidelity).

### Batch / AOT (and JIT, bitcode) — the Chez driver

`src/compile.ss` resolves imports through exact mappings and conventional roots, compiles each library to a unit, and links
runtime + units + program. All three `--backend`s (`aot` default, `jit`, `bitcode`) resolve imports
and the `(scheme base)` auto-import identically:

```sh
chez --libdirs src --script src/compile.ss test/modules/prog-mylib.scm \
     --manifest test/modules/emit-libs.scm -o /tmp/prog
/tmp/prog                     # => 142

# same program, in-process JIT via lli, or a bitcode artifact:
chez --libdirs src --script src/compile.ss test/modules/prog-mylib.scm \
     --manifest test/modules/emit-libs.scm --backend jit
```

### REPL — interactive import

The shipped `emit repl` eagerly registers exact manifest libraries, then resolves conventional
libraries on their first interactive `import`:

```sh
build/emit repl --manifest test/modules/emit-libs.scm
> (import (mylib))
> (greet)
142
```

### Chez-free embedded runner — the `emit run` command (user libraries)

`emit run` compiles and runs a whole program with **no Chez**, and resolves user-library
`import`s through the hybrid provider chain — the *`emit run` command*, at parity with the AOT and REPLs (change:
`run-door-user-libraries`). `(scheme base)` is baked in, so a plain program needs no manifest at
all — it runs from any directory, installed or not. The program source is read from a
`FILE` argument when given, otherwise stdin:

```sh
echo '(map (lambda (x) (* x x)) (list 1 2 3))' | build/emit run   # => (1 4 9)   no manifest needed
build/emit run --manifest test/modules/emit-libs.scm test/modules/prog-mylib.scm   # => 142
```

the `emit run` command reuses the REPL's Chez-free machinery: the host resolves and reads each
NEEDED library source — the transitive closure of the program's imports, not the whole manifest
(see [Lazy preload](#lazy-preload-on-the-run-path)) — and hands the text to the embedded
compiler through a small mode protocol, then the
program's `@scheme_entry` initializes the imported units in topological order before running — so
the emitted program module is **byte-identical** to the AOT path's for the same manifest (dev→ship
fidelity). `emit build` uses the same `--emit` path for the native build.

### `emit build` — deliver a program

`emit build` turns either a direct `.scm`/path-shaped source or a manifest **program entry** into
a standalone native executable — Chez-free end to end, entirely within the compiled `build/emit` binary (it emits
the IR in-process and forks `clang`):

```bash
# resolve (program mylib-app) and deliver its executable
build/emit build mylib-app --manifest test/modules/emit-libs.scm
./build/mylib-app                       # => 142

# a simple application needs no program entry
build/emit build app/main.scm -o build/my-app

# with exactly one program entry, the NAME may be omitted
build/emit build --manifest my-project.scm
```

- **Resolution is Chez-free.** `emit build` resolves the `(program NAME …)` entry through the
  embedded compiler, exposed as `emit run --resolve-program NAME` (manifest lookup order:
  `--manifest` > `EMIT_MANIFEST` > `./emit-libs.scm` > exe-relative > built-in prefix — see
  **Where the manifest is found**). It prints the resolved source and output — each already
  resolved against the manifest's own directory — and runs nothing:

  ```bash
  build/emit run --resolve-program mylib-app --manifest test/modules/emit-libs.scm
  # test/modules/prog-mylib.scm
  # build/mylib-app
  ```

- **Delivery** is the in-binary Chez-free AOT path: `emit build` emits the program IR in-process
  (the `--emit` path) and forks `clang` to link the runtime and units into the executable — byte-
  for-behavior identical to emitting the resolved source's IR and linking it directly. It
  **tree-shakes** (changes: `chez-free-unit-pipeline`, `import-dag-tree-shaking`): units are
  finalized in reverse dependency order. Each unit's roots come from the program IR plus the IR of
  importers already finalized, so a dependency keeps exactly the bindings those importers retain.
  A full-unit artifact may be reused as an input, but AOT recompiles a distinct root-specific unit
  from source and caches that pruned result. The output path comes from the entry's `output`, an
  `-o` override, or the default `build/<NAME>`.

### `emit lib` — compile one library to its artifact

`emit lib SRC` compiles a single `define-library` source to its unit artifact — the IR (`<name>.ll`)
and a readable export table (`<name>.exports`) — Chez-free, named by the library's `define-library`
name and written under `-o DIR` (default `build/lib`):

```bash
build/emit lib test/modules/mylib.sld -o build/lib
# build/lib/mylib.ll        (byte-identical to the unit the run/AOT paths emit)
# build/lib/mylib.exports   => ((mylib) ((greet . "mylib:greet"))
#                                       ((greet "mylib:code:greet" 0)))
```

The table has three parts: the library name, the **symbol** rows mapping each external name to its
global target, and the **call** rows — for each export with a stable procedure interface, its code
label and accepted arity. A locally defined target is mangled to this library; a re-exported target
keeps the original owner's symbol. A fixed procedure records `(name label exact-arity)`; a procedure with a
rest parameter records `(name label minimum-arity rest minimum-label)`. The final field advertises
the same-ABI empty-rest entry used only at exactly the minimum arity. A new compiler also accepts an
older four-field variadic row `(name label minimum-arity rest)` and uses its ordinary label for all
valid counts. An importer can therefore emit a direct call to the procedure's code with no access
to the library's source (changes: `cross-unit-direct-calls`,
`cross-unit-variadic-direct-calls`, `variadic-min-arity-fast-entry`).

A call row is recorded only for a binding whose slot cannot move after `__init`. A binding the
library **assigns** therefore gets a symbol row but no call row, however its initializer is shaped
(change: `library-toplevel-set`) — see *Cross-unit direct calls* under Semantics.

For a runtime re-export, the symbol row retains the imported target and a procedure's call row is
copied from the interface that supplied that target. The row's public name may change, but its code
label and arity information do not. These compile-time artifacts help later compilation paths;
delivered executables contain the linked runtime code and do not need the `.sld` sources or
`.exports` tables at run time.

The four commands — `emit lib` / `emit build` / `emit run` / `emit repl` — belong to a single
`emit` binary, the sole user-facing entry point (change: `emit-cli-unification`).

## `(scheme base)`

The prelude — `map`, `append`, `fold-left`, the character comparisons, the reader, the
derived-form macros (`cond`/`case`/`when`/…), etc. — is the library `(scheme base)`, generated from
`src/prelude.scm` into `lib/scheme/base.sld`. It is **auto-imported into every program and REPL
session** (and into the compiler's own build), as if the source began with `(import (scheme base))`.

- Its procedures resolve as `scheme.base:*` external globals against a linked/loaded
  `scheme.base.ll`; its derived-form macros are merged at expand time.
- **`--no-prelude`** skips the auto-import and the macro merge, leaving prelude names and derived
  forms unbound — for a program that wants only primitives and its own definitions.
- Do not edit `lib/scheme/base.sld` by hand; it is generated (`tools/gen-scheme-base.ss`, guarded by
  `test/scheme-base-gen-check.sh`). Edit `src/prelude.scm` and regenerate.

### The public surface is declared, not derived

`src/prelude.scm` says what `(scheme base)` **contains**; `src/prelude-surface.scm` says what it
**exports** (change: `scheme-base-declared-surface`, GitHub issue #29). The export list is the
partition's published runtime definitions in *source order*, followed by its declared primitive
and core/auxiliary syntax bindings. A
private helper stays in the library **body**, where the exported procedures still call it; it is
simply not in scope in a program that imports the library, and not an API commitment. Because the
auto-import is universal, that distinction is the difference between a namespace and a published
interface: before declaration-based curation, helpers (`%map1`, `rd-atom`, `%port-buf`, `*winds*`, …) were in scope
in every program, unasked.

Both derivations of the export list read that one declaration — `tools/gen-scheme-base.ss` (which
writes the committed `.sld` for the Chez driver) and `scheme-base-export-names` in `src/core.ss` (the
portable derivation used by `emit run`/`emit build`/the `emit run` command, from the baked-in prelude source) —
so the two paths cannot disagree. Order comes from the prelude, not from the declaration, so
regrouping the declaration cannot move emitted IR.

The exported surface has two tiers:

| Tier | What it means |
|---|---|
| **R7RS** | names R7RS-small defines, and that it places in `(scheme base)`. The sixteen it places elsewhere are no longer here — see *The relocated sixteen* below. |
| **extension** | Emit additions with no R7RS home: `fold-left`, `andmap`, `memp`, `list-head`, `void`, `list->bytevector`, `port-closed?`, `read-from-string`, `read-all-from-string`, `with-parameters`, `make-eq-hash-table`, and the `hash-table-*` family. Published deliberately, with Emit's established hyphenated spelling. |

`filter`, `fold-right`, and `iota` are provided by `(emit list)`, not `(scheme base)`.
Import `(emit list)` explicitly when using Emit's versions. This separation lets unchanged
programs import `(scheme base)` with `(srfi 1)` without conflicting list bindings. The Emit
and SRFI versions remain distinct bindings: select or prefix them when importing both.

There used to be a third, **unstable**: names exported *only* because something outside the library
had to resolve them. It held exactly two, `rd-skip-ws` and `rd-token-end`, and that something was the
*compiler* — the REPL's input-completeness probe shares the reader's lexeme helpers so the two cannot
drift. The tier is **retired** (change: `scheme-base-partition`, issue #32): those two moved into the
internal substrate, which the compiler imports directly, so nothing reaches a public export list by
being needed internally any more.

Prelude transformers use the same definition-site context interface as user-library transformers
on every compilation path. Their references do not require public helper spellings: import sets
may hide or rename a dependency without breaking a macro that already captured its binding.
Changing the public surface therefore does not change the private references of `guard` or
`parameterize` (see [How an exported macro travels](#how-an-exported-macro-travels)).

`lib/scheme/base.sld`'s export list is a committed golden, one name per line, so a surface change is
a reviewable one-line diff. `test/scheme-base-surface-check.sh` (Chez-free, in `run-all-tests.sh`)
recomputes it from the two sources: a prelude definition that is neither declared private nor
published fails the default suite, so adding a helper forces a visibility decision.

## The shipped libraries

| library | source | reached by | resolved |
|---|---|---|---|
| `(emit internal)` | generated from `src/prelude.scm` | explicit import; **not API** | **baked** + manifest |
| `(emit list)` | generated from `src/prelude.scm` | `(import (emit list))` | installed root / exact manifest |
| `(emit filesystem)` | hand-written | `(import (emit filesystem))` | installed root / exact manifest |
| `(scheme base)` | generated from `src/prelude.scm` | auto-imported everywhere | **baked** + manifest |
| `(scheme cxr)` | generated from `src/prelude.scm` | `(import (scheme cxr))` | installed root / exact manifest |
| `(scheme read)` | generated from `src/prelude.scm` | `(import (scheme read))` | installed root / exact manifest |
| `(scheme file)` | generated from `src/prelude.scm` | `(import (scheme file))` | installed root / exact manifest |
| `(scheme inexact)` | hand-written | `(import (scheme inexact))` | installed root / exact manifest |
| `(scheme case-lambda)` | hand-written | `(import (scheme case-lambda))` | installed root / exact manifest |
| `(scheme char)` | hand-written + generated Unicode 17.0.0 include | `(import (scheme char))` | installed root / exact manifest |
| `(scheme process-context)` | hand-written | `(import (scheme process-context))` | installed root / exact manifest |
| `(scheme write)` | hand-written | `(import (scheme write))` | installed root / exact manifest |

### Character library extension

In addition to the R7RS-small `(scheme char)` surface, Emit deliberately exports
`char-general-category` from that library for Unicode-aware readers. It returns
the two-letter Unicode 17.0.0 `General_Category` symbol for a character — for
example `Lu`, `Ll`, or `Zs` — and returns `Cn` for a scalar unassigned in that
version. The name is an Emit extension, not an R7RS-small procedure or an R6RS
library alias, and remains unavailable until `(scheme char)` is explicitly
imported.

The prelude partition members are generated because `src/prelude.scm` is their single source of
truth for what those procedures *are* — relocating a name must not fork its definition. The
partition in `src/prelude-surface.scm` says which library gets which definition;
`tools/gen-scheme-base.ss` writes one `.sld` per member and `test/scheme-base-gen-check.sh` diffs
every one of them.

**Baked vs manifest.** `(scheme base)` and `(emit internal)` are compiled into the compiler binaries
from the baked-in prelude source, so a program that imports nothing — or only `(scheme base)` — runs
with **no manifest present at all**. That guarantee is why the substrate had to be baked too:
`(scheme base)` imports it, and anything `(scheme base)` depends on inherits the requirement. The
Every remaining library in the table is ordinary: a program reaches it through the hybrid
resolver, normally from the conventional installed root.

**Every compiler host registers the baked set** before it consults the manifest — the Chez driver,
the embedded host used by `emit run` and `emit build`, the REPL host, and `emit lib` alike (change:
`baked-set-on-every-door`). So a
hand-written manifest never needs to name `(scheme base)` or `(emit internal)`, and the directory a
command is invoked from cannot determine whether the standard library is available. That was not always
so: the REPL and `emit lib` used to resolve `(scheme base)` *from* the manifest, so in a user project
directory a session had no standard library at all and `emit lib` could not compile a library that
imported one (issue #39, and its unfiled `emit lib` half).

They do still *appear* in this repository's own manifest, because the Chez driver resolves them from
there and `tools/regen.sh` derives `bootstrap/scheme.base.ll` from `lib/scheme/base.sld`. A manifest
entry naming a baked member is a no-op on the Chez-free paths: the already-loaded guard in
`repl-load-library-text` matches it by library name, so the baked member wins and no second module is
loaded. One consequence to know: the baked `(scheme base)` therefore wins over the `.sld`, so editing
`lib/scheme/base.sld` does not change what any compilation path sees until `make regen` — the same
rule the embedded runner and AOT path always had, now true of the REPL too.

### `(emit internal)` — the substrate, and why it is not `(scheme …)`

`(emit internal)` holds the private machinery more than one shipped library needs: the port
representation (`%make-port`, `%port-rtd`, `%port-buf`) and the ~32-name `rd-*` reader. `(scheme read)`
and `(scheme file)` stand on it, and so does `(scheme base)`.

It is named outside the `(scheme …)` namespace because R7RS reserves that for the standard, and it is
**not auto-imported** — which is the whole mechanism by which it can hold these names without
publishing them. A program that does not name it sees nothing new: `rd-atom`, `rd-skip-ws` and
`%make-port` are all unbound, exactly as when they were private to `(scheme base)`. It is not API and
carries no stability guarantee.

The compiler imports it directly, which is why no name reaches a public export list merely because
the compiler needs it — the reason the `unstable` tier could be retired (issue #32).

### `(emit filesystem)` — the narrow public host edge

`(emit filesystem)` is public but deliberately non-standard. It exports exactly four procedures:
`directory-list`, `file-directory?`, `file-symbolic-link?`, and `replace-file`. A listing returns
the immediate bare entry names in unspecified filesystem order and omits `.` and `..`; consumers
sort when their policy requires deterministic traversal. `file-directory?` follows the final
symbolic link, while `file-symbolic-link?` inspects that final component, so a link to a directory
answers true to both predicates.

`replace-file` is one host rename. For source and destination on the same filesystem it atomically
moves the closed source over the destination without a delete/truncate window; it neither copies
across filesystems nor promises crash durability. Failed enumeration, non-missing classification
errors, and failed replacement raise catchable file errors. Missing paths are ordinary `#f`
answers from the two predicates.

The library contains no recursion, sorting, hidden-directory rules, temporary-name construction,
or write policy. Those decisions belong to applications such as Pitch. It is an ordinary manifest
unit and is omitted from programs that do not explicitly import it.

### The relocated sixteen

`(scheme base)` used to export sixteen names R7RS-small places elsewhere. As of
change `scheme-base-partition` (issue #33) it does not:

| library | names | count |
|---|---|---|
| `(scheme cxr)` | `caaar` `caadr` `cadar` `caddr` `cdaar` `cdadr` `cddar` `cdddr` `cadddr` … and the fifteen depth-4 forms | 24 exported, 9 relocated |
| `(scheme read)` | `read` | 1 |
| `(scheme file)` | `open-input-file` `open-output-file` `with-input-from-file` `with-output-to-file` `call-with-input-file` `call-with-output-file` … plus `file-exists?` and `delete-file` | 8 exported, 6 relocated |

**Breaking**, with no deprecation window — not a preference: names moved out of `(scheme base)` are no
longer in its public interface. A library can re-export an imported binding under a chosen public
name, but `(scheme base)` has not chosen to add such aliases back. A clean break is what pre-`0.1.0`
is for.

`(scheme cxr)` ships **complete**: all twenty-four compositions of three to four `car`/`cdr`
operations, which is what R7RS specifies. Emit previously defined nine of them, so fifteen depth-4
forms (`caaaar` … `cddddr`) were added — shipping a library named after the standard in which
`(caddar x)` is unbound would be a worse conformance state than not having the library.

The **depth-2** forms `caar`, `cadr`, `cdar`, `cddr` stay in `(scheme base)`, which is where
R7RS-small puts them, so `(cadr xs)` still needs no import.

`(scheme file)` has since gained `file-exists?` and `delete-file` (change:
`catchable-errors-with-kinds`). Those two are **additions**, not relocations: `(scheme base)` never
exported them, so they widen the library rather than breaking anything. The count above therefore
separates the two — eight exports, of which six moved out of `(scheme base)`. Still absent are
`open-binary-input-file` / `open-binary-output-file`, which need a binary-port representation Emit
does not have.

## `(scheme inexact)` — the first ordinary library

`(scheme inexact)` (change: `numeric-conformance`) is R7RS's inexact-only surface: `finite?`,
`infinite?`, `nan?`, `exp`, `log`, `sin`, `cos`, `tan`, `asin`, `acos`, `atan`, `sqrt`. It was the
first library besides `(scheme base)` in the default manifest, and it is deliberately **ordinary**
where `(scheme base)` is special — the shape the three relocated libraries above now share, and it
is hand-written where they are generated:

| | `(scheme base)` | `(scheme inexact)` |
|---|---|---|
| source | generated from `src/prelude.scm` | hand-written `lib/scheme/inexact.sld` |
| reached by | auto-imported everywhere | an explicit `(import (scheme inexact))` |
| how it is found | baked into the compiler (`*prelude-source*`) | conventional installed root or exact manifest |

Being ordinary is the point: it makes Emit's second standard library a *demonstration that the
module system works* rather than a second special case, and it keeps `sqrt`/`sin`/`log` out of
the universal namespace — without the import those names are unbound and a program may define
its own.

## Closure loading and REPL registration

The run and `emit build` commands load only the libraries the program **needs**. They ask the resolver for
each import while walking its transitive closure; one memoized descriptor carries the selected
source, source home, artifact location, and provider identity into cache lookup and compilation.
Mode 12 returns structured import descriptors containing both the canonical unit key and original
name components. Mode 18 validates a directory-selected source's declared name. Reading files
stays in the host because the compiler core performs no filesystem I/O.

The REPL has two registration times. Exact manifest entries remain eager so an invalid explicit
mapping is diagnosed before the first prompt, but their initialization and ORC materialization
remain deferred until import. Conventional roots are never scanned: an unknown prompt import asks
the same resolver for a transitive closure, registers it dependency-first in a compiler-state
transaction, then retries the import. A failed read, validation, cache load, compile, or
registration rolls back publication and the next prompt remains usable. Once registration
succeeds, the existing resolve-then-commit path initializes each member at most once and merges
exports only after success.

Provider choice does not salt emitted semantics. Cache validation starts only after selection and
checks the selected source identity; the same source reached through an exact entry or a root
therefore produces byte-identical full unit IR and compile-time interfaces on the Chez, run, lib,
REPL, and AOT paths. Build still prunes only after full-unit compilation.
Effectful lowering visits operators, operands, branches, and initializers in an
explicit compiler order, preserving cross-host label/body associations (#125).
This does not add a source-language operand evaluation-order guarantee.

## Semantics

- **Transitive imports** — a program (or library) pulls in the full transitive closure of its
  imports, ordered dependencies-first. See `test/modules/chain-*.sld`.
- **Diamond-safe initialization** — if two libraries both import a third, it is linked once and its
  `__init` runs once (guarded by a `@"lib:__inited"` flag). See `test/modules/dia-*.sld`.
- **Import cycles are rejected** at build time with a diagnostic. See `test/modules/cyc-*.sld`.
- **User-wins shadowing** — a program's own top-level `define` beats an imported binding.
- **Symbol naming** — an export is emitted as `@"libname:export"` (e.g. `@"mylib:greet"`,
  `@"scheme.base:map"`); a `rename` is pure table indirection, so the emitted symbol tracks the
  *internal* name (`@"rename.lib:%fast-map"` for the `fmap` export). Importers reference these as
  external globals.
- **Code labels** — a library top-level procedure's lifted code block is labelled from its
  *binding name*, `@"libname:code:export"` (e.g. `@"scheme.base:code:zero?"`), not from the
  compile's gensym counter. That makes the label identical whether the unit is compiled whole or
  recompiled as a tree-shaken subset, which is what lets a program name it — the AOT shake
  recompiles a unit against a root set derived from the very program that must name the callee.
  Inner and anonymous lambdas, and all program-unit code, keep the counter (`@code_N`).
- **Cross-unit direct calls** — a call whose operator resolves to an imported procedure with a
  recorded label and a *matching* argument count is emitted as
  `call fastcc @"libname:code:export"` instead of loading the code pointer out of the binding's
  closure. The global is still loaded and passed as the callee's `self`, since it carries the
  captured environment; only the four-instruction code-pointer chain disappears. Matching means
  equality for a fixed procedure and at least the recorded minimum for a variadic one. At exactly
  a variadic procedure's minimum, a new five-field call row selects the collision-safe encoded
  label `@"min-entry:$libname$ccode$cexport"`; that same-ABI entry binds rest to `()` without the ordinary arity
  check, positional spill, or `rt_build_rest`. Larger counts and old four-field rows select the
  ordinary label, whose prologue builds the rest list. The closure still points at the checked
  ordinary entry and is loaded and passed as `self` on both direct paths, so captures work without
  a wrapper or caller-side list. Encoding `$` as `$d` and `:` as `$c` keeps the generated namespace
  disjoint from every ordinary code label, including legal names such as `foo.min`.
  An arity mismatch, a value export, `apply`, or value-position use keeps the indirect path, so
  arity errors trap exactly as before. The importing module `declare`s each label it names; no
  linkage change is needed, as library code labels already have external linkage. This rests on the
  callee's slot still holding the closure its label belongs to, which the export table — the only channel by
  which an importer learns a label — enforces by recording a label only for a binding no unit can
  reassign after `__init`. Three things make that hold on every path: assignment to an *imported*
  binding is a compile error, so no unit writes another unit's slot; a binding a unit assigns
  **itself** has its call row withheld (below); and a REPL redefinition binds a fresh *program*
  global rather than touching the library's slot (a REPL *session* global is assignable — issue #5
  — but that is a program slot, not a unit's). The third is a prerequisite any future
  library-reload feature would have to revisit.
- **A library may `set!` its own top-level binding** — R7RS §5.3.1: a definition introduces a
  mutable location, so a library procedure may reassign a name its own library defines, and every
  reader (the unit's other procedures, an importing program, a REPL session) sees the new value
  (change: `library-toplevel-set`, issue #14). The cost is the direct call: that binding's call row
  is withheld, so calls to it read the slot on each call. Assignment to an **imported** binding
  remains an error — the unit does not own that slot, and the exporter's table has already been
  published. The assignment may be written at the library's top level or inside a procedure body;
  either way only a *definition* takes the stable, name-derived code label, so a top-level
  `(set! f (lambda …))` gets an ordinary counter one.
- **A library body may contain commands and `define-record-type`, not only definitions** (change:
  `library-body-declarations`, issue #16). Every body form is lowered — a **command** (an expression
  evaluated for effect) becomes part of the unit's one-time initialization, and the declarations run
  in **source order**, so a command sees the definitions written above it and not those below.
  Before this, a command was discarded with no diagnostic and a record type could not be declared in
  a library at all.
  - A library using `define-record-type` **must `import (scheme base)`**: the constructor the
    declaration lowers to builds its field vector with `(list …)`, and unlike a program a library
    does not auto-import the prelude. Without it the unit fails with `unbound variable list`.
  - The tree-shake always keeps a command and treats the unit's own bindings it references as
    roots, since a command's effects are invisible to reachability analysis. A record type's
    bindings prune independently of one another — reaching one accessor keeps the type's
    descriptor, not the whole declaration.
- **A library may be assembled from other files** (change: `library-include-declarations`,
  issue #18). All seven R7RS §5.6.1 declarations are now recognized: `export`, `import`, `begin`,
  `include`, `include-ci`, `include-library-declarations`, and `cond-expand`. The last four are
  **splicers**, expanded before anything else runs, so what they contribute is indistinguishable
  from having been written in place — including an `import`, which is validated by the same check
  either way.
  - `(include "f.scm" ...)` splices each file's top-level forms into the **body**, in the order the
    filenames appear, as if written in a `begin` declaration there. `(include-ci ...)` is the same
    with the read forms case-folded, and the fold happens **while the file is being read** (change:
    `reader-token-path`, issue #61) — which is what makes R7RS §7.1.1 survive it. An identifier
    written between vertical bars is **not** folded: the characters between the bars are the
    symbol's name, literally. So an `include-ci` file containing

    ```scheme
    (DEFINE (LEGACY) (QUOTE OLD))
    (DEFINE (|KeepCase|) (QUOTE KEPT))
    ```

    defines `legacy` and `KeepCase` — the second name survives, though its *body* still folds.
    Folding also reaches every symbol the read produces, including inside a vector literal; the
    fold this replaced walked pairs and symbols only, so it missed those.

    Each reader host implements the rule with what it already has: the compiler's own reader has a
    case-folding entry point, and the Chez bootstrap driver reads under Chez's `case-sensitive`
    parameter, which draws the same distinction. That is deliberately **two implementations** where
    there used to be one shared fold in the core — the shared one could not be made right, because
    it ran after reading, where `|MixedCase|` and `MixedCase` are already the same interned symbol.
    They are pinned against each other by an `include-ci` fixture whose two paths' emitted IR is
    compared byte for byte (`test/library-include-tests.sh`).

    **Known limit:** the fold is **ASCII** on the compiler's own reader, while Chez's
    `case-sensitive` folds Unicode (`ÉCOLE` → `école`). The two paths therefore agree on ASCII
    source and may disagree on a non-ASCII uppercase identifier inside an `include-ci` file. The
    substrate carries no Unicode case tables, and `include-ci` exists for old case-folding Scheme,
    which is ASCII; closing this would mean shipping case tables for one caller.
  - `(include-library-declarations "d.scm" ...)` splices a file's forms as **declarations**, so a
    shared `export` list or import block can live in its own file. An included declarations file
    may include further. So may an included *body* file: its own top-level `include` and
    `cond-expand` forms splice too, and one deeper inside a procedure body is spliced by the
    expander (see [Portable sources](#portable-sources)).
  - `(cond-expand ⟨clause⟩ ...)` splices the declarations of the first clause whose feature
    requirement holds, or of a trailing `else`; nothing matching and no `else` contributes nothing.
    Requirements are feature identifiers, `(library ⟨name⟩)`, `and`, `or`, and `not`. The
    identifiers Emit advertises, and what `(library ⟨name⟩)` asks, are in
    [Portable sources](#portable-sources).
  - **A filename resolves relative to the file that named it** — for a nested inclusion, beside the
    *including* file, not the `.sld` — which is the rule the manifest already applies to a library's
    `(source ...)`. Absolute filenames are used as written; source read from standard input resolves
    against the current directory. A file that cannot be read names the declaration, the filename as
    written, and the path it resolved to; an include cycle names the cycle.
  - The compiler core still performs **no I/O**: each host installs the reader (the Chez driver over
    Chez ports, the binary over `%read-file`), and the core splices what it is handed. A unit's
    `.stamp` records the files it included, so editing one rebuilds the library that included it
    (`recompile: included source changed`).
  - A **baked** library resolves `cond-expand` at bake time, against the compiler that baked it,
    rather than at the importer's compile — for the baked set that is the correct reading, since
    those libraries *are* the implementation. Nothing shipped uses it today; issue #31 (baking
    `lib/scheme/base.sld`) inherits the commitment.
- **Chez artifacts** — the independent source driver compiles to `<artifacts>/<name>.ll` plus a readable
  `<name>.exports` table (`(NAME ((external . "mangled") …) ((external "label" arity [rest
  "minimum-label"]) …)
  [<compile-time-interface>])`) and a `<name>.stamp` sidecar
  recording the compiler that produced them. Artifacts are reused only when fresh — neither the
  source nor anything it **included** is newer than the artifact, **and** the recorded
  compiler-identity stamp matches the current compiler — and rebuilt otherwise. The stamp is a version marker plus a content hash over the
  compiler sources that determine emitted IR (the `compile.ss` `(include …)` set plus the host
  target header), so a compiler/emitter change invalidates cached units even when their source
  is untouched — the toolchain is part of the cache key, as in Rust (`.rlib` SVH), GHC (`.hi`
  version), Go, and Bazel (change: `artifact-compiler-stamp`).

### Native explicit artifacts

`emit lib SRC -o DIR` publishes the requested full library as `.ll`, `.exports`,
and `.artifact`. It does not publish its dependency closure. Publish each ordinary
dependency separately and map the selected sources to that directory:

```scheme
((library (my util) (source "lib/my/util.sld") (artifacts "artifacts"))
 (library (my facade) (source "lib/my/facade.sld") (artifacts "artifacts")))
```

```sh
emit lib lib/my/util.sld --manifest emit-libs.scm -o artifacts
emit lib lib/my/facade.sld --manifest emit-libs.scm -o artifacts
EMIT_VERBOSITY=verbose emit run --manifest emit-libs.scm app.scm
```

Native run/build/repl commands and dependency loading for lib first try that
provider's explicit full unit, then a compatible private cache, then source
compilation. Provider precedence still selects the source; artifacts cannot
redirect a library to another source. Sources and includes must remain available.
Read-only explicit directories are supported; fallback writes only private caches
and an unwritable cache is nonfatal. Requested publication failures are errors.

The readable version-1 metadata is `(emit-artifact 1 STRING ...)`, with exactly
eleven string fields, in order:

| Field | Meaning |
|---|---|
| kind, key | `full`, canonical mangled library key (including its trailing colon) |
| executable | FNV-1a digest of the actual producing Emit executable |
| runtime ABI, target | tagged-value ABI/word width, host target triple |
| source | canonical selected source path |
| sources | source/include content digests and consulted library-availability answers |
| dependencies | direct non-baked dependency keys and full generation digests |
| IR digest, exports digest | integrity of the exact two published payloads |
| registration | readable name/import/interface/initializer row |

Dependency generations cover full IR, interfaces (including macros and call rows),
source identity/content, and transitive dependency generations. Baked dependencies
are covered by the executable identity. Digests detect accidental staleness and
corruption, not malicious tampering. The entire pair is parsed/validated before
registration; each payload is atomically replaced and metadata is published last.
Interrupted, unknown-versioned, legacy, pruned, or incompatible sets are misses.
Content changes invalidate even when mtimes are restored; timestamp-only touches
do not. Rebuilding/relinking Emit can conservatively invalidate artifacts even
when semantics are unchanged. No compiler-source fingerprint is needed or installed.

The Chez driver's `.stamp` mechanism remains separate: it is an independent test
oracle, not an interchange producer/consumer of native `.artifact` metadata.
Parity tests use isolated output directories and compare full IR and readable
interfaces, including `(scheme base)`, normalizing only target headers.
Exported macro strings are escaped by the shared renderer, preserving quotes,
backslashes, controls, and datum-label sharing through cold and warm loads.

Verbose stderr distinguishes `artifact: ... [explicit full unit]`, private cache
hits, and rejection reasons; quiet mode does not change stdout. `--dump-all`
bypasses reuse to show actual library compilation stages. AOT first admits the
full unit and may then recompile a distinct program-specific pruned unit; a full
artifact hit does not promise elimination of pruning work. Delivered executables
need neither source libraries nor compile-time artifacts at runtime.

### Portable and native cache tiers

`emit run` and `emit repl` keep LLVM IR authoritative but derive a second, local cache tier for
full library units. The portable `baked-` and `unit-` entries contain IR, registration metadata,
and source identities. A matching `native-baked-` or `native-unit-` entry contains the relocatable
objects LLVM produced after the session's JIT transform. A warm native hit goes directly to ORC's
object layer, avoiding library IR parsing, optimization, and code generation.

Native identity includes the portable unit's IR identity, native format, Emit executable digest,
LLVM version, target triple and data layout, CPU and normalized target features, relocation and
code models, and `-O0`, `-O1`, or `-O2` profile. Object digests and LLVM structural parsing reject
corruption before admission. Files are written atomically beneath `EMIT_CACHE`, or the platform
user cache when it is unset; an ordinary command never modifies the install prefix. The cache is
disposable. After confirming the resolved cache path, removing either its `native-` entries or the
whole Emit cache is safe and only makes the next execution compile again.

**The shared tier.** An installation may also carry a read-only **shared cache**,
`share/emit/library-cache` (change: prebuilt-shared-stdlib-cache). The installed binary prepares
it with `emit build --stdlib --shared` when it is installed.

- **Lookup order.** Both tiers are searched in order, shared then user. Every kind of entry is
  looked up the same way.
- **Validity.** A shared entry passes exactly the checks a user entry does, so one prepared by a
  different executable, for another CPU, or for another profile is a miss. The lookup then
  continues to the user cache.
- **Writes.** They go only to the user cache.
- **`EMIT_SHARED_CACHE`.** It relocates the shared tier, and set to the empty string it disables
  it.
- **Narration.** Verbose output names the tier of every reuse, `[shared]` or `[user]`.
- **Doctor.** `emit doctor` reports whether the shared tier was prepared by the running binary.

An exact REPL manifest entry may have a native object admitted at startup, but ORC does not link
or initialize it until the first import looks up its initializer. Dependencies still initialize
first and at most once. `--dump-all` bypasses both cache tiers because it requests observable
library compilation stages.

`emit build` deliberately ignores native entries. It consumes portable IR, prunes each unit to the
program's root set, performs closed-world optimization, and links the resulting program. `emit lib`
likewise continues to publish only `.ll` and `.exports`; local native objects are execution-cache
accelerators, never shipped library artifacts.

### How an exported macro travels

A transformer cannot ride in the emitted IR — it is consumed at compile time, not run — so it rides
in a fourth field of the `.exports` table, the library's **compile-time interface** (change:
`library-macro-export`, issue #48):

The table retains `(library-name runtime-rows call-rows compile-time-half)`. The
compile-time half contains transformer entries, own runtime references, foreign runtime
references, and a `(binding-context-v2 builtin-bindings public-macro-names)` extension
(required when transformers are present). Public names are explicit, including prefixed or
renamed names containing colons; private registry keys do not enter the source namespace. Each transformer
has the readable shape `(keyword %contextual-transformer-v2 origin literals rules context)`.
Its context records binding kinds, original identities, and targets; transformer dependencies
refer to origins rather than recursively embedding other environments.

Three things to read out of that:

- **The runtime rows are empty.** A macro export has no global, so it contributes no symbol row and
  no call row. `(macro-helper-lib)` exports one name and emits no public binding at all.
- **`helper` retains target `macro-helper-lib:helper`.** Each template's free identifiers are resolved *in
  the exporting library* before the transformer leaves it. A library's private top-level bindings are
  already externally linkable mangled globals, so the importer reaches one the same way it reaches
  any imported name — an `external global i64` the linker resolves. This is why a template may use a
  private helper without the library exporting it, and why `(rename …)` is safe on a macro export:
  the template no longer depends on the importer resolving any spelling.
- **`%inc` travels hidden**, under the unit-qualified keyword `macro-helper-lib:%inc`, so a library
  can layer macros on its own private ones. That dependency is registry-only, so writing its
  hidden key in importing source does not expose it. Keys are disambiguated when an alias collides.

If an exported transformer defined by another library uses an imported macro, the export interface
also carries that dependency's already-resolved transformer closure. For example, when a library
defines an exported wrapper macro in terms of an imported `opt-lambda`, the interface preserves the
original `opt-lambda` and any private macros it reaches. The consumer does not need to import those
helper macros directly, and the carried entries do not become public exports.

An unresolved free identifier retains its definition context and reports an unbound variable
when expansion requires that reference. It cannot capture a same-spelled importing variable.
Introduced binders receive fresh identities independently of whether their names also identify
globals. Imported transformer dependencies retain the contexts of their original definitions,
whether the defining library is baked or supplied as a user library.

Two consequences worth knowing:

- The AOT tree-shake nominates root candidates from a unit's exports **plus** the own bindings its
  templates reach, so `helper` survives when the program uses `twice` — and is still pruned when the
  program imports the library without using it.
- A library can use a macro in its body only when that macro is in its imported compile-time
  environment. When an exported transformer depends on an imported macro, that dependency is carried
  transitively with its original resolution; baked and non-baked imports follow the same rule.

## When you break a rule

The limits below are *enforced at the front end*, and each diagnostic names the form you wrote
(change: `module-frontend-diagnostics`). Before this, none of them did: a form the module front end
did not implement was not rejected but **reclassified**, and whatever the reclassification broke
second is what got reported — so the message sent you somewhere the mistake was not.

| what you write | what Emit reports |
|---|---|
| `(import (only (iset a) nope))`, a set naming a name the library does not export | `import: nope is not exported by (iset a) in (only (iset a) nope)` |
| `(import (prefix (iset a)))`, a set of the wrong shape | `import: malformed import set: (prefix (iset a))` |
| `(cond-expand ((library srfi-8) …) …)`, a requirement that does not hold one library name | `cond-expand: (library ...) takes exactly one library name: (library srfi-8)` |
| `(include "nope.scm")` naming a file that is not there | `include: cannot read "nope.scm" (resolved to lib/nope.scm)` |
| a file that includes itself | `include-library-declarations: include cycle: "lib/a.scm" includes itself, through "lib/b.scm" <- "lib/a.scm"` |
| any other declaration, e.g. `(frobnicate 1 2 3)` | `define-library: frobnicate is not a library declaration -- a declaration is (export ...), (import ...), (begin ...), (include ...), (include-ci ...), (include-library-declarations ...) or (cond-expand ...)` |
| one name bound by both `define` and `define-syntax` | `compile-library: a library binds one name with both define and define-syntax f` |
| a `define-library` that is not its source's only form | `define-library: a define-library must be the only form in its source: (two)` |
| a `define-library` typed at the REPL prompt | `define-library: libraries are not defined at the prompt: (r) -- a library is imported, named in the manifest` |

Two distinctions are deliberate:

- **Recognized-but-unsupported is gone.** All seven R7RS declarations are implemented, and the last
  R7RS form that reported it, a `(library …)` feature requirement, is now answered. Anything else
  in declaration position is reported as not being a declaration at all: a mistake in your source,
  not a feature you are waiting on.
- **`rename` means two things, by position.** In `import` it is an import set; in `export`,
  `(rename internal external)` is an export specification. The meaning keys on the declaration the
  form appears in, not on the keyword.

The message body is the same whichever command compiled the form — `emit run`, `emit build`,
`emit lib`, or the REPL — so only the command's own prefix differs. Every one of these is a
*recoverable* compile-time error: at the prompt the session reports it and stays alive.

## Scope & limits

This is Modules v0:

- **Transformers are `syntax-rules` only.** Lexical syntax bindings and internal syntax
  definitions are supported; `syntax-case` and procedural/identifier transformers remain outside
  the supported surface. An unresolved free template reference retains its definition context
  rather than capturing a same-spelled importing binding.
- **AOT pruning is closed-world; `emit run` and the REPL are open-world.** The Chez AOT driver and
  `emit build` propagate roots backward through the import DAG, finalizing units in reverse
  dependency order. A unit is shaken against the program and the finalized IR of its importers,
  including transitive importers, so an imported unit and the substrate do not need to ship whole.
  This root-specific AOT compilation is separate from reuse of a full-unit artifact. `emit run` and
  the REPL retain full units so later execution or imports can use any binding. See
  [`docs/PERFORMANCE.md` P10](PERFORMANCE.md#p10--a-library-another-unit-imports-is-never-tree-shaken-the-substrate-ships-whole)
  for the implementation outcome and historical measurements.
- **An `include` produced by a macro template resolves against the importing unit's home**, not
  the file the template came from, because a rebuilt form carries no record of where it was
  written. An include written in a file, at any depth, resolves beside that file.

For the authoritative requirements and scenarios, see `openspec/specs/module-system/spec.md`; for
the design rationale, `openspec/explorations/modules-v0-design.md`.
