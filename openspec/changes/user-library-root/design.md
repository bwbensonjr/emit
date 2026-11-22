# Design

## Context

Library lookup is built in two places that must agree: `LibraryResolver::prepare` in
`src/emit.cpp`, which every native command and `emit doctor` share, and
`configured-library-roots` in `src/compile.ss`, which the Chez source driver uses. Today both
produce: project manifest, `-L` roots, `EMIT_LIBRARY_PATH` roots, project `lib/`, then
installed manifest and `lib/` pairs. `--no-library-paths` (`ResolverOptions::library_paths`,
`*library-paths-enabled?*`) drops every directory root and keeps manifests.

The host already derives one per-user location, the library cache, in
`user_cache_location()`: `EMIT_CACHE`, else `XDG_CACHE_HOME/emit`, else the platform cache
(`~/Library/Caches/emit` on macOS). `tools/test-runner.py` gives every suite its own
`HOME`, `XDG_DATA_HOME`, and cache, so suites never see a developer's real user root.

The decision to add the root, where to put it, and its precedence was made in
`openspec/explorations/emit-packages-registry.md`, Decision 2. This design fixes the details.

## Goals / Non-Goals

**Goals:**

- One user root, derived the same way by the native host and the Chez driver.
- Project over user over installed, with the existing opt-out covering the new tier.
- Visible: doctor and resolution narration say when the user root answered.

**Non-Goals:**

- Writing to the root. Emit never creates or populates it; cloning, copying, or linking a
  collection there is the user's step, and a future `emit pkg` would be the tool for it.
- A separate opt-out flag or a dedicated environment variable for the location.

## Decisions

### D1. Location: `$XDG_DATA_HOME/emit/lib`, else `$HOME/.local/share/emit/lib`, on every platform

The XDG base-directory rule applies: an unset, empty, or relative `XDG_DATA_HOME` is ignored.
With neither variable usable, there is no user root and no provider is added.

The library cache uses `~/Library/Caches` on macOS, but the user root does not use
`~/Library/Application Support`. A cache is a location Emit manages and the user never
types. The user root is a location the user populates by hand (`git clone ... ~/.local/share/emit/lib`
or `ln -s`), so one documented path for both platforms, without a space in it, matters more
than macOS convention. This follows the exploration.

**Alternative:** an `EMIT_USER_LIBRARY` variable to relocate it. Rejected: `XDG_DATA_HOME`
already relocates it, and `EMIT_LIBRARY_PATH` already adds arbitrary roots; a third knob
adds no reach.

### D2. Position: after project `lib/`, before the first installed manifest

The order becomes: baked, project manifest entries, `-L`, `EMIT_LIBRARY_PATH`, project
`lib/`, **user root**, installed manifest and `lib/` pairs. The user root is one directory
provider. Physical deduplication works as before, so a user root that is also listed in
`EMIT_LIBRARY_PATH` appears once, at the earlier position.

It sits before the installed *manifest* too, not only before the installed `lib/`. Installed
manifests name only shipped standard libraries, and the point is that a user can supply a
newer copy of a non-baked shipped library without editing Emit's prefix, exactly as a
project can. Baked libraries still always win.

**Alternative:** after the installed pairs, so shipped libraries can never be shadowed.
Rejected: the exploration's "project over user over installed" is the consistent rule, and
a user who puts `srfi/1.sld` in their own root has asked for it.

### D3. Opt-out: `--no-library-paths` drops it; nothing else does

The user root is a conventional directory root, so it follows the existing switch. CI and
exact-manifest runs (`--manifest F --no-manifest-chain --no-library-paths`) stay hermetic
without a new flag. `--no-manifest-chain` does not affect it.

### D4. Reporting

`emit doctor` shows the user root as an ordinary directory provider whose label is `user`,
followed by the rule that located it, for example
`directory /home/u/.local/share/emit/lib [user, XDG_DATA_HOME; missing]`. When no rule yields
a location, doctor prints `user library root: unavailable (no HOME or XDG_DATA_HOME)`, which
is informational. With `--no-library-paths`, the existing
`directory providers: disabled` line covers it.

Resolution narration names it the same way (`[directory ROOT]` in the Chez driver, the
provider identity `user` in the host), so a build that passes locally only because of the
user root shows that in its log.

### D5. Chez driver parity

`configured-library-roots` appends the user root after `(project-library-root)` and before
the `EMIT_PREFIX` root, using the same rules as D1. A shared test runs the same import
through `emit run` and `compile.ss` with the library only in the user root and expects both
to resolve it.

## Risks / Trade-offs

- [Hidden global state: a local build passes because of a library in the user root that a
  clean machine lacks] → resolution narration names the user root; `emit doctor` lists it;
  CI runners have an empty home; `--no-library-paths` excludes it.
- [A stale copy of a shipped library in the user root shadows the installed one after an
  upgrade] → doctor and narration show which provider answered; this is the same exposure
  project `lib/` already has. Documented in `docs/MODULES.md`.
- [Developer test runs pick up the real user root] → the test runner already isolates
  `HOME` and `XDG_DATA_HOME`; a scripted check outside the runner must do the same, and the
  new suite asserts the isolation it relies on.
- [Suites that pin doctor's exact provider rows] → updated in the same change to expect the
  extra row.

## Migration Plan

No migration is required: an absent user root changes nothing. Users who exported
`EMIT_LIBRARY_PATH` for `emit-packages` can keep it, or move the clone or link to the user
root and drop the variable. Rollback is reverting the change; nothing is written to disk.
