## Context

The persistent REPL host (`build/repl-host`) is a C++ program that links a compiled
snapshot of the C runtime (`src/runtime/runtime.c` → `runtime-host.o`) into itself and
exports the `rt_*` symbols with `-rdynamic`. At runtime the ORC/LLJIT
`DynamicLibrarySearchGenerator::GetForCurrentProcess` resolves the `rt_*` (and GC) symbols
that JIT'd modules reference *from the host process image*. Consequently the set of runtime
functions available to JIT'd code is frozen at host-build time.

The prelude (`src/prelude.scm`) is loaded into the REPL as a single `emit-repl-batch`
module. If that module references any `rt_*` symbol the host binary lacks, the *entire*
prelude module fails to materialize, so none of its global slots
(`@"map.g4"`, `@"reverse.g2"`, …) are ever defined. Every subsequent form that references
a prelude global then declares it `external`, the JIT cannot find it, and the form's own
entry thunk fails with `Failed to materialize symbols: { ___repl_N }`.

This is what happened: the vectors and string-mutation changes added `rt_equal`,
`rt_make_vector`, `rt_vector_set`, `rt_list_to_string`, and `rt_string_eq` to
`runtime.c` *after* `build/repl-host` was last built. The build was never refreshed
because every caller gates on existence, not freshness:

- test harnesses: `if [ ! -x build/repl-host ]; then src/repl/build-host.sh; fi`
- driver: `ensure-host` in `src/compile.ss` uses `(file-exists? repl-host-path)`

`build/` is gitignored, so a fresh clone (no binary → rebuild) passes while a working
tree with a stale binary fails — the failure is local-artifact drift, invisible in git.

Batch (AOT) compilation is unaffected because `clang` links the *current* `runtime.c`
freshly on every compile; only the long-lived, prebuilt host caches a runtime snapshot.

## Goals / Non-Goals

**Goals:**
- The host binary is rebuilt automatically whenever the runtime source, the host source,
  or the build recipe changes — before the host is used by either the driver or the tests.
- Rebuilds are incremental: an unchanged source's object is not recompiled, and an
  up-to-date host triggers no compilation at all.
- A single freshness-aware build entry point is shared by the tests and the driver, so the
  existence-gate blind spot cannot be reintroduced in one caller but not another.

**Non-Goals:**
- Changing the runtime-snapshot architecture itself (e.g. loading the runtime as a shared
  library the JIT dlopens, which would remove the rebuild requirement). Out of scope; the
  snapshot model stays.
- Content-hash-based staleness detection. Timestamp (mtime) dependency tracking is
  sufficient for the local dev loop; hashing is deferred unless the mtime caveat below
  proves painful.
- Any change to batch/AOT compilation or to emit/runtime source.

## Decisions

### D1: Use a `make` dependency graph, not hand-rolled shell timestamp checks

Add an explicit `build/Makefile` (or a top-level `Makefile` with a `build/repl-host`
target) with separate rules:

```
build/repl-host: build/host.o build/runtime-host.o <recipe>
build/runtime-host.o: src/runtime/runtime.c <recipe>
build/host.o: src/repl/host.cpp <recipe>
```

Each object depends on its own source and on the Makefile itself (so a flag change in the
recipe forces a rebuild). `src/repl/build-host.sh` either becomes the backend the rules
call, or is retired in favor of the rules holding the compile/link commands directly.

**Why over a bash `-nt` check:** `make` *is* timestamp-based dependency checking, so the
two approaches share the same mtime foundation — but `make` gives per-object granularity
for free (the current `build-host.sh` recompiles both objects every run), forces
prerequisites to be enumerated declaratively (the bug was an *incomplete* condition —
`exists?` — and a hand-rolled check would just as easily omit `host.cpp` or the recipe),
and expresses "rebuild when the recipe changes" with the standard "depend on the Makefile"
idiom. The cost is a second build idiom in an otherwise all-bash repo; an explicit,
no-implicit-rules Makefile keeps that transparent, in line with the project's simplicity
goal.

### D2: Callers invoke the build unconditionally; the build decides

Both the test harnesses and `ensure-host` call `make build/repl-host` (a no-op when
up to date) on *every* run, replacing `[ ! -x … ]` and `(file-exists? …)`. The freshness
decision moves entirely into the dependency graph — there is no existence gate left in any
caller. `ensure-host` in `src/compile.ss` shells out via `system` exactly as it already
does for `build-host.sh`, checking a non-zero exit for build failure.

**Why:** `make`'s value is realized only when it is on the always-run path; wrapping
`make` in an "only if missing" gate would reproduce the original bug with nicer syntax.

### D3: Accept the mtime caveat explicitly

`git checkout`/`clone` sets working-tree mtimes to checkout time, not commit time, so a
source file can end up *older* than a pre-existing binary even when its content differs.
Neither `make` nor a shell `-nt` check would rebuild in that case. This is rare in a
local edit loop (editing a source updates its mtime) and the only fully robust fix is
content hashing (a stamp file), judged overkill here. Documented as an accepted
limitation rather than silently omitted.

## Risks / Trade-offs

- **New build idiom (Makefile) in an all-bash repo** → Keep it a short, explicit Makefile
  with no implicit/pattern-rule magic; the compile/link commands mirror the existing
  `build-host.sh` so it reads the same.
- **mtime can go backwards on checkout/clone (D3)** → Accepted limitation; documented. A
  developer who hits it can `touch` the source or `rm build/repl-host`. Deeper fix
  (content hash) deferred.
- **Two consumers of the build (tests + driver) drifting again** → Mitigated by a single
  target/recipe both call; there is no longer a per-caller existence check to get wrong.
- **`build-host.sh`'s optional `OUT` argument** (used to build to a custom path) is less
  natural with a fixed Makefile target → If that flexibility is still needed, keep
  `build-host.sh` as a thin wrapper that invokes the target, or make the output path a
  Make variable. Verify no caller relies on a non-default `OUT` first.

## Migration Plan

1. Add the Makefile rules and confirm a clean build produces a working `build/repl-host`.
2. Repoint `ensure-host` and the four REPL test scripts at the freshness-aware build.
3. With a deliberately stale binary present, confirm the three previously failing cases
   (`library-map`, `in-language-reader`, `prelude`) now pass, and confirm an up-to-date
   binary triggers no recompilation.
4. Rollback is trivial: the change touches only build glue and gitignored artifacts; revert
   the scripts/driver/Makefile to restore prior behavior.

## Open Questions

- Retire `src/repl/build-host.sh` entirely, or keep it as a wrapper over the Make target
  for the `OUT`-argument use case? Resolve by checking whether any caller passes a custom
  `OUT` (none found in the tree today).
- Top-level `Makefile` vs. `build/Makefile` — a top-level file is more discoverable and
  could later absorb the demo/test roll-ups; `build/` keeps build glue self-contained.
