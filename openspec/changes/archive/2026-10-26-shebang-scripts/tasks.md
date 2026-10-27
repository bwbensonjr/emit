# Tasks

## 1. emit run argument grammar

- [x] 1.1 In `emit_run` (`src/emit.cpp`), stop option parsing at the first positional FILE (or `-`) and append every later `argv` entry, including `--`, to `program_args` unchanged; make `--` before FILE end option parsing so the next token is FILE (design D3). Remove the `multiple source files` error. Verify `make` builds `build/emit` and `build/emit run f.scm -- -x` prints `("f.scm" "--" "-x")` for a program that writes `(command-line)`
- [x] 1.2 Keep the `--emit` / `--resolve-program` conflict error for any program argument, and confirm `--resolve-program [NAME]` still consumes its optional NAME. Verify `build/emit run --emit f.scm value` exits non-zero with empty stdout and a `require execution` message
- [x] 1.3 Update `usage_run` to `emit run [options] [FILE [ARG ...]]`, stating that options go before FILE and every token after FILE goes to the program. Verify `build/emit run --help` shows the new synopsis on stdout with nothing on stderr
- [x] 1.4 Update `test/pitch-prerequisites-tests.sh`: change the stdin forwarding case to `emit run - --check ''`, change the `--emit` conflict case to `--emit FILE value`, replace the "multiple source files are rejected" check with a check that a second positional token reaches the program as an argument, add a `FILE -- -x` verbatim-forwarding check, and match the new help grammar. Verify `bash tools/test.sh --suite pitch-facing-r7rs-prerequisites` passes
- [x] 1.5 Rewrite the "mandatory separator" paragraph in `docs/PROJECTS.md` for the new grammar (`emit run formatter.scm --check input.scm`, `emit run - ARG` for stdin), and verify each command shown there runs as written with `build/emit`
- [x] 1.6 Move Emit options that follow FILE to before it in every in-repo caller (`test/library-composition-tests.sh`, `test/pitch-prerequisites-tests.sh`, `docs/MODULES.md`, `test/toplevel-order-tests.sh` if affected, and any others found by `grep` and by the suites). Verify `bash tools/test.sh --suite` passes for each touched suite

## 2. Interpreter line in program sources

- [x] 2.1 In `compile_program` (`src/emit.cpp`), when the source begins with `#!/` or `#! `, drop the first line's characters and keep its newline before `seed_session` and `compile_unit` see the text (design D1, D2). Verify a source starting with `#!/usr/bin/env -S emit run` runs under `build/emit run FILE` and under `build/emit run -` on stdin
- [x] 2.2 Add cases to `test/emit-cli-tests.sh`:
  - an executable `#!/usr/bin/env -S emit run` script, invoked through `PATH` pointing at `build/`, prints `("./tool.scm" "--check" "a.scm")`
  - the same source built with `build/emit build` and invoked with `-- -x` receives the same argument tail as the script
  - a `#! /usr/bin/env` (space) header is accepted
  - a leading `#!fold-case` line still folds `ABC` to `abc`
  - a `#!/usr/bin/env` line that is not the first line is still a read error
  - `build/emit run --emit` output is byte-identical with and without the interpreter line

  Verify `bash tools/test.sh --suite cli-interface-help-final-value` passes
- [x] 2.3 Add a short "Running a program as a script" section to `docs/PROJECTS.md` showing the `#!/usr/bin/env -S emit run` line, `chmod +x`, and a note that `env -S` needs macOS or GNU coreutils 8.30 or later. Verify the documented example runs as written

## 3. Release bookkeeping and integration

- [x] 3.1 Bump `VERSION` to `0.4.0` and add a `## 0.4.0` section to `CHANGELOG.md` that leads with the incompatible `emit run` grammar change and its migration (`emit run f.scm a`, `emit run - a`, and Emit options such as `--manifest` before FILE), then the shebang support, citing `Fixes #166`. Verify the section is nonempty and matches `VERSION`
- [x] 3.2 Run `make format-check` on any touched Scheme files (expected: none) and the classified native checks for a host change, `bash tools/test.sh dev --changed main`, inspecting the plan to confirm both suites above are selected. Verify the run reports no new failures beyond the known red suites recorded for issue #117

## Workflow follow-up

- Open the pull request with `Fixes #166` in the body; merging it to `main` releases 0.4.0.
- Sync the delta specs and archive the change after merge (archive with `--skip-specs` if the specs were synced by hand), then run `openspec validate --all` on the main specs.
