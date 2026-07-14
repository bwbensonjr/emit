## Context

In the M1 subset, primitive names are reserved keywords: `parse-expr` checks `(prim? op)`
*before* the general application case, so `(car x)` always lowers to `(primcall car x)`. There
is no value binding named `car`, so a bare `car` in operand position (e.g. `(map car binds)`)
parses as a symbol reference and fails in `lower` as an unbound variable. `string-append` has
the additional problem that the primitive is strictly binary, so `(apply string-append list)`
(pervasive in `emit.ss`) is ill-defined regardless — this is the earlier G4.

## Goals / Non-Goals

**Goals:** make `car`, `cons`, and `string-append` usable as first-class values without slowing
direct calls; make `string-append` variadic so `apply` over it is well-defined.

**Non-Goals:** a general "every primitive is also a procedure" mechanism in the compiler
(auto-eta-expansion) — not needed; the sweep found exactly these three used as values. Prelude
wrappers are the smaller, sufficient fix.

## Decisions

### D1: Prelude eta-wrappers named after the prims

Define, in the prelude, procedures whose names equal the primitive names:

- `(define (car x) (car x))` and `(define (cons a b) (cons a b))`. The body call is
  call-position, so `(prim? …)` fires and it lowers to the primitive — no recursion, no
  overhead beyond one wrapper procedure that only value-position references reach.
- Bare `car` / `cons` (value position) resolves to the wrapper binding. Direct `(car x)` still
  primcalls. This is safe because the parser's prim check is head-only.

### D2: Variadic `string-append` folds the binary primitive

`(define (string-append . args) (fold over args with the 2-arg primcall, seeded with ""))`.
Inside the body a 2-arg `(string-append acc x)` is a primcall (binary primitive), so the
variadic procedure builds the result by repeated primitive appends. `(apply string-append lst)`
then works for any arity — closing G4. Zero args yields `""`.

## Risks / Trade-offs

- **Wrapper vs primitive confusion** → the head-only prim check guarantees direct calls keep the
  primitive; only value-position uses take the wrapper. Verified by diffing IR of direct-call
  sites before/after.
- **Recursion worry** → none: the wrapper bodies use call-position prim heads, which never
  resolve to the wrapper (prim check precedes binding lookup).
- **`string-append` associativity/empty** → folding is left-to-right and seeds with `""`, giving
  standard concatenation semantics; a single-arg call returns that string.
