## Context

Emit's numeric tower is two types — a 61-bit exact integer (fixnum) and a double (flonum) — which
R7RS §6.2.3 explicitly permits ("an implementation in which exact numbers are always integer").
Contagion, `=`/`<` across the exactness boundary, `/` returning exact-when-even, and the
`fixnum-overflow-trap` diagnostic all match the standard. What is missing is the *surface*: Emit
binds 20 of roughly 60 R7RS numeric procedures, and four defects sit inside the 20 it does bind.

Three constraints shape every decision below.

1. **Dev→ship fidelity is a design goal, not a nicety.** The emitter runs both under Chez (the
   bootstrap driver) and self-hosted (`emit run`, `emit repl`, `emit build`). Anything the emitter
   computes from *host* behaviour can diverge between doors. #24 is the live instance: the flonum
   literal path interpolates the host's `number->string` into IR text, so `(* 100.0 2.0)` compiles
   under Chez and emits invalid IR self-hosted. This is the same class as the closed #7, and it is
   why the emitter half of this change is the part that must land first and cleanly.
2. **Adding a raw `%`-primitive is a staged bootstrap, not a table edit** (`docs/PRIMITIVES.md`,
   "Adding a new integrable primitive"). The committed seed must already recognize a primcall head
   before the compiler's own source may use it, which is why the libm work is sequenced last and
   why the inventory work deliberately avoids new primitives wherever Scheme will do.
3. **Binary size and IR readability are design concerns.** The prelude is "library zero" and every
   procedure added to it lands in `(scheme base)`, so the inventory grows the default surface. The
   AOT tree-shake (`aot-release-profile`) removes what a program does not reference, which is what
   makes a breadth change affordable at all.

Current state of the four defects, verified against `build/emit` at `5d38be0`:

| | today |
|---|---|
| `(* 100.0 2.0)` | `emit run`: invalid IR; Chez-hosted AOT: `2e+02` |
| `(map > '(3 1) '(2 4))` | `unbound variable >` |
| `(max 1 2 3)` | `arity error: expected 2 argument(s), got 3`; `min` unbound |
| `(quotient 7.0 2)` | `272273322` (a shifted heap pointer) |
| `(read-from-string "+inf.0")` | the symbol `+inf.0` |

`quotient`/`remainder`/`modulo` have no inline fast path (`inline-arith-table` covers only
`%+ %- %* %= %<`), so #23 is runtime-only work with no emitter involvement.

## Goals / Non-Goals

**Goals:**

- The emitter writes a flonum literal into IR in a form LLVM accepts, **identically on every
  door**, derived from canonical formatting rather than host printing.
- All five comparisons are first-class values; `max`/`min` are variadic with R7RS contagion.
- `quotient`, `remainder`, and `integer->char` reject arguments they currently reinterpret.
- R7RS §6.2's `(scheme base)` numeric inventory is present, with the §6.2.3 exact-for-exact
  guarantees honored.
- `(scheme inexact)` exists as an importable library — Emit's second standard library.
- `write`/`read` round-trips every value the printer can produce, for the non-finite cases.
- Each task group is independently landable and verifiable, so the change can stop at any group
  boundary without leaving the tree inconsistent.

**Non-Goals:**

- Radix (`#b` `#o` `#d` `#x`) and exactness (`#e` `#i`) **reader prefixes**, and rational syntax
  `1/2` (the remainder of #25). They are one coherent reader-grammar change; splitting the reader
  across two changes is worse than deferring the whole grammar piece. `string->number` here
  handles radix through its *argument*, not through prefixes.
- Exact rationals and bignums. Both are permitted absences (§6.2.3); the overflow trap was
  chosen precisely so a later bignum change contradicts nothing (`fixnum-overflow-trap` D1).
- `rationalize`, and `(scheme complex)` — the latter should stay absent permanently.
- Making `>`/`<=`/`>=` real runtime primitives (see D2's alternative C).
- Curating `(scheme base)`'s export surface (#29). This change *worsens* that problem by adding
  procedures to the prelude, which the generator publishes automatically; #29 is the follower.
- Locating bundled libraries from an installed binary. `(scheme inexact)` resolves through the
  manifest like any library, and the manifest path is working-directory relative — a pre-existing
  distribution gap that belongs with `homebrew-tap-distribution`.

## Decisions

### D1 — One canonical IR-double formatter in the emitter; never the host printer

`src/emit.ss` writes a double into IR text at two sites: the unboxed region emitter
(`:606`, `(number->string d)` straight into `fmul double …`) and the boxed literal path
(`:183`, `(number->string d)` into a C string global rebuilt by `rt_flonum_lit`). Both inherit
whatever the host prints.

The fix is a single `ir-double` formatter used by both sites, producing text that is (a) valid
LLVM in a `double` position and (b) **byte-identical across doors**.

Both properties are required, and the second is the one that is easy to miss. LLVM rejects
`1e+02` because a floating-point constant must carry a `.` or use the `0x` form — that is (a),
the reported symptom. But even after (a) is fixed, `number->string` gives `100.0` under Chez and
`1e+02` self-hosted, so the emitted IR *text* would still differ by door. That divergence exists
today at the boxed site (the `@.flo.lit.` global's contents differ between doors), which
`self-emit-equiv.sh` does not catch only because the compiler's own source contains no flonum
literals. Fixing (a) alone would leave a fidelity hole in place.

The formatter therefore does not delegate spelling to any host:

- **Finite values** — take the host's shortest-round-trippable decimal (both printers produce
  shortest-round-trip *digits*; only the framing differs — exponent threshold, `+` in the
  exponent, presence of `.0`), decompose it into sign / digit string / decimal exponent with
  string operations only, and re-emit one canonical spelling: always exactly one `.` with at least
  one digit on each side, an exponent only outside a fixed window, and no `+` in the exponent.
  `100.0` and `1e+02` both canonicalize to the same text.
- **Non-finite values** — `+inf.0`, `-inf.0`, `+nan.0` have no decimal spelling in LLVM at all, so
  they emit the hexadecimal bit-pattern form LLVM accepts for a `double`
  (`0x7FF0000000000000`, `0xFFF0000000000000`, `0x7FF8000000000000`). These are three fixed
  strings, not a computation.

Alternatives considered:

- **Hex bit-pattern for every literal.** Unambiguous and trivially host-independent, and it was
  tempting. Rejected on two counts: it makes dumped IR unreadable (`0x4059000000000000` for
  `100.0`), against the transparency goal that `emit-dump-stages` exists to serve; and getting the
  bits of a double in the emitter needs a primitive that does not exist under the Chez host, where
  `src/emit.ss` is *evaluated*, not compiled.
- **Append `.0` when the text contains no `.`** — the one-line fix the issue floats. Rejected: it
  produces valid IR but leaves the text door-dependent (`100.0` vs `1.0e+02`), so it fixes the
  compile error and not the fidelity defect underneath it.

Verification is a door-parity test on a flonum-literal-heavy program (the existing
`dump-parity`/`repl-equiv` machinery), not just a compile-success test — the assertion that
matters is *identical IR text*, and no current test would notice its absence.

### D2 — `> <= >=` become value-only integrables; operator position is untouched

`>`, `<=`, `>=` are unbound as values because they are frontend rewrites: `expand-compare`
(`src/passes/expand.ss:350-383`) turns `(> x y)` into `(< y x)` and the inclusive forms into
`if`/`=` chains, and nothing puts the names in scope. `=` and `<` avoid this because they are in
`*integrable*`, whose names are unioned into `compute-known` (batch) and `*repl-known*` (REPL),
and whose entries carry a `cmp` fold-kind driving a value-position eta.

So the three names get `*integrable*` entries — but **eta-only** ones, marked as having no
direct-call lowering.

The marker is the point of the decision. An ordinary entry drives *two* things: the
value-position eta and direct-call inlining (`(op a b)` → `(primcall raw a b)`). A naive entry
`(> %< 2 cmp)` would make any surviving `(> a b)` call lower to `(primcall %< a b)` — **operands
silently reversed**. In practice no such call survives, because `expand-compare` consumes
operator position before `inline-primitives` runs and macro output is re-expanded; but that is an
invariant held by a *different pass*, and the failure mode is a wrong answer, not an error. An
eta-only entry removes the hazard by construction: `inline-primitives` has no reversed lowering
available, and a direct call it somehow meets is lowered by applying the eta, which is correct at
any arity.

The etas fold over the raw ops the frontend already uses — `%<` for `>` with operands swapped,
`%<` plus `%=` for `<=`/`>=`. Rather than three new hand-written fold kinds, `cmp-chain-eta` is
generalized to take the same pair-builder shape `cmp-pair` uses, so the chain shape has one
definition and the eta and the inline expansion cannot drift apart.

Consequences: no emitted IR changes for existing code (operator position lowers exactly as
today), a plain `make regen` rather than the staged two-step (no new primcall heads), and the
shadowed-n-ary limitation documented in `docs/PRIMITIVES.md:420` is inherited unchanged — not
made worse.

Alternatives considered:

- **A — new fold kinds on ordinary entries** (the issue's own suggestion). Same result, but keeps
  the operand-reversal hazard live. The marker costs a few lines and removes it.
- **C — make `>` `<=` `>=` real runtime primitives** (`rt_gt`, `rt_le`, `rt_ge`, `%>` `%<=` `%>=`,
  entries in `inline-arith-table` lowering to `icmp sgt`/`sle`/`sge` and `fcmp`). This is the more
  uniform design and it is *better code*: `(<= x y)` currently expands to `(if (< x y) #t (= x y))`
  — two comparisons and a temp for single evaluation — where a real `%<=` is one `icmp`. It also
  deletes the `cmp-pair` special cases. Rejected **for this change**, not on merit: it needs three
  new primcall heads (staged bootstrap), changes emitted IR at every `> <= >=` site in the tree
  (large regen churn plus re-recording `test/module-scaffold-baseline.sha256`), and modifies the
  `aot-codegen` inline-fast-path requirement, whose current text explicitly says the inclusive
  comparisons "reduce to `<`/`=` before emission". That is a codegen change wearing a conformance
  change's clothes. It should be its own item, and the two-comparison cost of `<=`/`>=` is worth
  recording in `docs/PERFORMANCE.md` when this lands.

### D3 — The integer-division family requires integer-valued arguments, uniformly

`rt_quotient` and `rt_remainder` apply `UNFIX` unconditionally, so a flonum or a symbol is
reinterpreted as a fixnum payload; `rt_integer_to_char` has the same shape and produces a junk
character for an out-of-range code point. `rt_modulo`, immediately below them, guards properly and
then does contagion via `fmod`.

All three get `rt_modulo`'s opening guard. The question the issue leaves open is what an
*integral flonum* means, and the answer here is uniform across all three procedures: **an
argument must be integer-valued; an integral flonum is accepted with contagion (inexact result),
and a non-integral flonum or a non-number traps.**

- `(quotient 7.0 2)` → `3.0`, `(remainder 7.0 2)` → `1.0`, `(modulo 7.0 2)` → `1.0`
- `(quotient 7.5 2)`, `(modulo 7.5 2)`, `(quotient 'a 2)` → trap

This is R7RS's reading: the family is defined on integers, and `integer?` is true of `7.0` and
false of `7.5`. Choosing contagion over "trap on any flonum" follows `rt_modulo`, which already
made that choice and is the only one of the three with settled behaviour.

Note the consequence: `(modulo 7.5 2)` returns `1.5` **today** and will trap after this change.
No spec scenario covers it (the requirement is scoped "for integers n and d"), and no correct
program can depend on it, but it is a behaviour change to a landed procedure and the tasks call it
out explicitly rather than letting it ride along in the diff.

`integer->char` separately rejects anything outside the Unicode scalar range — negative,
above `#x10FFFF`, or in the surrogate range `#xD800`–`#xDFFF`.

Alternative considered: **trap on every inexact argument** in all three. More conservative and
arguably tidier, but it contradicts the landed `modulo` and R7RS is satisfied by either, so it
would be churn for its own sake.

### D4 — The inventory is prelude Scheme; new primitives only where C is unavoidable

Of the ~40 missing procedures, nearly all are expressible over what exists: the predicates,
`abs`, `gcd`, `lcm`, `square`, `expt`, `exact-integer-sqrt`, the rounding family, the R7RS
division family, `numerator`/`denominator`, `string->number`, and `number->string`'s radix arm are
all Scheme over existing primitives. They go in `src/prelude.scm` and reach `(scheme base)`
through the generator.

New `%`-primitives are added only for what genuinely needs C: the libm entry points behind
`(scheme inexact)` (D5), and the flonum classification (`finite?`/`infinite?`/`nan?`) that cannot
be expressed without inspecting the double. This keeps the staged-bootstrap cost proportional to
the part that actually requires it, keeps the rest testable without a regen cycle, and keeps
`rt_*` as the single definition of numeric semantics only where semantics live in C.

The rounding family is the one place worth naming explicitly: `floor`/`ceiling`/`truncate`/`round`
on an *exact* argument are the identity (exact integers are already rounded), so only the flonum
arm needs work, and that arm needs C — `floor`/`ceil`/`trunc`/`rint` — rather than Scheme
arithmetic that would round-trip through the fixnum range and trap on large magnitudes. `round`
is round-half-to-**even** per R7RS §6.2.6, which is what `rint` gives under the default rounding
mode; the Scheme side must not reimplement it as `floor(x + 0.5)`.

### D5 — `(scheme inexact)` is a hand-written library over internal `%`-ops, in the default manifest

`(scheme base)` is *generated* from `src/prelude.scm` and *baked* into the compiler as the
`*prelude-source*` constant (`tools/regen.sh:66-73`), because it is auto-imported into every
program and REPL session. `(scheme inexact)` is neither: it is imported explicitly, so it is an
ordinary hand-written `lib/scheme/inexact.sld` resolved through `emit-libs.scm` — the first
non-`(scheme base)` entry in the default manifest.

Its twelve procedures wrap permanently-internal `%`-ops (`%sqrt`, `%exp`, `%log`, the trig
family, `%finite?`, `%nan?`), which is why `primitive-layer` needs no spec delta — the ops inherit
its requirements, and "raw `%`-ops staying internal" is an existing non-goal. Wrapping rather than
making them integrable also keeps `sqrt`/`sin`/`log` **out** of the universal namespace, where
they do not belong: an integrable is available without any import, and R7RS puts these behind
`(import (scheme inexact))`.

The manifest cost was measured rather than assumed, since `preload_user_libraries`
(`src/emit.cpp:200`) compiles every listed library eagerly at startup: `emit run` on a trivial
program takes 0.61s with the default one-entry manifest and 0.45s with the 12-entry test manifest
— i.e. the preload of a dozen small libraries is inside the noise, and one more small library is
not a startup regression.

Domain behaviour follows IEEE, not traps: `(sqrt -1.0)` and `(log -1.0)` are `+nan.0`,
`(log 0.0)` is `-inf.0`. Emit is real-only, so a complex result is unavailable and §6.2.3 permits
the inexact non-finite answer; trapping here would also be un-catchable, which is a worse outcome
than a NaN that `nan?` can test. `sqrt` of an exact perfect square returning an exact root is a
recognized R7RS nicety and is **not** done here — `(sqrt 4)` is `2.0`; `exact-integer-sqrt` in
`(scheme base)` is the exact-root procedure, and it returns two values through the landed
`multiple-values` machinery.

Alternative considered: **bake `(scheme inexact)` in beside the prelude.** Rejected — baking
exists because `(scheme base)` must work with no filesystem at all (`compiler-embedding`); a second
baked constant would grow every binary for a library most programs do not import, and would make
Emit's *second* library a special case instead of the proof that ordinary libraries work.

### D6 — Exactness and overflow policy for the new procedures

- The §6.2.3 exact-for-exact list is honored: `abs`, `ceiling`, `floor`, `gcd`, `lcm`, `max`,
  `min`, `round`, `square`, `truncate`, and the division family return exact results for exact
  arguments.
- `max`/`min` implement R7RS contagion: if **any** argument is inexact the result is inexact, so
  `(max 3 4.0)` is `4.0` and `(max 3.0 4)` is `4.0` — the second case is the one a naive
  implementation gets wrong, since the winning argument is exact.
- `expt` with an exact base and a non-negative exact integer exponent is exact (by repeated
  squaring, so `(expt 2 60)` is exact and `(expt 2 61)` traps on overflow); a negative exponent
  yields an inexact result rather than a rational, which is the same §6.2.3 licence `/` already
  uses. `(expt 0 0)` is `1`.
- Overflow anywhere in the new procedures traps through the existing `rt_fatalf` path — including
  `(abs FIXNUM_MIN)`, which is `2^60` and one past the range, and `lcm` of large arguments. This
  is `fixnum-overflow-trap` D1's rule inherited, not a new policy.
- `rational?` is true for a finite real and false for `+inf.0`/`+nan.0`; `complex?` is `number?`;
  `exact-integer?` is exact and integral.
- `numerator`/`denominator` are defined only on integer-valued arguments (`n`/`1`, or `n`/`1.0`
  for an integral flonum) and trap otherwise. R7RS defines them over rationals, which Emit does
  not represent; restricting them is the §6.2.3-sanctioned outcome and is better than a
  best-effort continued-fraction expansion of a double.

### D7 — `string->number` reuses the reader's classifier and returns `#f`

`string->number` must not be a second, independently-drifting numeric grammar. It reuses the
prelude reader's existing classifier and integer/flonum parsers (`rd-numeric?`, `rd-flonum?`,
`rd-parse-int`), returning `#f` — not an error — for anything that does not parse, per §6.2.6.
Radix support is via the optional argument: radix 2, 8, 10, 16 for exact integers; an inexact
result requires radix 10 and any other radix with a non-integer is an error, which §6.2.6 permits.
`number->string`'s radix argument is the same restriction mirrored.

Because the classifier is shared, the deferred `#x`/`#e` reader prefixes (#25) will land in one
place and `string->number` will inherit them — which is the reason for deferring them as a unit
rather than half-implementing prefixes here.

### D8 — The non-finite tokens land in both readers

There are two readers: the prelude's (`src/prelude.scm`, `rd-atom`/`rd-flonum?`) and the
bootstrap's (`src/parse.ss`, the `const` clause). They must agree or the doors disagree about what
a program *means* — a fidelity break of the same shape as #24. `+inf.0`, `-inf.0`, `+nan.0` are
three exact literal strings recognized in `rd-atom` before the flonum classifier runs, added to
both, with a door-parity test rather than a single-door test.

## Risks / Trade-offs

- **The IR-double canonicalization assumes the two printers agree on shortest-round-trip
  digits.** They should — shortest-round-trip digits are unique — but "should" is doing work here,
  and a disagreement would surface as door-divergent IR text rather than as a compile error.
  → The parity test in D1 covers a spread of literals chosen to hit the interesting cases
  (integral, exponent-requiring, subnormal, `1e308`, `5e-324`, values near the exponent window
  boundary), and it compares emitted text, not results.

- **Every module containing a flonum literal changes its emitted IR**, so
  `test/module-scaffold-baseline.sha256` drifts and the demos' IR hashes change.
  → Capture the before/after diff and confirm the drift is *only* flonum literal operands and
  `@.flo.lit.` globals before re-recording the baseline, as `emit-dump-stages` did for its
  `declare` lines.

- **The libm primitives need the staged two-step regen**, and a mis-sequenced regen fails as a
  non-converging fixed point rather than a clear error.
  → Follow `docs/PRIMITIVES.md`'s "Adding a permanently-internal `%`-op" staging exactly: tables +
  runtime + `*prims*` and regen first, call sites second, full dev suite at the end of each stage,
  committing `bootstrap/*.ll` at each stable point. Try the direct regen first (the D3 lesson
  recorded in `inline-fixnum-arith-and-self-calls`: two regens is a safe upper bound, not always
  required).

- **`(modulo 7.5 2)` changes from `1.5` to a trap** (D3).
  → Intended, unspecified today, and no correct program depends on it; called out as its own task
  with a test rather than folded silently into the guard task.

- **The change is broad — seven task groups.** A stall mid-change could leave the tree between
  states.
  → The groups are ordered so each is independently landable and verifiable: the emitter fix
  (group 1) touches nothing else, the guards (2) are runtime-only, the comparisons (3) need only a
  plain regen, the inventory (4) is prelude Scheme, and only `(scheme inexact)` (5) requires the
  staged bootstrap. Stopping after any group leaves a consistent tree with a coherent commit.

- **`(scheme base)`'s export surface grows by ~30 names**, making #29 worse before it is fixed.
  → Accepted and explicit: the inventory is the reason to do #29 next, and the new names are the
  *standard* ones, so a curated list will keep all of them. The extension/internal split #29
  addresses is unaffected in kind.

- **Binary size grows** with the prelude inventory.
  → The AOT tree-shake removes unreferenced library bindings, so a program that uses none of the
  new procedures should be unchanged. Verify that claim by measuring a demo's binary before and
  after rather than assuming it, and record the numbers in `docs/PERFORMANCE.md` if the shake
  turns out to leak.

## Migration Plan

1. **Emitter (D1)** — the `ir-double` formatter and both literal sites, then a plain regen; verify
   the door-parity test and re-record the IR baseline with a reviewed diff.
2. **Runtime guards (D3)** — `rt_quotient`/`rt_remainder`/`rt_integer_to_char`; runtime-only, no IR
   change, testable immediately.
3. **Comparisons and `max`/`min` (D2, D6)** — `*integrable*` entries plus the generalized eta, and
   the variadic prelude procedures; plain regen.
4. **Inventory (D4, D6, D7)** — prelude Scheme, regenerate `lib/scheme/base.sld`, with the
   generator guard (`test/scheme-base-gen-check.sh`) proving the checked-in copy matches.
5. **Reader tokens (D8)** — both readers plus the parity test.
6. **`(scheme inexact)` (D5)** — staged bootstrap for the libm ops, then the `.sld` and the
   manifest entry.
7. **Specs, docs, catalogue** — sync the deltas, update `docs/PRIMITIVES.md` and `docs/MODULES.md`,
   refresh `docs/COMPLEXITY.md`, and reference #23 #24 #25 #26 #27 from the commits.

Rollback is per-group: each group is a separate commit with its own tests, and no later group
depends on an earlier one except through the regenerated bootstrap.

## Open Questions

- **The exponent window for canonical IR doubles** (D1) — where to switch from positional to
  exponent notation. Any fixed choice satisfies LLVM and fidelity; the only stake is dumped-IR
  readability and IR size. Resolve at implementation with a look at what the flonum demos emit;
  the window must be a stated constant, not a consequence of whichever printer ran.
- **Whether `exact-integer-sqrt` in prelude Scheme returns its two values cleanly** through the
  landed `multiple-values` machinery, or wants a primitive. Expected to work as Scheme; confirm
  before writing the requirement's scenario so the spec does not describe an untested shape.
- **Whether any of the ~30 new prelude procedures shadow a name the compiler's own source uses
  internally** with different semantics (the compiler is compiled against its own prelude). A
  grep-level check before implementation, not a design question — but a silent capture here would
  surface as a self-hosting failure, so it belongs on the checklist.
