# Design

## Context

See `proposal.md` for motivation and the two delta specs for acceptance criteria. `make` links committed `bootstrap/*.ll` with the native host/runtime without Chez. `src/emit.cpp` already has `LLVM_VERSION_STRING`, compiled native-toolchain defaults, executable resolution, support-file lookup, manifest chaining, and conventional library providers. `Makefile` tracks configuration-sensitive native inputs in `build/native-config`. There are no CI workflows in the current tree.

The distribution spec already requires executable-relative manifest/root pairs, resolved symlinks, and compiled-prefix fallback. The current host implements these. `docs/DISTRIBUTION.md` predates that implementation in describing library lookup as prefix-only. Its release-foundations step therefore needs evidence for relocation, rather than a second resolver.

The archived `2026-10-02-homebrew-tap-distribution` design selected SemVer starting at `0.1.0` with a committed version independent of artifact compatibility stamps. Reuse those decisions; distribution channels remain outside this change.

## Goals / Non-Goals

Goals are an inspectable build identity, diagnostic reports derived from actual runtime decisions, ten concrete source compatibility checks, and validated release inputs that work outside a Git checkout. Keep the source build and install closure independent of online package fetching.

This design does not change compiler semantics, IR compatibility, library provider precedence, or AOT's textual-IR/clang pipeline. It does not promise that a dynamically linked Emit can start without its linked LLVM or libgc. Doctor can only report after the operating system loads the executable.

## Decisions

### 1. Commit VERSION and bake it into the native host

Add a top-level `VERSION` containing a SemVer string, initially `0.1.0`. Make reads and validates it, passes it as an `EMIT_VERSION` define, and includes it in the native configuration stamp/dependency graph. This ensures incremental builds and `make install` cannot ship a stale identity. Release automation compares the tag with `v<VERSION>` and the matching `CHANGELOG.md` section. No Git command is needed to build from an archive.

Handle `emit --version` before compiler/JIT initialization and print the exact line specified in the CLI delta, using `LLVM_VERSION_STRING` for build identity. A discovery-time `llvm-config --version` is a separate fact and must never replace it. Keep bootstrap and artifact stamps separate: changing the release identity rebuilds the C++ host and does not require regenerating IR.

Document pre-1.0 compatibility for accepted language and public CLI: incompatible changes advance the minor version; patch releases contain compatible fixes. Internal IR, cache metadata, and compile-time interfaces retain their existing compatibility rules. A Git-derived version was rejected because released source archives have no `.git`; a separate version in each workflow would drift.

### 2. Build doctor from shared resolution results

Add `doctor` to dispatch, top-level usage, and command help. It accepts existing resolver controls plus ordinary verbosity flags. Extract a reusable structured view of native discovery and library providers where necessary; compilation continues to use those same results. Do not parse verbose narration or create a parallel discovery script.

Native results retain effective value and origin for explicit overrides, shared discovery, and compiled defaults. Doctor probes selected compiler version and libgc include/library availability and reports build-time LLVM separately from any discovered LLVM tools. Report a libgc version when available from native metadata; otherwise print `unknown`, since absence of optional `pkg-config` metadata alone is not an installation failure. Validate required libgc inputs from the same effective configuration used by AOT. Report the support script and runtime C source that `emit build` would use. An older clang is an error because the present AOT path feeds it textual LLVM IR.

Expose the resolver's ordered prepared providers, origins, and availability, without compiling imports, populating caches, or selecting a different library policy. Report missing candidate locations and disabled tiers separately from effective providers. Explicit malformed configuration is an error; missing optional project roots and an absent old prefix in a valid relocated install are informational. Check shipped payload availability against the documented installed manifest/library closure, including ordinary libraries such as `(scheme inexact)` and shipped SRFIs, using metadata/filesystem checks rather than Scheme compilation. A missing required payload, native input, or support file makes the overall result nonzero, but independent checks still run. Native probe failures also remain visible; report unknown versions explicitly instead of inferring a value.

The report is the requested data on stdout and remains available under quiet verbosity. Stage narration, counts, elapsed times, and errors go to stderr under `docs/OUTPUT.md`. Tests normalize volatile paths where needed while asserting stream separation and provider ordering. No JSON output mode or automatic repair is needed for this first command.

The alternative of implementing doctor as a shell wrapper was rejected because it could disagree with the host's resolver and baked defaults.

### 3. Verify the existing install relocation contract

Extend installed-layout tests: stage an installation, move the complete prefix, make the old prefix and checkout unavailable to lookup, change to an unrelated working directory, and invoke through both the physical binary and an external symlink. Exercise `run`, scripted `repl`, `lib`, and `build` with non-baked libraries. Execute the delivered binary as well. Check doctor reports the moved manifest/root and runtime support files.

Keep a separate fixture for compiled-prefix fallback with no executable-relative payload and for project providers overriding installed ones. Leave dynamic LLVM/libgc dependencies available: moving Emit's payload does not bundle them. Extend existing tests rather than introducing a competing install layout. Repair only gaps demonstrated against the existing distribution contract; no new resolver semantics are intended.

### 4. Treat LLVM 19-23 as tested coverage, preserving floor-based discovery

Create CI with explicit Linux/macOS and LLVM 19, 20, 21, 22, 23 combinations. Each job provisions its selected major plus libgc and native build tools, sets `LLVM_CONFIG`, `CC` to that installation's clang, and `CXX` to its clang++, logs and asserts actual versions, builds committed IR with `make`, and installs into a temporary prefix. `LLVM_CONFIG` alone is insufficient because discovery can select the system compiler from PATH. Run `run-all-tests.sh` and focused version/doctor/install/relocation checks; do not run Chez-only development tests or regenerate bootstrap IR in these compatibility jobs.

Use a shared workflow or script for pull-request, main-branch, and release checks so publication gates the exact tagged commit rather than trusting an unrelated green main build. Check all ten cells, use no allowed failures or silent version substitution, and preserve failure logs. The default source discovery contract still accepts newer versions and warns below its floor; tested coverage is not an upper-bound check.

Do not assume that each historical major is available through current default Homebrew formulae. Implementation first establishes a pinned provisioning recipe for every cell: native packages or verified upstream distributions where available, otherwise cached source builds for the selected LLVM version. Pin runner images and dependency versions as practical, and verify the selected version after provisioning. Provisioning can use the network; archive build/install validation starts only after dependencies are present and does not fetch anything. Toolchain API incompatibilities found by the required matrix are fixed within this implementation before declaring support, following the compiler regeneration barrier if any compiler-source edit is necessary.

The alternative of testing only one current major would not establish the support promised by the distribution plan. The cost of ten jobs is accepted for this foundation; toolchain caches reduce repeated provisioning cost.

### 5. Publish a validated source payload from a matching tag

Add a source packaging/check command shared by local release preparation and CI. Build `emit-<VERSION>.tar.gz` from an explicit commit using tracked inputs, rooted at `emit-<VERSION>/`; include committed bootstrap IR, vendored sources and notices, installed support inputs, tests, build tools, and documentation. Exclude Git metadata and untracked build/cache files. Use stable archive metadata/compression so retries over one commit yield identical bytes. Generate `SHA256SUMS` over the archive itself. Keep the implementation small, using existing shell/build utilities rather than a new release framework.

Release CI responds to `v*` tags, validates tag/version/changelog identity, runs the required matrix, and builds once the source archive that will be published. Validate that exact archive by extracting into fresh directories on Linux and macOS with no checkout lookup, Git metadata, or Chez; run build, staged install, and installed smoke tests with network access denied to the build/test stage. Check checksum verification, including a deliberately corrupted copy. Publication downloads the validated artifact instead of regenerating it.

Release notes are the matching version section of `CHANGELOG.md`. Prepare assets and notes before making the release public, with write permissions restricted to publication. Pin all referenced Actions by commit SHA. A retry preserves existing public assets; byte differences fail instead of using overwrite/clobber flags. Failed validation must leave no public release. The first implementation release is `v0.1.0`, cut only after the repository changes and changelog are committed and the exact release commit passes the checks.

Artifact attestations, installers, binary bundles, and signing belong to the later self-contained-binaries step. SHA-256 in this step provides payload integrity, not a claim of authenticated build provenance.

## Risks / Trade-offs

- LLVM C++ APIs differ across majors: keep small host-side version guards where needed and require real compile/run results in every matrix cell. Availability of an LLVM toolchain is not proof of compatibility.
- Historical LLVM provisioning on macOS can be expensive: cache verified installations, expose provisioning logs, and keep missing cells failing until a recipe works. Do not advertise partial success as 19-23 coverage.
- Doctor cannot diagnose loader failures before `main`: document system LLVM/libgc requirements and native loader troubleshooting separately.
- Doctor probes may encounter broken tools or metadata: bound subprocess probes, report individual failures, and keep inspecting independent settings.
- The archive may accidentally depend on repository files or online inputs: validate the exact extracted payload away from the checkout with network access denied after dependency setup.
- Release identity can drift across incremental outputs: include VERSION in native dependencies and assert version changes rebuild without cleaning.

## Migration Plan

Land metadata and native CLI changes, diagnostic tests, relocation coverage, compatibility CI, and archive/release tooling. Update README, toolchain/distribution documentation, and the changelog to distinguish validated support from aspirations. Run the native suite and release checks; compiler-source edits, if required for compatibility, must finish before `make regen` and the two suites, with trust-check performed after commit as required by project instructions.

Prepare and commit the release version/changelog, run checks on that commit, then create `v0.1.0` and let the tag workflow validate and publish. Before publication, a failed attempt can be corrected and rechecked. After publication, preserve tag and asset identity and correct problems through a new patch release. Existing install prefixes and override variables retain their meaning.
