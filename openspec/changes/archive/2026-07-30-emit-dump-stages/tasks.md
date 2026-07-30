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

- [x] 2.1 Add a pretty-printer, compiler-internal (**not** `src/prelude.scm`, per design
  D4): print a form inline when its flat width fits the column budget, otherwise fill;
  atoms in write style, structure/indentation in display style, all via `%stderr-write`.
  **Landed in a new `src/dump.ss`, not `src/util.scm`:** `util.scm` is in `compile.ss`'s
  `(include ...)` block, which Chez *evaluates*, and `%stderr-write`/`%dump-level` are
  unbound identifiers there. `src/dump.ss` rides `$CORE_FLAT` (compiled, never evaluated)
  in `tools/regen.sh` + `test/self-host-fixpoint.sh` — which also keeps the Chez driver's
  `pretty-print` dumper an independent implementation for D5 to check against.
  Break style resolved to **fill** (the design's open question): one-element-per-line
  split runs of atoms like `(code "code_6" cp.7 (n.3) #f …)` across five lines where the
  Chez reference keeps them together.
- [x] 2.2 Add `(make-dumper unit)` — reading `(%dump-level)` itself rather than taking the
  level, so there is one probe point — returning `no-dump` at level 0, a `stage <name>`
  announcer at level 1, and the `;; ==== after <stage> ====` + pretty-printed form dumper
  at level 2. Header text byte-identical to `src/compile.ss:139`'s so the parity check can
  split both streams the same way.
- [x] 2.3 Give the dumper the unit filter of design D7: dump the unit under inspection by
  default, all units at level 3 (`--dump-all` rides the same probe rather than a second
  environment variable), labelling library units with their `define-library` name.
- [x] 2.4 Verify the dumper allocates no gensym (never calls `fresh-name`), so dumping
  cannot perturb emitted IR.

## 3. Core and entry plumbing (Scheme side)

- [x] 3.1 Add the missing `dump` calls for `a`/`b`/`c` (`recognize-let`,
  `convert-assignments`, `convert-closures`) in `compile-program-with-imports`
  (`src/core.ss:363-389`), so the modular path exposes all seven stages.
- [x] 3.2 Thread a dumper into the per-form path and tag its stages per design D8.
  **Landed in `repl-lcode`/`unit-lcode` (core.ss), not `repl-lower-form*`:** that is where
  the mid-pipeline ladder actually runs (`repl-lower-form*` only does parse+rename), so
  `parse.ss` needed no change. The D8 tag rides the stage *name* via a new
  `dump-tagged`, which keeps the dump protocol at `(stage form)` and therefore works with
  the Chez driver's two-argument dumper too.
- [x] 3.2b `compile-library*` took a `dump` parameter and never used it — libraries dumped
  nothing on any host. Wire it up per define (`unit-def-lcode`/`unit-lcode-tagged`).
- [x] 3.3 Replace the five hardcoded `no-dump` arguments in `src/repl-core.ss`
  (`:244`, `:350`, `:370`, `:379`, `:432`) with the dumper built from `(%dump-level)`.
- [x] 3.4 Build the dumper in `src/entry-embed.scm` and `src/entry-schemec.scm` and pass it
  into `compile-source-string` / `compile-source-rehomed` (adding the parameter where those
  convenience entries in `src/core.ss` currently hardcode `no-dump`).
- [x] 3.5 Confirm `src/core.ss` still contains no port write and no environment probe — the
  dumper is constructed at the entry layer only (design D3, `compiler-pipeline`'s
  core-purity requirement).

## 4. Host flag plumbing (`src/emit.cpp`)

- [x] 4.1 Parse `--dump` and `--dump-all` in `emit_run` (`~:302`), `emit_build`,
  `emit_lib`, and `emit_repl`, and reject them nowhere else; extend each door's usage text
  and the top-level `usage()` (`~:898`).
- [x] 4.2 Compute the dump level once — `--dump`/`--dump-all` wins, else
  `EMIT_VERBOSITY=verbose` gives level 1, else 0 — mirroring `src/compile.ss:682`, and
  `setenv("EMIT_DUMP_LEVEL", …)` before the first `scheme_entry()` call (as
  `EMIT_NO_PRELUDE` is set at `~:340`).
- [x] 4.3 Do the same in `src/run-boot.cpp` (`~:77`) so the bootstrap runner can dump when
  debugging a regen.
- [x] 4.4 Re-check that no door writes dump output to stdout, including the `--emit` and
  `--resolve-program` paths.

## 5. Stage 2 of the staged bootstrap

- [x] 5.1 Run `make regen` with the stage-1 seed; record the iteration count and confirm
  convergence.
- [x] 5.2 Run `./run-all-tests.sh` and `./run-dev-tests.sh` (incl. trust-check and
  `test/self-host-fixpoint.sh`); commit the regenerated `bootstrap/*.ll`.
- [x] 5.3 Report the size delta: `build/emit` 1042104 -> 1059960 (+17856, +1.7%);
  `schemec.ll` +75946, `embed.ll` +76794, `embed-repl.ll` +83504, `scheme.base.ll` +68
  (the two declares only); authored source +282/-79 over 9 files. A delivered user
  executable grows only by the runtime's `+576` bytes (`runtime.o` 35016 -> 35592) — the
  printer is compiler-internal, as intended. Note a delivered exe cannot be compared
  byte-wise: two *identical* `emit build` runs already differ (Mach-O `LC_UUID`, and even
  in size, 130592 vs 130600), so the emitted IR is the invariant to check.

## 6. Verification

- [x] 6.1 Add a Chez-free stdout-invariance check to `run-all-tests.sh`: `emit run --emit`
  vs `emit run --emit --dump` on a program using macros, closures, and an import must be
  byte-identical (design D6).
- [x] 6.2 Add the same invariance check for `emit lib` artifacts (`.ll` and `.exports`),
  and for `emit build` check the **emitted IR** plus that the delivered exe still runs with
  the same output — not exe byte-identity, which the linker does not provide (see 5.3).
- [x] 6.3 Add a Chez-gated dump-parity check to `run-dev-tests.sh`: split the Chez driver's
  `--dump` stderr and `emit run --dump` stderr on the stage headers, `read` each section,
  and assert equal stage names, order, and `equal?` forms (design D5).
- [x] 6.4 Add a stage-list assertion covering the modular path's seven stages and the
  per-form path's form-qualified headers.
- [x] 6.5 Add a REPL check that `emit repl --dump` dumps each entered form and leaves the
  session's values and redefinition behavior unchanged.
- [x] 6.6 Verify on a machine (or a `PATH` with `chez` removed) that build, run, REPL, and
  dump all work with no Chez present. Done: `run-all-tests.sh` is 11/11 on a `chez`-free
  `PATH`, with no `chez` diagnostic anywhere.

Two defects the verification work surfaced, both fixed here:

- [x] 6.7 **The Chez driver's `--dump` was ignored on its DEFAULT path.**
  `build-modular-artifacts*` passed `no-dump` (`src/compile.ss:559`), so
  `chez … --dump prog.scm` printed *nothing* unless `--no-prelude` was given — only the
  non-modular `compile-file` path ever dumped. Publish the selected dumper as `*dumpf*`
  and use it for the program unit. A deviation from design D10 ("leave the driver
  alone"), justified: it wires the *existing* dumper rather than changing it, and
  without it the modular path — the one every door takes, and the one carrying the three
  newly-dumped stages — has no reference for D5 to check against.
- [x] 6.8 **Write-style string output escaped nothing, so a dump was not readable data.**
  `print_val`'s `HDR_STRING` arm wrote raw bytes inside quotes, so a string constant
  holding a quote dumped as `(const "a"b")` — unreadable, and `equal?`-incomparable
  against the Chez reference. It also made the runtime's `write` non-conformant
  (R7RS requires written output to read back). Escape `\" \\ \n \t \r` — exactly what
  this project's own reader (`read-from-string`) understands — and count the extra columns
  in `datum-width`. No demo expectation changed (none writes such a string); locked in by
  a parity case whose reference is Chez's escaping.

## 7. Documentation

- [x] 7.1 `README.md` — add `--dump` to the quick-start door examples and state that stage
  inspection no longer needs Chez; update the Chez-role paragraph to "verification and
  genesis only".
- [x] 7.2 `docs/PIPELINE.md` — update the `--dump` references to name the shipped binary,
  and document the modular/per-form stage coverage and the form-qualified headers.
- [x] 7.3 `docs/OUTPUT.md` — document `--dump`/`--dump-all`, `EMIT_DUMP_LEVEL`, its
  relationship to `EMIT_VERBOSITY`, and the stderr/stdout discipline for dumps.
- [x] 7.4 `docs/PRIMITIVES.md` — record `%dump-level` and `%stderr-write` as reserved
  `%`-ops (not shadowable user-facing bindings) and note the staged bootstrap they required.
- [x] 7.5 Run `make catalogue` to refresh `docs/COMPLEXITY.md` after the source growth
  (authored 27 files/8162 LOC -> 28/8581). Note the refresh also absorbs pre-existing drift:
  the last catalogue run was at `c00621e`, and `6cb266b` added `docs/r7rs/*.md` without one,
  so docs/reference reclassify independently of this change.
