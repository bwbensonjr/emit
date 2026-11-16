# Random Sources Delta

## Purpose

Provide reusable seedable random sources for Scheme programs, including reproducible learning workloads, through the established SRFI 27 interface.

## ADDED Requirements

### Requirement: SRFI 27 is an explicit ordinary library

Emit SHALL provide `(srfi 27)` exporting `random-integer`, `random-real`, `default-random-source`, `make-random-source`, `random-source?`, `random-source-state-ref`, `random-source-state-set!`, `random-source-randomize!`, `random-source-pseudo-randomize!`, `random-source-make-integers`, and `random-source-make-reals`. It SHALL follow SRFI 27 within the documented Emit numeric limits and SHALL NOT extend implicit imports.

#### Scenario: Explicit import and source identity

- **WHEN** a program imports `(srfi 27)` and creates a source
- **THEN** its predicate recognizes that source and rejects ordinary numbers, vectors, and procedures
- **AND** a program without that import acquires none of these bindings

### Requirement: Sources own independent mutable streams

Each new source SHALL start at the same deterministic initial state. Generators derived from one source SHALL share and advance that source's state; different sources SHALL advance independently. The default procedures SHALL use the source initially bound to `default-random-source`. Library import SHALL NOT consume entropy or randomize any source automatically.

#### Scenario: Interleaved generators share one state

- **WHEN** two integer generators are derived from one source and called alternately
- **THEN** their combined output equals calls in that order to one generator from a fresh equivalent source
- **AND** calls using another source do not change that sequence

### Requirement: Deterministic stream selection and state replay

`random-source-pseudo-randomize!` SHALL accept two nonnegative exact integers and deterministically select the indexed stream. State snapshots SHALL have a readable external representation and be independent copies. Restoring a valid snapshot SHALL replay subsequent draws, including mixed integer and real calls. The algorithm, stream mapping, and state format SHALL be versioned and documented.

#### Scenario: Replay survives serialization and mutation elsewhere

- **WHEN** a source is seeded with `(17, 3)`, its snapshot is written and read, draws are made, and the read snapshot is restored
- **THEN** the same draw sequence is reproduced
- **AND** advancing the source or mutating an earlier snapshot does not mutate other saved snapshots

#### Scenario: Known answers and stream indices

- **WHEN** fixed sequences for initial state and stream pairs `(0, 0)`, `(1, 0)`, and `(0, 1)` are checked on supported execution paths
- **THEN** results match committed independently computed fixtures exactly for integers and state
- **AND** stream selection uses the documented MRG32k3a jump mapping, rather than reducing both indices to a small scalar seed

### Requirement: Integer draws cover the supported exact range without modulo bias

Integer generators SHALL return exact values in `[0, n)` for every exact integer bound from `1` through `2^60 - 1`. Range reduction SHALL use rejection sampling without arithmetic overflow or modulo bias. Invalid bounds SHALL raise catchable Scheme errors before changing source state.

#### Scenario: Boundary and awkward bounds

- **WHEN** draws use bounds `1`, `3`, `10`, `2^32 + 1`, and `2^60 - 1`
- **THEN** every result is exact and within its requested range, including bounds larger than one generator word
- **AND** no supported bound triggers exact-integer overflow

#### Scenario: Invalid arguments preserve state

- **WHEN** an integer generator is called with zero, a negative number, an inexact number, or a non-number
- **THEN** it raises a catchable error and leaves the source unchanged

### Requirement: Uniform reals exclude both endpoints

Real generators SHALL return flonums strictly between zero and one. The default resolution SHALL be `2^-53`. An optional finite flonum unit in `[2^-53, 1)` SHALL select outputs with spacing no greater than that unit. Unsupported units SHALL raise catchable errors; exact fractional units are unavailable in Emit's numeric tower.

#### Scenario: Safe inputs for logarithms

- **WHEN** default real generators and generators requested with units `0.5` and `2^-53` are exercised
- **THEN** outputs exclude zero and one and satisfy the promised resolution
- **AND** zero, one, NaN, infinity, and units below `2^-53` are rejected

### Requirement: Randomization uses host entropy with atomic failure

`random-source-randomize!` SHALL obtain fresh operating-system entropy on supported hosts. It SHALL either install a complete valid state or raise a catchable Scheme error while preserving the old state. It SHALL NOT silently substitute a clock, fixed seed, or partial entropy result. The pseudorandom generator SHALL be documented as unsuitable for cryptographic use.

#### Scenario: Entropy success and failure

- **WHEN** randomization is exercised with a controlled entropy provider that succeeds, returns short input, or fails
- **THEN** success produces a valid state, short reads are completed or rejected, and failure preserves the previous stream and raises a catchable error
- **AND** native smoke checks exercise the real provider on each supported host

### Requirement: Source and state validation is transactional

Invalid sources, negative or inexact stream indices, malformed snapshots, unsupported state versions, and invalid generator arguments SHALL raise catchable errors. Restoring a snapshot SHALL validate its whole representation before copying state, and SHALL retain no mutable alias into caller-owned snapshot data.

#### Scenario: A rejected restore cannot poison an existing generator

- **WHEN** a malformed snapshot is restored, or a valid snapshot is mutated after restoration
- **THEN** malformed input leaves the old stream intact and later caller mutation cannot alter the restored stream

### Requirement: Random sources have execution fidelity

The same seeded operation sequence SHALL yield identical integer outputs and states under source-driven compilation, `emit run`, `emit repl`, and an executable produced by `emit build`. Uniform real results SHALL also agree because their construction uses exactly representable integer-to-double conversions and power-of-two scaling.

#### Scenario: Compiled library artifacts preserve semantics

- **WHEN** a library importing SRFI 27 is compiled using `emit lib` and consumed in run, REPL, and standalone checks
- **THEN** its seeded sequence and state replay agree with the source-driven fixture
