# Proposal

## Why

Emit needs a short, trustworthy source-edit-to-feedback loop: the recent native run took 41 minutes, while release CI repeated full regression coverage across ten toolchains and spent up to 111 minutes provisioning each cold LLVM installation. Validation should match the changed inputs and the claim being checked, while retaining comprehensive correctness, bootstrap, installation, and independent-host evidence.

## What Changes

- Introduce shared, selectable validation profiles for fast local feedback, complete native regression, focused compatibility, source/bootstrap consistency, inexpensive compiler units, and independent-host verification. Preserve existing regression assertions through an explicit coverage inventory.
- Make local development a first-class acceptance case: measure representative compiler, runtime, native-host, and documentation edits; report selected tests and costs; reduce repeated setup; isolate build-mutating tests before bounded parallel execution.
- **BREAKING**: raise the documented/tested LLVM floor from 19 to 22 and maintain LLVM 22 and 23 on Linux and macOS. Preserve warn-only discovery below the floor, environment overrides, and acceptance of newer majors.
- Run full native PR coverage on LLVM 23 and focused compatibility coverage on LLVM 22, on both platforms. Classify documentation-only changes conservatively, cancel superseded PR runs, and run compiler-source consistency once rather than per matrix cell.
- Keep Chez out of ordinary native testing and installation. Retain inexpensive source-level Chez units separately; run expensive independent-host re-derivation once for release verification and on scheduled/manual reference runs, with targeted cross-host checks for relevant PRs.
- Reuse verified toolchain installations from trusted, immutable CI artifacts; use source provisioning for refresh/fallback rather than recompiling LLVM on every cold validation job. Cache misses must not silently change versions or reduce coverage.
- Reuse the same profiles for four-cell release regression coverage and both exact offline archive validations; retain publication gating, checksums, immutable assets, and tag/source identity checks.

## Capabilities

### New Capabilities

- `development-validation`: selectable local/CI validation, conservative change classification, coverage preservation, isolated execution, measured feedback costs, and verified CI dependency reuse.

### Modified Capabilities

- `self-hosting`: separate mandatory Chez-free source/bootstrap consistency from retained independent-host verification and define when each is required.
- `source-releases`: replace the ten-cell policy with LLVM 22/23 coverage and distinguish PR compatibility profiles from full tagged validation.
- `toolchain-discovery`: set the default tested floor to LLVM 22 without changing discovery precedence or warn-only behavior.

## Impact

Test runners and fixtures, CI workflows, dependency provisioning, bootstrap verification, build/test documentation, and project contributor instructions change. The shared compiler core, language semantics, user-facing Emit commands, generated bootstrap format, and published v0.1.0 assets are not redesign targets. Performance evidence and remaining speed debt belong in `docs/PERFORMANCE.md`; implementation must update the current build-workflow instructions rather than leaving contradictory test obligations. No implementation or new public release is part of this proposal step.
