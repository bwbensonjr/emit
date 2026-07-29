## 1. Stage 1 of the staged bootstrap — teach the seed the new primitives (no call sites)

- [x] 1.1 Add `rt_dump_level()` to `src/runtime/runtime.c` beside `rt_no_prelude_p`
  (`~:610`): read `EMIT_DUMP_LEVEL`, return a scheme fixnum `0|1|2`, defaulting to `0` when
  unset, empty, or unparseable. Comment it with the same channel rationale.
- [x] 1.2 Add `rt_stderr_write(val v, val display_flag)` to `src/runtime/runtime.c`,
  implemented over the existing `static void print_val(val, int display)` (`~:688`) with
  `stderr` as the destination; return `v`.
- [x] 1.3 Add `(%dump-level "rt_dump_level")` and `(%stderr-write "rt_stderr_write")` to
  `prim-table` in `src/emit.ss:153`.
- [x] 1.4 Add the matching `declare i64 @rt_dump_level()` and
  `declare i64 @rt_stderr_write(i64, i64)` lines to the emitted declare header in
  `src/emit.ss:597`.
- [x] 1.5 Add both names to the reserved `%`-op head set in `src/parse.ss:39`.
- [x] 1.6 Confirm nothing in `src/` yet *calls* either primitive (this stage is tables
  only), then run `make regen` and record the fixed-point iteration count.
- [x] 1.6b Re-record `test/module-scaffold-baseline.sha256`: the two added `declare` lines
  land in every module's runtime header, so every demo's IR hash changes. Prove the drift is
  *only* those lines with a before/after 69-demo capture, then re-record and log the reason
  in the harness header.
- [x] 1.7 Run `./run-all-tests.sh` and `./run-dev-tests.sh` (incl. trust-check); commit the
  regenerated `bootstrap/*.ll` as the stage-1 seed. (The trust-check only *runs* once
  `bootstrap/` is committed — it skips on a dirty `bootstrap/` — so re-run it after the
  commit.)

## 2. The in-language dumper

- [ ] 2.1 Add a pretty-printer to `src/util.scm` (compiler-internal — **not**
  `src/prelude.scm`, per design D4): print a form inline when its flat width fits the
  column budget, otherwise break after the head and indent operands one level; atoms in
  write style, structure/indentation in display style, all via `%stderr-write`.
- [ ] 2.2 Add `(make-dumper level unit-filter)` returning `no-dump` at level 0, a
  `stage <name>` announcer at level 1, and the `;; ==== after <stage> ====` +
  pretty-printed form dumper at level 2. Keep the level-2 header text byte-identical to
  `src/compile.ss:139`'s so the parity check can split both streams the same way.
- [ ] 2.3 Give the dumper the unit filter of design D7: dump the unit under inspection by
  default, all units when the all-units level is set, labelling library units with their
  `define-library` name.
- [ ] 2.4 Verify the dumper allocates no gensym (never calls `fresh-name`), so dumping
  cannot perturb emitted IR.

## 3. Core and entry plumbing (Scheme side)

- [ ] 3.1 Add the missing `dump` calls for `a`/`b`/`c` (`recognize-let`,
  `convert-assignments`, `convert-closures`) in `compile-program-with-imports`
  (`src/core.ss:363-389`), so the modular path exposes all seven stages.
- [ ] 3.2 Thread a dumper parameter into `repl-lower-form*` (`src/parse.ss:622`) and its
  callers, and dump its per-form stages with the form-qualified headers of design D8.
- [ ] 3.3 Replace the five hardcoded `no-dump` arguments in `src/repl-core.ss`
  (`:244`, `:350`, `:370`, `:379`, `:432`) with the dumper built from `(%dump-level)`.
- [ ] 3.4 Build the dumper in `src/entry-embed.scm` and `src/entry-schemec.scm` and pass it
  into `compile-source-string` / `compile-source-rehomed` (adding the parameter where those
  convenience entries in `src/core.ss` currently hardcode `no-dump`).
- [ ] 3.5 Confirm `src/core.ss` still contains no port write and no environment probe — the
  dumper is constructed at the entry layer only (design D3, `compiler-pipeline`'s
  core-purity requirement).

## 4. Host flag plumbing (`src/emit.cpp`)

- [ ] 4.1 Parse `--dump` and `--dump-all` in `emit_run` (`~:302`), `emit_build`,
  `emit_lib`, and `emit_repl`, and reject them nowhere else; extend each door's usage text
  and the top-level `usage()` (`~:898`).
- [ ] 4.2 Compute the dump level once — `--dump`/`--dump-all` wins, else
  `EMIT_VERBOSITY=verbose` gives level 1, else 0 — mirroring `src/compile.ss:682`, and
  `setenv("EMIT_DUMP_LEVEL", …)` before the first `scheme_entry()` call (as
  `EMIT_NO_PRELUDE` is set at `~:340`).
- [ ] 4.3 Do the same in `src/run-boot.cpp` (`~:77`) so the bootstrap runner can dump when
  debugging a regen.
- [ ] 4.4 Re-check that no door writes dump output to stdout, including the `--emit` and
  `--resolve-program` paths.

## 5. Stage 2 of the staged bootstrap

- [ ] 5.1 Run `make regen` with the stage-1 seed; record the iteration count and confirm
  convergence.
- [ ] 5.2 Run `./run-all-tests.sh` and `./run-dev-tests.sh` (incl. trust-check and
  `test/self-host-fixpoint.sh`); commit the regenerated `bootstrap/*.ll`.
- [ ] 5.3 Report the size delta for `build/emit` and each `bootstrap/*.ll`, and confirm a
  delivered user executable (e.g. `emit build fact`) is unchanged in size — the printer is
  compiler-internal.

## 6. Verification

- [ ] 6.1 Add a Chez-free stdout-invariance check to `run-all-tests.sh`: `emit run --emit`
  vs `emit run --emit --dump` on a program using macros, closures, and an import must be
  byte-identical (design D6).
- [ ] 6.2 Add the same invariance check for `emit lib` artifacts (`.ll` and `.exports`) and
  for a delivered `emit build` executable.
- [ ] 6.3 Add a Chez-gated dump-parity check to `run-dev-tests.sh`: split the Chez driver's
  `--dump` stderr and `emit run --dump` stderr on the stage headers, `read` each section,
  and assert equal stage names, order, and `equal?` forms (design D5).
- [ ] 6.4 Add a stage-list assertion covering the modular path's seven stages and the
  per-form path's form-qualified headers.
- [ ] 6.5 Add a REPL check that `emit repl --dump` dumps each entered form and leaves the
  session's values and redefinition behavior unchanged.
- [ ] 6.6 Verify on a machine (or a `PATH` with `chez` removed) that build, run, REPL, and
  dump all work with no Chez present.

## 7. Documentation

- [ ] 7.1 `README.md` — add `--dump` to the quick-start door examples and state that stage
  inspection no longer needs Chez; update the Chez-role paragraph to "verification and
  genesis only".
- [ ] 7.2 `docs/PIPELINE.md` — update the `--dump` references to name the shipped binary,
  and document the modular/per-form stage coverage and the form-qualified headers.
- [ ] 7.3 `docs/OUTPUT.md` — document `--dump`/`--dump-all`, `EMIT_DUMP_LEVEL`, its
  relationship to `EMIT_VERBOSITY`, and the stderr/stdout discipline for dumps.
- [ ] 7.4 `docs/PRIMITIVES.md` — record `%dump-level` and `%stderr-write` as reserved
  `%`-ops (not shadowable user-facing bindings) and note the staged bootstrap they required.
- [ ] 7.5 Run `make catalogue` to refresh `docs/COMPLEXITY.md` after the source growth.
