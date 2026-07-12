## Context

The frontend `expand.ss` already generalizes n-ary chaining via `expand-compare`
(operands bound to fresh temps, adjacent pairs conjoined with a short-circuiting `if`
chain, each pair reduced by `cmp-pair`). It currently dispatches `= < > <= >=`. The
runtime has `rt_eq_p(a,b) = truthy(a == b)`; `not` lives in `src/prelude.scm` as
`(define (not x) (if x #f #t))`; `eqv?` does not exist. Booleans are `FALSE_V = 1`,
`TRUE_V = 9`, and `truthy(b)` returns `TRUE_V`/`FALSE_V`. `eq?` is already in `parse.ss`'s
`*prims*`; `eqv?` and `not` are not.

Pointer/immediate `==` is a correct `eqv?` for the *immediate* fixnums and the *interned*
symbols. It is **not** correct for characters: chars are heap objects
`{ HDR_CHAR, codepoint }` created fresh per literal and never interned, so `==` on two
`#\a`s is `#f` — the same gap `eq?` has today (noted in the prelude). Introducing a distinct
`rt_eqv_p` now reserves the correct seam even though its body currently equals `rt_eq_p`;
the two bodies split once `eqv?` gains value-comparison for characters and non-immediate
numbers (flonums, bignums), which requires char interning/immediates — out of scope here.

## Goals / Non-Goals

**Goals:**
- `eq?` and `eqv?` accept any arity as single-evaluation chained identity comparisons.
- `eqv?` and `not` are real primitives (`rt_eqv_p`, `rt_not`); `not` leaves the prelude.
- No calling-convention change; existing binary `eq?` calls stay behaviorally identical.

**Non-Goals:**
- `equal?` (structural/deep equality) — a separate, larger change (needs recursion over
  pairs/strings); noted as the natural successor.
- Making `eqv?` actually diverge from `eq?` — that waits for non-immediate numbers.
- N-ary `not` — `not` is unary by definition.
- First-class `not`/`eqv?` as procedure values usable with `apply`/`map` (that is the
  variadic/`apply` line of work; primitives are not values in the M1 subset).

## Decisions

### D1 — Chain `eq?` / `eqv?` through the existing `expand-compare`

Add `eq?` and `eqv?` to the `case (car e)` clause that routes to `expand-compare`, and add
their pairwise reductions to `cmp-pair`:

| operator | `(cmp-pair op x y)` |
|----------|---------------------|
| `eq?`  | `(eq? x y)` |
| `eqv?` | `(eqv? x y)` |

No operand swapping or combination (unlike `>`/`<=`/`>=`) — identity is symmetric and
already a single primitive. The rest of `expand-compare` is reused unchanged: temps for
single evaluation, `compare-chain`/`and-core` for the short-circuiting conjunction, and
`(op)`/`(op a)` ⇒ `#t`. Because `eq?`/`eqv?` are also primitives, the emitted pairwise
`(eq? t1 t2)` forms pass straight through `parse` as primcalls — exactly as `<`/`=` do.

### D2 — `eqv?` as `rt_eqv_p`, distinct from `rt_eq_p`

Add `val rt_eqv_p(val a, val b) { return truthy(a == b); }` to `runtime.c`, a
`(eqv? "rt_eqv_p")` row to `prim-table`, a `declare i64 @rt_eqv_p(i64, i64)` line, and
`eqv?` to `*prims*`. Body is `==` for now; a comment marks that it holds
for immediate/interned values but not for boxed characters. **Alternative rejected:**
aliasing `eqv?` to `eq?` in the frontend — cheaper now but erases the seam, forcing a wider
edit later when the semantics split. **Known gap (not fixed here):** `eqv?` on character
literals is `#f`; correct char equality needs char interning/immediates — a separate change
(the natural companion to `equal?`).

### D3 — `not` as `rt_not`, removed from the prelude

Add `val rt_not(val x) { return truthy(x == FALSE_V); }` (only `#f` is false, matching the
`if`/`(if x #f #t)` semantics), a `(not "rt_not")` prim-table row, a
`declare i64 @rt_not(i64)` line, and `not` to `*prims*`. Delete the prelude definition.
`not` is unary and needs **no** `expand` handling — a plain `(not x)` parses directly as a
primcall. **Alternative rejected:** frontend-inline `(not x)` ⇒ `(if x #f #t)` — valid and
runtime-free, but the user chose a true primitive for parity with `eq?`/`=`, and a single
`rt_not` call is as clear as an inlined `if` here.

### D4 — Arity of the new primitives

Primitive calls are not arity-checked by the emitter (a known M1 limitation shared by all
prims). `not` expects one operand and `eqv?` two; misuse (`(not a b)`) mis-emits, exactly
as `(eq? a)` would today. `eq?`/`eqv?` *through `expand-compare`* are safe at any arity
(chained); only a raw mis-arity primcall is unchecked. No new checking is added.

## Risks / Trade-offs

- **`not` was a first-class procedure, now a reserved primitive** → any program passing
  `not` to `apply`/`map`, or rebinding `not`, breaks. Mitigation: none needed in-repo —
  no prelude/demo does so; documented as a minor breaking change, consistent with every
  other primitive.
- **`rt_eqv_p` duplicates `rt_eq_p`** → looks redundant. Mitigation: intentional seam (D2),
  commented; the duplication disappears when `eqv?` gains number-aware behavior.
- **`eq?` now routed through `expand-compare`** → binary `(eq? x y)` gains two `let`
  temps in the IL (as `<`/`=` already did). Behavior is identical; covered by the existing
  demos that use `eq?` (symbol-eq, prelude memq/assq) plus the new demo.
