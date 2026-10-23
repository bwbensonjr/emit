## ADDED Requirements

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
