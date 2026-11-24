# Tasks

## 1. Record the external compatibility handoff

- [x] 1.1 Obtain the independently reviewed emit-packages policy/CI change described in design decision 1: required Linux/macOS checks resolve and verify the latest stable Emit release; scheduled/manual checks detect later releases; README and contributor instructions remove paired Emit pin updates. Verify with linked passing workflow evidence naming the same released Emit version on both platforms. Changes in that repository follow its own planning workflow.
- [x] 1.2 Obtain collection-owned artifact publication/reuse checks, installed-package update checks, and an explicit Chez source-driver mode accepting a matching released Emit source tree. Verify with linked successful native and reference runs and failure diagnostics for a missing prerequisite in an explicitly selected reference run. Complete before retiring Emit's collection suites.
- [x] 1.3 Add a transfer table to `docs/VALIDATION-COVERAGE.md` naming each retiring Malt coverage ID, its collection-owned command/workflow and trigger, and the generic contract checks retained in Emit. Verify the table accounts for `malt-core`, `malt-training`, `malt-xor`, their source counterparts, and `malt-installed` without claiming fixture checks preserve Malt semantics.

## 2. Make Emit package acceptance independent

- [x] 2.1 Replace positive Malt checks and collection-fetch imports in `test/srfi-27-install-tests.sh` with a small local fixture collection. Preserve SRFI 27 closure checks, Malt's absence from the installed payload, environment-root resolution, linked user-root resolution, and installed `pkg install --from` acceptance from an unrelated directory. Verify with `bash tools/test.sh --suite srfi-27-install` and inspect the test to confirm it contains no collection-fetch path.
- [x] 2.2 Extend `test/package-manager-tests.sh` with a fake `curl` that exercises production branch resolution against two fixture tips while download overrides are unset. Cover install at A, fresh install/available at B, and update from A to B using the same Emit binary; assert one resolved snapshot per invocation, the installed commit record, changed imported behavior, and unchanged files on an incompatible update. Verify with `bash tools/test.sh --suite package-manager` without collection network access.
- [x] 2.3 Update `docs/PACKAGES.md` to explain collection-owned latest-stable compatibility, fresh-tip install/update, retained installed provenance, and older-version refusal with the `--from` alternative. Verify examples match existing command help and regression cases; no new public options or state format are introduced.

## 3. Retire the pin and its validation policy

- [x] 3.1 After section 1 evidence is recorded and section 2 passes, delete `tools/emit-packages-pin.sh`, `tools/emit-packages.py`, and `test/emit-packages-tests.sh`; remove `emit-packages-pinned` and `emit-packages-pinned-source` from the test registry. Update coverage ownership, the full-profile count, and guards in `test/validation-coverage-tests.py`, assigning installed fixture/SRFI coverage accurate IDs. Verify `python3 test/validation-coverage-tests.py` and `bash tools/test.sh --list` show the intended inventory with neither retired suite.
- [x] 3.2 Replace active pin instructions in `docs/DEVELOPMENT.md`, `docs/VALIDATION-COVERAGE.md`, and performance replay documentation with the ownership model and collection-owned local testing commands. Verify a repository search for `EMIT_PACKAGES_PIN`, `read_pin`, `obtain_collection`, and the retired suite IDs finds no live executable consumers or instructions requiring pin maintenance; preserve historical archived changes and historical measurement identities.

## 4. Verify the ownership boundary

- [x] 4.1 Run `python3 test/test-classify-tests.py`, `python3 test/validation-coverage-tests.py`, and the `package-manager` and `srfi-27-install` suites after removal. Inspect the full/reference plans and remaining collection references to establish that required Emit gates cannot fetch or consume emit-packages. Preserve reports, and verify failures from fixture contract regressions still fail their suites.
- [x] 4.2 Run `bash tools/test.sh dev --changed BASE` against the implementation comparison base and any additional gates selected by classification/preflight. Confirm the diff changes no compiler assembly inputs or shipped payload/behavior, so regeneration and a version bump are unnecessary; if scope expands, apply the documented validation and version policy for those inputs. Verify `openspec validate decouple-package-collection --strict` succeeds.

## Workflow follow-up

- Finish the implemented change with `emit-finish-change`, syncing and archiving its specs into the reviewable Emit pull request. Preparing that pull request does not merge it.
- Future collection updates need only the collection's own review and compatibility checks; no recurring Emit pin update or paired release is part of the workflow.

## Handoff evidence

- Collection change `own-emit-compatibility` is implemented, independently checked during implementation, synced and archived in emit-packages. [Collection PR #5](https://github.com/bwbensonjr/emit-packages/pull/5) carries the handoff; review and merge it before merging the Emit change.
- Collection native/reference evidence: [passing run](https://github.com/bwbensonjr/emit-packages/actions/runs/45393655882). both macOS and Linux passed against resolved Emit 0.13.0, with 35 native paths and 37 lifecycle operations per platform; Chez passed all seven checks. Explicit missing-prerequisite and mismatch cases are covered by its tooling tests.
- Emit fixture suites passed before retiring the collection driver: `/private/tmp/emit-decouple-validation/fixtures-before-retirement.json`. The final suite run also covers the restored Malt negative-import assertion and a fresh A-to-incompatible-B refusal case.

## Emit validation evidence

- Classified development run against `main`: all 69 remaining native suites passed in `/private/tmp/emit-decouple-validation/dev-changed.json`. The subsequently strengthened package-manager case passed in `final-package-manager.json` in the same report directory.
- Post-retirement package-manager, SRFI 27/installed fixture, and performance-tool suites passed (`after-retirement.json`). Both deliberate fixture regressions were rejected (`failure-oracles.json`).
- Coverage inventory, 19 classifier tests, 16 performance-tool tests, suite plans, strict OpenSpec validation, and whitespace checks passed. Full/reference plans contain no external collection commands. Compiler, runtime, library, bootstrap, Makefile, installed-payload, and VERSION inputs are unchanged.
