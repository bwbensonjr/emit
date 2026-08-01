## Context

The compiler is direct-style: calls are native `fastcc` calls on the C stack, closures are heap
objects, and two optimizations depend on a call being an ordinary call — self-calls (`self-app`) and
cross-unit direct calls to a library's code label. Binary size and "simple, easy-to-understand
control flow" are stated design goals.

The one non-local control mechanism that exists is the guard stack:

```c
#define RT_GUARD_MAX 256
static jmp_buf rt_guard_env[RT_GUARD_MAX];
static val     rt_guard_raised[RT_GUARD_MAX];
static int     rt_guard_depth = 0;
```

`rt_run_guarded(fn, thunk)` pushes a frame, `setjmp`s, and calls the thunk through the module's
`@__apply0` `ccc` trampoline; `rt_raise` `longjmp`s to the nearest frame. The runtime states the
scope of this deliberately: "guard is only an upward, one-shot escape, so setjmp/longjmp suffices
(no call/cc)."

Two facts found while sizing this, both of which matter later:

- **The calling convention holds no stack-interior pointers.** Overflow arguments are allocated with
  `rt_alloc_words` (GC heap), not `alloca`, and closures are heap objects. So a future stack-copying
  implementation would not have to relocate pointers into the stack — the usual killer.
- **`longjmp` cannot run intervening thunks.** This is the constraint that shapes D4: once
  `dynamic-wind` exists, a raise or escape crossing one must run its `after`, and a `longjmp` skips
  everything between.

## Goals / Non-Goals

**Goals:**

- Escape continuations, `dynamic-wind`, and parameter objects, sufficient for library code — in
  particular the I/O library — to be written the way R7RS expects.
- Misuse of the restricted continuation is a **diagnostic, not undefined behaviour**.
- `guard` / `raise` keep their current specified behaviour while gaining the obligation to run
  `after` thunks they cross.
- No change to the direct-call optimizations or to the calling convention.

**Non-Goals:**

- **Re-entrant (multi-shot, or upward-then-downward) continuations**, and therefore generators,
  coroutines, and backtracking. This is the significant restriction; D1 is the argument.
- **`call-with-values` / `values` reform, `with-exception-handler`, or exception-handler stacks
  beyond what `guard` already provides.**
- Raising `RT_GUARD_MAX`, or making the frame stack growable. 256 nested extents is far past what
  any current program uses; it becomes a shared limit and stays a `rt_fatal`.

## Decisions

### D1 — Escape continuations only, with out-of-extent invocation raising

Full `call/cc` requires the implementation to be able to resume a continuation after its frame has
returned. In a direct-style native-stack compiler there are two ways:

- **CPS-convert the whole program.** Every call becomes a tail call to a heap-allocated
  continuation. This is the general solution and it is the wrong trade here: it eliminates the
  ordinary call, which is exactly what `self-app` and the cross-unit direct-call lowering optimize;
  it inflates code size, against a stated goal; and it replaces straightforward control flow with a
  transformed program, against another. The compiler is self-hosting, so it would pay these costs on
  itself as well.
- **Copy the stack** on capture and restore it on invoke. More surgical, and the two facts above make
  it more feasible here than usual — the calling convention holds no stack-interior pointers. It
  still needs the collector to scan saved stack copies, careful capture of callee-saved registers,
  and platform care. It is a real option, and it is a *separate* change.

**Decision: provide escape continuations now.** A `call/cc` frame is a `setjmp` frame; invoking the
continuation `longjmp`s to it with a value. This covers early exit, non-local return from a fold or
loop, and — the reason it is on the critical path — everything `dynamic-wind` and `parameterize`
need.

**Out-of-extent invocation must be loud.** Longjmping to a frame whose function has returned is
undefined behaviour, and the resulting corruption would be attributed to anything but the
continuation. Each frame therefore carries a **generation id**, monotonically increasing; the
continuation object holds `(index, id)`; invoking checks that the frame at `index` is still live and
still carries `id`, and raises `continuation invoked outside its extent` otherwise. That check is
what makes this an incomplete implementation rather than an unsound one.

### D2 — `dynamic-wind` keeps a wind list even though nothing re-enters yet

With escape-only continuations, `dynamic-wind` is unwind-protect: `before`, body, `after` on every
exit. That can be written with no data structure at all — just run `after` on the normal and the
escaping path.

**Decision: maintain the wind list anyway** — a Scheme-side stack of `(before . after)` pairs with
the current depth. Two reasons:

1. **Unwinding needs it regardless.** An escape does not unwind one frame; it unwinds from the
   current wind depth down to the *target's* depth, running each `after` in order. That is a
   traversal of exactly this list (D4).
2. **It is the structure full `call/cc` needs.** Re-entry adds running `before` thunks on the way
   back down. Building the list now means the later change adds a traversal rather than redesigning
   `dynamic-wind`. The cost today is a pair per active extent.

### D3 — Parameters are `dynamic-wind` plus a box, which is why they belong in this change

`make-parameter` returns a closure over a box, with the optional converter applied to the initial
value and to each new binding. R7RS specifies the object as *callable with zero arguments returning
its value* — so a parameter is indistinguishable from a plain accessor at the call site, which is
what makes the I/O library's `current-output-port` upgrade source-compatible.

`parameterize` is a `syntax-rules` macro expanding to a `dynamic-wind` whose `before` installs the
converted new value and whose `after` restores the old one. This is the R7RS reference
implementation, and it is the concrete reason the three constructs ship together: parameters are
nearly free once D2 exists, and nearly impossible to get right without it.

### D4 — The wind list is Scheme-side, and unwinding happens *before* the `longjmp`

This is the correctness crux, and the thing most likely to be got wrong.

`longjmp` transfers control directly to the `setjmp` point. It cannot run the `after` thunks of the
`dynamic-wind`s it jumps over — by the time the catcher regains control, those frames are gone.

**Decision:** keep the wind list in Scheme, and make *escaping* a two-step operation performed by
the escaping side:

1. Walk the wind list from the current depth down to the target frame's depth, running each `after`
   thunk in order, in Scheme, on the still-live stack.
2. Only then invoke the primitive that `longjmp`s.

The same applies to `raise`: it must unwind before transferring, which is why `guard` and `raise`
move onto this machinery rather than sitting beside it. Two separate escape paths that each maintain
their own idea of the wind depth would be a defect generator.

*Alternative considered.* Keep the wind stack in C and have `rt_raise` call back into Scheme to run
each `after`. Rejected: it puts Scheme calls in the middle of the runtime's error path, where a
raise from within an `after` thunk becomes re-entrant in the worst place. Doing it in Scheme keeps
the runtime's job to "transfer control", which is all `longjmp` is good for.

### D5 — It is named `call/cc`, and the restriction is stated where a user meets it

Two honest options: provide `call-with-escape-continuation` under its own name, or provide
`call/cc` that works for escape uses and raises on re-entry.

**Decision: the standard name.** The majority of real `call/cc` uses are escapes, and under the
standard name they work unmodified — a program written against R7RS runs. The cases that do not work
raise a specific diagnostic naming the reason, which follows this project's consistent preference for
a loud failure over a silent wrong answer.

What this buys is conditional on D1's check actually firing, so that is a test, not an assertion.
The restriction is recorded in the capability's spec text and in the R7RS conformance notes — not
only in this design.

## Risks / Trade-offs

- **An escape that skips an `after` thunk** → the defect this design exists to prevent (D4).
  Mitigation: `guard`/`raise` and continuation invocation share one unwinding path, and the tests
  cover a raise crossing a `dynamic-wind`, an escape crossing one, and nested winds unwound in the
  right order.
- **An `after` thunk that itself raises or escapes** → undefined in the obvious implementation, and a
  real possibility once cleanup code exists. Needs a stated rule and a test, not silence.
- **The out-of-extent check has a false negative** if a frame index is reused by a *new* frame with a
  recycled id → the id is monotonically increasing and never reused, which is the whole point;
  verify the counter's width is not a practical wraparound risk.
- **`(scheme base)` grows**, so every delivered binary does (same concern the I/O library carries).
  Measure `hello.scm` before and after; the tree-shake should keep an unused `dynamic-wind` out.
- **Claiming `call/cc` invites programs that need the real thing** → they get a diagnostic naming the
  restriction, which is the best available outcome short of implementing it.
- **`RT_GUARD_MAX` is now shared** between `guard` and continuations, so deep nesting of one reduces
  headroom for the other. 256 is far past current use; it stays a hard error, not silent truncation.

## Migration Plan

Additive for programs. The one behavioural change — a raise crossing a `dynamic-wind` runs its
`after` — cannot affect existing code, because `dynamic-wind` does not exist yet.

`scheme-io-library` is revised rather than re-proposed once this lands: its D4 is superseded, its
`current-*-port` become parameters, and `with-output-to-file` / `with-input-from-file` move from
Non-Goals into scope.

## Open Questions

- **What should an `after` thunk that raises do?** R7RS is not prescriptive. Candidates: let it
  propagate (abandoning the remaining unwinding), or run the remaining `after`s first and then
  propagate. Decide when writing the spec scenarios; either way it must be specified rather than
  emergent.
- **Should `guard`'s reraise re-run winds?** A `guard` whose clause does not match reraises; that
  second raise starts from the handler's wind depth, not the original raise point. Confirm the
  resulting order matches R7RS.
- **Does the full-`call/cc` follow-up want stack copying or CPS?** The two facts in Context lean
  toward stack copying being viable here, which is worth recording now while the evidence is fresh,
  even though the change is not scheduled.
