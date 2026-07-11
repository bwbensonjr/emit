# core-lambda-slice compiler

A minimal Scheme→LLVM compiler for the M1 core-lambda subset, taking one
top-level expression all the way from source to a native executable. Built per
the OpenSpec change `core-lambda-slice` (see `openspec/changes/`), governed by
`docs/PIPELINE.md` (pass framework) and `LLVM.md` (IR conventions).

## Build and run a program

From the repo root:

```sh
chez --libdirs src --script src/compile.ss demos/fact.scm -o /tmp/fact
/tmp/fact            # prints the program's value; exit 0 on success
```

Add `--dump` to print the intermediate language after each pass to stderr:

```sh
chez --libdirs src --script src/compile.ss demos/counter.scm -o /tmp/counter --dump
```

Run the end-to-end test suite:

```sh
demos/run-tests.sh
```

Requires Chez Scheme, clang, and libgc — see `../TOOLCHAIN.md`.

## The M1 subset

One top-level expression over: fixnums, booleans, `()`, pairs; `quote`, `if`,
`lambda`, application, `let`, `letrec`, `begin`, `set!`; and the primitives
`+ - * = <` (binary), `cons car cdr`, `null? pair? eq?`. Primitive names are
reserved. Not included: strings, vectors, chars, floats, macros, `call/cc`,
top-level `define`.

## Pipeline

```
read (host)  ->  parse + alpha-rename        parse.ss
  -> recognize-let                           passes/recognize-let.ss
  -> convert-assignments  (set! -> boxes)    passes/convert-assignments.ss
  -> convert-closures     (letrec -> closures) passes/convert-closures.ss
  -> lambda-lift + lower  (-> L-code)         passes/lower.ss
  -> emit LLVM IR                             emit.ss
  -> clang link with runtime + libgc          compile.ss
```

Each `.ss` under `passes/` is one observable stage (`--dump`). The first three
passes are promoted from `spike/nanopass/` (the hand-rolled `match` versions).

## Layout

```
compile.ss      driver: pipeline + stage dumps + clang link
parse.ss        source -> core IL, then alpha-rename
passes/         one pass per file
emit.ss         L-code -> textual LLVM IR (opaque ptrs, tailcc, musttail)
runtime/runtime.c  C runtime: tagged values, primitives, libgc, printer, main
match.sls       vendored Chez match macro (from akeep/scheme-to-llvm)
util.ss         set ops + deterministic fresh names
```

## Value representation

One 64-bit tagged word, shared verbatim between `emit.ss` and `runtime.c`
(low 3 bits = tag):

| tag | kind | notes |
|-----|------|-------|
| 000 | fixnum  | immediate, `n << 3` |
| 001 | boolean | `#f`=1, `#t`=9 |
| 010 | nil     | `()` = 2 |
| 011 | pair    | heap `{car, cdr}` |
| 100 | closure | heap `{code_ptr, free...}`, called indirectly |
| 101 | box     | heap `{value}`, for assignment-converted vars |

All Scheme functions share one prototype — `tailcc i64 (i64 self, i64 a0 ... a{K-1})`,
K = max arity — so tail calls can be `musttail` (LLVM requires matching
prototypes). Calls pad unused argument slots with 0. `@scheme_entry` is `ccc`
(called from C `main`).
