## Prior art — read first

This change is **rung 3** of the staircase in
`openspec/explorations/continuations-and-control.md`, which is the authority for anything about the
continuation design space; `LLVM.md` §"First-class continuations (`call/cc`)" carries the same
conclusion in short form. Neither is restated here. What that exploration already establishes, and
this design simply relies on:

- The four rungs, and that **rungs 1–3 need none of rung 4's machinery**. Rung 1 (multiple values)
  shipped; rung 2 (`with-exception-handler` / `raise-continuable`) has not; this is rung 3.
- That rung 4's mechanism is **an open decision, not a foregone conclusion** — backed by a cited,
  twice-adversarially-verified research pass. LLVM coroutines are intrinsically one-shot; there is no
  landed stock-LLVM stack-switching primitive; Farvardin & Reppy (PLDI 2020) is the map; and Effekt
  (ICFP 2025) is a **verified existence proof** that route (B), own-your-stack with
  copy-on-multishot, works efficiently on a real LLVM backend while preserving direct style.
- That rung 3's escape machinery is a stepping-stone under either rung-4 route, not a throwaway,
  "since escape semantics remain a correct fast path under CPS too."

**One thing this change contributes back** to that exploration, found while sizing the work and not
recorded there: **the calling convention holds no stack-interior pointers.** Overflow arguments are
allocated with `rt_alloc_words` (GC heap) rather than `alloca`, and closures are heap objects. The
usual obstacle to route (B) — relocating pointers that point into the stack being copied — is
therefore absent here. That is evidence for (B), and it is fed back into the exploration as a task.

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

The constraint that shapes D4: **`longjmp` cannot run intervening thunks.** Once `dynamic-wind`
exists, a raise or escape crossing one must run its `after`, and a `longjmp` skips everything
between. (The other fact found while sizing this — that the calling convention holds no
stack-interior pointers — bears on rung 4, not on this change; see Prior art.)

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
- **Rung 2's user-facing surface** — `with-exception-handler` and `raise-continuable`. The handler
  stack they need is *built* here, because `guard` requires it (D4); only the two procedures are
  deferred, and exposing them needs no further design.
- Raising `RT_GUARD_MAX`, or making the frame stack growable. 256 nested extents is far past what
  any current program uses; it becomes a shared limit and stays a `rt_fatal`.

## Decisions

### D1 — Escape continuations only: taking rung 3, not opening rung 4

**Decision: implement the staircase's rung 3 as specified there, and do not touch the rung-4 fork.**
A `call/cc` frame is a `setjmp` frame; invoking the continuation `longjmp`s to it with a value. This
covers early exit, non-local return from a fold or loop, and — the reason it is on the critical path
— everything `dynamic-wind` and `parameterize` need.

The CPS-versus-own-your-stack argument is **not re-litigated here**; it is settled as deferred by the
exploration, whose research pass is far better sourced than anything this change would produce. The
relevant conclusion is only that rungs 1–3 require none of it, and that this rung's machinery
survives either eventual answer.

What this change adds to that decision is the safety property below, which the exploration does not
specify because it is an implementation concern rather than a roadmap one.

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

### D4 — One handler stack; `guard` is a handler that escapes. Unwinding happens *before* the `longjmp`

This answers the exploration's open question — *"one unified dynamic stack of 'what to do on raise,'
or two cooperating stacks?"* — which rung 3 cannot dodge, because `guard` must now cooperate with
`dynamic-wind`.

Two facts force the shape:

1. **`longjmp` cannot run intervening thunks.** It transfers straight to the `setjmp` point, so the
   `after` thunk of any `dynamic-wind` it jumps over is skipped. Today's `rt_raise` longjmps
   directly, which is correct only because `dynamic-wind` does not exist.
2. **`guard` unwinds and `with-exception-handler` (rung 2) does not.** A handler installed by
   `with-exception-handler` runs *at the raise point*, on top of the raising computation, and for
   `raise-continuable` its return value flows back there. A `guard` clause runs *after* unwinding to
   the guard's frame.

**Decision: one handler stack, and `guard` is not a primitive mechanism — it is a handler that
escapes.** This is R7RS's own formulation, and it dissolves the "one stack or two" question: the
non-unwinding case is the *base* case, and unwinding is what a particular handler chooses to do.

Three structures, each with exactly one job:

| structure | lives in | job |
|---|---|---|
| escape frame stack | C (`rt_guard_env` generalized, + generation ids) | `setjmp` targets for escape continuations |
| wind list | Scheme | active `dynamic-wind` `(before . after)` pairs |
| handler stack | Scheme | the R7RS "current exception handler" chain |

`raise` no longer longjmps. It **calls** the current handler, with the handler stack popped to the
outer one for the duration. A `guard`'s handler is one that captures the guard's continuation and
escapes to it — and *that escape* is what runs the intervening `after` thunks, via the ordinary
escape path. Nothing special-cases exceptions.

**Unwinding is a two-step operation performed by the escaping side**, never by `longjmp`:

1. Walk the wind list from the current depth down to the target frame's depth, running each `after`
   thunk innermost-first, in Scheme, on the still-live stack.
2. Only then invoke the primitive that `longjmp`s.

*What this buys.* Rung 2 becomes exposing two procedures over a stack that already exists —
`with-exception-handler` pushes, `raise-continuable` calls the handler and uses its return value —
with no change to the wind machinery. That is the rework the exploration's open question was written
to prevent.

*Alternatives considered.*

- **Two cooperating stacks** — keep the setjmp guard stack for `guard`, add a handler stack for rung
  2. Rejected: they would both have to track the wind depth and agree about it, and every future
  control construct would have to be taught both. The R7RS formulation needs only one.
- **Wind stack in C, with `rt_raise` calling back into Scheme** to run each `after`. Rejected: it
  puts Scheme calls in the middle of the runtime's error path, where a raise from within an `after`
  thunk becomes re-entrant in the worst possible place. Keeping it in Scheme leaves the runtime's job
  as "transfer control," which is all `longjmp` is good for.

*Cost, stated plainly.* Today's `guard` is one `setjmp` and a `longjmp`. Re-expressed, it is a
handler-stack push plus an escape continuation — still one `setjmp` frame, with a little more Scheme
around it. The existing `guard` suites are the regression check.

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

- ~~**What should an `after` thunk that raises do?**~~ **Settled (task 1.2), in the spec.** The wind
  entry is popped *before* its `after` runs, so an `after` can never re-enter itself and unwinding
  cannot loop. A raise or escape from inside an `after` becomes the new transfer and unwinds the
  rest on its own way out — cleanup is not skipped, only the destination changes.
- ~~**Should `guard`'s reraise re-run winds?**~~ **Settled (task 1.3), and it is a documented R7RS
  deviation.** R7RS §4.2.7 requires the reraise to happen "within the dynamic environment of the
  original call to `raise`", which means re-entering a continuation whose extent has ended —
  precisely what escape continuations cannot do (D1). This implementation reraises in the *guard's*
  dynamic environment; `after` thunks between the raise point and the guard have already run and do
  not run again. This is the one place rung 3 is visibly not R7RS, and it disappears at rung 4.
- ~~**Does the full-`call/cc` follow-up want stack copying or CPS?**~~ **Out of scope and already
  studied** — `openspec/explorations/continuations-and-control.md` holds the sourced, twice-verified
  analysis, and `LLVM.md` records it as an open decision. This change contributes one new data point
  to it (no stack-interior pointers) and nothing else.
