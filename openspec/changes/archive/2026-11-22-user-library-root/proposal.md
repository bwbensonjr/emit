# Proposal

## Why

Since Malt moved to `bwbensonjr/emit-packages` (0.11.0), an installed package resolves only
through a root the user configures, in practice `EMIT_LIBRARY_PATH`. That variable reaches
only processes started from a shell that exported it, and it ranks above a project's own
`lib/`, so a globally exported collection silently shadows a project's vendored copy. The
exploration `openspec/explorations/emit-packages-registry.md` (Decision 2) chose a default
user-level library root to fix both; this change implements it.

## What Changes

- Add a **user library root** at `$XDG_DATA_HOME/emit/lib`, or `$HOME/.local/share/emit/lib`
  when `XDG_DATA_HOME` is unset, empty, or relative. The same location applies on macOS and
  Linux. Emit only reads it and never creates it.
- Insert it into the order of library providers **after the project conventional root and
  before the installed manifest and root pairs**: project, then user, then installed Emit.
  `EMIT_LIBRARY_PATH` keeps its current position and its role as an ad hoc override.
- Bring it under `--no-library-paths`, so CI and exact-manifest runs can still opt out of
  every directory root with the existing switch.
- Resolve it identically in the native host (`emit run`, `emit repl`, `emit build`,
  `emit lib`, `emit doctor`) and in the Chez source driver (`src/compile.ss`).
- Report it in `emit doctor` as its own provider row, labelled `user`, with the rule that
  located it and its availability. A missing user root is informational, not a failure.
- Narrate it like every other directory root: it appears in the REPL startup summary and on
  each resolution it answers.
- Document it in verb help, `docs/MODULES.md`, `docs/DOCTOR.md`, `docs/PROJECTS.md`,
  `docs/DISTRIBUTION.md`, and `README.md`, and replace the `EMIT_LIBRARY_PATH` migration
  note for the package collection with "clone or link its `lib/` to the user root".
- Take a minor version bump (new feature), with a `CHANGELOG.md` section.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `module-system`: adds two requirements. One places the user library root between the
  project conventional root and the installed pairs, and the other fixes how its location
  is derived.
- `emit-cli`: adds two requirements. One has every library-aware command consult the user
  root, under `--no-library-paths`, and name it in help. The other has doctor report it as
  a labelled provider. These are added beside the existing conventional-roots and doctor
  requirements rather than rewriting them, because both of those are long and stay
  accurate as written.
- `distribution`: the package-collection requirement counts the user root as a root the user
  supplies, and its scenarios cover resolving the collection from it.

## Impact

- **Users**: a clone or symlink of `emit-packages/lib` at `~/.local/share/emit/lib` makes
  `(import (malt learner))` work from any process, including GUI editors and `launchd`
  jobs. Existing `EMIT_LIBRARY_PATH` setups keep working unchanged. A user root that holds a
  library also present in installed Emit now wins over the installed copy, as project
  `lib/` already does.
- **Code**: `src/emit.cpp` (resolver and doctor, help text) and `src/compile.ss`
  (`configured-library-roots`). The Chez driver is not an assembled compiler input and
  `src/emit.cpp` is native host code, so no `make regen` is needed.
- **Tests**: `tools/test-runner.py` already gives every suite a private `HOME` and
  `XDG_DATA_HOME`, so existing suites stay hermetic. Suites that pin doctor's exact
  provider list gain one row. A new suite covers the location rules, the precedence, the
  opt-out, doctor reporting, and the Chez driver.
- **Out of scope**: `emit pkg`, installers that write into the root, a list of several user
  roots, an `emit-packages` Homebrew formula, and editing the `emit-packages` repository's
  install instructions (a follow-up there, once this releases).
