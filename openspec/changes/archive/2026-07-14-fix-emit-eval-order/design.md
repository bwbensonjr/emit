## Context

`emit.ss` lowers core-IL to textual LLVM IR by side effect: `ev`/`et` walk an expression,
calling `fresh-temp` (monotonic temp counter) and `emit!` (append a line) as they go. The
textual output therefore depends on the *order* in which sub-expressions are emitted. Most of
the emitter sequences explicitly (`seq`, `let*`-bound stages), but the call/apply cases pass
two independently-emitting sub-parts as arguments to one function:

```scheme
;; ev (non-tail) and et (tail), for both plain calls and apply:
(emit-app   (ev f env cp tc?) (map (lambda (a) (ev a env cp tc?)) args) #f/#t tc?)
(emit-apply (ev f env cp tc?) (map (lambda (a) (ev a env cp tc?)) args) #f/#t tc?)
```

`(ev f …)` (the callee: closure-pointer masking/loads) and `(map … args)` (the operands) each
emit instructions. The Scheme standard leaves procedure-call argument order unspecified: Chez
evaluates right-to-left (operands emitted first), scheme-llvm left-to-right (callee first). So
the compiler run under Chez and the same compiler compiled to `schemec` disagree on emission
order → different `%tN` numbering and line order. Verified on `demos/fact.scm`: identical
except for this reordering; both run to `120`.

## Goals / Non-Goals

**Goals:** make emitted IR independent of host argument-evaluation order so `schemec` and the
Chez-hosted compiler produce byte-identical IR; keep semantics and the demo values unchanged.

**Non-Goals:** changing the calling convention or value representation; reordering for
performance; a general "deterministic emitter" audit beyond the sites that actually vary.

## Decisions

### D1: Explicit `let*` sequencing, operands-first

Rewrite the four sites so the sub-emissions are `let*`-bound in a fixed order rather than left
to host argument evaluation:

```scheme
[(call ,f . ,args)
 (let* ([aops (map (lambda (a) (ev a env cp tc?)) args)]   ; operands first …
        [fop  (ev f env cp tc?)])                          ; … then callee
   (emit-app fop aops #f tc?))]
```

**Operands-first** is chosen because it matches today's Chez-hosted output (Chez evaluates the
`emit-app` arguments right-to-left, i.e. `(map …)` before `(ev f …)`). With this, the
Chez-hosted IR is unchanged (no re-baseline of every demo `.ll`) and only `schemec` shifts to
match. Apply the same to `et` (tail) and to the `apply` variants. `emit-app`/`emit-apply`
themselves already consume `fop`/`aops` in a fixed internal order, so no change there.

### D2: Audit other multi-sub-emission sites — RESULT

The audit found a **second class beyond the call/apply sites**: `let` (parallel) bindings whose
inits each call `fresh-temp`/`fresh-bb`. Scheme leaves parallel-`let` init order unspecified —
Chez evaluates right-to-left, scheme-llvm left-to-right — so a binding like
`(let ([raw (fresh-temp)] [p (fresh-temp)]) …)` numbers `raw`/`p` differently per host. Five
such sites were converted to `let*` (sequential, left-to-right on both hosts; the bindings are
independent, so this is meaning-preserving):

- `emit-alloc-closure` — `[raw (fresh-temp)] [p (fresh-temp)]`
- `emit-load-code` — `[b …] [bp …] [code …] [fp …]`
- `emit-make-closure`'s helper — `[b …] [p …] [g …] [v …]`
- `emit-spill` — `[raw …] [p …] [len …]`
- `emit-arity-check` — `[ok (fresh-temp)] [errbb (fresh-bb …)] [okbb (fresh-bb …)]`

Confirmed-safe (no change): `(emit-primcall op (map …))` and other single-`map` sites (`map`
element order is left-to-right on both hosts); already-`let*`/`seq`-sequenced stages; single
`fresh-temp` `let`s (`(let ([entry (assq …)] [t (fresh-temp)]) …)` — only one side-effecting
init). The self-emission harness (D3) and the eventual triple test are the backstop for any
missed site.

**Correction to D1:** because these `let`→`let*` conversions also fix the *Chez-hosted* order
(Chez was right-to-left), the Chez-hosted `.ll` output **does change** (temporaries renumber) —
D1's "operands-first keeps the Chez output unchanged" holds only for the call/apply sites, not
the `let` sites. The demo suite checks values and AOT/JIT/bitcode agreement (not `.ll` text), so
it stays green; the change is that both hosts now emit the same deterministic left-to-right IR.

### D3: Verify with a direct byte-identical harness

Compile a set of programs (a plain call, a nested call `(f (g x))`, a closure with captures, a
`letrec` recursion, an `apply`) with both the Chez-hosted compiler (`--emit-ir --no-prelude`)
and `build/schemec`, and require `diff` to be empty. This is a focused precursor to the full
core triple test in [[self-hosting-bootstrap]] task 3.

## Risks / Trade-offs

- **A missed site leaves a residual diff** → the byte-identical harness (D3) and the eventual
  triple test catch it; each becomes another `let*` fix.
- **`map` element order assumption** → both Chez `map` and the prelude `%map1` apply the
  procedure left-to-right, so operand emission order already agrees; if a future prelude change
  altered that, the harness would catch it.
- **Choosing operands-first vs callee-first** → purely cosmetic (SSA); operands-first is picked
  only to avoid re-baselining the Chez-hosted `.ll` outputs.

## Verification

1. The byte-identical harness (D3) passes: `schemec` IR == Chez-hosted IR for each probe program.
2. `demos/fact.scm` via `schemec` is now byte-identical to `chez … --emit-ir --no-prelude`.
3. `./run-all-tests.sh` — all suites pass (values and backend agreement unchanged).
4. Hand back to [[self-hosting-bootstrap]] task 3: attempt the core triple test.
