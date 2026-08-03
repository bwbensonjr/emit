## Context

Fixnums are tag `000` immediates whose payload is `word >> 3`
(`src/runtime/runtime.c:44,85-86`), giving an exact-integer range of
`[-2^60, 2^60)`. Nothing checks that range on either arithmetic path:

- The **inline fast path** (`src/emit.ss:414-476`) emits plain LLVM `add`/`sub`/
  `mul` with no `nsw`/`nuw`. That is well-defined two's-complement wrap at the
  LLVM level, and it is the path both-fixnum operations actually take.
- The **C slow path** (`src/runtime/runtime.c:199-213`) is
  `FIX(UNFIX(a) + UNFIX(b))`, also unchecked. The runtime builds at `-O2` with no
  `-fwrapv` (`Makefile:94`), so `UNFIX(a) * UNFIX(b)` on two 61-bit values is
  formally signed-overflow UB in C, and `FIX` left-shifts a value whose result is
  not representable. Not reached for two fixnums today, so the UB is latent rather
  than live — but the two paths derive their wrap from different rules, which is
  itself a reason not to leave either unchecked.

The seam this change completes was specified but not built.
`docs/PERFORMANCE.md:292-294` describes P5 option A as a tag test → native
`add`/`sub`/`icmp` "with an overflow guard for `+ - *`", falling back to `rt_*`
"only on the slow (non-fixnum / overflow / bignum) path". The
`inline-fixnum-arith-and-self-calls` change shipped the tag guard alone. The
`aot-codegen` spec's forward-compatibility clause and the comment at
`src/emit.ss:423-425` both promise that "a future flonum/bignum change lands in
`rt_*`" — true for non-fixnum operands, false today for overflow, which never
leaves the fast arm.

The stakeholder constraint that shapes every decision below: bignums are
**deferred, not rejected** (`core-language` spec, and the non-goals of
`inexact-numbers`, `core-lambda-slice`, and `inline-fixnum-arith-and-self-calls`).
Whatever this change does must be the thing bignums later grow out of, not
something they have to undo.

## Goals / Non-Goals

**Goals:**

- No exact-integer operation ever yields a silently wrong exact value. Every
  out-of-range result is a diagnostic naming the operation.
- Complete the A2 tag-checked seam so overflow, like non-fixnum-ness, is routed to
  `rt_*` — leaving the runtime the single definition of numeric semantics for both.
- Land the change so that a future bignum change edits `rt_*` and nothing else.
- Hold the two invariants: byte-identical backends, and a converging `make regen`
  fixed point.
- Keep the hot path hot: overflow detection must add no arithmetic, only a
  predicted-not-taken branch.

**Non-Goals:**

- Bignums, arbitrary precision, exact rationals. This builds their landing site.
- Making runtime traps `guard`-catchable. Emit's traps abort to the host
  (`README.md:322`); overflow joins the existing family rather than inventing a
  second error discipline.
- The wider R7RS numeric inventory, and the unrelated defects filed as issues
  (unchecked `quotient`/`remainder`/`integer->char` arguments; the flonum-literal
  IR-emission bug).
- Widening `simplify.ss`'s ±(2^30−1) constant-fold window. It is deliberately a
  sufficient-not-exact condition ("folds less, never folds wrong") and stays
  correct as-is.

## Decisions

### D1 — Trap on overflow; do not coerce to inexact

R7RS §6.2.3 offers exactly two sanctioned outcomes when an exact result cannot be
delivered: report an implementation restriction, or silently coerce to inexact.
Both are conformant. The tiebreaker is forward compatibility with bignums.

Trapping makes the set of value-producing programs a strict **subset** of what
bignums would produce: correct programs keep their exact answers, and programs
that trap begin succeeding when bignums land. No expression that has a value today
acquires a *different* value later.

Coercion commits to answers a bignum change would have to break.
`(* 1000000000000 1000000000)` would be the flonum `1e21` now and the exact
`1000000000000000000000` later — a silent result change in exactly the programs
that exercise the boundary, plus a body of tests and demos pinning the wrong
answers.

*Alternatives considered.* **Coerce to inexact** — friendlier (no program dies),
still conformant, rejected on the migration argument above. **Implement bignums
now** — the standard's actual recommendation, rejected as a large runtime addition
(or a GMP dependency) that cuts against the stated binary-size goal, and one that
should not be bundled into a correctness fix. **Leave it and document the
restriction** — rejected: §6.2.3 forbids the wrong-exact-answer outcome regardless
of documentation, and the failure is silent.

The accepted cost: an overflow terminates the computation rather than raising a
catchable condition. Transitional, because bignums make the trap unreachable.

### D2 — Detect with LLVM checked intrinsics on the *tagged* words

The fast arm already holds the tagged operands, and the tag bits are zero, so the
checked intrinsics detect exactly fixnum-range overflow with no extra shifts:

- **add/sub** — operands are `va<<3`, `vb<<3`; the tagged sum is `(va+vb)<<3`,
  which overflows `i64` **iff** `va+vb` leaves `[-2^60, 2^60)`. That is precisely
  the fixnum range: no false positives, no false negatives.
- **mul** — the arm already computes `(a>>3) * b` = `va * (vb<<3)` = `(va*vb)<<3`,
  overflowing `i64` on exactly the same condition.

So `add`/`sub`/`mul` become `@llvm.sadd.with.overflow.i64` /
`@llvm.ssub.with.overflow.i64` / `@llvm.smul.with.overflow.i64`, with
`extractvalue` for the result and the overflow bit. On x86 this lowers to the same
`add`/`imul` plus a `jo`.

*Alternatives considered.* **Untag, operate in 61-bit space, range-check the
result** — more instructions and a wider dependency chain for an identical answer.
**Check only in `rt_*` and route all arithmetic there** — abandons the entire P5
win. **Emit `nsw` and rely on the optimizer** — `nsw` makes overflow *undefined*,
which is strictly worse than wrapping.

### D3 — The overflow edge branches to the existing slow-path call

The fast arm gets a second exit into the **same** basic block that the tag test
already falls back to — the `call @rt_add(a, b)` — not a direct `rt_fatal` call and
not a new trap block.

This is the whole point of the change. The decision about what overflow *means*
then lives in one place, `rt_add`/`rt_sub`/`rt_mul`, which the `aot-codegen` spec
already designates the single definition of numeric semantics. Today those
functions call `rt_fatal`; a future bignum change replaces that call with a bignum
allocation and **nothing outside `rt_*` changes** — no emitter edit, no new IR
shape, no re-derived fixed point beyond the ordinary regen. The A2 seam then routes
both of its intended cases, tag and overflow, to the same place.

It also means `rt_add`/`rt_sub`/`rt_mul` must be checked *independently* of the
inline path: reached from the fast arm's overflow edge, they would otherwise wrap a
second time and defeat the guard entirely. Use `__builtin_add_overflow` and friends
(GCC and Clang both provide them; the runtime is already C11 + builtins), which
also retires the latent C UB noted in Context.

*Alternatives considered.* **Branch to a dedicated trap block per site** — smaller
IR today, but it hard-codes "overflow = death" into the emitter and forces the
bignum change to touch codegen. Precisely the coupling this change exists to
remove.

### D4 — The reader inherits; no bounds check in `rd-digits`

An out-of-range source literal wraps today because `rd-digits`
(`src/prelude.scm:649`) accumulates with `(+ (* acc 10) digit)` in ordinary Scheme
arithmetic — the very operations being fixed. Once `+` and `*` trap, the literal
traps at read time with that line untouched.

Deliberately no explicit range check there: it would be code written now and
deleted later, and it would *block* the exact-read behaviour bignums bring for
free. The same reasoning covers every derived numeric procedure in the prelude —
`number->string`, `iota`, `list-tail`, the hash-table index arithmetic — none of
which need edits.

**Refined during implementation.** Inheritance alone was not quite enough, and the
gap is instructive: `rd-parse-int` read a negative literal as
`(- 0 (rd-digits …))`, building the **positive** magnitude first. The fixnum range
is asymmetric — `-2^60` is representable, `+2^60` is not — so the most negative
fixnum only ever worked because it wrapped *twice*, and under a trapping `*` it
became unreadable. The fix is an algorithm change, not a bounds check: a negative
literal now accumulates downward (`rd-digits-neg`), which never leaves the range
for any in-range literal and still traps in the same `*`/`-` for an out-of-range
one. D4's substance holds — no range check, nothing to delete when bignums land,
and accumulating negatively stays correct under arbitrary precision. `ns-digits`
(`number->string`) and `fixnum-word` (`src/emit.ss`) already avoid negating for
exactly this reason, so this brings the reader in line with its two counterparts
rather than inventing anything.

This is Risk 2 below firing exactly as anticipated, and resolved the way that risk
prescribes: fix the arithmetic that depended on wrapping, do not weaken the check.

### D5 — `inexact->exact` gets a real range check now

`rt_inexact_to_exact` (`src/runtime/runtime.c:1241-1248`) tests `isfinite` and
integrality, then does `FIX((intptr_t)d)`. For a double outside `intptr_t` the cast
is UB, and in practice `(inexact->exact 1e30)` returns `-1`. Even in range for
`intptr_t`, anything ≥ 2^60 wraps in the `FIX` shift, so
`(inexact->exact (exact->inexact 1152921504606846975))` returns the most negative
fixnum — a clean round-trip failure.

The check is against the **fixnum** range, not `intptr_t`, and traps outside it.
Partly transitional — the bignum version constructs an exact integer from the
double's mantissa and exponent rather than extending a bounds test — but three
lines, and returning `-1` is indefensible in the meantime.

### D6 — `quotient` and `/` need the same treatment; `modulo`/`remainder` do not

One two's-complement corner survives outside `+`/`-`/`*`: the most negative fixnum
divided by `-1` is `2^60`, one past the range.

```scheme
(quotient -1152921504606846976 -1)  ; => -1152921504606846976   (wrong)
(/ -1152921504606846976 -1)         ; => -1152921504606846976   (wrong)
(modulo -1152921504606846976 -1)    ; => 0                      (correct)
(remainder -1152921504606846976 -1) ; => 0                      (correct)
```

`rt_quotient` (`runtime.c:231-235`) and the exact-exact arm of `rt_div`
(`runtime.c:218-228`) therefore need the same range check before `FIX`. Neither has
an inline path, so this is runtime-only — no emitter work. `modulo` and `remainder`
are mathematically in range for every input and stay as they are.

## Risks / Trade-offs

- **Binary-size regression.** One branch and one extra edge per `+`/`-`/`*` site.
  P5 measured the original tag-guard diamond at roughly +4% on the committed
  binaries; this is smaller but not free, and Emit treats binary size as a design
  concern. → Measure the Ackermann benchmark and committed binary sizes before and
  after, record both in `docs/PERFORMANCE.md` under P5 (whose design this
  completes), and treat a large regression as a reason to revisit the lowering, not
  to skip the check. The branch is predicted-not-taken and the slow block already
  exists, so the expected runtime cost is near zero.

- **A latent overflow inside the compiler surfaces as a self-hosting failure.**
  The compiler compiles itself through the new checks, so any place its own
  arithmetic quietly relied on wrapping now aborts `make regen`. → This is a
  feature, not just a risk: it is the strongest available test. `encode-const`'s
  `times-8-decimal` (`src/emit.ss:118-140`) already removed the one known instance.
  If another appears, fix it rather than weakening the check.

- **Regen churn.** Emitted IR changes at every arithmetic site, so `bootstrap/*.ll`
  changes substantially and the fixed point must reconverge. → No new primcall
  heads, so a plain `make regen`, not the staged two-step; verify convergence and
  byte-identical backends explicitly.

- **A program that depended on wrapping now dies.** → Accepted and intended;
  §6.2.3 rules out the previous behaviour. No correct program changes meaning.

- **Traps are not `guard`-catchable**, so a long computation cannot recover from an
  overflow near its end. → Accepted as transitional (D1). Revisit only if
  catchable runtime errors land before bignums do.

## Migration Plan

1. Runtime first (`rt_*` checks, D3/D5/D6) — testable on its own through the
   existing slow paths, with no IR change.
2. Emitter overflow edge (D2/D3), then `make regen` to a converged fixed point.
3. Verify byte-identical backends and the full demo/test suite.
4. Measure and record the size/perf delta.

Rollback is per-step: the emitter change reverts independently of the runtime
checks, and the runtime checks are correct (if slower to trigger) without it.

## Open Questions

Both resolved before implementation (tasks 1.1, 1.2):

- **Trap message: operation plus operands** — `*: fixnum overflow: 1000000000000 *
  1000000000`. No fixed-width formatter was needed after all: a `vsnprintf`
  variant of `rt_fatal` (`rt_fatalf`) writes into the same 128-byte static buffer,
  which is allocation-free and comfortably fits two 61-bit decimals plus an
  operator name. Naming the operands is what makes the inherited literal
  diagnostic usable — `1152921504606846976` reports `+: fixnum overflow:
  1152921504606846970 + 6`, which points at the digit accumulation.
- **Reader diagnostic: the plain arithmetic trap** — D4 stands, no read position.
  Accepted as the cost of having no reader-side check to delete later.

Remaining for a future change, not this one:

- Should the emitter skip the overflow check where a result is provably in range?
  Nothing available today has the type information (`simplify` propagates
  constants, not ranges), and the measured cost did not justify inventing it. Noted
  in `docs/PERFORMANCE.md` under P5.
