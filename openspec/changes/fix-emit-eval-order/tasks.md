## 1. Failing regression (TDD)

- [ ] 1.1 Add a byte-identical harness (e.g. `test/self-emit-equiv.sh`): for a set of probe
      programs (a plain call, a nested call `(f (g x))`, a closure with captures, a `letrec`
      recursion, an `apply`), compile with `chez … compile.ss --emit-ir --no-prelude` and with
      `build/schemec`, and `diff` the outputs. Confirm it FAILS before the fix (temp-order diff,
      e.g. on `demos/fact.scm`).

## 2. Fix emission order

- [ ] 2.1 In `src/emit.ss`, rewrite the four call/apply sites (`ev` and `et`, plain `call` and
      `apply`) to `let*`-bind the operands (`map … args`) and the callee (`ev f`) in a fixed
      order — **operands-first** to match the current Chez-hosted output — then call
      `emit-app`/`emit-apply`. No host-argument-order dependence remains.
- [ ] 2.2 Audit the emitter for any other site passing two or more `fresh-temp`/`emit!`-producing
      expressions as arguments to one call; sequence any found with `let*`/`seq`. Record the
      audit result in design.md (D2).

## 3. Verification

- [ ] 3.1 The byte-identical harness (1.1) passes: `schemec` IR == Chez-hosted IR for every probe.
- [ ] 3.2 `demos/fact.scm` via `build/schemec` is byte-identical to
      `chez … compile.ss --emit-ir --no-prelude`.
- [ ] 3.3 Run `./run-all-tests.sh`; all suites pass (values and AOT/JIT/bitcode agreement
      unchanged — operands-first keeps the Chez-hosted IR stable).

## 4. Hand off

- [ ] 4.1 Hand back to [[self-hosting-bootstrap]] task 3: with deterministic emission, attempt
      the core triple test (compile the assembled core with `schemec`; require stage-1 IR ==
      stage-2 IR byte-for-byte), chasing any residual diff to a remaining eval-order or
      nondeterminism site.
