## Why

The compiler calls `error` for compile-time failures (bad expression, arity over max, etc.)
and uses R6RS `guard` for recovery. scheme-llvm has neither. But the need is modest: after
the `,x` matcher took over its own `(guard …)` clause syntax, the compiler has essentially
**one** real R6RS `guard` site (REPL error recovery), and `error` is used to abort with a
message. A full condition system is overkill; a batch compiler only needs "print a
diagnostic and abort" (roadmap step 4, "downgrade"). The runtime already has the `rt_trap`
longjmp hook built for the REPL host.

## What Changes

- Add **`error`** to the language: print a diagnostic (who + message + irritants) and abort
  the current computation via the existing `rt_trap` mechanism (the same escape used for
  arity/other runtime traps), rather than a general raise.
- Provide a **minimal `guard`** sufficient for the compiler's recovery site — a single-level
  catch that runs a handler body when the guarded expression aborts (backed by `rt_trap`),
  or, if that proves awkward, refactor the one site to not need catchable exceptions.
- Explicitly defer a general R6RS condition/exception system.

## Capabilities

### New Capabilities
<!-- none -->

### Modified Capabilities
- `core-language`: Add `error` (diagnose + abort via the runtime trap hook) and a minimal
  single-level `guard`/recovery form; a general condition system is out of scope.

## Impact

- **Code**: `src/runtime/runtime.c` (an `error` entry using `rt_trap` + a message buffer,
  like `rt_arity_error`), prim/keyword tables, `src/emit.ss`, expander (`guard` desugar if
  kept). Rebuild the REPL host.
- **Depends on**: nothing hard; benefits from [[decompose-core-driver]] to know whether the
  core even needs `guard` (it may not — the REPL recovery lives in the driver).
- **Design note**: whether the pure core needs any `guard` at all is an open question the
  decomposition answers.
