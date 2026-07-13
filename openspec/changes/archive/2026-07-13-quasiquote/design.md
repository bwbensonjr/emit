## Context

The expander (`src/passes/expand.ss`) is a source→source fixpoint rewriter: each macro use is
rewritten by the first matching `syntax-rules` rule and re-expanded until only core forms and
known heads remain. Most derived forms (`cond`, `and`, `or`, `when`, `unless`, `let*`) are
`syntax-rules` macros in the prelude, but forms that cannot be expressed as plain
`syntax-rules` are handled directly in `expand.ss` — named `let` is the precedent. Quasiquote
is another such form: `unquote-splicing` requires `append` of computed lists at arbitrary
positions, which `syntax-rules` cannot express cleanly, and correct nesting requires level
tracking. The reader (`read-from-string`, also in the prelude) already turns `'x` into
`(quote x)` via `rd-quote`; quasiquote adds the analogous sugar. Quasiquote lowers entirely to
existing core forms and primitives (`cons`, `append`, `list`, `quote`), so nothing below the
expander changes.

## Goals / Non-Goals

**Goals:**
- Reader sugar: `` `x `` → `(quasiquote x)`, `,x` → `(unquote x)`, `,@x` → `(unquote-splicing x)`.
- Expander transformation of `quasiquote` over list/atom structure, including
  `unquote-splicing` and correct handling of nesting levels.

**Non-Goals:**
- Vector quasiquote `` `#(…) `` — requires `vectors`; deferred until both exist.
- `unquote`/`unquote-splicing` outside a `quasiquote` (an error, as in R7RS).
- A general `syntax-case`/procedural macro system — separate, larger work; this change only
  adds the one built-in transformer.

## Decisions

### D1 — Reader sugar mirrors the existing quote sugar

`rd-datum` gains two dispatch characters alongside `'` (39) and the others:

- `` ` `` (96): read the next datum `d`, produce `(quasiquote d)`.
- `,` (44): if the next character is `@` (64), read the following datum `d` and produce
  `(unquote-splicing d)`; otherwise read `d` and produce `(unquote d)`.

These reuse `rd-skip-ws` + `rd-datum` exactly as `rd-quote` does. The produced forms use the
long names `quasiquote`/`unquote`/`unquote-splicing` (the reader emits no reader-specific
nodes), so the expander sees ordinary forms.

### D2 — A built-in `quasiquote` transformer in `expand.ss`, level-tracked

Add a recursive `qq` rewrite dispatched when the expander sees a `quasiquote` head (handled
directly, like named `let`, not via `syntax-rules`). At quasiquote level 1 over a datum `d`:

- `d = (unquote x)` → the expansion of `x` (drop the `unquote`).
- `d` a list containing a leading `(unquote-splicing x)` element → `(append x' (qq rest))`,
  where `x'` is `x` expanded; other elements recurse and `cons`.
- `d = (a . b)` (no splicing at the head) → `(cons (qq a) (qq b))`.
- `d` atomic (symbol, number, string, char, `()`, boolean) → `(quote d)`.

Nesting: a nested `(quasiquote e)` inside increments the level and is rewritten to
`(list (quote quasiquote) (qq e))`; an `(unquote e)`/`(unquote-splicing e)` at level > 1
decrements the level and is rewritten structurally (kept as data with its inner rewritten),
so only level-1 unquotes actually splice values. This is the standard R7RS quasiquote
algorithm restricted to lists.

The transformer runs within the existing fixpoint, so unquoted expressions are themselves
fully expanded (they may contain macros), and no `quasiquote`/`unquote`/`unquote-splicing`
form survives into the parsed core language.

### D3 — Keyword bookkeeping

`quasiquote`, `unquote`, and `unquote-splicing` are added to the expander's known-keyword set
so hygienic renaming does not treat them as free identifiers, and so a stray `unquote` outside
a quasiquote is recognized (and reported, per Non-Goals). They are compile-time only; like the
other derived forms they never reach the runtime.

### D4 — Lowers to existing core forms only

The rewrite emits `cons`, `append`, `list`, and `quote` — all already supported — so codegen,
the runtime, and the value representation are unchanged. `append` is the prelude's binary
`append`; splicing multiple segments nests `append` calls right-to-left.

## Risks / Trade-offs

- **Nesting correctness** — level tracking is the subtle part; covered by a nested-quasiquote
  demo (`` `(a `(b ,(+ 1 2))) `` keeps the inner quasiquote intact) in addition to the
  level-1 cases.
- **`unquote-splicing` of a non-list** — undefined for this subset (as with other domain
  errors); `append` expects proper lists. Noted.
- **`append` arity** — the prelude `append` is binary; multi-segment splicing composes nested
  binary `append`s, which is correct. If an n-ary `append` arrives later, the rewrite can use
  it directly without a semantic change.
- **Vector quasiquote deferred** — `` `#(…) `` is explicitly out of scope until `vectors`
  lands; the transformer can gain a vector arm then (`list->vector` of the rewritten
  elements), mirroring the `rt_equal` follow-on pattern.
- **Reader/expander split** — sugar is pure prelude reader; semantics is pure expander; the
  two meet only through the ordinary `(quasiquote …)` form, keeping the pieces independently
  testable.
