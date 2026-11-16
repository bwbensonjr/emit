# Tasks

## 1. Program default precedence

- [x] 1.1 Implement explicit-versus-implicit binding view selection in the shared core and its source/native program consumers, preserving strict explicit imports and hidden definition-context dependencies. Verify with source units covering runtime, primitive, core syntax, macro, renamed/prefixed imports, same-origin re-exports, and explicit conflicts.
- [x] 1.2 Add program/library integration cases to import-set and binding-context coverage: alternative arithmetic over defaults succeeds; explicit base conflicts fail across separate declarations; explicit base selections still narrow; `--no-prelude` adds no defaults. Verify under the source driver before regeneration.
- [x] 1.3 Update module documentation to explain fallback defaults and portable explicit imports. Verify examples against source compilation, without accepting stale native results as proof.

## 2. Interactive import replacement

- [x] 2.1 Retain REPL declaration boundaries or equivalent normalized state and stage a strictly validated candidate declaration before overlaying previous imports. Add source tests for replacement, same-origin reimport, explicit base narrowing after replacement, and unchanged local-definition priority; verify with source units.
- [x] 2.2 Rebuild runtime, macro, primitive/core, known-name and direct-call views coherently. Add source tests for cross-kind replacements and old compiled procedure/macro definition-context references; verify with source units.
- [x] 2.3 Extend native module REPL fixtures for same-declaration conflicts, failed resolution/initialization preserving prior scope, once-only initialization, and repeated replacement/restoration. Document the successive-declaration rule and initializer rollback limits; verify fixtures after the regeneration barrier.

## 3. Malt acceptance and release metadata

- [x] 3.1 Add direct unprefixed learner import fixtures for fresh REPL, `emit run`, and standalone builds, checking `(gradient (lambda (x) (* x x)) 3.0)` yields `6.0`; retain explicit-exclusions and prefixed cases and explicit-conflict failures. Update `docs/MALT.md` and relevant reference/install assertions without altering upstream provenance guards; verify source fixtures now and all native cases after regeneration.
- [x] 3.2 Bump VERSION to the next minor version relative to the implementation base and add a matching nonempty CHANGELOG section explaining interactive replacement and implicit program defaults. Verify version/changelog consistency through release preflight.

## 4. Compiler acceptance

- [x] 4.1 Finish all compiler-source edits, run source units and `make format`, inspect the changed-input validation plan and select the classified targeted reference suite IDs. Verify the final source diff before explicitly running `make regen`; preserve logs and do not edit compiler inputs during regeneration or its validation.
- [x] 4.2 After successful regeneration, run `bash tools/test.sh full`, `bash tools/test.sh units`, the classified targeted reference suites, and `bash tools/test.sh source`. Verify all reports pass and all declared bootstrap modules match current source; poll long-running suites instead of treating timeouts as success.
- [x] 4.3 Verify the documented Malt expressions and interactive replacement sequence on the regenerated binary, and verify the same program expression through run and AOT. Run formatting and release preflight checks; record results for review.

## Workflow follow-up

- Use `emit-finish-change` to sync specs, archive, and prepare the reviewable pull request after implementation and validation. Do not merge automatically.

## Validation evidence

- `make regen`: passed, fixed point iteration 2, 595 seconds.
- Source units: 16/16 suites passed (`/tmp/emit-import-units-final.json`).
- Classified references: self-emission, dump-parity, render-datum all passed (`/tmp/emit-import-reference.json`).
- Isolated source consistency: passed, all declared bootstrap modules matched (`/tmp/emit-import-source.json`).
- Full native regression: 64/65 suites passed initially (`/tmp/emit-import-full.json`). The new run-command test encountered macOS Bash's unset-empty-array behavior under `set -u`; after fixing only that test script, its targeted suite passed (`/tmp/emit-import-module-rerun.json`). All 65 suite IDs therefore have passing coverage; compiler inputs remained unchanged throughout acceptance.
- Malt training acceptance verified direct learner imports across run, REPL, and standalone builds, plus explicit-exclusion/prefixed cases and explicit base conflicts.
- The rebuilt REPL returned `6.0` for the documented direct-import gradient expression.
- `make format-check`: 44 files considered, zero changes.
