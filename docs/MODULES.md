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

`export`, `import`, and `begin` are the three declarations Emit recognizes. Anything else in
declaration position is **rejected by name** rather than absorbed into the body — see
[When you break a rule](#when-you-break-a-rule).

## Importing in a program

A program imports a library with a top-level `import` and then uses its exports:

```scheme
;; test/modules/prog-mylib.scm  => 142
(import (mylib))
(greet)
```

A name the program defines itself shadows an imported one of the same spelling (**user-wins
shadowing**).

## The manifest

Library *names* are mapped to *source files* by a manifest — an s-expression file (default
`emit-libs.scm`; see **Where the manifest is found** below):

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
- The default `emit-libs.scm` at the repo root lists the shipped libraries — `(emit internal)`,
  `(scheme base)`, `(scheme cxr)`, `(scheme read)`, `(scheme file)` and `(scheme inexact)`; point
  `--manifest` at your own for additional libraries (as the test
  suites do with `test/modules/emit-libs.scm`). Listing a library costs a program nothing unless
  it imports it: the run door preloads lazily (see below) and `emit build` links only the
  program's import closure. Your own manifest need not name `(scheme base)` or `(emit internal)`:
  every door registers the baked set before reading the manifest (see *The shipped libraries*).

### Where the manifest is found

Every door looks for the manifest the same way (change: `manifest-search-path`, issue #35):

| # | candidate | for |
|---|---|---|
| 1 | `--manifest FILE` | an explicit request |
| 2 | `$EMIT_MANIFEST` | an explicit request |
| 3 | `./emit-libs.scm` | the in-repo / in-project case |
| 4 | `<dir of the real path of the running exe>/../share/emit/emit-libs.scm` | a relocatable install |
| 5 | `<build-time PREFIX>/share/emit/emit-libs.scm` | the prefix the binary was built for |

- **1–2 name a specific file, and are never extended.** If it is missing that is an error —
  falling through would silently run against different libraries than you asked for. This is also
  what makes a *hermetic* build expressible: one flag, one manifest, nothing ambient.
- **3–5 are a search, and they chain** (change: `installed-emit-completeness`, issue #44). *Every*
  candidate that exists is used, in order, and a **library name** is resolved by taking the first
  manifest that names it. So a project's own `./emit-libs.scm` **extends** the installed one rather
  than replacing it: your project keeps every shipped library without naming it and without an
  absolute path into the install prefix. Define a name yourself and yours wins.
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
- Each door narrates every manifest it resolved on stderr (`resolve manifest -> …`, the later ones
  tagged `[chained]`), and names the manifest that supplied a library when it was not the first
  (`chain <manifest> -> <libraries>`). All of it is silenced by `EMIT_VERBOSITY=quiet` and none of
  it touches stdout. `make install` produces the layout candidates 4–5 look for; see
  `test/install-layout-tests.sh`.

The Chez driver (`src/compile.ss`) implements candidates 1–3 and the same relative-path rule, but
not 4–5: it is a bootstrap-only path that runs from a checkout and is never installed.

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

There are three doors. All share one compiler core, so a library's compiled bytes are identical
across them (dev→ship fidelity).

### Batch / AOT (and JIT, bitcode) — the Chez driver

`src/compile.ss` resolves imports through the manifest, compiles each library to a unit, and links
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

The shipped `emit repl` (build it with `make emit`) preloads the manifest's libraries and
honors interactive `import`; pass the manifest via `--manifest` (or `EMIT_MANIFEST`):

```sh
build/emit repl --manifest test/modules/emit-libs.scm
> (import (mylib))
> (greet)
142
```

### Chez-free embedded runner — the run door (user libraries)

`emit run` compiles and runs a whole program with **no Chez**, and resolves user-library
`import`s through the manifest — the *run door*, at parity with the AOT and REPL doors (change:
`run-door-user-libraries`). `(scheme base)` is baked in, so a plain program needs no manifest at
all — it runs from any directory, installed or not; user libraries are read from the manifest
(found by the order under **Where the manifest is found**). The program source is read from a
`FILE` argument when given, otherwise stdin:

```sh
echo '(map (lambda (x) (* x x)) (list 1 2 3))' | build/emit run   # => (1 4 9)   no manifest needed
build/emit run --manifest test/modules/emit-libs.scm test/modules/prog-mylib.scm   # => 142
```

The run door reuses the REPL door's Chez-free machinery: the host reads the manifest and each
NEEDED library source — the transitive closure of the program's imports, not the whole manifest
(see [Lazy preload](#lazy-preload-on-the-run-door)) — and hands the text to the embedded
compiler through a small mode protocol, then the
program's `@scheme_entry` initializes the imported units in topological order before running — so
the emitted program module is **byte-identical** to the AOT door's for the same manifest (dev→ship
fidelity). `emit build` uses the same `--emit` path for the native build.

### `emit build` — deliver a program

`emit build` turns a manifest **program entry** into a standalone native executable — Chez-free end
to end (change: `emit-build-bin-entry`), entirely within the compiled `build/emit` binary (it emits
the IR in-process and forks `clang`):

```bash
# resolve (program mylib-app) and deliver its executable
build/emit build mylib-app --manifest test/modules/emit-libs.scm
./build/mylib-app                       # => 142

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

- **Delivery** is the in-binary Chez-free AOT door: `emit build` emits the program IR in-process
  (the `--emit` path) and forks `clang` to link the runtime and units into the executable — byte-
  for-behavior identical to emitting the resolved source's IR and linking it directly. This slice
  links full library units (no tree-shaking); the output path comes from the entry's `output`, an
  `-o` override, or the default `build/<NAME>`.

### `emit lib` — compile one library to its artifact

`emit lib SRC` compiles a single `define-library` source to its unit artifact — the IR (`<name>.ll`)
and a readable export table (`<name>.exports`) — Chez-free, named by the library's `define-library`
name and written under `-o DIR` (default `build/lib`):

```bash
build/emit lib test/modules/mylib.sld -o build/lib
# build/lib/mylib.ll        (byte-identical to the unit the run/AOT doors emit)
# build/lib/mylib.exports   => ((mylib) ((greet . "mylib:greet"))
#                                       ((greet "mylib:code:greet" 0)))
```

The table has three parts: the library name, the **symbol** rows mapping each external name to its
mangled global, and the **call** rows — for each export whose initializer is a fixed-arity lambda,
its code label and that arity, so an importer can emit a direct call to the procedure's code with
no access to the library's source (change: `cross-unit-direct-calls`).

A call row is recorded only for a binding whose slot cannot move after `__init`. A binding the
library **assigns** therefore gets a symbol row but no call row, however its initializer is shaped
(change: `library-toplevel-set`) — see *Cross-unit direct calls* under Semantics.

The four doors — `emit lib` / `emit build` / `emit run` / `emit repl` — are verbs of a single
`emit` binary, the sole user-facing entry point (change: `emit-cli-unification`).

## `(scheme base)`

The prelude — `map`, `filter`, `append`, `fold-left`, the character comparisons, the reader, the
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
prelude's top-level defines in *source order* minus `*scheme-base-private*` — 136 of 213 today. A
private helper stays in the library **body**, where the exported procedures still call it; it is
simply not in scope in a program that imports the library, and not an API commitment. Because the
auto-import is universal, that distinction is the difference between a namespace and a published
interface: before this, all 77 helpers (`%map1`, `rd-atom`, `%port-buf`, `*winds*`, …) were in scope
in every program, unasked.

Both derivations of the export list read that one declaration — `tools/gen-scheme-base.ss` (which
writes the committed `.sld` for the Chez driver) and `scheme-base-export-names` in `src/core.ss` (the
portable derivation used by `emit run`/`emit build`/the run door, from the baked-in prelude source) —
so the two doors cannot disagree. Order comes from the prelude, not from the declaration, so
regrouping the declaration cannot move emitted IR.

The exported surface has two tiers:

| Tier | What it means |
|---|---|
| **R7RS** | names R7RS-small defines, and that it places in `(scheme base)`. The sixteen it places elsewhere are no longer here — see *The relocated sixteen* below. |
| **extension** | Emit additions with no R7RS home: `filter`, `fold-left`, `fold-right`, `andmap`, `memp`, `iota`, `list-head`, `void`, `list->bytevector`, `port-closed?`, `read-from-string`, `read-all-from-string`, `with-parameters`, and the `hash-table-*` family. Published deliberately, spelled R6RS/SRFI. |

There used to be a third, **unstable**: names exported *only* because something outside the library
had to resolve them. It held exactly two, `rd-skip-ws` and `rd-token-end`, and that something was the
*compiler* — the REPL's input-completeness probe shares the reader's lexeme helpers so the two cannot
drift. The tier is **retired** (change: `scheme-base-partition`, issue #32): those two moved into the
internal substrate, which the compiler imports directly, so nothing reaches a public export list by
being needed internally any more.

Two mechanics follow from how macros expand, and are worth knowing before curating further:

- A macro's template is instantiated in the **importer's** scope, so every name it mentions must be
  exported under exactly that spelling — which is why `guard` and `parameterize` reach
  `with-exception-handler` and `with-parameters` as public names.
- `(rename internal external)` cannot be used to hide such a name: it keys the importer's table by
  the *external* name, leaving the template's spelling unresolvable.

Both apply to a **program** importing this library and not to a user library's exported macros: on
the program path the baked set is merged as source and so really is resolved in the importer, whereas
an exported macro's template is resolved in the library that defines it (see [How an exported macro
travels](#how-an-exported-macro-travels)). A **library** importer takes the second path even for the
derived forms — since `library-body-macro-scope` they arrive through `(scheme base)`'s compile-time
export interface like any other imported transformer, already resolved. Curating `(scheme base)`'s
surface still has to obey the
two rules above; a user library does not.

`lib/scheme/base.sld`'s export list is a committed golden, one name per line, so a surface change is
a reviewable one-line diff. `test/scheme-base-surface-check.sh` (Chez-free, in `run-all-tests.sh`)
recomputes it from the two sources: a prelude definition that is neither declared private nor
published fails the default suite, so adding a helper forces a visibility decision.

## The shipped libraries

| library | source | reached by | resolved |
|---|---|---|---|
| `(emit internal)` | generated from `src/prelude.scm` | explicit import; **not API** | **baked** + manifest |
| `(scheme base)` | generated from `src/prelude.scm` | auto-imported everywhere | **baked** + manifest |
| `(scheme cxr)` | generated from `src/prelude.scm` | `(import (scheme cxr))` | manifest |
| `(scheme read)` | generated from `src/prelude.scm` | `(import (scheme read))` | manifest |
| `(scheme file)` | generated from `src/prelude.scm` | `(import (scheme file))` | manifest |
| `(scheme inexact)` | hand-written | `(import (scheme inexact))` | manifest |

Everything but `(scheme inexact)` is generated, because `src/prelude.scm` is the single source of
truth for what those procedures *are* — relocating a name must not fork its definition. The
partition in `src/prelude-surface.scm` says which library gets which definition;
`tools/gen-scheme-base.ss` writes one `.sld` per member and `test/scheme-base-gen-check.sh` diffs
every one of them.

**Baked vs manifest.** `(scheme base)` and `(emit internal)` are compiled into the compiler binaries
from the baked-in prelude source, so a program that imports nothing — or only `(scheme base)` — runs
with **no manifest present at all**. That guarantee is why the substrate had to be baked too:
`(scheme base)` imports it, and anything `(scheme base)` depends on inherits the requirement. The
three relocated libraries are ordinary: a program reaches them only through the manifest, exactly as
it reaches `(scheme inexact)`.

**Every door registers the baked set** before it consults the manifest — the AOT door, the run door,
the REPL door, and the compile-unit (`emit lib`) door alike (change: `baked-set-on-every-door`). So a
hand-written manifest never needs to name `(scheme base)` or `(emit internal)`, and the directory a
door is invoked from cannot determine whether the standard library is available. That was not always
so: the REPL and `emit lib` used to resolve `(scheme base)` *from* the manifest, so in a user project
directory a session had no standard library at all and `emit lib` could not compile a library that
imported one (issue #39, and its unfiled `emit lib` half).

They do still *appear* in this repository's own manifest, because the Chez driver resolves them from
there and `tools/regen.sh` derives `bootstrap/scheme.base.ll` from `lib/scheme/base.sld`. A manifest
entry naming a baked member is a no-op on the Chez-free doors: the already-loaded guard in
`repl-load-library-text` matches it by library name, so the baked member wins and no second module is
loaded. One consequence to know: the baked `(scheme base)` therefore wins over the `.sld`, so editing
`lib/scheme/base.sld` does not change what any door sees until `make regen` — the same rule the run
and AOT doors always had, now true of the REPL too.

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

### The relocated sixteen

`(scheme base)` used to export sixteen names R7RS-small places elsewhere. As of
change `scheme-base-partition` (issue #33) it does not:

| library | names | count |
|---|---|---|
| `(scheme cxr)` | `caaar` `caadr` `cadar` `caddr` `cdaar` `cdadr` `cddar` `cdddr` `cadddr` … and the fifteen depth-4 forms | 24 exported, 9 relocated |
| `(scheme read)` | `read` | 1 |
| `(scheme file)` | `open-input-file` `open-output-file` `with-input-from-file` `with-output-to-file` `call-with-input-file` `call-with-output-file` | 6 |

**Breaking**, with no deprecation window — not a preference: `compile-library*` rejects "export of a
name the library does not define", and a unit's export table maps each external name to a symbol
mangled *to that unit*, so `(scheme base)` cannot re-export what it imports without new re-export
machinery. A clean break is what pre-`0.1.0` is for.

`(scheme cxr)` ships **complete**: all twenty-four compositions of three to four `car`/`cdr`
operations, which is what R7RS specifies. Emit previously defined nine of them, so fifteen depth-4
forms (`caaaar` … `cddddr`) were added — shipping a library named after the standard in which
`(caddar x)` is unbound would be a worse conformance state than not having the library.

The **depth-2** forms `caar`, `cadr`, `cdar`, `cddr` stay in `(scheme base)`, which is where
R7RS-small puts them, so `(cadr xs)` still needs no import.

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
| how it is found | baked into the compiler (`*prelude-source*`) | resolved through the manifest |

Being ordinary is the point: it makes Emit's second standard library a *demonstration that the
module system works* rather than a second special case, and it keeps `sqrt`/`sin`/`log` out of
the universal namespace — without the import those names are unbound and a program may define
its own.

## Lazy preload on the run door

The run door loads only the libraries the program **needs**: it walks the transitive closure of
the program's imports over the manifest index and preloads that, rather than every manifest
entry. Mechanically, `preload_user_libraries` (`src/emit.cpp`) drives two compiler modes — mode
9 returns `KEY<TAB>PATH` for each manifest library, mode 12 answers "which libraries does this
source import?" for a program and a `.sld` alike — and follows each reached `.sld`'s own
imports. Reading those files stays in the host because the core performs no I/O by design.

**The REPL host stays eager** (mode 5), and should: a session is an open world where any prompt
may import anything, so everything on the manifest must already be loaded. Only the run door,
compiling one known program, can be lazy.

This was not an optimization. Eager preload was invisible while the manifest held exactly one
library; the moment a second one landed it (a) put units a program never imported into its
emitted IR, (b) made `--no-prelude` — which promises a single self-contained module — emit a
preloaded unit's boundary marker anyway, and (c) broke the byte-identical program IR between the
run door and the Chez driver, which resolves imports on demand. All three are pinned by
`test/prelude-base-run-tests.sh`. Note the shape: the Chez driver already did this with
`toposort-libs`, so this was a resolution strategy that existed on one door being wired into the
other — the same gap as `docs/PERFORMANCE.md` P8.

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
  captured environment; only the four-instruction code-pointer chain disappears. An arity
  mismatch, a value export, or a variadic export keeps the indirect path, so arity errors trap
  exactly as before. The importing module `declare`s each label it names; no linkage change is
  needed, as library code labels already have external linkage. This rests on the callee's slot
  still holding the closure its label belongs to, which the export table — the only channel by
  which an importer learns a label — enforces by recording a label only for a binding no unit can
  reassign after `__init`. Three things make that hold on every door: assignment to an *imported*
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
    with the read forms case-folded — ASCII only, and a bar-quoted `|MixedCase|` folds too, because
    after reading it is indistinguishable from a bare symbol.
  - `(include-library-declarations "d.scm" ...)` splices a file's forms as **declarations**, so a
    shared `export` list or import block can live in its own file. It is the one that recurses: an
    included declarations file may include further. An `include` inside an included *body* file is
    program-position `include` (R7RS §4.1.7), which is not implemented.
  - `(cond-expand ⟨clause⟩ ...)` splices the declarations of the first clause whose feature
    requirement holds, or of a trailing `else`; nothing matching and no `else` contributes nothing.
    Requirements are feature identifiers, `and`, `or`, `not`. Emit advertises **`r7rs`, `emit`, and
    `ieee-float`** — and deliberately not `exact-closed` (fixnum overflow traps rather than
    promoting), `full-unicode`, `ratios`, or any OS/CPU flag (those describe the target). A
    `(library ⟨name⟩)` requirement is refused by name: answering it is library availability, which
    this stage's parser does not resolve, and a wrong answer would silently pick the other clause.
  - **A filename resolves relative to the file that named it** — for a nested inclusion, beside the
    *including* file, not the `.sld` — which is the rule the manifest already applies to a library's
    `(source ...)`. Absolute filenames are used as written; source read from standard input resolves
    against the current directory. A file that cannot be read names the declaration, the filename as
    written, and the path it resolved to; an include cycle names the cycle.
  - The compiler core still performs **no I/O**: each door installs the reader (the Chez driver over
    Chez ports, the binary over `%read-file`), and the core splices what it is handed. A unit's
    `.stamp` records the files it included, so editing one rebuilds the library that included it
    (`recompile: included source changed`).
  - A **baked** library resolves `cond-expand` at bake time, against the compiler that baked it,
    rather than at the importer's compile — for the baked set that is the correct reading, since
    those libraries *are* the implementation. Nothing shipped uses it today; issue #31 (baking
    `lib/scheme/base.sld`) inherits the commitment.
- **Artifacts** — each library compiles to `<artifacts>/<name>.ll` plus a readable
  `<name>.exports` table (`(NAME ((external . "mangled") …) ((external "label" arity) …)
  [<compile-time-interface>])`) and a `<name>.stamp` sidecar
  recording the compiler that produced them. Artifacts are reused only when fresh — neither the
  source nor anything it **included** is newer than the artifact, **and** the recorded
  compiler-identity stamp matches the current compiler — and rebuilt otherwise. The stamp is a version marker plus a content hash over the
  compiler sources that determine emitted IR (the `compile.ss` `(include …)` set plus the host
  target header), so a compiler/emitter change invalidates cached units even when their source
  is untouched — the toolchain is part of the cache key, as in Rust (`.rlib` SVH), GHC (`.hi`
  version), Go, and Bazel (change: `artifact-compiler-stamp`).

### How an exported macro travels

A transformer cannot ride in the emitted IR — it is consumed at compile time, not run — so it rides
in a fourth field of the `.exports` table, the library's **compile-time interface** (change:
`library-macro-export`, issue #48):

```scheme
;; build/lib/macro-helper-lib.exports  (line-broken here; the file is one line)
((macro-helper-lib) () ()
 (((twice () ((_ e) macro-helper-lib:helper (macro-helper-lib:%inc e)))
   (macro-helper-lib:%inc () ((_ e) + e 1)))     ; the PRIVATE macro, carried hidden
  (helper)                                       ; own bindings the templates reach
  ()))                                           ; other units' bindings they reach
```

Three things to read out of that:

- **The runtime rows are empty.** A macro export has no global, so it contributes no symbol row and
  no call row. `(macro-helper-lib)` exports one name and emits no public binding at all.
- **`helper` became `macro-helper-lib:helper`.** Each template's free identifiers are resolved *in
  the exporting library* before the transformer leaves it. A library's private top-level bindings are
  already externally linkable mangled globals, so the importer reaches one the same way it reaches
  any imported name — an `external global i64` the linker resolves. This is why a template may use a
  private helper without the library exporting it, and why `(rename …)` is safe on a macro export:
  the template no longer depends on the importer resolving any spelling.
- **`%inc` travels hidden**, under the unit-qualified keyword `macro-helper-lib:%inc`, so a library
  can layer macros on its own private ones. It is not usable in the importer: no user writes that
  spelling.

An identifier the pass cannot resolve is **left exactly as written** and hygienically renamed per
expansion, as before. Emit's hygiene is a name-set test with no syntax objects, so a
template-introduced temporary (`tmp`) and a reference to a name nothing defines are indistinguishable
here; leaving both means a macro that expands correctly cannot be broken by resolution. It is also
why the baked derived forms need no special case: `when` falls through this arm and expands in the
importer against the baked set every door registers.

Two consequences worth knowing:

- The AOT tree-shake nominates root candidates from a unit's exports **plus** the own bindings its
  templates reach, so `helper` survives when the program uses `twice` — and is still pruned when the
  program imports the library without using it.
- A **library** importing a macro whose template uses a derived form (`when`, `cond`) hits a
  pre-existing gap: a library body does not get the baked macro set at all, so `when` is unbound
  there whether it came from a template or was typed directly (issue #55). Program importers are
  unaffected.

## When you break a rule

The limits below are *enforced at the front end*, and each diagnostic names the form you wrote
(change: `module-frontend-diagnostics`). Before this, none of them did: a form the module front end
did not implement was not rejected but **reclassified**, and whatever the reclassification broke
second is what got reported — so the message sent you somewhere the mistake was not.

| what you write | what Emit reports |
|---|---|
| `(import (only (scheme base) car))`, or `except` / `prefix` / `rename` | `import: import sets are not supported: (only (scheme base) car) -- imports are whole-library, as (import (library name))` |
| `(cond-expand ((library (scheme base)) …) …)` | `cond-expand: (library (scheme base)) is an R7RS feature requirement this stage does not support -- library availability is not resolved here` |
| `(include "nope.scm")` naming a file that is not there | `include: cannot read "nope.scm" (resolved to lib/nope.scm)` |
| a file that includes itself | `include-library-declarations: include cycle: "lib/a.scm" includes itself, through "lib/b.scm" <- "lib/a.scm"` |
| any other declaration, e.g. `(frobnicate 1 2 3)` | `define-library: frobnicate is not a library declaration -- a declaration is (export ...), (import ...), (begin ...), (include ...), (include-ci ...), (include-library-declarations ...) or (cond-expand ...)` |
| one name bound by both `define` and `define-syntax` | `compile-library: a library binds one name with both define and define-syntax f` |
| a `define-library` that is not its source's only form | `define-library: a define-library must be the only form in its source: (two)` |
| a `define-library` typed at the REPL prompt | `define-library: libraries are not defined at the prompt: (r) -- a library is imported, named in the manifest` |

Two distinctions are deliberate:

- **Recognized-but-unsupported is not the same as not-a-declaration.** All seven R7RS declarations
  are implemented, so that class is now empty at the declaration level and only one R7RS form still
  reports it: a `(library …)` feature requirement. Anything else in declaration position is reported
  as not being a declaration at all. One is a feature you are waiting on, the other is a mistake in
  your source, and your next move differs. Neither message promises a schedule.
- **`rename` is rejected only in `import` position.** `(export (rename internal external))` stays
  valid; the rejection keys on the declaration the form appears in, not on the keyword.

The message body is the same whichever door compiled the form — `emit run`, `emit build`,
`emit lib`, or the REPL — so only the door's own prefix differs. Every one of these is a
*recoverable* compile-time error: at the prompt the session reports it and stays alive.

## Scope & limits

This is Modules v0:

- **Exported macros are `syntax-rules` only, at a body's top level.** `let-syntax`,
  `letrec-syntax`, inner `define-syntax`, `syntax-case`, and procedural/identifier transformers are
  all out of scope. A typo inside an exported template is reported in the importer rather than at the
  library (issue #56) — a consequence of hygiene being a name-set test with no syntax objects.
- **No tree-shaking on the Chez-free door.** `emit build` (the in-binary AOT door) links
  full library units; the closed-world reachability strip is only on the Chez driver's AOT ship
  path (change: `aot-release-profile`). Porting it to the Chez-free door is future work.
- Import specifiers are whole-library only — no `only`/`except`/`prefix`/`rename` import sets yet.
  An import set is rejected by name; see [When you break a rule](#when-you-break-a-rule).
- `include` and `cond-expand` are **library declarations only**. In program or body position
  (R7RS §4.1.7, §4.2.1) they are not implemented, and neither is the `features` procedure.

For the authoritative requirements and scenarios, see `openspec/specs/module-system/spec.md`; for
the design rationale, `openspec/explorations/modules-v0-design.md`.
