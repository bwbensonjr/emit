# Design

## Context

See `proposal.md` for motivation and `openspec/explorations/emit-packages-registry.md` for the
registry-model, user-root, and coverage decisions this change builds on.

Malt's footprint in Emit today:

- **Sources:** `lib/malt/learner.sld` plus nine internal libraries under `lib/malt/learner/`,
  `LICENSE`, and `PROVENANCE.md`, installed through the `Makefile` `LIBDIRS` list.
- **Suites:** seven in `tools/test-registry.json`. Four are full native suites (`malt-core`,
  `malt-installed`, `malt-training`, `malt-xor`) and three are reference suites run through
  the Chez source driver (`malt-core-source`, `malt-training-source`, `malt-xor-source`).
  Their scripts are `test/malt-*-tests.sh`, with programs `test/malt-core.scm`,
  `test/malt-training.scm`, `test/malt-reference/{direct,unprefixed,notation}.scm`, and
  `demos/malt-xor.scm`.
- **What the checks verify:** each script runs a self-checking program through `emit run`,
  `emit repl`, a standalone `emit build` executable, and optionally Chez. It then compares
  the program's final non-blank stdout line with an expected completion datum such as
  `(malt-core-complete 120)`. `malt-xor-tests.sh` instead parses five floats and applies
  tolerances in an embedded Python verifier.
- **Racket:** `test/malt-reference/check.py` uses Racket only behind `--upstream`, which
  regenerates fixtures. No suite passes that flag, so the stored expectations are already
  Racket-free.
- **Demo baseline:** `demos/malt-xor.scm` is one of the demos hashed in
  `test/module-scaffold-baseline.sha256`, the 37th entry.
- **History:** Malt's history in Emit is six commits, with no renames.
- **Pin precedent:** the repo already pins pitch by commit in `tools/format.sh`. It uses
  `PITCH_PIN_COMMIT` and `PITCH_PIN_ORIGIN`, plus a probe that proves the pin.

## Goals / Non-Goals

**Goals:**

- Malt leaves Emit's source, payload, specs, and suites in one atomic pull request, with no
  loss of the multi-library and execution-path coverage it gave.
- `emit-packages` and Emit run the same package checks, each with its own driver.
- The pinned suite works offline once a pinned checkout is cached, and reports exactly what
  it ran.

**Non-Goals:**

- The user-level library root (`user-library-root`), `emit pkg`, version ranges, and package
  dependency resolution.
- Fixing the missing differentiable comparison exports. That becomes the first
  `emit-packages` change, after the move.
- A general-purpose third-party package test framework. The check format below is only as
  large as Malt's current suites need.

## Decisions

### D1. Package checks are declared as data; each repository brings its own driver

Each package declares its checks in `packages/<name>/checks.scm`, a single s-expression:

```scheme
((check malt-core     (program "tests/core.scm")     (expect "(malt-core-complete 120)"))
 (check malt-training (program "tests/training.scm") (expect "(malt-training-complete ...)"))
 (check malt-xor      (program "tests/xor.scm")      (expect "(malt-xor-complete ok)")))
```

- **Program paths:** each is relative to the package directory.
- **Library roots:** a driver runs a program with exactly two roots, the collection's `lib/`
  and the package's `tests/` directory. The second gives check programs private helper
  libraries, replacing today's `-L test`.
- **Passing:** a check passes on a path when that path's final non-blank stdout line equals
  `expect`.

There are two drivers:

- **The `emit-packages` driver** runs the checks against a given `emit` binary through
  run, REPL, and build.
- **Emit's driver** runs the same file against `build/emit` on those three paths, plus an
  **artifact path**. For that path it publishes every library in the package's
  `package.scm` `libraries` list with `emit lib`, runs each check with a manifest pointing
  at those artifacts, and requires the narration to report each library as reused. In the
  reference profile, it also runs the Chez source driver.

The artifact path keeps the coverage `malt-core-tests.sh` gave by publishing four Malt
units and demanding their reuse: Emit's artifact cache exercised on a large,
macro-exporting library. It is Emit-only knowledge, derived from metadata the package
already declares, so the `checks.scm` contract does not grow.

The other current checks that don't fit "program plus expected last line" move to the
collection's own package tests (`tools/test-packages.sh`) and run against a given `emit`:

- the rejection of the unsupported `ext1-∇` and `ext2-∇` imports;
- the conflict between explicit `(scheme base)` and `(malt learner)` imports.

Emit keeps generic coverage of the behavior underneath them in `import-set-tests.sh` and
`test/library-composition/`.

Alternatives considered:

- *Emit runs `emit-packages`' own test scripts.* Those scripts would need to know Emit's
  source-driver invocation and its checkout layout. That re-couples the repositories in the
  direction this change removes.
- *Move the existing shell scripts as they are.* They hardcode `$ROOT/build/emit`, the
  manifest, and in-tree paths. They are also seven scripts with seven slightly different
  argument conventions.

A data file is the one thing both drivers can read without importing each other's code.
Its format is an s-expression because that is already how Emit's manifests look.

### D2. Check programs verify themselves; XOR moves its tolerance into Scheme

The only check that isn't already "compare the last line" is XOR. Its tolerance check moves
into `tests/xor.scm`:

- The program checks that each prediction is within `0.1` of its target and that the loss is
  below `0.04`.
- It prints a final line of `(malt-xor-complete ok)`, preceded by the predictions rounded to
  six digits.

The cross-path 1e-9 comparison changes as a result. Every path must still print the same
completion line, and seeding makes the run deterministic. Rounding to six digits keeps
cross-path drift visible in the printed predictions without making the expectation depend on
platform `libm`.

Alternative: allow a per-check external verifier in `checks.scm`. That would need a Python
dependency in both drivers' contract to save one Scheme function.

### D3. Fetch the exact commit on demand, cached by commit, with no CI cache layer

The pin lives in `tools/emit-packages-pin.sh`, which defines `EMIT_PACKAGES_PIN_COMMIT` (a
full 40-hex SHA) and `EMIT_PACKAGES_PIN_ORIGIN`. Shell and Python read the same file in the
same `KEY="value"` form as the pitch pin.

The driver obtains the collection like this:

1. If `EMIT_PACKAGES_DIR` names a local checkout, use it, label the run **unpinned**, and
   record the checkout's commit and whether it is dirty.
2. Otherwise use `build/emit-packages/<commit>/` if it exists and `git rev-parse HEAD`
   equals the pin.
3. Otherwise run `git init`, then `git fetch --depth 1 <origin> <commit>` and
   `git checkout --detach FETCH_HEAD` into a temporary directory. Verify `HEAD` against the
   pin and rename the directory into place.

On a mismatch, the driver fails and names both commits.

Why fetch rather than add a CI cache:

- The collection is a few hundred kilobytes, and a single-commit shallow fetch from GitHub
  takes about a second.
- The commit hash is the integrity check: a checkout whose `HEAD` equals the pinned SHA has
  exactly the pinned content.
- An `actions/cache` entry would add a key, a restore step, and a stale-cache failure mode,
  to save one second.

The `build/` cache is what makes offline development work after one networked run.

Alternatives considered:

- *Vendor the collection as a git submodule.* Submodules bring checkout friction to every
  clone, including source-release consumers who never run the suite.
- *Commit a tarball snapshot.* That puts the moved code back in Emit's tree.

### D4. One registry suite per profile, and Emit's install closure keeps an SRFI-only check

The seven `malt-*` registry entries become two:

| Suite ID | Profile | Paths |
|---|---|---|
| `emit-packages-pinned` | full | run, REPL, build, artifacts |
| `emit-packages-pinned-source` | reference | Chez source driver (with Chez, as the old `-source` entries) |

Both have the `library` category and `workspace` isolation. They own the coverage IDs of the
entries they replace, which preserves the coverage-inventory rule that every moved assertion
has an owner.

The SRFI 27 half of `test/malt-install-tests.sh` survives as `test/srfi-27-install-tests.sh`,
which owns the `malt-installed` coverage ID's SRFI assertions. Its Malt half becomes the
negative installed-payload scenario in the `distribution` delta: an installed Emit does not
resolve `(malt learner)` by itself, and does resolve it with a supplied root.

### D5. Move history with `git filter-repo`, falling back to a provenance note

The new repository's history comes from Emit using `git filter-repo`, keeping:

- `lib/malt`;
- `test/malt-*` and `test/malt-reference`;
- `docs/MALT*.md`;
- `demos/malt-xor.scm`;
- `openspec/explorations/malt-learner.md`.

Path renames then map these into the new layout (`lib/malt/...`, `packages/malt/...`).
`git-filter-repo` isn't installed locally; `uv tool install git-filter-repo` provides it.

The history is six commits with no renames, so this is expected to be straightforward. If
filtering produces a misleading history (for example, commits whose messages describe Emit
changes the filter removed), start the repository fresh instead. Its first commit then
records the Emit commit the sources came from, and `PROVENANCE.md` points at Emit's history.

### D6. Remove `demos/malt-xor.scm` and regenerate the demo baseline in the same commit

The XOR program becomes `packages/malt/tests/xor.scm`. Removing the demo drops entry 37 from
`test/module-scaffold-baseline.sha256`. The baseline is regenerated in the same commit, so
the diff shows exactly one removed line and no other change. Any other moved hash means
something else changed.

## Risks / Trade-offs

- **CI depends on GitHub reachability for the pinned suite.** → The full profile already
  needs the network for dependency provisioning, so this adds no new failure class. A
  failed fetch reports its cause and is never treated as a pass.
- **The final-line contract is weaker than XOR's float comparison.** → The predictions still
  print, rounded, before the completion line, and the expectation is exact. A regression
  that keeps every value within tolerance on every path but moves the sixth digit on one
  path is not caught. That is accepted.
- **Two drivers can drift apart.** → Both read the one `checks.scm` format. The format stays
  minimal (program, expect), and `emit-packages` documents it as the contract Emit's driver
  relies on.
- **Breaking users of `(import (malt learner))`.** → Minor version bump, a `CHANGELOG.md`
  migration entry with the `EMIT_LIBRARY_PATH` recipe, and the follow-on user-root change.
  Emit is pre-1.0; the library first shipped in 0.7.0.
- **The pinned suite now runs after a fetch rather than from the working tree.** → An edit
  to Malt can no longer ride along in an Emit PR. That is the intended separation;
  `EMIT_PACKAGES_DIR` covers testing the two repositories' changes together.

## Migration Plan

1. Create `bwbensonjr/emit-packages` (D5). Add the layout, `packages/malt/package.scm`,
   `checks.scm`, and its driver and CI, then run it green against Emit 0.10.0.
2. In Emit, add the pin and driver (D3, D1), then switch the registry (D4) and confirm the
   new suites pass against the current tree while Malt is still present.
3. In the same Emit pull request: remove Malt (sources, `Makefile`, tests, demo, docs),
   regenerate the demo baseline (D6), update cross-references, sync the spec deltas, bump
   `VERSION` to 0.11.0, and add the `CHANGELOG.md` entry.

**Rollback** is a revert of the Emit pull request. That restores the in-tree library and
suites, and `emit-packages` can stay as it is.

## Open Questions

- The exact wording of `packages/malt/package.scm` beyond name, version, minimum Emit
  version, license, and provided libraries. It doesn't affect Emit's driver, which reads only
  `checks.scm`.
