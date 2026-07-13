## Why

`quote` builds constant structure, but there is no way to build *mostly*-constant structure
with a few computed holes — the everyday use of quasiquote (`` `(a ,x ,@ys) ``) when
assembling lists, and the backbone of template-style code (and, eventually, a
`syntax-case`-flavored macro system). The README groups quasiquote under "reader extensions,"
but it is really two coordinated pieces: **reader sugar** (`` ` ``, `,`, `,@`) and an
**expander transformation** that rewrites the sugar into `cons`/`append`/`list`/`quote` core
forms. This change adds both, scoped to list structure.

## What Changes

- **Reader sugar** (`rd-datum` in `src/prelude.scm`): read `` `x `` as `(quasiquote x)`,
  `,x` as `(unquote x)`, and `,@x` as `(unquote-splicing x)`, mirroring the existing `'x` →
  `(quote x)` sugar.
- **Expander** (`src/passes/expand.ss`): add a built-in `quasiquote` transformer — like the
  existing special handling for named `let` — that recursively rewrites a quasiquoted datum:
  `unquote` splices in a computed value, `unquote-splicing` appends a computed list, other
  pairs become `cons` of the rewritten car/cdr, and everything else becomes `quote`d. Nesting
  level is tracked so nested `` `…`…,… `` behaves correctly.
- **Scope** — list (and atom) structure at the surface. Vector quasiquote (`` `#(…) ``) is
  deferred until both this change and `vectors` exist (design Non-Goals).

## Capabilities

### New Capabilities
<!-- None: quasiquote is a derived form realized by the expander over existing values. -->

### Modified Capabilities
- `core-language`: add quasiquote/unquote/unquote-splicing reader sugar and the surface
  behavior of quasiquoted list construction.
- `macro-system`: the expander SHALL rewrite `quasiquote` (with `unquote`/`unquote-splicing`)
  into core forms, so no quasiquote form survives into the parsed core language.

## Impact

- **Code:**
  - `src/passes/expand.ss` — the `quasiquote` transformer (recursive, level-tracking),
    dispatched alongside the existing special forms; add `quasiquote`/`unquote`/
    `unquote-splicing` to the keyword bookkeeping.
  - `src/prelude.scm` — `rd-datum` sugar for `` ` ``, `,`, `,@` (helpers `rd-quasi`, `rd-unquote`).
  - `demos/` — quasiquote demos: plain, `unquote`, `unquote-splicing`, and a nested case.
- **Verification:** `demos/run-tests.sh` and `demos/run-backends.sh` (3-way) with the new
  demos; a `--dump` check that the `expand` stage output contains no `quasiquote` form.
- **Unaffected:** runtime, value representation, and the calling convention are untouched
  (quasiquote lowers to `cons`/`append`/`list`/`quote`, all existing) — so `aot-codegen` is
  untouched.
- **Depends on:** `macro-system` / the `expand` pass (exists). Soft: sequence after
  `reader-lexical-extensions` (both extend the reader). Vector quasiquote additionally needs
  `vectors` (deferred).
- **Enables:** ergonomic list construction; groundwork for richer templating/macros.
