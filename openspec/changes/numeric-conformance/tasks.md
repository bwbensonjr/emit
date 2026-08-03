## 1. Flonum literals in IR (#24, design D1)

- [x] 1.1 Resolve the open question on the canonical exponent window: dump the IR for the flonum
      demos and pick the positional/exponent switch points, recording them as named constants in
      `src/emit.ss` with a comment stating the choice is fixed by decision, not by the host printer.
- [x] 1.2 Confirm the digit assumption before relying on it: for a spread of doubles (integral,
      exponent-requiring, 17-significant-digit, subnormal, `1e308`, `5e-324`), compare Chez's
      `number->string` output with Emit's `%flonum->string` and record that the digit strings agree
      and only the framing differs. If any digits disagree, stop and revisit D1 before writing code.
- [x] 1.3 Write the canonical `ir-double` formatter in `src/emit.ss`: decompose the host's shortest
      round-trip decimal into sign / digits / decimal exponent with string operations only, and
      re-emit the canonical spelling (exactly one `.`, at least one digit each side, exponent only
      outside the 1.1 window, no `+` in the exponent).
- [x] 1.4 Add the three fixed non-finite cases to the formatter, emitting LLVM's hexadecimal
      bit-pattern form (`0x7FF0000000000000`, `0xFFF0000000000000`, `0x7FF8000000000000`).
- [x] 1.5 Route the unboxed region emitter (`src/emit.ss:606`, the `fmul double` operand path)
      through `ir-double`, replacing the bare `(number->string d)`.
- [x] 1.6 Route the boxed literal path (`src/emit.ss:183`, the `@.flo.lit.` C string rebuilt by
      `rt_flonum_lit`) through the same formatter, so the two sites cannot drift and the string
      constant's contents stop being door-dependent.
- [x] 1.7 Verify the reported symptom on every door: `(* 100.0 2.0)`, `(+ 1e15 1.0)`,
      `(* 1e308 10.0)`, `(+ 1e16 1.0)`, and `(* 2.5 2.0)` compile and produce correct results under
      `emit run`, `emit repl`, `emit build`, and the Chez-hosted AOT path.
- [x] 1.8 Add a **door-parity** test asserting the emitted IR *text* is identical between the
      Chez-hosted driver and the self-hosted compiler for a flonum-literal-heavy program covering
      the 1.2 spread — the assertion is byte equality of IR, not equality of results.
- [x] 1.9 Add a value-fidelity test: a 17-significant-digit literal round-trips bit-identically
      from source through IR to runtime value.
- [x] 1.10 `make regen` (plain — no new primcall heads), confirm the self-host fixed point
      converges and the backends stay byte-identical.
- [x] 1.11 Capture the emitted-IR diff for the demos, confirm the drift is *only* flonum literal
      operands and `@.flo.lit.` globals, then re-record `test/module-scaffold-baseline.sha256`.

## 2. Integer-division and code-point guards (#23, design D3)

- [x] 2.1 Give `rt_quotient` and `rt_remainder` (`src/runtime/runtime.c`) `rt_modulo`'s opening
      guard plus an integrality check: non-number or non-integral flonum traps with a message
      naming the operation; integral flonum takes the contagion path and returns a flonum.
- [x] 2.2 Add the same integrality check to `rt_modulo`, so all three agree — this changes
      `(modulo 7.5 2)` from `1.5` to a trap. Land it as its own reviewed step with a test, not as a
      side effect of 2.1.
- [x] 2.3 Range-check `rt_integer_to_char`: reject a negative code point, anything above
      `#x10FFFF`, and the surrogate range `#xD800`–`#xDFFF`, with a diagnostic rather than a junk
      character.
- [x] 2.4 Confirm no emitter work is needed — verify `quotient`/`remainder`/`modulo` are absent
      from `inline-arith-table`, so the runtime guard is the only path.
- [x] 2.5 Tests: the issue's reproductions (`(quotient 7.0 2)`, `(remainder 7.0 2)`,
      `(quotient 'a 2)`, `(integer->char 1152921504606846975)`) plus the accepted integral-flonum
      cases and the retained exact behaviour for `(quotient -17 5)` / `(remainder -17 5)`.
- [x] 2.6 Run the full suite: no IR change, so `run-all-tests.sh` and `run-dev-tests.sh` should pass
      without a regen.

## 3. First-class comparisons and variadic max/min (#26, design D2/D6)

- [x] 3.1 Generalize `cmp-chain-eta` (`src/parse.ss`) to build its pairwise test from the same
      pair-builder shape `cmp-pair` (`src/passes/expand.ss`) uses, so the chain shape has one
      definition shared by the frontend expansion and the value-position eta.
- [x] 3.2 Add the **eta-only** entry marker to `*integrable*` and teach `eta-integrable` /
      `inline-primitives` to honor it: such an entry supplies a value-position procedure and has
      **no** direct-call lowering, so a bare direct call is lowered by applying the eta rather than
      by substituting the underlying primitive (which would reverse `>`'s operands).
- [x] 3.3 Add the eta-only entries for `>`, `<=`, `>=` over `%<` and `%=`, and confirm
      `(map car *integrable*)` flowing into `compute-known` and `*repl-known*` binds the three
      names on both doors.
- [x] 3.4 Verify operator position is byte-for-byte unchanged: compile a program using
      `> <= >=` in operator position before and after, and diff the emitted IR to prove no drift.
- [x] 3.5 Make `max` variadic in `src/prelude.scm` and add `min`, both with R7RS contagion —
      inexact result whenever *any* argument is inexact, including when the winning argument is
      exact — trapping on a non-numeric argument and erroring on zero arguments.
- [x] 3.6 Tests: `(map > …)`, `(apply >= …)`, `(apply <= …)`, `(max 1 2 3)`, `(min 1 2)`,
      `(max 3 4.0)`, `(max 3.0 4)`, `(min 3 4.0)`, `(apply max …)`, `(map min … …)`, and the
      operator-position results for all five comparisons.
- [x] 3.7 Check macro hygiene: a `syntax-rules` template mentioning `>` or `<=` must treat it as a
      known binding (the reason `*repl-known*` unions the integrable names) and must not rename it
      to an unbound `>.0`.
- [x] 3.8 `make regen` (plain) and confirm convergence; regenerate `lib/scheme/base.sld` and run
      `test/scheme-base-gen-check.sh`.

## 4. One staged primitive addition, for every new `%`-op the change needs

RESTRUCTURED during implementation (was: the libm ops staged separately inside group 6).
Writing group 4 revealed that the *rounding* family needs C too — design D4 requires
`floor`/`ceil`/`trunc`/`rint` rather than Scheme arithmetic that would route a large
magnitude through the fixnum range — and that `rational?` needs a finiteness test. So the
change needs new primitives in THREE places, not one. Adding them in three staged regens
would mean three fixed-point cycles, three IR-baseline re-records, and (for `rational?`)
writing a temporary arithmetic version to delete later. One staging serves all of it.

- [x] 4.1 Stage 1a — add the runtime C functions for all three groups to
      `src/runtime/runtime.c`: rounding (`rt_flo_floor`, `rt_flo_ceiling`, `rt_flo_truncate`,
      `rt_flo_round` — `rint` for round-half-to-even, NOT `floor(x+0.5)`), classification
      (`rt_finite_p`, `rt_nan_p`), and the libm wrappers behind `(scheme inexact)`
      (`rt_sqrt`, `rt_exp`, `rt_log`, `rt_sin`, `rt_cos`, `rt_tan`, `rt_asin`, `rt_acos`,
      `rt_atan`, `rt_atan2`, `rt_pow`). Each accepts an exact or inexact argument and returns
      a flonum; out-of-domain follows IEEE (NaN/infinity), never a trap.
- [x] 4.2 Stage 1b — their `prim-table` entries and `declare` lines in `src/emit.ss`, and the
      `%`-names in `*prims*` (`src/parse.ss`). No call sites yet, so the current seed compiles
      all of it. They are permanently-internal `%`-ops: none enters `*integrable*`, which is
      what keeps `sqrt`/`sin`/`log` out of the universal namespace where R7RS does not put them.
- [x] 4.3 `make regen` so the committed seed learns the new primcall heads; confirm the fixed
      point converges. Try the direct regen first (the D3 lesson: two regens is a safe upper
      bound, not always required).
- [x] 4.4 Re-record `test/module-scaffold-baseline.sha256` for the new `declare` lines, with a
      before/after capture proving the drift is ONLY those lines (they land in every module's
      header, so expect the per-demo line count to grow by the number of new prims times the
      two headers per demo IR).
- [x] 4.5 Full dev suite, then commit `bootstrap/*.ll` at this stable point and re-run
      `test/trust-check.sh` (it skips while `bootstrap/` is dirty).

## 5. The (scheme base) numeric inventory (#27, design D4/D6/D7)

- [x] 5.1 Pre-flight check: grep the compiler's own source for each of the ~30 new prelude names to
      confirm none is used internally with different semantics — the compiler compiles against its
      own prelude, so a silent capture would surface as a self-hosting failure.
      RESULT: clean, with one thing to respect. Only `expt` appears at all, once, at
      `src/compile.ss:485` — `(- (expt 2 64) 1)`, an FNV mask that REQUIRES bignums and would
      overflow-trap under Emit's exact integers. It is safe because `compile.ss` is the
      Chez-only driver: the `CORE_FLAT` assembly in `tools/regen.sh` never includes it
      (`src/compile.ss:26-29`), so Emit never compiles that expression and it keeps resolving to
      Chez's own `expt`. The new prelude `expt` must not be routed into it. No other name
      collides; `demos/exact-range.scm` matched only as `round-trip`.
- [x] 5.2 Predicates in `src/prelude.scm`: `complex?`, `rational?` (finite real), `exact-integer?`,
      `positive?`, `negative?`, `odd?`, `even?` — with the integrality requirement on the parity
      predicates and a trap for a non-numeric argument.
- [x] 5.3 `abs`, `square`, and variadic `gcd`/`lcm` (identities `0` and `1`, non-negative results),
      exact for exact arguments, with `(abs FIXNUM_MIN)` and large `lcm` reaching the overflow
      diagnostic rather than wrapping.
- [x] 5.4 `expt`: exact by repeated squaring for an exact base and non-negative exact integer
      exponent; inexact for a negative exponent; `(expt 0 0)` = `1`; overflow traps.
- [x] 5.5 `exact-integer-sqrt` returning two values — resolve the design's open question by
      confirming the landed `multiple-values` machinery supports this from prelude Scheme before
      committing to the shape.
- [x] 5.6 The rounding family: `floor`, `ceiling`, `truncate`, `round` — identity on exact
      arguments, flonum arm in C (`floor`/`ceil`/`trunc`/`rint`) so a large magnitude does not
      route through the fixnum range, and `round` half-to-**even** (not `floor(x + 0.5)`).
- [x] 5.7 The R7RS division operators over the existing primitives: `truncate-quotient`,
      `truncate-remainder`, `floor-quotient`, `floor-remainder`, and the two-value `truncate/` and
      `floor/`, all inheriting group 2's argument-domain rules.
- [x] 5.8 `numerator` / `denominator` restricted to integer-valued arguments, trapping otherwise.
- [x] 5.9 The R7RS conversion spellings `exact` and `inexact` as equivalents of
      `inexact->exact` / `exact->inexact`, retaining the R5RS names.
- [x] 5.10 `number->string` radix argument (2/8/10/16 for exact integers; non-decimal radix with an
      inexact argument is an error) and `string->number` reusing the reader's classifier and
      parsers, returning `#f` on failure.
- [x] 5.11 Tests for every scenario in the `core-language` delta, including the exactness
      assertions (`(exact? (round 5))`, `(exact? (gcd 32 -36))`), the overflow traps, and the
      `string->number` / `number->string` round trips.
- [x] 5.12 Regenerate `lib/scheme/base.sld`, run `test/scheme-base-gen-check.sh`, and measure a
      demo's binary size before and after to confirm the AOT tree-shake keeps an unrelated program
      unchanged — record the numbers in `docs/PERFORMANCE.md` if it leaks.
      RESULT: the shake keeps it BYTE-IDENTICAL (34,968 B for a `fib` program at 5d38be0, at the
      staging commit, and after the inventory — it removes 100% of the growth). `emit build` grew
      +19,808 B (+14.7%) because that door has no shake, which is the known P8; quantified there
      with the three-commit table. A second finding recorded as a NEW P9: `number->string` became
      variadic for the optional radix, and a rest-parameter callee cannot use the cross-unit
      direct-call convention, so every call site goes indirect — measured +22% on a
      number->string-dominated loop. Not worked around here, since the right fix covers every
      variadic callee.
- [x] 5.13 `make regen` and confirm the fixed point converges with the enlarged prelude.

## 6. The non-finite reader tokens (#25, design D8)

- [ ] 6.1 Recognize `+inf.0`, `-inf.0`, `+nan.0` in `rd-atom` (`src/prelude.scm`) before the flonum
      classifier runs, as three exact literal-string cases.
- [ ] 6.2 Make the same three tokens numbers in the bootstrap reader's `const` path
      (`src/parse.ss`), so the two readers agree on what a datum means.
- [ ] 6.3 Tests: `(number? (read-from-string "+inf.0"))` and its two siblings; the
      write→read round trip through `(/ 1.0 0.0)`; and a door-parity check that both readers produce
      the same datum for the same source.
- [ ] 6.4 Confirm the deferred half of #25 is untouched and still reported clearly: `#x1f`, `#e1.0`,
      and `1/2` behave as they do today (no silent change), and the issue records what remains.

## 7. The (scheme inexact) library (design D5)

- [ ] 7.1 Write `lib/scheme/inexact.sld` by hand — `finite?`, `infinite?`, `nan?`, `exp`, `log`
      (optional base), `sin`, `cos`, `tan`, `asin`, `acos`, `atan` (optional second argument),
      `sqrt` — as thin wrappers over the `%`-ops, each accepting exact or inexact arguments and
      returning an inexact result.
- [ ] 7.2 Add the `(scheme inexact)` entry to `emit-libs.scm` — the first non-`(scheme base)`
      library in the default manifest.
- [ ] 7.3 Verify the library on all three doors: `emit run`, `emit repl`, and an `emit build`
      executable, each importing `(scheme inexact)` and agreeing on results.
- [ ] 7.4 Verify the negative cases: without the import, `sqrt` is an unbound variable; and a
      program defining its own `sqrt` without the import uses its own.
- [ ] 7.5 Tests for the IEEE domain behaviour — `(sqrt -1.0)`, `(log -1.0)`, `(asin 2.0)` are NaN
      and `nan?`-detectable; `(log 0.0)` and `(exp 1000.0)` are infinities and `infinite?`-detectable
      — plus `(sqrt 4)` being the flonum `2.0` and not the exact `2`.
- [ ] 7.6 Measure `emit run` startup on a trivial program before and after the manifest entry, to
      confirm the eager preload cost stays inside the noise as D5 measured.
- [ ] 7.7 Regen for the library's call sites (the primitives were already staged in group 4, so
      this is the stage-2 half), full dev-suite run, and re-run the trust-check after committing.

## 8. Specs, docs, and issue hygiene

- [ ] 8.1 Sync the delta specs into `openspec/specs/` (`core-language`, `aot-codegen`, and the new
      `inexact-math`) and validate.
- [ ] 8.2 Document the new primitives in `docs/PRIMITIVES.md` — the libm `%`-ops in the
      permanently-internal section, and the eta-only integrable marker in the value-position eta
      section (§5), including why `>` must not get a direct-call lowering.
- [ ] 8.3 Update `docs/MODULES.md`: `(scheme inexact)` as a second standard library, the default
      manifest now carrying two entries, and the distinction between baked-in `(scheme base)` and a
      manifest-resolved standard library.
- [ ] 8.4 Record in `docs/PERFORMANCE.md` that `<=`/`>=` still cost two comparisons in operator
      position (design D2's rejected alternative C), so the real-primitive option is captured with
      its rationale rather than lost.
- [ ] 8.5 Refresh `docs/COMPLEXITY.md` via the complexity-catalogue skill.
- [ ] 8.6 Close #23, #24, #26 and the non-finite-token half of #25; update #25 to cover only the
      deferred reader prefixes and rational syntax; update #27's inventory table to what remains
      (`rationalize`, radix/exactness prefixes) and note #29 is now the next surface item.
- [ ] 8.7 Reference the issues from the fixing commits (`Fixes #N`), one commit per task group.
