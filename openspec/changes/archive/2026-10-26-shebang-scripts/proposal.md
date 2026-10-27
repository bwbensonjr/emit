# Proposal

## Why

A Scheme program cannot run as an executable script (issue #166). With `#!/usr/bin/env -S emit run`
the reader rejects the first line (`unrecognized syntax #!/usr/bin/env`). Any argument the script is
invoked with also becomes a second source file, because `emit run` treats program arguments as
program arguments only after a mandatory `--`. A shebang cannot put that `--` after the script path.
Running a program as a script is the lightest way to ship a small tool, and dev-to-ship fidelity
requires that the script see exactly the command line its `emit build` executable sees.

## What Changes

- A program source compiled by `emit run` or `emit build` may begin with an interpreter line: a first
  line starting with `#!/` or `#! `. The line is ignored as if it were a comment. Reader directives
  (`#!fold-case`, `#!no-fold-case`) keep their meaning, even on the first line, and `#!` elsewhere in
  a source is unchanged.
- **BREAKING**: The `emit run` grammar becomes `emit run [OPTIONS] [FILE [ARG ...]]`. Option parsing
  stops at the first positional FILE; every later token, including `--` and dash-prefixed tokens, is
  forwarded to the program unchanged. Before FILE, `--` still ends option parsing, so the token after
  it is FILE even if it begins with `-`.
  - `emit run f.scm -- a` now gives the program `("f.scm" "--" "a")` where it used to give
    `("f.scm" "a")`. Write `emit run f.scm a` instead.
  - `emit run -- a` (stdin source with arguments) now names `a` as the source file. Write
    `emit run - a` instead.
  - Emit options written after FILE are forwarded to the program instead of being parsed.
    `emit run app.scm --manifest m` worked before and now passes `--manifest m` to the program,
    which usually shows up as an `unresolved import` error. Write `emit run --manifest m app.scm`.
  - A second positional file is no longer a usage error; it is a program argument.
  - An unknown option after FILE is no longer rejected; it is forwarded.
- Non-executing modes (`--emit`, `--resolve-program`) still reject program arguments.
- `#!/usr/bin/env -S emit run` then runs a script with arguments, giving the same `(command-line)` as
  the program built with `emit build`.
- Minor version bump (0.3.0 to 0.4.0) under the pre-1.0 policy, with a `CHANGELOG.md` entry that
  states the migration.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `emit-cli`: the `emit run` grammar requirement changes from a mandatory separator to "options
  before FILE, program arguments after it"; a new requirement admits an interpreter line at the start
  of a program source for `emit run` and `emit build`.
- `process-context`: the command-line requirement's description of the `emit run` path changes from
  "the arguments following `--`" to "the tokens following FILE".

## Impact

- `src/emit.cpp`: the `emit run` argument loop and `usage_run`, and the shared program-compile path
  (`compile_program`) used by `emit run`, `emit run --emit`, and `emit build`. This is host C++ only;
  no compiler input changes, so no `make regen`.
- `test/pitch-prerequisites-tests.sh` (argument forwarding, rejection cases, help text) and
  `test/emit-cli-tests.sh` (new script-header and shebang cases).
- In-repo callers that put Emit options (or `--`) after FILE: `docs/MODULES.md` and the test
  scripts `emit-cli`, `explicit-artifact`, `filesystem-access`, `hybrid-library-resolution`,
  `library-composition`, `pitch-prerequisites`, `project-command`, `reader-datum-parity`,
  `srfi-artifact`, and `srfi-upstream`.
- `docs/PROJECTS.md` (the "mandatory separator" paragraph), plus a short note on writing a script.
- `VERSION`, `CHANGELOG.md`.
- Callers outside this repo change behavior. `emit run FILE -- ARG` changes without an error; an
  Emit option after FILE usually fails loudly. The changelog entry is how they find out.
