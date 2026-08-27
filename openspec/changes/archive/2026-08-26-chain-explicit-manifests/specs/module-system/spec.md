## MODIFIED Requirements

### Requirement: Library manifest

Library discovery SHALL be driven by a readable s-expression manifest mapping each library name
to its source file and an optional artifact directory; compiled artifacts SHALL default under a
build directory rather than the source tree. The manifest MAY list any number of libraries.
Resolving an imported library that has no manifest entry and that is not a member of the baked set
SHALL be a compile-time error naming the missing library. The standard library `(scheme base)` SHALL
remain **listable** in a manifest, so the Chez-hosted driver can resolve it from the committed
`.sld` like any other library — but a door that has registered the baked set SHALL treat such an
entry as already satisfied (see "The baked library set is a partition emitted in dependency order"),
so no door depends on the entry's presence and no door loads a second copy because of it.

**Locating the manifests.** Every door SHALL use the same ordered candidates:

1. the `--manifest FILE` argument, when the door accepts one and it is given;
2. the `EMIT_MANIFEST` environment variable, when set;
3. `./emit-libs.scm`, relative to the current working directory;
4. `<dir of the resolved real path of the running executable>/../share/emit/emit-libs.scm`,
   where the executable's path SHALL be resolved through symbolic links so that a symlinked
   launcher locates the manifest installed beside the real binary;
5. a compiled-in installation default, `<install prefix>/share/emit/emit-libs.scm`.

Candidates 1 and 2 are **explicit requests**. `--manifest FILE` SHALL outrank
`EMIT_MANIFEST`. When the selected explicit request names a file that does not exist, the door
SHALL report that named file as missing rather than silently falling through. When it is readable,
it SHALL be the first manifest and candidate 3 SHALL be skipped: an unrelated working directory's
project manifest is not part of an explicitly selected project's resolution. Every distinct,
readable installed candidate 4–5 SHALL then extend the explicit manifest for **library** lookup.

Without an explicit request, candidates 3–5 are **searched, and they chain**: every distinct
candidate that exists and is readable SHALL be used in order. Under either selection mode, a
library name SHALL resolve from the first manifest in the chain that names it, so the first
manifest extends rather than replaces the installed manifest and MAY override a shipped library.
A missing searched candidate is not an error. Finding no manifest at all SHALL remain non-fatal —
a program that imports only baked-in libraries runs unaffected — and the resulting failure SHALL
be reported by import resolution, naming the unresolved library.

Every user-facing `emit` door SHALL accept `--no-manifest-chain`. When present, only the
highest-priority manifest selected by the procedure above SHALL be used and no later readable
candidate SHALL extend it. Thus `--manifest FILE --no-manifest-chain` SHALL provide the
single-manifest behavior formerly implied by `--manifest FILE`. The missing-explicit-manifest rule
SHALL remain unchanged when chaining is disabled.

**Paths inside a manifest.** A relative path appearing in a manifest entry — a library's
`(source …)`, a program entry's `(source …)`, and a program entry's `(output …)` — SHALL be
resolved against the directory containing the manifest in which it appears, not against the
current working directory. An absolute path SHALL be used as given. A manifest therefore carries
its own library sources with it and resolves identically no matter which directory the door is
invoked from. When manifests chain, each entry SHALL be resolved against **its own** manifest's
directory, so entries inherited from a later candidate continue to name that candidate's sources.

**Narration.** Each door SHALL narrate which manifest or manifests it resolved, on standard error,
in the project's tool-output format, suppressed at `EMIT_VERBOSITY=quiet` and never altering
standard output. When more than one candidate is in use, the narration SHALL name each in
resolution order, whether the first manifest was discovered or explicit, so which libraries are in
scope is answerable without tracing the lookup.

The manifest MAY additionally contain **program entries** of the form
`(program NAME (source S) [(output O)])`, where `NAME` is a bare symbol naming a
deliverable program, `source` names its top-level source file, and the optional
`output` names the delivered executable path. A program entry names a build target,
not a library: it is never a target of `import`, and reading the manifest to resolve
library imports SHALL ignore program entries (library resolution is unchanged by
their presence). Manifest reading SHALL accept a manifest that mixes library and
program entries in any order. **Program-entry lookup SHALL NOT chain**: a program name is resolved
against the first resolved manifest only, so a name that manifest does not define is reported
against that file rather than searched for in an installed one.

#### Scenario: Manifest resolves a library name to its source

- **WHEN** the manifest contains an entry mapping `(mylib)` to a source file and the build
  path resolves `(import (mylib))`
- **THEN** the library's source is located via the manifest and its artifacts are written
  under the configured (default `build/`) directory

#### Scenario: An unresolved import is reported

- **WHEN** a program (or library) imports `(nope)` and no manifest in the resolved chain has an
  entry for `(nope)`
- **THEN** the build path reports a compile-time error naming the missing library

#### Scenario: A project manifest keeps the installed standard libraries

- **WHEN** Emit is installed under a prefix, and a program importing `(scheme inexact)` is run from
  a project directory whose own `./emit-libs.scm` names only that project's own entries
- **THEN** `(scheme inexact)` resolves through the installed manifest reached by a later searched
  candidate, and the project's manifest needs no entry and no absolute path for it

#### Scenario: An explicit project manifest keeps the installed standard libraries

- **WHEN** `emit run` is invoked from an unrelated working directory with `--manifest FILE`, where
  `FILE` is a project manifest that names only project entries and the program imports a non-baked
  standard library
- **THEN** the project manifest is first, the installed manifest is chained after it, and the
  standard library resolves without an installed path in `FILE`

#### Scenario: An explicit project build resolves its own program and installed imports

- **WHEN** `emit build NAME --manifest FILE` is invoked from outside the project, `FILE` defines
  program `NAME` with manifest-relative source and output paths, and that program imports
  `(scheme file)` and `(scheme process-context)`
- **THEN** the program and paths resolve only from `FILE`, the standard libraries resolve from the
  installed manifest, and the standalone executable is delivered successfully

#### Scenario: EMIT_MANIFEST chains installed libraries

- **WHEN** `EMIT_MANIFEST` names a readable project manifest, no `--manifest` flag is present, and
  a project source imports a non-baked standard library absent from that project manifest
- **THEN** the environment-selected manifest is first and the import resolves from a later
  installed manifest

#### Scenario: An explicit manifest excludes the unrelated working directory manifest

- **WHEN** `--manifest FILE` selects one project's manifest while the current working directory
  contains a different `./emit-libs.scm`
- **THEN** the current working directory manifest is not consulted for either libraries or programs

#### Scenario: A project entry overrides a shipped library of the same name

- **WHEN** the first project manifest names a library that the installed manifest also names
- **THEN** the project's entry is the one used, and its relative `(source …)` resolves against the
  project's manifest directory

#### Scenario: An explicitly named manifest is not extended

- **WHEN** `--manifest FILE --no-manifest-chain` selects a readable project manifest and a program
  imports a library absent from `FILE` but present in the installed manifest
- **THEN** the import is reported as unresolved because only `FILE` is used

#### Scenario: A program name is resolved against the first manifest only

- **WHEN** `emit build NAME --manifest FILE` selects a project manifest with no program `NAME`,
  while a later installed manifest contains a program entry with that name
- **THEN** the door reports no program entry in `FILE` and does not search the installed manifest

#### Scenario: (scheme base) needs no manifest entry on any door

- **WHEN** the auto-import of `(scheme base)` (or an explicit `(import (scheme base))`) is
  resolved on any door against a manifest that does not name it
- **THEN** it resolves against the registered baked member and the compile proceeds, with no
  error naming `(scheme base)` as missing from the manifest

#### Scenario: (scheme base) resolves through the manifest

- **WHEN** the repository's own manifest names `(scheme base)` and the internal substrate, and the
  Chez-hosted driver resolves them from it
- **THEN** the driver locates them through the manifest and builds them from the committed `.sld`
  sources, compiled and loaded like any other library unit, as before
- **AND** a Chez-free door reading the same manifest resolves those two entries to the baked members
  it already registered, so neither is loaded a second time

#### Scenario: A program entry is parsed and does not affect library resolution

- **WHEN** the manifest mixes `(library (mylib) (source …))` and
  `(program my-app (source "app.scm"))` entries and a build resolves `(import (mylib))`
- **THEN** `(mylib)` resolves through the manifest exactly as before and the program
  entry is ignored during library resolution

#### Scenario: A program entry is resolvable by name

- **WHEN** the manifest contains `(program my-app (source "app.scm") (output "build/app"))`
  and the program `my-app` is looked up
- **THEN** the manifest yields its source (`app.scm`) and output (`build/app`), each resolved
  against the directory containing that manifest

#### Scenario: An installed manifest is found from an unrelated directory

- **WHEN** a door is invoked from a directory containing no `emit-libs.scm`, and a manifest is
  installed at `<prefix>/share/emit/emit-libs.scm` beside the running executable
- **THEN** the installed manifest is located through the executable-relative candidate and its
  libraries resolve, so a program importing a non-baked-in standard library runs successfully

#### Scenario: A symlinked executable locates its installed manifest

- **WHEN** the running executable is reached through a symbolic link whose own directory has no
  `../share/emit/emit-libs.scm`, while the link's target directory does
- **THEN** the executable's real path is resolved first, so the manifest beside the real binary
  is the one found

#### Scenario: Manifest sources resolve against the manifest's own directory

- **WHEN** a manifest at `<dir>/emit-libs.scm` maps `(mylib)` to the relative source
  `"mylib.sld"`, and a door is invoked from a different current working directory
- **THEN** the source is read from `<dir>/mylib.sld`, and the same manifest resolves identically
  regardless of the directory the door was invoked from

#### Scenario: An explicitly named manifest that is missing is reported

- **WHEN** `--manifest FILE` (or `EMIT_MANIFEST`) names a file that does not exist
- **THEN** the door reports that named file as missing and does not fall through to
  `./emit-libs.scm` or to an installed manifest

#### Scenario: The resolved manifest is narrated

- **WHEN** a door resolves one or more manifests at default verbosity
- **THEN** it names each resolved manifest path in resolution order on standard error, including
  `[chained]` and supplying-manifest narration for an installed fallback, and at
  `EMIT_VERBOSITY=quiet` those lines are absent while standard output is byte-identical either way
