## Why

The gap sweep ([[self-host-gap-sweep]]) found gap **G8** (which subsumes the earlier **G4**):
primitives are reserved keywords, not first-class values, so passing one to a higher-order
procedure leaves a bare, unbound reference. The core does this pervasively — `(map car binds)`,
`(map cons xs new)`, and, throughout `emit.ss`, `(apply string-append <list>)`. A bare `car` /
`cons` / `string-append` in operand position is compiled as an unbound variable, so the
assembled core will not compile until these prims are available as values.

## What Changes

- Add **prelude procedures that eta-expand the primitives used as values**, named after the
  prims so bare references resolve to them:
  - `(define (car x) (car x))`, `(define (cons a b) (cons a b))` — a 2-arg call inside the body
    is still a fast primcall, so call sites keep the primitive and only value-position
    references pick up the wrapper.
  - A **variadic `string-append`** — `(define (string-append . args) …)` — that folds the
    binary `string-append` primitive over its arguments (a 2-arg call in its body stays a
    primcall). This closes G4: `(apply string-append list)` now works for any arity.
- Only `car`, `cons`, and `string-append` are needed by the current core (the sweep's
  free-variable analysis found no other prim used as a value); the mechanism generalizes if more
  are needed later.

## Capabilities

### New Capabilities
<!-- none -->

### Modified Capabilities
- `core-language`: primitives that the standard library exposes (`car`, `cons`, `string-append`)
  are usable as first-class values — passable to `map`/`apply`/`fold` — via prelude wrapper
  procedures, while direct calls continue to compile to the primitive. `string-append` becomes
  variadic (any number of string arguments), so `(apply string-append …)` is well-defined.

## Impact

- **Code**: `src/prelude.scm` (wrappers for `car`, `cons`; variadic `string-append`). No
  compiler-source change — the parser already prefers a primcall for a call-position prim, so
  the wrappers only affect value-position references.
- **Depends on**: variadic-lambda/`apply` support (already present). Unblocks
  [[self-hosting-bootstrap]] (the `(map car …)` and `(apply string-append …)` sites) and
  supersedes the standalone G4 item.
- **Note**: user-wins prelude shadowing is unaffected; a program that itself defines `car`
  still shadows the wrapper.
