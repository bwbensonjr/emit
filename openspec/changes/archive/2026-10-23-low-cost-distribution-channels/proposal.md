# Proposal

## Why

Emit now has validated source releases and installed command checks, but users still assemble their own dependency and installation steps. Distribution roadmap step 2 can make installation routine through Homebrew, Nix, and an OCI image while reusing the completed release and validation foundations.

## What Changes

- Publish a source-build formula in `bwbensonjr/homebrew-emit`, installed as `bwbensonjr/emit/emit`, with explicit LLVM 22 and Boehm GC dependencies. Initially support Apple Silicon macOS; bottles and Linuxbrew are deferred.
- Add a locked Nix flake exposing `packages.default` and `devShells.default` for `aarch64-darwin` and `x86_64-linux`, using LLVM 22 and libgc. Build without Chez, regeneration, or network access after dependency acquisition; retain a separate opt-in verification environment for Chez.
- Provide `ghcr.io/bwbensonjr/emit` for `linux/amd64`, with the runtime libraries, matching clang, headers, linker, installed Scheme sources, and writable workspace/cache needed for all Emit commands. Pin the base image and dependency recipe; validate the final image before publication.
- Base initial channel promotion on a new source release containing the merged compiler and validation fixes. Select its version under the existing SemVer policy, use its exact validated source archive and checksum, and preserve `v0.1.0` unchanged. No channel follows a floating source branch.
- Rehearse package builds and installed behavior without publication. Promote channel metadata and the exact tested image only after the selected source release and channel checks pass; retain explicit retry and rollback procedures.
- Document installation, version/toolchain identity, upgrades, removal, package-maintainer inputs, offline build/test commands, and the boundary between Chez-free use and optional independent-host verification.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `distribution`: Extend the installed payload contract with release-bound Homebrew, Nix, and OCI channels, their dependency closures, installed acceptance checks, and publication/recovery behavior.

## Impact

Add packaging recipes, a Nix flake and lockfile, package validation fixtures, channel CI, and installation/maintainer documentation. The external tap repository and GHCR package become release destinations; credential and owner access must be verified before enabling publication. Reuse existing release gates, installed layout, discovery overrides, and validation profiles. Package-specific integration must preserve explicit overrides and source-build behavior.

This change does not require resolving open issues #27, #31, #33, #40, #49, #56, or #111; they concern independent language, compiler, diagnostics, or coverage work. It does not add bottles, homebrew-core submission, extra architectures, static binaries, installers, attestations, package fetching, or AOT redesign. Existing dynamic dependency and delivered-executable limitations remain documented. No compiler Scheme changes or bootstrap regeneration are planned.
