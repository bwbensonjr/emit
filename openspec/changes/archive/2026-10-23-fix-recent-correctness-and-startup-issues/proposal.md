# Proposal

## Why

Five open GitHub issues filed in the last 24 hours expose incorrect program execution order, an intermittent CI failure, and avoidable installation/startup friction. Addressing them together restores REPL/batch fidelity and gives installed users a predictable first invocation.

The scope is the issue snapshot for 2026-10-22 20:47:54 UTC through 2026-10-23 20:47:54 UTC, inclusive; all five issues were open and had no comments when inspected.

## What Changes

- [#140](https://github.com/bwbensonjr/emit/issues/140): preserve source order between program definitions and expressions, including parameter updates before later initializers, across `emit run`, delivered executables, and source compilation.
- [#146](https://github.com/bwbensonjr/emit/issues/146): make the cancellation test tolerate a descendant disappearing during its `/proc` status read while retaining its live-process failure check.
- [#139](https://github.com/bwbensonjr/emit/issues/139): recognize Apple clang's vendor version in `emit doctor`, report textual-IR compatibility as unverified, and retain the upstream clang age check and existing compiler-selection precedence.
- [#148](https://github.com/bwbensonjr/emit/issues/148): add `emit build --stdlib` to prepare portable library artifacts and local native objects for the default `-O1` JIT profile. Run it after normal unprivileged source installs and in Homebrew's end-user post-install hook. Staging, privileged installs, and sandboxed package builds explicitly defer per-user warming.
- [#149](https://github.com/bwbensonjr/emit/issues/149): replace REPL startup's manifest/library listing with one line identifying the effective library sources. Retain full provider and per-library details at verbose level and suppress narration at quiet level.

## Capabilities

### New Capabilities

None; the existing capability boundaries cover this work.

### Modified Capabilities

- `core-language`: add ordered program top-level evaluation while preserving lexical scope, redefinition behavior, and internal-body restrictions.
- `emit-cli`: add the standard-library build mode and distinguish Apple clang compatibility from comparable upstream version numbers in doctor.
- `artifact-cache`: specify explicit warming, reuse, persistence verification, and failure behavior for standard-library caches.
- `distribution`: warm the installing user's cache where appropriate while retaining source-based, relocatable installation payloads and safe staging.
- `module-system`: aggregate startup provider narration into a single summary at default verbosity, with detailed provenance available at verbose verbosity.

The #146 fix satisfies the existing `development-validation` cancellation requirement without changing its contract; it needs implementation and validation tasks, not a new requirement.

## Impact

Compiler changes center on `src/parse.ss` and require explicit regeneration and compiler-source acceptance. Native-host changes center on `src/emit.cpp`; installation integration affects `Makefile`, `packaging/homebrew/emit.rb.in`, and sandboxed channel recipes. Regression coverage includes parser/source checks, CLI and doctor checks, cache and installation suites, resolver narration, and `test/test-runner-tests.py`. Update `README.md` and `docs/OUTPUT.md` to document the command and output policy. No new runtime dependency, new command verb, or installed native-library payload is introduced.
