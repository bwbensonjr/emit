## Why

`emit.ss` builds all IR text with `string-append` + `number->string` (~34 uses of
`number->string`), but scheme-llvm has no `number->string` and no integer division — the
arithmetic primitives are only `+ - * = <`. Without these the emitter can't run in-language,
so this is a required self-hosting step (roadmap step 2). `number->string` needs integer
division (`quotient`/`remainder`) to peel decimal digits.

## What Changes

- Add **`quotient`** and **`remainder`** as runtime primitives (`rt_quotient`,
  `rt_remainder`) with truncating-toward-zero semantics (R7RS `quotient`/`remainder`), and
  register them in the primitive table.
- Implement **`number->string`** (base-10, signed integers) in `src/prelude.scm` over digit
  math (`quotient`/`remainder` + `integer->char`/`list->string`), matching the reader's
  existing integer parsing as its inverse.

## Capabilities

### New Capabilities
<!-- none -->

### Modified Capabilities
- `core-language`: Add `quotient` and `remainder` integer-division primitives and the
  `number->string` prelude procedure (decimal, signed integers).

## Impact

- **Code**: `src/runtime/runtime.c` (`rt_quotient`/`rt_remainder`), `src/parse.ss` (prim
  table), `src/emit.ss` (rt declarations + primcall lowering), `src/prelude.scm`
  (`number->string`). Rebuild the REPL host (its runtime snapshot) — covered by
  `2026-07-13-fix-stale-repl-host-rebuild`.
- **Enables**: the emitter to run in-language (self-hosting); also generally useful.
- **Independent** of the core/driver split, but on the critical path for compiling `emit.ss`
  with scheme-llvm.
