## 1. Decide the diagnostic

- [x] 1.1 Settle the trap message format (design Open Question 1): **operation plus
      operands**, e.g. `*: fixnum overflow: 1000000000000 * 1000000000`. Formatted
      by a `vsnprintf` variant of `rt_fatal` writing into the existing 128-byte
      static buffer — no allocation and no custom formatter needed (two 61-bit
      decimals plus an operator name fit comfortably).
- [x] 1.2 Confirm the reader's out-of-range-literal diagnostic is the plain
      arithmetic trap (design Open Question 2). **Confirmed** — D4 stands; the
      reader gets no explicit range check and inherits the behaviour from `+`/`*`.

## 2. Runtime checks (no IR change; testable on their own)

- [x] 2.1 Add overflow checks to `rt_add`, `rt_sub`, `rt_mul`
      (`src/runtime/runtime.c:199-213`) using `__builtin_add_overflow` /
      `__builtin_sub_overflow` / `__builtin_mul_overflow` on the untagged values,
      plus a range check before `FIX`. Trap via `rt_fatal` with the message from
      1.1. This also retires the latent C signed-overflow UB in these functions.
- [x] 2.2 Add the fixnum-range check to `rt_quotient` (`runtime.c:231-235`) and to
      the exact/exact arm of `rt_div` (`runtime.c:218-228`) for the most-negative-
      fixnum ÷ `-1` case (design D6). Leave `rt_modulo` and `rt_remainder` alone —
      verify by test that they are in range for every input.
- [x] 2.3 Replace the unchecked `FIX((intptr_t)d)` in `rt_inexact_to_exact`
      (`runtime.c:1241-1248`) with a fixnum-range check that traps outside the
      range, so no out-of-range floating-point-to-integer cast is performed
      (design D5).
- [x] 2.4 Verify the runtime half in isolation: with the emitter unchanged, the
      checks fire on the paths that reach `rt_*` today (non-fixnum operands,
      `quotient`, `/`, `inexact->exact`), and the whole existing test suite still
      passes.

## 3. Emitter overflow edge

- [x] 3.1 Add `declare` lines for `@llvm.sadd.with.overflow.i64`,
      `@llvm.ssub.with.overflow.i64`, and `@llvm.smul.with.overflow.i64` to the
      emitted module preamble alongside the existing `rt_*` externs.
- [x] 3.2 Extend `emit-inline-fast` (`src/emit.ss:435-451`) so the `add` and `mul`
      kinds emit the checked intrinsic and `extractvalue` both the result and the
      overflow bit, operating on the tagged words exactly as today (design D2 — no
      added shifts). Leave the `cmp` kind untouched.
- [x] 3.3 Extend `emit-inline-arith` (`src/emit.ss:453-476`) so the fast arm
      branches on the overflow bit into the **existing** slow block (design D3),
      keeping the phi's fast-arm incoming edge from the non-overflow block. Do not
      add a trap block. Preserve the `let*` discipline so temp/label numbering
      stays independent of host argument-evaluation order.
- [x] 3.4 Inspect the emitted IR for a small program (`--dump`) and confirm the
      diamond has the intended shape: tag test and overflow test both reaching one
      `rt_*` call, one phi, no duplicated slow path.

## 4. Self-hosting and the fixed point

- [x] 4.1 Run `make regen` and drive the fixed point to convergence. No new
      primcall heads are introduced, so this is a plain regen, not the staged
      two-step.
- [x] 4.2 If the compiler traps while compiling itself, fix the offending
      arithmetic rather than weakening the check (design Risk 2) — that is the
      strongest test this change has.
- [x] 4.3 Confirm byte-identical backends and re-run `test/self-host-fixpoint.sh`
      and `test/self-emit-equiv.sh`.
- [x] 4.4 Re-record `test/module-scaffold-baseline.sha256` — this change alters the
      IR of every demo with fixnum arithmetic, which is intended. Follow the
      script's protocol: diff a before/after capture, confirm the drift is exactly
      the overflow diamond (plus the three new declares per module), and log the
      re-record in the script header with those numbers.

## 5. Tests and demo

- [x] 5.1 Add a test script (or extend an existing numeric one) covering: `+`, `-`,
      `*` overflow at both bounds; in-range boundary values that must NOT trap
      (`(+ 1152921504606846974 1)`); `(- 0 min-fixnum)`; `(quotient min-fixnum -1)`
      and `(/ min-fixnum -1)`; `(modulo min-fixnum -1)` and
      `(remainder min-fixnum -1)` still returning `0`; `inexact->exact` of `1e30`
      and of `(exact->inexact 1152921504606846975)`.
- [x] 5.2 Add the out-of-range source literal case (`1152921504606846976` in
      program text) and confirm it is a diagnostic, not a wrapped value.
- [x] 5.3 Register the suite in `run-all-tests.sh` and confirm it runs on both
      backends, with the standalone executable exiting nonzero and the in-process
      runner surviving the trap.
- [x] 5.4 Add a `demos/` program exercising the boundary — in-range arithmetic at
      the limits producing exact values — and register it in `demos/run-tests.sh`
      on both backends. Keep the demo itself trap-free; the traps belong in the
      test script.

## 6. Measure

- [x] 6.1 Measure the Ackermann benchmark from `docs/PERFORMANCE.md` P5 before and
      after, under `emit run` and AOT.
- [x] 6.2 Measure the committed binary sizes before and after.
- [x] 6.3 Record both in `docs/PERFORMANCE.md` under P5, noting that this completes
      P5 option A's specified-but-unimplemented overflow guard. If the size
      regression is large, note it as a follow-up on the lowering — not a reason to
      drop the check.

## 7. Documentation

- [x] 7.1 Update `README.md:311` so the numeric-tower bullet states the overflow
      behaviour alongside "no bignums or exact rationals".
- [x] 7.2 Note in the README (or the R7RS conformance notes) that this is the
      sanctioned §6.2.3 "report a violation of an implementation restriction"
      outcome, and that it is an implementation restriction rather than a permanent
      language limitation.
- [x] 7.3 Run `openspec validate fixnum-overflow-trap --strict`. (Spec sync into
      `openspec/specs/` happens at archive time, not here.)
