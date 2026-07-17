## 1. Host-side library preload

- [x] 1.1 Reuse the REPL host's `preload_libraries()` PATTERN in the run host. NOTE: rather
      than extracting a shared C++ TU (design D1's first cut), the ~30-line file-I/O + fixpoint
      orchestration is kept in `src/run.cpp::preload_user_libraries` (no-init variant). The
      *resolution* logic stays single-sourced in the compiler modes (4/5/9) — the "one path"
      invariant D1 protects — and `src/repl/host.cpp` is left untouched (zero REPL regression risk).
- [x] 1.2 `repl-host` unchanged; existing REPL module suites still pass (8/0).

## 2. Run host wiring

- [x] 2.1 `Makefile` `$(RUN)` now links `bootstrap/embed-repl.ll` (dispatched entry). Bootstrap
      conflict resolved by decision X / D7: the batch runner is preserved as `src/run-boot.cpp`
      and `regen.sh` drives the fixed point through `build/scheme-run-boot`.
- [x] 2.2 `--manifest FILE` + `EMIT_MANIFEST` handling in `src/run.cpp` (flag > env > default).
- [x] 2.3 `src/run.cpp` seeds the session (mode 1), registers baked `(scheme base)` (mode 8),
      preloads user libs (mode 9 paths → mode 4, WITHOUT running `__init`), then compiles.

## 3. Program compilation against preloaded units

- [x] 3.1 Mode 7 (`compile-program-text`) compiles the whole program via the existing
      `compile-program-with-imports` (`src/core.ss:362`), with direct-import tables from the
      preloaded units and `init-libs` from an in-language topological closure over the recorded
      import graph (`*repl-lib-imports*`). Lone `define-library` input → single unit (mode 7
      returns `library` status). Baked `(scheme base)` registered via mode 8; `(scheme base)`
      excluded from the manifest preload via mode 9 (avoids a duplicate module).
- [x] 3.2 `src/run.cpp` JIT-adds every unit module + the program, then runs `scheme_entry`
      (which drives `__init` in topological order — D5).
- [x] 3.3 Fast path preserved (D4/D6): a plain program needs no manifest; `(scheme base)` is
      baked in. Verified byte-identical program + base modules.

## 4. Regen + build

- [x] 4.1 `make regen` converges (iter 1) and is idempotent across all four committed
      `bootstrap/*.ll` (byte-identical on re-run) — the trust-check passes once committed. The
      Chez-gated **self-hosting fixed point** also re-derives the committed `embed.ll` /
      `scheme.base.ll` independently (Chez host). NOTE: decision X required updating the two
      Chez-gated harnesses that link a stage runner — `tools/regen.sh` and
      `test/self-host-fixpoint.sh` — to use the batch `run-boot.o` (was `run.o`).
- [x] 4.2 `build/scheme-run` relinked from the dispatched entry: **~806 KB → ~894 KB** (+~88 KB,
      the D2 tradeoff for the module-aware door).

## 5. Tests and fidelity

- [x] 5.1 `test/modules-run-tests.sh`: import (142), transitive chain (15), diamond (35), rename
      (77), and a no-manifest plain program ((1 4 9)). Registered in `run-all-tests.sh`.
- [x] 5.2 Fidelity: run-door value == AOT-door value (142==142); run-door program module
      byte-identical to the AOT `prog.ll` (modulo the driver's target header, which the embedded
      `--emit` omits by convention). Chez-gated section of the new suite.
- [x] 5.3 Negative tests: import cycle and missing-from-manifest each report a diagnostic and
      exit non-zero.
- [x] 5.4 `demos/run-tests.sh` still 61/0 on `scheme-run` (fast path unaffected).

## 6. --emit scope decision

- [x] 6.1 DECIDED: `scheme-run --emit` emits every loaded unit module + the program, boundary-
      joined; `bin/scheme-compile` already splits on the marker and links them all, so multi-unit
      AOT works. LIMITATION (noted, follow-up): the run host preloads the WHOLE manifest, so
      `--emit` currently emits all manifest units, not just the program's transitive closure — an
      AOT binary built this way links unused libraries. The JIT run path is unaffected (extra
      modules are inert; only the closure's `__init` runs). Closure-pruned `--emit` is future work.

## 7. Docs

- [x] 7.1 `docs/MODULES.md` updated: the "future work" caveat is replaced with the run-door
      documentation (`scheme-run --manifest`, baked `(scheme base)`, byte-identity).

## 8. Spec sync

- [x] 8.1 After green tests, sync the delta in `specs/module-system/spec.md` into
      `openspec/specs/module-system/spec.md` (sync/archive workflow).
