## 1. Versioning

- [ ] 1.1 Add the committed version source-of-truth artifact (e.g. a top-level `VERSION` file)
      holding `0.1.0`, read without git metadata so tarball builds resolve it.
- [ ] 1.2 Bake the version into the `emit` binary (build-time define or generated source) and
      implement `emit --version` to print it.
- [ ] 1.3 Include the same version string in the `emit repl` startup banner (reading the one
      baked-in value, not a second literal).
- [ ] 1.4 Add a check that the version artifact and the release tag agree (`v<VERSION>` == tag),
      suitable for the release checklist / CI.

## 2. Release artifact

- [ ] 2.1 Verify a clean checkout builds `emit` with only LLVM + libgc + `make` (no Chez, no
      `make regen`) — confirm the committed `bootstrap/*.ll` are present and sufficient in a
      fresh extraction (e.g. from `git archive`), and that `emit --version` reports `0.1.0`
      from the extracted tree (no `.git`).
- [ ] 2.2 Create the `v0.1.0` git tag; produce the release tarball (GitHub release from the
      tag) and record its download URL.
- [ ] 2.3 Capture the tarball's SHA256 for the formula to reference.

## 3. Keg-only toolchain wiring

- [ ] 3.1 Reproduce the failure: with Homebrew `llvm` keg-only (no `llvm-config`/keg `clang` on
      `PATH`, only Apple `/usr/bin/clang`), confirm `emit build` cannot resolve an LLVM backend.
- [ ] 3.2 **Depends on `installed-emit-completeness`; do not design this again.** That change
      already built the lowest-priority installed default: `make install` ships
      `tools/llvm-env.sh` (plus the `tools/log.sh` it sources) under `<prefix>/share/emit/`, and
      the build resolved at compile time is recorded in the binary as
      `EMIT_DEFAULT_CC` / `_GC_INC` / `_GC_LIB`, consulted only after explicit env and after
      `llvm-env.sh` discovery (`toolchain-discovery` spec, "An installed binary carries its
      build-time toolchain as a last-resort default"). What remains HERE is formula-side only:
      confirm the bottle records a keg LLVM the formula can rely on, and that a keg upgrade is
      followed by the live-discovery layer rather than stranded on the recorded path.
- [ ] 3.3 Ensure `EMIT_LLVM_BIN` / `LLVM_CONFIG` overrides and normal `PATH`/keg discovery keep
      strictly higher precedence than the recorded fallback, so the from-source workflow is
      unchanged (the ladder is already ordered that way; this is a verification against the
      installed bottle, not a second implementation).

## 4. Homebrew tap and formula

- [ ] 4.1 Create the tap repository (`homebrew-emit`) with the standard `Formula/` layout.
- [ ] 4.2 Write `emit.rb`: `desc`/`homepage`/`url` (release tarball) + `sha256`;
      `depends_on "llvm"` and `depends_on "bdw-gc"` (unversioned `llvm`, no `llvm@NN`).
- [ ] 4.3 Implement the formula's `install` step: build via the project's default `make` with
      the environment pointed at the brew `llvm` + `bdw-gc`, install the `emit` binary, and
      apply the keg-only toolchain wiring from task group 3 (record/point at the keg's
      `llvm-config`/bin).
- [ ] 4.4 Add a formula `test do` block that runs a trivial `emit run` and asserts
      `emit --version` reports `0.1.0` (and, if feasible, an `emit build`) to smoke-test the install.

## 5. Verification

- [ ] 5.1 On a clean macOS environment (or a machine with LLVM/libgc absent from user PATH),
      run `brew tap … && brew install emit`; confirm `llvm` + `bdw-gc` are pulled in and `emit`
      lands on `PATH`.
- [ ] 5.2 Verify the installed `emit run` executes a sample program correctly, and
      `emit --version` reports `0.1.0`.
- [ ] 5.3 Verify the installed `emit build` links a working standalone executable via the keg
      toolchain (not Apple clang), and `emit repl` starts with the version in its banner.
- [ ] 5.4 Verify `brew test emit` passes and (best-effort) `brew audit --strict emit` is clean.
- [ ] 5.5 Confirm the from-source developer build is unchanged: a plain `make` and an
      `EMIT_LLVM_BIN`/`LLVM_CONFIG`-overridden build both still work as before.

## 6. Documentation

- [ ] 6.1 Add the `brew tap … && brew install emit` path to `README.md` as the recommended
      macOS install, keeping the existing from-source instructions.
- [ ] 6.2 Document the versioning policy (SemVer, MAJOR 0 during development, the `1.0` criterion)
      and `emit --version`.
- [ ] 6.3 Note the deferred scope (bottles, apt/Nix, homebrew-core) so expectations are clear.
