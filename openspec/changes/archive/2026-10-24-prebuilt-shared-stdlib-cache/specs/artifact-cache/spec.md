## REMOVED Requirements

### Requirement: The cache is available from an installed emit, not only a checkout

**Reason**: It forbade an installation from carrying any compiled artifact. An installation may now
carry a shared library cache prepared by its own executable, so the requirement is replaced by
"An installed emit caches in a user location and never writes its installation", which keeps every
other guarantee.

**Migration**: Nothing to migrate. Installations without a shared cache behave exactly as before; the
user cache location and resolution are unchanged.

## MODIFIED Requirements

### Requirement: Native objects are derived locally and narrated separately

Native objects SHALL be created by ordinary commands only in the same user-writable cache hierarchy
used by an installed or in-checkout Emit, and SHALL NOT be written into the installation tree by any
command other than explicit shared-cache preparation. A native object in a shared cache SHALL be
admitted only under the same environment identity checks as one in the user cache. Cache narration
SHALL distinguish portable IR reuse, native-object reuse, and native-object generation, name the
library and JIT profile concerned, write narration only to standard error, and obey
`EMIT_VERBOSITY`.

#### Scenario: An installed command derives an object on its machine

- **WHEN** an installed `emit` without a matching shared native object first imports a library and
  later imports it again under a matching environment
- **THEN** the first process derives the native object in a user-writable cache and the later process
  reuses it without modifying the installation

#### Scenario: Quiet mode hides native-cache narration

- **WHEN** a native object is generated or reused under `EMIT_VERBOSITY=quiet`
- **THEN** no native-cache narration is written and the program's standard output is unchanged

#### Scenario: A shared object from another CPU is not admitted

- **WHEN** a shared cache holds a native object recorded for a different CPU or target features than
  the running host
- **THEN** that object is not admitted, the library's portable IR is still reused from the shared
  cache if valid, and a native object for this host is generated into the user cache

## ADDED Requirements

### Requirement: An installed emit caches in a user location and never writes its installation

The cache SHALL work when `emit` is run from an installation rather than a repository checkout, using
a user-writable location resolved identically in both cases, so that no code path exists only for
installed users. Every entry an ordinary command writes SHALL be derived locally, on demand, and
regenerable from source. No ordinary command SHALL write into the installation tree, including its
shared cache.

#### Scenario: An installed emit caches on first use

- **WHEN** an installed `emit` with no shared cache runs a program twice from a directory outside any
  checkout
- **THEN** the first run populates a cache in a user-writable location and the second reuses it

#### Scenario: Ordinary commands never write into the installation

- **WHEN** `emit run`, `emit repl`, `emit build`, and `emit lib` run from an installation that
  carries a shared cache, including when an entry misses and is regenerated
- **THEN** the installation tree, shared cache included, is byte-identical before and after

### Requirement: An installation's shared cache is a disposable accelerator

An installation MAY carry a read-only shared cache prepared by the installed executable. An
installation whose shared cache is absent, deleted, stale, or unreadable SHALL behave exactly as one
that never had a shared cache, apart from compilation time, and SHALL report no error.

#### Scenario: Removing the shared cache leaves a working installation

- **WHEN** an installation's shared cache directory is deleted and a program importing shipped
  libraries is run
- **THEN** the program produces the same output, compiling the libraries and caching them in the
  user-writable location

#### Scenario: An unreadable shared cache is transparent

- **WHEN** the shared cache directory or one of its entries cannot be read
- **THEN** the command completes normally through the user cache or source compilation and reports
  no error

### Requirement: The shared cache is consulted before the user cache

An installed Emit SHALL look for an entry in its shared cache before the user cache. A valid shared
entry SHALL be reused without compiling. Any other shared entry SHALL be a miss that continues to the
user cache and then to source compilation. Entries produced after a miss SHALL be written only to
the user cache.

#### Scenario: A packaged first run reuses prepared libraries

- **WHEN** an installation whose shared cache was prepared by its own executable on this host runs
  `emit run` on a program importing shipped libraries, with an empty user cache
- **THEN** the shipped libraries' portable and native entries are reused from the shared cache and
  none is compiled
- **AND** the user cache gains no entry for those libraries

#### Scenario: A shared miss is filled in the user cache

- **WHEN** a library or profile has no valid shared entry, for example `-O2` against a shared cache
  prepared for `-O1`
- **THEN** the command compiles it and stores the result in the user cache, and a later process
  reuses the user-cache entry

#### Scenario: Observing compilation bypasses the shared cache

- **WHEN** a command requests library-stage output with `--dump-all` while a valid shared entry
  exists
- **THEN** it prints the same stages as a cold run

### Requirement: Shared entries obey every user-cache validity rule

A shared entry SHALL be valid only under the rules a user-cache entry obeys: compiler identity,
source content, dependency generations, format version, completeness, and, for native objects, the
full execution environment.

#### Scenario: A stale shared cache falls through

- **WHEN** the shared cache was prepared by a different executable than the one running
- **THEN** no shared entry is reused, and the command behaves as it would with no shared cache

#### Scenario: A corrupt shared entry is refused

- **WHEN** a shared entry is truncated or inconsistent with its metadata
- **THEN** nothing from it is registered, and the command continues with the user cache or source

### Requirement: The shared cache location can be overridden or disabled

The shared cache SHALL default to a directory inside the running executable's installed payload, so
a checkout build has none. `EMIT_SHARED_CACHE` set to a path SHALL select that directory instead,
and set to the empty string SHALL disable the shared cache.

#### Scenario: The shared cache is disabled

- **WHEN** `EMIT_SHARED_CACHE` is set to the empty string
- **THEN** no shared entry is consulted

#### Scenario: The shared cache is relocated

- **WHEN** `EMIT_SHARED_CACHE` names a directory
- **THEN** that directory is consulted as the shared cache instead of the installation's own

#### Scenario: A checkout has no shared cache by default

- **WHEN** a checkout build runs with `EMIT_SHARED_CACHE` unset
- **THEN** no shared cache is consulted

### Requirement: Shared preparation builds a complete new cache

`emit build --stdlib --shared` SHALL prepare the same portable IR, compile-time interfaces, and
default-profile native objects as `emit build --stdlib`, into the invoked executable's shared cache
location. It SHALL produce every entry anew, without reusing the user cache or the previous shared
cache, and SHALL make the result readable by every user.

#### Scenario: Preparation produces a cache other users reuse

- **WHEN** `emit build --stdlib --shared` succeeds for an installation and a different user then runs
  that installation's `emit repl` with an empty user cache
- **THEN** that user's session reuses the shared entries without compiling the shipped libraries

#### Scenario: Re-preparation discards entries of an earlier executable

- **WHEN** an installation is reinstalled with a rebuilt executable and its shared cache prepared
  again
- **THEN** the shared cache holds only entries produced by the new executable

### Requirement: Shared preparation replaces the shared cache only when complete

Shared preparation SHALL replace any previous shared cache only after the new one is complete, so an
interrupted or failed preparation leaves the previous shared cache or none, never a partial one. It
SHALL exit non-zero and name the failure when compilation, native generation, persistence, or
replacement fails.

#### Scenario: Preparation into an unwritable location fails clearly

- **WHEN** the shared cache location or its parent cannot be written
- **THEN** the command names the destination, exits non-zero, and leaves any previous shared cache in
  place

#### Scenario: An interrupted preparation leaves no partial cache

- **WHEN** shared preparation is stopped before it completes
- **THEN** the shared cache location holds the previous complete cache or nothing, and a later
  preparation succeeds

### Requirement: Cache narration names the tier an entry came from

Reuse narration SHALL state whether a reused portable or native entry came from the shared cache or
the user cache, and verbose narration SHALL distinguish a shared-cache miss from a user-cache miss.
This narration SHALL follow the existing cache narration rules: standard error only, obeying
`EMIT_VERBOSITY`, and never altering standard output.

#### Scenario: Tiers are distinguishable in verbose narration

- **WHEN** a command run at verbose verbosity reuses one library from the shared cache and another
  from the user cache
- **THEN** each reuse message names its library and its tier

#### Scenario: Standard output is unchanged by the tier

- **WHEN** the same program runs once served from the shared cache and once with the shared cache
  disabled
- **THEN** its standard output is byte-identical
