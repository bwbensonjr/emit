## Why

The four capabilities — compile-a-library, build-a-program, run-a-program, and the
REPL — are today four separate entry points: `build/scheme-run`, `build/repl-host`,
`bin/scheme-compile`, and (from slice #2) the `bin/emit build` wrapper. D7 of
modules-v0-design always intended these to converge on a single `emit` binary
(`emit lib` / `emit build` / `emit run` / `emit repl`) once the module surface was
proven — which slices #2 and #3 have now done. This is slice #1 of
`openspec/explorations/packaging-and-emit-cli.md`: the unified front-end.

Slice #2 deliberately introduced `emit` additively, deferring the CLI-naming /
back-compat decision to this slice. That decision is now made: **rename now** — a
single `emit` binary becomes the sole user-facing entry point, and the old separate
binaries are removed (this is a pre-1.0, self-hosting compiler with no external
consumers to keep compatible).

## What Changes

- **A single compiled `emit` binary** (`build/emit`) with C++ verb dispatch over four
  verbs. The run door (`src/run.cpp`) and the REPL door (`src/repl/host.cpp`) are
  merged into one binary — they already link the *same* embedded compiler IR
  (`embed-repl.ll` + `scheme.base.ll`), differing only in their `main`.
  - `emit run [FILE] [--manifest F] [--no-prelude]` — run a program in-process
    (Chez-free), from a file or stdin. Was `build/scheme-run`.
  - `emit repl [--manifest F]` — the interactive REPL. Was `build/repl-host`.
  - `emit build [NAME] [--manifest F] [-o OUT]` — deliver a standalone executable
    from a manifest program entry. Was `bin/emit build` / `bin/scheme-compile`; the
    binary now emits the IR in-process and invokes `clang` to link.
  - `emit lib SRC [-o DIR] [--manifest F]` — **NEW**: the compile-unit door. Compile
    one `define-library` source to its artifact (`<name>.ll` + `<name>.exports`),
    Chez-free. Needs a new embedded-compiler mode to emit the export table.
- **`--emit` / `--resolve-program`** stay available (as `emit run --emit`, used by the
  build pipeline and the self-hosting regen).
- **BREAKING (internal): the old binaries and wrappers are removed** — `build/scheme-run`,
  `build/repl-host`, `bin/scheme-compile`, and the `bin/emit` bash wrapper. All
  callers migrate to `emit <verb>`: the `Makefile`, `tools/regen.sh`, `tools/log.sh`,
  every `test/*.sh`, the `demos/`, and the docs.
- **`schemec` is out of scope** — it is the batch text→IR *bootstrap seed* filter, not
  one of the four user-facing doors; it stays as an internal bootstrap tool.

## Capabilities

### New Capabilities
- `emit-cli`: The unified `emit` command — a single binary that dispatches the
  `lib` / `build` / `run` / `repl` verbs to one shared compiler core, as the sole
  user-facing entry point. Includes the new **compile-unit door** (`emit lib`).

### Modified Capabilities
- `project-build`: `emit build` becomes a verb of the unified `emit` binary (compiled,
  forking `clang`), rather than a standalone `bin/emit` bash wrapper delegating to
  `bin/scheme-compile`. Observable build behavior is unchanged.
- `interactive-repl`: the REPL is invoked as `emit repl` (was `build/repl-host`); the
  persistent-host behavior is unchanged.
- `module-system`: the run door is invoked as `emit run` and the AOT/compile-unit
  artifacts are produced via `emit build` / `emit lib` (was `scheme-run` /
  `bin/scheme-compile`); door semantics are unchanged.

## Impact

- **Code**: merge `src/run.cpp` + `src/repl/host.cpp` into one `emit` front-end (verb
  dispatch); implement `emit build`/`emit lib` clang-linking in the binary; add an
  embedded-compiler mode (`src/repl-core.ss`) to emit a library's export table for
  `emit lib`; regenerate committed IR (`make regen`).
- **Build/bootstrap**: `Makefile` builds `build/emit` (drops the `scheme-run` /
  `repl-host` / `bin/scheme-compile` targets); `tools/regen.sh` and `tools/log.sh`
  use `emit run --emit`. The self-hosting fixed point runs through `emit`.
- **Tests/demos/docs**: migrate every reference to `emit <verb>` (`run-all-tests.sh`,
  `run-dev-tests.sh`, `test/*.sh`, `demos/*.sh`, `README.md`, `docs/*.md`,
  `src/README.md`, `src/TOOLCHAIN.md`).
- **Removed**: `bin/scheme-compile`, `bin/emit` (bash), and the `build/scheme-run` /
  `build/repl-host` outputs. No external-facing compatibility shims (pre-1.0).
