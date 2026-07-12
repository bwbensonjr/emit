## Context

`expand` (see `src/passes/expand.ss`) is a source→source pass that runs after
`collect-toplevel` and before `parse`. Today it dispatches on a fixed `case` over known
head symbols — `cond`, `and`, `or`, `when`, `unless`, `let*`, named `let` — each with a
hand-written rewrite into core forms, plus arity-driven folds for n-ary arithmetic and
comparisons. Its own header comment names it "a deliberate rehearsal for the eventual
syntax-rules expander." This change cashes that in.

Constraints that shape the design:
- **Transparency ethos** (`CLAUDE.md`): simple, clear control flow, every stage
  observable under `--dump`. This argues against a heavyweight hygiene algorithm.
- **Existing machinery**: there is already a shared `fresh-name` rename counter (reset per
  program) used by `or` and the comparison chains; a downstream `parse+rename` alpha-
  renames core bindings. Macro hygiene can lean on `fresh-name`.
- **Prelude mechanism**: prelude forms are prepended to the program before expansion, with
  user-wins shadowing. `define-syntax` forms placed in the prelude are therefore in scope
  for every program for free.
- **Frontend boundary**: macros are fully expanded to core s-expressions before `parse`;
  nothing below `parse` (value rep, runtime, emitter, closure/assignment/lift passes)
  changes.

## Goals / Non-Goals

**Goals:**
- Replace the per-form `case` with a general **`syntax-rules`** engine: `define-syntax`
  binds a keyword to a transformer with literals, `_`, and ellipsis (`...`).
- Make `expand` a **fixpoint** pass driven by a macro environment (prelude + user
  `define-syntax`).
- Provide **hygiene for macro-introduced identifiers** so a macro's temporaries never
  capture or get captured by user code — the general form of `or`'s manual `fresh-name`.
- **Move the branching/binding derived forms into the prelude** as `syntax-rules` macros,
  using them as the engine's validation suite; keep the 29 demos passing on all three
  backends.

**Non-Goals:**
- `let-syntax` / `letrec-syntax` (local macro scope) — top-level `define-syntax` only.
- Procedural macros / `syntax-case` / `er-macro-transformer`.
- **Full referential-transparency hygiene** — a free identifier a template inserts that
  the *use site* rebinds is not tracked (see D3 and Risks). The common capture cases are
  covered; the residual cases are documented and deferred.
- `quasiquote`, `case`, `do`, `cond` `=>` on the *hand-written* path — `=>` and bare-test
  clauses now arrive via the prelude `cond` macro instead.
- Keeping the n-ary arithmetic/comparison desugarings as macros — they stay hand-written
  (arity-driven folds, not pattern rewrites).

## Decisions

### D1 — `expand` becomes a fixpoint pass over a macro environment; `define-syntax` is collected before `collect-toplevel`

A new pre-pass scans the top-level form sequence (prelude forms first, then user forms),
lifts out every `(define-syntax name (syntax-rules ...))` form, and builds a **macro
environment** mapping `name → transformer`. `define-syntax` is recognized only at the
literal top level (not as a macro-expansion result), which keeps it purely compile-time
and keeps `collect-toplevel` unchanged. The remaining runtime forms flow through
`collect-toplevel` exactly as today, and `expand` then walks the resulting whole-program
expression carrying the macro environment.

Macros must be **defined before use** in top-level order. Because the prelude is prepended
first, prelude macros are always available; user macros are visible to forms after them.

Pipeline position is unchanged and still observable:
```
read → collect-define-syntax → collect-toplevel → expand(macro-env) → parse+rename → …
                ▲ NEW (builds macro-env)          ▲ now a syntax-rules fixpoint
```

`expand` walks a form:
- pair whose head is a **macro keyword** in the env → apply the transformer, then
  **re-expand the result** (fixpoint at this node);
- `(quote …)` → returned untouched;
- a **core form** (`if let letrec lambda begin set!`) → recurse into subforms (binding
  lists preserved structurally);
- an **n-ary arithmetic/comparison** head → the existing hand-written desugar, then
  recurse;
- otherwise (application) → `map expand`.

A **depth guard** bounds re-expansion; exceeding it raises a clear "macro expansion did
not terminate" error rather than looping.

**Alternative considered:** recognize `define-syntax` anywhere during expansion (so macros
can emit macro definitions). Rejected for this milestone — it complicates ordering and the
compile-time/run-time split for little near-term value.

### D2 — `syntax-rules` matcher + instantiator

A transformer is `(literals, ((pattern . template) …))`. Two mutually recursive halves:

**Match** `pattern` against the input form, producing bindings `pattern-var → syntax`:
- the first pattern element (the macro keyword slot) is ignored, per `syntax-rules`;
- `_` matches anything and binds nothing;
- a **literal** matches only the identical identifier;
- a non-literal identifier is a **pattern variable**, binding whatever it aligns with;
- a list matches structurally; a proper/dotted tail is honored;
- **ellipsis**: `(p ... . tail)` matches zero or more repetitions of `p`, collecting each
  pattern variable inside `p` into an ordered list at **depth + 1**; remaining fixed
  elements after the ellipsis are matched against the tail.

**Instantiate** `template` under the bindings:
- a pattern variable is replaced by its captured syntax;
- `(t ...)` iterates: the ellipsis pattern variables occurring in `t` are stepped in
  lockstep over their captured lists, emitting one instantiation per element;
- ellipsis nesting is handled by recursion on depth (a variable's use depth must match its
  capture depth, else a clear error).

`(... ...)` (ellipsis escape) is deferred.

### D3 — Hygiene by renaming template-introduced binders (not a full mark algorithm)

On each expansion, template identifiers are partitioned:
- **Pattern-derived** syntax (substituted from the input) passes through verbatim — user
  code keeps its own names.
- A **template-introduced** identifier — one written in the template, not a pattern
  variable — is classified:
  - if it names a **core keyword, primitive, or a known top-level/prelude binding**, it is
    left as-is (it refers to the macro's definition environment);
  - otherwise it is a genuinely fresh identifier (e.g. `or`'s `t`) and is **consistently
    renamed** to a `fresh-name` within this single expansion.

This makes introduced temporaries hygienic — they can neither capture user bindings nor be
captured — which is exactly what the derived forms need, and it reuses the existing rename
counter. The set of "known bindings" is computable at expand time from the prelude/user
top-level `define` names plus the fixed keyword/primitive set.

**Alternative considered:** full Kohlbecker-style mark/anti-mark renaming or syntactic
closures for complete hygiene. Rejected for this milestone — substantially more machinery
and state than the transparency ethos wants, and unnecessary for the derived forms and
typical user macros. The residual gap (free template identifiers rebound at the use site)
is documented in Risks and left for a follow-up.

### D4 — Which forms move to the prelude, which stay hand-written

Move to `src/prelude.scm` as `syntax-rules` macros — pure pattern rewrites, and the
engine's validation suite: **`cond`** (with `else`, `=>`, and bare-test clauses),
**`and`**, **`or`**, **`when`**, **`unless`**, and **`let*`**. Their retirement removes the
corresponding cases from `expand.ss`.

Stay hand-written in `expand.ss`:
- **Named `let`.** It overloads the core `let` keyword — `(let name (binds) body)` vs
  `(let (binds) body)` — so it cannot be a distinct macro keyword. A `let` macro would
  either shadow the core form (which `parse` still needs) or, expanding the non-named case
  to a core `let`, re-trigger itself and loop. `expand` therefore dispatches on `let`
  structurally: a symbol in the second position → the named-`let` rewrite; otherwise a
  core `let` recursed into.
- **N-ary `+ - *`** and **comparisons `= < > <= >= eq? eqv?`**. These fold/temp-bind by
  *arity* (e.g. `(- a)` → `(- 0 a)`, chained `<` binds each operand once), which
  `syntax-rules` expresses only awkwardly; keeping them also means arithmetic still works
  under `--no-prelude`.

### D5 — Reserved keywords and `--no-prelude`

`define-syntax` and `syntax-rules` join the reserved keywords; `...` and `_` are pattern
syntax. Because the branching forms now live in the prelude, `--no-prelude` no longer
provides them (documented breaking change). `--no-prelude` remains a compiler-debugging
switch where `lambda`/`if`/`let`/`letrec`/`begin`/`set!`/application and the hand-written
arithmetic still function.

## Risks / Trade-offs

- **Incomplete hygiene** (free template identifier rebound at the use site) → the common
  capture cases are handled by D3; document the boundary and cover it with tests; defer
  full hygiene to a follow-up change.
- **Non-terminating / runaway macros** → depth guard in the fixpoint driver raises a clear
  error instead of hanging.
- **Nested-ellipsis correctness** is the subtlest part of D2 → cover with a depth-2
  ellipsis test (e.g. a `let`-like macro over `((v e) ...)`) plus depth-mismatch error
  cases.
- **Behavioral drift from the old hand-written expansions** → the moved forms must be
  *semantically* equivalent. Fresh-name spellings may differ from today, so verify by
  value, not by byte-identical `--dump`: the existing `demos/run-tests.sh` (values) and
  `demos/run-backends.sh` (AOT=JIT=bitcode) must stay green across all 29 demos.
- **Define-before-use ordering** → acceptable and documented; prelude ordering guarantees
  its macros precede user code.
- **Macro keywords are global (no local shadowing)** → consistent with the existing
  reserved-keyword model. Sharper than expected in practice: a keyword is intercepted even
  where it is a *local* variable, so defining a macro whose name collides with a common
  local (e.g. `loop`, used as the prelude's named-`let` variable) breaks that code. Treat
  a macro name as globally reserved, like a primitive; full local macro scope
  (`let-syntax`) is deferred.

## Migration Plan

1. Build the `syntax-rules` matcher/instantiator and the fixpoint driver in `expand.ss`,
   with the arithmetic/comparison desugarings retained; wire `collect-define-syntax` and
   the macro environment into `src/compile.ss`.
2. With the branching forms still hand-written, add a user-macro demo (`swap!`, `while`)
   and confirm the engine works end-to-end on all three backends.
3. Move `cond`/`and`/`or`/`when`/`unless`/`let*` into `src/prelude.scm` and delete their
   `expand.ss` cases (named `let` stays); keep re-running `run-tests.sh` +
   `run-backends.sh` after each until all existing demos plus the new demos pass.
4. Update `--dump` docs / `docs/PIPELINE.md` if the stage description changed.

Rollback is a frontend revert (restore `expand.ss` cases, drop the prelude macros); no
runtime, emitter, or persisted-format changes are involved.

## Open Questions

- Should `cond`'s `=>` clause bind its test value with a `fresh-name` inside the prelude
  macro (single evaluation), matching R7RS? (Leaning yes — spec it that way.)
- Do we want the depth-guard limit configurable via a flag, or a fixed constant? (Leaning
  fixed constant for simplicity.)
