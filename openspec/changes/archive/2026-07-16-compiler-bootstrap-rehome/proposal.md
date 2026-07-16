## Why

`(scheme base)` is now "library zero" for every program *users* write — the Chez driver, the
REPL, and the Chez-free embedded runner all auto-import it (Stages 1–3 + `embedded-runner-rehome`).
But the **compiler's own bootstrap still prepends the prelude**: `tools/regen.sh` assembles each
binary as `T-* = prelude ++ compiler`, so `schemec`/`embed`/`embed-repl` carry the prelude's ~89
procedures inlined as their own top-level defines rather than consuming `(scheme base)` as a
linked library. This was the self-referential risk `module-prelude-scheme-base` explicitly
deferred: *"(scheme base) is not linked into the compiler binaries for their own execution … leaves
that as a clean follow-on."* This change is that follow-on — it makes `(scheme base)` literally
library zero for the compiler itself, removing the last prelude-prepend path in the tree and
dogfooding the module system on the compiler, the single largest and most-depended-on unit.

## What Changes

- **Stop prepending the prelude to the compiler's own source.** `tools/regen.sh` no longer builds
  `T-schemec`/`T-embed`/`T-embed-repl` as `prelude ++ compiler`; the compiler sources are compiled
  as ordinary programs that **auto-import `(scheme base)`** (no explicit `import` form needed — the
  module-aware embedded compiler auto-imports it, exactly as for a user program), with the
  derived-form macros merged compile-time. The prelude's procedures resolve as `scheme.base:*`
  external globals; the compiler binaries link `scheme.base.ll`.
- **The bootstrap tool becomes the module-aware embedded compiler.** The `schemec` *filter*
  (`compile-source-string` → `compile-forms`) cannot resolve imports, so it can no longer emit a
  re-homed compiler. Regen instead drives `scheme-run --emit` (module-aware, Chez-free, from
  `embedded-runner-rehome`) to emit each compiler binary's IR against `(scheme base)`, then links
  the program module + `scheme.base.ll` per binary (schemec via `RT_FILTER_MAIN`, embed via
  `run.o`, embed-repl via `host.o`) — the same split-and-link `bin/scheme-compile` already does.
- **`scheme.base.ll` becomes a committed, host-agnostic bootstrap artifact.** Because the default
  build links committed IR with LLVM only (no Chez, no compiler run), the binaries' new
  `scheme.base.ll` dependency SHALL be committed at `bootstrap/scheme.base.ll` (header-free, as the
  embedded compiler emits it), alongside `schemec.ll`/`embed.ll`/`embed-repl.ll`.
- **The self-hosting fixed point spans the library + the compiler.** Regen iterates to a
  byte-identical fixed point over `{scheme.base.ll, schemec.ll, embed.ll, embed-repl.ll}`: emit
  `scheme.base.ll` from `lib/scheme/base.sld`, emit each compiler binary's IR auto-importing it,
  relink, and repeat until stable. The Chez-gated trust-check re-derives the same fixed point.
- **The Makefile default build** links each binary with `bootstrap/scheme.base.ll` + its own IR +
  the runtime.
- **No user-facing behavior change and no change to what the compiler emits for user programs.**
  Re-homing changes only how the compiler *binaries* are built; `scheme-run`/`schemec` output for
  any user program is unchanged (the module-scaffold byte-identity baseline is unaffected).

## Capabilities

### New Capabilities
<!-- None; this completes the self-hosting/module-system arc rather than adding a capability. -->

### Modified Capabilities
- `self-hosting`: The assembled compiler program auto-imports `(scheme base)` and is no longer a
  single self-contained prelude-prepended unit; the self-compilation fixed point spans
  `scheme.base.ll` plus the three compiler IRs; the committed authoritative artifacts add
  `bootstrap/scheme.base.ll`; and Chez-free regeneration builds the library and module-compiles the
  compiler. (Behavior — the IR the compiler emits for user programs — is preserved.)
- `module-system`: `(scheme base)` is now library zero for the compiler's own build too, not only
  user programs — the auto-import/link path is exercised on the compiler as its largest consumer.

## Impact

- **Build/tooling**: `tools/regen.sh` (drop the `prelude ++ compiler` assembly; add
  `scheme.base.ll` emission + module-aware per-binary emit/link + multi-artifact fixed-point loop);
  `Makefile` (link `bootstrap/scheme.base.ll` into all three binaries); `test/trust-check.sh` and
  `test/self-host-fixpoint.sh` (account for `scheme.base.ll`).
- **Committed artifacts**: add `bootstrap/scheme.base.ll`; `bootstrap/{schemec,embed,embed-repl}.ll`
  regenerated (re-homed: prelude procedures become `scheme.base:*` externals).
- **Source**: compiler sources stay flat and import-free (auto-import supplies `(scheme base)`); the
  only removal is the prelude-prepend step in `regen.sh`. The prepend-based `T-*` path and
  `build/prelude-source.scm` escaper are retired for the compiler build.
- **Risk (self-hosting)**: the fixed point now has a library dependency — the concentrated
  self-referential risk this change exists to absorb. Mitigated by the staged bootstrap and the
  trust-check (see design.md).
- **Not in scope**: the Chez driver's secondary `--backend jit`/`--backend bitcode`/`--emit-ir`
  prepend paths (tracked separately); the compiler's runtime behavior/emitted IR for user programs.
- **No breaking change** to user-observable behavior.
