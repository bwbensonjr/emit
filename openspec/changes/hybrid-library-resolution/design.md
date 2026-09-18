# Design

## Context

See `proposal.md` for motivation. Today the manifest is both an exact name-to-source map and the
finite index that lets the REPL register every user library before its first prompt. The run, build,
and lib doors already walk only the import closure they need. The recent
`defer-manifest-library-init` change retained eager REPL registration but moved initialization and
ORC materialization to first import.

The compiler core deliberately performs no filesystem I/O. Host-side code locates and reads source,
installs the source home used by the include family, and sends source and export interfaces through
the embedding protocol. A library then compiles through one core into deterministic unit IR and a
phase-separated `.exports` interface. Any discovery change must preserve this division and must not
create a second compiler or artifact path.

The repository also has two discovery implementations that must agree: the shipped C++ host and the
bootstrap-only Chez driver. Installation is relocatable through executable-relative lookup, while a
compiled prefix remains the last fallback.

## Goals / Non-Goals

**Goals:**

- Make the conventional project shape `lib/a/b.sld` sufficient for `(import (a b))`.
- Treat manifests as exact overrides and program/build metadata rather than mandatory repetition.
- Give all doors one observable provider order and one selected source for each library name.
- Preserve deterministic separate artifacts, compile-time macro interfaces, tree shaking, and
  REPL-to-ship behavior.
- Preserve eager startup validation for libraries a manifest explicitly enumerates while permitting
  an unbounded library root to be resolved without scanning it.
- Keep installed standard libraries relocatable and available from any project directory.

**Non-Goals:**

- Package fetching, dependency version solving, lockfile generation, or network access.
- Multiple source files per `define-library` beyond the existing R7RS include declarations.
- Replacing manifests; exact mappings, artifact directories, and named programs remain supported.
- Making arbitrary Scheme identifiers reversible filesystem names. Unrepresentable names use a
  manifest entry.
- Changing import-set syntax, export semantics, unit symbol names, artifact formats, or initializer
  semantics.
- Enumerating every library available beneath a root for completion or startup validation.

## Decisions

### D1: Resolve through an ordered chain of provider records

The host builds one ordered vector of providers. A provider is `baked`, `manifest`, or `directory`
and exposes an exact `resolve(name)` operation returning a canonical library descriptor:

```text
name, source path or baked source, source home, artifact directory, provider identity
```

The default order is:

1. the baked registry;
2. exact entries from the first project manifest;
3. repeated command-line `-L` / `--library-path` roots;
4. roots from `EMIT_LIBRARY_PATH`;
5. the project conventional root;
6. each installed manifest followed by its sibling conventional root.

The project root is `lib` beside the selected/discovered project manifest, or `./lib` when there is
no project manifest. Installed pairs use the existing executable-relative and compiled-prefix
candidate locations. Canonical physical manifests and roots are deduplicated at first occurrence.

This retains the current exact project override and installed fallback while allowing a
conventionally placed project library to override an installed one. Baked names remain first and
cannot acquire a second module.

Alternatives considered:

- Search all manifests before all roots. Rejected because an installed manifest would defeat a
  conventional project override.
- Search roots before exact project entries. Rejected because it weakens the manifest's role as an
  explicit exception and changes current project override behavior.
- Merge every discovered answer and diagnose duplicates. Rejected because roots commonly overlap;
  ordered first-match behavior is simpler, matches load-path practice, and remains observable
  through narration.

### D2: Use a deliberately narrow and safe path derivation

Each eligible library-name component becomes one path component; the final component receives the
`.sld` suffix. Symbol names are used exactly, preserving case. Exact nonnegative integers use their
decimal spelling. Empty symbols, `.`, `..`, NUL, and symbols containing either host path separator
are ineligible for conventional lookup. The resolver never percent-decodes, expands a shell token,
or interprets a component as an absolute path. A name outside this subset requires a manifest.

After opening the first matching regular file, the host parses enough of the source through the
existing core protocol to validate that its sole form is `define-library` with exactly the requested
name. The declared name, not the filename, remains the unit identity used by symbol mangling and
artifacts.

Alternatives considered:

- Encode every possible identifier. Rejected for the first version because a novel escaping scheme
  would reduce interoperability and create case-folding and normalization questions.
- Trust the path without validating `define-library`. Rejected because a misplaced file could then
  populate artifacts under the wrong requested identity and cause cross-unit symbol confusion.

### D3: Share resolver behavior, not filesystem I/O, with the compiler core

The C++ host owns the production resolver and source reads. The core gains only protocol operations
needed to inspect an import request, validate a selected library declaration, register a compiled
unit, and commit an import. The Chez driver implements the same provider construction and path rule
for bootstrap parity, then calls the existing compile-library entry.

The dependency walker takes a resolver callback rather than a prebuilt manifest map. Run/build/lib
walk from their known root imports. Every successful answer is memoized by library name for that
compilation session, so one name cannot resolve differently midway through a graph if files change
or provider state is consulted twice. The memoized descriptor is also what narration and cache
lookup receive.

Alternatives considered:

- Put directory traversal in Scheme compiler code. Rejected because it violates the core's I/O-free
  boundary and would duplicate host portability concerns.
- Generate a temporary manifest from roots. Rejected because it requires scanning an open-ended
  directory tree, recreates manual-index semantics, and obscures which provider actually won.

### D4: Keep exact manifest registration eager and make path registration import-driven

REPL startup keeps its current loop over exact manifest entries. Those sources are read or
cache-loaded, compiled if stale, and added to the JIT before the prompt; their initializers remain
deferred. This preserves the deliberate guarantee that an invalid exact mapping is reported at
startup.

A directory provider cannot be enumerated without scanning, so it participates at the prompt. If
mode 3 sees an unregistered imported name, the host resolves the name, recursively resolves and
registers its dependencies, and retries the import resolution. Registration adds full unit IR and
the compile-time interface but runs no initializer. The existing resolve-then-commit import path
then computes one dependency order, runs missing initializers, and merges exports only after
success.

The on-demand operation uses a transaction boundary for compiler registration state. A read,
validation, compile, cache, or add-IR failure reports the import and restores core registration
state. LLVM modules already added before a later failure may remain inert in ORC, as failed
interactive form modules do today, but they are not published as importable session bindings.
Initializers retain the existing irreversible host-side once-only set.

Alternatives considered:

- Scan every root at startup and preserve wholly eager registration. Rejected because it makes
  startup scale with unrelated filesystem contents, requires an indexing convention beyond R7RS,
  and defeats the zero-configuration benefit for installed trees.
- Make manifest entries lazy too. Deferred: that would move an established startup diagnostic and
  is not needed to introduce conventional roots.

### D5: Separate manifest chaining from conventional lookup controls

All four user-facing doors and the Chez driver accept repeated `-L DIR` and
`--library-path DIR`. `EMIT_LIBRARY_PATH` uses the host path-list separator. Empty elements are
errors, preventing an accidental current-directory provider. Relative explicit and environment
roots resolve from the invocation directory and are canonicalized before deduplication.

`--no-manifest-chain` keeps its present narrow meaning: it suppresses later manifest files. The new
`--no-library-paths` suppresses all directory providers. Therefore
`--manifest FILE --no-manifest-chain --no-library-paths` reproduces exact single-manifest behavior.
Help and diagnostics state this combination directly.

Alternatives considered:

- Extend `--no-manifest-chain` to suppress installed directories. Rejected because the option is
  documented as controlling manifests only and changing it would couple two independent inputs.
- Use `-I`. Rejected because the build host already constructs compiler include flags with `-I`,
  while `-L` reads naturally as a Scheme library root at the Emit CLI boundary.

### D6: A direct source build is distinct by syntax, not filesystem state

`emit build` classifies an operand ending in `.scm` or containing a path separator as a source;
other bare operands remain manifest program names. This avoids behavior changing according to
whether a same-named file happens to exist. Direct source builds accept `-o`; without it they derive
`build/<basename>` after removing the final `.scm`. They feed the same build session and resolver
configuration as a named program after program-entry resolution.

Manifest `(program ...)` entries remain the right interface for stable named targets, multiple
applications, and manifest-relative output paths.

Alternative considered: require `--source FILE`. Rejected as needless ceremony for the primary
single-application case, though it could be added later as an unambiguous alias.

### D7: Provider identity is observable but not part of emitted semantics

Default narration names each non-baked resolution and whether it came from an exact manifest or a
directory root. Verbose narration includes roots considered and cache decisions; quiet mode emits
only errors. This follows `docs/OUTPUT.md` and keeps stdout as data.

Cache validation begins only after the resolver has selected a descriptor. Existing compiler and
source-content identities decide reuse. Provider type and path spelling are recorded for narration
but do not salt an otherwise identical source artifact; conversely, an old cache entry for the same
library name cannot override a newly selected source because its source identity will differ.

### D8: Documentation is part of the behavior migration

System documentation will describe the provider abstraction, exact precedence, REPL's split eager
and on-demand registration, cache interaction, source-home behavior, and installation layout.
User documentation will lead with a manifest-free `main.scm` plus conventional `lib/` example,
then introduce manifests for exceptional paths and named programs. Every command's help will show
the path controls, and `docs/OUTPUT.md` will define resolver narration examples.

The documentation update lands with the behavior and tests, rather than leaving the old
manifest-only mental model in `README.md`, `docs/PROJECTS.md`, or `docs/MODULES.md`.

## Risks / Trade-offs

- [A project gains a library merely because a matching file appears under `lib/`] → Make provider
  selection visible, validate the declaration name, and provide `--no-library-paths` for exact
  builds.
- [Case-sensitive names behave differently on case-insensitive filesystems] → Preserve exact
  component spelling, validate the declared name after opening, and test name mismatches; do not
  promise distinct case-only libraries where the host filesystem cannot represent them.
- [The production host and Chez driver drift] → Put shared fixtures around provider construction,
  path derivation, mixed-provider DAGs, and byte-identical unit output on both implementations.
- [On-demand REPL registration partially mutates ORC before a later dependency fails] → Publish no
  session bindings until the closure registers successfully; tolerate inert modules while restoring
  compiler registration state.
- [Default installed roots reduce hermeticity] → Keep exact precedence deterministic, narrate
  installed fallback, and document the two opt-out flags required for single-manifest resolution.
- [Direct build operands conflict with unusual manifest target names containing `/` or ending
  `.scm`] → Define classification syntactically and require those unusual targets to be selected by
  an explicit manifest-oriented invocation in a future extension; document the reserved shapes now.

## Migration Plan

1. Add resolver fixtures and the host/driver provider abstraction while retaining manifest-only
   defaults behind an internal gate.
2. Add conventional path derivation, declaration validation, CLI/environment roots, and mixed-DAG
   tests on run/lib/build before changing defaults.
3. Add the REPL on-demand registration transaction and parity tests, retaining eager exact-manifest
   registration.
4. Install the conventional shipped hierarchy and enable project/installed default roots.
5. Add direct source build mode and its project-door tests.
6. Update command help, system documentation, user guides, examples, and output narration; run
   documentation commands in their published forms as acceptance tests.
7. Complete the compiler-source edit set, cross the `make regen` barrier once, run
   `run-all-tests.sh`, commit, and then run `run-dev-tests.sh` so trust-check compares committed
   regenerated IR.

Rollback is configuration-compatible: `--no-library-paths` retains manifest-only lookup, existing
manifests and named programs remain valid, and installed manifests stay in place. Reverting the
default-root enablement therefore does not require a source or manifest migration.
