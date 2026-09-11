## Why

`emit repl` takes **2.21 s** to reach a prompt in this repository, and **1.82 s** of that is
`(scheme char)` — a manifest library the session never imports, whose 4.0 MB of IR is
code-generated at startup because the door runs every preloaded unit's `__init` eagerly
(`docs/PERFORMANCE.md` P23). The cost is not compilation: `baked-set-artifact-cache` and
`chez-free-unit-pipeline` made every unit a cache hit, so what is left is ORC materialization that
only happens because an eager `run_init` looks the module up. ORC would otherwise defer it.

`CLAUDE.md` names the REPL the primary development loop, and a 6x startup penalty falls on every
session. The penalty also scales with the manifest, so a project with a larger library set pays
more than this repository does.

`baked-set-on-every-door` explicitly left this alone — "Making the REPL lazy. It stays eager (a
session is an open world)" — and `interactive-repl` carries that decision as a requirement
sentence. This change revisits exactly that sentence, having measured what it costs, and keeps the
open world it was protecting.

## What Changes

- A manifest library's `__init` runs when a session **first imports** it, not at startup. Every
  manifest module is still read, cache-loaded and added to the JIT at startup, so the open world is
  unchanged: any prompt may still import any manifest library, and a library that fails to load is
  still reported at startup rather than at the import.
- An `(import (L))` at the prompt runs `L`'s deferred `__init`, and those of the libraries `L`
  imports, in dependency order, before the session scope gains `L`'s names. Each runs at most once
  per session.
- The **baked set stays eager**. `(scheme base)` and the substrate are auto-imported into every
  session, so deferring them buys nothing and risks the session's standard library. The `register
  baked library` narration and the 0.34 s no-manifest start are untouched.
- The compiler's `import` status gains the library names it imported, so the host knows which
  deferred inits to run. Today it returns an empty payload.
- Running a deferred `__init` is narrated at verbose verbosity, following `docs/OUTPUT.md`.
- **Not** changed: the `run`, `build` and `lib` doors (the run door already preloads only a
  program's import closure), `--no-prelude`, the manifest chain, the cache, and the JIT
  optimization profile.

## Capabilities

### New Capabilities

None. This changes when existing work happens, not what the system can do.

### Modified Capabilities

- `interactive-repl`: the requirement that "Preloading of the manifest's own libraries SHALL remain
  eager" is replaced by one that defers a manifest library's initialization to its first import
  while keeping its registration eager, plus the session-scope and at-most-once guarantees that
  makes necessary.

## Impact

- `src/emit.cpp` — `preload_libraries` stops calling `run_init` and records the pending init
  symbol per unit; `process_form`'s `import` arm runs the pending inits for the named libraries.
  Host-side only; reaches the binaries through plain `make`.
- `src/repl-core.ss` — the `import` status carries the imported library names, and the existing
  `*repl-lib-imports*` direct-import alist supplies the dependency order. **This file is in
  `CORE_FLAT`'s regen set**, so the change crosses the `make regen` barrier: one edit, then regen,
  then both suites.
- `openspec/specs/interactive-repl/spec.md` — one requirement modified.
- `docs/PERFORMANCE.md` — P23 ticks its first fix and re-rates what remains (the `.bc`/`.o`
  object-code cache, and shrinking `(scheme char)`'s IR).
- Tests — `test/`'s REPL suites gain coverage for import-time initialization, at-most-once, and
  the observability surface P3's cache regression taught this project to check.
