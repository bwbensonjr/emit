## Why

`emit build` and `emit run` die with `SIGSEGV` (exit 139, no diagnostic) when the manifest holds
no entries — whether because no `emit-libs.scm` was found, or because the file is empty,
whitespace-only, or comment-only (issue #63). This is the first command a newly installed Emit is
asked to run, in the one directory state a new project starts from, and it is also reachable by an
ordinary typo: `emit build hello.scm` passes a *source path* where a manifest *entry name* goes,
which looks reasonable and segfaults.

It also violates a requirement Emit already has. `module-system`'s "Library manifest" states that
"Finding no manifest at all SHALL remain non-fatal", and that a resolution failure "SHALL be
reported by import resolution, naming the unresolved library". A segfault reports nothing and names
nothing, so the degenerate-manifest case is unimplemented rather than merely undiagnosed.

Fixing it before the first tag matters more than its size suggests: `homebrew-tap-distribution`
makes `emit build` the entry point of a brew-installed product, and a crash on first contact is the
worst possible introduction.

## What Changes

- **The manifest parsers stop assuming a non-empty read.** `repl-manifest-programs`,
  `repl-manifest-paths`, and `repl-manifest-user-paths` (`src/repl-core.ss`) each begin
  `(car (read-all-from-string text))`. `read-all-from-string` returns `()` — not a one-element
  list — for text containing no datum, and `car` of `()` is unchecked by design
  (`core-language`, "the runtime applies the SAME unchecked semantics … `(car x)` for a non-pair
  `x`"), so it faults. Each site treats a datum-free manifest as an empty entry list.
- **`emit build` reports which degenerate case it hit.** The existing `progs.empty()` branch prints
  `no program entry in manifest <path>`, which reads as `in manifest ` with an empty path when no
  manifest was found at all. Absent, present-but-entryless, and present-with-no-`program`-entry
  become three distinct messages, each exiting 1.
- **`emit run` treats a datum-free manifest as no manifest.** Per the existing non-fatal
  requirement, a program importing only baked-in libraries runs unaffected; one importing a
  user library gets the ordinary unresolved-import error naming the library.
- **Fixtures cover the degenerate manifests.** `test/project-door-tests.sh` has manifest fixtures
  but none for an absent, empty, whitespace-only, or comment-only manifest, on either door.

Not in scope: making `car` checked. Unchecked accessors on type-confused arguments are a stated
`core-language` decision with R7RS latitude behind them, and re-opening it is a tower-wide
performance question, not a manifest fix. The defect here is that the *compiler's own* parsers
apply `car` to the result of reading *user-supplied text* without establishing it is a pair.

## Capabilities

### New Capabilities

None. This change implements behavior existing requirements already imply and adds the
degenerate-input requirements they left unstated.

### Modified Capabilities

- `module-system`: gains a requirement for the degenerate-manifest case — a manifest that exists
  but contains no datum SHALL be equivalent to a manifest with no entries, and SHALL NOT be fatal
  to a door that does not need an entry from it. Added rather than modified: the existing "Library
  manifest" requirement's "Finding no manifest at all SHALL remain non-fatal" stays as written and
  is extended, not revised.
- `project-build`: gains a requirement for the no-resolvable-entry cases — absent manifest,
  entryless manifest, and no `program` entry SHALL each be reported distinguishably and exit
  non-zero, never crash.

## Impact

- `src/repl-core.ss` — three manifest parsers (modes 5, 9, 10). **In `CORE_FLAT`, so this costs a
  `make regen` cycle.**
- `src/emit.cpp` — `resolve_program` (:633) and its `progs.empty()` branch (:643); host C++,
  reached by plain `make`.
- `test/project-door-tests.sh` — new degenerate-manifest fixtures for the `build` and `run` doors.
- No IR-shape or surface change: no library gains or loses a name, and no emitted program changes.
  `bootstrap/*.ll` changes only because the parsers do.
