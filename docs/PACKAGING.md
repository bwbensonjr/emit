# Packaging Emit

This note is for downstream maintainers who package an Emit release, such as a
distribution package, a ports tree, or a container base. The project's own
Homebrew, Nix, and OCI recipes ([Installation](INSTALLATION.md#distribution-channels))
follow these same steps.

## Inputs

Start from a release source archive, `emit-X.Y.Z.tar.gz`, and its `SHA256SUMS`
([Source release preparation](RELEASE-PIPELINE.md)). Verify the checksum, and
do not substitute a Git checkout or another archive. The archive contains
committed bootstrap IR, so the build needs no Chez, no Git metadata, and no
network access. Declare these dependencies:

| Purpose | Dependency |
| --- | --- |
| build and run (`emit` links it dynamically) | LLVM 22 shared library, headers, and `llvm-config` |
| build the host binary | clang/clang++ from the same LLVM, a C++ standard library |
| run (`emit` links it dynamically) and AOT links | Boehm GC (`libgc`) library and headers |
| `emit build` at run time | that LLVM's clang, a C linker that can link `-flto` output (lld, or GNU ld with the LLVMgold plugin), libc development files |
| build | GNU make, bash, POSIX utilities |

LLVM 22 and 23 are maintained ([Toolchain CI](TOOLCHAIN.md)). Pick one major,
and use the same one for the library, the headers, and clang.

## Build and stage offline

Pass every toolchain input explicitly. Use the paths your package manager keeps
stable (for example an `opt/` link, or the versioned `/usr/lib/llvm-22`), never
a version-specific cellar or build directory:

```sh
sha256sum -c SHA256SUMS          # macOS: shasum -a 256 -c SHA256SUMS
tar -xzf emit-X.Y.Z.tar.gz && cd emit-X.Y.Z
set -- LLVM_CONFIG=/usr/lib/llvm-22/bin/llvm-config EMIT_LLVM_BIN=/usr/lib/llvm-22/bin \
       GC_INC=/usr/include GC_LIB=/usr/lib/x86_64-linux-gnu
make "$@" PREFIX=/usr
make install "$@" PREFIX=/usr DESTDIR="$PWD/stage" TOOLCHAIN_PIN=1
```

`PREFIX` is the installed location that is compiled into `emit` as its
fallback. `DESTDIR` only stages that tree for your package. `TOOLCHAIN_PIN=1`
records these inputs in `share/emit/package/toolchain.env`, so that `emit build`
uses the declared clang and libgc rather than whatever is first on a user's
`PATH`. Explicit environment overrides still win
([Installation](INSTALLATION.md#package-toolchain-pin)). The installed payload is
`bin/emit` and `share/emit` (libraries, the manifest, AOT support files, and the
pin). Add the release's `LICENSE` and
`vendor/unicode/17.0.0/LICENSE.txt` (Unicode data behind
`lib/scheme/char-data.scm`) to your package's license notices.

A staged install defers the shared library cache
([Installation](INSTALLATION.md#the-shared-library-cache)). Its entries record the binary's
digest and the libraries' installed paths, so prepare it where the payload finally lives:
with `emit build --stdlib --shared` in your package's post-install step, or in the build step
if that already runs at the final path, as Homebrew's and Nix's do. Run it after any step that
rewrites `bin/emit`, such as stripping. Remove `share/emit/library-cache` on uninstall.
Without the cache the package still works; each user compiles the standard libraries once.

## Check the staged package (no network, no Chez)

```sh
tools/ci-installed-smoke.sh "$PWD/stage/usr"
```

This first prepares the shared library cache in the staged prefix, which a
`DESTDIR` install defers. It then runs `tools/channel-accept.sh` against the staged
command, with private caches and the payload made read-only. It checks the
version, doctor, the shared cache, JIT `run`,
a persistent REPL session, shipped SRFIs and libraries, a macro-exporting
library through `emit lib`, and AOT executables. It also verifies that nothing
was written into the payload. The `dev` and `full` native profiles
(`bash tools/test.sh dev`, `bash tools/test.sh full`) also run without Chez. To
prove that your build environment has no network, wrap any of these with
`tools/offline-run.sh` (Linux needs passwordless sudo and namespaces; macOS uses
`sandbox-exec`):

```sh
tools/offline-run.sh --hide "$HOME/src/emit-checkout" -- tools/ci-installed-smoke.sh "$PWD/stage/usr"
```

## Optional independent verification (needs Chez)

The source checks and the independent-host checks re-derive the compiler with
Chez Scheme. They are for maintainers who want that proof, and they are not
needed to package or run Emit:

```sh
bash tools/test.sh units        # direct source units under Chez
bash tools/test.sh reference    # complete independent-host verification
```

Both commands fail when `chez` is missing. They do not skip. A run that did not
happen is not a pass, so do not report one as passed.
