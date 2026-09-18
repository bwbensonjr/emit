# Tasks

## 1. Resolver Contract and Fixtures

- [x] 1.1 Add shared test fixtures for conventional `(my stats)` → `my/stats.sld` lookup,
  integer components, unsafe components, declaration-name mismatches, duplicate roots, and exact
  manifest overrides; verify the focused resolver tests fail for the intended missing behavior.
- [x] 1.2 Add mixed-provider project fixtures in which a conventional project library imports an
  installed-style library and a manifest-mapped exception; verify the fixtures define one expected
  dependency order and result for every path.

## 2. Shared Resolution Machinery

- [x] 2.1 Introduce the host-side provider/descriptor abstraction and safe name-to-relative-path
  derivation, including canonical root deduplication and per-session name memoization; verify focused
  tests cover each provider answer and first-match behavior.
- [x] 2.2 Refactor manifest indexing to feed exact provider records without changing manifest
  parsing, relative paths, chaining, program entries, or baked-name handling; verify existing
  manifest, degenerate-manifest, and chain tests remain green.
- [x] 2.3 Extend the compiler embedding protocol only as needed to validate a selected
  `define-library`, obtain imports, register an on-demand unit, and commit an import while keeping
  filesystem I/O in the host; verify Scheme-level protocol tests cover success, name mismatch, and
  recoverable failure.
- [x] 2.4 Implement the same provider order and conventional path rule in the bootstrap-only Chez
  driver; verify its focused AOT/JIT/bitcode module tests resolve the same fixture sources as the
  shipped host.

## 3. CLI and Resolver Configuration

- [x] 3.1 Add repeatable `-L` / `--library-path`, `EMIT_LIBRARY_PATH` parsing with host separators,
  empty-element rejection, and `--no-library-paths` to run, repl, build, and lib; verify each path's
  option tests cover ordering, environment fallback, opt-out, and unknown-option behavior.
- [x] 3.2 Construct project and installed default roots from the selected project manifest,
  invocation directory, resolved executable, and compiled prefix in the specified precedence;
  verify tests cover explicit out-of-tree manifests, symlinked executables, no-manifest projects,
  and physical-root deduplication.
- [x] 3.3 Add resolver narration that names the library, selected source, and provider kind while
  preserving stderr/stdout and verbosity rules; verify quiet, default, and verbose output fixtures
  follow `docs/OUTPUT.md`.

## 4. Run, Lib, and AOT Integration

- [x] 4.1 Replace manifest-index-only import closure walks in run and build with resolver callback
  walks, preserving cycle detection, dependency order, mixed-provider precedence, and exclusion of
  unreachable libraries; verify module run and AOT tests pass for path-only and mixed graphs.
- [x] 4.2 Route `emit lib` dependency resolution through the same resolver while keeping the named
  source as the unit under compilation; verify path-resolved imported procedures and macros produce
  the expected `.ll` and `.exports` artifacts.
- [x] 4.3 Validate cache entries only after provider selection and against the selected source
  identity; verify warm/cold output is byte-identical and a cached unit from an overridden source is
  rejected rather than changing precedence.
- [x] 4.4 Extend cross-path equivalence tests so one source resolved through a manifest and through a
  root produces byte-identical unit IR and compile-time interfaces; verify the new comparisons pass
  through the Chez and Chez-free paths.

## 5. On-Demand REPL Registration

- [x] 5.1 Add an import-time resolver handshake for names absent from the registered baked and
  manifest sets, recursively registering conventional dependencies before retrying the import;
  verify procedures, values, exported macros, re-exports, and diamond dependencies work in later
  forms.
- [x] 5.2 Make on-demand registration transactional for compiler/session state and keep scope merge
  after successful initialization; verify unreadable, mismatched, cyclic, compile-failing, and
  init-failing imports leave names unbound and the next form usable.
- [x] 5.3 Preserve eager registration and startup diagnostics for exact manifest entries while
  avoiding all startup scans or reads of conventional roots; verify an invalid unused path library
  is silent, an invalid manifest library is reported before the prompt, and existing deferred-init
  tests still pass.
- [x] 5.4 Verify REPL and build initialize the same mixed-provider closure dependency-first and at
  most once, and verify the REPL applies its selected JIT profile when a path library first
  materializes.

## 6. Installed Library Layout

- [x] 6.1 Update installation rules so every non-baked shipped library occupies its conventional
  `<prefix>/share/emit/lib/<components>.sld` path while retaining the installed manifest for exact
  exceptions and compatibility; verify a staged install contains both the expected hierarchy and
  no compiled library artifacts.
- [x] 6.2 Extend install-layout tests for executable-relative and compiled-prefix roots, symlinked
  launchers, project conventional overrides, installed fallback, and a removed source tree; verify
  all shipped non-baked libraries import from an unrelated working directory without project
  mappings.

## 7. Direct Application Builds

- [x] 7.1 Add syntax-based `emit build` operand classification for `.scm` and path-shaped sources,
  preserving bare manifest target names; verify classification does not depend on whether a
  same-named filesystem object exists.
- [x] 7.2 Deliver a direct source through the existing AOT/tree-shaking pipeline with `-o` and the
  `build/<source-basename>` default; verify one-file, conventional-project-library, installed-library,
  and mixed-provider applications produce working standalone executables without program entries.
- [x] 7.3 Preserve named `(program ...)` targets and their existing missing/empty/library-only
  manifest diagnostics; verify the project-build suite covers both direct and named modes.

## 8. System and User Documentation

- [x] 8.1 Update `docs/MODULES.md` as the system reference for provider records, exact precedence,
  safe path derivation, source-name validation, mixed dependency DAGs, artifacts, and cross-path
  byte identity; verify every resolver example corresponds to an automated fixture.
- [x] 8.2 Update the REPL architecture sections in `docs/MODULES.md` and relevant source/toolchain
  documentation to distinguish eager manifest registration, on-demand conventional registration,
  deferred initialization, and ORC materialization; verify terminology matches the interactive REPL
  spec and verbose narration.
- [x] 8.3 Update `docs/OUTPUT.md` with quiet/default/verbose hybrid-resolution examples and required
  input/output fields; verify output tests use those documented spellings.
- [x] 8.4 Rewrite the user path in `docs/PROJECTS.md` to lead with `main.scm` plus conventional
  `lib/<components>.sld`, direct run/build commands, and no manual library mappings; then document
  manifests for exceptional paths, overrides, named programs, artifact directories, and hermetic
  operation, and verify every published command succeeds in the project-path test fixture.
- [x] 8.5 Update `README.md`, command help, installation guidance, and any stale manifest-only
  examples to explain `-L`, `EMIT_LIBRARY_PATH`, default roots, opt-out flags, direct builds, and
  shipped-library fallback; verify `rg` finds no remaining claim that every non-baked library is
  reachable only through a manifest except historical material.

## 9. Regeneration and Verification Barrier

- [x] 9.1 Run Scheme formatting on the completed compiler-source edit set and verify
  `make format-check` passes before crossing the regeneration barrier.
- [x] 9.2 Run `make regen` once after all compiler-source edits are complete, make no further
  compiler-source edits during verification, and verify the self-hosting fixed point converges with
  a coherent `bootstrap/` diff.
- [x] 9.3 Run `./run-all-tests.sh` after regeneration and verify every default suite passes,
  including hybrid resolver, project-path, module, REPL, installation, cache, output, and
  byte-identity coverage.
- [x] 9.4 Run the independent `./run-dev-tests.sh` suites after regeneration and verify each passes;
  after the implementation and regenerated IR are committed, rerun `test/trust-check.sh` and verify
  committed bootstrap IR is reproduced byte-for-byte.
