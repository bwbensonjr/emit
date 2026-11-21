# Exploration: a package collection for libraries built on Emit

Status: decided; handoff to change proposals.
Captured: 2026-11-20. Emit checkout: `6b87ce5` (v0.10.0).

Follow-on changes:

1. `move-malt-to-emit-packages` -- create the collection, move `(malt learner)` into it, and
   keep Emit's coverage of it through a pinned commit.
2. `user-library-root` (not yet scaffolded) -- a default user-level library root so an
   installed package needs no environment configuration.

## Why this note exists

`packaging-and-emit-cli.md` left the dependency model open ("registry / version constraints /
...", never decided), and `library-sources-and-artifacts.md` open question 3 deferred whether
libraries should be discoverable by location for "whatever motivates it next -- third-party
packages, versioned dependencies, artifact reuse across projects". `docs/DISTRIBUTION.md`
sketched an `emit pkg` command that installs Snow packages into a project-local directory
with a lockfile.

What motivated it next was `(malt learner)`. A user-reported failure in the REPL:

```scheme
(import (malt learner))
(define (remainder x y) (if (< x y) x (remainder (- x y) y)))
(remainder 13 4)   ; <: not a number
```

Malt's `-` returns a scalar dual even for two plain numbers, and the facade leaves `<` as the
base procedure. Upstream's `main.rkt` (what `(require malt)` loads) also renames
`=-0-0 <-0-0 <=-0-0 >-0-0 >=-0-0` to the plain comparison names; Emit's facade followed
`learner.rkt`, which does not. The fix is small, but it would be an Emit release -- which is
the real problem: Malt is a domain library that ships, tests, and versions as part of the
language implementation.

## What was already true

**Installing a library is placing files.** The resolver maps `(malt learner)` to
`malt/learner.sld` under any library root (`docs/MODULES.md`, provider order):

```
  1. baked libraries
  2. project manifest entries          ./emit-libs.scm
  3. -L DIR roots
  4. EMIT_LIBRARY_PATH roots
  5. project lib/
  6. each installed manifest + its sibling lib/    <-- malt lives here today
```

A clone of a library tree plus `EMIT_LIBRARY_PATH` is already a working install; no compiler
change is needed to consume an external package.

**Malt only consumes Emit.** Its imports are `(scheme base)`, `(scheme inexact)`,
`(emit write)`, and `(srfi 27)` -- all of which stay. Nothing in Emit depends on Malt. Its
coupling is the `malt-learner` spec, one `distribution` requirement, a sentence in
`custom-writers`, the `Makefile` `LIBDIRS` entries, seven suites in `tools/test-registry.json`,
and roughly 380 KB of library and reference-test files.

**There is no user-level root.** Packages can go per project (tier 5) or into Emit's own
prefix (tier 6), but nothing between them -- so "install once, import from a REPL started
anywhere" has no home.

## Decision 1 -- registry model: a collection monorepo

```
  (A) collection monorepo   (B) index repo              (C) Snow client
  ----------------------    -------------------------   ----------------------
  sources live in one       entries pin git URL, tag,   publish to snow-fort;
  repo; one root            sha256; libs in own repos   emit reads Snow index
  + least machinery         + scales to other authors   + zero infrastructure
  + one CI tests all        - needs a fetch tool        - no Emit-compat gating
  - you own every package                               - Malt is Emit-specific
```

**Chosen: (A).** The packages are mostly the author's own for now, so owning every package's
code costs nothing and a single CI testing all packages against Emit is the strongest
compatibility signal. Moving to (B) later stays cheap; (C) remains open as an additional
publication channel for portable packages.

Naming: an R7RS *library* is the unit of import, so the distributable that contains one or
more libraries is a *package* (Malt is one package of ten libraries). The repository is
`bwbensonjr/emit-packages`.

Layout -- one library root that is the union of all packages, so installing the collection is
one clone, copy, or symlink, and package metadata stays out of the import path:

```
emit-packages/
  lib/                      single library root
    malt/learner.sld
    malt/learner/*.sld
  packages/
    malt/
      package.scm           name, version, minimum Emit, license, libraries
      LICENSE  PROVENANCE.md
      tests/                run against any given `emit` binary
      docs/
  .github/workflows/        every package against the latest Emit release
```

Per-package roots (`packages/malt/lib/`) were rejected: each would need its own path entry,
which pays off only for selective installation.

**Stays in Emit:** the shipped SRFIs (small, mostly pinned Snow sources; SRFI 27 relies on a
private host entropy operation) and `(emit write)`. The line is "standard-adjacent stays,
domain libraries move".

## Decision 2 -- a user-level library root

Considered: (1) document `EMIT_LIBRARY_PATH` only; (2) a default user-level root;
(3) a Homebrew formula for the collection. (3) does not work by itself: tier 6 resolves from
Emit's own Cellar prefix, not `/opt/homebrew/share`, so a separate formula's files are
invisible without (2).

**Chosen: (2)**, at `$XDG_DATA_HOME/emit/lib`, else `~/.local/share/emit/lib`, placed between
project `lib/` and the installed manifest. What it buys over the environment variable:

- **Reach.** An environment variable exists only where a shell profile ran. GUI Emacs on
  macOS, `launchd` jobs, editor-spawned tools, and fresh CI runners miss it; a built-in
  default reaches every process that runs `emit`.
- **Correct precedence.** `EMIT_LIBRARY_PATH` is tier 4, *above* project `lib/`, so a
  globally exported collection silently shadows a project's vendored or patched copy. A user
  root after tier 5 gives project over user over installed Emit.
- **An install target.** An installer or a future `emit pkg` needs somewhere defined to
  write, and `emit doctor` can report the root as its own row.
- **`EMIT_LIBRARY_PATH` keeps its job** as an ad hoc development override.

Cost: hidden global state can make a local `emit build` pass where a clean checkout fails.
Mitigated by the existing `resolve libraries ->` narration and by bringing the user root
under `--no-library-paths`, so CI can opt out with the switch it already has. The change is
native host plus Chez driver (`src/emit.cpp`, `src/compile.ss`); it touches no assembled
compiler input, so no `make regen`.

Sequencing: Malt moves first, with an `EMIT_LIBRARY_PATH` migration note; the user root
follows and the collection's install instructions switch to it.

## Decision 3 -- Emit keeps Malt's coverage through a pinned commit

Malt is Emit's largest real library composition under test: ten libraries exercising exported
macros, renames and prefixes, facade re-exports, custom writers, and SRFI 27 across native,
source-driven, and installed paths. Recent fixes (for example the export-order fix in
`058769c`) were caught there. Options:

```
  (a) no cross-check        (b) Emit CI tests a pinned      (c) emit-packages CI tests
                                emit-packages commit            Emit main nightly
  breaks surface after      breaks block the Emit PR;       breaks surface after merge,
  release -- and merging    pin moves are explicit, like    before the next release
  VERSION to main IS the    the pitch pin in                only if someone looks
  release                   tools/format.sh
```

**Chosen: (b).** Release-on-merge makes "found after release" too late, and pinning by commit
keeps Emit's CI deterministic: no commit to `emit-packages` can turn Emit red until the pin
moves. (c) can be added later for early warning in the other direction. The installed-tier
coverage that `malt-installed` gave is retained by the SRFI install checks; the user-root
change adds its own suite.

Ordering inside change 1: the collection exists and passes against Emit 0.10.0 *before* the
Emit pull request, which pins that commit, swaps the suites, and removes Malt atomically.

## Deferred

- An `emit pkg` command and lockfiles.
- Version ranges; `package.scm` starts with a minimum Emit version only.
- Snow integration (publishing portable packages to snow-fort, or consuming its index).
- Accepting packages from other authors -- the trigger for revisiting (B).

## Open questions

1. Do any Malt tests require Racket or the upstream checkout at run time? The pinned suite
   inside Emit should use stored expected outputs only.
2. Carry Malt's history into `emit-packages` with `git filter-repo`, or start fresh with a
   provenance note pointing at Emit's history?
3. Does the pinned suite fetch over the network in CI, or use a cached checkout keyed by the
   pinned commit?
