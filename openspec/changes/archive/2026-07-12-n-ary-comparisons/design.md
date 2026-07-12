## Context

`src/passes/expand.ss` already folds n-ary `+ - *` into nested binary primcalls and
rewrites the derived forms (`cond`, `and`, `or`, `when`, `let*`, named `let`, …). The
runtime provides exactly two comparison primitives: `rt_num_eq` (`=`) and `rt_lt` (`<`),
both `i64 (i64,i64)`; `>`, `<=`, `>=` do not exist anywhere in the pipeline. `parse.ss`
lists `=` and `<` in `*prims*`; `>`, `<=`, `>=` are not primitives and would otherwise
parse as calls to unbound variables.

Unlike arithmetic — where each operand flows straight into one binary call — a chained
comparison uses each interior operand *twice* (`b` appears in both `(< a b)` and
`(< b c)`). Re-emitting the operand expression twice would evaluate side effects twice, so
operands must be bound to temps first. `expand-or` already establishes this pattern
(`(let ([t …]) (if t t …))` with a `fresh-name` temp), so this change reuses the same
machinery. `expand` runs before `parse`, so `>`, `<=`, `>=` can be rewritten away and
never need to become primitives.

## Goals / Non-Goals

**Goals:**
- Make `= < > <= >=` accept any arity as single-evaluation chained comparisons.
- Add `> <= >=` as frontend-derived forms over the existing `<` / `=` primitives.
- No runtime, ABI, or backend change; binary `<` / `=` calls already emitted stay
  byte-for-byte identical.

**Non-Goals:**
- New comparison runtime functions or a native `rt_gt` / `rt_le` — everything reduces to
  `<` and `=`.
- Non-numeric or mixed-type comparison semantics (still integer-only, as `rt_lt` is).
- Making `> <= >=` first-class primitive *values* usable with `apply` — that is the
  variadic/`apply` line of work, not this fold.

## Decisions

### D1 — Chain in the `expand` pass

Add the comparison handling to `expand.ss` next to `expand-arith`, dispatched from the
`case (car e)` on the operator symbols `= < > <= >=`. Operands are expanded first (so
nested derived forms and arithmetic inside a comparison work), then chained. This keeps
comparisons under the existing `expand` `--dump` stage with no new pass.

### D2 — Bind temps, then conjoin pairwise tests

For operands `e1 … en` (n ≥ 2), emit

```
(let ([t1 e1] [t2 e2] … [tn en])
  (and (cmp t1 t2) (cmp t2 t3) … (cmp t(n-1) tn)))
```

with `ti` from `fresh-name`. The generated `and` is itself expanded, so it becomes the
existing short-circuiting `if` chain — first false pair yields `#f`, and `ti` are
variables so the pairwise tests may reference them freely. A single multi-binding `let`
plus nested lets is avoided in favor of the established pattern; to guarantee strict
left-to-right operand evaluation the temps are bound with nested single-binding `let`s (as
`or` does) rather than relying on multi-binding `let` evaluation order.

### D3 — Pairwise reduction to `<` and `=`

Each `cmp` on two temps reduces to the two real primitives:

| operator | `(cmp x y)` on temps |
|----------|----------------------|
| `=`  | `(= x y)` |
| `<`  | `(< x y)` |
| `>`  | `(< y x)` — swap operands |
| `<=` | `(or (< x y) (= x y))` |
| `>=` | `(or (< y x) (= x y))` |

`x` and `y` are temps, so the double reference in `<=` / `>=` is free of re-evaluation.
The emitted `or` expands to the standard `if` chain (with its own temp), but since the
arguments are already variables it collapses cleanly.

### D4 — Arity edge cases

`(op)` and `(op a)` expand to `#t` (a chain of zero pairs is vacuously true), matching
Scheme's treatment of trivial comparisons and avoiding a special error path. The n = 1
operand is not evaluated for side effects — consistent with the vacuous-truth reading and
simpler than threading a `begin`; this is documented as an accepted simplification.

### D5 — Alternatives considered

- **Native `rt_gt` / `rt_le` runtime functions** — rejected: adds runtime + ABI surface
  for operators fully expressible via `<` and `=`, against the "frontend-only, no runtime
  change" spirit of `n-ary-arithmetic`.
- **Left-fold like arithmetic** (`(< (< a b) c)`) — wrong: comparisons return booleans,
  not comparable values, so folding is a type error. Chaining (conjunction of pairs) is
  the correct semantics.
- **Re-emitting operands without temps** — rejected: double-evaluates interior operands'
  side effects; violates single-evaluation.

### D6 — Latent `ev-if` phi bug surfaced (emitter fix)

Chained comparisons are the first construct to emit a nested `if` in a **value arm** of
another `if` (`and-core` puts the rest-of-chain in the then-arm; `<=`/`>=` are themselves
`if`s). In `ev-if` the merge `phi`'s incoming block was captured by a parallel
`(let ([bv (ev b …)] [bbb current-bb]) …)`. Chez evaluates parallel `let` inits
right-to-left, so `bbb` read `current-bb` *before* the arm was emitted — capturing the
arm-entry label. For a simple arm that label is still correct (the arm doesn't move
`current-bb`); for an arm containing a nested `if` the arm actually ends in an inner merge
block, so the `phi` named the wrong predecessor and LLVM rejected the IR. Existing demos
never hit this because their nested `if`s sat in tail position (`et-if`, no `phi`) or in
condition position. Fixed by sequencing the two captures with `let*`. This is the change's
only edit outside the frontend and adds no runtime/ABI surface.

## Risks / Trade-offs

- **Interior operand duplication** → mitigated by binding every operand to a `fresh-name`
  temp before chaining (D2); covered by a single-evaluation demo using a boxed counter.
- **Evaluation order** → nested single-binding `let`s fix strict left-to-right order (D2),
  matching arithmetic and real Scheme.
- **`> <= >=` never reserved as primitives** → acceptable: they are rewritten in `expand`
  before `parse` runs, so they need not be added to `*prims*`; a user-defined binding of
  those names is out of scope for the M1 subset (as with the other derived-form keywords).
- **Empty/one-arg comparisons don't evaluate their operand** (D4) → minor divergence from
  R7RS, documented; the subset is integer-only and this avoids a `begin`-wrapping special
  case.
