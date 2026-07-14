## Context

The runtime has no division; `number->string` needs it. The reader already parses integers
(`rd-parse-int` in the prelude), so `number->string` is its inverse and can live in the
prelude once division exists. Numbers are tagged i64 fixnums.

## Goals / Non-Goals

**Goals:** `quotient`/`remainder` primitives (truncating toward zero); base-10 signed
`number->string` in the prelude.

**Non-Goals:** bignums, `modulo`/`floor`-division variants (add only if a caller needs them),
non-decimal radices, rationals/flonums.

## Decisions

### D1: quotient/remainder as runtime primitives

Add `rt_quotient`/`rt_remainder` in `runtime.c` over the tagged i64 representation, with C
truncating division semantics (matches R7RS `quotient`/`remainder`). Register `quotient`
`remainder` in `*prims*` and add their `declare`/primcall lowering in `emit.ss` next to
`rt_add`/`rt_sub`/`rt_mul`. Division by zero traps via the existing `rt_trap` hook (like
other runtime errors).

### D2: number->string in the prelude

`(number->string n)`: handle `0` and the sign, then peel decimal digits with
`remainder`/`quotient` by 10, mapping each to a char via `integer->char (+ 48 d)`, collect
in order, and `list->string`. Inverse of the reader's `rd-parse-int`, so round-trips.

## Risks / Trade-offs

- **Most-negative fixnum** (two's-complement asymmetry) → decide and test behavior
  (negate-after-accumulate can overflow); acceptable to document a bound given fixnum range.
- **Stale REPL host** → the new rt_* must be in the host binary; the make-based rebuild
  (`fix-stale-repl-host-rebuild`) handles this automatically.

## Migration Plan

1. Add `rt_quotient`/`rt_remainder` + prim-table + emit wiring; test via a small AOT program.
2. Add `number->string` to the prelude; test round-trip against the reader.
3. Full suite green; REPL host rebuilt.

## Open Questions

- Do we also need `modulo` (floor division) anywhere? (Not in the compiler today.)
- Most-negative-fixnum handling: document a range bound, or handle exactly?
