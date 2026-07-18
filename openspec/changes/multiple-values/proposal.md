## Why

Emit has no multiple values. `values` and `call-with-values` are core R7RS-small
bindings, and they are the foundation for `let-values`, `define-values`,
`receive`, and idioms like `(call-with-values (lambda () (floor/ a b)) list)`.
They are also the first, cheapest rung of the control-features staircase (see
`openspec/explorations/continuations-and-control.md`): the README groups
`values` with `dynamic-wind` and the resumable exception system as "needs
`call/cc`," but multiple values need **no continuation capture at all** — only a
distinguished return bundle and a spread at the consumer. This change delivers
real R7RS breadth with zero change to the calling convention and none of the
`call/cc` machinery.

## What Changes

- Add `values` — a variadic library procedure. `(values x)` returns `x`
  unchanged (the single-value identity, so ordinary code is untouched);
  `(values)` and `(values a b …)` return a distinguished **multiple-values
  bundle** carrying the argument list.
- Add `call-with-values` — a library procedure `(call-with-values producer
  consumer)` that calls `producer` with no arguments and applies `consumer` to
  the values it produced: a bundle is spread into `consumer`'s arguments (via the
  existing `apply`), and any other single result is passed as one argument.
- Represent the bundle as a **new extended-object subtype** in the runtime
  (tag-7 header family, like records / hash tables / strings), disjoint from
  every user-visible type so it can never be confused with a legitimate
  single return value. Back it with three fixed-arity internal primitives —
  `%list->mv` (wrap a list), `%mv?` (predicate), `%mv->list` (unwrap) — reserved
  in `*prims*`, never user-facing.
- Define `values` and `call-with-values` in `(scheme base)` on top of those
  primitives plus the existing `apply`. They are ordinary, shadowable prelude
  procedures (user-wins); they are not compiler intrinsics.
- Add demos (`demos/values.scm`, `demos/call-with-values.scm`) and wire them into
  the `demos/run-tests.sh` value harness on both backends (`scheme-run` / `aot`).

Non-goals (deferred): `let-values` / `define-values` / `receive` (trivial
`syntax-rules` macros over `call-with-values` — a small follow-on, tracked in the
exploration note's open questions); a zero-allocation multiple-values return
convention (the boxed bundle is allocation-per-`values`, which R7RS permits);
and the *unspecified* single-value-context behavior of a 0-or-many bundle
(see the design's known limitation) — no `call/cc`, no dynamic-wind, no
exception-system work (those are later rungs of the staircase).

## Capabilities

### New Capabilities
<!-- None — this extends the existing core-language surface. -->

### Modified Capabilities
- `core-language`: add requirements for `values` and `call-with-values`, their
  interaction (`values` produces, `call-with-values` consumes), the
  single-value identity of `(values x)`, and the disjoint, memory-safe bundle
  representation.

## Impact

- **Code**: `src/runtime/runtime.c` (the mv extended-object subtype +
  `rt_list_to_mv` / `rt_mv_p` / `rt_mv_to_list`); `src/parse.ss` (`*prims*` gains
  `%list->mv %mv? %mv->list`); `src/emit.ss` (prim→runtime table + LLVM extern
  declarations); `src/prelude.scm` (the `(scheme base)` definitions of `values`
  and `call-with-values`).
- **Bootstrap**: the three new `%`-primcall heads are reserved ops, so the
  committed seed must learn them — a staged regen per the D3 lesson recorded in
  `first-class-primitives` (try one direct `make regen`; the fixed-point loop
  fails loudly if a synonym stage is needed).
- **Backends**: both `scheme-run` and `aot` must produce byte-identical output;
  the regen fixed point and byte-identical-backends invariants must still hold.
- **Docs**: update the README "Not yet done" control bullet (and the "Accomplished"
  language list) once shipped; note `values`/`call-with-values` no longer belong
  under "needs `call/cc`."
- **Compatibility**: additive. `values` and `call-with-values` are currently
  unbound; they become `(scheme base)` procedures (so `--no-prelude` still lacks
  them, consistent with `list`/`map`). The `%`-helpers are new reserved names but
  internal-only.
