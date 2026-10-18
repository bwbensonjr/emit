# Installation

Emit source builds use the committed `bootstrap/*.ll`; Chez is not needed for
the normal build. The native build requires LLVM 19 or newer, libgc, and a C/C++
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

Use `emit doctor` to inspect the executable, effective library providers, and
required support files after installation. It can report dependencies after
the operating system has loaded Emit; it cannot diagnose a missing dynamic
library that prevents the process from starting.
