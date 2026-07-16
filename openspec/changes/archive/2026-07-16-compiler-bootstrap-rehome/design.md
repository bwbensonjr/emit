## Context

The prelude re-home arc is complete for user code: the Chez driver, the REPL, and the Chez-free
embedded runner all auto-import `(scheme base)`. The compiler's **own** build is the last holdout.
`tools/regen.sh` assembles each binary as `T-* = prelude ++ compiler` and compiles it with the
self-hosted `schemec` filter, iterating `schemec` to a byte-identical fixed point:

```
T-schemec = prelude.scm ++ (CORE_FLAT ++ entry-schemec)
T-embed   = prelude.scm ++ (CORE_FLAT ++ prelude-source ++ entry-embed)
T-embed-repl = prelude.scm ++ (CORE_FLAT ++ repl-core ++ prelude-source ++ entry-repl)
```

Two facts constrain the re-home:

1. **The `schemec` filter cannot resolve imports.** Its entry is `compile-source-string` →
   `compile-forms`, which compiles a flat form list with no import resolution. A re-homed compiler
   is a program that depends on `(scheme base)`, so the filter can no longer emit it. The
   module-aware path is `scheme-run --emit` (from `embedded-runner-rehome`): it auto-imports
   `(scheme base)`, emits the library module + the program module (marker-separated), and is
   Chez-free. It is the natural bootstrap tool.

2. **The default build links committed IR with LLVM only — it never runs the compiler.** So the
   binaries' new `scheme.base.ll` dependency must be a *committed* artifact, not built on demand
   (building it needs the compiler, which needs it — circular). It is committed host-agnostic at
   `bootstrap/scheme.base.ll`, exactly like the other stage-0 IR.

Proven earlier this session (Chez harness): the `(scheme base)` form the embedded compiler
synthesizes from its baked-in prelude source is identical to `lib/scheme/base.sld`, and the
program IR it emits with `(scheme base)` auto-imported is byte-identical to the Chez driver's — so
compiling the compiler sources through `scheme-run --emit` yields the same module the driver would.

## Goals / Non-Goals

**Goals:**
- Remove the `prelude ++ compiler` prepend from the compiler build; all three binaries
  (`schemec`, `embed`, `embed-repl`) consume `(scheme base)` as a linked library.
- Keep the compiler's emitted IR for **user programs** unchanged (behavior preserved; the
  module-scaffold baseline untouched).
- Preserve Chez-free regeneration and reach a byte-identical fixed point spanning
  `{scheme.base.ll} ∪ {compiler IRs}`; keep the trust-check meaningful.

**Non-Goals:**
- The Chez driver's `--backend jit`/`--backend bitcode`/`--emit-ir` prepend paths (separate change).
- Changing `(scheme base)`'s contents, the module system, or user-facing behavior.
- Removing the `schemec` filter (it stays a shipped binary; only how it's *built* changes).

## Decisions

### D1 — Compiler sources stay flat and import-free; `(scheme base)` arrives by auto-import

The compiler sources are **not** edited to add `(import (scheme base))`. Instead the assembly drops
the prelude prepend, and `scheme-run --emit` auto-imports `(scheme base)` for the compiler program
just as for any user program (procedures → `scheme.base:*` externals; derived-form macros merged
compile-time; user-wins shadowing lets any compiler-local redefinition win).

**Why:** keeps the sources a plain concatenation (the self-hosting "flat, no import/include"
property is preserved textually), confines the change to the build recipe, and reuses the exact
auto-import path already proven for user programs. **Alternative — explicit `(import (scheme base))`
in the assembled program:** rejected; it buys nothing over auto-import and muddies the flat-source
invariant.

### D2 — The bootstrap tool is `scheme-run --emit`; per-binary split-and-link

Regen emits each binary's IR with `scheme-run --emit < <assembled>.scm`, which yields
`scheme.base` IR + marker + compiler-program IR. The program module is the binary's IR; it links
with `bootstrap/scheme.base.ll` and the binary's host objects:
- `schemec`: `clang -DRT_FILTER_MAIN runtime.c scheme.base.ll schemec.ll`
- `embed` (`scheme-run`): `run.o + runtime-host.o + scheme.base.ll + embed.ll`
- `embed-repl` (`repl-host`): `host.o + runtime-host.o + scheme.base.ll + embed-repl.ll`

This is exactly the split-and-link `bin/scheme-compile` performs, generalized to the three host
shapes. **Alternative — a new module-aware mode of the `schemec` filter:** rejected; it duplicates
the embedded runner's re-home logic in a second path, violating "one compiler core."

### D3 — `bootstrap/scheme.base.ll` is committed, host-agnostic, emitted from `lib/scheme/base.sld`

`scheme.base.ll` is produced by `scheme-run --emit < lib/scheme/base.sld` (a lone `define-library`
→ compiled as a unit, single module, header-free) and committed. All three binaries link this one
file. It matches the `scheme.base` portion emitted alongside each compiler program (same library,
same core), so there is exactly one `scheme.base` definition per binary.

**Why committed:** the default LLVM-only build cannot run the compiler to synthesize it. **Alternative
— build under `build/lib` on demand:** rejected; it reintroduces Chez/compiler need into the default
build and a host-specific triple.

### D4 — Multi-artifact fixed point via the existing embedded runner as seed

Regeneration (Chez-free), starting from the currently-committed `embed.ll` (this session's runner,
which is module-aware even though its *own* code is still prepend-assembled):

```
0. scheme.base.ll  := (current scheme-run) --emit < lib/scheme/base.sld     # commit candidate
1. repeat (fixed-point loop, seeded by the current scheme-run):
     embed.ll'  := (current scheme-run) --emit < embed.scm  |> program-module
     relink scheme-run  from  run.o + embed.ll' + scheme.base.ll
   until embed.ll' is byte-identical across an iteration
2. with the fixed-point scheme-run:
     schemec.ll     := scheme-run --emit < schemec.scm     |> program-module
     embed-repl.ll  := scheme-run --emit < embed-repl.scm  |> program-module
3. relink all three binaries against scheme.base.ll
```

`embed` is the seed because it is the module-aware emitter; `schemec` and `embed-repl` are emitted
*by* the fixed-point `embed`, so they inherit its stability. The triple-test property
(stage-2 == stage-3) is asserted over `embed.ll` and carried to the others.

**Why seed with `embed`, not `schemec`:** the old loop seeded with the `schemec` filter, but the
filter can't emit a re-homed compiler (D-context fact 1). `embed`/`scheme-run` is the Chez-free
module-aware compiler and is already the committed seed for the runner.

### D5 — Keep behavior; only the binaries' construction changes

Re-homing changes how each binary is *built*, not what it *does*. `schemec` still filters stdin via
`compile-source-string` (no prelude for the user's program); `scheme-run`/`embed-repl` still
auto-import `(scheme base)` for user programs as they do today. So: the module-scaffold byte-identity
baseline (scheme-run's output for demos) is unchanged, `self-emit-equiv` (schemec vs Chez) holds,
and demo values are unchanged. Only `bootstrap/{schemec,embed,embed-repl}.ll` change (prelude procs
→ `scheme.base:*` externals) and `bootstrap/scheme.base.ll` is added.

## Risks / Trade-offs

- **[The fixed point fails to converge with a library dependency]** → the concentrated risk. Mitigation:
  seed from the proven module-aware `embed`; iterate `embed.ll` to byte-stability before emitting the
  others; keep the loop identical in spirit to today's (compile → relink → compare). If it does not
  converge, D4 is falsifiable early (iteration 1 vs 2 diff), before any commit.
- **[`scheme.base.ll` referenced by the binaries drifts from the one emitted inline]** → both come from
  the same library through the same core; a regen check asserts the standalone `scheme.base.ll`
  equals the `scheme.base` module `scheme-run --emit` emits ahead of a program.
- **[Chicken-and-egg on a clean checkout]** → the default build only *links* committed IR
  (`scheme.base.ll` included), so it never needs the compiler; regen (opt-in) starts from the
  committed `embed.ll`. Genesis re-derivation (trust-check second host) rebuilds the seed under Chez.
- **[trust-check no longer independent if it reuses committed `scheme.base.ll`]** → the check
  regenerates `scheme.base.ll` from `lib/scheme/base.sld` too and compares, so the library is
  re-derived, not trusted.
- **[Compiler self-performance / heap through `(scheme base)` externals]** → external global calls vs
  inlined defines; identical semantics, negligible cost, and the compiler already calls its prelude
  procedures indirectly. Fixed point + demo timings confirm no regression.

## Migration Plan

1. Rewrite `tools/regen.sh` per D4 (emit `scheme.base.ll`; module-aware per-binary emit/link;
   multi-artifact fixed-point loop). Update the `Makefile` default build to link `scheme.base.ll`.
2. Regen Chez-free; confirm the fixed point converges and commit
   `bootstrap/{scheme.base,schemec,embed,embed-repl}.ll`.
3. Verify: `run-all-tests.sh` (incl. module-scaffold baseline **unchanged**, demo values unchanged),
   `run-dev-tests.sh` (self-host fixed point, self-emit-equiv, trust-check), and re-home suites.
4. Update `test/self-host-fixpoint.sh` / `test/trust-check.sh` for the added artifact.

**Rollback:** revert `regen.sh`/`Makefile` and `git checkout` the prior `bootstrap/*.ll` (delete
`bootstrap/scheme.base.ll`); the `prelude ++ compiler` build returns unchanged.

## Open Questions

- Whether `schemec`'s role should shrink further (it is no longer the bootstrap seed) — out of scope;
  it stays a shipped filter binary.
- Whether to also commit `.exports` for `scheme.base` in `bootstrap/` — not needed: the binaries
  link by symbol name; only the AOT driver's cache uses `.exports`. Left out.
