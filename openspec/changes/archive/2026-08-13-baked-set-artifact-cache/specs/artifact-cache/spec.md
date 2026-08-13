## Purpose

Lets the Chez-free doors reuse the already-compiled standard library instead of recompiling it from
source at every process start. The cache is a pure accelerator: it is keyed so a stale entry cannot
be used, and every failure path falls back to compiling from source.

## ADDED Requirements

### Requirement: The baked standard library is compiled once and reused across processes

The Chez-free doors (`emit run`, `emit build`, `emit lib`, `emit repl`) SHALL reuse an
already-compiled baked standard library rather than recompiling it from the binary's baked-in source
at every process start. Reuse SHALL require no access to any library source, resting on the compiled
unit modules plus the compile-time interface each publishes.

The baked set SHALL be cached and invalidated **as a whole**, in the dependency order its partition
declares, because a member may import another and a set that is individually fresh but mutually
inconsistent would be unusable.

#### Scenario: A second invocation does not recompile the standard library

- **WHEN** a trivial program is run twice through `emit run`, with nothing changed in between
- **THEN** the second invocation reuses the cached standard library, and its wall clock approaches
  the `--no-prelude` floor rather than paying the from-source compile again

#### Scenario: The first invocation populates the cache

- **WHEN** a door runs with an empty cache
- **THEN** it compiles from source, succeeds, and leaves an entry that a later process reuses

#### Scenario: Every door benefits

- **WHEN** each of `emit run`, `emit build`, `emit lib`, and `emit repl` is invoked twice
- **THEN** each one's second invocation reuses the cached set

### Requirement: A cache entry is valid only for the compiler that produced it

A cache entry SHALL record the identity of the compiler that produced it and SHALL be reused only
when that identity still matches. Because the baked standard library's source is compiled **into**
the binary rather than read from disk, the running executable's identity SHALL serve as the identity
of both the compiler and the source. A format version SHALL be recorded alongside it so the entry
layout can be invalidated deliberately.

#### Scenario: A rebuilt compiler is not served a stale entry

- **WHEN** the compiler binary is rebuilt and a door is run again
- **THEN** no entry written by the previous binary is reused, and the baked set is recompiled

#### Scenario: A different binary does not share an entry

- **WHEN** two different `emit` binaries run against the same cache location
- **THEN** neither reuses the other's entry

### Requirement: The cache never changes what a door produces

A door's observable result SHALL NOT depend on whether the cache was warm, cold, or absent. For the
same inputs, the emitted IR, the delivered executable's behavior, the session environment imports
resolve against, and every diagnostic SHALL be identical in all three states.

#### Scenario: Emitted IR is identical cold and warm

- **WHEN** the same program is compiled with an empty cache and again with a warm cache
- **THEN** the emitted IR is byte-identical between the two runs

#### Scenario: A cached session resolves the same names

- **WHEN** one session is seeded from a cached baked set and another by compiling it
- **THEN** both resolve the same standard-library names to the same bindings, and initialize the
  set's members in the same order

#### Scenario: Diagnostics do not move

- **WHEN** a program with a compile error is compiled cold and warm
- **THEN** the same diagnostic is reported in both cases

### Requirement: Every cache failure degrades to compiling from source

A cache miss, a stale entry, a corrupt or unreadable entry, a missing cache directory, or a cache
location that cannot be created or written SHALL cause the door to compile from source and complete
normally. No door SHALL acquire a failure mode it did not have before the cache existed, and the
cache SHALL NOT be required for correctness on any path.

A metadata entry that cannot be read, or that is inconsistent with the units stored beside it, SHALL
be refused whole rather than partially applied, so that falling back to a from-source compile always
begins from an unmodified session.

#### Scenario: An unwritable cache location still permits every door to work

- **WHEN** the cache location cannot be created or written
- **THEN** each door compiles from source and completes normally, reporting no error

#### Scenario: A corrupt entry is not trusted

- **WHEN** a cache entry is truncated or otherwise unreadable
- **THEN** the door ignores it, recompiles from source, and completes normally

#### Scenario: A partially applicable entry leaves the session unchanged

- **WHEN** an entry's metadata is readable but inconsistent with the units stored beside it
- **THEN** nothing from that entry is registered, and the door compiles from source

#### Scenario: A read-only installation works

- **WHEN** `emit` runs from a read-only installation with no writable cache location available
- **THEN** every door behaves exactly as it does today

### Requirement: The cache is available from an installed emit, not only a checkout

The cache SHALL work when `emit` is run from an installation rather than a repository checkout, using
a location that does not require the install tree to be writable, and resolved identically in both
cases so that no code path exists only for installed users. The install contract SHALL remain
unchanged: no compiled artifact is shipped or installed, and every entry is derived locally, on
demand, and regenerable from source.

#### Scenario: An installed emit caches on first use

- **WHEN** an installed `emit` runs a program twice from a directory outside any checkout
- **THEN** the first run populates a cache in a user-writable location and the second reuses it

#### Scenario: Installation ships no compiled artifact

- **WHEN** `emit` is installed
- **THEN** the installed tree contains no compiled library unit, and a cache entry exists only after
  a door has run

### Requirement: Cache reuse is narrated

Each door SHALL report whether the baked set was reused or recompiled, and name the reason when it
recompiles, following the project's narration convention: narration on stderr, controllable through
verbosity, concise by default.

#### Scenario: Reuse and rebuild are distinguishable

- **WHEN** a door runs with a warm cache, and again after the entry is invalidated
- **THEN** the narration reports the reused set as reused, and the invalidated one as recompiled
  together with the reason

#### Scenario: Narration stays on stderr

- **WHEN** a door that emits data on stdout runs with narration enabled
- **THEN** cache narration appears on stderr and does not contaminate stdout
