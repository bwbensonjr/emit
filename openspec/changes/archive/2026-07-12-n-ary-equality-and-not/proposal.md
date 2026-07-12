## Why

`n-ary-comparisons` made the ordering/numeric operators (`= < > <= >=`) variadic but left
the identity predicates untouched: `eq?` is still binary-only, `eqv?` does not exist, and
`not` is a prelude *procedure* rather than a primitive. Real Scheme code writes
`(eq? a b c)` and treats `eqv?`/`not` as fundamental. Making the identity predicates n-ary
(reusing the comparison-chaining machinery) and promoting `not`/`eqv?` to primitives
rounds out the boolean/equality core with a small, well-scoped change.

## What Changes

- Make `eq?` and `eqv?` accept any number of arguments as **chained** identity
  comparisons — `(eq? a b c …)` ⇒ `(eq? a b) ∧ (eq? b c) ∧ …`, single-evaluation and
  left-to-right — by extending the existing `expand-compare` pass that already chains
  `= < > <= >=`. Fewer than two arguments compare `#t`.
- Add **`eqv?`** as a runtime primitive `rt_eqv_p`. Its body is `a == b` — identical to
  `rt_eq_p` today, but a semantically distinct entry point. It holds on fixnums (immediate)
  and interned symbols. **It does not yet distinguish characters by value** — chars are
  boxed `{ HDR_CHAR, codepoint }` objects and are not interned, so `(eqv? #\a #\a)` is `#f`
  today, exactly as `eq?` is. Correct `eqv?`-on-chars (and divergence from `eq?` on
  numbers) is a follow-on that requires char interning / immediates.
- Promote **`not`** to a runtime primitive `rt_not` (`truthy(x == FALSE_V)`, matching the
  current `(if x #f #t)` semantics), add it to the reserved primitive set, and **remove
  the `(define (not x) …)` from the prelude**. `not` is unary — no chaining.
- **BREAKING (minor):** `not`, `eqv?`, and `eq?` become reserved primitive names (not
  rebindable), consistent with the other primitives in the M1 subset. `not` is no longer a
  first-class procedure value (it cannot be passed to `apply`/`map`), same as `eq?`/`+`.

## Capabilities

### New Capabilities
<!-- None: eqv?/not are primitives in the existing core-language; eq?/eqv? chaining reuses expand-compare. -->

### Modified Capabilities
- `core-language`: add a requirement that the identity predicates `eq?` and `eqv?` accept
  any number of arguments as single-evaluation chained comparisons, that `eqv?` is a
  primitive (currently pointer/immediate equality), and that `not` is a boolean-negation
  primitive.

## Impact

- **Runtime:** `src/runtime/runtime.c` — add `rt_eqv_p` and `rt_not`.
- **Emitter:** `src/emit.ss` — add `(eqv? "rt_eqv_p")` and `(not "rt_not")` to `prim-table`
  plus their `declare` lines.
- **Frontend:** `src/parse.ss` — add `eqv?` and `not` to `*prims*` (`eq?` already present);
  `src/passes/expand.ss` — add `eq?` / `eqv?` to `expand-compare`'s dispatch and pairwise
  reduction.
- **Prelude:** `src/prelude.scm` — remove the `not` definition (now a primitive).
- **Demos:** a new demo plus entries in `demos/run-tests.sh` / `demos/run-backends.sh`;
  `demos/string-unicode.scm` already uses `(not …)` and exercises the promoted primitive.
- **Unaffected:** the calling convention, the other passes, and the existing binary
  `eq?` / `rt_eq_p` behavior (chaining reduces to the same binary primcalls).
