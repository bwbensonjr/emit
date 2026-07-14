## Context

`rt_trap` is a `jmp_buf*` the REPL host sets; runtime errors (`rt_arity_error`) write
`rt_trap_msg` and `longjmp` back to the host loop, which prints `!<message>` and continues.
The standalone AOT executables leave `rt_trap` null and a trap `exit(1)`s. This is already a
one-level, non-resumable escape — exactly the shape a batch `error` wants.

## Goals / Non-Goals

**Goals:** `error` that reports and aborts; the minimum recovery needed for the compiler's
one real `guard` site; keep it expressible in the subset for self-hosting.

**Non-Goals:** R6RS conditions, `with-exception-handler`, `raise`/`raise-continuable`,
resumable exceptions, a condition hierarchy.

## Decisions

### D1: `error` = diagnose + trap

Add `rt_error` (or reuse the arity-error path): format who/message/irritants into
`rt_trap_msg` and `longjmp` via `rt_trap`. Under the REPL host the session survives and prints
the message; standalone it `exit(1)`s. Register `error` as a primitive-like form; the emitter
lowers it to the runtime call. Message formatting uses the string primitives + `number->string`
([[integer-division-number-format]]) so it stays in-language.

### D2: `guard` — minimal or eliminated

Prefer to first check (via [[decompose-core-driver]]) whether the pure core needs `guard` at
all: the REPL recovery that uses it may live in the driver, not the core. If the core needs
none, `guard` support is a driver/host concern and this change only adds `error`. If a
single-level `guard` is needed, desugar `(guard (e clause…) body…)` to installing a
`setjmp`-style catch around `body` that runs the handler on trap — a thin wrapper over the
existing hook, not a general handler stack.

## Risks / Trade-offs

- **Downgrade loses catchability** → acceptable for a batch compiler; the one interactive
  recovery site is handled by the host loop, not in-language.
- **Trap message fidelity** → irritants must format without a full writer; reuse the runtime
  value printer (`rt_write`) or a compact form.

## Migration Plan

1. Add `rt_error` + wiring; `(error 'who "msg" irritant…)` aborts with a printed diagnostic.
2. Determine (post-decomposition) whether the core needs `guard`; add the minimal form only
   if so.
3. Rebuild the host; full suite green; a demo asserting `error` aborts cleanly.

## Open Questions

- Does the pure core need any `guard`, or is all recovery in the driver/host? (Answered by
  [[decompose-core-driver]].)
- Message formatting fidelity for irritants (full printer vs compact).
