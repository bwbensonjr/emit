# Tasks

## 1. Public notation aliases

- [x] 1.1 Add facade export renames for lambda syntax and every mathematical procedure alias in the delta spec, retaining all ASCII exports; verify a minimal book-style gradient expression returns 6.0 and prefixed lambda syntax compiles.
- [x] 1.2 Extend the focused Malt acceptance tests with exact alias inventory and procedure-binding checks, lambda fixed/rest/dotted formals, lexical scope, syntax identity, and selected/prefixed/renamed/re-exported bindings; verify native run, REPL, standalone, and Chez source-driver results agree and unsupported extension-gradient stubs remain unavailable.
- [x] 1.3 Update `test/malt-reference/export-map.json`, `docs/MALT.md`, and `lib/malt/PROVENANCE.md` for both spellings and Racket's lambda origin; verify `python3 test/malt-reference/check.py` passes and documented expressions run as written.
- [x] 1.4 Bump `VERSION` once at minor level and add a matching nonempty `CHANGELOG.md` section for the new public aliases; verify consistency with the current branch's release state and run the relevant release metadata checks.

## 2. Integration validation

- [x] 2.1 Exercise notation through the installed-library checks and existing Malt core/training native suites, plus their targeted source-reference checks; verify installed imports provide the complete alias inventory and standalone execution needs no source checkout. Run the formatter gate for edited covered Scheme sources; no regeneration is needed unless assembled compiler inputs change.
- [x] 2.2 Run little-learning's existing `app.runtimes.emit.run_emit` with UTF-8 book-style differentiation, requirement `(malt learner)`, local `LL_EMIT_BIN`, and `LL_EMIT_LIBRARY_PATH`; verify successful evaluation returning 6.0 without changing the adapter, and preserve the smoke-check command/result for review.

## Workflow follow-up

- Finish the completed implementation using `emit-finish-change`, synchronizing specs, archiving this change, completing preflight, and preparing one reviewable PR.
