## Why

With brackets, closures, and high-arity calls fixed, the native `schemec` now compiles real
programs to **correct, runnable** IR — but **not byte-identical** to the Chez-hosted compiler.
For `demos/fact.scm` the two agree except that temporaries come out in a different order:

```
schemec:   %t6 = and i64 %self, -8   …   %t8 = call i64 @rt_sub(i64 %a0, i64 8)   (callee first)
chez:      %t4 = call i64 @rt_sub(…) …   %t8 = and i64 %self, -8                  (argument first)
```

Root cause: the emitter evaluates a call's sub-parts as **function-call arguments**, so their
order follows the *host's* argument-evaluation order. In `src/emit.ss`:

```scheme
(emit-app  (ev f env cp tc?) (map (lambda (a) (ev a env cp tc?)) args) #f tc?)
(emit-apply (ev f env cp tc?) (map (lambda (a) (ev a env cp tc?)) args) #t tc?)
```

Chez evaluates arguments right-to-left, so `(map … args)` (the operands) is emitted before
`(ev f …)` (the callee); scheme-llvm evaluates left-to-right, so the callee is emitted first.
Each order calls `fresh-temp` in a different sequence → different temp numbers and instruction
order. The IR is semantically identical (SSA), but **not byte-identical**, which breaks the
self-hosting fixed point (the triple test, [[self-hosting-bootstrap]] task 3). This is the
design's long-standing open question — "does any pass rely on Chez evaluation order?" — made
concrete.

## What Changes

- **Make emission order host-independent** by sequencing the sub-emissions explicitly with
  `let*` at the four call/apply sites in `src/emit.ss` (`ev` and `et`, tail and non-tail), so
  the operands and callee are emitted in a fixed order regardless of host argument-evaluation
  order. Choose **operands-first** (matching today's Chez-hosted output), so the Chez-hosted IR
  is unchanged and only `schemec`'s output moves to match it.
- **Audit the emitter for any other site** where two or more sub-emissions (each calling
  `fresh-temp`/`emit!`) are passed as arguments to one call, and sequence those too. (The
  primary offenders are the `emit-app`/`emit-apply` sites; `(map … args)` element order is
  already left-to-right on both hosts, and `let*`-bound stages are already sequenced.)
- **Regression: a byte-identical check** — the IR that `schemec` emits for a set of programs is
  byte-identical to the Chez-hosted compiler's, exercising calls, nested calls, and closures.

## Capabilities

### New Capabilities
<!-- none -->

### Modified Capabilities
- `aot-codegen`: emitted IR (temporary numbering and instruction order) is **deterministic and
  independent of the host's argument-evaluation order**, so the compiler run under Chez and the
  compiler run as compiled `schemec` emit byte-identical IR for the same program.

## Impact

- **Code**: `src/emit.ss` (the four `emit-app`/`emit-apply` call sites, plus any other
  multi-sub-emission audited); a byte-identical regression harness.
- **Unblocks**: [[self-hosting-bootstrap]] task 3 — the byte-identical stage-1/stage-2 triple
  test — and hence the self-hosting acceptance criterion.
- **Risk**: low if operands-first is chosen (Chez-hosted IR unchanged; the full suite guards
  values/backends). If any site is missed, the triple test surfaces it as a remaining diff.
