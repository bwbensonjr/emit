## Context

`parse-body` (`src/parse.ss`) currently maps each body form through `parse-expr` and folds
them into a `seq` chain; `parse-expr` errors on any `(define …)`. Meanwhile `collect-toplevel`
(same file) already turns a program's top-level defines into a `letrec` — splitting all-lambda
groups into an efficient `(letrec (…) body)` and mixed groups into the `letrec*`→`let`+`set!`
form (boxing handled downstream by `convert-assignments`). Internal defines are the same
problem one scope inward, so the transform is already written; it just needs to run for bodies.

## Goals / Non-Goals

**Goals:** accept a run of `define`s at the head of a `lambda`/`let`/`letrec`/`begin` body
with `letrec*` semantics, reusing the top-level transform; keep non-define-leading bodies and
the "define only at head of body" error unchanged.

**Non-Goals:** `define-values`, internal `define-syntax` (macros stay top-level, matching the
current expander), defines interleaved after expressions (still an error), R7RS body-splicing
of `begin` beyond what already exists.

## Decisions

### D1: Fold leading body defines through the existing transform

Rewrite `parse-body` to first peel the leading `(define …)` forms from the body form list. If
there are none, behave exactly as today. If there are some, hand that define run plus the
trailing expressions to the same builder `collect-toplevel` uses (factor it into a shared
helper `build-body forms` that returns the `letrec`/`let`+`set!` core-IL), so top-level and
internal defines produce identical IL and share one code path. A `define` appearing after a
non-define body expression stays an error (defines must form a prefix of the body).

### D2: Expansion order

Macros are expanded before parse (`expand` runs on the whole program). A body like
`(let () (my-macro) (define x 1) x)` only exposes internal defines after expansion, which has
already happened by the time `parse-body` runs — so gathering defines in `parse-body` sees the
post-expansion forms. Confirm no pass between `expand` and `parse` assumes bodies are
define-free; `recognize-let`/`convert-*` run after parse on core-IL that has no `define`, so
they are unaffected.

## Risks / Trade-offs

- **Semantics: `letrec*` vs `letrec`** → match what `collect-toplevel` already does at the top
  level (its documented split), so internal and top-level defines behave identically; no new
  semantic surface.
- **A body that is only defines (no trailing expression)** → same undefined case as an empty
  body; reuse `collect-toplevel`'s existing handling rather than inventing a new rule.
- **Shared helper churn** → factoring `collect-toplevel`'s body-builder must not change
  top-level output (guarded by the byte-for-byte backend-equivalence suite).
