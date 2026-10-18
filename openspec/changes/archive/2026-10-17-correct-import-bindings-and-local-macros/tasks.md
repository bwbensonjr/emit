# Tasks

## 1. Binding identity and interface foundation

- [x] 1.1 Inventory syntax recognition, import/environment assembly, transformer forwarding, interface transport, and current surface ownership; record the concrete migration map in the design and verify it covers Chez, native commands, and REPL registration.
- [x] 1.2 Add shared identifier/context and binding-origin representations using the self-hostable subset; verify focused Chez tests distinguish equal origins, same-spelled lexical bindings, independent equal-text transformers, and deterministic fresh identities.
- [x] 1.3 Extend compile-time interface readers/writers with tagged primitive/syntax entries and finite transformer context/dependency graphs; verify round trips, recursive helpers, re-export identity, and absence of compile-time payload in emitted runtime IR.
- [x] 1.4 Coordinate compiler identity/cache invalidation and interface revision handling across hosts; verify legacy runtime-only tables and fixed/variadic descriptors still read, while insufficient legacy macro context rebuilds from source or reports a rebuild diagnostic.
- [x] 1.5 Document the binding kinds, interface revision, and artifact migration in `docs/MODULES.md`; verify examples and stated compatibility match the interface tests.

## 2. Uniform import views and conflict rejection

- [x] 2.1 Declare actual per-library primitive/core/auxiliary surfaces and update baked/source derivations and generation guards; verify both derivations agree and `(only (scheme inexact) define car)` is rejected.
- [x] 2.2 Make nested import transforms and primitive/syntax re-exports preserve binding origins; add focused checks for `only`, `except`, `prefix`, and `rename` across all kinds, including artifact-only facades and quoted data preservation.
- [x] 2.3 Resolve core heads, definition/body discovery, record lowering, arithmetic rewrites, and primitive call/value lowering by binding identity; verify fully prefixed base programs, renamed `define`/`lambda`/`quote`/`set!`, lexical core shadowing, variadic primitive values, and imported assignment rejection.
- [x] 2.4 Validate the complete transformed namespace before local overrides; verify #118 runtime, macro, cross-kind, and within-set collisions reject in either order with identifier/library provenance, while repeat imports and re-export diamonds remain legal.
- [x] 2.5 Preserve implicit base imports, replace them with the union of explicit base views, and retain the deliberate `--no-prelude` compiler environment; verify positive and negative scope cases for programs, libraries, and bootstrap inputs.
- [x] 2.6 Stage REPL imports as one validated transaction across runtime, syntax, macro, and call metadata; verify conflicts run no new initializer, publish no partial names, preserve prior state, and explicit base-view replacement does not invalidate earlier compiled procedures.
- [x] 2.7 Audit shipped surfaces and fixtures for first-import-wins and ambient-library-builtin assumptions; correct imports/selection where needed and verify package and import-set checks pass through the Chez source driver.
- [x] 2.8 Replace first-import-wins and universal unrenamable-builtin documentation in `docs/MODULES.md` and related examples; verify every documented example uses only its declared visible bindings.
- [x] 2.9 Relocate `filter`, `fold-right`, and `iota` from public `(scheme base)` to `(emit list)`, retain internal compiler access, migrate repository consumers, and verify unchanged SRFI 1/64 package inputs and generated surface parity.

## 3. Local macros and hygiene

- [x] 3.1 Implement lexical `let-syntax` and `letrec-syntax` environments; verify outer versus recursive RHS scope, mutual recursion, empty scopes, nesting, and no leakage against focused fixtures and the corresponding R7RS cases.
- [x] 3.2 Normalize body definition prefixes during expansion, including internal `define-syntax`, macro-generated definitions, and splicing `begin`; verify sibling variable/transformer visibility, initializer ordering, invalid definition placement, and expansion termination guards.
- [x] 3.3 Replace known-name template exemptions with definition/use contexts and fresh introduced binder identities; verify lexical definition-site references, known-global temporary collisions, source-written variable/core shadowing, and repeated expansions.
- [x] 3.4 Compare `syntax-rules` literals by original binding identity or equal unbound spelling; verify aliases, distinct lexical bindings, `_`/ellipsis literal precedence, existing `cond` shadowing cases, and nested generated transformers with ellipsis escape.
- [x] 3.5 Preserve imported macro contexts and private dependency closure through selection, forwarding, and saved interfaces; verify expansion works when public primitive/core/helper names are hidden and that independent same-text macros still conflict.
- [x] 3.6 Pin #106's original `%do-step` loop reproduction and the deliberate user shadowing example; verify `(2 1 0)` and `44`, plus `do` default/parallel steps and equivalent `guard` helper-capture checks without making helper spellings reserved.
- [x] 3.7 Update macro/local-syntax documentation and the R7RS exclusion ledger after cases pass; verify the definition-site reference, recursive macro, empty-scope, and generated-transformer cases execute with expected outputs and no remaining obsolete local-macro exclusion.

## 4. Frontend diagnostics for issue #91

- [x] 4.1 Audit source-driven expression/definition/transformer destructuring and add shape guards at the affected boundaries; verify improper binding lists, missing RHSs, duplicate keywords, malformed rules/formals, and misplaced syntax identify the offending form without accessor failures or signals.
- [x] 4.2 Add explicit rejection of unsupported dotted `define-values` and malformed `case-lambda` diagnostics while retaining valid fixed/dotted/rest clause dispatch; verify all original #91 cases now either execute correctly or produce the intended named diagnostic.
- [x] 4.3 Verify diagnostic parity and recovery through Chez, native run/build/lib, and REPL fixtures; require nonzero batch failures, stderr diagnostics, no partial bindings, and successful following REPL input returning `3`.
- [x] 4.4 Reconcile diagnostic/unsupported-form documentation and exclusion reasons; verify `case-lambda` is documented as supported, local recursive syntax has passing evidence, and dotted `define-values` remains excluded with its actual limitation.

## 5. Current AOT tree-shaking documentation for issue #133

- [x] 5.1 Replace the obsolete imported-unit/substrate scope-and-limits bullet and program-only root explanation in `docs/MODULES.md`; verify the prose against `src/core.ss`, `src/emit.cpp`, and completed P10 behavior in `docs/PERFORMANCE.md`, including backward roots through finalized importers.
- [x] 5.2 Clarify source-based AOT pruning versus full-unit artifact reuse and open-world run/REPL loading; review `test/aot-tree-shaking-tests.sh` and `test/unit-pipeline-tests.sh` expectations and search related docs for stale present-tense whole-transitive-unit claims without rewriting historical measurements.

## 6. Integration and regeneration barrier

- [x] 6.1 Run focused import, macro, frontend, saved-artifact, and package/conformance checks through `chez --libdirs src --script src/compile.ss`; verify expected positive outputs and negative diagnostics before entering regeneration.
- [x] 6.2 Run required formatting checks and finish all compiler-source edits before `make regen`; verify no mixed layout-only reformat is interleaved with functional edits and regenerate to a stable fixed point without interrupting the barrier.
- [x] 6.3 Build the native binaries and exercise the shared acceptance fixtures through Chez AOT, `emit run`, delivered `emit build` executables, `emit lib` artifacts consumed in fresh processes, and incremental `emit repl`; verify result/diagnostic parity, cold/warm-cache behavior, and byte-identical full interfaces and normalized full unit IR.
- [x] 6.4 Run `./run-all-tests.sh` and `./run-dev-tests.sh` after regeneration with no further compiler-source edits; verify existing AOT pruning/stable-label tests, package suites, self-emission checks, and all non-skipped suites pass, recording any dirty-bootstrap trust-check skip explicitly.
- [x] 6.5 Review the final diff and issue-to-regression evidence for #119, #118, #106, #91, and #133; verify no runtime macro payload or unrelated feature was added, and `openspec validate correct-import-bindings-and-local-macros --strict` passes.

## Final verification

- Final `make regen` completed successfully in 517 seconds, converging at fixed-point
  iteration 1. Compiler sources remained unchanged through both full suites.
- `./run-all-tests.sh`: 51 suites, zero failures, 4143 seconds.
- `./run-dev-tests.sh`: 41 suites, zero failures, 1317 seconds, in an isolated clone
  with matching source/bootstrap hashes. The post-commit trust check explicitly
  skipped because bootstrap artifacts are uncommitted; this is not trust-check success.
  Independent self-hosting fixed-point and self-emission checks passed.
- After commit `a827002`, `bash test/trust-check.sh` passed: regeneration completed
  in 509 seconds and reproduced the committed bootstrap IR byte-for-byte, leaving
  a clean working tree before the spec-sync and archive operation.
- `EMIT_BINDING_HOST=both bash test/binding-context-tests.sh`: 88 checks passed,
  including saved interfaces, normalized unit IR parity, runtime-payload absence,
  primitive shadowing, and REPL recovery.
- Scoped formatter check: 12 files considered, zero changes required.
- Final diff review, `git diff --check`, and strict OpenSpec validation passed.

## Regression evidence

- #119: shared `test/binding-context/` fixtures exercise prefixed and renamed core syntax,
  primitive calls/values, source keyword and primitive shadowing, and source/export aliases.
- #118: `test/import-binding-context-tests.ss` and `test/private-macro-context-check.ss`
  check runtime/macro/cross-kind conflicts, prefixed public keywords, same-origin forwarding,
  hidden dependency closure, and explicit macro-interface visibility.
- #106: `test/syntax-context-check.ss` and the shared program fixture pin the original
  `%do-step` capture and deliberate user-shadowing cases, alongside local recursive syntax.
- #91: shared malformed program/library fixtures check named batch diagnostics and REPL
  rollback/recovery; dotted `define-values` remains explicitly unsupported.
- #133: `docs/MODULES.md` describes roots propagated through finalized importers and
  distinguishes source-based pruning from full-unit artifact reuse; AOT tree-shaking and
  unit-pipeline suites exercise the documented behavior.
- Namespace boundary regressions cover imported globals versus source/alpha-renamed locals,
  imported primitive references versus source definitions, and private REPL slots versus
  later source definitions of their generated spellings.

## Workflow follow-up

- When committing is authorized, include matching regenerated bootstrap artifacts and `Fixes #119`, `Fixes #118`, `Fixes #106`, `Fixes #91`, and `Fixes #133` only once their complete acceptance evidence is satisfied; use the project's text-only conventional commit style.
- Run `test/trust-check.sh` after commit to compare regeneration against committed bootstrap IR; a dirty-bootstrap skip is not a successful trust check.
- Archive this change after implementation and review are complete, using the archive workflow.
