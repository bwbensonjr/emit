## Why

Exact integer arithmetic wraps silently past the 61-bit fixnum range, producing a
**wrong exact answer** with no diagnostic:

```scheme
(+ 1152921504606846975 1)     ; => -1152921504606846976
(* 1000000000000 1000000000)  ; => -735865998743175168
1152921504606846976           ; => -1152921504606846976   (the LITERAL wraps in the reader)
(inexact->exact 1e30)         ; => -1                     (unchecked (intptr_t) cast)
```

R7RS §6.2.3 does not require bignums — "It is recommended, but not required, that
implementations support exact integers … of practically unlimited size" — so a
61-bit exact range is a legitimate implementation restriction. But the same section
allows only **two** outcomes when that restriction bites: a procedure "may either
report a violation of an implementation restriction or it may silently coerce its
result to an inexact number." Wraparound is a third outcome, and `+`, `-`, `*` are
on §6.2.3's list of procedures that must return exact integer results whenever the
mathematically expected result is representable. Silently redefining
"representable" as "modulo 2^61" is the one thing the standard rules out.

This is also the general form of the bug that closed issue #7, which fixed only
the compiler-internal instance (`encode-const` now multiplies in decimal via
`times-8-decimal`) and left the language-level hazard in place. The comment there
names the stakes: "A silently wrong value AND a dev→ship divergence."

**The fix is already designed and half-built.** `docs/PERFORMANCE.md:292-294` (P5,
option A) specifies the inline fast path as a tag test → native `add`/`sub`/`icmp`
"**with an overflow guard for `+ - *`**", falling back to `rt_*` "only on the slow
(**non-fixnum / overflow / bignum**) path." What shipped in
`inline-fixnum-arith-and-self-calls` is the tag guard alone. So the "A2 tag-checked
seam" that `src/emit.ss:423-425` promises — "a future flonum/bignum change lands in
`rt_*` and non-fixnum operands are routed there automatically" — currently routes
on *tag* but not on *overflow*: an overflowing both-fixnum operation never reaches
the runtime at all. This change completes that seam.

**Trapping, not coercing, is the bignum-compatible choice.** Under a trap, the set
of programs that yield a value is a strict subset of what bignums would yield:
every program that works today keeps its exact answer, and programs that trap start
succeeding when bignums land. Coercing to inexact instead commits to an answer that
a later bignum change would have to *break* — `(* 1000000000000 1000000000)` would
return the flonum `1e21` now and the exact `1000000000000000000000` later. The trap
is a placeholder whose observable behavior ("out of range") bignums make
unreachable.

## What Changes

- **The inline fixnum fast path gains an overflow edge.** `emit-inline-arith`
  (`src/emit.ss:453-476`) already emits a diamond: tag guard → fast arm | slow arm
  calling `rt_*` → phi. `+`, `-`, `*` gain a second exit from the fast arm, taken
  when the operation overflows, branching to **the same slow-arm call**. The
  comparisons `=` and `<` cannot overflow and are untouched.

- **Detection is exact and costs no extra arithmetic**, because the fast arm
  already computes on tagged words whose low three bits are zero. Operands are
  `va<<3` and `vb<<3`, so the tagged sum is `(va+vb)<<3`, which overflows `i64`
  *iff* `va+vb` leaves `[-2^60, 2^60)` — precisely the fixnum range. Likewise the
  `mul` arm's `(a>>3) * b` = `(va*vb)<<3`. So `add`/`sub`/`mul` become
  `@llvm.sadd.with.overflow.i64` / `@llvm.ssub.with.overflow.i64` /
  `@llvm.smul.with.overflow.i64`, extracting the value and the overflow bit from
  the returned struct. No false positives, no false negatives, no added shifts.

- **`rt_add`, `rt_sub`, `rt_mul` become overflow-checked** via
  `__builtin_add_overflow` and friends (`src/runtime/runtime.c:199-213`), calling
  `rt_fatal` with a message naming the operation. This is required independently of
  the inline path — today the slow arm would simply wrap a second time — and it is
  what keeps the runtime "the single definition of numeric semantics" that the
  `aot-codegen` spec demands.

- **`rt_inexact_to_exact` gains a fixnum-range check**
  (`src/runtime/runtime.c:1241-1248`). It currently tests `isfinite` and
  integrality and then does `FIX((intptr_t)d)`, which is undefined behaviour for a
  double outside `intptr_t` and yields garbage in practice. Out-of-range now traps.

- **The reader is fixed by inheritance, not by a bounds check.** `rd-digits`
  (`src/prelude.scm:649`) accumulates with `(+ (* acc 10) digit)` in ordinary
  Scheme arithmetic, so once `+` and `*` trap, an out-of-range integer literal
  traps at read time with no change to that line. This is deliberate: a hand-written
  range check there would be code to delete later, and would *block* the exact-read
  behaviour bignums bring.

- **BREAKING (narrowly).** Programs that today receive a silently wrapped value now
  abort. No program that produces a correct value changes behaviour. Emit's traps
  are not `guard`-catchable (`README.md:322`), so an overflow terminates the
  computation rather than raising a catchable condition — accepted here as
  transitional, since bignums make the trap unreachable rather than catchable.

Non-goals (deferred): bignums and arbitrary precision themselves — this change
builds the seam they land on, nothing more; exact rationals; making runtime traps
`guard`-catchable; the missing R7RS numeric procedure inventory (`abs`, `gcd`,
`expt`, `floor`/`round`, `string->number`, `(scheme inexact)`, …); the unchecked
non-fixnum arguments to `quotient`/`remainder`/`integer->char`; and the flonum
literal IR-emission defect. The last two are filed as issues, not folded in here —
they are unrelated defects that would muddy this diff.

## Capabilities

### New Capabilities
<!-- None — this refines existing core-language and aot-codegen requirements. -->

### Modified Capabilities

- `core-language`: add a requirement that **exact integer overflow is a
  diagnostic, never a wrapped value**, covering `+`/`-`/`*` at run time and
  out-of-range exact integer literals at read time; and extend the existing
  "Exact/inexact conversion" requirement so `inexact->exact` traps on a value
  outside the fixnum range (it currently specifies only the non-integral trap).

- `aot-codegen`: extend "Fixnum numeric primitives lower to an inline fast path" —
  the inline path for `+`, `-`, `*` SHALL detect overflow and delegate to the same
  `rt_*` primitive the tag test delegates to, so the runtime remains the single
  definition of numeric semantics for the overflow case as it already is for the
  non-fixnum case.

## Impact

- **Code**:
  - `src/emit.ss` — `emit-inline-fast` gains checked-intrinsic forms for the `add`
    and `mul` kinds (returning value + overflow bit); `emit-inline-arith` grows the
    extra branch into the existing slow block; `declare` lines for the three
    `llvm.*.with.overflow.i64` intrinsics. The `cmp` kind is unchanged.
  - `src/runtime/runtime.c` — overflow checks in `rt_add`/`rt_sub`/`rt_mul`; a
    fixnum-range check in `rt_inexact_to_exact`.
  - No change to `src/prelude.scm`, `src/parse.ss`, or the passes: the reader and
    every derived numeric procedure inherit the new behaviour.
- **Bootstrap**: the emitted IR for the compiler's own sources changes (every
  arithmetic site gains a block), so `make regen` must be re-run and reconverge, and
  `bootstrap/*.ll` will change. No new primcall heads, so this is a plain regen, not
  the staged two-step.
- **Backends**: `emit run` and AOT must stay byte-identical, and the regen fixed
  point must hold. The compiler self-hosts through the new checks, which is itself a
  strong test: it must not trap while compiling itself.
- **Performance / size**: one predicted-not-taken branch per `+`/`-`/`*` site, plus
  an extra edge into the existing slow block. P5 recorded the original tag-guard
  diamond at roughly +4% binary size; this must be measured on the Ackermann
  benchmark and the committed binary sizes, and the result recorded in
  `docs/PERFORMANCE.md` under P5 (whose stated design this completes).
- **Tests/Demos**: a demo exercising the boundary values and the trap; test cases
  for run-time overflow in `+`/`-`/`*`, a wrapped source literal, and
  `inexact->exact` out of range, on both backends.
- **Docs**: `README.md:311` ("still no bignums or exact rationals") gains the
  overflow behaviour; `docs/PERFORMANCE.md` P5 gains the completion note.
- **Compatibility**: no correct program changes meaning. The fold window in
  `src/passes/simplify.ss:57` (±2^30−1) already refuses to fold anything that could
  overflow, so compile-time folding is unaffected and stays consistent across hosts.
