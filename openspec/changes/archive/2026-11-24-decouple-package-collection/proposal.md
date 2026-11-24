# Proposal

## Why

Emit's checked-in emit-packages commit makes independently maintained packages require follow-up Emit pull requests. The collection should own keeping its published tip compatible with Emit, while Emit owns a stable package installation and update contract.

## What Changes

- Remove Emit's collection pin and collection-specific native/reference validation gates. Ordinary Emit builds, tests, and releases will not fetch or depend on any emit-packages revision.
- Make emit-packages responsible for testing and maintaining its `main` tip against the latest stable released Emit, with declared minimum versions for older Emit users. This is an upstream handoff, completed in emit-packages itself.
- Preserve the existing `emit pkg install`, `available`, and `update` flow: resolve current collection `main` at invocation time and use one snapshot. A collection update requires no Emit source edit, pull request, or release.
- Retain per-install commit provenance for diagnostics and consistent downloads; it is local installed-package state, not an Emit-maintained compatibility pin.
- Replace collection-dependent installed acceptance checks with small Emit-owned fixture libraries. Transfer package semantics and execution-path coverage to emit-packages, with an explicit coverage ownership map.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `development-validation`: replace pinned collection gates with self-contained package contract checks and external ownership of package semantics.
- `package-manager`: explicitly guarantee that collection updates are discoverable by an unchanged Emit installation, and document compatibility ownership.
- `distribution`: retain installed library-root and package-manager acceptance using independent fixtures instead of fetching Malt.

## Impact

- Emit: `tools/emit-packages-pin.sh`, `tools/emit-packages.py`, `test/emit-packages-tests.sh`, `test/srfi-27-install-tests.sh`, the test registry and coverage guards, and package/development/validation documentation.
- emit-packages: compatibility policy, CI and execution-path checks, supported-version metadata, and installed-package smoke checks. These changes belong in that repository, rather than extending Emit's planning root into it.
- No package command syntax, manifest format, installed-state format, or compiler behavior changes are intended. No compiler regeneration is expected.
- This proposal changes planning artifacts only and needs no version bump. The intended implementation changes tests, CI, and documentation only and likewise needs no bump unless shipped behavior or payload changes during implementation.
