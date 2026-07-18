## Context

Slices #2/#3 proved the module surface; this slice delivers the unified front-end D7
always intended. Today there are four entry points:

- `build/scheme-run` — `src/run.cpp` (run.o) + runtime-host.o + `embed-repl.ll` +
  `scheme.base.ll`. In-process JIT-and-run; also `--emit` (Chez-free AOT front half)
  and `--resolve-program` (slice #2).
- `build/repl-host` — `src/repl/host.cpp` (host.o) + runtime-host.o + `embed-repl.ll`
  + `scheme.base.ll`. Persistent ORC/LLJIT REPL.
- `bin/scheme-compile` — bash: `scheme-run --emit` + `clang` link → native exe.
- `bin/emit` — bash (slice #2): `emit build` = resolve program entry + `bin/scheme-compile`.

Key fact enabling the merge: **`scheme-run` and `repl-host` link byte-for-byte the same
embedded compiler IR** (`embed-repl.ll` + `scheme.base.ll`); they differ *only* in the
C++ `main` (`run.o` vs `host.o`). Both drive the compiler through the `rt_repl_set(mode,
…)` / `scheme_entry()` channel. So one binary can host both by dispatching on a verb.

`schemec` is different in kind — `runtime.c` compiled with `-DRT_FILTER_MAIN` linked with
`schemec.ll`. It is the batch text→IR *bootstrap seed* used by `tools/regen.sh`, not a
user door, and stays as-is.

User decisions: **single merged binary** (not a bash dispatcher over sub-binaries), and
**rename now** (old names removed, no external shims).

## Goals / Non-Goals

**Goals:**

- One compiled `emit` binary, the sole user-facing entry point, with verbs
  `lib` / `build` / `run` / `repl`.
- `emit run` / `emit repl` behavior identical to today's `scheme-run` / `repl-host`.
- `emit build` behavior identical to slice #2, now self-contained (the binary forks
  `clang`); `emit lib` a new Chez-free compile-unit door.
- The self-hosting bootstrap (`tools/regen.sh`) runs through `emit`, byte-stable.
- Every test/demo/doc migrated; no dangling references to the removed names.

**Non-Goals:**

- No change to compiler/runtime *semantics* — this is a CLI/packaging + host-merge
  change. Emitted IR and program values are unchanged.
- `schemec` (bootstrap seed filter) is not renamed or absorbed.
- No tree-shaking on the Chez-free door (still deferred).
- No dependency model (registry/lockfile) — deferred.

## Decisions

### D1: One binary, C++ verb dispatch; merge run.o + host.o

`build/emit` links a unified `main` that reads `argv[1]` and dispatches:
`run`/`repl`/`build`/`lib`. The bodies of `src/run.cpp` and `src/repl/host.cpp` become
internal entry functions (`emit_run(argc,argv)`, `emit_repl(argc,argv)`) in the merged
translation unit(s), linked once with `runtime-host.o` + `embed-repl.ll` +
`scheme.base.ll`. Shared helpers (`read_file`, `scm_str`, `status_of`, `add_ir`, the JIT
setup, `preload_user_libraries`) are dedup'd into one place — they are near-duplicated
across the two files today.

- **Why a single binary** (per the user's choice): one artifact to ship; the two hosts
  already share all their IR and most of their helpers, so the merge is mostly at the
  `main`/dispatch layer, not a semantic rewrite.
- **Trade-off**: one binary is larger than either door alone, and couples the run/REPL
  link. Accepted — it is still one clean self-contained executable, and both doors
  already carry the same embedded compiler.

### D2: `emit build` / `emit lib` fork `clang` from the binary

`emit build` reimplements `bin/scheme-compile`'s pipeline in the binary: emit the
program IR in-process (the existing `--emit` path — units on the boundary marker), then
`fork`/`exec` `clang` with the discovered toolchain flags (`CC`, `GC_INC`, `GC_LIB`, host
triple) to link runtime + units → native exe. Toolchain discovery still comes from
`tools/llvm-env.sh` — the binary reads the resolved values from the environment its
launcher exports (or a small `--print-env` consult), matching how `bin/scheme-compile`
sources it today.

`emit lib SRC` emits one library unit's `.ll` and writes its `.exports` table (no link),
under `-o DIR` (default `build/lib`), named by the library's `define-library` name
(`lib-basename` → `foo.bar.ll` / `foo.bar.exports`).

- **Alternative rejected (keep build in bash)**: contradicts the single-binary decision
  and would leave two languages owning the build pipeline.

### D3: `emit lib` needs a new embedded-compiler mode for the export table

The Chez-free path can already emit a lone unit's `.ll` (`--emit` on a `define-library`
source). What it cannot yet surface is the `.exports` table (`(NAME ((external .
"mangled") …))`) — the Chez driver writes that; the embedded compiler computes it
internally in mode 4. Add a dispatch mode (next free integer, 11) to `src/repl-core.ss`
that, given a library source, returns the readable export-table text. `emit lib` writes
`.ll` (from the emit path) + `.exports` (from the new mode). This mirrors slice #2's
`--resolve-program` (mode 10): a small, additive mode reusing the proven channel.

### D4: Rename by removal; migrate all callers; keep the bootstrap byte-stable

The `Makefile` builds `build/emit` and drops the `scheme-run`/`repl-host`/`bin/scheme-compile`
targets. `tools/regen.sh` and `tools/log.sh` invoke `emit run --emit` where they used
`scheme-run`. `bin/scheme-compile` and `bin/emit` (bash) are deleted. Every `test/*.sh`,
`demos/*.sh`, `run-all-tests.sh`, `run-dev-tests.sh`, and doc migrates to `emit <verb>`.
The trust-check invariant (regen from a clean tree ⇒ empty `git diff bootstrap/`) must
still hold through `emit`.

### D5: Phased implementation (one change, safe order)

To keep the tree runnable at each step:
1. **Merge + dispatch**: build `build/emit` with `run`/`repl`/`build` verbs (behavior
   parity), keeping the old targets temporarily.
2. **`emit lib`**: add mode 11 + the `lib` verb.
3. **Cutover**: switch `regen.sh`/`Makefile`/tests/demos/docs to `emit`; regen; verify.
4. **Remove**: delete the old binaries/wrappers and their Makefile targets.

## Risks / Trade-offs

- **[Merging the two hosts could regress run or REPL behavior]** → They share the IR and
  channel; keep `emit_run`/`emit_repl` as faithful moves of the existing mains, and gate
  on the full run/REPL suites (`modules-run-tests`, `repl-host-tests`, `repl-interactive-tests`).
- **[Bootstrap breakage: regen drives the compiler through `emit`]** → Cut over regen only
  after `emit run --emit` is proven byte-identical to `scheme-run --emit`; verify the
  fixed point and the trust-check before removing the old names.
- **[Large migration surface → a missed reference]** → Grep-sweep for `scheme-run` /
  `repl-host` / `scheme-compile` across all non-archive files as an acceptance gate.
- **[`clang` invocation moved to C++]** → Mirror `bin/scheme-compile`'s exact flags and
  boundary-marker split; a parity test builds the same program both ways (the archived
  wrapper output vs `emit build`) before deletion.

## Migration Plan

Phased as in D5; each phase leaves the suite green. Rollback before the "Remove" phase is
trivial (old binaries still built). After removal, rollback is `git revert`. Regenerate
committed IR (`make regen`) as part of the mode-11 and any `repl-core.ss` change; commit
source + regenerated IR together.

## Open Questions

- **Toolchain env into the binary**: does `emit build` read `CC`/`GC_*` from the
  environment (exported by a tiny `emit` launcher that sources `tools/llvm-env.sh`) or
  consult `llvm-env.sh --print-env` itself? Prefer the launcher-exports path to keep
  single-sourced discovery; confirm in implementation.
- **`schemec` long-term**: kept as the bootstrap seed here; whether it eventually becomes
  `emit --emit`-only (dropping the standalone filter) is a separate future question.
- **`emit lib` `.stamp`**: whether to also write the compiler-identity `.stamp` sidecar
  (as the Chez driver does) or leave staleness to the build door; lean toward writing it
  for artifact-cache consistency.
