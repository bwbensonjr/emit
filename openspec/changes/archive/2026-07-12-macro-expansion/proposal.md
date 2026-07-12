## Why

The `expand` stage is hand-written per form: every derived form (`cond`, `and`, `or`,
`when`, `unless`, `let*`, named `let`) has a bespoke rewrite baked into `expand.ss`, and
adding a new form means editing the compiler. This was always a deliberate rehearsal (see
`expand.ss`'s own header) for the real thing — a general, user-extensible macro expander.
Turning `expand` into a `syntax-rules` engine is the big frontend milestone: it lets
programs define their own syntax, it is a prerequisite for a self-hosting compiler (whose
own source leans on macros), and it lets the existing derived forms move out of the
compiler and into the prelude as ordinary macro definitions.

## What Changes

- Add a general **macro expander** as the `expand` stage: a fixpoint source→source pass
  that repeatedly rewrites macro uses until only core forms and known primitives remain.
- Add `define-syntax` (top level) binding a keyword to a **`syntax-rules`** transformer,
  supporting literal identifiers, the `_` wildcard, and **ellipsis** (`...`) patterns and
  templates.
- Make expansion **hygienic with respect to macro-introduced identifiers**: identifiers a
  template introduces into binding position are consistently alpha-renamed per expansion,
  so a macro's temporaries can neither capture nor be captured by user code. This is the
  mechanized, general form of the manual `fresh-name` trick `or` uses today.
- **Re-express the branching/binding derived forms as prelude `syntax-rules` macros** —
  `cond` (including `else`, `=>`, and bare-test clauses, previously unsupported), `and`,
  `or`, `when`, `unless`, and `let*` — retiring their hand-written cases from `expand.ss`.
  Named `let` stays hand-written: it overloads the core `let` keyword, so it cannot be a
  distinct macro without shadowing the core form or looping. The n-ary arithmetic
  (`+ - *`) and comparison (`= < > <= >= eq? eqv?`) desugarings likewise stay hand-written:
  they are arity-driven folds, not pattern rewrites.
- **BREAKING (minor):** `define-syntax` and `syntax-rules` become reserved keywords. The
  moved derived forms are now supplied by the prelude, so `--no-prelude` no longer
  provides `cond`/`and`/`or`/`when`/`unless`/`let*`/named `let` (previously the compiler
  expanded them unconditionally).
- **Frontend only.** Macros are fully expanded before `parse`; no changes to the value
  representation, runtime, emitter, or the core passes below `parse`.

## Capabilities

### New Capabilities
- `macro-system`: user-defined syntactic extensions via `define-syntax` + `syntax-rules`
  (literals, `_`, ellipsis), fixpoint macro expansion, and hygiene for macro-introduced
  identifiers.

### Modified Capabilities
- `core-language`: the "Support derived syntactic forms" requirement is reframed — the
  derived forms are now realized as `syntax-rules` macros (carried by the prelude) rather
  than hardwired into `expand`, with the same semantics; `cond` gains `=>` and bare-test
  clauses. Adds `define-syntax`/`syntax-rules` to the reserved keywords.
- `aot-codegen`: the "Each pipeline stage is independently observable" requirement's
  description of the `expand` stage is updated — it now expands user and prelude macros
  (a fixpoint `syntax-rules` pass), not a fixed set of hardwired derived forms.

## Impact

- **Code (frontend only):**
  - `src/passes/expand.ss` — replace the per-form `case` dispatch with a `syntax-rules`
    matcher/instantiator plus a fixpoint driver over a macro environment; keep the n-ary
    arithmetic/comparison desugarings. Macro-introduced binders draw fresh names from the
    existing rename counter.
  - `src/prelude.scm` — add `define-syntax` definitions for `cond`, `and`, `or`, `when`,
    `unless`, and `let*`.
  - `src/compile.ss` — the `expand` invocation now threads a macro environment collected
    from `define-syntax` forms; `--dump "expand"` line unchanged.
  - `demos/` — a demo defining and using a user macro (e.g. `swap!`, `while`); the
    existing derived-form demos continue to pass unchanged; `demos/run-tests.sh` and
    `demos/run-backends.sh` cover both.
- **Unaffected:** `src/runtime/runtime.c`, `src/emit.ss`, `src/parse.ss`, and
  `src/passes/{recognize-let,convert-assignments,convert-closures,lower}.ss`.
- **Deferred (noted, not built):** `let-syntax`/`letrec-syntax` (local macros),
  procedural/`syntax-case` macros, full referential-transparency hygiene for free
  template identifiers rebound at the use site, `quasiquote`, `case`, and `do` (each
  expressible as a `syntax-rules` macro once the engine lands).
