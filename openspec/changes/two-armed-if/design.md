## Context

The core IL's `if` is three-armed (`(if e e e)`); `parse-expr` matches `(if ,a ,b ,c)` and
everything else with a pair head falls to `(primcall …)` (for prims) or `(call …)`. A source
`(if c t)` therefore parses as `(call if c t)`, and `if` — a keyword, not a value — is
unbound. Two-armed `if` is standard R7RS and the core uses it both directly (the `(if #f #f)`
unspecified-value idiom) and indirectly through the `case` macro, whose no-`else` base case is
`((_ k) (if #f #f))`.

## Goals / Non-Goals

**Goals:** accept `(if test then)` as `(if test then UNSPEC)` in `parse-expr`, so both the
idiom and the `case` default parse; keep three-armed `if` and all emitted IR unchanged for
existing programs.

**Non-Goals:** introducing a first-class "unspecified" datum type or a `void` value distinct
from what `(if #f #f)` already yields — reuse the existing unspecified value the emitter
produces for a not-taken arm.

## Decisions

### D1: Desugar two-armed `if` in the parser

Add a `(if ,a ,b)` clause to `parse-expr` (before the general application case) that produces
the three-armed core IL `(if PARSED-a PARSED-b UNSPEC)`. `UNSPEC` is the unspecified value
already denoted by `(if #f #f)`; the simplest spelling is to parse an alternative of
`(quote ())`/`#f`-equivalent that matches what the current unspecified path emits — chosen to
keep the emitter and runtime untouched. (Implementation picks whichever constant the emitter
already treats as the unspecified result so behavior is identical to today's `(if #f #f)`.)

### D2: Fix the class, not the instances

Fixing `if` at the parser subsumes the `case`-macro default and the `(if #f #f)` sites, so no
prelude/core edits are needed for those. This is preferred over patching the `case` macro to
emit a three-armed default, which would leave two-armed `if` a latent trap for future code.

## Risks / Trade-offs

- **Choice of the unspecified value** → must match what the not-taken `if` arm / `(if #f #f)`
  currently yields so no observable behavior changes; verified by compiling the `case`-heavy
  passes and diffing IR.
- **Ambiguity with application** → none: `(if …)` is only ever the `if` special form; the new
  clause sits with the existing three-armed clause, both ahead of the application fallthrough.
