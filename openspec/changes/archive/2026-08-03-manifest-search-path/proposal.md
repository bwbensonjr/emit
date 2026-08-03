## Why

A library resolved through the manifest is reachable only when the process happens to run in a
directory that can see `emit-libs.scm` and `lib/`. The default manifest is the literal relative
string `"emit-libs.scm"`, resolved against the current working directory at four sites in the host
(`src/emit.cpp:409` run, `:579` build, `:867` repl, `:956` lib), with no exe-relative and no
install-prefix lookup:

```
$ cd /tmp
$ echo '(display (map (lambda (x) (* x x)) (list 1 2 3)))' | emit run
(1 4 9)                                                     # baked (scheme base): fine
$ echo '(import (scheme inexact)) (display (sqrt 2.0))' | emit run
emit: program imports a library not found in the manifest    # (scheme inexact): gone
```

This matters now because `homebrew-tap-distribution` is about to make `brew install emit` the
recommended macOS install, and that change installs the binary while mentioning neither
`emit-libs.scm` nor `lib/` anywhere in its proposal, design, or specs. A brew-installed `emit`
would ship with its second standard library unreachable. Every library added later inherits the
same fate — #33 alone would move `read`, the deep `cxr` forms, and the six file procedures out of
the baked `(scheme base)` and onto disk, turning a missing-file problem into "part of R7RS-small is
unavailable in the shipped product." This is step ① of the sequence in
`openspec/explorations/library-sources-and-artifacts.md`: the cheapest item with the widest reach,
and the one none of #18, #31, or #33 owns.

## What Changes

- **Give the manifest an ordered search path** instead of a single CWD-relative name, applied
  uniformly at all four host sites and in the Chez driver (`src/compile.ss:362`):
  1. `--manifest FILE` (explicit, wins);
  2. `$EMIT_MANIFEST` (unchanged);
  3. `./emit-libs.scm` (unchanged — preserves every current in-repo invocation);
  4. exe-relative `<realpath(argv[0])>/../share/emit/emit-libs.scm`, resolving the real path so a
     Homebrew symlink in `/opt/homebrew/bin` lands inside the keg;
  5. a compiled-in `$PREFIX/share/emit/emit-libs.scm` fallback.
- **BREAKING — resolve a manifest's `(source …)` and `(output …)` paths relative to the directory
  of the manifest that was found**, not to the current working directory. One rule: paths inside a
  manifest are relative to that manifest. This is what lets an installed
  `share/emit/emit-libs.scm` name `lib/scheme/base.sld` and find it. Today's convention is the
  opposite and is stated explicitly in `test/emit-build-tests.sh:28` ("Sources are repo-relative"),
  so the in-repo fixtures that place a manifest in `$TMP` while keeping sources repo-relative must
  be rewritten. Absolute paths are unaffected; the repo's own `./emit-libs.scm` is unaffected
  (its directory *is* the repo root).
- **Add `make install`** staging the binary, `emit-libs.scm`, and `lib/**.sld` into
  `$PREFIX/share/emit` (default `/usr/local`, honoring `DESTDIR`), so the exe-relative and
  `$PREFIX` lookups have something real to find and the fix is verifiable end-to-end from an
  install prefix rather than asserted. Library **source** ships; today's lazy compile-on-demand is
  retained, and shipping precompiled `.ll`/`.exports` stays out of scope.
- **Narrate which manifest was resolved** (one `docs/OUTPUT.md`-conforming stderr line, suppressed
  at `EMIT_VERBOSITY=quiet`), so "which `emit-libs.scm` am I getting?" is observable rather than
  mysterious. A manifest found nowhere stays non-fatal — the import reports it — but the narration
  makes the silent early return in `preload_user_libraries` (`src/emit.cpp:230-235`) visible.
- **Correct the manifest precedence recorded in the spec.** `openspec/specs/module-system/spec.md:451`
  says `EMIT_MANIFEST` is consulted *before* `--manifest`; both the implementation and
  `docs/MODULES.md:171` have `--manifest` winning. The spec text is wrong and is fixed here rather
  than left to contradict the new lookup order.

Non-goals: precompiled library artifacts in the install tree; a library *search path* with multiple
manifests (exploration open question 3); import sets; anything in #18, #31, or #33.

## Capabilities

### New Capabilities
- `distribution`: what an installed Emit consists of on disk — the `$PREFIX` layout, which files
  must sit beside the binary for the standard libraries to resolve, and the `make install` contract
  that produces it. **Coordination note:** `openspec/changes/homebrew-tap-distribution` (unstarted,
  0/22 tasks) also declares `distribution` as a new capability; once this change lands, that one
  extends the capability rather than creating it. No edit is made to that change here.

### Modified Capabilities
- `module-system`: the **Library manifest** requirement gains an ordered location procedure (today
  it says only "default `./emit-libs.scm`, overridable") and, breaking, specifies that a manifest's
  `(source …)`/`(output …)` paths resolve against the manifest's own directory. The run-door
  manifest-location paragraph is corrected so `--manifest` outranks `EMIT_MANIFEST`.

## Impact

- **`src/emit.cpp`** — one shared manifest-resolution helper replacing the four duplicated
  `mp ? … : "emit-libs.scm"` sites; library and program paths joined against the manifest's
  directory before `read_file`/`ifstream`. The compiled-in `$PREFIX` needs a build-time define.
- **`src/compile.ss`** — `*manifest-path*` (`:362`) and `read-manifest` (`:368`) get the same
  lookup and the same relative-path rule, so the Chez driver and the Chez-free doors stay in
  parity. The door-parity guards (`test/self-emit-equiv.sh`, `test/prelude-base-run-tests.sh`)
  depend on this agreeing.
- **`Makefile`** — a new `install` target (no `PREFIX`/`DESTDIR` notion exists today).
- **Test fixtures (breaking)** — `test/modules/emit-libs*.scm` (4 manifests) plus the manifests
  written into `$TMP` by `test/emit-build-tests.sh`, `test/fixnum-overflow-tests.sh`,
  `test/dump-stages-tests.sh`, and `test/library-body-declarations-tests.sh` need their `(source …)`
  paths rewritten relative to their own location.
- **Docs** — `docs/MODULES.md` (the manifest section, resolution order, and the relative-path rule)
  and `README.md` (an `install` mention).
- **No change** to the compiler pipeline, emitted IR, committed bootstrap IR, or the module
  semantics themselves — nothing here alters a single byte of stdout, so
  `test/module-scaffold-baseline.sha256` is not re-recorded.
- **Unblocks** `homebrew-tap-distribution`; de-risks #33.
