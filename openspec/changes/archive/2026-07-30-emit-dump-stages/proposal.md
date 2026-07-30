## Why

Per-pass IL inspection — the `--dump` flag — is the project's primary window into the
compiler, and it is the **last developer-facing capability that still requires Chez
Scheme**. The dumper lives in the Chez driver (`src/compile.ss:139`), which is the only
caller that passes a real `dump` procedure into the core; every Chez-free door
(`emit run`, `emit build`, `emit lib`, `emit repl`) hardcodes `no-dump`
(`src/core.ss`, `src/repl-core.ss:244,350,370,379,432`). So the shipped binary — the one
the README tells users to build and the one whose behavior actually ships — cannot show
its own stages, and a developer debugging a lowering bug in the REPL must reproduce it
under a second, differently-driven compiler to see the IL.

That inverts the project's stated posture: the compiled compiler is the authoritative
form, and Chez survives only as the genesis (`historical/genesis/`) and an optional CI
trust-check. It also leaves the embedded compiler with **no narration channel at all** —
it has `%display`/`%write` to stdout, but stdout on the `--emit`/`schemec` paths carries
IR, so the Chez-free doors cannot satisfy the `tooling-observability` requirement that a
compiler announce its stages at verbose verbosity.

## What Changes

- **`--dump` on the shipped `emit` binary.** `emit run`, `emit build`, `emit lib`, and
  `emit repl` accept `--dump` (and the `EMIT_DUMP` environment variable), printing the IL
  after each named pass to **stderr**, so stdout stays byte-identical — `emit run --emit`
  under `--dump` must emit exactly the same IR bytes, keeping regen and the trust-check
  safe.
- **A stderr narration channel for the embedded compiler.** Two new runtime primitives:
  one to write a value to stderr (write-style, sharing the existing tag-walking printer),
  one to read the host-forwarded flag — following the exact channel the `--no-prelude`
  parity requirement already establishes (`EMIT_NO_PRELUDE` → `%no-prelude?` →
  `rt_no_prelude_p`).
- **Stage coverage closed on the modular path.** `compile-program-with-imports` — the path
  every door now takes — runs `recognize-let`, `convert-assignments`, and
  `convert-closures` but dumps none of them (`src/core.ss:387`); the per-form REPL path
  (`repl-lower-form*`) dumps nothing. Both are brought up to the seven stages the
  whole-program path already exposes.
- **A readable dump format in-language.** Chez's dumper uses `pretty-print`; the embedded
  compiler has only a flat writer. A minimal in-language pretty-printer gives the
  Chez-free dump the same readability, since readability *is* the deliverable.
- **`-v` stage announcements on the Chez-free doors,** using the same channel — the
  concise `stage <name>` trace the Chez driver already emits at
  `EMIT_VERBOSITY=verbose`.
- **Chez `--dump` retained,** unchanged, as the independent-host reference a parity check
  compares against.
- **Staged bootstrap.** New `%`-ops must be learned by the committed seed before the
  compiler's own source may call them, so this lands as two `make regen` stages (the D3
  lesson from `first-class-primitives`).

## Capabilities

### New Capabilities

None — this closes gaps in existing capabilities rather than introducing a new one.

### Modified Capabilities

- `aot-codegen`: "Each pipeline stage is independently observable" is today satisfiable
  only through Chez and only on the whole-program path. It is strengthened to require the
  shipped compiler expose the dump, and to cover the modular and per-form paths.
- `emit-cli`: adds `--dump` to the `run`, `build`, `lib`, and `repl` verb surfaces,
  with the stdout-invariance guarantee for `emit run --emit`.
- `compiler-embedding`: adds a stage-dump/narration requirement for the embedded
  compiler — a stderr channel plus the host-forwarded flag — parallel to the existing
  "runner supports --no-prelude parity" requirement.
- `tooling-observability`: extends the conforming-tool list and the verbosity requirement
  to the Chez-free doors, which currently cannot narrate.
- `self-hosting`: records that no developer-facing compiler capability requires Chez —
  Chez is retained for verification (trust-check, fixed point, dev suite) and the frozen
  genesis only.

## Impact

**Code**

- `src/runtime/runtime.c` — two new primitives (stderr writer, dump-flag reader).
- `src/emit.ss` — `prim-table` entries + the emitted `declare` list.
- `src/parse.ss` — the reserved `%`-op head set.
- `src/core.ss` — `dump` threading: the missing `compile-program-with-imports` stages, and
  a real dumper constructed in-language rather than only injected by the driver.
- `src/repl-core.ss` — replace the five hardcoded `no-dump` arguments with the
  flag-derived dumper; thread it through the mode dispatch.
- `src/parse.ss` (`repl-lower-form*`) — accept a dumper for the per-form stages.
- `src/util.scm` — the in-language pretty-printer (compiler-internal, not prelude).
- `src/emit.cpp` — `--dump` parsing on four verbs; forward via `setenv`.
- `src/compile.ss` — unchanged behavior; retained as the parity reference.

**Artifacts and process**

- `bootstrap/*.ll` regenerated **twice** (staged bootstrap), with the full dev suite and
  trust-check green at each stage.
- Binary-size impact on the shipped compiler from the added printer — the project treats
  binary size as a design concern, so it is measured and reported.

**Docs and tests**

- `README.md`, `docs/PIPELINE.md`, `docs/OUTPUT.md` — the flag, the stage list, the
  stream discipline.
- New checks: stdout byte-invariance under `--dump`, dump-vs-Chez parity, and the
  stage-list assertion; wired into `run-all-tests.sh` (Chez-free parts) and
  `run-dev-tests.sh` (the Chez parity check).
