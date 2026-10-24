# Proposal

## Why

Emit compiles its standard libraries on first use and keeps the results in a single
per-user cache under the user's home directory. The packaged installs (Homebrew, Nix,
and OCI) can't fill that cache:

- **Homebrew:** `post_install` runs in a sandbox with a temporary `HOME` (#154).
- **Nix:** the build sandbox has no user.
- **OCI:** the image has no end user when it is built.

So every packaged user's first `emit run`, `emit repl`, or `emit build` waits through a
silent standard-library compile:

- about 18.7 s on an Apple Silicon laptop;
- 24.4 s in the published linux/amd64 image;
- longer for a cold first `emit repl`.

Homebrew users are told to run `emit build --stdlib` by hand.

That cost can be paid once, when the package is built, instead of by each user. The
measured price is small:

| Channel | Today | Added | Download increase |
|---|---|---|---|
| Homebrew package (`Cellar/emit/0.2.1`) | 3.6 MB | 7.5 MB (1.1 MB gzipped) | +122% gzipped |
| OCI image | 516.5 MB | 8.6 MB unpacked | +0.66% compressed |

## What Changes

- **A read-only shared library cache inside the installation.**
  - **Location.** An installed Emit looks for prepared entries in `share/emit/library-cache/`
    next to its shipped manifest.
  - **Lookup order.** That directory is checked before the user's cache.
  - **Writes.** New entries still go only to the user's cache.
  - **Validity.** Shared entries use the existing format and the existing checks. An entry
    that doesn't match the running executable, the library sources, the target CPU, LLVM, or
    the optimization profile is a miss. The command then falls back to the user's cache and
    finally to source.
  - **Override.** `EMIT_SHARED_CACHE` replaces the location. Setting it to the empty string
    turns the shared cache off.
- **`emit build --stdlib --shared`.** This prepares the shared cache for the invoked
  executable. It builds into a temporary sibling directory, makes the result readable by
  everyone, and replaces the old shared cache in one rename. Entries from earlier binaries
  therefore never pile up. It ignores the user's cache and any existing shared cache, and it
  exits non-zero if it can't finish.
- **Installation prepares the shared cache, not a user's cache.**
  - **`make install`.** When `DESTDIR` is empty, so the final location is known, it runs
    `emit build --stdlib --shared` instead of warming the installing user's cache. This now
    also covers privileged installs, which no longer have the wrong-user problem.
  - **Staged installs and opt-out.** Staged installs, and installs with `WARM_STDLIB=0`, still
    defer. Failure is reported, does not stop the install, and leaves a usable installation.
  - **`make uninstall`.** It removes the shared cache directory.
  - **BREAKING (installer behavior):** a plain `make install` no longer writes to
    `~/Library/Caches/emit` or `~/.cache/emit`. It writes about 8 MB into
    `<prefix>/share/emit/` instead.
- **All three channels ship the shared cache.**
  - **Homebrew** prepares it in `install` and drops the `emit build --stdlib` caveat.
  - **Nix** prepares it in `postFixup`, after stripping and wrapping, so it describes the
    binary that is actually installed.
  - **OCI** prepares it in the builder stage at the final `/opt/emit` path.
  - **Acceptance** for every channel checks that the shipped shared cache matches the
    installed executable. A packaging step that rewrites the binary afterwards then shows up
    as a channel failure instead of a silent slowdown.
- **Narration and doctor name the cache in use.**
  - **Narration.** Reuse messages say whether an entry came from the shared cache or the
    user's cache.
  - **Doctor.** `emit doctor` reports both locations. For the shared cache it also reports
    whether the cache is present, how many entries it holds, and whether it was built by this
    executable.

## Capabilities

### New Capabilities

None. The behavior belongs to existing capabilities.

### Modified Capabilities

- **`artifact-cache`:** a second, read-only cache location prepared at install time.
  - "The cache is available from an installed emit, not only a checkout" forbids any
    compiled artifact in an installation. It is removed and replaced by "An installed emit
    caches in a user location and never writes its installation".
  - The native-object rule "never shipped in the installation tree" is relaxed the same way.
  - New requirements cover:
    - the shared cache as a disposable accelerator;
    - its lookup order;
    - validity;
    - the `EMIT_SHARED_CACHE` override;
    - `--shared` preparation and atomic replacement;
    - narration that names the tier.
- **`emit-cli`:** `emit build --stdlib` gains `--shared`. `emit doctor` reports the library
  cache locations and whether the shared cache matches the running executable.
- **`distribution`:**
  - "`make install` produces the installed layout" allows the derived shared cache in the
    prefix.
  - "User installation prepares the first standard-library invocation" is removed. Today an
    install warms the user's cache and the package channels defer. Three requirements replace
    it:
    - an install whose final location is known prepares the shared cache;
    - preparation can be deferred and never blocks an install;
    - packaged installs prepare the cache against their final executable.
  - Channel acceptance checks that the shipped shared cache matches its executable.

## Impact

- **Code.**
  - `src/emit.cpp`: cache lookup for portable and native entries (`cache_entry_stem`,
    `native_stem`, `cache_load_entry` and its callers), `warm_stdlib`, `emit build` argument
    parsing and help, `emit doctor`, and cache narration.
  - The cache format and `kCacheVersion`/`kNativeCacheVersion` do not change.
  - `src/emit.cpp` is native host C++, so the change needs plain `make`, not `make regen`.
- **Build and packaging.**
  - `Makefile`: the `install` and `uninstall` targets.
  - `packaging/homebrew/emit.rb.in`: install, caveats, and test.
  - `packaging/nix/emit.nix`: `postFixup`.
  - `packaging/oci/Containerfile`: the builder stage.
  - `tools/channel-accept.sh`: a shared-cache match check.
- **Tests.**
  - `test/native-object-cache-tests.sh` (shared cache hits, misses, and writes going only to
    the user's cache);
  - `test/install-layout-tests.sh` (install, staged install, privileged install, and
    uninstall);
  - `test/emit-cli-tests.sh` (`--shared` arguments and help, doctor lines);
  - `test/ci-policy-tests.py` (channel recipes).
- **Docs.** `docs/INSTALLATION.md`, `docs/MODULES.md` (the cache sections), `README.md`, and
  `docs/OUTPUT.md` if the narration vocabulary changes.
- **Release.** A new feature with an installer behavior change, so a minor bump to 0.3.0 with
  a matching `CHANGELOG.md` section.
- **Costs.** Each channel build takes about 20–25 s longer. Installed size grows by about 8 MB.
