## Why

`n-ary-arithmetic` made `+ - *` variadic but explicitly deferred the comparison
operators. Today the compiler has only two binary comparison primitives — `=` and `<` —
and no `>`, `<=`, or `>=` at all. Real Scheme code (and the compiler's own source) writes
`(< 0 i n)`, `(<= 1 x 10)`, and `(= a b c)` constantly; without n-ary comparisons these
must be hand-expanded into nested `and`s with manually bound temporaries. This is the
small, frontend-only follow-on the arithmetic change named.

## What Changes

- Extend the existing `expand` pass so the comparison operators accept any number of
  arguments as **chained** (pairwise) comparisons: `(< a b c …)` ⇒ `a<b ∧ b<c ∧ …`,
  and likewise for `=`, `>`, `<=`, `>=`.
- Add `>`, `<=`, `>=` to the language as **frontend-derived** forms — they reduce to the
  existing `<` and `=` primitives (`(> x y)` ⇒ `(< y x)`; `(<= x y)` ⇒
  `(or (< x y) (= x y))`; `(>= x y)` ⇒ `(or (< y x) (= x y))`). No new runtime function,
  ABI, or backend change.
- Each operand is evaluated **exactly once** by binding it to a fresh temp before chaining
  (the single-evaluation requirement the arithmetic fold didn't need — the same technique
  `or` already uses). This preserves left-to-right evaluation order.
- Arity edge cases: `(op)` and `(op a)` evaluate to `#t` (a comparison of fewer than two
  values is vacuously true), matching the trivial-chain result.

## Capabilities

### New Capabilities
<!-- None: comparisons expand into the existing binary `<` / `=` primitives. -->

### Modified Capabilities
- `core-language`: add a requirement that the comparison operators `= < > <= >=` accept
  any number of arguments as single-evaluation chained comparisons, with `> <= >=` derived
  in the frontend from `<` and `=`, and no runtime/ABI change.

## Impact

- **Code (frontend only):** `src/passes/expand.ss` — add comparison chaining alongside the
  n-ary arithmetic fold and the other derived-form rewrites; a new demo plus entries in
  `demos/run-tests.sh` / `demos/run-backends.sh`.
- **One emitter correctness fix (discovered during implementation):** chained comparisons
  are the first construct to place a nested `if` in a *value* arm, which exposed a latent
  bug in `ev-if` (`src/emit.ss`) — the `phi` recorded the arm-entry block instead of the
  block the arm ends in (Chez evaluates the parallel `let` capturing `current-bb`
  right-to-left). Fixed by sequencing the capture with `let*`. No runtime/ABI change.
- **Unaffected:** `src/runtime/runtime.c`, the calling convention, `parse.ss` `*prims*`
  (`> <= >=` never reach `parse`), and all other passes — the emitted output is the
  existing binary `<` / `=` primcalls and `if`/`let` core forms.
- **Relationship to `n-ary-arithmetic`:** the direct, deferred follow-on. Arithmetic
  needed no temps (operands flow straight into the binary calls); comparisons chain a
  middle operand into two tests, so they bind temps like `or`.
