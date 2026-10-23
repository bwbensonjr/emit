# Tasks

## 1. Prerequisite confirmation

- [x] 1.1 Confirm external dependency availability and record it in design.md's Open Questions resolution. Check that Homebrew publishes `llvm@22` and `bdw-gc` for Apple Silicon, that the locked nixpkgs revision has `llvmPackages_22` (including an lld-default clang on `x86_64-linux`) and `boehmgc` for both systems, and that the chosen digest-pinned Ubuntu base ships `clang-22`/`lld-22`/`llvm-22` (otherwise use apt.llvm.org pinned packages per D6). Verify by recording each package name, version, and base-image digest; if `llvm@22` is unavailable, pause per the design's risk entry.
- [ ] 1.2 Verify publication access without publishing. Confirm with `gh auth status` that `bwbensonjr` owns or can create `bwbensonjr/homebrew-emit`, that a fine-grained `HOMEBREW_TAP_TOKEN` scoped to that repository can be configured, and that this repository's workflow token can write `ghcr.io/bwbensonjr/emit`. Verify by recording the result. Repository creation and secret setup are maintainer actions; ask before creating anything.

## 2. Installed toolchain pin (D1)

- [x] 2.1 Add `TOOLCHAIN_PIN=1` to `make install` so that it writes `$(DESTDIR)$(PREFIX)/share/emit/package/toolchain.env` with the resolved `EMIT_LLVM_BIN`, `CC`, `GC_INC`, `GC_LIB`, `GC_DYLIB`, and the LLVM version, with narration per docs/OUTPUT.md. Add `/package/` to `.gitignore`. Verify `test/install-layout-tests.sh` asserts that the file exists only with the flag, that `DESTDIR` does not leak into its values, and that explicit `EMIT_LLVM_BIN`/`GC_*` build inputs are recorded verbatim (unresolved).
- [x] 2.2 Teach `tools/llvm-env.sh` to read the pin by safe `KEY=value` parsing, with the precedence explicit override > pin > discovery. Pin `CC`/LLVM apply only when no LLVM override is set, and the libgc values apply per value. Fail with a message naming the pin file when the pinned clang is missing or the major differs. Add `EMIT_TOOLCHAIN_ORIGIN` to `--print-env`. Verify with new discovery fixtures: pin beats a different-major `clang`/`llvm-config` on PATH, `EMIT_LLVM_BIN` and `CC` overrides beat the pin, a `GC_INC` override mixes with the pinned `GC_LIB`, an invalid pin fails, and a checkout with no pin is unchanged.
- [x] 2.3 Report the toolchain origin and pin path in `emit doctor` (`src/emit.cpp`, host C++, plain `make`, no regen). Verify that doctor output under the existing doctor tests names `package`, `override`, or `discovery` correctly for pinned, overridden, and unpinned installs.
- [x] 2.4 Document the pin in docs/INSTALLATION.md (what it records, precedence, the failure mode, and why packages use it) and in docs/DOCTOR.md. Verify the documented `make install ... TOOLCHAIN_PIN=1` example runs as written into a temporary `DESTDIR`, and that `bash tools/test.sh dev --changed main` passes for the touched host and install inputs.

## 3. Shared installed acceptance (D3)

- [x] 3.1 Add `test/channel-accept/` fixtures: the release smoke program, a persistent-REPL script, `(srfi 1)`/`(srfi 64)` imports, a macro-exporting library with a program that uses it, and a non-baked shipped-library import. Verify each fixture prints 42 under JIT, AOT, and the REPL from a temporary directory, using a staged install of the in-tree build (the bare `build/emit` has no installed payload).
- [x] 3.2 Add `tools/channel-accept.sh --emit PATH --expect-version V --report FILE [--source-digest D]` (bash and POSIX utilities only; it runs where `emit` runs, inside the container for OCI). It runs from a fresh directory with a private `EMIT_CACHE`, unsets `EMIT_MANIFEST`/library-path variables, runs the D3 checks in order, and writes a JSON report covering digest, platform, version and doctor toolchain lines, checks, and outcomes, treating a missing result as failure. Verify through `test/install-layout-tests.sh` that it passes all checks against a read-only pinned install, and that a wrong version, a broken fixture, and a payload write each fail their own check while the other checks still run.
- [x] 3.3 Make `tools/ci-installed-smoke.sh` a thin caller of `channel-accept.sh` that keeps its CLI and the read-only-prefix behavior (`chmod -R a-w` on the staged prefix before acceptance). Verify `test/release-source-tests.sh` and an offline `tools/ci-archive.sh` run still pass, and that a deliberate write into the read-only prefix is caught.
- [x] 3.4 Factor the Linux namespace and macOS `sandbox-exec` network denial out of `tools/ci-archive.sh` into `tools/offline-run.sh`, with `ci-archive.sh` as its first caller. Verify that the connectivity-must-fail probe still runs, and that the archive validation behaves identically on both platforms in a CI rehearsal.

## 4. Release identity and archive boundary (D2)

- [x] 4.1 Define the `packaging/release.json` schema (version, tag, commit, archive_url, sha256). Add `tools/channel-identity.sh`, which verifies an archive against the file (digest, root, `VERSION`, and the tag-to-version match) with no fallback. Verify fixtures show that a wrong digest, wrong version, or missing file fails before any build.
- [x] 4.2 Ensure `tools/release-source.sh` excludes `flake.nix`, `flake.lock`, and `packaging/`. Verify that a new assertion in `test/release-source-tests.sh` fails if any of them appears in the archive.

## 5. Homebrew formula (D4)

- [x] 5.1 Add the `packaging/homebrew/emit.rb.in` template and `tools/channel-render.sh`, which renders it from `release.json` or from a candidate archive URL and digest. The template declares `llvm@22` and `bdw-gc` with arm64 macOS only, sets explicit `opt` paths for every toolchain variable, runs `make install PREFIX=#{prefix} TOOLCHAIN_PIN=1`, installs license notices, and has a `test do` block. Verify the rendered formula passes `brew style` and `brew audit --new --formula` in a local throwaway tap.
- [x] 5.2 Rehearse locally on Apple Silicon. Run `brew install --build-from-source` from a local tap pointing at a `file://` candidate archive, then run `channel-accept.sh` against `$(brew --prefix)/bin/emit` offline, with PATH limited to Homebrew `bin` plus system directories and with `llvm` (unversioned) also installed. Verify the report shows a `package` origin with the `llvm@22` clang, and that `brew uninstall` leaves no residue under the prefix.

## 6. Nix flake (D5)

- [x] 6.1 Add `packaging/nix/emit.nix`, plus `flake.nix` and `flake.lock` exposing `packages.candidate` from `self` for `aarch64-darwin` and `x86_64-linux`, with `packages.default` gated on `packaging/release.json` and identity-checked against it. Verify that `nix build .#candidate` succeeds in the sandbox with no network, Chez, Git metadata, or regeneration, and that `nix flake check` passes on both systems.
- [x] 6.2 Add `devShells.default` (native build tools, no Chez) and `devShells.verify` (plus Chez). Verify that `make` plus `bash tools/test.sh units` works in the verify shell, that `command -v chez` fails in the default shell, and that entering either shell leaves `bootstrap/` byte-identical.
- [x] 6.3 Run `channel-accept.sh` against `result/bin/emit` from a fresh environment, outside any shell, offline, with the checkout moved away. Verify both systems pass, including the AOT `-flto` link (switch the D5 clang variant if `aarch64-darwin` fails), and that `nix-store -qR` shows the pinned clang and libgc in the runtime closure.

## 7. OCI image (D6)

- [x] 7.1 Add `packaging/oci/Containerfile`, with the builder stage verifying the archive digest argument and the final stage on the digest-pinned base with exact package versions, `clang.cfg` set to `-fuse-ld=lld`, `/opt/emit` read-only, `/work` and `/cache` at mode 1777, `EMIT_CACHE`/`HOME`, an exec-form entrypoint, and OCI plus LLVM labels. Verify that `docker buildx build --platform linux/amd64 --output type=oci` succeeds from a candidate archive and that the labels match `release.json` or the candidate identity.
- [x] 7.2 Run `channel-accept.sh` inside the loaded OCI image (`docker run --rm --network none --read-only --user 12345:12345`, `tools/` and `test/channel-accept/` mounted read-only, writable `/work` and `/cache`). Verify all checks pass, an AOT executable is written to the mounted workspace, the exit status of a failing program propagates, and the image contains no Chez, Git, or source tree.

## 8. Channel workflow (D7)

- [x] 8.1 Add a `packaging` class to `tools/test-classify.py` and `tools/ci-policy.py` covering `packaging/**`, `flake.*`, `tools/channel-*.sh`, `tools/offline-run.sh`, and `test/channel-accept/**`. Verify the classifier fixtures select channel rehearsal for those paths, do not select it for compiler or documentation-only changes, and keep the existing plans unchanged.
- [x] 8.2 Add `.github/workflows/channels.yml` with identity, homebrew, nix (two systems), and oci jobs that are independent and SHA-pinned. Rehearsal (PR or dispatch with `publish: false`) gets no write permissions and no tap token, and uploads every report. Verify a PR rehearsal on this branch runs all four channel cells green and produces reports with no public side effects.
- [x] 8.3 Add promotion steps that are gated on a published source release and on each job's own passing acceptance:
  - a credential preflight;
  - an OCI `skopeo copy --preserve-digests` of the tested archive, where the version tag succeeds when it already matches, fails on a different digest, and `latest` is updated last;
  - a tap pull request from the rendered formula;
  - a pull request in this repository updating `packaging/release.json`.

  Verify with a registry fixture (local `registry:2`) and a GitHub mock that a retry is idempotent, a conflicting digest fails visibly, and one channel's failure leaves the others' results intact.
- [ ] 8.4 Document the channel workflow in docs/RELEASE-PIPELINE.md: triggers, the build-once/promote-exact rule, the per-channel retry procedure, and rollback (tap or flake revert, re-pointing `latest`, never retagging). Verify the documented rehearsal dispatch command runs as written.

## 9. User and maintainer documentation

- [x] 9.1 Add channel sections to docs/INSTALLATION.md covering Homebrew, Nix, and OCI. Each states the supported OS and architecture, the exact install and `emit --version`/`emit doctor` checks, upgrade, removal and recovery, its dependency model (dynamic LLVM 22 and libgc, and a toolchain needed for AOT), no standalone static executables, and a link to the current language limitations. Verify that every advertised platform matches the `channels.yml` matrix.
- [x] 9.2 Add docs/PACKAGING.md for downstream maintainers covering:
  - declared inputs;
  - an offline `make` plus `make install PREFIX=... DESTDIR=... TOOLCHAIN_PIN=1`;
  - selected native checks (`tools/ci-installed-smoke.sh`, plus the dev profile) requiring neither network nor Chez;
  - separate Chez-requiring `units`/`reference` commands and their prerequisites, without implying skipped checks pass.

  Verify the documented offline build, staging, and smoke sequence runs as written under `tools/offline-run.sh` from an extracted candidate archive.
- [x] 9.3 Update docs/DISTRIBUTION.md to keep the in-flight current-state and step 1 edits, mark step 2 delivered (linking INSTALLATION.md, PACKAGING.md, and the channel workflow), and leave steps 3 through 5 unchanged. Verify the lightweight documentation checks pass.

## 10. Channel release and promotion

- [ ] 10.1 Choose the next version under the SemVer policy from the changes since `v0.1.0`, and prepare `VERSION` and its `CHANGELOG.md` section. Verify `tools/release-source.sh HEAD` plus `tools/release-check.sh` pass locally and that the `v0.1.0` tag and its assets are unchanged. Confirm the version, and get approval to tag, from the maintainer before pushing.
- [ ] 10.2 After the maintainer-approved tag publishes through `release.yml`, run `channels.yml` in rehearsal mode against the tag. Verify all channel reports pass against the exact published digest.
- [ ] 10.3 Run promotion and get the tap and flake pull requests reviewed and merged. Verify:
  - `brew install bwbensonjr/emit/emit` on a clean Apple Silicon host;
  - `nix run github:bwbensonjr/emit -- --version` on both systems;
  - `docker run ghcr.io/bwbensonjr/emit:X.Y.Z --version`;
  - the GHCR version tag resolves to the digest recorded in the oci report.

  Record the URLs, digests, and report links in docs/VALIDATION-RESULTS.md.

## 11. Integrated acceptance

- [ ] 11.1 Reconcile the delivered behavior against every scenario in `specs/distribution/spec.md`. Verify with `openspec validate low-cost-distribution-channels --strict`, a clean tracked tree after verification, no `make regen` input changes (`bash tools/compiler-inputs.sh --list` against the diff), and the classified native checks for the touched host, install, and tool files.

## Workflow follow-up

- Bottles, Linuxbrew, `linux/arm64`, and homebrew-core submission remain later distribution steps; note any demand in docs/DISTRIBUTION.md rather than this change.
- Archive the change after review and the first successful promotion.
