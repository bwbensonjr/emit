## MODIFIED Requirements

### Requirement: Persistent JIT host stays in sync with the runtime source

Before the persistent JIT host is used — whether launched by `emit repl` or by a REPL
test harness — the project SHALL ensure the `emit` binary is up to date with respect to
the runtime, host, and embedded-compiler sources it links. The `emit` binary SHALL be
(re)built whenever `src/runtime/runtime.c`, the merged `emit` host source (the run/REPL
dispatch), the assembled/compiled compiler it embeds (and the core sources behind it),
or the build recipe is newer than the existing binary, so that every `rt_*` runtime
function and the embedded compiler entry the host relies on are present and resolvable.
It SHALL NOT be sufficient for the binary to merely exist; an out-of-date binary SHALL
be rebuilt before use.

#### Scenario: A newly added runtime function is available to the prelude

- **WHEN** a new `rt_*` function is added to `src/runtime/runtime.c` and `emit repl` is
  then started (via the driver or a test harness) with an `emit` binary that predates
  the change
- **THEN** the binary is rebuilt before the first form is evaluated, and a prelude
  procedure that uses the new runtime function resolves and evaluates successfully instead
  of failing with `Failed to materialize symbols`

#### Scenario: A compiler-source change rebuilds the host

- **WHEN** a compiler core source (a pass, `emit`, or the assembly step) is changed and
  `emit repl` is then started with an `emit` binary that predates the change
- **THEN** the binary is rebuilt before the first form is evaluated, so the REPL compiles
  forms with the updated compiler rather than a stale embedded copy

#### Scenario: An up-to-date host is not rebuilt

- **WHEN** `emit repl` is started and `build/emit` is newer than `runtime.c`, the merged
  host source, the embedded compiler, and the build recipe
- **THEN** the freshness check performs no compilation and the session starts without
  rebuilding the binary

#### Scenario: A prelude-defined global resolves across forms

- **WHEN** the REPL loads the standard prelude and a later form references a
  prelude-defined global procedure such as `(map (lambda (x) (* x x)) (quote (1 2 3 4)))`
- **THEN** the form evaluates to `(1 4 9 16)`, because the prelude batch module
  materialized successfully and its global slots are resolvable
