## 1. Support files: ship them, then find them (#36, first half)

- [ ] 1.1 Replace `repo_root()` (`src/emit.cpp:219`) with a support-file resolver taking a
      repo-relative path and returning the first readable of: `<checkout>/<relpath>` (the current
      derivation), `<exe>/../share/emit/<relpath>`, `<EMIT_PREFIX>/share/emit/<relpath>` — the same
      candidate order and symlink-resolved `exe_path()` the manifest lookup already uses (design D5)
- [ ] 1.2 Point `discover_toolchain()` (`src/emit.cpp:980`) at the resolver for
      `tools/llvm-env.sh`, so the popen'd path is resolved rather than assembled from a root
- [ ] 1.3 Point the `runtime.c` path (`src/emit.cpp:1142`) at the resolver for
      `src/runtime/runtime.c`; report a resolver miss by name rather than handing a nonexistent
      path to clang
- [ ] 1.4 Extend `make install` to ship `tools/llvm-env.sh`, `tools/log.sh` (sourced by
      `llvm-env.sh` for its narration — installing the script without it yields a script that fails
      on its first line), and `src/runtime/runtime.c`, each at its **repo-relative subpath** under
      `$(SHAREDIR)`; keep the target idempotent and keep `DESTDIR` prepended to every written path
- [ ] 1.5 Update the install target's narration to count support files alongside the library
      sources, in `docs/OUTPUT.md` form
- [ ] 1.6 Verify by hand: `make install PREFIX=<tmp>`, then from a project directory holding a
      manifest with a `(program …)` entry, `env -u CC -u GC_INC -u GC_LIB <tmp>/bin/emit build …`
      produces a runnable executable

## 2. Compiled-in toolchain defaults (#36, second half)

- [ ] 2.1 Record the toolchain the build resolved as `-DEMIT_DEFAULT_CC` / `-DEMIT_DEFAULT_GC_INC`
      / `-DEMIT_DEFAULT_GC_LIB` on the `emit` compile line, beside the existing `EMIT_PREFIX`
      define, sourced from the same `llvm-env.sh` values the rest of the build uses
- [ ] 2.2 Confirm `DESTDIR` staging does not change the recorded values (they describe the build
      machine's toolchain, not the install tree) and that `PREFIX` does not either
- [ ] 2.3 Add the third precedence layer to `discover_toolchain()`: explicit env, then
      `llvm-env.sh` discovery, then the compiled-in defaults — lowest, so a live discovery result
      always wins over a recorded path (design D6)
- [ ] 2.4 When the compiled-in defaults are the layer used and the link fails, report the recorded
      path and identify it as a build-time default, rather than surfacing only clang's error
- [ ] 2.5 Verify all three layers by hand: explicit `CC`/`GC_*` wins; with those unset a working
      `llvm-env.sh` wins over the recorded values; with discovery made to fail the recorded values
      are used

## 3. Manifest chaining (#44)

- [ ] 3.1 Change `resolve_manifest()` (`src/emit.cpp:255`) to return an ordered **list**: an
      explicit `--manifest` / `EMIT_MANIFEST` request yields exactly one entry (or the existing
      error), while candidates 3-5 yield every one that exists, in order (design D1, D2)
- [ ] 3.2 Resolve a library name by walking the list and taking the first manifest that names it;
      keep each entry's relative `(source …)` resolved against **its own** manifest's directory —
      `manifest_relative()` already takes the manifest, so thread the right one (design D3)
- [ ] 3.3 Keep program-entry lookup on the **first** manifest only, so
      `emit: no program entry in manifest <path>` keeps naming the project's own file (design D4)
- [ ] 3.4 Make the REPL's eager preload span the chain (union of the manifests' libraries), keeping
      the existing `already`/`deferred` handling for a name a later manifest repeats (design D7)
- [ ] 3.5 Update `say_manifest()` to narrate each resolved manifest in order, and name the manifest
      that supplied a library when it is not the first — `docs/OUTPUT.md` form, stderr only, absent
      at `EMIT_VERBOSITY=quiet`, stdout byte-identical either way (design D8)
- [ ] 3.6 Measure `emit repl` startup from a project directory against an install, before and
      after 3.4. If the added compiles are material, fall back to eager-first-manifest plus
      on-demand for later ones (internal to `preload_libraries`; no requirement changes) and record
      the measurement in the change

## 4. Tests

- [ ] 4.1 Extend `test/install-layout-tests.sh` (the #35 suite that already installs into a temp
      prefix and drives the installed binary from an unrelated directory) with the `emit build`
      case: a project directory, a manifest with a program entry, no `CC`/`GC_INC`/`GC_LIB` in the
      environment, asserting the delivered executable exists and runs
- [ ] 4.2 Add the chaining cases to the same suite: a project manifest that names only its own
      entries still resolves `(scheme inexact)`; a project entry of the same name as a shipped
      library wins; `--manifest FILE` does **not** chain; `emit build` with an unknown program name
      names the project's manifest and does not search the installed one
- [ ] 4.3 Add a from-source guard: with an Emit installed under a temp prefix, an in-repo door
      still resolves the repository's own manifest and support files for everything the repository
      provides
- [ ] 4.4 Confirm the suite stays Chez-free and keeps its place in `run-all-tests.sh:71`; widen its
      header comment to cover the toolchain/runtime half, since the suite is no longer only about
      the manifest lookup
- [ ] 4.5 Run the full `./run-all-tests.sh`, and `./run-dev-tests.sh` for the Chez-gated byte-identity
      suites — the guard that the `resolve_manifest()` refactor is transparent in a checkout

## 5. Docs and downstream

- [ ] 5.1 `docs/MODULES.md`: describe the chain in the manifest section — searched candidates
      extend, explicit requests do not, program lookup does not chain
- [ ] 5.2 `docs/PROJECTS.md`: remove the #44 sharp-edge note and replace it with what a project
      manifest now needs (only its own entries)
- [ ] 5.3 `openspec/changes/homebrew-tap-distribution/tasks.md`: redirect task 3.2 from designing
      an installed toolchain default to depending on this change's ladder; note the formula still
      needs the keg-only clang path wired, which is separate
- [ ] 5.4 `docs/PERFORMANCE.md`: record the deferred prebuilt-runtime idea (shipping `runtime.o` or
      an archive would drop a C compile from every `emit build`) with the reason it is deferred —
      the install contract excludes compiled artifacts on purpose
- [ ] 5.5 `openspec/explorations/library-sources-and-artifacts.md`: mark open question 3 as
      narrowed — the chain answers the reported defect without settling manifest-vs-library-path —
      and update the Finding 1 AMENDED note, whose closing sentence describes the #44 symptom this
      change removes
- [ ] 5.6 Comment on #36 recording the correction this change is built on: `emit lib` is **not**
      affected (`repo_root()` has one caller, the build door; `emit lib` emits `.ll` and never
      links), verified from an install prefix
- [ ] 5.7 Reference both issues from the implementing commits (`Fixes #36`, `Fixes #44`); keep the
      negated-keyword trap in mind for the PR body if any part is left open
