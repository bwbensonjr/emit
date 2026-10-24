## MODIFIED Requirements

### Requirement: Build can prepare the shipped standard libraries

`emit build --stdlib` SHALL prepare the baked library set and all non-baked entries in Emit's shipped default manifest without user source or a program executable. It SHALL prepare portable IR and native objects for the default `-O1` JIT profile, use the payload belonging to the invoked Emit, and ignore ambient project manifests and library roots. By default it SHALL prepare the user cache; with `--shared` it SHALL instead prepare the invoked Emit's shared cache. Help SHALL describe this mode, the `--shared` variant, and their cache destination policies.

#### Scenario: Prepare libraries from an unrelated directory

- **WHEN** an installed Emit runs `emit build --stdlib` from a directory containing no project
- **THEN** it prepares the shipped default-manifest libraries, including their compile-time interfaces, and exits zero after verifying cache persistence
- **AND** it reads no stdin, runs no program or library initializer, and creates no program executable

#### Scenario: A valid shared cache satisfies user preparation

- **WHEN** `emit build --stdlib` runs for an installation whose shared cache already holds valid entries for this executable and host
- **THEN** it reports those entries as reused from the shared cache, writes no duplicate of them into the user cache, and exits zero

#### Scenario: Prepare the installation's shared cache

- **WHEN** `emit build --stdlib --shared` runs with write access to the installation's shared cache location
- **THEN** it prepares the shipped libraries into that location, names it as the destination, and exits zero

#### Scenario: Project configuration cannot change the warm set

- **WHEN** a project manifest, `EMIT_MANIFEST`, or `EMIT_LIBRARY_PATH` supplies conflicting library definitions
- **THEN** `emit build --stdlib`, with or without `--shared`, still prepares the invoked Emit's own shipped libraries

#### Scenario: Incompatible build arguments are rejected

- **WHEN** `--stdlib` is combined with a program name, source file, `-o`, resolver-selection flags, a JIT optimization option, or stage-dump flags, or `--shared` is given without `--stdlib`
- **THEN** `emit build` names the incompatible arguments on stderr and exits non-zero without warming or building

#### Scenario: Help and narration follow CLI conventions

- **WHEN** the user requests `emit build --help` or `emit help build`
- **THEN** identical help on stdout describes ordinary builds, `--stdlib`, and `--shared`
- **AND** a warm invocation respects `-q`, `-v`, and `EMIT_VERBOSITY`, with status on stderr and no payload on stdout

## ADDED Requirements

### Requirement: Doctor reports the library cache locations

`emit doctor` SHALL report the effective user cache location, and the shared cache location with its origin: installation, `EMIT_SHARED_CACHE`, or disabled. For the shared cache it SHALL report presence, entry count, and whether the running executable produced it. The shared cache's state SHALL NOT by itself make doctor exit non-zero, and doctor SHALL NOT compile or modify any cache entry to report it.

#### Scenario: A packaged installation reports a matching shared cache

- **WHEN** doctor runs from an installation whose shared cache was prepared by the installed executable
- **THEN** it reports the shared cache path, its entry count, and that it matches this executable

#### Scenario: A stale or absent shared cache is visible but not fatal

- **WHEN** doctor runs with a shared cache prepared by a different executable, or with none
- **THEN** it reports the shared cache as stale or absent and otherwise exits as it would without the shared cache

#### Scenario: A disabled shared cache is labeled

- **WHEN** doctor runs with `EMIT_SHARED_CACHE` set to the empty string
- **THEN** it reports the shared cache as disabled by the environment
