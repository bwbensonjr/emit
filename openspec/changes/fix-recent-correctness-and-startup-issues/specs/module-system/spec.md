## MODIFIED Requirements

### Requirement: Library manifest

A manifest SHALL remain a readable s-expression configuration file containing exact library entries
of the form `(library NAME (source S) [(artifacts DIR)])` and optional program entries. An exact
library entry SHALL override conventional lookup for that name within the same resolution tier and
SHALL support names or layouts that conventional derivation cannot represent. Compiled artifacts
SHALL continue to default under the build directory.

Every path SHALL locate manifests using the existing precedence: `--manifest FILE`, then
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
source came from a manifest or a conventional root. At default verbosity, REPL startup SHALL
aggregate provider information into one line identifying the effective manifest and conventional
root locations in precedence order, or identifying the baked-only case, without per-library
resolution lines. Verbose startup SHALL retain manifest, root, chained-provider, and per-library
detail. Interactive resolutions after startup and other commands SHALL retain their existing
narration. Quiet SHALL suppress informational resolution output; narration SHALL never alter
standard output or suppress errors.

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

- **WHEN** a non-baked library resolves at default verbosity outside REPL startup
- **THEN** stderr names the library, source, and provider kind, quiet verbosity omits the narration,
  and stdout is unchanged

#### Scenario: REPL startup summarizes its library sources

- **WHEN** `emit repl` starts with a project manifest and chained installed providers at default verbosity
- **THEN** stderr contains exactly one library-source summary line identifying effective manifest and root locations in order
- **AND** it prints no individual library-resolution lines or separate chained-provider listing
- **AND** the normal banner, prompt, and importable library set retain their behavior

#### Scenario: Detailed startup provenance is available on request

- **WHEN** the same REPL starts with `EMIT_VERBOSITY=verbose` or `-v`
- **THEN** stderr additionally names manifests, conventional roots, and individual selected library sources and provider kinds

#### Scenario: Quiet startup and missing sources remain distinguishable

- **WHEN** the same REPL starts at quiet verbosity
- **THEN** it prints no informational library-resolution output and still reports resolution errors
- **AND** default startup with no filesystem providers names the baked-only source in its single summary

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
- **THEN** stderr names them in order, including chained suppliers, using the single source summary during REPL startup and the existing individual lines elsewhere
- **AND** quiet mode omits informational resolution output and stdout remains unchanged
