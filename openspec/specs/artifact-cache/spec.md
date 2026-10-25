# artifact-cache Specification

## Purpose

Lets the Chez-free commands reuse an already-compiled library unit instead of recompiling it from
source at every process start — the baked standard library, a library read from disk, and a unit
pruned to one program's root set alike. The cache is a pure accelerator: it is keyed so a stale
entry cannot be used, and every failure path falls back to compiling from source.
## Requirements
### Requirement: The baked standard library is compiled once and reused across processes

The Chez-free commands (`emit run`, `emit build`, `emit lib`, `emit repl`) SHALL reuse an
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

- **WHEN** a command runs with an empty cache
- **THEN** it compiles from source, succeeds, and leaves an entry that a later process reuses

#### Scenario: every command benefits

- **WHEN** each of `emit run`, `emit build`, `emit lib`, and `emit repl` is invoked twice
- **THEN** each one's second invocation reuses the cached set

### Requirement: A library unit compiled from disk is cached on the identity of its source

A library whose source is read from disk SHALL be cached and reused across processes on the same
terms as the baked set, keyed on the identity of the compiler **and** the identity of its source.
The identity of its source SHALL cover the library's own file and every file the include family read
while loading it, so that a change to an included fragment invalidates the entry as surely as a
change to the library itself.

The set of files an entry was built from SHALL be recorded in the entry, so that validating an entry
requires no compilation and no prediction of what the library would include if it were compiled
again.

The identity of its source SHALL also cover the answer to every `(library ⟨name⟩)` feature
requirement evaluated while loading it, so that a library whose `cond-expand` chose a clause
because a dependency was or was not resolvable is recompiled once that is no longer so. The answers
SHALL be recorded in the entry alongside the file set, and validating them SHALL require only
library resolution, not compilation.

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

#### Scenario: A newly resolvable dependency invalidates the entry

- **WHEN** a user library's `cond-expand` selected its `else` clause because `(library (srfi 8))`
  was unresolvable, the library was cached, and `srfi/8.sld` is then added under a library root
- **THEN** the next run does not reuse the entry, recompiles the library, and the first clause is
  selected

#### Scenario: An unchanged answer keeps the entry

- **WHEN** a cached library asked `(library (scheme base))` and nothing about its resolution has
  changed
- **THEN** the entry is reused

### Requirement: A shaken unit is a distinct entry that is never served as a full unit

A unit pruned to a program's root set SHALL be cached as an entry of its own, keyed on the identity
of the compiler, the identity of the unit's source, and the root set it was pruned to. An entry
holding a pruned unit SHALL NOT be reusable where an unpruned unit is required, and the distinction
SHALL be a property of how entries are located rather than a convention observed by callers.

Where a unit's root set is derived from emitted IR, the entry's key SHALL cover **all** of the IR
the root set was derived from — the program's IR together with the finalized IR of the units that
import this one — and not the program's IR alone. A unit whose importers were pruned differently
SHALL therefore be served a different entry, even when the program is unchanged.

#### Scenario: Rebuilding the same program reuses the shaken unit

- **WHEN** the same program is built twice with `emit build`, with nothing changed in between
- **THEN** the second build reuses the pruned units rather than pruning them again, and delivers an
  executable with the same behavior

#### Scenario: A different program does not reuse another's shaken unit

- **WHEN** two programs reaching different subsets of a library are built in turn
- **THEN** each is served the unit pruned to its own root set, and neither is served the other's

#### Scenario: An open-world path never reads a shaken entry

- **WHEN** `emit repl` or `emit run` seeds a session after `emit build` has populated shaken entries
  for the same library and compiler
- **THEN** the session is seeded from full units, and every binding of that library remains available
  regardless of what any program referenced

#### Scenario: A unit whose importer was pruned differently is not served a stale entry

- **WHEN** two programs cause the same imported library to be pruned to different retained sets,
  and each therefore imposes a different root set on a library that **it** imports
- **THEN** each build is served the transitively imported unit pruned to its own root set, and
  neither is served the other's

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

- **WHEN** the compiler binary is rebuilt and a command is run again
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

### Requirement: The cache never changes what a command produces

A command's observable result SHALL NOT depend on whether the cache was warm, cold, or absent. For the
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

### Requirement: Every cache failure degrades to compiling from source

A cache miss, a stale entry, a corrupt or unreadable entry, a missing cache directory, or a cache
location that cannot be created or written SHALL cause the command to compile from source and complete
normally. No command SHALL acquire a failure mode it did not have before the cache existed, and the
cache SHALL NOT be required for correctness on any command.

A metadata entry that cannot be read, or that is inconsistent with the units stored beside it, SHALL
be refused whole rather than partially applied, so that falling back to a from-source compile always
begins from an unmodified session.

#### Scenario: An unwritable cache location still permits every command to work

- **WHEN** the cache location cannot be created or written
- **THEN** each command compiles from source and completes normally, reporting no error

#### Scenario: A corrupt entry is not trusted

- **WHEN** a cache entry is truncated or otherwise unreadable
- **THEN** the command ignores it, recompiles from source, and completes normally

#### Scenario: A partially applicable entry leaves the session unchanged

- **WHEN** an entry's metadata is readable but inconsistent with the units stored beside it
- **THEN** nothing from that entry is registered, and the command compiles from source

#### Scenario: A read-only installation works

- **WHEN** `emit` runs from a read-only installation with no writable cache location available
- **THEN** every command behaves exactly as it does today

### Requirement: Cache reuse is narrated

Each command SHALL report whether each unit it needed was reused or recompiled, and name the reason when
it recompiles, following the project's narration convention: narration on stderr, controllable
through verbosity, concise by default.

Narration SHALL name the library a message concerns and distinguish a full unit from one pruned to a
root set, so that a command reusing several entries and rebuilding one reports which is which.

#### Scenario: Reuse and rebuild are distinguishable

- **WHEN** a command runs with a warm cache, and again after the entry is invalidated
- **THEN** the narration reports the reused set as reused, and the invalidated one as recompiled
  together with the reason

#### Scenario: A mixed build names each unit

- **WHEN** a build reuses some units and recompiles others in the same invocation
- **THEN** each message names the library it concerns, and a recompiled one carries its reason

#### Scenario: Narration stays on stderr

- **WHEN** a command that emits data on stdout runs with narration enabled
- **THEN** cache narration appears on stderr and does not contaminate stdout

### Requirement: JIT execution caches relocatable native library objects

The `emit run` and `emit repl` commands SHALL be able to reuse a relocatable native object produced
from a full, open-world library unit instead of parsing, optimizing, and generating machine code
from that unit's LLVM IR in every process. A native object SHALL be derived from the same full unit
and optimization profile that the command would otherwise submit to the JIT, and SHALL remain a
cache accelerator rather than an authoritative or shipped artifact.

Native objects SHALL NOT replace the portable LLVM IR artifacts, SHALL NOT be used as input to the
closed-world `emit build` tree-shaking path, and SHALL NOT be substituted for a unit pruned to a
particular program.

#### Scenario: A second JIT execution reuses native code

- **WHEN** a library is imported through `emit run` or `emit repl`, producing a native object, and
  the same unchanged library is imported again in a later process with the same JIT profile
- **THEN** the later process admits the cached object without parsing, optimizing, or generating
  machine code from that library's LLVM IR

#### Scenario: AOT delivery remains IR-based

- **WHEN** `emit build` delivers a program after JIT execution has populated native objects for its
  libraries
- **THEN** the build continues to tree-shake and optimize its portable IR units and does not link a
  cached full-unit native object in place of them

### Requirement: A native object is valid only for an identical execution environment

A native-object entry SHALL be reusable only when every input that can affect its instructions,
object format, symbols, or runtime ABI matches. Its identity SHALL cover at least the Emit compiler
and runtime, native-cache format, library and include-source identity, target triple, data layout,
CPU and enabled target features, LLVM identity, relocation and code model, and JIT optimization
profile.

The entry SHALL carry a completeness witness and content integrity check written only after the
object and its metadata are complete. An environment mismatch, incomplete entry, or integrity
failure SHALL be treated as a cache miss.

#### Scenario: A different optimization profile misses

- **WHEN** a library has a native object produced under `-O1` and a later session requests `-O2`
- **THEN** the `-O1` object is not reused and the library is compiled under `-O2`

#### Scenario: A different target or LLVM misses

- **WHEN** the target configuration or LLVM identity differs from the one recorded by a native
  object
- **THEN** the object is not admitted and execution falls back to the portable artifact path

#### Scenario: Corruption is detected before admission

- **WHEN** a native object or its metadata is truncated or changed after it was written
- **THEN** its integrity or completeness check fails before the object enters the JIT

### Requirement: Native-cache failure falls back to portable IR

An absent, stale, incompatible, corrupt, unreadable, or unwritable native-object entry SHALL NOT add
a failure mode to `emit run` or `emit repl`. The command SHALL use the existing portable IR path and
produce the same values, diagnostics, symbol availability, initialization order, and output it would
produce with no native-object tier. A successful fallback MAY populate a replacement native object.

Requests that require observing library compilation SHALL bypass native reuse on the same terms as
the existing IR cache, so a warm native cache cannot suppress requested compiler-stage output.

#### Scenario: An empty native cache is transparent

- **WHEN** a program or session runs with an empty native cache
- **THEN** it succeeds through the portable IR path and may leave an entry for a later process

#### Scenario: An unwritable native cache is transparent

- **WHEN** the native cache location cannot be written
- **THEN** execution succeeds through portable IR without reporting a program error

#### Scenario: Dump-all still observes compilation

- **WHEN** a command requests the library-stage output covered by `--dump-all` while a native object
  is available
- **THEN** the command bypasses native reuse and prints the same requested stages as a cold run

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

### Requirement: Emit-produced explicit library artifacts are reusable by native commands

`emit lib SRC -o DIR` SHALL publish a complete full-unit IR/export pair with
versioned compatibility metadata. Native Emit commands SHALL
consume compatible pairs from a selected manifest provider's `(artifacts DIR)`
before private caches or source compilation of that full unit. Sources SHALL
remain required for provider selection and validation. Chez/native artifact
interchange is outside this contract.

#### Scenario: Native commands consume a separately compiled library

- **WHEN** `emit lib` publishes a library and its dependency providers have compatible
  artifacts, each manifest entry names the appropriate artifact directory, and
  `emit run` or `emit repl` uses an empty private cache
- **THEN** the command reads the explicit full-unit artifacts without compiling
  those units, and runtime values and exported macros match source compilation

#### Scenario: AOT uses the explicit full-unit interface

- **WHEN** `emit build` resolves a provider with compatible explicit full-unit artifacts
- **THEN** it consumes that full unit and interface before constructing any
  separate program-specific pruned unit
- **AND** source compilation for pruning is permitted and distinguished from a
  full-unit artifact miss

#### Scenario: Native commands reuse artifacts from the same Emit executable identity

- **WHEN** `emit lib` publishes a pair and a native command with the same executable
  digest consumes it, with matching runtime, target, source, and dependency inputs
- **THEN** it reuses the explicit artifact and preserves complete IR and export
  semantics, including transitive macro dependencies and call descriptors

#### Scenario: Chez-only artifacts do not authorize native reuse

- **WHEN** an explicit directory contains a pair produced by the Chez driver
  with only its legacy same-host stamp
- **THEN** native commands fall back to a compatible private cache or source compilation
- **AND** Chez verification can independently compile equivalent sources into an
  isolated directory without sharing native compatibility metadata

#### Scenario: An emitted unit is not an implicit dependency bundle

- **WHEN** `emit lib` publishes one library whose dependencies have not been published
  into the requested output directory
- **THEN** only the requested unit is promised there and consumers resolve the
  dependencies through their own selected providers and artifact/cache policy

### Requirement: Explicit artifact validity covers every compilation input

Reuse SHALL require matching format, full-unit kind, library identity, producing
Emit executable digest, runtime ABI, IR target compatibility, source/include contents,
consulted feature answers, and effective dependency identities and interfaces.
The producer identity SHALL describe the compiler that actually emitted the
artifact, including when installed compiler sources are absent. No shared
compiler-source fingerprint or regeneration-owned identity file SHALL be required.

#### Scenario: A changed Emit executable conservatively invalidates artifacts

- **WHEN** rebuilding or relinking Emit changes its executable digest
- **THEN** artifacts carrying the previous digest are rejected even if the
  compiler sources or emitted semantics are otherwise unchanged
- **AND** the consumer obtains a compatible unit through private cache or source fallback

#### Scenario: Exported macro strings survive serialization

- **WHEN** a library exports a macro whose template contains quotes, backslashes,
  newlines, tabs, or other ASCII controls inside string literals
- **THEN** its saved interface preserves those exact string contents when read back
- **AND** cold source compilation, warm reuse, and native explicit-artifact reuse
  produce identical macro results without loss of shared string identity


#### Scenario: Content changes invalidate artifacts even with preserved timestamps

- **WHEN** the selected source or a transitive include changes contents while its
  timestamp is restored to its original value
- **THEN** the explicit unit is rejected and a fresh compatible unit is obtained

#### Scenario: Timestamp-only changes preserve validity

- **WHEN** selected source and include contents are unchanged but their timestamps change
- **THEN** otherwise compatible explicit artifacts remain reusable

#### Scenario: Dependency changes invalidate an unchanged importer

- **WHEN** an imported macro, call descriptor, runtime target, dependency artifact,
  or resolved dependency provider changes while the importing source is unchanged
- **THEN** the importer is rejected if its recorded compilation dependencies no
  longer match, and a stale private-cache entry cannot undo that rejection

#### Scenario: Feature-answer changes invalidate a selected branch

- **WHEN** a recorded `(library NAME)` answer changes after a provider is added or removed
- **THEN** the unit is rejected and compilation selects the currently valid branch

#### Scenario: Incompatible metadata is a miss

- **WHEN** metadata is absent, legacy-only, malformed, unknown-versioned, for
  another library, pruned, or incompatible with the current compiler/runtime/target
- **THEN** it cannot authorize native explicit reuse and the consumer falls back
  to a compatible cache or source compilation

#### Scenario: Artifact location does not override provider precedence

- **WHEN** project resolution selects a source different from the source recorded
  by artifacts at the configured location
- **THEN** those artifacts cannot substitute another provider's bindings

### Requirement: Explicit artifact publication is complete or rejected

A producer SHALL authenticate the IR and exports as one complete generation.
A consumer SHALL validate the entire pair before registering any part of that
unit. Missing, unreadable, corrupt, or mixed-generation artifacts SHALL cause
fallback without partially changing the session. An explicit emission command
SHALL fail if it cannot publish its requested output.

#### Scenario: An interrupted replacement cannot combine generations

- **WHEN** a producer replaces the IR and stops before exports and metadata are
  fully published, or concurrent producers interleave their writes
- **THEN** a reader either admits one complete validated pair or falls back; it
  never combines metadata or exports from one generation with another's IR

#### Scenario: Damaged exports do not pollute a REPL session

- **WHEN** exports fail parsing or integrity validation after the IR has been read
- **THEN** no binding or module from that unit is registered before safe fallback

#### Scenario: Read-only explicit artifacts remain usable

- **WHEN** a valid explicit directory is readable but unwritable
- **THEN** consumers reuse it without writing there, and stale units can be rebuilt
  into a private cache or used transiently if that cache is also unwritable

#### Scenario: An unwritable requested output is an emission error

- **WHEN** `emit lib` cannot publish a complete pair and metadata in its requested directory
- **THEN** it exits nonzero and names the failed output, rather than claiming success

### Requirement: Explicit reuse is distinguishable from other compilation work

Artifact narration SHALL identify explicit-directory reuse separately from
private cache reuse, full-unit compilation, and AOT pruning. Rejection detail
SHALL name the library and reason at verbose level. Narration SHALL obey
`EMIT_VERBOSITY`, remain on stderr, and leave program output unchanged.

#### Scenario: A fresh private cache proves explicit consumption

- **WHEN** a command uses valid explicit artifacts with a new private cache at verbose level
- **THEN** stderr names each explicit artifact location and full-unit reuse, without
  claiming a private-cache hit or source compilation of the reused full units

#### Scenario: Dump requests still observe library compilation

- **WHEN** `--dump-all` requests library compilation stages with valid explicit artifacts present
- **THEN** the command compiles the requested units and shows the same stages as a cold run

#### Scenario: Quiet mode preserves machine output

- **WHEN** the same artifact-using program runs at quiet and verbose levels
- **THEN** program stdout is identical and quiet mode emits no reuse narration

### Requirement: Explicit standard-library warming produces reusable cache entries

Explicit standard-library warming SHALL populate the same complete portable IR, compile-time interfaces, and default-profile native objects consumed by later commands. It SHALL reuse valid entries, rebuild invalid entries, and preserve existing source, compiler, dependency, target, CPU, LLVM, and profile validity checks. Warming SHALL compile libraries without invoking their runtime initializers.

#### Scenario: A cold warm operation benefits later processes

- **WHEN** `emit build --stdlib` succeeds with an empty writable cache and a later `emit repl` or `emit run` uses the same executable, sources, host, and default profile
- **THEN** the later process reuses the prepared portable and required native entries without recompiling those libraries
- **AND** importing a prepared library still initializes it only at the normal time

#### Scenario: Repeating the command is incremental

- **WHEN** `emit build --stdlib` is repeated with unchanged inputs
- **THEN** valid entries are reused and no standard-library compilation or native object generation repeats

#### Scenario: A changed input invalidates only eligible entries

- **WHEN** source, include, dependency, compiler, or native environment identity differs from a prepared entry
- **THEN** the applicable entry and affected dependents are rebuilt under the existing validity rules
- **AND** an `-O0` or `-O2` execution does not admit an `-O1` native object

### Requirement: Explicit warming reports persistence failures

An explicit warm operation SHALL exit non-zero and name the failed library or cache destination when compilation, native generation, or persistence fails. Success SHALL mean all requested entries are complete and reusable. Status SHALL name the destination and report reused/generated counts, bytes produced, and elapsed time on stderr under the standard verbosity controls.

#### Scenario: Cache storage is unavailable

- **WHEN** the explicit warm command cannot create or write its cache destination
- **THEN** it reports the destination failure and exits non-zero
- **AND** ordinary `emit run` and `emit repl` retain their source/IR fallback behavior with the same unavailable cache

#### Scenario: An interrupted warm operation is recoverable

- **WHEN** warming stops before all entries are complete and is then retried
- **THEN** incomplete entries are rejected, completed valid entries are reused, and the retry can finish successfully

#### Scenario: Warming does not alter the install payload

- **WHEN** warming runs against a read-only installed prefix with a writable user cache
- **THEN** it succeeds without writing into the prefix and reports the user cache as its output destination

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
