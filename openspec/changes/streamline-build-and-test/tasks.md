# Tasks

## 1. Baselines and retained coverage

- [x] 1.1 Inventory the current 53 native suites and all developer-suite assertion groups, hosts, shared mutations, and invocation triggers. Deliver a versioned coverage map with no unexplained omitted group, including performance checks and optional conformance bookkeeping.
- [ ] 1.2 Add a repeatable measurement procedure for compiler, runtime, native-host, and documentation edit fixtures; record current local build/test durations, invocation/rebuild counts, hardware, toolchains, and cache state. Verify cold provisioning, queue time, and test execution are reported separately.
- [x] 1.3 Document baseline evidence and the proposed before/after comparison protocol in development documentation and docs/PERFORMANCE.md. Verify the commands reproduce a baseline without modifying tracked compiler/bootstrap files.

## 2. Shared validation profiles and change selection

- [x] 2.1 Implement the suite registry and tools/test.sh profiles with stable suite selection, listing, bounded-job options, and JSON reports. Add self-tests for unknown/empty selection, command failure, report validity, and EMIT_VERBOSITY output behavior; document the command interface in the same commit.
- [x] 2.2 Define dev and compat inventories covering the execution paths and installed behavior specified in the design. Verify named suites can run alone and neither profile recursively executes the full native inventory; document their deliberately limited claims.
- [x] 2.3 Implement conservative local/CI classification with inspectable plans, mixed-category union, rename/deletion handling, staged/unstaged/untracked local inputs, and comparison-base handling. Verify fixture diffs for every category, unknown files, executable Markdown exceptions, missing history, and classifier changes.
- [x] 2.4 Preserve run-all-tests.sh as the full-native wrapper and map the complete native inventory to it. Verify all native assertions execute without Chez and add a coverage-map consistency check that fails if a registered legacy assertion group is lost.

## 3. Equal-coverage execution improvements

- [x] 3.1 Isolate configuration/version/install/bootstrap-mutating fixtures and cache state; remove shared fixed temporary log paths. Verify concurrent PREFIX/VERSION/configuration fixtures do not change the developer checkout or each other's binaries and document isolation classifications.
- [ ] 3.2 Measure setup and compiler invocations in the six dominant suites; share redundant immutable setup or batch independent positive fixtures where justified. Verify retained assertion mappings, cold/invalidation behavior, and failure/REPL recovery isolation for each optimization, with per-suite before/after evidence.
- [x] 3.3 Implement bounded scheduling and cancellation with serial fallback and captured worker diagnostics. Verify serial and parallel assertion outcomes agree, an injected failure fails the aggregate, cancelled children are reaped, and memory/concurrency settings are documented.
- [x] 3.4 Run paired equal-coverage full-native measurements under the design protocol. Verify repeatable improvement beyond observed variation without omitted assertion groups; record results and remaining performance debt rather than counting profile reduction as equal-coverage speedup.

## 4. Source, units, and independent-host verification

- [x] 4.1 Extract a Chez-free isolated source-consistency profile using authoritative regeneration inputs and every bootstrap module. Verify a deliberately stale compiler-source fixture fails without Chez, a matching fixture passes, partition/assembly inputs trigger checking, and the original checkout remains unchanged.
- [x] 4.2 Add content-based local regeneration fingerprints and native feedback labels without automatic regeneration. Verify unregenerated edits and missing fingerprints cannot be reported as current-source native verification, while direct source units remain runnable before regen; document this local edit loop.
- [x] 4.3 Separate direct Chez units, targeted cross-host suites, and complete reference verification; keep the legacy developer entry point as the documented aggregate. Verify missing Chez fails explicitly requested verification, source consistency still runs Chez-free, and cross-host serialization, self-emission, dump parity, fixed-point, and scaling assertion groups remain owned.
- [x] 4.4 Reuse matching proof outputs only within a validated invocation and update contributor build-workflow instructions with the new conditional obligations. Verify changed source/bootstrap/toolchain hashes invalidate reuse and all documented local commands produce the claimed proof; if compiler Scheme was edited, honor the current regen barrier and both suites before landing those edits.

## 5. LLVM policy and reusable CI dependencies

- [x] 5.1 Raise the default tested floor to LLVM 22 and remove maintained LLVM 19-21 recipes/jobs. Verify discovery tests cover 22, 23, newer majors, below-floor warnings, EMIT_LLVM_MIN overrides, and existing precedence; update LLVM/build/install compatibility documentation in the same group.
- [x] 5.2 Add toolchain bundle manifests, safe packaging/extraction, and identity/digest/producer validation. Verify wrong OS/architecture/SDK/recipe/version, unsafe paths, corrupt bytes, untrusted producer refs, and failed producer runs are rejected; document the bundle and trust contracts.
- [x] 5.3 Add the trusted dependency-preparation workflow and read-only consumer resolution with exact source fallback. Test main/scheduled/manual publication policy, PR non-publication, expired/missing artifacts, and restored native probes; verify candidate bundles transfer between isolated Linux and macOS rehearsal jobs without LLVM recompilation on consumers.
- [x] 5.4 Share cold preparation among same-recipe compatibility/archive consumers within a workflow. Verify one source build per required recipe on a forced miss, no stale identity substitution, cache-independent artifact restore in resolver fixtures, and preserved SDK/dylib/LTO/runtime probes. Document first trusted-channel seeding and fallback recovery.

## 6. Local/PR/main/release orchestration

- [x] 6.1 Wire classification into PR and main gates: two full LLVM 23 cells, two focused LLVM 22 cells, and zero LLVM provisioning for allowlisted documentation-only changes. Test expected job plans for all edit categories, required-check aggregation, unexpected skips/failures, and manual full-coverage overrides; document the trigger matrix.
- [x] 6.2 Add same-PR supersession cancellation with independent workflow/PR groups and separate release handling. Verify fixture groups distinguish different PRs, main, and tags, and that cancellation cannot turn an incomplete required gate into success.
- [x] 6.3 Add one canonical source/unit/targeted-reference job for relevant changes and weekly/manual full/reference validation. Verify actual compiler/bootstrap/assembly fixtures select source consistency, ordinary host edits do not, and missing verification prerequisites fail their required gates; update local contributor examples accordingly.
- [ ] 6.4 Reuse full profiles for all four tagged cells, require source and one reference proof, and retain both exact offline archive validations. Exercise non-publishing release/packaging rehearsals and failure-injection fixtures showing identity, native, source, reference, archive, or missing-result failures prevent publication; preserve immutable-asset retry tests and document the release gate.

## 7. Integrated acceptance

- [ ] 7.1 Re-run representative compiler/runtime/host/documentation local scenarios and compare against group 1 baselines using the agreed sampling protocol. Verify faster focused feedback, recorded equal-coverage improvement, no documentation compiler work, preserved assertions, and explicit separation of queued/provision/build/test time.
- [ ] 7.2 Complete the non-publishing integrated rehearsal: all four full LLVM/platform cells, separate source/reference verification, both offline archives, and verified candidate bundle reuse on a cold consumer. Verify committed bootstrap coherence and no public tag or release mutation; run regen and the required current suites only if implementation changed compiler-source inputs.
- [ ] 7.3 Reconcile coverage-map ownership, reports, contributor instructions, and CI-required checks against the delta specs. Verify strict OpenSpec validation, runner/classifier/provisioning self-tests, clean tracked source after verification, and documented rollback/fallback paths.

## Workflow follow-up

- After review and merge, seed the trusted default-branch dependency channel and verify a subsequent PR/tag consumer restores its approved bundles; do not publish trusted main artifacts from PR-controlled runs to simulate this rollout.
- Archive after implementation and review are complete. No new public Emit release or retagging is required by this change.
