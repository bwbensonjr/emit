## ADDED Requirements

### Requirement: A library unit compiled from disk is cached on the identity of its source

A library whose source is read from disk SHALL be cached and reused across processes on the same
terms as the baked set, keyed on the identity of the compiler **and** the identity of its source.
The identity of its source SHALL cover the library's own file and every file the include family read
while loading it, so that a change to an included fragment invalidates the entry as surely as a
change to the library itself.

The set of files an entry was built from SHALL be recorded in the entry, so that validating an entry
requires no compilation and no prediction of what the library would include if it were compiled
again.

#### Scenario: A user library is not recompiled on every invocation

- **WHEN** a program importing a user library is run twice through `emit run`, with nothing changed
  in between
- **THEN** the second invocation reuses the cached unit rather than recompiling it, and produces the
  same result

#### Scenario: Editing the library invalidates its entry

- **WHEN** a user library's own source is changed and a program importing it is run again
- **THEN** the entry is not reused, the library is recompiled, and the program observes the change

#### Scenario: Editing an included fragment invalidates its entry

- **WHEN** a file that a user library `include`s is changed, while the library's own file is
  untouched, and a program importing it is run again
- **THEN** the entry is not reused, the library is recompiled, and the program observes the change

#### Scenario: A library that includes nothing is still cached

- **WHEN** a user library with no include declarations is compiled and then reused
- **THEN** the entry is valid and reused, its recorded source set naming only the library's own file

### Requirement: A shaken unit is a distinct entry that is never served as a full unit

A unit pruned to a program's root set SHALL be cached as an entry of its own, keyed on the identity
of the compiler, the identity of the unit's source, and the root set it was pruned to. An entry
holding a pruned unit SHALL NOT be reusable where an unpruned unit is required, and the distinction
SHALL be a property of how entries are located rather than a convention observed by callers.

#### Scenario: Rebuilding the same program reuses the shaken unit

- **WHEN** the same program is built twice with `emit build`, with nothing changed in between
- **THEN** the second build reuses the pruned units rather than pruning them again, and delivers an
  executable with the same behavior

#### Scenario: A different program does not reuse another's shaken unit

- **WHEN** two programs reaching different subsets of a library are built in turn
- **THEN** each is served the unit pruned to its own root set, and neither is served the other's

#### Scenario: An open-world door never reads a shaken entry

- **WHEN** `emit repl` or `emit run` seeds a session after `emit build` has populated shaken entries
  for the same library and compiler
- **THEN** the session is seeded from full units, and every binding of that library remains available
  regardless of what any program referenced

## MODIFIED Requirements

### Requirement: A cache entry is valid only for the compiler that produced it

A cache entry SHALL record the identity of the compiler that produced it and SHALL be reused only
when that identity still matches. A format version SHALL be recorded alongside it so the entry
layout can be invalidated deliberately.

For the baked standard library, whose source is compiled **into** the binary rather than read from
disk, the running executable's identity SHALL serve as the identity of both the compiler and the
source. For a unit compiled from disk, the executable's identity SHALL serve as the compiler half
only, and the source half SHALL be established separately from the files the unit was built from.

An entry's source identity SHALL be established from the **content** of those files rather than from
their modification times, so that entries behave identically across checkouts, worktrees, and branch
switches, where content is stable and modification times are not.

#### Scenario: A rebuilt compiler is not served a stale entry

- **WHEN** the compiler binary is rebuilt and a door is run again
- **THEN** no entry written by the previous binary is reused, and the baked set is recompiled

#### Scenario: A different binary does not share an entry

- **WHEN** two different `emit` binaries run against the same cache location
- **THEN** neither reuses the other's entry

#### Scenario: A rebuilt compiler invalidates user library entries too

- **WHEN** the compiler binary is rebuilt and a program importing an unchanged user library is run
- **THEN** that library's entry is not reused, and it is recompiled by the new binary

#### Scenario: Touching a source without changing it does not invalidate

- **WHEN** a user library's source file has its modification time updated while its content is
  unchanged, and a program importing it is run again
- **THEN** the entry is still reused

### Requirement: The cache never changes what a door produces

A door's observable result SHALL NOT depend on whether the cache was warm, cold, or absent. For the
same inputs, the emitted IR, the delivered executable's behavior, the session environment imports
resolve against, and every diagnostic SHALL be identical in all three states. This SHALL hold for
every kind of entry — the baked set, a unit compiled from disk, and a unit pruned to a root set.

#### Scenario: Emitted IR is identical cold and warm

- **WHEN** the same program is compiled with an empty cache and again with a warm cache
- **THEN** the emitted IR is byte-identical between the two runs

#### Scenario: A program importing a user library compiles identically cold and warm

- **WHEN** a program importing a user library is compiled with an empty cache and again warm
- **THEN** the emitted IR is byte-identical between the two runs

#### Scenario: A delivered executable does not depend on cache state

- **WHEN** the same program is built with an empty cache and again with a warm cache
- **THEN** both executables behave identically and are built from the same unit IR

#### Scenario: A cached session resolves the same names

- **WHEN** one session is seeded from a cached baked set and another by compiling it
- **THEN** both resolve the same standard-library names to the same bindings, and initialize the
  set's members in the same order

#### Scenario: Diagnostics do not move

- **WHEN** a program with a compile error is compiled cold and warm
- **THEN** the same diagnostic is reported in both cases

### Requirement: Cache reuse is narrated

Each door SHALL report whether each unit it needed was reused or recompiled, and name the reason when
it recompiles, following the project's narration convention: narration on stderr, controllable
through verbosity, concise by default.

Narration SHALL name the library a message concerns and distinguish a full unit from one pruned to a
root set, so that a door reusing several entries and rebuilding one reports which is which.

#### Scenario: Reuse and rebuild are distinguishable

- **WHEN** a door runs with a warm cache, and again after the entry is invalidated
- **THEN** the narration reports the reused set as reused, and the invalidated one as recompiled
  together with the reason

#### Scenario: A mixed build names each unit

- **WHEN** a build reuses some units and recompiles others in the same invocation
- **THEN** each message names the library it concerns, and a recompiled one carries its reason

#### Scenario: Narration stays on stderr

- **WHEN** a door that emits data on stdout runs with narration enabled
- **THEN** cache narration appears on stderr and does not contaminate stdout
