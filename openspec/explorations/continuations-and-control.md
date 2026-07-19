# Exploration: continuations & control (the `call/cc` staircase)

Status: exploration / living roadmap (individual rungs become their own changes)
Related: `src/runtime/runtime.c` (the `setjmp`/`longjmp` guard frame stack — `rt_run_guarded`,
`rt_raise`); archived `…-error-and-guard-conditions` and `…-r7rs-exceptions-subset` (the shipped
`guard`/`raise`/`error` subset); `LLVM.md` §"First-class continuations" and §"CPS, continuations,
and GC on LLVM"; `docs/PIPELINE.md` (the deliberate no-CPS/no-ANF direct-style pipeline).
First rung: `openspec/changes/multiple-values`.
Captured: 2026-07-18 · Updated: 2026-07-18 (LLVM stack-switching research pass + a second adversarial re-verification of the Effekt/Lexa leads — see the dated section before "Open questions")

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

### Research pass (2026-07-18): does modern LLVM open a third way for rung 4?

A cited deep-research pass (fan-out search → source fetch → adversarial verification). The final
auto-synthesis step hit a session limit, so this is hand-synthesized from the 19 independently
verified claims (each `✓` = verified 3-0 unless noted); sources listed at the end. The two most
consequential leads (Effekt and Lexa) were then **re-verified by a second, fresh 3-skeptic
adversarial pass** against the primary sources — **both confirmed unanimously (3/3)**, with the
bibliographic and mechanism corrections folded in below. **Verdict: no — the two-family picture
holds, and if anything the ecosystem has hardened around *one-shot*, making multi-shot re-entrant
`call/cc` the deliberate expensive outlier.**

**1. LLVM coroutines (`llvm.coro.*`) are one-shot — they cannot back multi-shot `call/cc`.** The
LLVM docs define a suspended coroutine as resumable "to continue execution from the last suspend
point or … destroyed" ✓, a single sequential resume; a coroutine frame persists state for one
suspend/resume lifecycle only, with no documented frame-cloning ✓. Coroutine/`yield` are
*intrinsically* one-shot — a property, not an implementation gap. So `llvm.coro.*` is out for our
purpose.

**2. There is no landed stock-LLVM stack-switching primitive.** The `llvm.xcall`/`xret`
explicit-stack-pointer intrinsic was a *2017 proposal*, never upstreamed ✓. The literature's
stack-based route is Dolan et al.'s SWAPSTACK — and it "captures only one-shot continuations" and
needs runtime support ✓. The WebAssembly stack-switching proposal (WasmFX) is **single-shot by
design**: a continuation "must be invoked exactly once" and re-invoking **traps** ✓ (following
OCaml 5 ✓), deliberately excluding multi-shot because its target use-cases (concurrency/async)
don't need it ✓; its production prototype capture is native fiber **stack switching** (swap `rsp`
in a few asm instructions) ✓. So the "WASM analogy" floated earlier does **not** yield multi-shot.

**3. The authoritative map is still Farvardin & Reppy, PLDI 2020, "From folklore to fact."** It
compares **six** strategies through one identical pipeline / LLVM backend / runtime ✓, framed
exactly as "call stacks, segmented stacks, and heap-allocated continuation closures" ✓ — i.e. our
(A) heap-CPS-closures vs. (B) virtualize-your-own-stack (contiguous or segmented). Their Manticore
system implements three concretely: immutable heap frames (CPS), contiguous stack, segmented stack
✓. The map has not changed since 2020.

**4. CPS-to-heap gives multi-shot for free — but the *efficient* version historically forked
LLVM.** Heap-allocated continuation closures give constant-time `callcc` and multi-shot, because
immutable heap frames re-enter arbitrarily ✓. But making it fast required a *new calling
convention* (JWA, "Jump-With-Arguments") added in an **LLVM fork, x86-64 only** (verified 2-1, one
dissent), plus the `naked` attribute (skip prologue/epilogue) + `musttail` + an SML/NJ-style asm
shim, because stock LLVM's TCO frame management is "prohibitively expensive" for CPS ✓.
**Softening caveat (newer upstream):** two ingredients we *already* use (`tailcc` + `musttail`),
plus the newer `preserve_none` convention (upstream ~LLVM 18), narrow that gap — so the "must fork
LLVM" caveat is weaker today than in 2020. The whole-frontend CPS cost, however, remains.

**5. Multi-shot is the expensive corner, and the field has drifted away from it.** Multi-shot
needs **copying the control stack at capture** ✓; since realistic programs resume at most once,
effect-handler systems, WasmFX, and OCaml 5 all optimize one-shot and trap-or-copy for multi-shot.
Scheme `call/cc` is squarely in the minority that *requires* re-entry — a deliberate, costly
choice, not a gap in the tooling. Worth internalizing: wanting real multi-shot `call/cc` means
opting into the corner modern LLVM-targeting runtimes specifically avoid.

**Two post-2020 LLVM-targeting systems, now re-verified (3/3 each) against the primary sources —
read both before any rung-4 commitment:**
- **Effekt — "Multiple Resumptions and Local Mutable State, Directly," ICFP 2025** (PACMPL,
  DOI 10.1145/3747529; Muhcu, Schuster, Steuwer, Brachthäuser — Tübingen). **Verified:** a real
  **LLVM backend** that gives *constant-time* continuation capture/resume **when resumed exactly
  once**, and **also supports multi-shot resumption — by copying stacks when necessary** (so
  multi-shot is supported but *not* constant-time). Crucially, this is achieved with
  garbage-free reference counting + stacks tied to stable prompts — i.e. an evolved **option (B)
  (own-your-stack + copy-on-multishot)**, *not* CPS-to-heap. The closest modern LLVM-native answer
  to our exact need, and evidence that (B) can do multi-shot efficiently on LLVM. (Note: I earlier
  mis-cited this as OOPSLA 2025 with an arXiv ID that actually points to an unrelated Koka thesis —
  both corrected here.)
- **Lexa — "Lexical Effect Handlers, Directly," OOPSLA2 2024, Article 330** (Ma, Ge, Lee, Zhang).
  **Verified:** compiles **Lexa → C → LLVM** and translates effect handling to low-level
  **stack switching** (an x86-64 asm library, "StackTrek"; resume = restore a saved stack pointer
  via `ret`). It uses the LLVM **`preserve_none`** calling convention (all-caller-saved) for the
  stack-switching/effect functions to make switching cheap **and to expose tail-call optimizations
  that `setjmp`/`longjmp` would otherwise defeat** (their Fig. 15: setjmp/longjmp overflows the
  stack; `preserve_none` keeps the tail calls). **Important correction:** Lexa is **primarily
  one-shot** — "a resumption can be resumed at most once"; multishot is an explicit *nongoal* with
  only restricted support. So Lexa is a **mechanism** reference (the `preserve_none` + stack-switch
  trick, directly relevant to our `tailcc`/`musttail` setup), not a multi-shot solution.
- Also (from the first pass, not re-verified): Farvardin's **stack-rfc** proposes extending LLVM
  **GC statepoints** to a secondary/heap-stack model (relevant to (B) + precise GC);
  libmprompt/libhandler (Koka) show the C-level split — copy-fragments-to-heap (multi-shot) vs.
  in-place growable stacklets (one-shot) — but that is asm/FFI, not portable LLVM.

**GC bottom line for us.** CPS→heap closures are the friendliest to our **Boehm** setup:
continuations become ordinary traced heap objects that Boehm scans with no IR cooperation. LLVM's
own statepoint GC "assumes a stack runtime model" and doesn't apply to heap continuations — so the
Boehm choice actually *removes* a problem the precise-GC crowd has to solve, strengthening
`LLVM.md`'s "CPS also simplifies GC" note for our specific stack.

**What this means for the fork.** Two endpoints remain for genuine **multi-shot** `call/cc` on
Boehm + LLVM, and the verified evidence nudges the balance:
- **(A) CPS→heap closures** — yields multi-shot *for free* (immutable frames re-enter arbitrarily)
  and is the cleanest Boehm fit, but costs the whole-frontend CPS rewrite `PIPELINE.md` avoided,
  and its *fast* form historically needed non-upstream LLVM (JWA) — softened today by
  `tailcc`/`musttail`/`preserve_none`.
- **(B) own-your-stack + copy-on-multishot** — the **Effekt/ICFP 2025 result now demonstrates this
  working efficiently on a real LLVM backend**: constant-time one-shot, multi-shot via stack
  copying, with reference-counted stacks. That is a direct, verified existence proof that we can
  get multi-shot **without** abandoning direct style — the more surprising and arguably more
  attractive option for this project, since it preserves the pipeline `PIPELINE.md` is built on.

No stock-LLVM primitive shortcuts either path. So the concrete rung-4 next step, whenever it gets
real, is: **read Effekt/ICFP 2025 first** (the (B)-style multi-shot recipe) and Lexa/OOPSLA 2024
(the `preserve_none` + stack-switch mechanism), and weigh (B)-done-well against the CPS rewrite —
rather than treating CPS as the foregone conclusion `LLVM.md` currently implies.

#### Sources
- Farvardin & Reppy, *Compiling with Continuations and LLVM* (Manticore), EPTCS 285 / arXiv:1805.08842 — http://manticore.cs.uchicago.edu/papers/eptcs285-cwc-llvm.pdf
- Farvardin & Reppy, *From Folklore to Fact: Comparing Implementations of Stacks and Continuations*, PLDI 2020 — https://kavon.farvard.in/papers/pldi20-stacks.pdf
- Farvardin, MS paper (Manticore's three strategies) — https://newtraell.cs.uchicago.edu/files/ms_paper/kavon.pdf
- LLVM Coroutines documentation — https://llvm.org/docs/Coroutines.html
- WasmFX / WebAssembly stack-switching — arXiv:2308.08347 and the proposal explainer at https://github.com/WebAssembly/stack-switching
- Farvardin, HIW 2017 talk (the `xcall` proposal) — https://kavon.farvard.in/talks/hiw17.pdf
- Farvardin, stack-rfc (GC statepoints for secondary stacks) — https://github.com/kavon/stack-rfc
- Muhcu, Schuster, Steuwer & Brachthäuser, *Multiple Resumptions and Local Mutable State, Directly*, PACMPL **ICFP 2025** — https://dl.acm.org/doi/10.1145/3747529 (**re-verified 3/3**; note: not OOPSLA, and arXiv:2412.19826 is an *unrelated* paper)
- Ma, Ge, Lee & Zhang, *Lexical Effect Handlers, Directly*, PACMPL **OOPSLA2 2024**, Article 330 — https://cs.uwaterloo.ca/~yizhou/papers/lexa-oopsla2024.pdf (**re-verified 3/3**; Lexa → C → LLVM; `preserve_none`; primarily one-shot)
- libmprompt / libhandler (Koka) — https://github.com/koka-lang/libmprompt

## Open questions

- **Is an escape-only `call/cc` (rung 3) acceptable as "`call/cc`"?** It cannot express
  generators. If re-entrant continuations are wanted soon, that argues for biting the CPS bullet
  earlier and possibly skipping/short-circuiting rung 3.
- **`let-values`/`define-values`/`receive`** are trivial `syntax-rules` macros over
  `call-with-values` — fold them into rung 1, or a small follow-on?
- **Handler stack vs. guard stack (rung 2)** — one unified dynamic stack of "what to do on
  raise," or two cooperating stacks? Decide against how `guard` (unwinding) and
  `with-exception-handler` (non-unwinding) must interleave.
