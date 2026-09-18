# Spec Delta

## ADDED Requirements

### Requirement: Conventional library names resolve beneath ordered library roots

For a library name whose components can be represented safely as path components, the shared
resolver SHALL derive a relative source path by rendering each component, joining the components
with the host path separator, and appending `.sld` to the final component. Symbol components SHALL
be rejected from conventional lookup when their names are empty, `.`, `..`, contain a path
separator, or contain a NUL; exact nonnegative integer components SHALL be rendered in decimal.
Names ineligible for conventional lookup SHALL remain resolvable through an exact manifest entry.

For example, `(my stats)` SHALL derive `my/stats.sld`, and `(example net 2)` SHALL derive
`example/net/2.sld`. The resolver SHALL test the derived relative path beneath each configured root
in order and SHALL use the first readable regular file. It SHALL parse the selected source and
require its sole `define-library` form to declare the requested library name before admitting any
artifact or binding from it.

Library discovery SHALL be a host responsibility. The compiler core SHALL continue to perform no
filesystem access and SHALL receive the selected source, source-home, imports, and compile-time
interfaces through the existing path protocol.

#### Scenario: A conventional project library resolves without a mapping

- **WHEN** a configured root contains `my/stats.sld`, that file declares `(define-library (my stats)
  ...)`, and a program imports `(my stats)` with no manifest entry for it
- **THEN** the shared resolver selects that file and the program compiles without a manual
  name-to-source mapping

#### Scenario: Roots are searched in order

- **WHEN** two configured roots both contain a valid `my/stats.sld`
- **THEN** the file beneath the earlier root is selected and the later file is not read

#### Scenario: A declared name mismatch is rejected

- **WHEN** conventional lookup for `(my stats)` selects `my/stats.sld` but that source declares
  `(define-library (other stats) ...)`
- **THEN** resolution fails with a diagnostic naming the requested name, declared name, and selected
  source path, and no artifact from that source is used

#### Scenario: A path-unsafe name requires an exact mapping

- **WHEN** an imported library name contains a component that conventional lookup cannot represent
  safely and no manifest entry names it
- **THEN** resolution reports the library as unresolved without probing a path outside a configured
  root

### Requirement: every path uses one resolved library identity

The Chez driver and the `run`, `build`, `lib`, and `repl` paths SHALL apply the same provider
precedence, conventional path derivation, declaration-name validation, import-closure ordering, and
source-home rules. Once a provider resolves a library, every path SHALL compile that source through
the existing shared compile-unit core, preserving deterministic unit-qualified symbols, compile-time
export interfaces, artifact freshness, tree shaking, and byte-identical full unit IR.

An artifact SHALL continue to be identified by the declared library name, compiler identity, source
content and included-source content, and any existing root-set input for a pruned unit. The provider
kind or spelling by which the same source was reached SHALL NOT create semantically different
artifacts.

#### Scenario: Manifest and path resolution produce the same unit

- **WHEN** one invocation resolves a library through an exact manifest entry and another resolves
  the same source through a conventional root under otherwise identical inputs
- **THEN** both produce byte-identical full unit IR and compile-time interfaces

#### Scenario: REPL and delivered program agree for a path library

- **WHEN** a conventional-path library is imported and exercised in `emit repl`, then the same
  program and resolver configuration are used by `emit build`
- **THEN** both observe identical values, macro expansion, dependency initialization order, and
  once-only initialization

#### Scenario: A warm cache does not change provider precedence

- **WHEN** a cache contains a unit previously reached through one provider but the current resolver
  selects a different source for the same non-baked name
- **THEN** the cache entry is reused only if its recorded source identity matches the selected
  source; otherwise the selected source is compiled

## MODIFIED Requirements

### Requirement: AOT path — build and link an importing program

An import-aware build path SHALL resolve a program's imports and each library's imports through the
shared hybrid resolver, build the transitive dependency graph, reject import cycles with a
compile-time error, compile each unit against the import environment built from its dependencies'
export tables, and link the program module, every unit in the transitive closure, and the runtime
into a single working executable in dependency order. A library that is not in the program's
transitive import closure SHALL NOT be linked.

#### Scenario: A program importing a library builds and runs

- **WHEN** the build path is run on a program that imports `(mylib)`, resolved through either an
  exact manifest entry or a conventional library root, and prints the result of `greet`
- **THEN** it produces an executable that prints the value `greet` returns

#### Scenario: A transitive import chain builds and runs

- **WHEN** the build path runs a program importing `(a)`, where `(a)` imports `(b)` and the two
  libraries are resolved by any supported providers
- **THEN** it compiles `(b)`, `(a)`, and the program, links all three plus the runtime, and the
  executable runs correctly

#### Scenario: An import cycle is reported

- **WHEN** the resolved graph has `(a)` importing `(b)` and `(b)` importing `(a)`
- **THEN** the build reports a compile-time error naming the cycle rather than looping or linking

### Requirement: REPL — import a library interactively

The interactive REPL SHALL obtain the standard library by registering the baked set at startup. It
SHALL eagerly register libraries enumerated by resolved manifests, preserving startup validation of
those exact entries. A library available only through a conventional root SHALL instead be resolved
and registered when a prompt first imports it; its transitive dependencies SHALL be resolved and
registered dependency-first before the import is committed.

On evaluating `(import (<lib>))`, the REPL SHALL ensure the selected library and its dependency
closure are registered, initialize every not-yet-initialized member in dependency order, and merge
the imported library's runtime exports and compile-time interface into the session scope. A baked
dependency SHALL be satisfied by the registered baked member. Every library initializer SHALL run
at most once, and a failed resolution, registration, compilation, or initialization SHALL leave the
requested library's names out of scope while the session remains usable.

#### Scenario: A conventional library is registered on first import

- **WHEN** a session has a library root containing `my/tools.sld`, no manifest names `(my tools)`,
  and the user enters `(import (my tools))`
- **THEN** the REPL resolves, compiles or cache-loads, registers, initializes, and imports `(my
  tools)`, after which its procedures and macros are available

#### Scenario: An unimported conventional library is untouched

- **WHEN** a configured root contains a malformed or unreadable library that no prompt imports
- **THEN** the REPL reaches and retains its prompt without reading or reporting that source

#### Scenario: A manifest library retains startup validation

- **WHEN** a manifest explicitly names an unreadable or invalid library source
- **THEN** the REPL reports that entry during eager startup registration as before

#### Scenario: A transitive path dependency initializes first

- **WHEN** a prompt imports a conventional-path `(a)` whose source imports conventional-path `(b)`
- **THEN** both are registered, `(b)` initializes before `(a)`, each initializes once, and `(a)`'s
  exports observe `(b)`'s populated bindings

#### Scenario: Imported procedure is callable in the REPL

- **WHEN** the user imports `(mylib)` through any provider and calls `greet` in a later form
- **THEN** the REPL initializes the library once and returns the value `greet` produces

#### Scenario: Imported macro is usable in a later form

- **WHEN** the user imports a macro-exporting library through any provider and uses its macro later
- **THEN** the macro expands and remains available for subsequent forms

#### Scenario: A failed form does not lose an imported macro

- **WHEN** a macro is imported, a later form fails to compile, and another form uses the macro
- **THEN** rollback of the failed form retains the imported transformer

#### Scenario: A transitive dependency is loaded and initialized in the REPL

- **WHEN** the user imports `(a)` where `(a)` imports `(b)`, with either library resolved by any
  enabled provider
- **THEN** both register and initialize dependency-first and `(a)` observes `(b)`'s values

#### Scenario: A session in a project directory has the standard library

- **WHEN** a REPL starts in a project whose providers name no baked member
- **THEN** `(scheme base)` procedures and macros remain available from the baked set

#### Scenario: A project library importing (scheme base) loads in the REPL

- **WHEN** a project library resolved through a manifest or root imports `(scheme base)`
- **THEN** its dependency resolves from the baked set and its export works after interactive import

#### Scenario: A substrate name stays out of scope in a session

- **WHEN** a session references an internal substrate name without explicitly importing it
- **THEN** the name remains unbound regardless of library providers

### Requirement: `emit run` command — run an importing program in-process (Chez-free)

The in-process runner (`emit run`) SHALL resolve a program's imports and each library's imports
through the shared hybrid resolver, build the transitive dependency graph, reject cycles, load each
unit in dependency order, invoke each initializer exactly once, and compile and run the program
against its dependencies' export tables, all without Chez or a second resolution path.

A program importing only baked libraries SHALL require neither a manifest nor a library root. A
non-baked library absent from every enabled provider SHALL be reported by name. A library outside
the program's transitive closure SHALL NOT be loaded into the program's initialization sequence and
SHALL have no observable effect.

#### Scenario: A program importing a library runs in-process

- **WHEN** `emit run` executes a program importing `(mylib)` and an enabled root contains a matching
  `mylib.sld`
- **THEN** it loads and initializes the library and prints the program's value

#### Scenario: A transitive import chain runs in-process

- **WHEN** a project path library imports a shipped library resolved from an installed provider
- **THEN** the runner loads both dependency-first and produces the expected value

#### Scenario: An import cycle is reported

- **WHEN** the resolved import graph contains a cycle
- **THEN** `emit run` reports the cycle rather than looping and exits nonzero

#### Scenario: A program with no user imports is unaffected

- **WHEN** a program imports only baked libraries or nothing, with no manifest or project library
  root present
- **THEN** it behaves as before and requires no discovery configuration

#### Scenario: `--manifest` outranks the environment variable

- **WHEN** `emit run` receives `--manifest FILE` while `EMIT_MANIFEST` names another manifest
- **THEN** `FILE` supplies the first exact manifest provider, as before

### Requirement: `emit run` command matches the AOT path (dev→ship fidelity)

A program run through `emit run` with a given resolver configuration SHALL produce the same value as
the same program built and run through `emit build` with that configuration. The emitted program
module and each imported unit's module SHALL be byte-for-byte identical across the run and AOT
paths because all providers feed the same compile-unit core.

#### Scenario: run-path value matches AOT-path value

- **WHEN** an importing program is run and built with the same manifests, library roots, and
  conventional-lookup policy
- **THEN** the two printed values are identical

#### Scenario: A unit's module bytes match across the run and AOT paths

- **WHEN** a library is loaded by the `emit run` command and compiled for the AOT link from the same resolved
  source
- **THEN** the two unit modules are byte-for-byte identical

### Requirement: Library manifest

A manifest SHALL remain a readable s-expression configuration file containing exact library entries
of the form `(library NAME (source S) [(artifacts DIR)])` and optional program entries. An exact
library entry SHALL override conventional lookup for that name within the same resolution tier and
SHALL support names or layouts that conventional derivation cannot represent. Compiled artifacts
SHALL continue to default under the build directory.

every path SHALL locate manifests using the existing precedence: `--manifest FILE`, then
`EMIT_MANIFEST`, then `./emit-libs.scm`, then executable-relative and compiled-prefix installed
candidates. Explicit missing manifests SHALL remain errors; searched missing candidates SHALL remain
nonfatal. Explicit selection SHALL skip an unrelated `./emit-libs.scm`, and readable installed
manifests SHALL extend the selected project unless `--no-manifest-chain` is given. Program lookup
SHALL remain confined to the first manifest.

Library providers SHALL be ordered by tier: baked members; the first project manifest's exact
entries; explicit `-L` roots in command-line order; `EMIT_LIBRARY_PATH` roots in listed order; the
project conventional root; and then each installed manifest followed by the conventional root
beside it. Within any provider, the first answer wins. This ordering SHALL let project configuration
override a non-baked shipped library while installed providers fill names absent from the project.
A baked member SHALL always win by name and SHALL never be loaded a second time.

The project conventional root SHALL be `lib` beside the first project manifest when one is selected
or discovered, and `./lib` otherwise. Installed conventional roots SHALL be `lib` beside each
installed manifest candidate, including the executable-relative and compiled-prefix locations.
Duplicate physical manifests and roots SHALL be used once at their first position.

`--no-manifest-chain` SHALL retain its existing meaning of suppressing later manifests and SHALL not
silently disable explicit or project library roots. A new `--no-library-paths` option SHALL disable
all conventional-root providers while leaving baked and manifest resolution intact; combining it
with `--manifest FILE --no-manifest-chain` SHALL provide exact single-manifest library resolution.

Relative paths in each manifest SHALL continue to resolve against that manifest's directory. A
relative explicit library root SHALL resolve against the invocation's current directory, while
environment roots SHALL follow the same rule. Every selected provider and successful non-baked
resolution SHALL be narrated on standard error according to `EMIT_VERBOSITY`, naming whether the
source came from a manifest or a conventional root; narration SHALL never alter standard output.

#### Scenario: An exact manifest entry overrides a conventional file

- **WHEN** the project manifest maps `(mylib)` to `vendor/mylib.sld` while the project root also
  contains `mylib.sld`
- **THEN** the manifest source is selected

#### Scenario: A conventional project library overrides an installed library

- **WHEN** no project manifest entry names `(mylib)`, the project root and an installed provider
  both supply it
- **THEN** the project-root source is selected

#### Scenario: An installed shipped library needs no project mapping

- **WHEN** a project imports `(scheme inexact)` without naming it and the installed conventional
  root contains `scheme/inexact.sld`
- **THEN** the installed source resolves and the project manifest, if any, contains no mapping or
  installation path

#### Scenario: Explicit roots preserve their order

- **WHEN** repeated `-L` options provide the same library in two directories
- **THEN** the first option's source wins

#### Scenario: Manifest-only mode disables conventional files

- **WHEN** `--no-library-paths` is present and an imported non-baked library exists only beneath a
  conventional root
- **THEN** the import is unresolved, while exact manifest entries continue to work

#### Scenario: Single-manifest mode remains available

- **WHEN** `--manifest FILE --no-manifest-chain --no-library-paths` is used
- **THEN** non-baked imports resolve only from exact entries in `FILE`

#### Scenario: Program entries remain distinct from libraries

- **WHEN** a manifest mixes library and program entries
- **THEN** import resolution ignores program entries, and named program lookup consults only the
  first manifest

#### Scenario: Relative manifest paths retain their base

- **WHEN** a manifest maps a library to a relative source and the path runs from another directory
- **THEN** the source resolves relative to that manifest

#### Scenario: The selected provider is narrated

- **WHEN** a non-baked library resolves at default verbosity
- **THEN** stderr names the library, source, and provider kind, quiet verbosity omits the narration,
  and stdout is unchanged

#### Scenario: Manifest resolves a library name to its source

- **WHEN** an exact manifest entry maps `(mylib)` to a source and a build imports it
- **THEN** that source is selected and artifacts use the entry's configured or default directory

#### Scenario: An unresolved import is reported

- **WHEN** an imported non-baked library is absent from every enabled manifest and root
- **THEN** resolution reports a compile-time error naming the library

#### Scenario: A project manifest keeps the installed standard libraries

- **WHEN** a project manifest omits `(scheme inexact)` and an installed provider supplies it
- **THEN** the import resolves without an installation path in the project manifest

#### Scenario: An explicit project manifest keeps the installed standard libraries

- **WHEN** `--manifest FILE` selects an out-of-tree project and an installed provider supplies an
  omitted standard library
- **THEN** the project remains first and the standard library resolves from the installed tier

#### Scenario: An explicit project build resolves its own program and installed imports

- **WHEN** a named program comes from an explicit project manifest and imports installed libraries
- **THEN** program paths come only from that first manifest and imports may fall through to installed
  providers

#### Scenario: EMIT_MANIFEST chains installed libraries

- **WHEN** `EMIT_MANIFEST` selects a project manifest that omits an installed standard library
- **THEN** later installed manifest and root providers remain available unless disabled

#### Scenario: An explicit manifest excludes the unrelated working directory manifest

- **WHEN** `--manifest FILE` is used while the current directory contains another manifest
- **THEN** the unrelated current-directory manifest is not a provider

#### Scenario: A project entry overrides a shipped library of the same name

- **WHEN** the first project manifest names a non-baked library also supplied by an installed tier
- **THEN** the project entry wins and its relative source resolves from its own manifest directory

#### Scenario: An explicitly named manifest is not extended

- **WHEN** `--manifest FILE --no-manifest-chain --no-library-paths` is used and an omitted library
  exists only in installed providers
- **THEN** the import is unresolved

#### Scenario: A program name is resolved against the first manifest only

- **WHEN** the first manifest lacks a requested program name but an installed manifest has it
- **THEN** named program lookup reports the first manifest and does not fall through

#### Scenario: (scheme base) needs no manifest entry on any path

- **WHEN** any path auto-imports or explicitly imports `(scheme base)` with no exact entry
- **THEN** the baked member satisfies it without filesystem lookup

#### Scenario: (scheme base) resolves through the manifest

- **WHEN** the Chez bootstrap driver uses a repository manifest entry for `(scheme base)` while a
  Chez-free path has already registered the baked member
- **THEN** the driver can compile the committed source and the Chez-free path admits no second copy

#### Scenario: A program entry is parsed and does not affect library resolution

- **WHEN** a manifest mixes library and program entries
- **THEN** imports ignore program entries and exact library mappings retain their precedence

#### Scenario: A program entry is resolvable by name

- **WHEN** the first manifest contains `(program my-app (source "app.scm") (output "build/app"))`
- **THEN** named lookup returns both paths resolved against that manifest

#### Scenario: An installed manifest is found from an unrelated directory

- **WHEN** no project manifest exists and an installed manifest and root sit beside the real binary
- **THEN** shipped libraries resolve from that installed tier

#### Scenario: A symlinked executable locates its installed manifest

- **WHEN** the running executable is reached through a symlink outside its installation
- **THEN** the real executable path determines its installed manifest and conventional root

#### Scenario: Manifest sources resolve against the manifest's own directory

- **WHEN** an exact entry uses a relative source and the path runs elsewhere
- **THEN** the source resolves against the entry's manifest directory

#### Scenario: An explicitly named manifest that is missing is reported

- **WHEN** `--manifest FILE` or `EMIT_MANIFEST` explicitly names a missing file
- **THEN** that file is reported rather than silently replaced by current-directory configuration

#### Scenario: The resolved manifest is narrated

- **WHEN** one or more manifests participate at default verbosity
- **THEN** stderr names them in order, including chained suppliers, while quiet mode omits the lines
  and stdout remains unchanged
