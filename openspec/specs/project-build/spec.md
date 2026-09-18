# project-build Specification

## Purpose
TBD - created by archiving change emit-build-bin-entry. Update Purpose after archive.
## Requirements
### Requirement: emit build resolves a manifest program entry

The `emit` binary SHALL provide a `build` verb that builds a standalone executable
from a program named in the manifest. Invoked as `emit build [NAME]`, it SHALL
resolve the manifest's `(program NAME …)` entry to its source file, build that
source through the shipped Chez-free AOT path (`bin/scheme-compile`: `scheme-run
--emit` + clang), and deliver the resulting native executable to the entry's
configured output path. The resolution of the program entry SHALL itself be
Chez-free. This slice does not tree-shake: full library units are linked, as the
Chez-free AOT path does today.

When the manifest contains exactly one program entry, `NAME` MAY be omitted and that
entry SHALL be selected. When `NAME` is omitted and the manifest has zero or more
than one program entry, `emit build` SHALL report an error naming the available
program entries.

The manifest SHALL be located the same way the other paths locate it: the
`EMIT_MANIFEST` environment variable if set, otherwise `--manifest FILE` if given,
otherwise the default `emit-libs.scm`.

#### Scenario: Build the sole program entry by name

- **WHEN** the manifest contains `(program my-app (source "app.scm") (output "build/app"))`
  and the user runs `emit build my-app`
- **THEN** `app.scm` is resolved through the manifest, built through the release ship
  path, and a standalone executable is delivered at `build/app`

#### Scenario: Build the sole program entry with the name omitted

- **WHEN** the manifest has exactly one program entry and the user runs `emit build`
- **THEN** that program entry is selected and built as if its name had been given

#### Scenario: Ambiguous or missing program name is an error

- **WHEN** the user runs `emit build` and the manifest has zero, or more than one,
  program entries
- **THEN** `emit build` reports an error naming the available program entries and
  builds nothing

#### Scenario: Unknown program name is an error

- **WHEN** the user runs `emit build nope` and the manifest has no `(program nope …)`
  entry
- **THEN** `emit build` reports a compile-time error naming the missing program and
  builds nothing

### Requirement: emit build distinguishes why no program entry could be resolved

When `emit build` is asked to build a named manifest target and cannot resolve its program entry, it
SHALL report whether no manifest was found, a found manifest declares no entries, or a found
manifest declares no program entry, and SHALL exit nonzero without terminating on a signal.

These manifest-entry diagnostics SHALL apply only to a bare target name. A path-shaped or
`.scm`-suffixed operand SHALL use direct-source mode and SHALL report source-read or compilation
errors instead of a missing-program-entry diagnostic.

#### Scenario: emit build with no manifest reports the filename it looked for

- **WHEN** `emit build my-app` runs with no manifest available
- **THEN** it reports that no manifest was found, names `emit-libs.scm`, and exits nonzero

#### Scenario: emit build with an entryless manifest names it

- **WHEN** `emit build my-app` runs with an empty, whitespace-only, or comment-only manifest
- **THEN** it names that manifest and says it declares no entries

#### Scenario: emit build with a library-only manifest is unchanged

- **WHEN** `emit build my-app` runs with a manifest containing libraries but no program entry
- **THEN** it reports `no program entry in manifest <path>`

#### Scenario: A source path given where an entry name belongs does not crash

- **WHEN** `emit build hello.scm` runs with no manifest or with an entryless manifest
- **THEN** it treats `hello.scm` as source, does not request a program entry, and either delivers it
  or reports a source-specific error

### Requirement: Delivered executable defaults its output path from the program name

A `(program NAME …)` entry MAY omit the `(output O)` clause. When omitted, `emit
build` SHALL derive the delivered executable's path from `NAME` (a stable default
under the build directory), so that a minimal program entry naming only a source is
buildable.

#### Scenario: Output path defaults from the program name

- **WHEN** the manifest contains `(program my-app (source "app.scm"))` with no
  `output` clause and the user runs `emit build my-app`
- **THEN** the executable is delivered to a default path derived from `my-app`

### Requirement: emit build matches the AOT path

A program built through `emit build` SHALL produce a standalone executable whose
observable behavior is identical to building that same source directly through the
AOT compile-and-link pipeline (emit the program IR, then link the runtime and units
with `clang`) with the same manifest. `emit build` resolves the program entry and then
runs that pipeline within the `emit` binary; it introduces no second compilation path.

#### Scenario: emit build and a direct AOT build agree

- **WHEN** a program with library imports is built once via `emit build NAME` and once
  by emitting its resolved source's IR and linking it directly, with the same manifest
- **THEN** both executables run and produce the identical value

### Requirement: The manifest program resolver is Chez-free

Resolving a `(program NAME …)` entry to its source and output SHALL be performed by
the embedded compiler with no dependency on Chez, reusing the same manifest machinery
the `emit run` command uses. `emit run` SHALL expose this via a `--resolve-program NAME` mode
that reads the manifest (`--manifest` > `EMIT_MANIFEST` > default `emit-libs.scm`) and
prints the resolved source and output, without JIT-compiling or running any program.

#### Scenario: The resolver prints a program entry's source and output

- **WHEN** the manifest contains `(program my-app (source "app.scm") (output "build/app"))`
  and the user runs `emit run --resolve-program my-app`
- **THEN** it prints the resolved source (`app.scm`) and output (`build/app`) and runs
  nothing

#### Scenario: The resolver reports an unknown program

- **WHEN** the user runs `emit run --resolve-program nope` and the manifest has no
  `(program nope …)` entry
- **THEN** it reports an error naming the missing program and builds/runs nothing

### Requirement: emit build narrates its actions

`emit build` SHALL follow the project output convention (`docs/OUTPUT.md`): it SHALL
announce what it is building, name its resolved inputs (program name, source) and
outputs (delivered executable path), and report the relevant metrics (e.g. final
binary size), with narration on stderr and controllable via `EMIT_VERBOSITY`.

#### Scenario: A build reports its resolved inputs and outputs

- **WHEN** the user runs `emit build my-app` at the default verbosity
- **THEN** the tool announces the program name, the resolved source, and the delivered
  executable path with its size on stderr

### Requirement: emit build delivers a direct source program without a manifest entry

`emit build` SHALL accept a source operand ending in `.scm` or containing a path separator as an
application source rather than a manifest program name. It SHALL build that source through the same
Chez-free AOT pipeline and shared hybrid library resolver as a named program. `-o OUTPUT` SHALL
override the delivered path; otherwise the output SHALL default beneath `build/` from the source
basename with its final `.scm` suffix removed.

Named manifest program entries SHALL remain supported and unchanged. A bare operand that is neither
path-shaped nor `.scm`-suffixed SHALL continue to mean a manifest program name, preserving existing
targets without filesystem-dependent ambiguity.

#### Scenario: A one-file application builds without a manifest

- **WHEN** the user runs `emit build main.scm` in a directory with no manifest and `main.scm`
  imports only baked libraries
- **THEN** Emit delivers `build/main` through the normal AOT pipeline

#### Scenario: A direct application imports conventional project and shipped libraries

- **WHEN** `main.scm` imports a project library beneath `./lib` and a non-baked standard library
  beneath the installed root
- **THEN** `emit build main.scm` resolves both through the shared provider order and delivers a
  working executable without library mappings or a program entry

#### Scenario: Output can be selected directly

- **WHEN** the user runs `emit build app/main.scm -o dist/my-app`
- **THEN** the executable is delivered at `dist/my-app`

#### Scenario: A bare target still resolves through the manifest

- **WHEN** the user runs `emit build my-app`
- **THEN** `my-app` is interpreted as a manifest program name exactly as before
