# Design

## Context

See `proposal.md` for motivation and the four delta specs for contracts. Current `tools/ci-check.sh` invokes all 53 native suites in each of ten cells. `run-dev-tests.sh` groups fast source units, overlapping native integration, independent-host verification, and a Chez-free trust-check behind one Chez availability check. `make` links committed IR; successful native tests alone do not prove an edited Scheme source reached that IR.

Measured exploration evidence, not future guarantees:

- Local LLVM 23.1.2 native run: 53 suites, 2466 seconds, with Chez unavailable. Six suites consumed 1377 seconds (56%): R7RS sections, library partition, upstream SRFIs, import sets, installation, and binding contexts.
- Three direct Chez unit suites took 0.12, 0.18, and 0.22 seconds locally; these are not the cause of the 41-minute native loop.
- [v0.1.0 tag validation](https://github.com/bwbensonjr/emit/actions/runs/39152320199): 144 minutes elapsed, 755 aggregate compatibility provisioning minutes and 277 aggregate native build/test minutes. The Linux archive job separately built the same LLVM 23 recipe cold while the compatibility job was also provisioning it.
- Dependency caches currently contain verified installations but remain subject to [GitHub ref-scoping rules](https://docs.github.com/en/actions/reference/workflows-and-actions/dependency-caching#restrictions-for-accessing-a-cache). Their availability cannot be the dependency distribution contract.

## Goals / Non-Goals

Goals:

- Improve local source-edit feedback and PR runner consumption, not only tagging latency.
- Make each green result name the claim it establishes: current source units, committed-binary behavior, source/IR consistency, cross-host parity, or toolchain compatibility.
- Preserve the full existing coverage inventory and the distinction between self-consistency and independent-host evidence.
- Use one implementation of suite selection and reporting locally and in CI.

Non-goals:

- No compiler algorithm, runtime representation, artifact format, or language redesign. Any measured residual compiler-performance debt is recorded in `docs/PERFORMANCE.md` rather than folded into this tooling change.
- No removal of Chez or frozen genesis, new public Emit binary distribution, automatic LLVM upgrades, upper discovery limit, or hard rejection below the tested floor.
- No silent reduction of exact release archive checks, no reuse of another commit's native correctness result as a release result, and no modification of v0.1.0 assets or tag.

## Decisions

### 1. One suite registry, several explicit proof profiles

Add `tools/test.sh` with `dev`, `full`, `compat`, `source`, `units`, and `reference` profiles, `--suite ID` (repeatable), `--list`, `--changed BASE`, `--jobs N`, and `--report FILE`. Selection is deterministic and inspectable; no executable shell expressions are accepted as suite identifiers. Reports use JSON with a documented schema and separate stderr narration. Preserve exit status when output is captured.

The registry owns stable IDs, commands, coverage group IDs, host requirements, profiles, isolation class, and change-category associations. It is data, not another compiler orchestrator. Start with the existing scripts and refactor only measured redundant setup. `run-all-tests.sh` becomes the compatibility wrapper for `full`; `run-dev-tests.sh` remains an explicit aggregate of `units`, `source`, and `reference`. An explicitly requested Chez-dependent profile fails clearly when Chez is unavailable; it does not claim a passing proof after skipping everything.

| Profile | Meaning | Chez | Invocation policy |
| --- | --- | --- | --- |
| `dev` | Small native baseline plus change-selected regressions | No | Default local feedback |
| `full` | All native regression groups, initially the existing 53-suite coverage | No | Explicit local validation; LLVM 23 code PR/main cells; all release cells |
| `compat` | Representative LLVM-sensitive execution and installed delivery | No | LLVM 22 code PR/main cells |
| `source` | Current source reproduces every committed bootstrap module | No | One canonical Linux/LLVM 23 job for compiler/bootstrap/assembly changes; every release |
| `units` | Direct current-source compiler units | Yes | Local pre-regen iteration; one canonical job on compiler changes |
| `reference` | Unique cross-host assertions and independent-host re-derivation | Yes | Weekly/manual and once per release; targeted cross-host suites on relevant PRs |

The `dev` baseline includes CLI/help, a small runtime/REPL/AOT/library regression set, and selected category-specific suites. It does not run every large conformance suite by default. Explicit suite selection always remains available. A runtime edit selects primitive/error/GC-sensitive and execution-path checks; a native-host edit selects CLI, diagnostics, discovery, and installed-layout checks; library/macro edits select import/export/artifact/REPL behavior. Unknown paths fall back to `full`, not a tiny default.

For compiler edits before regeneration, `units` is the fast fresh-source check. A `dev` report must visibly distinguish committed-bootstrap testing from edited source: a local content-based source fingerprint records the inputs at successful explicit regeneration; a mismatch or missing proof marks native feedback as unverified for edited compiler source and names `units`/`source`/explicit regeneration as the next steps. Fingerprints are local hints, never substitutes for the CI byte comparison. Do not introduce mtime-based auto-regen. CI acceptance requires `source` for the classified compiler change regardless of local hints.

Alternative rejected: a fast command that reports success against old committed IR as though it tested new compiler semantics. Alternative rejected: moving all source units through self-compilation before measuring their cost; current Chez units already provide subsecond feedback and an independent execution host.

### 2. Classify changed inputs conservatively

One classifier supplies both the local plan and CI job selection. PRs compare the merge base with the base branch; main pushes compare the event's before/after commits. Local `--changed BASE` additionally includes staged, unstaged, and untracked inputs. Include both paths of renames and deleted inputs; missing/truncated history, unrecognized paths, or classifier errors select code coverage. CI fetches enough history to establish the base; no network is required merely to inspect a local explicit selection.

The documentation allowlist includes prose-only Markdown and OpenSpec proposal/design/task/spec documents, but excludes root project instructions, executable snippets consumed by tools, generated input documentation, fixtures, source manifests, and CI configuration. Known exceptions such as executable pipeline inputs take precedence over file extensions. Updates to the classifier, registry, runner, Makefile, CI, assembly scripts, VERSION, or dependency recipes are infrastructure/release-sensitive, never documentation-only. Mixed changes union categories.

A lightweight policy job always runs and reports required gates. A final aggregator fails if a required job is missing, skipped unexpectedly, cancelled, or failed; intentional documentation omissions are visible successes of the policy, not fabricated suite passes. Test the classifier and aggregator with fixture diffs and result records, including missing metadata. This avoids path-filtered required checks remaining pending.

### 3. Retain coverage, reduce repeated work, isolate before parallelizing

Create a coverage inventory mapping each old suite and its meaningful assertion groups to new profiles. Track native and Chez variants separately: identical script names do not imply equivalent host coverage. Preserve slow scaling/performance checks, artifact invalidation, error recovery, negative imports, cross-host readable interfaces, stage parity, and optimization-level comparisons. Keep the currently optional R7RS stale-exclusion sweep opt-in; this change does not silently redefine that boundary.

Profile costly suites for Emit invocations, compilation/linking, cache misses, temporary installs, and native rebuild counts. Share immutable fixture inputs and successful setup only where configuration and invalidation tests do not depend on a fresh build/cache. Batch positive cases only when process/session isolation is not part of the assertion. Keep failure, trap, recovery, and stateful REPL cases isolated where needed. Removing duplicate executions requires an explicit retained assertion mapping, not merely equivalent final output on one fixture.

Bounded parallelism defaults to a small resource-aware worker count and remains configurable with `--jobs 1`. Each build-mutating suite gets an isolated temporary checkout/build/install/cache root; read-only suites may share immutable binaries. No concurrent PREFIX/VERSION/native-config changes in the developer's checkout. No shared fixed `/tmp` log names. Cancellation terminates and reaps workers, records results, and preserves failure logs. Avoid wholesale out-of-tree Makefile redesign; isolated fixtures can initially reuse the existing in-tree build rules.

Alternative rejected: background every existing suite against the same `build/` directory. Several tests deliberately relink for configuration changes; that would trade time for races. Parallel execution must preserve the same behavioral results as the serial coverage inventory.

### 4. Separate source consistency from independent-host proof

Run current Chez-free regeneration in an isolated clean checkout and compare every module in `bootstrap/` against that checkout's committed inputs. Use the same authoritative assembly-input list as regeneration, including baked/prelude/generated inputs and assembly scripts; do not maintain an incomplete glob in CI. Handle compiler partition changes according to the existing convergence contract. Required CI runs never turn a dirty bootstrap fixture into a success skip.

Keep independent Chez-seeded fixed-point re-derivation and structural dump parity as distinct evidence. The reference job runs once on Linux/LLVM 23 for each release, weekly on main, and via manual dispatch. Compiler/macro/interface/reader changes run the relevant fast Chez units plus targeted self-emission, serialization, or stage-parity checks in one canonical PR job, not all hosts/toolchains. Infrastructure changes to reference validation also exercise that job.

The legacy developer aggregate still establishes source consistency and reference guarantees. Within a single verification run, reuse a completed proof only when its recorded source/bootstrap hashes, toolchain, and options match; never reuse an independent-host result as if it were a current-source byte comparison. The existing frozen genesis remains reproduction material, not a new everyday bootstrap requirement.

Update contributor build-workflow instructions in the same implementation: finish compiler-source edits before explicit regen; run the classified source/native/reference obligations; do not retain the old unconditional instruction to run every developer suite after every unrelated change. Until that documentation change lands, current instructions still apply. If implementation actually edits compiler Scheme, honor the current regen barrier and both suites before landing that compiler edit.

### 5. LLVM 22/23 policy and CI triggers

Use LLVM 23 as the canonical full-regression toolchain and LLVM 22 as the compatibility floor, on ubuntu-24.04/x86_64 and macos-15/arm64. Keep explicit matching LLVM_CONFIG/CC/CXX, GC paths, SDK handling, dynamic-library normalization, LTO/runtime probes, and committed-IR checks. Remove LLVM 19-21 from maintained recipes/jobs and update documentation/default EMIT_LLVM_MIN to 22; old majors may still be selected explicitly and receive a warning. Future LLVM versions remain discoverable, not advertised as tested.

| Change/event | Native matrix | Other gates |
| --- | --- | --- |
| Prose-only PR/main | None | Lightweight classification/document/spec checks |
| Ordinary code PR/main | LLVM 23 `full` on both OSes; LLVM 22 `compat` on both | Selected runner/infrastructure checks |
| Compiler/bootstrap/assembly change | Same four cells | `source`, `units`, targeted reference checks once on canonical Linux/23 |
| Release/packaging/installation infrastructure change | Same four cells | Both exact offline archive rehearsals and packaging/publication guards |
| Weekly/manual | All four `full` cells | One complete reference job and source check |
| Version tag | All four `full` cells | One source job, one complete reference job, package checks and both exact offline archive builds before publication |

Focused compatibility is a documented inventory: compile committed bootstrap IR, validate major identity, run numeric/closure/primitive/trap probes, persistent REPL state, macro-bearing library compilation/import/artifact reuse, AOT execution, version/doctor, and a relocated install. It does not recursively call `full` and does not reduce to `--version`.

PR concurrency groups include workflow identity and PR number, cancelling only superseded PR runs. Main and release events use separate groups; a release cannot be cancelled by PR activity. Main uses the same profiles as a PR to validate the actual merged tree and warm trusted dependencies; do not silently reuse pre-merge results. Tag gates validate the actual tagged source even if its parent already passed.

### 6. Distribute trusted CI dependencies independently of caches

Add a trusted dependency-preparation workflow restricted to main/scheduled/manual execution. For the four supported OS/architecture/major combinations, it builds the existing pinned source recipe when no matching immutable bundle exists. Publish bundles as GitHub Actions artifacts from successful trusted preparation runs, with a manifest of source revisions, full versions, recipe digest, OS/architecture, SDK/deployment constraints, installation layout, and SHA-256 checksums. Do not create public Emit releases or require GHCR/package credentials for this internal CI facility.

Consumers with read-only permissions resolve an explicitly approved preparation workflow/run and verify its successful conclusion, trusted ref, exact identity, and bundle checksum against the trusted run's manifest before unpacking safe paths into their private prefix. Digest equality alone is insufficient if the producer/manifest is untrusted. Retain the existing prefix, symlink, dylib signing, C++, LTO, LLVM C-API, and full-runtime execution probes on every restored installation. Pin/check the supported runner SDK constraints; incompatible bundles are rejected, not patched silently into unrelated SDK identities.

Ref-scoped caches remain the fastest optional layer. Missing/expired bundles fall back to the exact source recipe, with a clear narration and measured cold cost; corrupted or mismatched bundles are never used. Artifact retention and absence are tested. When multiple jobs need a cold recipe in one workflow, a shared preparation prerequisite provisions it once and transfers the verified bundle to consumers rather than building LLVM concurrently in the archive and compatibility jobs. On a trusted main run, preparation can publish refreshed reusable artifacts. PR-controlled changes may build isolated candidate recipes but cannot update the trusted bundle channel; approved default-branch bundles are never selected from arbitrary PR workflow runs. Forks can use read-only public artifacts or exact source fallback.

Alternative rejected: broadening cache trust to reuse PR-created toolchains for tags. Alternative deferred: relying on unpinned package-manager installations as the sole recipe. Internal artifact expiry is acceptable because the pinned source fallback remains reproducible.

### 7. Measure the local loop and equal-coverage execution separately

Before optimization, record a reproducible baseline from the current revision: hardware/OS, dependency versions, cold/warm caches, total build and suite time, compiler invocation/rebuild counts, and selected assertions. Reuse existing release logs as historical evidence, not a substitute for the local baseline. Add fixture edit scenarios for compiler pass, runtime C, native host C++, and prose documentation, covering both local planning and PR job selection.

Use paired runs on the same machine/configuration, at least three samples for short development workflows and two complete runs for equal-coverage comparisons. Record median and range; exclude queue/provisioning time from test-execution comparisons and report them separately. Acceptance requires: each representative local development selection is faster than the old applicable whole-runner obligation; equal-coverage full native execution shows a repeatable improvement beyond observed variation; documentation-only changes provision no LLVM; warmed PRs schedule two full and two focused cells rather than ten full cells; a cold ref can reuse an existing trusted bundle without a source LLVM rebuild. Do not declare performance success merely because assertions moved to another trigger.

Absolute minute budgets are not promised before baseline measurement. Publish measured results and the coverage/latency trade-off in development documentation and `docs/PERFORMANCE.md`. If equal-coverage execution cannot be improved without losing assertions, report that unmet acceptance criterion for a scope decision rather than deleting tests or declaring the matrix reduction a local full-suite speedup.

## Risks / Trade-offs

- Focused floor testing can miss LLVM-specific edge cases: retain full LLVM 22 coverage weekly and on every release, with all four cells required then.
- Change classification can hide obligations: allowlist documentation narrowly, union mixed changes, test renames/deletions/history failures, and make unknown inputs conservative.
- Native dev tests can exercise stale compiler IR: distinguish source-unit results from native artifact results and require an isolated byte comparison for compiler acceptance.
- Parallelism can increase memory and setup cost: start bounded, isolate writers, measure equal coverage, and retain deterministic serial execution.
- Trusted artifacts can expire or be poisoned: verify producer and digest, keep PR writes isolated, enforce layout/probes, and retain exact source fallback.
- Adding an explicit reference release gate exposes failures previously caught only locally: this is intentional preservation of independent-host evidence, run once rather than across the matrix.

## Migration Plan

1. Capture baselines and the complete coverage inventory before changing default runners.
2. Add profile selection/reporting and self-tests while old entry points remain authoritative. Compare selection and assertion coverage.
3. Isolate mutating fixtures, remove proven repeated setup, and enable bounded parallel workers only after serial/parallel equivalence passes.
4. Split source/unit/reference proofs; update project workflow instructions with the new obligations and preserve legacy wrappers.
5. Populate trusted LLVM 22/23 dependency bundles and test restore, expiry, corruption, identity mismatch, and exact source fallback on both platforms.
6. Switch PR/main classification and the four-cell policy; test packaging/source/reference failures and documentation-only success aggregation in non-publishing fixtures.
7. Rehearse release validation without publishing or changing any tag. All four full cells, source/reference checks, and both offline archives must pass.
8. Publish before/after evidence and document the full/focused/local distinction. Rollback restores old runner orchestration and source provisioning; no artifact-format migration or public-release overwrite is needed.
