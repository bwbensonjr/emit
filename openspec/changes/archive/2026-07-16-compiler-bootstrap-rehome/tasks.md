## 1. Commit the (scheme base) bootstrap artifact (D3)

- [x] 1.1 Emit `bootstrap/scheme.base.ll` from `lib/scheme/base.sld` via `build/scheme-run --emit` (a lone `define-library` → single header-free unit module); confirm it is host-agnostic (no `target` lines).
- [x] 1.2 Add a regen check asserting the standalone `bootstrap/scheme.base.ll` equals the `scheme.base` module that `scheme-run --emit` emits ahead of a program (same library, same core) — guards against drift.

## 2. Rewrite the regen assembly (D1/D2/D4)

- [x] 2.1 In `tools/regen.sh`, drop the `T-* = prelude ++ compiler` step and the `build/prelude-source.scm` escaper from the compiler build; assemble `schemec.scm`/`embed.scm`/`embed-repl.scm` as the flat CORE_FLAT (+ per-target extras/entry) with NO prelude prepend. (Keep `*prelude-source*` baked into `embed`/`embed-repl` — the embedded compiler still needs it to synthesize `(scheme base)` at runtime.)
- [x] 2.2 Emit each binary's IR with `scheme-run --emit`, taking the program module (after the boundary marker) as `bootstrap/<binary>.ll`.
- [x] 2.3 Implement the multi-artifact fixed-point loop: seed with the current `scheme-run`, emit `embed.ll` and relink `scheme-run` (with `scheme.base.ll`) until `embed.ll` is byte-identical across an iteration; then emit `schemec.ll` and `embed-repl.ll` with the fixed-point `scheme-run`.

## 3. Link the binaries against scheme.base.ll (D2)

- [x] 3.1 In the `Makefile`, link `bootstrap/scheme.base.ll` into all three binary recipes: `schemec` (`-DRT_FILTER_MAIN` + runtime.c), `scheme-run` (`run.o` + `runtime-host.o`), `repl-host` (`host.o` + `runtime-host.o`).
- [x] 3.2 In `tools/regen.sh`, relink each binary with `scheme.base.ll` in the fixed-point loop (matching the Makefile recipes) so regen and the default build agree.

## 4. Regenerate and reach the fixed point (D4)

- [x] 4.1 Run `make regen` Chez-free; confirm the fixed point converges over `{scheme.base.ll, schemec.ll, embed.ll, embed-repl.ll}`; commit all four `bootstrap/*.ll`.
- [x] 4.2 Confirm each compiler binary's committed IR references prelude procedures as `scheme.base:*` externals (no inlined prelude defines) and links `scheme.base.ll` exactly once.

## 5. Update self-hosting guards (impact)

- [x] 5.1 Update `test/self-host-fixpoint.sh` to iterate/assert the fixed point including `scheme.base.ll` (and the module-aware emit path), not the old `T-*`/filter loop.
- [x] 5.2 Update `test/trust-check.sh` to re-derive `scheme.base.ll` from `lib/scheme/base.sld` and the compiler IRs from source, asserting byte-identity against the committed artifacts (so the library is re-derived, not trusted).

## 6. Verify behavior preserved

- [x] 6.1 `run-all-tests.sh` green: **module-scaffold byte-identity baseline unchanged** (scheme-run's output for user programs is unaffected), demo values unchanged, both re-home suites pass.
- [x] 6.2 `run-dev-tests.sh` green: self-host fixed point, `self-emit-equiv` (schemec vs Chez unchanged), trust-check, embedded-runner-vs-AOT, and both `(scheme base)` auto-import suites.
- [x] 6.3 Spot-check the three binaries by hand: `schemec` filters a program to identical IR as before; `scheme-run`/`scheme-compile` run a prelude program; `--repl` starts and evaluates a prelude-using form.

## 7. Docs

- [x] 7.1 Update `README.md`, `docs/PIPELINE.md`, and `tools/regen.sh`'s header comment to describe the compiler build as re-homed on `(scheme base)` (no `prelude ++ compiler`), and list `bootstrap/scheme.base.ll` among the committed stage-0 artifacts.
