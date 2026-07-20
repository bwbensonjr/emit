## Context

Emit builds today by cloning the repo and running `make`, which links the committed
host-agnostic bootstrap IR (`bootstrap/*.ll`) with the C runtime using only LLVM + libgc — no
Chez. The single user-facing binary is `emit` (verbs `run`/`repl`/`build`/`lib`). `run` and
`repl` JIT in-process through ORC/LLJIT, so the `emit` binary dynamically links `libLLVM`;
`build`/`lib` additionally fork `clang` to link user programs.

Two facts, confirmed against the working tree, define this change:

1. **No release exists.** `git tag` is empty. Package managers install from a tagged tarball,
   not `main`.
2. **Homebrew's `llvm` is keg-only.** There is no `/opt/homebrew/bin/clang` and `llvm-config`
   is not on `PATH`; the only `PATH` `clang` is Apple's Xcode clang, which cannot serve as
   Emit's LLVM-22-class backend and ships no `llvm-config`.

The exploration also established that the `emit ⇄ LLVM` coupling is two layers: a **runtime**
`libLLVM` SONAME coupling that only matters for prebuilt **bottles**, and a **compile-time**
C++/ORC API coupling (`src/emit.cpp` is compiled against LLVM headers) that matters for
**source** builds. This change is source-build-only, so only the compile-time layer is in play.

## Goals / Non-Goals

**Goals:**
- One-command macOS install (`brew install`) that also installs LLVM + Boehm GC.
- Use an established, trusted, owner-controlled channel (a Homebrew tap) — no `curl | sh`.
- A tagged, self-contained release tarball buildable with only LLVM + libgc + `make`.
- A brew-installed `emit` where `run`, `repl`, `build`, and `lib` all work, including the
  keg-only clang resolution.
- Stay coherent with the `toolchain-discovery` floor-not-pin requirement.

**Non-Goals (deferred to later changes):**
- Prebuilt **bottles** and the LLVM-major-bump rebuild CI (this is where the runtime SONAME
  coupling wakes up).
- **homebrew-core** submission (requires notability + review; the tap is the deliverable here).
- **Linux** channels: apt / PPA / apt.llvm.org, and Linuxbrew.
- **Nix** flake.
- Any change to the compiler, runtime, committed IR, or `toolchain-discovery` behavior.

## Decisions

### Track the unversioned `llvm`, do not pin `llvm@NN`

- **Why:** (1) coherent with the shipped `toolchain-discovery` requirement "the LLVM version
  requirement is a floor, not an exact pin"; (2) Homebrew removes old versioned `llvm@NN` kegs,
  and a pinned dependency becomes an unrecoverable install failure the day the keg is deleted;
  (3) source-build-only means there is no bottle SONAME to keep in lockstep, so the only
  residual risk is that a future LLVM major breaks `emit.cpp` compilation — which surfaces as a
  **loud compile error at install time**, exactly when a patch is warranted anyway.
- **Alternative considered:** pin `llvm@22`. Gives one stable compile target but contradicts
  the spec and is fragile against keg removal. If ORC API churn ever makes tracking painful,
  the mitigation is to pin the *local dev/CI* target via `EMIT_LLVM_BIN`, never the published
  formula.

### Source build in the formula (no bottles yet)

- **Why:** lowest infrastructure; no per-arch bottle CI, no release-artifact hosting beyond the
  tarball. It also dissolves the runtime coupling for now. `make` against the committed IR is
  minutes, not hours (no Chez, no regen).
- The formula's build step runs the project's default `make`, with the build environment
  pointed at the brew `llvm` + `bdw-gc` (the existing discovery already lists Homebrew keg
  paths, so this should resolve without patching the build).

### Tap first, not homebrew-core

- **Why:** a tap is owner-controlled, needs no external review, and delivers the exact
  dependency-resolving install the user wants today. homebrew-core (which would also automate
  dependent rebuilds on LLVM bumps) is a later step once stable releases and notability exist.

### Semantic Versioning, starting at 0.1.0, with a single committed version artifact

- **SemVer, MAJOR pinned at 0 during development.** All three target channels (Homebrew, apt,
  Nix) order and detect upgrades by SemVer, so it is the natural scheme. Staying at `0.y.z`
  honestly signals "no compatibility guarantee yet," which matches Emit's actively-evolving
  language. The `1.0.0` decision — the point at which a MAJOR bump promises a breaking change to
  the language/CLI surface — is deferred until Emit supports a consistent Scheme-standard subset
  (e.g. R7RS-small). First release is `0.1.0`.
- **Name the contract surface.** SemVer is meaningless without saying what compatibility covers.
  Here it covers the accepted language and the CLI. Explicitly excluded (versioned on their own
  axes): the internal bootstrap IR, the self-hosting fixed point, and the existing
  `compiler-stamp-version` in `src/compile.ss` (an artifact/unit-compat marker, not a release
  version — do not conflate the two).
- **Single committed source-of-truth, not git-derived.** Homebrew (and apt/Nix) build from a
  tarball with no `.git`, so `git describe` cannot supply the version. A committed artifact
  (e.g. a top-level `VERSION` file) is read by the build/binary; the release tag is that value
  prefixed with `v`. Keeping tag and artifact in sync is a release-checklist item (a CI check
  can assert `v<VERSION>` equals the tag being released).
- **Surfaced via `emit --version` and the REPL banner.** Both read the same baked-in value, so
  there is one number a user can see and a package `test do` block can assert. Wiring the value
  into the binary is a small build-time define or generated source; the REPL banner already
  prints at startup and gains the version string.
- **Alternative considered:** a standalone `versioning` capability/change. Rejected for now
  (YAGNI) — versioning has no consumer independent of this release/distribution work, and the
  release-artifact requirement already forces the policy. It lives in the `distribution`
  capability and can be factored out later if a second consumer appears.

### Post-install toolchain wiring for keg-only clang

The one genuinely new integration problem. A brew-installed `emit` must resolve the keg's
`clang`/`llvm-config` at runtime for `build`/`lib`, despite them being off `PATH`. Options to
weigh during implementation, in rough order of preference:

- **Record the resolved LLVM location as a baked default** the formula captures at build time
  (e.g. the keg's `llvm-config`/bin dir), consulted by discovery when no override and nothing
  on `PATH` — least surprising, no wrapper indirection.
- **Install a thin wrapper / env shim** that sets `EMIT_LLVM_BIN` (and libgc dirs) to the keg
  before exec'ing the real binary — simple, but adds a layer and can drift from `brew upgrade`.
- **Formula-managed symlinks** onto a discoverable location — fights Homebrew's keg-only intent;
  least preferred.

Whichever is chosen, from-source overrides (`EMIT_LLVM_BIN` / `LLVM_CONFIG`) MUST still win,
and the developer (non-brew) workflow MUST be unchanged. This likely touches
`tools/llvm-env.sh` discovery precedence and/or `src/compile.ss`'s self-probe, but only to add
a lowest-priority "installed default" fallback — not to change existing precedence.

## Risks / Trade-offs

- **[LLVM major bump breaks `emit.cpp` at install]** → Tracking `llvm` means a new major can
  fail the source build. Mitigation: it fails loudly and locally; treat it as the signal to
  ship an `emit.cpp` fix + new release; the floor-not-pin design already commits to forward
  support. A user can `brew pin llvm` to hold at a working major meanwhile.
- **[Keg-only clang wiring regresses dev workflow]** → The fallback must be *lowest* priority
  (below discovery and overrides). Mitigation: a from-source scenario in the spec asserts
  overrides still win; test both installed and from-source paths.
- **[No bottle = every user compiles]** → Accepted for this change; compiling against the
  committed IR is fast. Bottles are a deferred, separately-scoped follow-up.
- **[Tap discoverability]** → `brew install` requires the `owner/emit/emit` path or a prior
  `brew tap`. Mitigation: document clearly in the README; homebrew-core removes this later.

## Migration Plan

Additive. Existing from-source instructions remain. Sequence: (1) cut a `v0.x` tag + verify a
clean tarball builds with only LLVM + libgc + make; (2) create the `homebrew-emit` tap repo
with `emit.rb` referencing the tarball + SHA256; (3) implement + verify the keg-only clang
wiring; (4) document the brew path in the README. Rollback is deleting the tap / not
advertising it; nothing in the main repo's build depends on the tap.

## Open Questions

- Which keg-only wiring mechanism (baked default vs wrapper) — decide during implementation;
  leaning toward a baked lowest-priority default in discovery.
- ~~Initial version number and stability signal.~~ **RESOLVED: `0.1.0`; MAJOR stays 0 through
  development; `1.0` deferred until a consistent Scheme-standard subset (e.g. R7RS-small).**
- Exact form of the version artifact (a top-level `VERSION` file vs a generated source header)
  and how it is baked into the binary — decide during implementation.
- Where the tap repo lives (`bwbensonjr/homebrew-emit`) and whether the formula is generated
  or hand-maintained at first (hand-maintained for the first release).
