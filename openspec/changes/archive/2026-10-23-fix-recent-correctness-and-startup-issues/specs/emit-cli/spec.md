## ADDED Requirements

### Requirement: Build can prepare the shipped standard libraries

`emit build --stdlib` SHALL prepare the baked library set and all non-baked entries in Emit's shipped default manifest without user source or a program executable. It SHALL prepare portable IR and native objects for the default `-O1` JIT profile, use the payload belonging to the invoked Emit, and ignore ambient project manifests and library roots. Help SHALL describe this mode and its cache destination policy.

#### Scenario: Prepare libraries from an unrelated directory

- **WHEN** an installed Emit runs `emit build --stdlib` from a directory containing no project
- **THEN** it prepares the shipped default-manifest libraries, including their compile-time interfaces, and exits zero after verifying cache persistence
- **AND** it reads no stdin, runs no program or library initializer, and creates no program executable

#### Scenario: Project configuration cannot change the warm set

- **WHEN** a project manifest, `EMIT_MANIFEST`, or `EMIT_LIBRARY_PATH` supplies conflicting library definitions
- **THEN** `emit build --stdlib` still prepares the invoked Emit's own shipped libraries

#### Scenario: Incompatible build arguments are rejected

- **WHEN** `--stdlib` is combined with a program name, source file, `-o`, resolver-selection flags, a JIT optimization option, or stage-dump flags
- **THEN** `emit build` names the incompatible arguments on stderr and exits non-zero without warming or building

#### Scenario: Help and narration follow CLI conventions

- **WHEN** the user requests `emit build --help` or `emit help build`
- **THEN** identical help on stdout describes ordinary builds and `--stdlib`
- **AND** a warm invocation respects `-q`, `-v`, and `EMIT_VERBOSITY`, with status on stderr and no payload on stdout

## MODIFIED Requirements

### Requirement: Doctor reports effective installation and toolchain settings

`emit doctor` SHALL report Emit and build-time LLVM versions, executable and prefix locations, effective cc/clang path and version, libgc include/library locations, and runtime/discovery support files. It SHALL identify overrides, discovered values, and compiled defaults, distinguish unavailable from unknown versions, and identify an upstream AOT clang older than build-time LLVM. Apple clang's vendor major SHALL NOT be compared with upstream LLVM majors; its textual-IR compatibility SHALL be reported as unverified without alone failing doctor. Missing settings SHALL NOT prevent reporting other findings.

#### Scenario: Override and fallback origins are visible

- **WHEN** explicit native toolchain settings override discovery or discovery uses compiled defaults
- **THEN** doctor reports the effective values and their origins using the same precedence as `emit build`

#### Scenario: Missing dependency produces a complete report

- **WHEN** native discovery cannot find a usable compiler, libgc inputs, or required support files
- **THEN** doctor names each missing or invalid item, continues the remaining checks, and exits non-zero

#### Scenario: An incompatible AOT compiler is diagnosed

- **WHEN** the effective AOT compiler is upstream clang with a major older than Emit's build-time LLVM
- **THEN** doctor reports both versions, explains the textual-IR compatibility problem, and exits non-zero

#### Scenario: Apple clang has a separate compatibility status

- **WHEN** discovery selects Apple clang 21 for an Emit built with LLVM 23 and every required installation check passes
- **THEN** doctor identifies Apple clang and its version, reports textual-IR compatibility as unverified, and exits zero
- **AND** it performs no compilation and does not change compiler selection

#### Scenario: Apple clang does not hide other failures

- **WHEN** Apple clang is selected but a required support file or native dependency is missing
- **THEN** doctor still reports the missing item and exits non-zero
