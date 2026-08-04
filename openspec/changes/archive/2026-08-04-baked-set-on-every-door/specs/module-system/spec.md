## MODIFIED Requirements

### Requirement: The baked library set is a partition emitted in dependency order

The compiler's baked-in prelude source SHALL be compiled into a **set** of libraries described by
the declared partition, not into a single fixed library. The portable derivation SHALL emit each
partition member as its own `define-library` — with its own export list, its own body forms, and an
`import` of the members it depends on — and SHALL emit them in dependency order, so a member is
compiled and initialized after everything it imports.

Every member of the baked set SHALL be reachable **without a manifest**, exactly as `(scheme base)`
is: the guarantee that a program importing only `(scheme base)` (or importing nothing) needs no
manifest present SHALL extend to whatever `(scheme base)` itself imports. A library the baked set
depends on SHALL NOT be resolved through the manifest.

**Every door SHALL register the baked set before it consults the manifest.** This holds for the AOT
door, the run door, the REPL door, and the compile-unit (`emit lib`) door alike: a door SHALL NOT
require a manifest entry to obtain the standard library, and the directory a door is invoked from
SHALL NOT determine whether the standard library is available. Registration makes each member's
export table and declared imports known to the compile session, so a program or library that imports
a baked member resolves it with no file access.

A door with no program entry to drive initialization — the REPL — SHALL additionally run each
registered member's initializer exactly once, in the dependency order the members were emitted in,
before it evaluates any user form. A door that emits a program SHALL continue to leave initialization
to the program's entry, which calls each `__init` in topological order as an AOT executable does.

**A manifest entry naming a member of the baked set SHALL resolve to the baked member** rather than
loading a second copy of that library. The determination SHALL be by library name, so it covers every
member of the set rather than an enumerated subset. A manifest that names a baked member SHALL
therefore remain valid on every door and SHALL contribute no additional module, and a manifest that
names none SHALL work equally well.

A baked library MAY import another baked library. All doors — the AOT door, the REPL door's eager
preload, the run door's lazy import closure, and the auto-import — SHALL handle a baked library that
has imports, and SHALL continue to emit byte-identical modules across doors for the same program.

#### Scenario: A program with no imports needs no manifest, still

- **WHEN** a program that imports nothing (or only `(scheme base)`) is run from a directory with no
  manifest present, after the prelude has been partitioned into more than one baked library
- **THEN** it compiles and runs exactly as before, with no manifest consulted and no library
  resolution failure

#### Scenario: The baked set initializes in dependency order

- **WHEN** a program is compiled and the baked set contains a library that `(scheme base)` imports
- **THEN** that library's module is emitted before `(scheme base)`, its initializer runs before
  `(scheme base)`'s, and each initializer runs exactly once

#### Scenario: Door parity survives partitioning

- **WHEN** the same program is compiled through the AOT door, the run door, and the Chez-hosted
  driver against the same partition
- **THEN** the emitted program module is byte-identical across all three, as it was before the
  prelude was partitioned

#### Scenario: Every door has the standard library without a manifest entry for it

- **WHEN** each of the four doors is exercised in a directory whose manifest names only a project's
  own libraries and no member of the baked set
- **THEN** every door resolves `(scheme base)`, so a program referencing a standard-library name
  compiles and runs, a REPL session resolves that name, and a library importing `(scheme base)`
  compiles to its artifact

#### Scenario: A manifest entry for a baked member loads no second copy

- **WHEN** a door starts against a manifest that names `(scheme base)` and the internal substrate,
  after the baked set has been registered
- **THEN** each baked member contributes exactly one module to the session, the manifest entry
  resolves to the baked member, and no duplicate-symbol failure occurs

#### Scenario: The REPL initializes the baked set before the first form

- **WHEN** a REPL session starts with the prelude enabled and the user's first form calls a
  standard-library procedure
- **THEN** each baked member's initializer has already run, in dependency order, and the call
  observes populated globals

### Requirement: REPL door — import a library interactively

The interactive REPL SHALL obtain the standard library by registering the **baked set** at session
startup — not from the manifest — and SHALL run each registered member's initializer once, in
dependency order, before evaluating any user form. The manifest SHALL be consulted only for libraries
outside the baked set. A session started in a directory whose manifest names no member of the baked
set SHALL therefore have the standard library and the derived-form macros, and SHALL be able to load
a library that imports `(scheme base)`.

The REPL SHALL, on evaluating `(import (<lib>))`, resolve the library and its
transitive dependencies through the manifest, load each unit module into the running session
in dependency order, invoke each unit's `@"L:__init"` exactly once, and merge the imported
library's export table into the session scope so subsequent forms may reference the imported
names. A dependency that is a member of the baked set SHALL be satisfied by the registered member
rather than requiring a manifest entry.

The REPL door SHALL remain **eager** over the manifest's remaining libraries: a session is an open
world in which any prompt may import anything, so the laziness of the run door does not apply.

#### Scenario: Imported procedure is callable in the REPL

- **WHEN** the user evaluates `(import (mylib))` and then calls `greet` in a later form
- **THEN** the REPL loads `mylib`, initializes it once, and the later form returns the value
  `greet` produces

#### Scenario: A transitive dependency is loaded and initialized in the REPL

- **WHEN** the user evaluates `(import (a))` where `(a)` imports `(b)`
- **THEN** the REPL loads both `b` and `a` in dependency order, initializes each once, and a
  later form calling an export of `(a)` that relies on `(b)` returns the expected value

#### Scenario: A session in a project directory has the standard library

- **WHEN** `emit repl` starts in a directory whose manifest names only that project's own libraries
- **THEN** a form calling a `(scheme base)` procedure such as `map` returns its value, and a
  derived form such as `cond` expands, with no warning that the standard library is unloaded

#### Scenario: A project library importing (scheme base) loads in the REPL

- **WHEN** a manifest names one project library whose source declares `(import (scheme base))`, and
  the user evaluates `(import (thatlib))`
- **THEN** the library's import of `(scheme base)` resolves against the registered baked member, the
  unit loads and initializes, and calling its export returns the expected value

#### Scenario: A substrate name stays out of scope in a session

- **WHEN** a REPL session starts with the prelude enabled and the user references an internal
  substrate name such as `rd-atom` without importing the substrate
- **THEN** the form reports an unbound variable, because registering a baked member does not
  auto-import one that nothing auto-imports

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

**Locating the manifest.** Every door SHALL locate the manifest by the same ordered procedure,
taking the first candidate that exists and is readable:

1. the `--manifest FILE` argument, when the door accepts one and it is given;
2. the `EMIT_MANIFEST` environment variable, when set;
3. `./emit-libs.scm`, relative to the current working directory;
4. `<dir of the resolved real path of the running executable>/../share/emit/emit-libs.scm`,
   where the executable's path SHALL be resolved through symbolic links so that a symlinked
   launcher locates the manifest installed beside the real binary;
5. a compiled-in installation default, `<install prefix>/share/emit/emit-libs.scm`.

Candidates 1 and 2 are explicit requests: when either is given but names a file that does not
exist, the door SHALL report that named file as missing rather than silently falling through to a
later candidate. Candidates 3–5 are searched, so a missing candidate is not an error. Finding no
manifest at all SHALL remain non-fatal — a program that imports only baked-in libraries runs
unaffected — and the resulting failure SHALL be reported by import resolution, naming the
unresolved library.

**Paths inside a manifest.** A relative path appearing in a manifest entry — a library's
`(source …)`, a program entry's `(source …)`, and a program entry's `(output …)` — SHALL be
resolved against the directory containing the manifest in which it appears, not against the
current working directory. An absolute path SHALL be used as given. A manifest therefore carries
its own library sources with it and resolves identically no matter which directory the door is
invoked from.

**Narration.** Each door SHALL narrate which manifest it resolved, on standard error, in the
project's tool-output format, suppressed at `EMIT_VERBOSITY=quiet` and never altering standard
output.

The manifest MAY additionally contain **program entries** of the form
`(program NAME (source S) [(output O)])`, where `NAME` is a bare symbol naming a
deliverable program, `source` names its top-level source file, and the optional
`output` names the delivered executable path. A program entry names a build target,
not a library: it is never a target of `import`, and reading the manifest to resolve
library imports SHALL ignore program entries (library resolution is unchanged by
their presence). Manifest reading SHALL accept a manifest that mixes library and
program entries in any order.

#### Scenario: Manifest resolves a library name to its source

- **WHEN** the manifest contains an entry mapping `(mylib)` to a source file and the build
  path resolves `(import (mylib))`
- **THEN** the library's source is located via the manifest and its artifacts are written
  under the configured (default `build/`) directory

#### Scenario: An unresolved import is reported

- **WHEN** a program (or library) imports `(nope)` and the manifest has no entry for `(nope)`
- **THEN** the build path reports a compile-time error naming the missing library

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

- **WHEN** a door resolves a manifest at default verbosity
- **THEN** it names the resolved manifest path on standard error, and at
  `EMIT_VERBOSITY=quiet` that line is absent while standard output is byte-identical either way
