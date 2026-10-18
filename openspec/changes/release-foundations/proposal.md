# Proposal

## Why

Emit has a Chez-free source build and an installed library layout, but no public version identity, compatibility CI, or tagged source releases. The first step in `docs/DISTRIBUTION.md` makes those foundations dependable before adding distribution channels and binary bundles.

## What Changes

- Establish a single semantic version source, an initial `0.1.0` release, a documented pre-1.0 compatibility policy, and `emit --version` reporting both Emit and build-time LLVM versions.
- Add `emit doctor` to report build identity, the effective native toolchain and libgc locations, and ordered library providers using existing discovery and resolution logic.
- Verify the existing executable-relative installation layout, symlink resolution, and compiled-prefix fallback through relocation tests across all four compilation commands. Preserve project-provider precedence.
- Add source-build CI for LLVM majors 19 through 23 on Linux and macOS, compiling the committed bootstrap IR without Chez.
- Add a tag-driven source-release pipeline producing a versioned source tarball, SHA-256 checksums, and release notes from a maintained changelog. Validate the extracted archive before publication and cut the first `v0.1.0` release during implementation.

## Capabilities

### New Capabilities

- `source-releases`: Semantic version policy, source-release contents, tested LLVM/platform coverage, and repeatable tagged publication.

### Modified Capabilities

- `emit-cli`: Extend dispatch with `doctor` and top-level `--version`; define diagnostic output, status, and help behavior.

The existing `distribution` requirements already cover executable-relative library roots and prefix fallback. This change adds verification of that contract without duplicating or changing it.

## Impact

Primary implementation areas are `src/emit.cpp`, `Makefile` and its native configuration stamp, `tools/llvm-env.sh`, CLI/install tests, new CI/release workflows, version metadata, changelog, and release documentation. Source archives must include committed bootstrap IR and the complete vendored source/license closure. No compiler-core semantics or installed source layout changes are intended.

This change covers step 1 only. Homebrew, Nix, OCI images, in-process object emission, a static runtime, binary tarballs, installers, attestations, notarization, and package fetching remain later changes. New GitHub Actions will be pinned by commit SHA. Publishing the first release is a distinct final implementation step after validation; this proposal itself publishes nothing.
