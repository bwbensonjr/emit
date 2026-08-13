## Purpose

Lets the Chez-free doors reuse a library unit that has already been compiled, instead of
recompiling the standard library and every imported library from source at every process start.
The cache is a pure accelerator: it is keyed so a stale entry cannot be used, and every failure
path falls back to compiling from source.

## ADDED Requirements

### Requirement: A compiled library unit is reused across processes

The Chez-free doors (`emit run`, `emit build`, `emit lib`, `emit repl`) SHALL reuse a previously
compiled library unit rather than recompiling it, for both the baked standard library and each user
library reached through a program's import closure. Reuse SHALL require no access to the library's
source, resting on the unit module plus its export table as the module system already specifies.

#### Scenario: A second invocation does not recompile the standard library

- **WHEN** a trivial program is run twice through `emit run`, with nothing changed in between
- **THEN** the second invocation reuses the cached standard library, and its wall clock approaches
  the `--no-prelude` floor rather than paying the from-source compile again

#### Scenario: A user library in the import closure is reused

- **WHEN** a program importing a user library is compiled twice, with no source changed
- **THEN** the second compile reuses the cached unit for that library instead of recompiling its
  `.sld`

#### Scenario: The first invocation populates the cache

- **WHEN** a door runs with an empty cache
- **THEN** it compiles from source, succeeds, and leaves a cache entry that a later process reuses

### Requirement: A cache entry is valid only for the compiler and sources that produced it

A cache entry SHALL record the identity of the compiler that produced it and the identity of every
source that contributed to it, and SHALL be reused only when both still match. A change to the
compiler, to a library's source, or to any file that library reached through `include`,
`include-ci`, or `include-library-declarations` SHALL invalidate the entry. For the baked standard
library — whose source is compiled into the binary rather than read from disk — the binary's own
identity SHALL serve as the source identity.

#### Scenario: A rebuilt compiler invalidates every entry

- **WHEN** the compiler is rebuilt and a door is run again
- **THEN** no entry from the previous compiler is reused, and the units are recompiled

#### Scenario: Editing a library source invalidates its entry

- **WHEN** a user library's source is edited and a program importing it is compiled again
- **THEN** that library's unit is recompiled and the stale entry is not used

#### Scenario: Editing an included file invalidates the entry that included it

- **WHEN** a file reached through `include` is edited and the including library is compiled again
- **THEN** that library's unit is recompiled

### Requirement: The cache never changes what a door produces

A door's observable result SHALL NOT depend on whether the cache was warm, cold, or absent. For the
same inputs, the emitted IR, the delivered executable's behavior, the session environment a REPL or
run door resolves imports against, and every diagnostic SHALL be identical in all three states. The
cache SHALL therefore be verifiable by comparing a cold-cache run against a warm-cache run.

#### Scenario: Emitted IR is identical cold and warm

- **WHEN** the same program is compiled with an empty cache and again with a warm cache
- **THEN** the emitted IR is byte-identical between the two runs

#### Scenario: A cached session resolves the same names

- **WHEN** a REPL session is seeded from cached units and another from freshly compiled ones
- **THEN** both resolve the same set of standard-library names to the same bindings

#### Scenario: Diagnostics do not move

- **WHEN** a program with a compile error is compiled cold and warm
- **THEN** the same diagnostic is reported in both cases

### Requirement: Every cache failure degrades to compiling from source

A cache miss, a stale entry, a corrupt or unreadable entry, a missing cache directory, or a cache
location that cannot be created or written SHALL cause the door to compile from source and complete
normally. No door SHALL acquire a failure mode it did not have before the cache existed, and the
cache SHALL NOT be required for correctness on any path.

#### Scenario: An unwritable cache location still permits every door to work

- **WHEN** the cache location cannot be written
- **THEN** each door compiles from source and completes normally, reporting no error

#### Scenario: A corrupt entry is not trusted

- **WHEN** a cache entry is truncated or otherwise unreadable
- **THEN** the door ignores it, recompiles from source, and completes normally

#### Scenario: A read-only installation works

- **WHEN** `emit` is run from an installation whose files are read-only and no writable cache
  location is available
- **THEN** every door behaves exactly as it does today

### Requirement: The cache is available from an installed emit, not only a checkout

The cache SHALL work when `emit` is run from an installation rather than a repository checkout,
using a location that does not require the install tree to be writable. The install contract SHALL
remain unchanged: no compiled artifact is shipped or installed, and every cache entry is derived
locally, on demand, and regenerable from source.

#### Scenario: An installed emit caches on first use

- **WHEN** an installed `emit` runs a program twice from a directory outside any checkout
- **THEN** the first run populates a cache in a user-writable location and the second reuses it

#### Scenario: Installation ships no compiled artifact

- **WHEN** `emit` is installed
- **THEN** the installed tree contains no compiled library unit, and the cache is created only by
  running a door

### Requirement: Cache reuse is narrated

Each door SHALL report whether a unit was reused or recompiled, and name the reason when it
recompiles, following the project's narration convention: narration on stderr, controllable through
verbosity, concise by default.

#### Scenario: Reuse and rebuild are distinguishable

- **WHEN** a door runs with a warm cache and again after invalidating one entry
- **THEN** the narration reports the reused units as reused, and reports the invalidated one as
  recompiled together with the reason it was recompiled

#### Scenario: Narration stays on stderr

- **WHEN** a door that emits data on stdout runs with narration enabled
- **THEN** cache narration appears on stderr and does not contaminate stdout
