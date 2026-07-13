## ADDED Requirements

### Requirement: Persistent JIT host stays in sync with the runtime source

Before the persistent JIT host is used — whether launched by the interactive REPL driver
or by a REPL test harness — the project SHALL ensure the host binary is up to date with
respect to the runtime and host sources it links. The host SHALL be (re)built whenever
`src/runtime/runtime.c`, `src/repl/host.cpp`, or the host build recipe is newer than the
existing binary, so that every `rt_*` runtime function the current runtime defines is
present in the host process and resolvable by JIT'd code. It SHALL NOT be sufficient for
the host binary to merely exist; an out-of-date binary SHALL be rebuilt before use.

#### Scenario: A newly added runtime function is available to the prelude

- **WHEN** a new `rt_*` function is added to `src/runtime/runtime.c` and the REPL is then
  started (via the driver or a test harness) with a host binary that predates the change
- **THEN** the host is rebuilt before the first form is evaluated, and a prelude
  procedure that uses the new runtime function (for example `map`, `member`, or
  `read-from-string`) resolves and evaluates successfully instead of failing with
  `Failed to materialize symbols`

#### Scenario: An up-to-date host is not rebuilt

- **WHEN** the REPL is started and `build/repl-host` is newer than `runtime.c`,
  `host.cpp`, and the build recipe
- **THEN** the freshness check performs no compilation and the session starts without
  rebuilding the host

#### Scenario: A prelude-defined global resolves across forms

- **WHEN** the REPL loads the standard prelude and a later form references a
  prelude-defined global procedure such as `(map (lambda (x) (* x x)) (quote (1 2 3 4)))`
- **THEN** the form evaluates to `(1 4 9 16)`, because the prelude batch module
  materialized successfully and its global slots are resolvable
