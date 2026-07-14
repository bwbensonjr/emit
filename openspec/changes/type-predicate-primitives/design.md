## Context

Runtime values are tagged (the existing `pair?`, `null?`, `vector?` primitives inspect those
tags via `rt_pair_p` etc., listed in `prim-table` and declared in `rt-declarations`). The core
needs six more predicates that the language does not yet expose. Because they inspect the
runtime representation, they cannot be prelude procedures — they must be primitives with C
runtime support, exactly like the predicates already present.

## Goals / Non-Goals

**Goals:** add `symbol?`, `string?`, `char?`, `boolean?`, `integer?`, `exact?` as primitives
with `rt_*_p` runtime functions and the usual registration, returning the boolean scheme
values.

**Non-Goals:** a general numeric tower (`rational?`/`real?`/`complex?`), `procedure?`, or
`number?` beyond what the core needs — add those only when a real use appears. The sweep found
exactly these six.

## Decisions

### D1: Mirror the existing predicate primitives

For each predicate add: an `rt_<name>_p(i64) -> i64` in `runtime.c` returning the scheme `#t`/
`#f` encoding, a `*prims*` entry in `parse.ss`, a `prim-table` mapping in `emit.ss`, and an
`rt-declarations` line. `symbol?`/`string?`/`char?` compare the object's tag; `boolean?` is
true iff the value is the `#t` or `#f` encoding.

### D2: `integer?` and `exact?` on the fixnum-only subset

The subset has one number type (fixnums). Both `integer?` and `exact?` are therefore true for
any number value and false otherwise; implement each as the fixnum tag check. They are kept as
separate names (not one aliased to the other) so that when the number representation grows, only
the runtime body changes, not every call site or the language surface.

## Risks / Trade-offs

- **`integer?`/`exact?` coincidence** → intentional and documented; correct for the current
  subset and forward-compatible in name.
- **Runtime/host drift** → the REPL host links a runtime snapshot, so it must be rebuilt after
  adding the `rt_*_p` functions (the Makefile graph already forces this on runtime change).
- **Tag encoding mistakes** → covered by direct predicate tests (true and false cases for each
  type) in verification.
