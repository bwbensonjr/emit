## Context

Multiple values are the first rung of the control-features staircase
(`openspec/explorations/continuations-and-control.md`). The key design fact:
**multiple values need no continuation capture.** A continuation still receives
exactly one machine word; only `call-with-values` interprets that word as a
bundle to spread. So this change touches the *return value representation*, not
the calling convention, and none of the `call/cc` question.

## Goals / Non-Goals

**Goals:** correct R7RS `values` / `call-with-values`; single-value code entirely
unaffected; the bundle is disjoint and memory-safe; `values`/`call-with-values`
are ordinary shadowable `(scheme base)` procedures; both backends byte-identical.

**Non-Goals:** a zero-allocation MV return convention; `let-values` and friends
(follow-on macros); making the single-value-context behavior of a 0-or-many
bundle *specified* beyond R7RS's latitude; any calling-convention change.

## Decisions

### D1 — Boxed bundle, returned as one word (no calling-convention change)

`values` returns a single `val`, as every procedure does today. For exactly one
argument that `val` *is* the argument (identity); for zero or many it is a
pointer to a distinguished **multiple-values bundle** object holding the list of
values. `call-with-values` calls the producer, then:

```
   (call-with-values producer consumer)
        │
        ▼
   r ← (producer)
        │
   %mv? r ? ─── yes ──▶ (apply consumer (%mv->list r))   ; spread
        │
        no ──────────▶ (consumer r)                       ; single value
```

This is the classic boxed-multiple-values approach. Its whole cost is one heap
object per non-unary `values`, which R7RS permits. *Alternative rejected:* a
dedicated multi-word return convention (extra return registers / an out-param
vector) — it would touch every call site and the uniform `tailcc` prototype for
a feature that is rare on the hot path.

### D2 — The bundle is a new extended-object subtype (disjoint, memory-safe)

The bundle reuses the tag-7 extended/header-object family (as strings, vectors,
bytevectors, hash tables, and records already do) with a fresh subtype tag `mv`,
carrying one field: the Scheme list of values. It is disjoint from every
user-visible type, so a real list, vector, or record returned as a *single*
value can never be misread as a bundle, and `%mv?` is an exact tag+subtype test.
The printer/`equal?`/GC treat it like any other header object (its one field is a
normal traced `val`); it is never expected to be printed or compared because it
never escapes to user code in well-formed programs.

### D3 — `values`/`call-with-values` live in `(scheme base)`, over 3 tiny prims

The user-facing procedures are ordinary prelude definitions — first-class and
shadowable for free (user-wins), exactly like `map`/`apply`. They rest on three
**fixed-arity internal primitives** (so they fit the fixed C signature rule and
need no variadic-primcall machinery):

| primitive | arity | runtime | meaning |
|-----------|-------|---------|---------|
| `%list->mv` | 1 | `rt_list_to_mv` | wrap a list as an `mv` bundle |
| `%mv?`      | 1 | `rt_mv_p`       | is this value an `mv` bundle? |
| `%mv->list` | 1 | `rt_mv_to_list` | the bundle's list of values |

```scheme
;; (scheme base)
(define (values . vs)
  (if (and (pair? vs) (null? (cdr vs)))
      (car vs)            ; exactly one value → identity (single-value code untouched)
      (%list->mv vs)))    ; zero or ≥2 values → a bundle carrying the list
(define (call-with-values producer consumer)
  (let ((r (producer)))
    (if (%mv? r)
        (apply consumer (%mv->list r))
        (consumer r))))
```

`values`'s rest-arg list *is* the bundle payload — no extra copy. `apply` already
exists and already spreads a list into a call under the `argc`/`overflow`
convention, so `call-with-values` needs no new spreading mechanism.

The `%`-helpers are internal-only (reserved in `*prims*`, not `*integrable*`):
they are never used as values and never shadowable, matching the other
`%`-internals (records, hashing, error plumbing).

### D4 — Staged bootstrap for the new primcall heads

`%list->mv`/`%mv?`/`%mv->list` are new reserved primcall heads, so the committed
seed must learn them before source can emit them — the D3 lesson from
`first-class-primitives`. Try a single direct `make regen` first; the self-host
fixed-point loop fails loudly (no convergence in 5 iters) if a synonym-first
stage is actually needed. Run the full `./run-dev-tests.sh` (incl. trust-check)
after the regen.

## Known limitation (within R7RS latitude)

A **0-or-many** bundle that reaches a **single-value continuation** (e.g.
`(+ 1 (values 2 3))` or `(define x (values))`) surfaces the opaque `mv` object as
if it were a value; the first ordinary operation on it (here `+`) traps as a type
error. R7RS says the effect of returning other than one value to a single-value
continuation is *unspecified*, so this is conforming. The common, well-defined
case — `(values x)` in single-value context — is exact (identity). A future
refinement could coerce a single-value context to take the bundle's first value
or raise a clearer error; deliberately out of scope here.

## Risks / Trade-offs

- **[Bundle leaks to user code]** if `values` were used outside a
  `call-with-values`/single-value pattern → Mitigation: the disjoint subtype
  makes leaks *fail safe* (a trap), never a silent miscompute; covered by a spec
  scenario.
- **[Bootstrap breakage mid-stage]** new primcalls → Mitigation: the standard
  regen + full dev-suite gate (D4).
- **[Allocation per `values`]** → Accepted; R7RS permits it, and it is off the
  single-value hot path (unary `values` allocates nothing).

## Migration Plan

Runtime subtype + three `rt_*` entries → reserve the three `%`-ops in
`src/parse.ss` and map them in `src/emit.ss` → `make regen` (staged if needed) →
add the `(scheme base)` definitions → regen again → full dev-tests → demos on
both backends. Rollback = revert the change's commits (additive, so nothing else
depends on it yet).
