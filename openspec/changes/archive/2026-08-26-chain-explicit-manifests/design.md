## Context

See `proposal.md` for motivation. `resolve_manifests` in `src/emit.cpp` already returns an ordered
vector consumed uniformly by `run`, `repl`, `build`, and `lib`, but it returns immediately after a
readable `--manifest` or `EMIT_MANIFEST` file. Only discovery through candidates 3–5 constructs a
chain. Downstream library indexing already implements first-entry precedence, manifest-relative
paths, supplying-manifest narration, lazy run/build loading, and eager REPL preload over any vector
it receives. Program lookup already calls `first_manifest` and therefore has the ownership rule the
new contract needs.

The installed manifest may be reachable twice: through the executable-relative candidate and the
compiled-in prefix. An explicit path can also name that same file. A chain must not load or narrate
one physical manifest twice. The host C++ is not compiler source under the regeneration barrier, so
this change should require an ordinary `make`, not `make regen`; the Scheme compiler core and the
bootstrap-only Chez driver need no change.

## Goals / Non-Goals

**Goals:**

- Separate selection of the project's first manifest from the policy for extending its library
  namespace.
- Make explicit and discovered project manifests use the same installed-library fallback while
  retaining deterministic precedence and transparent narration.
- Keep the behavior change localized to candidate construction and door option parsing; downstream
  compilation should continue to consume the same ordered manifest vector.
- Preserve an exact, intentional single-manifest mode for hermetic callers and test fixtures.

**Non-Goals:**

- Chaining program entries, inventing manifest include syntax, or adding a general library search
  path.
- Consulting an unrelated current working directory after a project manifest has been explicitly
  selected.
- Changing the bootstrap-only Chez driver's lookup. It is run from the repository root, is not
  installed, and has no meaningful executable-relative installed candidate.
- Changing import closure, artifact caching, library initialization, or manifest-relative path
  interpretation.

## Decisions

### D1 — Build the chain in two phases: project selection, then installed extension

`resolve_manifests` will take a chaining-policy boolean in addition to the explicit flag and error
result. It will first determine whether candidate 1 or 2 was selected:

- with an explicit request, validate and append that file, skip candidate 3, then consider
  candidates 4–5;
- without one, consider candidates 3–5 in their existing order.

When chaining is enabled, every readable installed candidate is appended after the first manifest.
When disabled, scanning stops after the first readable candidate. A missing explicit path remains
an error before any installed candidate is considered.

Skipping candidate 3 in the explicit case is essential. `--manifest /project/a/emit-libs.scm`
selects project A; silently inserting `/unrelated/cwd/emit-libs.scm` would mix two projects and make
the result depend on the build system's launch directory.

Alternative: treat all five candidates as one unconditional list. Rejected because it introduces
the unrelated-CWD manifest and makes explicit selection weaker than discovery.

### D2 — De-duplicate by file identity while preserving resolution order

Candidate insertion will compare canonical paths (using the same real-path facilities already used
for executable-relative lookup) and append a physical manifest only once. The first spelling is
retained for narration and for resolving relative entries. This covers executable-relative versus
compiled-prefix aliases and an explicit path that already names the installed manifest.

Alternative: retain the current string comparison between candidates 4 and 5. Rejected because an
explicit relative path or symlink can name the same file with different text, causing duplicate
REPL preload and duplicate narration.

### D3 — Use `--no-manifest-chain` as the compatibility and hermeticity control

All four user-facing doors will parse the valueless `--no-manifest-chain` option and pass
`chain = false` to the shared resolver. The default remains `chain = true`. Command help will say
that the flag limits library lookup to the first resolved manifest.

This name is preferred over `--hermetic`: the option controls one precise source of ambient input,
not toolchain discovery, environment variables, caches, or filesystem access generally. It also
works sensibly without `--manifest`: the first readable discovered candidate is used alone.

Alternative: preserve the old default and add an opt-in `--manifest-chain`. Rejected because the
portable, out-of-tree project invocation in issue #114 would still require special knowledge and
the documented "list only your own entries" rule would remain conditional on launch directory.

### D4 — Explicit flag and environment selection have identical chain semantics

`--manifest FILE` continues to outrank `EMIT_MANIFEST`; the losing environment file is not part of
the chain. Whichever explicit source wins becomes the first manifest and is extended only by
installed candidates. This keeps the two documented ways to select a project interchangeable.

Hermetic automation using either source must add `--no-manifest-chain` to the `emit` invocation.
Repository tests that set `EMIT_MANIFEST` specifically to isolate a fixture must be audited and
updated where they rely on the former implicit isolation.

### D5 — Program ownership and entry path ownership remain downstream invariants

No program-index merge is introduced. `emit build` and `emit run --resolve-program` continue to
pass only `first_manifest(manifests)` to program resolution, while library resolution receives the
whole vector. Likewise, each library source continues to be paired with the manifest that supplied
it before `manifest_relative` is applied. These existing boundaries are safer than adding a second
resolution mode specifically for explicit chains.

### D6 — Reuse the existing narration and loading paths

Once the vector contains the explicit and installed manifests, `say_manifest`, `say_chained`, the
library index, lazy import closure, and eager REPL preload already express the required behavior.
The implementation should change these only if tests expose a duplicate-path edge. In particular,
an explicit chain must print the installed manifest with `[chained]` and identify libraries it
supplied just as a discovered chain does.

### D7 — Prove the installed product shape from outside both project and checkout

The primary regression fixture belongs in `test/install-layout-tests.sh`, where a temporary prefix
already exercises a genuinely installed binary and manifest. From a third, unrelated directory it
will:

1. run a source through an absolute `--manifest` project path while importing installed libraries;
2. build a manifest program whose relative source/output paths stay project-relative and whose
   imports include `(scheme file)` and `(scheme process-context)`;
3. repeat explicit selection through `EMIT_MANIFEST`;
4. prove an unrelated `./emit-libs.scm` is ignored;
5. prove project override precedence, first-manifest program ownership, missing explicit-file
   errors, narration, and `--no-manifest-chain` isolation.

Focused CLI tests will assert that all four doors accept the new option and that malformed uses
remain ordinary usage errors. Existing chained-manifest and door-fidelity suites remain the broad
regression guard.

## Risks / Trade-offs

- **Existing `--manifest` callers may unintentionally see installed libraries.** → Mark the change
  as breaking, document `--no-manifest-chain`, and audit repository callers that depend on fixture
  isolation.
- **Ambient installed libraries can hide a missing project dependency.** → Keep project-first
  precedence, narrate the entire chain and supplying manifest, and provide the explicit opt-out.
- **The explicit REPL now eagerly preloads installed non-baked libraries.** → This matches discovered
  REPL behavior and the standard surface promise; retain the existing eager-union implementation
  and measure the focused installed REPL case if the suite shows a material regression.
- **One physical manifest may appear under multiple paths.** → Canonical de-duplication prevents
  duplicate compilation, initialization, and narration.
- **Option parsing is duplicated across four doors.** → Add the same boolean branch to each parser
  and cover every verb; do not broaden this fix into a parser refactor.

## Migration Plan

Land resolver behavior, option parsing, tests, help, and documentation together. Update any
repository command that used `--manifest` or `EMIT_MANIFEST` for isolation to pass
`--no-manifest-chain`; portable project commands need no additional flag. Build with ordinary
`make`, then run the focused CLI/install-layout suites followed by the normal non-regeneration test
suites appropriate for a host-C++ change.

Rollback is a code-and-doc revert; manifests and artifacts require no data migration. Before a
rollback, callers newly depending on explicit chaining can use discovery from the project root as
the temporary compatibility path.
