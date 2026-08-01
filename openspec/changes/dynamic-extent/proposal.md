## Why

This is **rung 3 of the `call/cc` staircase** already mapped in
`openspec/explorations/continuations-and-control.md`: escape continuations plus unwind-only
`dynamic-wind`, described there as covering "the dominant real-world `call/cc` pattern (non-local
exit)". Rung 1 (multiple values) has shipped. Rung 4 (full re-entrant `call/cc`) is the one hard rung
and stays deferred; this change does not touch that fork.

R7RS conformance is a project goal, and three of its core control constructs are absent:
`call-with-current-continuation`, `dynamic-wind`, and parameter objects
(`make-parameter` / `parameterize`). A program cannot escape from a loop, cannot guarantee cleanup
on a non-local exit, and cannot bind a value for the dynamic extent of a call.

They are being done **now, ahead of the I/O library** (`scheme-io-library`, on hold), because library
code should be written against them rather than around them. Without parameter objects the I/O
library would have to ship `current-output-port` as a plain procedure and omit
`with-output-to-file`; without `dynamic-wind` it could not guarantee a port is closed when its body
escapes. Both are cheap to fill first and awkward to retrofit into library code already written.

The substrate is already there and already proven: `guard`/`raise` push a `setjmp` frame onto
`rt_guard_env` and `longjmp` to it, and the runtime notes this is "only an upward, one-shot escape,
so setjmp/longjmp suffices (no call/cc)". An escape continuation is that same frame, handed to the
program as a procedure.

**Rung 2 is not shipped, and this change settles its design question rather than working around it.**
The exploration leaves open: *"Handler stack vs. guard stack — one unified dynamic stack of 'what to
do on raise,' or two cooperating stacks? Decide against how `guard` (unwinding) and
`with-exception-handler` (non-unwinding) must interleave."* Rung 3 cannot avoid answering it,
because `guard` must now cooperate with `dynamic-wind`. Design D4 answers it — one handler stack,
with `guard` expressed as a handler that escapes — and this change builds that stack. Rung 2 then
becomes "expose two procedures over a stack that already exists," with no rework of the wind
machinery.

## What Changes

- **`call-with-current-continuation` / `call/cc`**, providing **escape (upward, one-shot)**
  continuations. A continuation invoked within the dynamic extent of its capture escapes to that
  point with the given value. A continuation invoked **outside** its extent — re-entry, which
  escape continuations cannot do — SHALL raise a diagnostic rather than resume a dead frame.
  **This is deliberately not full R7RS `call/cc`**; see design D1 for why, and D5 for why it still
  carries the standard name.
- **`dynamic-wind`**, running `before` on entry and `after` on every exit — normal return, an
  escape, or a raise crossing it.
- **Parameter objects**: `make-parameter` (with the optional converter) and `parameterize`. A
  parameter object is callable with zero arguments and returns its current value, exactly as R7RS
  specifies, so it is indistinguishable from a plain accessor procedure at the call site.
- **A dynamic handler stack**, and `guard` re-expressed over it the way R7RS itself specifies —
  a handler that captures the guard's continuation and escapes to it. Today `rt_raise` longjmps
  directly, which would skip the `after` thunk of any `dynamic-wind` it crosses. The stack is
  internal in this change; rung 2 exposes `with-exception-handler` and `raise-continuable` over it.
- The wind list lives **in Scheme**, and unwinding runs **before** the `longjmp`, not after — a
  `longjmp` cannot run intervening thunks (design D4).

**BREAKING (behavioural, in the safe direction):** a `raise` that crosses a `dynamic-wind` now runs
its `after` thunk before the handler sees it. No existing program can depend on the old behaviour,
because `dynamic-wind` does not exist yet.

## Capabilities

### New Capabilities

- `dynamic-extent`: escape continuations, `dynamic-wind`, and parameter objects — the three R7RS
  constructs governing what happens as control enters and leaves a dynamic extent, plus the
  interaction between them and the existing `guard` / `raise`.

### Modified Capabilities

(none — `guard` and `raise` keep their specified behaviour; only their implementation moves onto the
shared wind/escape machinery, and the new obligation to run `after` thunks is stated in the new
capability.)

## Impact

- `src/runtime/runtime.c` — generalize the `rt_guard_env` frame stack to serve escape continuations
  as well as `guard`: a frame gains a generation id so an out-of-extent invocation is detectable, and
  the escape payload carries a value as well as a raised object. `RT_GUARD_MAX` becomes a shared
  nesting limit.
- `src/parse.ss` / `src/emit.ss` — the new primitives and their runtime mapping.
- `src/prelude.scm` → `lib/scheme/base.sld` — `call/cc`, `dynamic-wind`, `make-parameter`, the
  `parameterize` macro, and `guard` re-expressed over the wind list. Regenerated via
  `tools/gen-scheme-base.ss`.
- `bootstrap/*.ll` — regenerated; `(scheme base)` grows, so binary size is a review criterion, as it
  will be for the I/O library.
- `openspec/changes/scheme-io-library` — its design D4 ("`current-output-port` is a procedure, not a
  parameter") is superseded once this lands; that change is revised, not archived, before it is
  applied.
- **Explicitly NOT in scope:** re-entrant/multi-shot continuations, and therefore generators,
  coroutines, and backtracking. Recorded as a follow-up with its design analysis (design D1).
