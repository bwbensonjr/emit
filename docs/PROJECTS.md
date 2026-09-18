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

Pass program arguments after a mandatory separator:

```sh
emit run formatter.scm -- --check input.scm
```

Before `--`, Emit parses its own options and accepts at most one source file. After it, every token
is forwarded unchanged; `(command-line)` sees `formatter.scm`, `--check`, and `input.scm`. Source
read from stdin uses `-` as its logical command name. Non-executing modes such as `--emit` reject
program arguments.

The run door uses LLVM's `-O1` JIT profile by default. Use `emit run -O0 main.scm` for the old
unoptimized diagnostic/baseline path, or `emit run -O2 main.scm` when a longer-running program can
justify more JIT latency. These profiles affect execution only: `emit run --emit` remains the
compiler-produced IR path and therefore rejects a simultaneous `-O` option rather than ignoring it.

## A library of your own

Split code into libraries with R7RS `define-library`. A library declares its name, what it
imports, what it exports, and a body. Unlike a program, **a library does not auto-import
`(scheme base)`** — it must ask:

```sh
mkdir -p lib/my
```

`lib/my/stats.sld`:
```scheme
(define-library (my stats)
  (import (scheme base))
  (export sum-list mean)
  (begin
    (define (sum-list xs) (fold-left + 0 xs))
    (define (mean xs) (/ (sum-list xs) (length xs)))))
```

A library may import another library, including a standard one that is not auto-imported.
`lib/my/report.sld`:
```scheme
(define-library (my report)
  (import (scheme base) (my stats) (scheme inexact))
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
(import (my report))
(describe (list 1.0 2.0 3.0))
```

## No mapping file is needed

The project now has the conventional layout:

```text
main.scm
lib/
  my/
    stats.sld
    report.sld
```

Emit maps `(my report)` to `lib/my/report.sld` and validates the file's declared name. It searches
the project root before installed roots, so `(scheme inexact)` still comes from Emit's installed
`lib/scheme/inexact.sld`. Run the application directly:

```sh
emit run main.scm
```

Add roots explicitly with repeatable `-L DIR` / `--library-path DIR`, or set
`EMIT_LIBRARY_PATH` to the host's path-separated list. Explicit roots precede the environment,
which precedes the project `lib/` root. The first matching source wins.

## When to add a manifest

Use `emit-libs.scm` when a name cannot use the conventional mapping, when a source lives at an
exceptional path, when artifacts need a selected directory, or when you want stable named program
targets:

```scheme
((library (legacy stats) (source "vendor/statistics.sld") (artifacts "build/vendor"))
 (program myproj (source "main.scm") (output "build/myproj")))
```

Exact project entries override conventional files. Relative source, artifact, program, and output
paths resolve against the manifest's directory. You never need to map `(scheme base)`, and ordinary
installed libraries need no project mapping.

`--manifest FILE` wins over `EMIT_MANIFEST`; either selects an out-of-tree project without
consulting an unrelated working-directory manifest. Installed providers remain available. For exact
single-manifest operation, disable both independent fallback mechanisms:

```sh
emit build myproj --manifest /path/to/myproj/emit-libs.scm \
  --no-manifest-chain --no-library-paths
```

Emit narrates each selected non-baked source on stderr, including its provider kind. Quiet mode
suppresses that narration without changing program output.

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
> (import (my report))
> (describe (list 1.0 2.0 3.0))
(n 3 mean 2.0 rms 2.160246899469287)
> (define (twice f x) (f (f x)))
> (twice (lambda (n) (* n 3)) 2)
18
```

- Exact manifest libraries are validated at startup. A conventional library such as
  `(my report)` is untouched until its first import, when Emit resolves and registers its
  dependency closure, then initializes each member once.
- A **compile error** is reported and the session rolls back, so a typo does not end your session.
  A **runtime trap** (say an arity error) is isolated the same way.
- **Redefinition works**: a later `define` of the same name shadows the earlier one for subsequent
  forms.
- References resolve to **earlier forms only** — mutually recursive top-level definitions entered
  as separate forms will not find each other, though they work inside one program compiled as a
  whole.
- `^D` exits. `emit repl --no-prelude` starts faster with no standard library, for when you want
  only primitives.
- The session uses the same `-O0`/`-O1`/`-O2` JIT profiles as `emit run`, with O1 as the default.
  The selection is fixed when the session starts and applies to libraries and every later form.

After editing an already imported library source, restart the session to pick it up — a running
session holds the unit it selected.

## Delivering an executable

```sh
emit build main.scm
```
```
build main.scm -> build/main  [source main.scm]
wrote build/main  [155768 bytes exe]
```

```sh
./build/main
```
```
(n 3 mean 2.0 rms 2.160246899469287)
```

This is a real standalone native binary: your program, every library in its transitive import
closure, the baked standard library, and the C runtime, linked by `clang`. It has no dependency on
the Emit checkout at runtime.

Before linking, `emit build` tree-shakes unreachable bindings through the whole import DAG and
then runs the closed-world `-O2 -flto` ship profile. This is intentionally stronger than the
open-world per-module JIT optimization. The missing tree shake in this door was fixed by
`chez-free-unit-pipeline` and `import-dag-tree-shaking` (`Fixes #112`).

A `.scm`-suffixed or path-shaped operand is always direct source; `-o PATH` overrides its
`build/<basename>` default. A bare operand remains a manifest program name. If a manifest has
exactly one `(program …)` entry you can still omit the name (`emit build`).

## Compiling one library

`emit lib` compiles a single `define-library` to its reusable artifact — the unit IR plus a
readable export table:

```sh
emit lib lib/my/stats.sld -o build/lib
```
```
lib lib/my/stats.sld -> build/lib/my.stats.ll  [10363 bytes]
```

```sh
cat build/lib/my.stats.exports
```
```
((my stats) ((sum-list . "my.stats:sum-list") (mean . "my.stats:mean")) ((sum-list "my.stats:code:sum-list" 1) (mean "my.stats:code:mean" 1)))
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
| `(scheme file)` | `open-input-file`, `open-output-file`, `call-with-input-file`, `file-exists?`, `delete-file`, … |
| `(scheme inexact)` | `sqrt`, `exp`, `log`, `sin`, `cos`, `tan`, `asin`, `acos`, `atan`, `finite?`, `infinite?`, `nan?` |
| `(scheme case-lambda)` | the `case-lambda` derived form |
| `(scheme char)` | Unicode 17.0.0 properties, casing, folding, and case-insensitive comparisons; plus Emit's `char-general-category` extension |
| `(scheme process-context)` | `command-line`, `exit`, `emergency-exit`, and environment access |
| `(scheme write)` | `display`, `write`, `write-simple`, and `write-shared` |

Emit also ships one explicit non-standard host extension:

| library | what it holds |
|---|---|
| `(emit filesystem)` | unsorted bare-name `directory-list`, link-following `file-directory?`, final-component `file-symbolic-link?`, and atomic same-filesystem `replace-file` |

`char-general-category` is a second deliberate extension, kept in `(scheme char)`
because it shares that ordinary library's generated Unicode table. It returns
two-letter Unicode 17.0.0 category symbols such as `Lu`, `Ll`, and `Zs`, or `Cn`
for an unassigned scalar; Emit does not provide an `(rnrs unicode (6))` alias.

The predicates return `#f` for missing paths. Enumeration, classification failures other than a
missing path, and failed replacement raise catchable objects satisfying `file-error?`.

```scheme
(caddr (list 1 2 3))        ; => unbound variable caddr
(cadr  (list 1 2 3))        ; => 2   -- the depth-2 forms ARE in (scheme base)
```

Each is an ordinary installed library: import it and Emit finds its conventional source without a
project mapping. For the full exported surface, see [`MODULES.md`](MODULES.md); for the primitive
layer beneath it, [`PRIMITIVES.md`](PRIMITIVES.md).

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

- the compatibility manifest and every non-baked library source at its conventional
  `lib/<components>.sld` path, so projects need no installed-library mappings;
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
  `(sqrt 4)` is `2.0` (use `exact-integer-sqrt` for the exact answer). Because there are no exact
  rationals, **`1/2` is a reported error, not a value and not a symbol** — R7RS allows an
  implementation either to report an unrepresentable exact literal or to represent it inexactly, and
  Emit reports, so the missing feature says so instead of quietly changing your number. Every `n/m`
  is refused, including `4/2` and `#i1/2`, whose values Emit could represent: partial support would
  advertise a notation that is not there. Write `0.5`, or `(/ 1 2)`.
- **Lexical syntax**: line comments `;`, **nested** block comments `#| … |#`, and datum comments
  `#;` (which discards the next datum) all work everywhere they should. Number literals take the
  R7RS radix and exactness prefixes — `#x1f`, `#b1010`, `#o17`, `#d99`, `#i42`, `#e1.0`, and the
  two-prefix combinations `#x#e1f` / `#e#x1f` — in either case; a decimal point or exponent stays
  radix-10 only. The three non-finite tokens read in any case, so `+INF.0` is `+inf.0`.
  `|bar quoted identifiers|` read (with `\|` and `\xHH;` escapes) and are ordinary
  symbols, so `(eq? '|foo| 'foo)` is `#t`, and `write` emits the bars for a symbol whose name would
  not read back without them. Both boolean spellings read (`#t`/`#true`, `#f`/`#false`). Character
  literals take the R7RS names — `#\alarm`, `#\backspace`, `#\delete`, `#\escape`, `#\newline`,
  `#\null`, `#\return`, `#\space`, `#\tab` — plus the extensions `#\nul`, `#\altmode`, `#\esc`, and
  `#\page`, and the hexadecimal form `#\x03BB` (bare `#\x` is still the letter). **An unknown
  character name is a reported error**, not the first letter of the name: `#\alarmm` says so rather
  than quietly meaning `#\a`. Strings take `\a` and `\b` beside `\n \t \r \\ \" \xHH;`, and a
  backslash before a line break is the R7RS **line continuation** — the break and the next line's
  indentation contribute nothing. `#!fold-case` / `#!no-fold-case` persist through a source or
  input port, and `#0=` / `#0#` datum labels reconstruct shared and circular pairs and vectors.
- **Control**: `call/cc` and `dynamic-wind` work. The exception surface you should use is `guard`,
  `raise`, and `error` — `with-exception-handler` is bound, because it is the installer `guard`
  expands to, but it does not give R7RS's resumable behavior (a `raise` inside it still aborts) and
  `raise-continuable` resumes with all values returned by the current handler.
- **A runtime-detected error is a condition you can catch.** A wrong-typed argument, an
  out-of-range index, a negative size, an exact-integer overflow, a division by zero, and `apply`
  with an improper last argument all raise into the same handler chain `raise` uses, so a `guard`
  around them works and the diagnostic arrives as the error object's message with no irritants.
  Uncaught, they report and abort exactly as they did before. What stays **fatal**, and is not
  delivered to any handler, is a violation of the runtime's own invariants: an arity mismatch,
  exhausting the escape/guard frame stack, escaping to a frame that is no longer live, and
  allocation failure. The line is that a condition about *data* leaves the machinery intact for a
  handler to run on, and these say the machinery itself is unsound.
- **`read-error?` and `file-error?` answer for their own sources.** A malformed `read` raises a read
  error, an unopenable file or a failed `delete-file` raises a file error, `error` raises neither,
  and a caught runtime trap is an `error-object?` of neither kind. There is no `error-object-kind`
  — R7RS-small has none, and these two predicates are the whole of the surface.
- **An unsupported import set fails confusingly.** `(import (only (scheme inexact) sqrt))` reports
  `program imports a library not found in the manifest`, because `(only …)` is read as a library
  name. Use whole-library imports.
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
