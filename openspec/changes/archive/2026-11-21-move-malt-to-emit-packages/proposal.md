# Proposal

## Why

`(malt learner)` is a domain library, not part of the language or its host, yet it ships,
tests, and versions as part of Emit. A fix to its export list, such as the missing
differentiable `=`, `<`, `<=`, `>`, `>=` that upstream Malt's `main.rkt` provides, therefore
becomes an Emit release. Moving Malt into a separate collection of Emit packages,
`bwbensonjr/emit-packages`, lets libraries built on Emit evolve on their own cadence, while
Emit keeps Malt's coverage of real multi-library composition by testing a pinned commit of
that collection. The exploration behind this decision is
`openspec/explorations/emit-packages-registry.md`.

## What Changes

- Create the `bwbensonjr/emit-packages` repository as a collection monorepo: a single `lib/`
  library root holding every package's libraries, with per-package metadata, license,
  provenance, documentation, and tests under `packages/<name>/`. Malt moves there
  byte-identical to Emit's current copy, and its tests run against any given `emit` binary
  rather than a source checkout's `build/emit`.
- **BREAKING**: Remove `(malt learner)` and its internal libraries from Emit's source tree
  and installed payload (`lib/malt/`, the `Makefile` `LIBDIRS` entries, `LICENSE` and
  `PROVENANCE.md`). A program importing `(malt learner)` against an installed Emit resolves
  it only after the user adds the collection's `lib/` as a library root, for example with
  `EMIT_LIBRARY_PATH`.
- Remove the Malt tests, demo, and guides from Emit (`test/malt-*`, `test/malt-reference/`,
  `demos/malt-xor.scm`, `docs/MALT.md`, `docs/MALT-CORE.md`, `docs/MALT-MEASUREMENTS.md`),
  and update cross-references in `README.md`, `docs/MODULES.md`, `docs/CUSTOM-WRITERS.md`,
  and `docs/RANDOM.md`. Performance evidence measured with Malt
  (`docs/performance/writer-*`) stays as a historical record.
- Pin an `emit-packages` commit in Emit, following the pitch pin in `tools/format.sh`, and
  replace the seven `malt-*` suites in `tools/test-registry.json` with a full native
  suite and a reference suite that check out the pinned commit and run its declared package
  checks against the freshly built `emit` and the Chez source driver. Moving the pin is an explicit, reviewed edit.
- Record the migration in `CHANGELOG.md`, and take a minor version bump because the change
  removes a shipped library.
- SRFI 27, `(emit write)` custom writers, and the other shipped SRFIs stay in Emit.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `malt-learner`: every requirement is removed; the capability moves to `emit-packages`
  with its specification.
- `distribution`: "Malt and random library sources ship with their source closure" narrows
  to SRFI 27's source and license closure, and its learner scenarios are dropped. A new
  requirement states that the installed payload carries no package-collection libraries
  and that one resolves only through a root the user supplies.
- `custom-writers`: the separate-compilation requirement states its no-payload guarantee
  for any writer-registering library instead of naming Malt.
- `development-validation`: adds requirements that Emit validate a pinned commit of the
  external package collection as a classified suite, deterministic for a given pin, across
  `emit run`, `emit repl`, `emit build`, and (in the reference profile) the Chez source
  driver, without Racket; and that a local collection checkout can stand in for the pin
  as a run labelled unpinned.

## Impact

- **Users**: `(import (malt learner))` stops resolving from a bare installed Emit. The
  migration is to clone `emit-packages` and add its `lib/` to `EMIT_LIBRARY_PATH`. A later
  change, `user-library-root`, adds a default user-level root so that clone needs no
  environment configuration.
- **Code**: `lib/malt/`, `Makefile`, `tools/test-registry.json`, a new pin and fetch helper
  under `tools/`, the Malt test scripts and fixtures, docs, and `demos/`. No compiler
  source, assembly input, or native host code changes, so no `make regen`.
- **CI**: the replacement suite needs network access to fetch the pinned commit, or a
  cached checkout keyed by it.
- **Ordering**: the `emit-packages` repository and a green run of its tests against Emit
  0.10.0 must exist before the Emit pull request, which pins that commit and removes Malt
  atomically.
- **Out of scope**: the user-level library root, an `emit pkg` command, version-range
  compatibility, Snow integration, and accepting packages from other authors.
