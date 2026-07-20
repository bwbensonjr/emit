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
- [ ] 3.2 Implement the lowest-priority "installed default" fallback in toolchain discovery
      (`tools/llvm-env.sh`, and `src/compile.ss`'s self-probe if needed) that consults a
      recorded keg LLVM location when no override is set and nothing suitable is on `PATH`.
- [ ] 3.3 Ensure `EMIT_LLVM_BIN` / `LLVM_CONFIG` overrides and normal `PATH`/keg discovery keep
      strictly higher precedence than the new fallback, so the from-source workflow is unchanged.

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
