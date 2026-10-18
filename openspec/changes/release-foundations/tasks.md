# Tasks

## 1. Public version identity

- [x] 1.1 Add and validate a committed `VERSION` initialized to `0.1.0`; wire it into the native host and configuration stamp. Verify a version-only edit changes the binary's identity on incremental `make` and `make install`, without regenerating bootstrap IR.
- [x] 1.2 Implement top-level `emit --version` and document it in help; add CLI checks for exact Emit/build-time LLVM output, no discovery/JIT requirement, verbosity invariance, and extra-argument rejection. Verify the focused CLI tests pass from an unrelated directory.
- [x] 1.3 Document the language/CLI compatibility surface, pre-1.0 minor/patch policy, independent artifact stamps, and `v<VERSION>` convention; initialize `CHANGELOG.md` for `0.1.0`. Verify the documented version and CLI output agree.

## 2. Read-only installation diagnostics

- [x] 2.1 Expose effective native discovery values and origins for reuse by doctor, preserving compilation precedence; add checks for explicit overrides, shared discovery, and compiled fallbacks. Verify existing toolchain-discovery tests still pass.
- [x] 2.2 Expose ordered resolver providers and their origins/availability without compiling libraries; reuse existing manifest/root controls. Verify diagnostic provider order against compilation traces for project, explicit, environment, executable-relative, and compiled-prefix cases, including opt-outs and malformed configuration.
- [x] 2.3 Add doctor dispatch and probes for build identity, executable/prefix, selected cc/clang version, libgc inputs/version when known, required support files, and shipped source payload. Verify healthy, missing-input, unknown-metadata, and older-clang cases produce complete reports and the specified status.
- [x] 2.4 Add doctor help and argument checks, read-only/cache checks, and stdout/stderr/verbosity assertions to the CLI tests; document report fields, optional absences, failure status, and the native-loader limitation. Verify all focused diagnostic cases and existing CLI tests pass.

## 3. Installed-layout relocation coverage

- [x] 3.1 Extend install tests with a moved prefix and an external executable symlink, keeping the old payload and checkout unavailable to lookup. Verify installed `run`, scripted `repl`, `lib`, and `build` can use non-baked shipped libraries from an unrelated directory, and execute the delivered AOT binary.
- [x] 3.2 Add distinct tests for compiled-prefix fallback, project-provider precedence, and doctor reporting of relocated libraries/support files. Verify both relocation and fallback fixtures pass without changing resolver semantics.
- [x] 3.3 Update installation documentation and the stale current-state wording in `docs/DISTRIBUTION.md` to describe existing executable-relative lookup and its dynamic system dependencies. Verify documented relocation examples against the staged fixtures.

## 4. LLVM compatibility CI

- [ ] 4.1 Establish pinned provisioning recipes for LLVM 19-23 and libgc on Linux and macOS, with cached source-build fallback where packaged versions are unavailable. Verify all ten recipes report the intended major; no cell may substitute a different major or skip.
- [ ] 4.2 Add reusable compatibility workflows for pull requests, main, and release commits with Actions pinned by commit SHA. Explicitly set and assert matching `LLVM_CONFIG`, clang `CC`, and clang++ `CXX`; verify all ten cells build committed bootstrap IR with Chez unavailable and without regeneration.
- [ ] 4.3 Run `run-all-tests.sh` plus installed version/doctor/relocation checks in every cell and preserve failure diagnostics. Fix any demonstrated LLVM API compatibility gaps, then verify all ten cells pass and existing floor-based discovery remains unchanged.
- [ ] 4.4 Update toolchain documentation with the tested major/platform matrix, provisioning choices, and how to reproduce one cell locally. Verify the documented overrides select the intended tools and the workflow enforces every advertised cell.

## 5. Source archive and release automation

- [ ] 5.1 Add a narrated source packaging/check command producing `emit-<VERSION>.tar.gz` from a specified commit and `SHA256SUMS`. Verify one versioned root, bootstrap/source/vendor/license closure, absence of build/cache/Git metadata, stable bytes on repeated packaging, and successful checksum verification including rejection of a corrupted copy.
- [ ] 5.2 Add Linux and macOS archive-validation jobs that build the exact extracted payload with documented dependencies, no Git metadata, no Chez, no checkout lookup, and network access denied after provisioning. Verify `make`, staged `make install PREFIX=/usr/local DESTDIR=<staging>`, and installed command smoke tests pass.
- [ ] 5.3 Add tag-driven release automation checking tag/VERSION/changelog consistency, all ten compatibility cells for the exact tagged commit, and exact archive validation before public publication. Verify mismatched identity and failed checks prevent publication using local checks or non-publishing workflow tests.
- [ ] 5.4 Publish the already validated archive, checksum file, and matching changelog notes with narrowly scoped workflow write permissions and SHA-pinned Actions. Verify a non-publishing rehearsal transfers the exact bytes and retry logic preserves public assets or fails on differing payloads.
- [ ] 5.5 Document local preparation, offline source build inputs, checksum verification, release workflow and failure recovery in release documentation and README. Verify the commands against the release candidate archive and distinguish source releases from deferred binary/provenance deliverables.

## 6. Integration and first release

- [ ] 6.1 Complete integration checks on the final source: native suite, CLI/doctor/install checks, full compatibility matrix, and archive validation. If compatibility fixes touched compiler sources, finish those edits before `make regen`, then run both suites and the post-commit trust-check per project instructions. Verify committed bootstrap IR is coherent before tagging.
- [ ] 6.2 Prepare and commit the `0.1.0` release state and changelog, create the matching `v0.1.0` tag, and complete the validated publication workflow. Verify the public release's archive checksum, source-build result, version identity, and notes match the tagged commit; record the release URL in the implementation handoff.
