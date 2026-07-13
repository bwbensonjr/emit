## Why

The interactive REPL and its test suites gate the persistent JIT host on *existence*
only (`[ ! -x build/repl-host ]` in the test scripts; `(file-exists? repl-host-path)`
in `compile.ss`'s `ensure-host`). Because the host links a *snapshot* of the C runtime
into itself and the ORC JIT resolves `rt_*` symbols only from the running host process,
any `rt_*` function added to `src/runtime/runtime.c` after the host was last built is
absent from the binary. When the prelude (loaded as one batch module) references such a
function, the whole prelude module fails to materialize, so every prelude-defined global
becomes unresolvable and every later form that references one fails with
`Failed to materialize symbols`. This silently broke three test cases
(`library-map`, `in-language-reader`, `prelude`) after the vectors and string-mutation
changes added `rt_equal`, `rt_make_vector`, `rt_vector_set`, `rt_list_to_string`, and
`rt_string_eq`, and it bites the live REPL identically.

## What Changes

- Add a dependency-driven build for the REPL host so `build/repl-host` is rebuilt
  whenever `src/runtime/runtime.c`, `src/repl/host.cpp`, or the build recipe change —
  not merely when the binary is missing. A small explicit `build/Makefile` (or top-level
  target) expresses the prerequisites; `runtime-host.o` and `host.o` gain independent
  rules so only the changed object recompiles.
- Change the REPL test harnesses (`repl-interactive-tests.sh`, `repl-equiv-tests.sh`,
  `repl-host-tests.sh`, `repl-batch-tests.sh`) to *always* run the freshness-aware build
  (a no-op when up to date) instead of gating on `[ ! -x build/repl-host ]`.
- Change `ensure-host` in `src/compile.ss` to invoke the same freshness-aware build on
  every REPL launch instead of only when the binary is absent, closing the identical
  blind spot for real interactive users.
- Document the known mtime caveat (a `git checkout`/`clone` can set source mtimes behind
  an existing binary, so a timestamp-based rebuild — make or otherwise — may not fire) as
  an accepted limitation.

## Capabilities

### New Capabilities
<!-- none -->

### Modified Capabilities
- `interactive-repl`: Add a requirement that the persistent JIT host is kept in sync with
  the runtime source before use — the host is (re)built whenever the runtime or host
  sources change, so JIT'd code (including the prelude) can always resolve every `rt_*`
  function the current runtime defines.

## Impact

- **Build**: new `build/Makefile` (or equivalent target); `src/repl/build-host.sh` either
  becomes the recipe backend or is superseded by the Makefile rules.
- **Tests**: `test/repl-interactive-tests.sh`, `test/repl-equiv-tests.sh`,
  `test/repl-host-tests.sh`, `test/repl-batch-tests.sh` drop the existence-gate and call
  the freshness-aware build.
- **Driver**: `ensure-host` in `src/compile.ss`.
- **Artifacts**: only the gitignored `build/` tree; no tracked runtime or emit source
  changes. No behavior change to batch (AOT) compilation.
