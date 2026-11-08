# Tasks

## 1. Portable generation and guard coverage

- [x] 1.1 Extract shared portable validation/construction logic and thin Emit/Chez entry layers; add explicit input/output options and shell directory preparation. Verify alternate-input generation succeeds with Chez absent and defaults remain compatible; document invocations beside the tool.
- [x] 1.2 Implement deterministic serialization using portable operations; verify every declared member is byte-identical between Emit and Chez in distinct temporary roots, with escaping, character, symbol, and numeric-literal fixtures. Review any canonicalization diff against the existing generated set.
- [x] 1.3 Add isolated fixtures for the seven current partition/private/elsewhere failure categories and the seven builtin ownership/surface categories. Verify nonzero status, specific diagnostics, offending names/rows, and useful retained failure reports for each under both hosts.
- [x] 1.4 Exercise duplicate-export detection or document and remove it if earlier guards provably subsume it. Verify a fixture reaches every retained guard; add success controls for private macros, re-exports, supported multiple homes, and ordinary declarations, with a documented guard-to-fixture inventory.
- [x] 1.5 Register Emit generation/negative tests in the native test profile and Chez parity in classified reference suites. Verify native cases run without Chez, explicit reference requests fail if Chez is missing, and quiet/default/verbose modes preserve identical output files with narration on stderr.

## 2. Generated forms as the baked representation

- [x] 2.1 Add assembly of named generated forms for all and only declared baked members, preserving dependency order and validating declared library identity/imports. Verify selection with an isolated partition fixture containing an additional baked member and a non-baked member; record pre-change embedded payload, bootstrap, compiler, and standalone binary sizes.
- [x] 2.2 Move shared baked-set compilation and the batch entry to generated forms, removing export/body reconstruction after callers migrate. Verify focused Chez source units and full program/library IR and interface comparisons against the generated files, including builtin and macro bindings.
- [x] 2.3 Migrate REPL initialization and all baked import/library-resolution consumers away from raw prelude source. Add tests for dependency order, once-only initialization, implicit and narrowed base imports, no-prelude behavior, private macro helpers, and re-exports; verify focused source checks before regeneration and native cases after the barrier.
- [x] 2.4 Update module/build documentation and obsolete generator comments to describe one generation implementation and the baked collection. Verify all raw-prelude/reconstruction references in active source and tooling are removed or explicitly justified and documented.

## 3. Regeneration and source proof integration

- [x] 3.1 Integrate seed-compatible generation before assembly in explicit `make regen`; keep plain `make` independent. Verify generation runs with the old seed before requiring the new embedded representation, and a clean bootstrap build does not invoke generation.
- [x] 3.2 Extend `tools/compiler-inputs.sh` and dependent classification, fingerprint, isolated snapshot, and independent-host assembly tooling for new inputs. Verify each new generation/embedding input is classified and copied, and uncommitted edits/deletions cannot bypass isolated source checking.
- [x] 3.3 Convert the whole-file generation guard to use Emit without Chez while retaining independent-host coverage and the surface guard. Add stale-body, missing-member, and orphan-member controls; verify each fails without modifying the checkout, and valid generation passes for every declared member.
- [x] 3.4 Add one patch VERSION bump and matching nonempty changelog section for implementation. Verify the release level matches the compatible compiler payload change; reference both issues in the eventual fixing commit.
- [x] 3.5 Finish compiler-input edits, run `bash tools/test.sh units` and the required Scheme formatting checks, then explicitly run `make regen` to convergence. Verify all declared bootstrap modules and the source fingerprint are produced; complete validation before further compiler-input edits.

## 4. Integration acceptance

- [x] 4.1 Run `bash tools/test.sh full`, `bash tools/test.sh units`, classified targeted reference suites including generator parity, and `bash tools/test.sh source`. Preserve stable suite IDs and reports; verify all required checks pass without treating timeout or skips as success.
- [x] 4.2 Exercise all four commands from an unrelated working directory with no standard-library manifest entries; test repeated REPL imports and an explicit baked manifest alias. Verify standard-library availability, once-only initialization, and no duplicate modules.
- [x] 4.3 Compare normalized full IR and readable interfaces for every baked member and representative importing programs across Chez and native hosts; execute macro/artifact round-trip fixtures and a moved standalone executable. Verify outputs, binding identity, and no-prelude behavior agree.
- [x] 4.4 Repeat the size measurements on the same toolchain and preserve before/after payload, bootstrap IR, compiler executable, and small standalone executable sizes. Verify no new dependency or generated-source payload enters user executables and explain any size growth.
