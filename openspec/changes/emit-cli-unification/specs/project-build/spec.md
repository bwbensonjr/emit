## MODIFIED Requirements

### Requirement: emit build matches the AOT door

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
the run door uses. `emit run` SHALL expose this via a `--resolve-program NAME` mode
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

## REMOVED Requirements

### Requirement: emit is additive and renames nothing

**Reason**: Superseded by the emit CLI unification (slice #1). The additive,
build-only `emit` of slice #2 deliberately deferred the CLI-naming decision; that
decision is now "rename now" — `emit` becomes the sole entry point and the old
binaries are removed. Preserving a "renames nothing" guarantee would contradict this
change.

**Migration**: Replace `bin/scheme-compile SRC -o OUT` with `emit build NAME` (or emit
the source's IR and link it directly); replace `scheme-run` with `emit run` and
`repl-host` with `emit repl`. See the `emit-cli` capability.
