# Installation

Emit source builds use the committed `bootstrap/*.ll`; Chez is not needed for
the normal build. The tested native build floor is LLVM 22, with LLVM 22 and 23
maintained on Linux and macOS. Newer majors remain discoverable; older majors warn
and continue without maintained CI coverage (`EMIT_LLVM_MIN` overrides that warning
floor). The build also requires libgc and a C/C++
toolchain. Run `make`, then install with `make install`. `PREFIX` selects the
logical install prefix and `DESTDIR` stages that prefix for packaging:

```sh
make
make install PREFIX=/usr/local
make install PREFIX=/usr/local DESTDIR="$PWD/stage"
```

The install places the command at `bin/emit` and the library manifest, shipped
libraries, and AOT support files under `share/emit`. A complete prefix can be
moved after installation. Emit resolves its real executable path (including
when started through a symlink), checks for `../share/emit` beside that binary,
and then uses the compiled-in `PREFIX` as a fallback. The fallback supports a
detached executable when no executable-relative payload is present. Project
manifests and library directories retain precedence over installed providers.

For example, this installs a private prefix and then invokes it from an
unrelated working directory through a launcher symlink:

```sh
make install PREFIX="$PWD/stage/emit"
mv "$PWD/stage/emit" "$PWD/emit"
mkdir -p "$PWD/bin" "$PWD/work"
ln -s "$PWD/emit/bin/emit" "$PWD/bin/emit"
cd "$PWD/work"
"$PWD/../bin/emit" run program.scm
```

The payload relocation does not bundle system dependencies. The `emit`
executable dynamically links LLVM and libgc, so those libraries must remain
available to the operating system's loader. `emit build` also invokes clang on
textual LLVM IR and uses the installed runtime source and C linker; clang must
be compatible with the LLVM version used to build Emit. Moving only the
executable without its `share/emit` payload uses the compiled-prefix fallback
for data and support files.

## Package toolchain pin

`emit build` finds its C toolchain when it runs, through the installed
`tools/llvm-env.sh`. A source install therefore follows the user's LLVM upgrades,
and when no override is set it uses whatever `clang` is first on `PATH`. A package
that declared one LLVM major needs a fixed answer instead. `make install
TOOLCHAIN_PIN=1` records the toolchain the build used in
`share/emit/package/toolchain.env`:

```sh
make install PREFIX=/usr/local DESTDIR="$PWD/stage" TOOLCHAIN_PIN=1 \
  EMIT_LLVM_BIN=/opt/llvm-22/bin GC_INC=/opt/gc/include GC_LIB=/opt/gc/lib
```

The file records `EMIT_LLVM_MAJOR` (the LLVM that `emit` was linked against),
`EMIT_LLVM_BIN`, `CC`, `GC_INC`, `GC_LIB`, and `GC_DYLIB`. Values are written
exactly as the build received them and are never resolved, so pass stable paths
such as a Homebrew `opt/` directory or a Nix store path. `CC` defaults to the LLVM
directory's `clang`. An explicit `CC` must be absolute, because a bare `clang`
would pin nothing. `DESTDIR` never appears in the values.

`llvm-env.sh` parses the file (it never sources it). The precedence is:

1. Explicit environment overrides win. With `EMIT_LLVM_BIN` or `LLVM_CONFIG`
   set, the pin's LLVM directory and `CC` are ignored, and an explicit `CC`
   replaces the pinned one.
2. The pin applies next. Its libgc values apply one at a time, wherever the
   matching `GC_*` override is unset.
3. Discovery runs only when there is no pin.

A pin whose `CC` is not executable, or whose clang reports a different major
from `EMIT_LLVM_MAJOR`, fails with a message naming the file. It never falls back
to discovery, because that would link with a toolchain the package did not
declare. A checkout has no `package/` directory, so source builds never read a
pin. `emit doctor` reports the selection as `toolchain: package` along with the
pin's path.

Use `emit doctor` to inspect the executable, effective library providers, and
required support files after installation. It can report dependencies after
the operating system has loaded Emit; it cannot diagnose a missing dynamic
library that prevents the process from starting.

## Distribution channels

Three channels install a released Emit together with its declared toolchain.
Each one builds or packages the exact source archive of one Emit release; none
follows a branch. `emit --version` names the release and the LLVM that Emit was
built against. `emit doctor` should report `toolchain: package`, meaning the
installed toolchain pin selects the AOT compiler.

| Channel | Platform | Dependency model |
| --- | --- | --- |
| Homebrew tap `bwbensonjr/emit` | macOS on Apple Silicon | built from source; `llvm@22` and `bdw-gc` formulae |
| Nix flake `github:bwbensonjr/emit` | `aarch64-darwin`, `x86_64-linux` | locked nixpkgs; LLVM 22 and Boehm GC in the runtime closure |
| OCI image `ghcr.io/bwbensonjr/emit` | `linux/amd64` | Ubuntu 26.04 with LLVM 22 and libgc, pinned by digest and package version |

These are the platforms the [channel workflow](RELEASE-PIPELINE.md#distribution-channels)
tests; other platforms build from source as described above. Every channel
links `emit` dynamically against LLVM and libgc. `emit build` needs that
package's clang, headers, and linker, which each channel supplies. A delivered
executable links libgc dynamically, so it runs where libgc is available. None of
these channels produces standalone static executables. For what the language
does not support yet, see the [README](../README.md#not-yet-done).

### Homebrew

```sh
brew install bwbensonjr/emit/emit
emit --version          # emit X.Y.Z (LLVM 22.1.x)
emit doctor             # toolchain: package [LLVM selection]
```

The formula builds Emit from source against the `llvm@22` keg. It works even
though Homebrew keeps that keg off `PATH`, and it ignores any other clang
(Apple's, or a newer `llvm`). Upgrade with `brew upgrade bwbensonjr/emit/emit`.
Remove with `brew uninstall emit && brew untap bwbensonjr/emit`, then optionally
`rm -rf ~/Library/Caches/emit` for compiled library caches.

If `emit build` reports that the toolchain pin expects LLVM 22 but finds
another major, run `brew reinstall bwbensonjr/emit/emit`. An explicit
`EMIT_LLVM_BIN` or `CC` overrides the pin for one invocation.

### Nix

```sh
nix run github:bwbensonjr/emit -- --version
nix profile install github:bwbensonjr/emit
emit doctor
```

`packages.default` is the release named by `packaging/release.json`, fetched by
its SHA-256. Upgrade with `nix profile upgrade emit`, and remove with
`nix profile remove emit`. The installed command finds its sources, libraries,
and compiler through its own closure. It needs no development shell, and it
needs nothing else on `PATH`.

For working on Emit itself, `nix develop github:bwbensonjr/emit` provides the
native build tools (LLVM 22, libgc, make, Python) without Chez.
`nix develop github:bwbensonjr/emit#verify` adds Chez for `bash tools/test.sh
units` and the reference checks. Entering either shell never regenerates
`bootstrap/`.

### OCI image

```sh
docker run --rm ghcr.io/bwbensonjr/emit:X.Y.Z --version
docker run --rm -it --user "$(id -u):$(id -g)" -v "$PWD:/work" ghcr.io/bwbensonjr/emit:X.Y.Z repl
docker run --rm --user "$(id -u):$(id -g)" -v "$PWD:/work" -v emit-cache:/cache \
  ghcr.io/bwbensonjr/emit:X.Y.Z build app.scm -o app
```

The entrypoint is `emit`, so arguments and the exit status pass through
unchanged. The working directory is `/work`, and compiled library caches go to
`/cache`. Both directories are writable by any user ID, and the installed
payload under `/opt/emit` is read-only. The image works without network access
and contains no Chez, Git, or source tree.

An executable built in the container is a `linux/amd64` program linked against
the image's libgc. Run it in the image, or on a system with a compatible libgc.
Version tags never move. `latest` follows the most recent promoted release and
may be rolled back to an earlier tested digest.
