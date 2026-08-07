# Developing a project with Emit

How to write, run, and ship your own Scheme program with Emit, starting from a cloned
repository. This is the task-ordered walkthrough; [`MODULES.md`](MODULES.md) is the reference for
the module system it uses, and the authoritative requirements live under `openspec/specs/`.

Everything below is exercised by `test/project-door-tests.sh`, which builds this same project and
asserts these commands produce these values — so if the document and the compiler disagree, the
default test suite fails.

## What you need

- A recent **LLVM** (19+) and **Boehm GC** (`libgc`). Emit finds them through `llvm-config` and
  `pkg-config bdw-gc`:

  ```sh
  brew install llvm bdw-gc                                  # macOS
  sudo apt-get install llvm-22 clang-22 libgc-dev            # Debian/Ubuntu
  ```

  If discovery picks the wrong toolchain, point at it: `LLVM_CONFIG=/path/to/llvm-config` (or
  `EMIT_LLVM_BIN=/path/to/llvm/bin`), and `GC_INC` / `GC_LIB` for libgc.
- **No Chez Scheme.** Chez is needed only to regenerate the compiler from source
  (`make regen`) and for the developer test suite. Building and using Emit needs neither.

## Build the compiler

```sh
git clone https://github.com/bwbensonjr/emit
cd emit
make                       # links the committed compiler IR -> build/emit
```

`build/emit` is the whole toolchain — one binary with four verbs:

| verb | what it does |
|---|---|
| `emit run` | compile a program and run it in-process (JIT) |
| `emit repl` | interactive session on a persistent JIT |
| `emit build` | deliver a standalone native executable |
| `emit lib` | compile one library to its reusable artifact |

Put it on your `PATH`, or use it by path. The examples below assume `emit` resolves to
`build/emit`; from outside the checkout, use the absolute path (or `make install`, see
[Installing](#installing)).

## Your first program

A program is a file of top-level forms. The standard library `(scheme base)` is **auto-imported**,
so `map` and friends need no `import`:

```sh
mkdir -p ~/src/myproj && cd ~/src/myproj
echo '(map (lambda (x) (* x x)) (list 1 2 3))' > main.scm
emit run main.scm
```
```
(1 4 9)
```

Note what got printed: **the program's final value**. `emit run` prints it, and so does a delivered
executable — you do not need `display` to see a result. The one exception is the *unspecified*
value, which prints nothing at all, so a program that ends in output delivers exactly its own
bytes:

```sh
printf '(display "hi")\n(newline)\n' > hello.scm
emit run hello.scm
```
```
hi
```

That is the same rule the REPL follows, and a delivered executable follows it too — so a program's
output is identical however you run it. `emit run` also reads stdin, so `emit run < main.scm` works.

## A library of your own

Split code into libraries with R7RS `define-library`. A library declares its name, what it
imports, what it exports, and a body. Unlike a program, **a library does not auto-import
`(scheme base)`** — it must ask:

```sh
mkdir -p lib
```

`lib/stats.sld`:
```scheme
(define-library (stats)
  (import (scheme base))
  (export sum-list mean)
  (begin
    (define (sum-list xs) (fold-left + 0 xs))
    (define (mean xs) (/ (sum-list xs) (length xs)))))
```

A library may import another library, including a standard one that is not auto-imported.
`lib/report.sld`:
```scheme
(define-library (report)
  (import (scheme base) (stats) (scheme inexact))
  (export describe)
  (begin
    (define (square x) (* x x))
    (define (describe xs)
      (list 'n (length xs)
            'mean (mean xs)
            'rms (sqrt (mean (map square xs)))))))
```

`square` is in the body but not the `export` list, so it stays private: importers cannot see it,
while `describe` still calls it.

`main.scm`:
```scheme
(import (report))
(describe (list 1.0 2.0 3.0))
```

## The manifest

Emit resolves a library **name** to a **file** through a manifest, `emit-libs.scm` — an
s-expression list of entries. Create one at your project root:

```scheme
((library (stats)  (source "lib/stats.sld"))
 (library (report) (source "lib/report.sld"))
 (program myproj (source "main.scm") (output "build/myproj")))
```

Four things to know:

- **Relative paths resolve against the manifest's own directory**, not your current directory. So
  the manifest travels with the project and works from anywhere. Absolute paths are used as given.
- **`(program …)` entries name build targets**, not libraries. They are never imported; `emit build`
  resolves them. `(output …)` is optional and defaults to `build/<NAME>`.
- **You do not list `(scheme base)`.** It is baked into the binary, along with the internal
  substrate it stands on, so a program that imports nothing — or only `(scheme base)` — needs no
  manifest at all. Every door registers the baked set before it reads the manifest.
- **You list only your own entries.** The manifest above names no standard library and no path into
  the Emit installation, yet `main.scm` may import `(scheme inexact)` freely — see below.

Non-baked standard libraries — `(scheme inexact)`, `(scheme cxr)`, `(scheme read)`, and
`(scheme file)` — ship as **source files** and are reached through the manifest. Your project's
manifest does not have to name them, because **the searched manifests chain** (change:
`installed-emit-completeness`, issue #44): your `./emit-libs.scm` is consulted first, and any
library name it does not resolve falls through to the manifest installed beside `emit`. So a
project manifest *extends* the installed one rather than shadowing it, and needs no absolute path
into the installation prefix — which matters because that prefix is a Cellar directory that moves
on every Homebrew upgrade.

If you *want* a name to mean something of your own, define it: your entry is consulted first and
wins. And if you want no ambient state at all — a hermetic build, resolved against exactly one set
of libraries — pass `--manifest FILE`. An explicit request names one manifest and is never
extended.

Emit reports which manifests it used, on stderr:

```sh
emit run main.scm
```
```
resolve manifest -> emit-libs.scm
resolve manifest -> /usr/local/share/emit/emit-libs.scm  [chained]
chain /usr/local/share/emit/emit-libs.scm -> scheme.inexact  [1 library]
(n 3 mean 2.0 rms 2.160246899469287)
```

The `chain` line names the manifest a library actually came from, so a resolution reaching outside
your project is visible rather than silent. To use a different manifest: `--manifest FILE`, or the
`EMIT_MANIFEST` environment variable. Naming one that does not exist is an error rather than a
silent fallback.

## The development loop

`emit repl` is the primary way to work. It compiles each form **in-process** into a long-lived JIT
session, so definitions, closures, and heap values persist across forms, and it uses the same
compiler core as `emit build` — what works here works in the executable.

```sh
emit repl
```
```
resolve manifest -> emit-libs.scm
Emit (embedded compiler, ORC/LLJIT).  ^D to exit.
> (import (report))
> (describe (list 1.0 2.0 3.0))
(n 3 mean 2.0 rms 2.160246899469287)
> (define (twice f x) (f (f x)))
> (twice (lambda (n) (* n 3)) 2)
18
```

- Your project's libraries are available through the manifest; `(import (report))` loads it and its
  dependencies in order, initializing each once.
- A **compile error** is reported and the session rolls back, so a typo does not end your session.
  A **runtime trap** (say an arity error) is isolated the same way.
- **Redefinition works**: a later `define` of the same name shadows the earlier one for subsequent
  forms.
- References resolve to **earlier forms only** — mutually recursive top-level definitions entered
  as separate forms will not find each other, though they work inside one program compiled as a
  whole.
- `^D` exits. `emit repl --no-prelude` starts faster with no standard library, for when you want
  only primitives.

After editing a library source, restart the session to pick it up — a running session holds the
unit it already loaded.

## Delivering an executable

```sh
emit build myproj
```
```
resolve manifest -> emit-libs.scm
build myproj -> build/myproj  [source main.scm]
wrote build/myproj  [155768 bytes exe]
```

```sh
./build/myproj
```
```
(n 3 mean 2.0 rms 2.160246899469287)
```

This is a real standalone native binary: your program, every library in its transitive import
closure, the baked standard library, and the C runtime, linked by `clang`. It has no dependency on
the Emit checkout at runtime.

If the manifest has exactly one `(program …)` entry you can omit the name (`emit build`). With
zero or several, omitting it is an error that lists the available entries. `-o PATH` overrides the
entry's output path.

## Compiling one library

`emit lib` compiles a single `define-library` to its reusable artifact — the unit IR plus a
readable export table:

```sh
emit lib lib/stats.sld -o build/lib
```
```
lib lib/stats.sld -> build/lib/stats.ll  [10363 bytes]
```

```sh
cat build/lib/stats.exports
```
```
((stats) ((sum-list . "stats:sum-list") (mean . "stats:mean")) ((sum-list "stats:code:sum-list" 1) (mean "stats:code:mean" 1)))
```

The `.ll` is byte-identical to the unit the run and build doors emit for that source — one
compile-unit core, so an artifact cannot drift from what a build would have produced. `-o` defaults
to `build/lib`. The export table's second list records each export's code label and arity, which is
what lets an importing program call it directly instead of through its closure.

## What is in scope without an import

`(scheme base)` is auto-imported into every program and session. It holds the procedures you would
expect — `map`, `filter`, `append`, `fold-left`, `assoc`, the string and character operations,
vectors, bytevectors, hash tables, records — plus the derived forms `cond`, `case`, `when`,
`unless`, `let*`, `do`, `guard`, and named `let`.

R7RS-small puts sixteen names **outside** `(scheme base)`, and so does Emit. These need an explicit
import:

| library | what it holds |
|---|---|
| `(scheme cxr)` | the 24 depth-3 and depth-4 accessors: `caddr`, `cdadr`, `caddar`, … |
| `(scheme read)` | `read` |
| `(scheme file)` | `open-input-file`, `open-output-file`, `call-with-input-file`, … |
| `(scheme inexact)` | `sqrt`, `exp`, `log`, `sin`, `cos`, `tan`, `asin`, `acos`, `atan`, `finite?`, `infinite?`, `nan?` |

```scheme
(caddr (list 1 2 3))        ; => unbound variable caddr
(cadr  (list 1 2 3))        ; => 2   -- the depth-2 forms ARE in (scheme base)
```

Each of these is an ordinary manifest-resolved library, so add an entry for the ones you use. For
the full exported surface of each, see [`MODULES.md`](MODULES.md); for the primitive layer beneath
it, [`PRIMITIVES.md`](PRIMITIVES.md).

## Looking inside the compiler

Every verb takes `--dump`, which prints the intermediate language after each pass to stderr,
leaving stdout untouched:

```sh
emit run --dump main.scm            # 7 stages of your program
emit run --dump-all main.scm        # ... plus (scheme base) and each imported library
emit repl --dump                    # per-form, for a whole session
```

`--dump-all` is the one to reach for when you suspect a library, not your program. See
[`PIPELINE.md`](PIPELINE.md) for what each stage means.

## Narration

Tools narrate to stderr and keep stdout for data, so you can pipe results safely. `EMIT_VERBOSITY`
controls how much:

```sh
EMIT_VERBOSITY=quiet   emit build myproj      # errors only
EMIT_VERBOSITY=verbose emit repl              # per-library detail
```

See [`OUTPUT.md`](OUTPUT.md) for the convention.

## Installing

```sh
make install                        # /usr/local/bin/emit + /usr/local/share/emit/
make install PREFIX=$HOME/.local
```

This installs the binary together with everything the doors need beside it, under
`<prefix>/share/emit/`, where the binary's own lookups find it:

- the default manifest and the library sources it names — so `emit run` and `emit repl` resolve the
  shipped libraries from any directory, and (because the searched manifests chain) from a project
  with its own manifest too;
- the support files `emit build` needs to link — `tools/llvm-env.sh` for toolchain discovery, the
  `tools/log.sh` it sources, and `src/runtime/runtime.c`, each at the same subpath it has in the
  source tree.

So `emit build` works from an install with nothing beside it and nothing in the environment. If no
C toolchain is discoverable at all — a keg-only Homebrew LLVM, say, where neither `clang` nor
`llvm-config` is on `PATH` — `emit` falls back to the toolchain it was *built* against, recorded in
the binary. `CC` / `GC_INC` / `GC_LIB` override everything; live discovery beats the recorded
values, which are the last resort.

Nothing installed refers back into the tree it was built from, so the checkout can be deleted
afterwards.

## Limits you will hit

Emit is a real compiler with a deliberately small surface. The ones most likely to affect a
project:

- **An exported macro is `syntax-rules` only, at the body's top level.** `(export twice)` over a
  `define-syntax` is supported, bare or renamed, and its template may reach the library's private
  names — see [`MODULES.md`](MODULES.md#how-an-exported-macro-travels). But `let-syntax`,
  `letrec-syntax`, `define-syntax` at an inner scope, `syntax-case`, and procedural transformers are
  not. A typo inside an exported template is reported in the importing program rather than at the
  library ([#56](https://github.com/bwbensonjr/emit/issues/56)).
- **Imports are whole-library.** No `only`, `except`, `prefix`, or `rename` on the import side.
- **A library may be assembled from several files.** `(include "f.scm" ...)` splices a file's forms
  into the body, `(include-ci ...)` does the same case-folded, `(include-library-declarations
  "d.scm")` splices *declarations* (a shared `export` list, an `import` block), and `(cond-expand
  ...)` selects declarations by feature. A filename resolves **beside the file that named it**, so a
  library directory carries its own pieces. `include` in *program* position is not implemented — the
  four are library declarations only.
- **A library using `define-record-type` must import `(scheme base)`** — the constructor it lowers
  to builds its field vector with `list`.
- **Numbers**: fixnums and flonums. Exact integers span `[-2^60, 2^60)` and an out-of-range result
  is a reported error, not a wrapped value; there are no bignums or exact rationals yet, and
  `(sqrt 4)` is `2.0` (use `exact-integer-sqrt` for the exact answer).
- **Control**: `call/cc` and `dynamic-wind` work. The exception surface you should use is `guard`,
  `raise`, and `error` — `with-exception-handler` is bound, because it is the installer `guard`
  expands to, but it does not give R7RS's resumable behavior (a `raise` inside it still aborts) and
  `raise-continuable` is absent.
- **An unsupported import set fails confusingly.** `(import (only (scheme inexact) sqrt))` reports
  `program imports a library not found in the manifest`, because `(only …)` is read as a library
  name. Use whole-library imports.
- **`emit build` does not tree-shake.** It links whole library units; the closed-world strip runs
  only on the Chez driver's ship path. Expect a delivered binary to be larger than necessary
  (`docs/PERFORMANCE.md`, P8 and P10).
- **The final value is printed**, as shown above.

## If you are also changing the compiler

The library sources under `lib/` are **generated** from `src/prelude.scm` (except
`lib/scheme/inexact.sld`, which is hand-written) — do not edit them by hand. And note that the
baked `(scheme base)` in the binary wins over a manifest entry for it, so editing
`lib/scheme/base.sld` does not change what any door sees until you run `make regen`. That is the
same rule for every door: the committed IR under `bootstrap/` is authoritative and is never
silently rebuilt.

## Where to go next

- [`MODULES.md`](MODULES.md) — the module system in full: the export table, artifact caching,
  initialization order, cross-unit direct calls, the shipped libraries.
- [`PRIMITIVES.md`](PRIMITIVES.md) — how primitives are ordinary shadowable procedures.
- [`PIPELINE.md`](PIPELINE.md) — the pass ladder behind `--dump`.
- [`OUTPUT.md`](OUTPUT.md) — the narration convention.
- [`PERFORMANCE.md`](PERFORMANCE.md) — known speed and size debt.
- `demos/` — around eighty small programs, each a working example of one feature.
