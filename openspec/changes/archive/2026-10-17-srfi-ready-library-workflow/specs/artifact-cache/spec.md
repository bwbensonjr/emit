# Spec Delta

## ADDED Requirements

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
