# Spec Delta

## MODIFIED Requirements

### Requirement: Single `emit` binary is the sole user-facing entry point

The project SHALL ship one compiled `emit` binary that is the sole user-facing entry
point to the compiler's four compilation commands and its diagnostic command. It SHALL
dispatch on its first argument (the *verb*) to `lib`, `build`, `run`, `repl`, or
`doctor`, and SHALL report a usage error naming the known verbs when given an unknown
or missing verb. Top-level help and version requests SHALL be handled before verb
dispatch. The previously separate entry points (`build/scheme-run`, `build/repl-host`,
`bin/scheme-compile`, and the `bin/emit` bash wrapper) SHALL be removed; no user-facing
invocation depends on them.

#### Scenario: A verb dispatches to its command

- **WHEN** the user runs `emit run`, `emit repl`, `emit build`, `emit lib`, or `emit doctor`
- **THEN** the corresponding command executes

#### Scenario: An unknown verb is an error

- **WHEN** the user runs `emit frobnicate` (or `emit` with no verb)
- **THEN** it prints a usage error naming the known verbs (`lib`, `build`, `run`,
  `repl`, `doctor`) and exits non-zero

#### Scenario: The old entry points are gone

- **WHEN** the repository is built
- **THEN** no `build/scheme-run`, `build/repl-host`, `bin/scheme-compile`, or
  `bin/emit` is produced or required; every command is reached through `emit <verb>`

## ADDED Requirements

### Requirement: Top-level version reports the built compiler identity

`emit --version` SHALL print `emit <VERSION> (LLVM <LLVM_VERSION>)` followed by a newline on stdout and exit zero. LLVM_VERSION SHALL identify the LLVM used to build Emit, independent of tools currently on PATH. The request SHALL require no source, library resolution, toolchain discovery, or JIT initialization. Verbosity SHALL NOT change these stdout bytes. Extra arguments SHALL be rejected as usage errors.

#### Scenario: Version works without an installed source tree

- **WHEN** a runnable Emit binary is invoked with `--version` from an unrelated directory with no discoverable native toolchain or library sources
- **THEN** it reports its compiled Emit and LLVM versions and exits zero

#### Scenario: Runtime discovery does not redefine build identity

- **WHEN** PATH contains a different LLVM major from the one used to build Emit
- **THEN** `emit --version` continues to identify the build-time LLVM version

#### Scenario: Version rejects ignored arguments

- **WHEN** `emit --version extra` is invoked
- **THEN** it reports a usage error on stderr and exits non-zero

### Requirement: Doctor reports effective installation and toolchain settings

`emit doctor` SHALL report Emit and build-time LLVM versions, executable and prefix locations, effective cc/clang path and version, libgc include/library locations, and runtime/discovery support files. It SHALL identify overrides, discovered values, and compiled defaults, distinguish unavailable from unknown versions, and identify an AOT clang older than build-time LLVM. Missing settings SHALL NOT prevent reporting other findings.

#### Scenario: Override and fallback origins are visible

- **WHEN** explicit native toolchain settings override discovery or discovery uses compiled defaults
- **THEN** doctor reports the effective values and their origins using the same precedence as `emit build`

#### Scenario: Missing dependency produces a complete report

- **WHEN** native discovery cannot find a usable compiler, libgc inputs, or required support files
- **THEN** doctor names each missing or invalid item, continues the remaining checks, and exits non-zero

#### Scenario: An incompatible AOT compiler is diagnosed

- **WHEN** the effective AOT compiler is clang with a major older than Emit's build-time LLVM
- **THEN** doctor reports both versions, explains the textual-IR compatibility problem, and exits non-zero

### Requirement: Doctor exposes the actual library provider order

Doctor SHALL accept `--manifest`, repeatable `-L`/`--library-path`, `--no-manifest-chain`, and `--no-library-paths` and honor `EMIT_MANIFEST` and `EMIT_LIBRARY_PATH` as compilation commands do. Its report SHALL list effective manifest and directory providers in lookup order, label their origins and availability, and identify disabled tiers. It SHALL use the same resolver rules as library compilation.

#### Scenario: Project overrides and installed fallbacks are shown in order

- **WHEN** doctor runs with an explicit project manifest, explicit and environment roots, and a relocated installation
- **THEN** its provider order matches an equivalent compilation, including the executable-relative installed tier before the compiled-prefix tier

#### Scenario: Resolver controls change the report

- **WHEN** doctor is invoked with either resolver opt-out flag
- **THEN** disabled providers are excluded from effective lookup and the report identifies the disabled tier

#### Scenario: Invalid resolver configuration fails legibly

- **WHEN** doctor receives a missing explicit manifest or an empty `EMIT_LIBRARY_PATH` element
- **THEN** it reports the same configuration error as compilation, marks the provider report incomplete, and exits non-zero

### Requirement: Doctor is a read-only diagnostic command

Doctor SHALL write its requested human-readable report to stdout at every verbosity, with narration and errors on stderr under `EMIT_VERBOSITY`. It SHALL compile no Scheme, write no artifacts, install nothing, and perform no network access. It SHALL exit zero when required installation checks pass, non-zero for failures, and treat absent optional providers as informational.

#### Scenario: Healthy installation leaves no artifacts

- **WHEN** doctor checks an installation with usable native dependencies, required support files, and shipped library providers
- **THEN** it exits zero without modifying the installation, project, or artifact cache
- **AND** stdout is identical at quiet, default, and verbose levels for the same settings

#### Scenario: Optional provider absence is informational

- **WHEN** a healthy relocated installation has no project manifest or project `lib/` and its old compiled prefix is absent
- **THEN** doctor describes those absences and still exits zero

#### Scenario: Missing shipped library payload is a failure

- **WHEN** no installed or checkout provider supplies the required shipped library payload
- **THEN** doctor identifies the incomplete installation and exits non-zero

### Requirement: Diagnostic command help follows the CLI conventions

Top-level usage SHALL list `doctor` and `--version`. `emit doctor --help`, `emit doctor -h`, and `emit help doctor` SHALL print identical doctor-specific usage on stdout and exit zero. Doctor SHALL reject unknown options and extra positional arguments with the command name and offending argument on stderr and a non-zero exit.

#### Scenario: Doctor has discoverable help

- **WHEN** any supported doctor help spelling is requested
- **THEN** usage lists diagnostic scope, resolver controls, output streams, and exit status without running checks

#### Scenario: Doctor rejects a mistyped option

- **WHEN** `emit doctor --bogus` or `emit doctor input.scm` is invoked
- **THEN** the command reports the offending argument on stderr, writes no report to stdout, and exits non-zero
