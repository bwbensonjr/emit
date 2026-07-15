# Exploration: a Chez-free REPL (self-hosting the compiler)

Status: exploration / living roadmap (individual steps become their own changes)
Related: `openspec/changes/archive/2026-07-12-interactive-repl` (the ORC/LLJIT host this
builds on); `openspec/changes/archive/2026-07-13-select-syntax-rules-matcher` and
`…-port-match-to-syntax-rules` (the `match` step, done)
Captured: 2026-07-12 · Updated: 2026-07-13

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

## Progress (updated 2026-07-13)

Two ends have to meet: the language Emit *accepts* grows up, and/or the compiler's
own source shrinks to fit it. Each remaining dependency below gets one of three verdicts —
**grow** the language to it, **avoid** it by rewriting the compiler, or **downgrade** it to a
weaker form a batch compiler can live with.

| Step | Status |
|---|---|
| `match` off Chez (syntax-rules `,x` matcher; `syntax-case` removed) | ✅ **done** — verified the matcher also expands under our own expander |
| vectors + runtime vector primitives | ✅ **done** (archived `2026-07-13-vectors`) |
| ellipsis in the matcher | ⏸️ **shelved** — current passes use none; needs custom-ellipsis expander support; revive only if a pass wants it |
| everything below | ❌ **not yet proposed** |

The biggest single blocker (`match`/`syntax-case`) is cleared, but the structural foundation
(the core/driver split) and the remaining "cheap" and "medium" rocks are still unwritten.

## Dependency inventory — what the front end leans on Chez for

Gathered by grepping `src/*.ss` + `src/passes/*.ss` (usage counts approximate):

| Dependency | Uses | Off-Chez path |
|---|---:|---|
| `match` (`(match)` library) | pervasive | ✅ **done** — reimplemented as a `syntax-rules` `,x` matcher (`src/match.sls`, `(rnrs)` only), verified expandable by our own expander |
| `string-append` | 122 | Runtime primitive (emit builds all IR text this way) |
| `number->string` | 34 | Runtime primitive / in-language over digit math |
| `symbol->string` | 4 | Runtime primitive (inverse of the existing `string->symbol`) |
| `string->utf8` | 1 | Only used for byte framing; host-side concern |
| `map` / `for-each` / `fold-left` / `filter` | ~150 | In-language library — `prelude.scm` already started this |
| `reverse` / `append` / `assq` / `memq` / `list-ref/head/tail` / `iota` | ~60 | In-language library (mostly trivial) |
| `apply` | 41 | Already a supported form (the compiler emits `apply`) |
| `vector` / `vector-ref` / `vector-set!` | ~10 | ✅ **done** — runtime vector primitives added (`2026-07-13-vectors`) |
| `cadr`/`caddr`/`cddr`/… (cxr combinators) | ~78 | **grow** — trivial `prelude.scm` defs over `car`/`cdr` |
| `number->string` | 34 | **grow** — needs integer division (`quotient`/`remainder`) primitives first; then in-language over digit math |
| `case` (used in the passes) | 3 | **grow** — a small `syntax-rules` macro in the prelude (like `cond`/`when`) |
| multiple values (`let-values` / `values`) | ~21 | **grow** the runtime, *or* **avoid** by returning/destructuring pairs |
| `error` / `guard` | ~38 (mostly now the matcher's own `guard` clause syntax) | **downgrade** — real R6RS `guard` is ~1 site (REPL recovery); a batch core can make `error` = diagnose+abort on the `rt_trap` hook |
| `read` (source reader) | 6 | **Already partly bootstrapped:** `read-from-string` (`prelude.scm`) walks a string via M1 `string-ref` |
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
  ✅ match off Chez              (syntax-rules ,x matcher — done)
  ✅ vectors + runtime prims     (done)
  ────── remaining (each is now a proposed change) ──────
  0. core/driver decomposition   → decompose-core-driver
  1. cheap prelude wins          → prelude-cxr-and-case
  2. number formatting           → integer-division-number-format
  3. multiple values             → multiple-values
  4. error/guard downgrade       → error-and-guard-conditions
  5. reader from stdin           → stdin-source-reader
  6. self-apply (fixed point)    → self-hosting-bootstrap  (gated on 0–5)
```

0. **Core/driver decomposition** (`decompose-core-driver`) *(highest-leverage structural
   move)* — split the
   compiler into a **pure core** (forms → IR text; needs only lists/symbols/strings/vectors)
   and a **driver** (file I/O, `process`/clang, ports). Self-hosting then targets the *core*
   (read source on stdin → IR on stdout), and the whole filesystem/subprocess surface drops
   out of the target — the driver can stay Chez/bash indefinitely. The REPL host already
   speaks text-in→IR, and `read-from-string` already exists, so both endpoints are in place.
1. **Cheap prelude wins** (`prelude-cxr-and-case`) — `cadr`/`caddr`/… and a `case` macro;
   afternoon-sized, no runtime changes. Good momentum after the structural split.
2. **Number formatting** (`integer-division-number-format`) — add `quotient`/`remainder`
   runtime primitives, then `number->string` in-language (unblocks `emit.ss`, which is all
   `string-append` + `number->string`).
3. **Multiple values** (`multiple-values`) — the ~21 `let-values` sites: grow real
   `values`/`call-with-values`, or (recommended) refactor to return pairs.
4. **`error`/`guard`** (`error-and-guard-conditions`) — downgrade to diagnose+abort on the
   existing `rt_trap` hook (only ~1 real R6RS `guard` site — REPL recovery — now that the
   matcher owns its own `guard` clause).
5. **Reader** (`stdin-source-reader`) — extend `read-from-string` to read a whole program.
6. **Self-apply** (`self-hosting-bootstrap`) — compile the core with itself → path C
   (subprocess), then embed → A; the triple test is the acceptance criterion.

**Validation at first light (the triple test).** Compile the core with Chez, use *that*
binary to compile the core again, and check the two IR outputs are byte-identical. A stable
fixed point is the proof that self-hosting actually holds.

## Open questions

- ~~Is `match` better as `syntax-rules` or a pattern-compiler pass?~~ **Resolved:**
  `syntax-rules` `,x` matcher (kept the language small; the expander hosts it fine). See
  `2026-07-13-select-syntax-rules-matcher`.
- Minimal condition model for `error`/`guard`: does the `rt_trap` single-jump hook suffice,
  or is a small tagged-condition value + handler stack needed?
- Bootstrap artifact policy: check in a stage-0 `.ll`/native `schemec`, or always
  bootstrap from Chez until the language is self-sufficient?
- Where does the REPL *loop* live after self-hosting — compiled Scheme calling back into
  the host to JIT, or the host driving compiled `compile-form`? (D4 leans to the former.)
- How much of the subset needs to grow before the compiler compiles cleanly (records vs.
  vectors-of-lists, tail calls in the passes, closure depth)?

## Not in scope here

This is the roadmap; the numbered steps are now each a proposed OpenSpec change (see the
ordering above). They are the backlog, applied roughly in order (0 first, 6 last). `interactive-repl` (Groups 5–6 remaining) does not
depend on any of this — it completes the Chez-hosted REPL first.
