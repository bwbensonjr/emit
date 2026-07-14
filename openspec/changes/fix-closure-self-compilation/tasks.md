## 1. Root-cause (bisection, before any fix)

- [ ] 1.1 Reduce to a minimal failing program (start from `((lambda (x) x) 5)`) and confirm it
      reproduces `arity error: expected 2, got 3` through `build/schemec`.
- [ ] 1.2 Bisect which pipeline stage in `schemec` mishandles the closure: build small variants
      of the assembled core whose entry runs one stage on a closure input (the `build/…scm` +
      `--emit-ir` + link technique used for fix-high-arity-call-convention), narrowing to the
      failing stage (likely `convert-closures` or closure emission in `emit.ss`).
- [ ] 1.3 Within that stage, find the specific construct scheme-llvm miscompiles (the arity
      error says a 2-arg function is entered with `argc = 3` — locate where a call is shaped or
      an arg count computed in the closure path). Record the root cause in design.md.

## 2. Fix

- [ ] 2.1 Write a failing regression demo/test that reproduces the miscompilation (TDD red) —
      the minimal closure program, run through the self-built `schemec` (or an equivalent that
      exposes the same bug via the Chez-hosted compiler).
- [ ] 2.2 Fix the miscompiled construct at its root in the relevant pass / emitter; keep the IR
      for the already-correct demos unchanged.

## 3. Verification

- [ ] 3.1 The minimal repro is green: `build/schemec` compiles `((lambda (x) x) 5)`, a `let`, a
      `define`-of-procedure, and a `letrec` program, emitting IR byte-identical to the
      Chez-hosted compiler.
- [ ] 3.2 Re-test the recursive `letrec` (`demos/fact.scm`) through `schemec`; if still crashing,
      record it and scope a follow-up change (design D3).
- [ ] 3.3 Run `./run-all-tests.sh`; all suites pass (no regression on the currently-correct
      closure demos).

## 4. Hand off

- [ ] 4.1 Hand back to [[self-hosting-bootstrap]] task 2.1: rebuild `build/schemec` and resume
      the stage-1 build / driver verification (2.2/2.3) and the triple test.
