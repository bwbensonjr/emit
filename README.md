# Scheme LLVM

Experiment with compiling Scheme into LLVM IR.

A **Chez-hosted Scheme→LLVM compiler**: a hand-rolled frontend pipeline that emits textual
LLVM IR, a small C runtime under Boehm GC, and **three backends** (AOT, JIT, bitcode) that
are checked to agree byte-for-byte. **29 demos pass, all three backends in agreement.**
The compiler is written in Scheme (bootstrapped with Chez), with an eventual self-hosting
goal, and prioritizes simple, transparent stages (see `CLAUDE.md`). Development is
OpenSpec-driven — 14 changes shipped so far, tracked under `openspec/`.

## Quick start

Requires `chez` (Chez Scheme), `clang`, and Boehm GC (`libgc`, e.g. `brew install bdw-gc`);
the JIT and bitcode backends additionally use LLVM 22 (`brew install llvm@22`).

```sh
# compile and run a demo (AOT is the default backend)
chez --libdirs src --script src/compile.ss demos/fact.scm -o /tmp/fact && /tmp/fact   # => 120

# other backends, IL dump, and disabling the prelude
chez --libdirs src --script src/compile.ss demos/fact.scm --backend jit
chez --libdirs src --script src/compile.ss demos/fact.scm --backend bitcode -o /tmp/fact
chez --libdirs src --script src/compile.ss demos/fact.scm --dump          # print IL after each pass
chez --libdirs src --script src/compile.ss demos/fact.scm --no-prelude

# test harnesses
demos/run-tests.sh        # compile+run every demo, compare to expected values
demos/run-backends.sh     # assert AOT = JIT = bitcode for each demo
```

## Layout

- `src/` — the compiler: `compile.ss` (driver), `parse.ss`, `passes/`, `emit.ss`,
  `runtime/runtime.c`, and `prelude.scm` (standard library, prepended to every program).
- `demos/` — example programs and the two test harnesses.
- `openspec/` — specs (`specs/`) and change history (`changes/archive/`).
- `LLVM.md`, `docs/PIPELINE.md` — value representation / calling convention, and the pass
  ladder.

## Pipeline

Hand-rolled `match` passes, one observable intermediate language per `--dump` stage:

```
read (host) → prepend prelude → collect-toplevel → expand → parse+rename → recognize-let
            → convert-assignments → convert-closures → lambda-lift+lower
            → emit .ll → clang (+ runtime, + libgc)
```

Values are tagged 64-bit words. All 8 tags are assigned: fixnum, boolean, nil, pair,
closure, box, symbol (interned), and an extended/header-word object (tag 7) hosting strings
(UTF-8) and characters (Unicode codepoints). Every Scheme function shares one `tailcc`
prototype `(self, argc, a0…a{K-1}, overflow)`, so tail calls are emitted `musttail`
(bounded stack verified at 10M iterations).

## Accomplished

**Language**
- Core: `lambda`, `if`, `let`/`letrec`, `begin`, `set!`, application, top-level `define`,
  multi-form programs.
- Derived forms: `cond`, `and`, `or`, `when`, `unless`, `let*`, named `let`.
- Arithmetic: n-ary `+ - *`; binary `= <`.
- Variadic `lambda`, dotted rest parameters, `apply`, and runtime arity checking — on the
  uniform `argc`+`overflow` calling convention, preserving `musttail`.
- `quote` of symbols and arbitrary nested structure.

**Data & runtime**
- Fixnums, booleans, `()`, pairs, closures, boxes; **interned symbols** (`eq?` by identity);
  **strings and characters** that are Unicode-capable (UTF-8 storage, codepoint-indexed
  operations).
- Primitives: `+ - * = < cons car cdr null? pair? eq? char->integer integer->char
  string-length string-ref substring string->symbol`.
- C runtime under Boehm GC; a tag-walking value printer.

**Library & reader**
- A prelude prepended to every program (user-wins shadowing, `--no-prelude`):
  `not list length reverse append map memq assq`.
- `read-from-string` — a recursive-descent Scheme reader (integers, symbols, lists,
  `#t`/`#f`, `#\char`, `"strings"`, `'`-quote sugar, `;` comments).

**Backends & process**
- AOT / JIT / bitcode from one emitted `.ll`, with a 3-way equivalence harness.
- OpenSpec-driven changes; decisions (framework, calling convention) backed by spikes.

## Not yet done

**Near-term (additive)**
- n-ary comparisons `(= a b c)` / `(< a b c)` and `> <= >=`.
- `eqv?` / `equal?` (only `eq?` today) → then `member` / `assoc`.
- More string/char ops: `char=?`/`char<?`, `string=?`, `string-append`, `symbol->string`,
  `string->list`/`list->string`, `make-string`, string mutation.
- Reader extensions: string escapes, named characters, dotted pairs, quasiquote, vectors.

**Larger language features**
- **Macros / `syntax-rules`** — `expand` is currently hand-written per form; a general
  hygienic expander is the big frontend milestone.
- **Numeric tower** — fixnums only; no bignums/flonums/rationals, no `quotient`/`remainder`/
  `/`, no overflow handling.
- **Control**: `call/cc`, `values`/`call-with-values`, exceptions/`guard`, `dynamic-wind`.
- **Data**: vectors, bytevectors, hash tables, records.
- **I/O**: ports, files, `read` from stdin, `display`/`write` as procedures.
- Recoverable error handling (arity errors currently abort).

**Self-hosting (the north star)**
- The compiler is still Chez-hosted and uses the host `read`. The concrete path: swap host
  `read` for the Scheme `read-from-string`, then port the passes to run within the compiled
  subset — what the recent data-type / prelude / reader changes were building toward.

**Performance / cleanup (deferred by design)**
- No dead-code elimination (the whole prelude is emitted into every program); O(n)
  codepoint string indexing; separate/precompiled prelude; immediate (non-heap) characters.
