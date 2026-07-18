# Exploration: continuations & control (the `call/cc` staircase)

Status: exploration / living roadmap (individual rungs become their own changes)
Related: `src/runtime/runtime.c` (the `setjmp`/`longjmp` guard frame stack — `rt_run_guarded`,
`rt_raise`); archived `…-error-and-guard-conditions` and `…-r7rs-exceptions-subset` (the shipped
`guard`/`raise`/`error` subset); `LLVM.md` §"First-class continuations" and §"CPS, continuations,
and GC on LLVM"; `docs/PIPELINE.md` (the deliberate no-CPS/no-ANF direct-style pipeline).
First rung: `openspec/changes/multiple-values`.
Captured: 2026-07-18

## The framing

The README lists `values`/`call-with-values`, `dynamic-wind`, and the resumable exception
system (`with-exception-handler`, `raise-continuable`) under "not yet done," and says they
"need `call/cc`." Tracing what each feature *actually* requires shows that framing is too
pessimistic: **`call/cc` is not one keystone — it is a staircase, and most of the practical
value lands well before the one genuinely hard rung.**

The existing `guard`/`raise` machinery already IS a continuation primitive — a restricted one.
`runtime.c` states it directly: *"guard is only an upward, one-shot escape, so setjmp/longjmp
suffices (no call/cc)."*

```
   ESCAPE continuation              FULL continuation
   (upward, one-shot)               (re-entrant, multi-shot)
   ┌──────────────┐                 ┌──────────────┐
   │ capturing    │                 │ capturing    │
   │ frame still  │  ✓ jump up      │ frame may be │  ✗ setjmp can't
   │ on stack     │    while alive  │ long gone    │    reach a dead frame
   └──────────────┘                 └──────────────┘
   setjmp / longjmp ✓               needs CPS or stack-copy
```

An escape (upward, one-shot) continuation is a `longjmp` to a frame still live on the C stack.
A full (re-entrant, multi-shot) continuation must reify *the entire rest of the computation* so
it can be resumed arbitrarily — even after its context has returned. Only the second needs the
heavy machinery.

## What each feature really requires

```
FEATURE                        REALLY NEEDS                       call/cc?
──────────────────────────────────────────────────────────────────────────
values / call-with-values      a values-object + a convention    NO  — fully
                                                                      independent
with-exception-handler         a dynamic handler stack           NO  — just call
                               (list of handlers)                    the handler
raise-continuable              handler stack; handler returns    NO  — you never
                               normally to the raise point           unwound
dynamic-wind (unwind only)     a wind stack + upward escape      ESCAPE-only
                                                                  (= today's guard)
call/cc as call/ec             generalize the setjmp guard       ESCAPE-only
 (non-local exit)              stack
──────────────────────────────────────────────────────────────────────────
dynamic-wind (re-entry)        before-thunks run on re-entry     FULL call/cc
full re-entrant call/cc        reify the whole rest of the comp  FULL call/cc
generators / coroutines / amb  multi-shot resume                 FULL call/cc
```

The two surprises versus the README's "all need `call/cc`":

- **Multiple values need no continuation capture.** A values-object (a distinguished bundle) is
  returned as one machine word; only `call-with-values` knows to spread it. The single-value
  return convention is untouched.
- **`with-exception-handler`/`raise-continuable` need no continuation capture.** A dynamic
  *handler stack* (a list installed by `with-exception-handler`) is enough: `raise-continuable`
  calls the current handler as an ordinary function — because it never unwound, the handler's
  return value flows straight back to the raise point, which is exactly R7RS's resumable
  semantics. (`raise`'s non-return is the handler escaping — via the guard/escape mechanism.)

## The staircase

```
  value delivered
      ▲
 100% │                                        ┌─────────────────┐
      │                                        │ 4. FULL call/cc │  ← the ONE hard
      │                          ┌─────────────┤   (CPS or       │    rung; the
      │                          │ 3. escape   │    stack-copy)  │    CPS fork
  ~80%│              ┌───────────┤    cont +   └─────────────────┘    lives only
      │  ┌───────────┤ 2. handler│    dyn-wind │                      here
      │  │ 1. multi- │    stack   │  (unwind)  │
      │  │   values  │    excns   │            │
      │  └───────────┴───────────┴─────────────┘
      └────────────────────────────────────────────────────►  cost / risk
         low          low          medium         HIGH
```

1. **Multiple values** — a values-object + a tiny convention; zero continuation machinery.
   Large R7RS breadth, immediately. → `openspec/changes/multiple-values` (this staircase's
   first rung).
2. **Handler-stack exceptions** — `with-exception-handler` + `raise-continuable` on a dynamic
   handler stack beside the existing `rt_guard` stack. Completes the exception system already
   half-shipped (`guard`/`raise`/`error`).
3. **Escape continuations + unwind-only `dynamic-wind`** — expose `call/cc` restricted to
   escape use (`call/ec`-style), generalizing `rt_run_guarded`; add a wind stack so cleanup
   (`after`) thunks fire on the way up. Covers the dominant real-world `call/cc` pattern
   (non-local exit).
4. **Full re-entrant `call/cc`** — the only rung that forces the CPS-vs-stack-copy decision.
   Deferrable until a concrete need for re-entry (generators, `amb`, re-entrant `dynamic-wind`)
   arrives — by which point rungs 1–3 have shipped and there is far more system to judge the
   fork against.

## The one hard fork (rung 4) — noted, deliberately deferred

`LLVM.md` already commits rung 4's *intended* answer: "CPS conversion + heap-allocated
continuations" (Farvardin & Reppy, *Compiling with Continuations and LLVM*). But that sits in
real tension with the direct-style pipeline `docs/PIPELINE.md` is built around:

| | CPS route (LLVM.md's plan) | Keep direct-style + stack-copy / segmented |
|---|---|---|
| `call/cc` | trivial (grab the closure `k`) | capture/restore a heap stack segment |
| GC | **eliminates stack scanning** — helps a future precise/relocating GC | still must scan/relocate the captured segment |
| Pipeline cost | new CPS pass; **rewrites codegen for everything** | preserves direct-style; but stack capture is fragile on LLVM `tailcc`/`musttail` |
| PIPELINE.md thesis | abandons "no CPS/ANF, direct-style is simpler" | keeps it |

Rungs 1–3 require **none** of this. The recommendation is not to resolve the fork now: build
the staircase, and revisit CPS-vs-stack-copy when rung 4's use case is concrete. Two inputs will
sharpen the decision by then: (a) whether generators/coroutines become a near-term goal, and (b)
how much the future precise/relocating GC matters — the latter is `LLVM.md`'s strongest argument
for going CPS *eventually*, which would make rung 3's direct-style escape machinery a
stepping-stone rather than a throwaway either way (escape semantics remain a correct fast path
under CPS too).

## Open questions

- **Is an escape-only `call/cc` (rung 3) acceptable as "`call/cc`"?** It cannot express
  generators. If re-entrant continuations are wanted soon, that argues for biting the CPS bullet
  earlier and possibly skipping/short-circuiting rung 3.
- **`let-values`/`define-values`/`receive`** are trivial `syntax-rules` macros over
  `call-with-values` — fold them into rung 1, or a small follow-on?
- **Handler stack vs. guard stack (rung 2)** — one unified dynamic stack of "what to do on
  raise," or two cooperating stacks? Decide against how `guard` (unwinding) and
  `with-exception-handler` (non-unwinding) must interleave.
