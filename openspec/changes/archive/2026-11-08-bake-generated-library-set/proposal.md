# Proposal

## Why

The standard-library generator and embedded compiler independently construct the same library forms (#31), while the generator's declaration guards have no negative-path coverage (#40). Making generated libraries load-bearing requires a Chez-free generator and tests that prove invalid declarations cannot silently change their surface.

## What Changes

- Run one portable generation implementation under Emit and Chez, with explicit prelude, declaration, and output paths.
- Bake the generated forms for every declared baked member, replacing runtime reconstruction from raw prelude source. Continue generating non-baked members for installation.
- Exercise current declaration guards with isolated invalid fixtures and diagnostic assertions; retain positive controls, including private macros.
- Make whole-file freshness checks available without Chez and integrate generation with explicit regeneration, input classification, source fingerprints, and isolated source verification.
- Preserve library surfaces, binding identity, initialization order, compiler-host parity, and standalone behavior; measure compiler payload and binary size changes.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `module-system`: Generated library forms become the shared representation consumed by compiler hosts; generation and its error checks are executable without Chez. Replace requirements that currently prescribe two derivations from prelude source.

## Non-goals

No library API relocation, numeric-tower work, macro diagnostic redesign, interactive library definition, disassembler, new general-purpose evaluator, or automatic regeneration during ordinary builds.

## Impact

Affected areas include `tools/gen-scheme-base.ss`, generation wrappers and guards, `src/core.ss`, `src/repl-core.ss`, compiler entry programs, `tools/regen.sh`, `tools/compiler-inputs.sh`, source/reference proof tooling, generated partition members, and regenerated bootstrap IR. Existing `(scheme base)`, `(scheme read)`, `(scheme file)`, and `(scheme process-context)` facilities support the portable generator; shell orchestration can supply directory creation and declaration assembly without adding runtime APIs.

Implementation is expected to warrant one patch release with a matching changelog section because installed compiler payloads change while language behavior remains compatible. These planning artifacts require no version bump. References: https://github.com/bwbensonjr/emit/issues/31 and https://github.com/bwbensonjr/emit/issues/40.
