# Spec Delta

## ADDED Requirements

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

## MODIFIED Requirements

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
