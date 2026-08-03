## MODIFIED Requirements

### Requirement: Library manifest

Library discovery SHALL be driven by a readable s-expression manifest mapping each library name
to its source file and an optional artifact directory; compiled artifacts SHALL default under a
build directory rather than the source tree. The manifest MAY list any number of libraries.
Resolving an imported library that has no manifest entry SHALL be a compile-time error naming the
missing library. The standard library `(scheme base)` SHALL be resolvable through the manifest like
any other library, so both doors build/load it through the same machinery.

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

#### Scenario: (scheme base) resolves through the manifest

- **WHEN** the auto-import of `(scheme base)` (or an explicit `(import (scheme base))`) is
  resolved
- **THEN** `(scheme base)` is located through the manifest and compiled/loaded like any other
  library unit

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

### Requirement: Run door — run an importing program in-process (Chez-free)

The in-process runner (`emit run`) SHALL resolve a program's imports (and each
library's imports) through the manifest to their sources, build the transitive dependency
graph, reject import cycles with an error, load each unit in the transitive closure into the
running JIT session in dependency order, invoke each unit's initializer exactly once, and
then compile and run the program against the import environment built from its dependencies'
export tables — all without Chez and without a second library-resolution path (it drives the
same manifest resolution and compile-unit core the AOT and REPL doors use).

The manifest SHALL be located by the ordered procedure specified in the **Library manifest**
requirement — `--manifest FILE` first, then `EMIT_MANIFEST`, then `./emit-libs.scm`, then the
executable-relative and installed-prefix candidates — identically to every other door. When no
manifest is found and the program imports only `(scheme base)` (or imports nothing), the runner
SHALL behave exactly as before (no regression), since the manifest is consulted only to resolve a
non-baked-in imported library.

A library that is not in the program's transitive import closure SHALL NOT be initialized
or linked into the program's initialization sequence, so it can have no observable effect on
the run (the in-process JIT may inertly hold a unit's module without ever running its
initializer).

#### Scenario: A program importing a library runs in-process

- **WHEN** `emit run` runs a program that imports `(mylib)` and evaluates `greet`,
  with `(mylib)` listed in the manifest
- **THEN** it loads and initializes `mylib`, runs the program, and prints the value `greet`
  returns

#### Scenario: A transitive import chain runs in-process

- **WHEN** `emit run` runs a program that imports `(a)` where `(a)` imports `(b)`
- **THEN** it loads `(b)` and `(a)` in dependency order, initializes each once, and the
  program's value is printed correctly

#### Scenario: An import cycle is reported

- **WHEN** `emit run` runs a program whose import graph has `(a)` importing `(b)` and
  `(b)` importing `(a)`
- **THEN** it reports an error naming the cycle (or an unresolved/missing-from-manifest
  import) rather than looping, and exits non-zero

#### Scenario: A program with no user imports is unaffected

- **WHEN** `emit run` runs a program that imports only `(scheme base)` or imports
  nothing, with no manifest present
- **THEN** it behaves exactly as before this change — the value is identical and no manifest
  is required

#### Scenario: `--manifest` outranks the environment variable

- **WHEN** `emit run` is given `--manifest FILE` while `EMIT_MANIFEST` is also set to a
  different, existing manifest
- **THEN** the manifest named by `--manifest` is the one used
