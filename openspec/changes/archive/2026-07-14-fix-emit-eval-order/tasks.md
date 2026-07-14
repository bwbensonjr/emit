## 1. Failing regression (TDD)

- [x] 1.1 Added `test/self-emit-equiv.sh`: for probe programs (plain call, nested call, closure
      with captures, `letrec` recursion, `apply`), compile with `chez … --emit-ir --no-prelude`
      and with `build/schemec`, and `diff`. RED before the fix — all 5 differed (temp order).

## 2. Fix emission order

- [x] 2.1 `src/emit.ss`: `let*`-bind operands (`map … args`) then callee (`ev f`) at the four
      `app`/`apply-app` sites in `ev` and `et`, so the call shape no longer depends on host
      argument-evaluation order.
- [x] 2.2 Audit (design D2 RESULT): found a **second class** — parallel `let` bindings whose
      inits call `fresh-temp`/`fresh-bb` (unspecified order; Chez right-to-left vs scheme-llvm
      left-to-right). Converted five sites to `let*` (`emit-alloc-closure`, `emit-load-code`,
      `emit-make-closure` helper, `emit-spill`, `emit-arity-check`). Single-`fresh-temp` and
      single-`map` sites confirmed safe.

## 3. Verification

- [x] 3.1 `test/self-emit-equiv.sh` — all 5 probes byte-identical (schemec IR == Chez-hosted IR).
- [x] 3.2 `demos/fact.scm` via `build/schemec` is byte-identical to
      `chez … --emit-ir --no-prelude` (98 lines).
- [x] 3.3 `./run-all-tests.sh` — all suites pass. (The `let*` conversions renumber temps in the
      Chez-hosted `.ll` too, but the suite checks values and AOT/JIT/bitcode agreement, not `.ll`
      text, so it stays green; wired `test/self-emit-equiv.sh` into `run-all-tests.sh`.)

## 4. Hand off

- [x] 4.1 Hand back to [[self-hosting-bootstrap]] task 3: emission is now deterministic and
      host-independent (probes + `fact.scm` byte-identical). The core triple test (compile the
      assembled core with `schemec`; require stage-1 IR == stage-2 IR) is now attemptable —
      chase any residual diff to a remaining eval-order/nondeterminism site. Recorded in
      self-hosting-bootstrap §2.
