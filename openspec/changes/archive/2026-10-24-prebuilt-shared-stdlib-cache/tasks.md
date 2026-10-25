# Tasks

## 1. Shared lookup tier (design D1, D2)

- [x] 1.1 Resolve the shared cache directory in `src/emit.cpp`. The default is the directory of the shipped manifest that `support_file()` resolves, plus `/library-cache`. `EMIT_SHARED_CACHE` set to a path overrides it, and set to the empty string disables it. The result is memoized like `cache_dir()`. Verify with `make` and a `test/native-object-cache-tests.sh` case: a checkout `build/emit` with `EMIT_SHARED_CACHE` unset consults no shared directory.
- [x] 1.2 Route portable loads (baked set, unit, shake) through one helper. It tries the shared stem first, then the user stem when the result is not `Hit`, and leaves `cache_store_entry` writing only the user stem. Verify with a test case: populate a directory with `build --stdlib`, point `EMIT_SHARED_CACHE` at it with an empty `EMIT_CACHE`, and run a program importing `(scheme char)`. Verbose narration reports shared reuse, and the user cache gains no `baked-` or `unit-` entry for the shipped libraries.
- [x] 1.3 Route the native loaders for `native-unit-` and `native-baked-` entries through the same two-tier lookup, writing only to the user tier. Verify with a test case: a shared directory prepared under `-O1`, with an `-O2` run, writes the `-O2` native object to the user cache, and a second `-O2` run reuses it from the user tier.
- [x] 1.4 Bypass the shared tier wherever the user tier is bypassed (`cache_bypassed_for_dump`). Verify with a test case: `--dump-all` against a populated shared directory prints the same library stages as a cold run.
- [x] 1.5 Add fallthrough tests to `test/native-object-cache-tests.sh`, and verify each one completes with correct output and no error:
  - a shared directory produced by a different executable (simulated by rewriting the digest in a copied entry's stamp and name, or by copying in a stale entry): no reuse;
  - a truncated shared `.ll`: refused, with fallback;
  - an unreadable shared directory (`chmod 000`);
  - `EMIT_SHARED_CACHE=` disabling the tier.

## 2. Shared preparation (design D3)

- [x] 2.1 Parse `--shared` in `emit build`. It is accepted only with `--stdlib`, and is rejected otherwise, naming the argument, with the existing incompatibility message. Update `emit build --help` and `emit help build`. Verify with `test/emit-cli-tests.sh` cases: help text, `--shared` alone rejected, `--stdlib --shared -o x` rejected.
- [x] 2.2 Implement `--shared` in `warm_stdlib`:
  - disable the shared tier;
  - override the cache directory to `library-cache.tmp-<pid>` beside the destination;
  - apply `umask(022)` and directory mode `0755`;
  - verify persistence, then rename the old directory aside, rename the new one into place, and remove the old one;
  - remove the temporary directory on any failure and exit non-zero, naming the destination;
  - remove stale `library-cache.tmp-*` siblings before starting.

  Verify with test cases:
  - preparing twice leaves only the current executable's entries and no temporary siblings;
  - the files are `0644` and the directories `0755` under `umask 077`;
  - an unwritable parent exits non-zero, names the destination, and leaves the previous directory intact.
- [x] 2.3 Make the plain `--stdlib` summary count shared hits as reused, appending `(K shared)`. Verify with a test case: after `--shared`, a plain `build --stdlib` with an empty `EMIT_CACHE` reports `portable 11 reused` with `(11 shared)` and writes no portable entry to the user cache.

## 3. Narration and doctor (design D6)

- [x] 3.1 Add the `[shared]` and `[user]` tier word to verbose portable and native reuse narration, and narrate a shared rejection reason before the user lookup. Update `docs/OUTPUT.md` "Native object cache" and its examples. Verify:
  - a test case greps a `[shared]` reuse line on stderr;
  - stdout is byte-identical with the shared tier enabled and disabled;
  - quiet mode prints no cache narration.
- [x] 3.2 Add the `user cache:` and `shared cache:` lines to `emit doctor`, with the origin (`installation`, `EMIT_SHARED_CACHE`, `disabled`) and the state (`absent`, `<n> entries, matches this executable`, `<n> entries, built by another executable`), reading stamps only. Verify with cases for each state, placed in `test/native-object-cache-tests.sh` beside the one prepared shared cache they need rather than in `test/emit-cli-tests.sh`, which would have to prepare its own. Each case checks that doctor's exit status is unchanged by the shared cache state and that no file under the shared directory changes (by digest).

## 4. Installation (design D4)

- [x] 4.1 In the `Makefile` `install` target, replace user-cache warming with `"$(BINDIR)/emit" build --stdlib --shared` when `DESTDIR` is empty and `WARM_STDLIB` is not `0`. Remove the privileged-install deferral, keep best-effort failure narration with the retry command, and narrate the shared directory and its size. Verify with `test/install-layout-tests.sh`:
  - an install produces `<prefix>/share/emit/library-cache`, and the installed `emit doctor` reports it as matching;
  - the test's `EMIT_CACHE` stays empty after install;
  - a second install leaves one executable's entries.
- [x] 4.2 Keep the staged and `WARM_STDLIB=0` deferrals with their narration. Verify with the existing install-layout cases: the staged-install and deferred-install assertions are updated to the new wording, and a staged tree contains no `library-cache`.
- [x] 4.3 Make `make uninstall` remove `$(SHAREDIR)/library-cache`. Verify with an install-layout case: after `make uninstall`, the prefix's `share/emit` is pruned completely.
- [x] 4.4 Update the install-layout privileged-install case, where root now prepares the shared cache, and the warm-failure case, where a blocked shared destination still lets the install succeed with the retry message. Verify that `bash test/install-layout-tests.sh` passes.

## 5. Channels (design D5)

- [x] 5.1 Homebrew (`packaging/homebrew/emit.rb.in`): drop `WARM_STDLIB=0` and the `caveats` block. In `test do`, assert that `emit doctor` reports `matches this executable` for the shared cache. Verify by rendering with `tools/channel-render.sh` and running `brew style` on the rendered formula. Update the `test/ci-policy-tests.py` caveats test so it asserts no caveats and no `post_install`.
- [x] 5.2 Nix (`packaging/nix/emit.nix`): keep `WARM_STDLIB=0`. At the end of `postFixup`, after `wrapProgram`, run `EMIT_SHARED_CACHE=$out/share/emit/library-cache $out/bin/emit build --stdlib --shared`. Verify with a policy test pinning the order (`wrapProgram` before preparation) and, where Nix is available, `nix build .#candidate` followed by `result/bin/emit doctor` reporting a match. (Nix is not installed on the implementing machine, so the order is pinned by the policy test; the 0.3.0 channels run builds both Nix systems and its acceptance checks the match.)
- [x] 5.3 OCI (`packaging/oci/Containerfile`): drop `WARM_STDLIB=0` from the builder's `make install`. Verify with a policy test, and by building the image locally (`docker buildx build --platform linux/amd64`) and checking that `docker run ... doctor` reports a matching shared cache at `/opt/emit/share/emit/library-cache`. (Built for `linux/arm64`: under local amd64 emulation the builder's `tar` fails with "Function not implemented" before Emit is involved. The arm64 image reported a match and passed all 13 acceptance checks offline, read-only, as UID 1234.)
- [x] 5.4 In `tools/channel-accept.sh`, add the doctor match check and a `build --stdlib` check against the empty private `EMIT_CACHE` that requires every portable entry reused from the shared tier, without asserting native counts. Record both in the report. Verify by running the script against a local `make install` prefix (pass) and against one whose `library-cache` was deleted (fail, naming the check).

## 6. Documentation and release

- [x] 6.1 Update `docs/INSTALLATION.md`, the cache sections of `docs/MODULES.md`, and `README.md`:
  - the shared cache's location and its `EMIT_SHARED_CACHE` override;
  - that it is safe to delete;
  - that `make install` prepares it and staged installs defer;
  - that Homebrew needs no manual step;
  - removal of the "ships no compiled artifact" wording.

  Verify with `grep -n "post_install\|caveat\|no compiled" docs/INSTALLATION.md README.md docs/MODULES.md`, which shows no stale claim.
- [x] 6.2 Bump `VERSION` to `0.3.0` and add a `## 0.3.0` `CHANGELOG.md` section. It names the feature, the `--shared` flag, `EMIT_SHARED_CACHE`, the doctor lines, and the installer behavior change (no user-cache warming, about 8 MB in the prefix). Verify that `tools/release-tag.sh check HEAD` passes.
- [x] 6.3 Run the host validation for a host-only change: `make`, `bash tools/test.sh dev --changed origin/main`, `bash test/native-object-cache-tests.sh`, `bash test/install-layout-tests.sh`, `bash test/emit-cli-tests.sh`, and `python3 test/ci-policy-tests.py`. Confirm `git diff --stat -- bootstrap/` is empty, since no regen is needed. Verify that all of them pass, and record any pre-existing failures (such as the #117 lli suites) by name. (Result: `make`; `dev --changed origin/main` 55/55 suites passed; native-object-cache 44/44; install-layout 95/95; emit-cli 119/119; ci-policy 17/17; `bootstrap/` unchanged. No pre-existing failures appeared in the selected plan.)
- [x] 6.4 Measure the outcome on an installed prefix: time a first `emit run` of a `(scheme char)` program with an empty user cache, before and after, and record the installed size. Verify that the numbers are added to the `CHANGELOG.md` section or the pull request description.

## Workflow follow-up

- After merge, the 0.3.0 channels run is the end-to-end check. Its acceptance must report a matching shared cache for Homebrew, both Nix systems, and OCI before the promotion PRs are merged.
- Sync and archive this change once it ships.
