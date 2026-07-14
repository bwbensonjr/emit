## Why

Building stage-1 `schemec` ([[self-hosting-bootstrap]] task 2.1) surfaced a self-application
miscompilation, distinct from the already-fixed [[fix-high-arity-call-convention]] `tailcc`
bug. The native `schemec` (compiler compiled by scheme-llvm, `fastcc`) compiles **closure-free**
programs byte-identically to the Chez-hosted compiler (`(+ 1 2)`, `42`, `(if …)`, `(quote …)`),
but fails on **any program that produces a closure**:

- `lambda`, `let`, `letrec`, and define-of-procedure programs abort with
  `arity error: expected 2 argument(s), got 3` — raised inside `schemec`'s **own** execution
  while it compiles the input (a 2-parameter function in `schemec`'s closure-handling path is
  called with 3 arguments).
- a recursive `letrec` (e.g. `demos/fact.scm`) **segfaults**.

The Chez-hosted scheme-llvm compiles closure/`let`/`letrec`/recursion programs correctly (the
demo suite — `toplevel`, `counter`, `named-let-loop`, etc. — passes on all three backends), so
these are **miscompilations that appear only under self-compilation**: some construct in the
compiler's own closure path (a pass such as `convert-closures`, or closure emission, or the
call shape for closure bodies) is compiled incorrectly by scheme-llvm. The gap-sweep only ever
verified that `schemec` *produces parseable IR*, never that it *runs correctly*, which is why
this was latent.

This change roots out and fixes the closure miscompilation so `schemec` can compile
closure-bearing programs — a prerequisite for the stage-1 build and the byte-identical triple
test.

## What Changes

- **Root-cause by bisection**: reduce the failure to a minimal program (closure form + whatever
  additional context is needed) that, compiled by scheme-llvm and run, reproduces
  `expected 2, got 3` (mirroring how [[fix-high-arity-call-convention]] was bisected). Identify
  the exact miscompiled construct / pass.
- **Fix the miscompilation** at its root in the relevant pass or emitter, keeping the existing
  behavior for the (already-correct) demo programs.
- **Determine whether the recursive-`letrec` segfault is the same root cause**; if it is, it is
  fixed here, otherwise it is scoped as a follow-up.
- **Regression test**: a demo/harness case that compiles a closure/recursion program *with the
  self-built `schemec`* (or an equivalent construct that reproduces the bug through the
  Chez-hosted compiler) and checks the result, so the class stays covered.

## Capabilities

### New Capabilities
<!-- none -->

### Modified Capabilities
- `aot-codegen`: Emitted code for closures (and the calls into/among closure bodies) is correct
  regardless of program scale — in particular, the compiler compiling itself (`schemec`) yields
  correct code for `lambda`/`let`/`letrec`/recursion, not only for the small closure programs
  the demo suite exercises.

## Impact

- **Code**: the miscompiled pass/emitter in `src/passes/*` or `src/emit.ss` (exact site TBD by
  root-cause); a regression demo/test.
- **Unblocks**: [[self-hosting-bootstrap]] task 2.1 (a functionally correct `schemec`) and hence
  2.2/2.3 and the triple test.
- **Related**: the recursive-`letrec` segfault — confirmed same-or-separate during root-cause.
- **Risk**: a codegen fix validated against the full suite plus the new self-compiled case.
