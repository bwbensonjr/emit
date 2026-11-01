# Windows Port

Status: assessment, not scheduled. This file lists what a native Windows
port of Emit would take, found by surveying the source on 2026-10-31. It
feeds a future OpenSpec change and should be updated when that change
starts or when the code it cites moves. Line numbers are as of `a7218ba`.
[`DISTRIBUTION.md`](DISTRIBUTION.md) defers Windows to WSL for now.

## Summary

The compiler core is close to portable: the IR it emits names no target.
Nearly all the work is in the native host (`src/emit.cpp`), with a small
porting layer in the runtime (`src/runtime/runtime.c`) and a CI/release
job. None of it is a compiler-source edit, so none of it needs `make regen`
unless a code generator change turns up later.

| Layer | Size of work | Main items |
|---|---|---|
| Emitted IR | none expected | verify COFF accepts the quoted symbol names |
| Runtime | small | `%ld` printing, filesystem primitives, UTF-8 paths |
| AOT link (`emit build`) | moderate | `.exe` naming, linker choice, static libgc |
| Native host (JIT, `run`/`repl`) | largest | process spawning, JIT symbol resolution, `longjmp` across JIT frames, stack size |
| Build, test, release | wide but shallow | MSYS2 CI job, release zip |

## 1. Emitted IR

The bootstrap `.ll` files carry no `target triple` or `datalayout`. Generated
code uses `i64`, `fastcc`, `musttail`, and the `llvm.s*.with.overflow`
intrinsics, all of which LLVM supports on x86-64 and AArch64 Windows.

To verify: symbol names such as `@"scheme.base:code:cadr"` contain `:` and
`$`. They are quoted in the IR and COFF should accept them, but this has not
been tried through `lld-link` or MinGW `ld`.

## 2. Runtime (`src/runtime/runtime.c`)

### 2.1 Integer printing truncates on Windows (`%ld`)

The runtime turns integers into text by casting to `long` and printing with
`%ld`:

```c
case TAG_FIXNUM: sink_printf(out, "%ld", (long)UNFIX(v)); break;   /* runtime.c:3044 */
```

`UNFIX(v)` is a 64-bit integer. On macOS and Linux (LP64) `long` is 64 bits
and the cast is lossless. On 64-bit Windows (LLP64) `long` is 32 bits, so the
cast drops the high half before printing:

```scheme
(display 5000000000)   ; would print 705032704 on Windows (5000000000 mod 2^32)
```

Arithmetic stays correct; only the textual form is wrong, which makes the
defect easy to miss. Occurrences:

- `:3044`, the printer behind `display`, `write`, and REPL results.
- `:2455`, integers in error-object messages.
- About 15 `rt_fatalf` messages: index range (`:441`), negative size
  (`:455`), fixnum overflow (`:491`-`:572`), `integer->char` (`:1070`),
  `substring` bounds (`:1105`-`:1113`). Overflow messages are the worst case,
  since they report large values by definition.
- `#<hash-table N>` at `:3214`.

Fix: print through a type of the same width everywhere, for example
`"%" PRIdPTR` with `(intptr_t)` from `<inttypes.h>`, or `"%lld"` with
`(long long)`. About 20 one-line edits with no behavior change on current
platforms. This is not a bug on supported platforms today; it can land ahead
of the port as a cleanup or as the port's first task. `src/emit.cpp` uses
`long` in a few places too (for example the `(long)getpid()` temp suffixes)
and should get the same review.

### 2.2 Filesystem primitives

`rt_filesystem_directory_list`, `rt_filesystem_classify`, and
`rt_filesystem_replace_file` (`:1329`-`:1379`) use `dirent.h`,
`stat`/`lstat`, `S_ISLNK`, and `rename`. Windows equivalents:

- Directory listing: `FindFirstFileW` / `FindNextFileW`.
- Classification: `GetFileAttributesW`, with
  `FILE_ATTRIBUTE_REPARSE_POINT` standing in for `S_ISLNK`.
- Replace: `rename` does not overwrite an existing destination on Windows;
  use `MoveFileExW` with `MOVEFILE_REPLACE_EXISTING`. `replace-file` depends
  on the overwrite.

### 2.3 Paths and text

Scheme strings are UTF-8. Every path handed to the OS (`fopen` in
`rt_read_file` and the file ports, plus the primitives above) needs a UTF-8
to UTF-16 conversion and the `W` APIs, or the process must opt into the UTF-8
code page through its manifest. Command-line arguments (`rt_process_argv`,
`:883`) arrive in the ANSI code page unless taken from `GetCommandLineW` or
covered by the same manifest setting.

File ports should be opened in binary mode so the runtime, not the CRT,
decides about `\r\n`.

### 2.4 Unchanged

Boehm GC supports Windows. `getenv`, `exit`, and the math library port as is.

## 3. AOT link (`emit build`)

`emit build` starts the C compiler with
`$CC -O2 -flto ... runtime.c *.ll -lgc -o prog` (`src/emit.cpp:3811`-`:3850`).
On Windows it needs:

- An `.exe` suffix on the output, and in the atomic-replace logic around
  `:4006`-`:4020`. Replacing a running `.exe` fails on Windows, unlike Unix.
- A linker choice: `lld-link` with the MSVC CRT, or the MinGW toolchain.
- Static libgc, so delivered executables keep the standalone goal instead of
  depending on a `gc.dll` next to them.
- Toolchain discovery: `tools/llvm-env.sh` and the check at
  `src/emit.cpp:4461` know only `libgc.dylib`, `libgc.so`, and `libgc.a`, and
  only Homebrew/apt/Nix install locations.

## 4. Native host (`src/emit.cpp`)

This is where most of the work and the risk are.

### 4.1 Process spawning

`build` and `lib` start clang with `fork` / `execvp` / `waitpid` / `poll`
(`:3614`-`:3706`, `:3842`-`:3850`). Windows needs `CreateProcessW` and a wait.
`llvm::sys::ExecuteAndWait` (already linked) covers both platforms and would
remove the POSIX code on Unix too.

### 4.2 Temporary files and paths

- `mkdtemp("/tmp/emit-build.XXXXXX")` at `:4147`: use
  `llvm::sys::fs::createUniqueDirectory` under the system temp directory.
- `realpath` at `:545`, `:554`, `:1726`: use `llvm::sys::fs::real_path`.
- Executable location for finding the installed stdlib (`g_argv0` logic near
  `:545`): use `llvm::sys::fs::getMainExecutable`.
- `getpid`-suffixed temp names (`:1702`, `:4006`): use
  `llvm::sys::Process::getProcessId` or unique-file helpers.

### 4.3 JIT symbol resolution (biggest technical risk)

The host is linked with `-rdynamic` (`Makefile:163`) so that JIT'd code finds
the `rt_*` runtime functions through
`DynamicLibrarySearchGenerator::GetForCurrentProcess` (`:2819`, `:3469`,
`:3941`). A Windows `.exe` does not export its own symbols, so that search
would find no runtime functions. Options:

- Register the runtime entry points explicitly with ORC `absoluteSymbols`.
  Portable, removes the `-rdynamic` dependency on Unix as well, and makes the
  runtime surface the JIT sees explicit. More work: the list has to be
  generated or maintained.
- Export everything from the host (`/EXPORT`, or MinGW
  `--export-all-symbols`). Quicker, but platform-specific.

### 4.4 `longjmp` across JIT frames

`guard`/`raise` use `setjmp`/`longjmp` (`runtime.c:2764`-`:2772`), and the
host `setjmp`s before calling JIT'd code to catch traps. With the MSVC CRT,
`longjmp` unwinds using SEH, so every frame it crosses, including JIT'd
`fastcc`/`musttail` frames, needs registered unwind info. ORC can register it
on Windows, but this is the most likely source of hard-to-diagnose crashes.
MinGW's non-unwinding `longjmp` avoids the problem, which is a reason to
target MinGW first.

### 4.5 GC roots for JIT'd code

On Windows, Boehm finds static roots by scanning the data sections of loaded
modules. How JIT'd module globals are kept reachable on the current
platforms was not traced in this survey; confirm it holds on Windows before
trusting long REPL sessions.

### 4.6 Stack size

The Windows main-thread stack defaults to 1 MB, against 8 MB on Linux and
macOS. Deep non-tail recursion in user programs, and possibly the
self-compile, may overflow. Set it at link time (`/STACK:` or
`-Wl,--stack,`) for both the host and `emit build` output, or run the
compiler on a thread with a larger stack.

### 4.7 Interrupts

The host includes `<signal.h>`. Any `SIGINT` handling in the REPL maps to
`SetConsoleCtrlHandler` on Windows.

## 5. Build, test, and release

- The `Makefile`, most of `tools/`, `run-all-tests.sh`, and `tools/test.sh`
  are bash. Under MSYS2 they run unchanged; porting them to PowerShell is not
  worth it.
- LLVM 22+ development packages with ORC headers and `llvm-config` are easy
  to get from MSYS2 (`mingw-w64-clang-x86_64-llvm`, `-gc`). The official
  LLVM Windows installer ships neither `llvm-config` nor the development
  libraries, so a native MSVC build would mean building LLVM in CI.
- CI: add a `windows-latest` job using MSYS2 CLANG64 to `compatibility.yml`,
  then to `release.yml`.
- The test suite likely assumes `/` paths, LF line endings, and POSIX
  utilities; expect a round of fixes when the job first runs.
- Release artifact: a zip with `emit.exe` and the stdlib. winget or Scoop
  later. Code signing raises the same defer question as macOS notarization
  in `DISTRIBUTION.md`.

## Suggested order

1. **Target MSYS2 CLANG64 first** (clang, libc++, UCRT; LLVM and Boehm from
   pacman). It keeps bash, `make`, and pkg-config working and sidesteps the
   SEH `longjmp` issue.
2. **Runtime and AOT first.** Port section 2 and section 3 to get standalone
   `.exe`s, the project's primary deliverable, without touching the JIT. An
   early smoke test is possible from macOS by cross-compiling `runtime.c`
   and the IR for `x86_64-w64-mingw32`.
3. **Native host.** Replace POSIX process and filesystem calls with
   `llvm::sys`, which also simplifies the Unix code, then do JIT symbol
   registration and stack size. This makes `emit run` and `emit repl` work.
4. **CI and release.** Windows job in `compatibility.yml`, then a zip in the
   release workflow.
5. **Optional, later:** a native MSVC build without MSYS2.

Rough effort: steps 1-2 are a focused change of a few days. Step 3 is one to
two weeks, mostly JIT and `longjmp` debugging. Step 4 depends on how many
POSIX assumptions the tests make. A natural split is two OpenSpec changes:
"runtime and AOT on MinGW" and "host and JIT".
