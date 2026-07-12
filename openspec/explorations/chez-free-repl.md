# Exploration: a Chez-free REPL (self-hosting the compiler)

Status: exploration / roadmap (not an actionable change yet)
Related: `openspec/changes/interactive-repl` (the ORC/LLJIT host this builds on)
Captured: 2026-07-12

## The framing

The interactive REPL has two halves, and only one of them still needs Chez:

```
   ENTERED FORM
        │
        ▼
  ┌───────────────────────────────┐        ┌──────────────────────────┐
  │  COMPILATION  (Chez today)     │  IR    │  EXECUTION  (Chez-free)   │
  │  reader → expander → passes →  │───────▶│  C++ ORC/LLJIT host       │
  │  emit                          │ frames │  addModule → lookup → call│
  └───────────────────────────────┘        └──────────────────────────┘
        run by Chez Scheme                    already knows nothing of Chez
```

The C++ host (`src/repl/host.cpp`) JITs arbitrary IR; it has no idea Chez exists.
So "REPL without Chez" reduces to one thing: **make the compiler itself run without
Chez.** That is exactly the project's stated self-hosting goal.

## Dependency inventory — what the front end leans on Chez for

Gathered by grepping `src/*.ss` + `src/passes/*.ss` (usage counts approximate):

| Dependency | Uses | Off-Chez path |
|---|---:|---|
| `match` (`(match)` library) | pervasive | **Biggest lever.** Reimplement as `syntax-rules` macros (expander is already in-language) or a small pattern-compiler pass |
| `string-append` | 122 | Runtime primitive (emit builds all IR text this way) |
| `number->string` | 34 | Runtime primitive / in-language over digit math |
| `symbol->string` | 4 | Runtime primitive (inverse of the existing `string->symbol`) |
| `string->utf8` | 1 | Only used for byte framing; host-side concern |
| `map` / `for-each` / `fold-left` / `filter` | ~150 | In-language library — `prelude.scm` already started this |
| `reverse` / `append` / `assq` / `memq` / `list-ref/head/tail` / `iota` | ~60 | In-language library (mostly trivial) |
| `apply` | 41 | Already a supported form (the compiler emits `apply`) |
| `vector` / `vector-ref` / `vector-set!` | ~10 | Add vector primitives to the runtime (M1 has none yet) |
| `error` / `guard` | ~38 | Ride on the **`rt_trap` longjmp hook** already built for the host |
| `read` (source reader) | 6 | **Already partly bootstrapped:** `read-from-string` (`prelude.scm:171`) walks a string via M1 `string-ref` |
| `process` | 2 | Disappears — only used for the target header, which the C++ host already knows |
| `open-input-file` / `open-output-file` / `command-line-arguments` | few | Entry-point I/O; a REPL reads stdin, not files |

Assets that already exist in-language (the trajectory is real, not hypothetical):

- a reader (`read-from-string`) over M1 string primitives,
- the `syntax-rules` macro expander (`src/passes/expand.ss`),
- the prelude bootstrapping derived forms and list helpers (`src/prelude.scm`),
- the `rt_trap` escape hook (from Group 4) ready to back `error`/`guard`.

## The three paths

```
                         gated on the SAME milestone:
                "the compiler is compilable by the implemented language"
                                        │
        ┌───────────────────────────────┼───────────────────────────────┐
        ▼                                ▼                                ▼
  (B) FRONT END IN C++            (C) COMPILED-COMPILER          (A) FULL SELF-HOSTING
  rewrite reader/expander/            AS SUBPROCESS                 compile the compiler
  passes/emit in the host          AOT-build `schemec`,            with itself; host loads
  language                          host shells out to it          the COMPILED compiler,
                                     per form instead of Chez       calls it in-process
   fast, but abandons the           removes Chez at REPL            per form, JITs the IR
   "compiler in Scheme" goal        runtime; less work than A       → the end state
   and duplicates everything        (a stepping stone to A)
```

- **A — Full self-hosting (stated goal, end state).** Grow the subset + runtime until the
  compiler is expressible in it, then compile the compiler with itself. The REPL becomes:
  the C++ host loads the *compiled* compiler; each form is compiled by compiled-Scheme (no
  Chez), and the host JITs the result. Design decision D4 of `interactive-repl` ("loop
  logic in Scheme, thin C++ server") survives unchanged — it just becomes *compiled*
  Scheme instead of Chez. Chez remains only as the initial bootstrap, and eventually not
  even that (build from a checked-in stage-0 artifact).

- **B — Front end in C/C++.** Fastest to Chez-free, but abandons the project's identity
  ("compiler written in Scheme") and duplicates the whole front end. Not recommended.

- **C — Compiled-compiler-as-subprocess (pragmatic intermediate).** Once the compiler is
  self-compilable, AOT-build it to a native `schemec` and have the REPL host shell out to
  it per form instead of `chez … compile.ss`. Removes Chez at REPL runtime with far less
  integration than embedding. A concrete stepping stone toward A.

A and C are gated on the same milestone; B sidesteps it at the cost of the project's goal.

## Suggested ordering

```
  1. match off Chez ───────────────┐  (syntax-rules macros / pattern-compiler pass)
  2. string/number primitives ─────┤  (string-append, number->string, symbol->string)
  3. vectors + finish list library ┤  (runtime vector prims; prelude helpers)
  4. error/guard over rt_trap ─────┤  (reuse the Group 4 escape hook)
  5. reader from stdin ────────────┤  (extend read-from-string to a full stream)
  6. self-apply ───────────────────┘  → path C (subprocess), then embed → path A
```

1. **`match` off Chez** — pervasive; the single biggest unblock.
2. **String/number formatting primitives** — unblocks `emit.ss`, which is all `string-append`.
3. **Vectors** + finish the list library in `prelude.scm`.
4. **`error`/`guard`** layered on the existing `rt_trap` hook.
5. **Reader** — extend `read-from-string` to consume a full stdin stream.
6. **Self-apply** — compile `compile.ss` & friends with themselves → path C, then embed → A.

## Open questions

- Is `match` better as `syntax-rules` (stays in the language, but stresses the expander)
  or as a dedicated pattern-compiler pass (more control, more code)?
- Minimal condition model for `error`/`guard`: does the `rt_trap` single-jump hook suffice,
  or is a small tagged-condition value + handler stack needed?
- Bootstrap artifact policy: check in a stage-0 `.ll`/native `schemec`, or always
  bootstrap from Chez until the language is self-sufficient?
- Where does the REPL *loop* live after self-hosting — compiled Scheme calling back into
  the host to JIT, or the host driving compiled `compile-form`? (D4 leans to the former.)
- How much of the subset needs to grow before the compiler compiles cleanly (records vs.
  vectors-of-lists, tail calls in the passes, closure depth)?

## Not in scope here

This is a roadmap, not a change. Each numbered step above is a candidate for its own
OpenSpec change when the time comes. `interactive-repl` (Groups 5–6 remaining) does not
depend on any of this — it completes the Chez-hosted REPL first.
