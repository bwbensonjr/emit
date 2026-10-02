# Proposal

## Why

LLVM fallback discovery claims to choose known install prefixes newest-first, but it sorts candidate path names rather than the versions reported by `llvm-config`. On Homebrew, the versioned `llvm@22` path sorts after the unversioned `llvm` path even when the latter points to LLVM 23, causing a clean Emit build to silently use the older toolchain.

## What Changes

- Select among known-prefix `llvm-config` candidates by their reported LLVM versions rather than by lexicographic path order.
- Preserve the existing precedence of explicit overrides and tools found on `PATH`.
- Add regression coverage for coexisting Homebrew unversioned and versioned LLVM kegs, including the observed LLVM 23 versus `llvm@22` layout.
- Keep discovery narration aligned with the toolchain actually selected.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `toolchain-discovery`: Require fallback discovery to select the newest installed LLVM when multiple known-prefix candidates coexist.

## Impact

The change affects `tools/llvm-env.sh`, its toolchain-discovery tests, and the toolchain documentation if the selection rule needs to be stated explicitly. It does not change the override interface, the minimum-version policy, emitted IR, or compiler source, so it does not require `make regen`.
