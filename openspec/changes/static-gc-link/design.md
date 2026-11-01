# Design

## Context

`emit build` emits each unit's IR to a temporary directory and then forks clang through
`link_clang` (`src/emit.cpp`). The link line is fixed:

```
clang -Wno-override-module -O2 -flto -I$GC_INC -L$GC_LIB runtime.c unit.*.ll -lgc -lm -o OUT
```

`GC_INC` and `GC_LIB` come from `discover_toolchain`, in the precedence the `toolchain-discovery`
spec defines: explicit overrides, then `tools/llvm-env.sh` discovery (`pkg-config bdw-gc` and prefix
fallbacks), then the compiled-in build-time defaults. With `-lgc`, both ld64 and GNU ld prefer the
shared library when `libgc.dylib`/`libgc.so` and `libgc.a` sit side by side, which they do for
Homebrew `bdw-gc` and Debian/Ubuntu `libgc-dev`.

A probe on this machine (Homebrew `bdw-gc`, macOS arm64) linked a minimal `GC_INIT`/`GC_MALLOC`
program both ways:

| link | size | `otool -L` |
|---|---|---|
| `-L$GC_LIB -lgc` | 33,520 B | `libgc.1.dylib`, `libSystem` |
| `$GC_LIB/libgc.a` | 178,976 B | `libSystem` only |

The same probe showed that `-Wl,-Bstatic` is rejected by ld64 (`unknown options: -Bstatic`).

The runtime (`src/runtime/runtime.c`) includes `<gc/gc.h>` and calls `GC_INIT()`; it does not define
`GC_THREADS` or register threads, so nothing in it depends on the shared build of libgc.

This is native host C++ only. No compiler source, prelude, partition, or bootstrap IR changes, so
the change needs no `make regen`.

## Goals / Non-Goals

**Goals:**

- One link-line difference between the two modes: the archive path in place of `-lgc`, plus any
  platform libraries the archive needs.
- Fail early and by name when the archive is missing, before any clang invocation.
- Keep every existing build byte-for-byte unchanged when the option is absent.

**Non-Goals:**

- A new discovery layer, environment variable, or `tools/llvm-env.sh` change.
- Making static linking the default. That is a later decision, once channel toolchains are known to
  ship the archive.
- A manifest `(program …)` clause. The manifest grammar is parsed by the embedded compiler (mode 10),
  so a clause would be a compiler-source edit behind the `make regen` barrier; it can follow as its
  own change.

## Decisions

### D1. Link the archive by explicit path, not by `-lgc` with linker mode flags

`--static-gc` replaces `-L$GC_LIB … -lgc` with the archive's absolute path, `$GC_LIB/libgc.a`, as a
link input.

Alternatives considered:

- `-Wl,-Bstatic -lgc -Wl,-Bdynamic`: GNU ld only; ld64 rejects it, as measured above.
- `-static`: asks for a fully static executable, which macOS does not support and which would also
  pull in a static libc on Linux. Out of scope.
- `-Wl,-search_paths_first`: ld64 only, and it still picks the dylib when both are in the same
  directory.

An explicit path behaves the same on both linkers and leaves no doubt about which file was used,
which is also what the narration reports.

### D2. The archive lives in the resolved `GC_LIB`; no new override

The archive path is derived from the `GC_LIB` that discovery already resolves, so it inherits every
override, discovery, and compiled-in default layer at no cost. A user whose libgc install has no
archive points `GC_LIB` (or `EMIT_GC_LIB`) at one that does. A separate `GC_ARCHIVE` variable was
considered and rejected: it would let headers and archive come from different libgc installs, which
is a version-skew hazard the single directory avoids.

### D3. Option name `--static-gc`

`--static-gc` says exactly which library becomes static. `--static` was rejected because it implies
a fully static executable (see D1). A valued `--gc static|shared` form was rejected as surface
without a second use: shared is already the default, and `-q`/`-v`-style boolean flags are what
`emit build` already uses.

### D4. Check before linking; never fall back

After `discover_toolchain` succeeds, `emit_build` checks that `$GC_LIB/libgc.a` is a readable regular
file. If it is not, it prints the diagnostic the spec requires and returns non-zero before calling
`link_clang`, so no executable and no partial output appear. A silent fallback to the shared link
was rejected: the user asked for a binary with no libgc dependency, and handing back one that has it
is exactly the failure the option exists to prevent.

### D5. Platform libraries after the archive

A static archive does not carry its own dependencies the way a shared library does. libgc is built
threaded by both Homebrew and Debian, so on Linux `-lpthread` follows the archive (harmless on
glibc 2.34 and later, where it is part of libc). macOS needs nothing extra; `libSystem` supplies
pthreads. `pkg-config --static --libs bdw-gc` was considered as the source of these flags but
rejected: the `emit` binary does not run pkg-config when it links, and the compiled-in defaults
layer would have no equivalent.

### D6. Narration and doctor

The `build …` announcement already goes to stderr at default verbosity; the link step adds one line
naming the mode and, when static, the archive path. Verbose output can include the full link line.
`emit doctor` gains one informational line, `libgc static archive: PATH [available|unavailable]`,
next to the existing libgc lines, and does not count an unavailable archive as a failed check. The
existing link-library check already accepts `libgc.a` as a link library; that is unchanged.

### D7. Testing and CI

The project-command tests gain a `--static-gc` case that builds a small program, asserts the
binary's dependency list (`otool -L` on Darwin, `ldd` or `readelf -d` on Linux) names no libgc,
and compares its output with the default build. When the resolved `GC_LIB` has no `libgc.a`, the
case prints a skip naming the missing path rather than passing silently. A second case asserts the
missing-archive diagnostic by pointing `GC_LIB` at a directory with only the shared library.

CI's private toolchain (`tools/ci-provision.sh`) builds libgc with `-DBUILD_SHARED_LIBS=ON` only, so
it has no archive. To exercise the feature in CI, provisioning adds a second libgc configure and
install with `-DBUILD_SHARED_LIBS=OFF` into the same prefix, which installs `libgc.a` beside the
shared library. That changes the provisioned toolchain, so the recipe identifier that keys the
toolchain cache is bumped in the same change.

## Risks / Trade-offs

- [Each static executable grows: about 145 KB for a bare C probe, 76-93 KB for Emit programs
  measured on macOS arm64, since LTO drops unreached libgc code] → The option is opt-in, and the
  narration reports the delivered size, so the cost stays visible.
- [Some libgc distributions ship no archive (nixpkgs `boehmgc` by default)] → The early diagnostic
  names the path and the fix; doctor reports availability ahead of time.
- [`-flto` with a native archive] → The archive contains ordinary object code; LTO applies to the
  IR inputs and the archive's objects join the final native link. The CI case covers it on both
  platforms.
- [A distribution's `libgc.a` may need further libraries on Linux (for example `libatomic_ops` or
  `-ldl`)] → The Linux test fails with an undefined-symbol error naming them; the fix is another
  link flag in D5's list, with no change to the specs or approach.
- [License] → libgc's MIT-style license permits static linking without imposing terms on the
  executable; the docs mention that the license notice travels with redistributed binaries.

## Migration Plan

None required: the option is new and the default is unchanged. Rolling back means removing the
option; executables already built keep working because they no longer depend on libgc.

## Open Questions

- Which extra Linux libraries, if any, Debian/Ubuntu `libgc.a` needs beyond `-lpthread`. Answered by
  the first Linux CI run of the new test case; affects only the D5 flag list.
