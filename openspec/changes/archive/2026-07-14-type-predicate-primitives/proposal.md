## Why

The gap sweep ([[self-host-gap-sweep]]) found gap **G9**: the compiler core dispatches on value
type throughout — `parse-expr`'s literal/self-evaluating cases and the `param-*`/`rename`
helpers use `symbol?`, `string?`, `char?`, `boolean?`, `integer?`, and `exact?` — but the
language provides only `pair?`, `null?`, and `vector?` as type predicates. The other six are
unbound, so the assembled core cannot compile. Each needs a runtime tag check; they cannot be
defined in the prelude.

## What Changes

- Add six type-predicate **primitives** with runtime tag checks, mirroring the existing
  `pair?`/`null?`/`vector?`: `symbol?`, `string?`, `char?`, `boolean?`, `integer?`, and
  `exact?`.
  - `symbol?`, `string?`, `char?` test the corresponding runtime object tags.
  - `boolean?` is true for `#t`/`#f`.
  - `integer?` / `exact?` are true for the fixnum representation (the only number type in the
    subset), so both hold exactly for integers; they are provided as distinct names for R7RS
    compatibility even though they coincide here.
- Register each like the existing predicate prims (`*prims*` + `prim-table` +
  `rt-declarations`), with an `rt_*_p` runtime function each.

## Capabilities

### New Capabilities
<!-- none -->

### Modified Capabilities
- `core-language`: add the type predicates `symbol?`, `string?`, `char?`, `boolean?`,
  `integer?`, and `exact?`, each returning `#t`/`#f` by inspecting the runtime type tag,
  completing the set of predicates the compiler core relies on.

## Impact

- **Code**: `src/runtime/runtime.c` (six `rt_*_p` functions over the type tags), `src/parse.ss`
  (`*prims*`), `src/emit.ss` (`prim-table` + `rt-declarations`), and the REPL host runtime
  rebuild.
- **Depends on**: nothing; unblocks [[self-hosting-bootstrap]] (the core's type dispatch).
- **Note**: `integer?`/`exact?` coincide in the current fixnum-only subset; keeping both names
  avoids a future rename when other number types arrive.
