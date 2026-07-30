## ADDED Requirements

### Requirement: No developer-facing compiler capability requires Chez

Every capability a developer needs in order to build, run, inspect, or debug a program with
this compiler SHALL be reachable from the shipped binary with no Chez Scheme present. This
includes per-pass intermediate-language inspection, which was previously available only
through the Chez driver. Chez SHALL be required only for **verification** — the anti-stale
trust-check, the independent-host fixed-point re-derivation, and the rest of the Chez-gated
developer suite — and for the frozen **genesis** under `historical/genesis/`.

#### Scenario: A Chez-free machine can inspect the pipeline

- **WHEN** a developer with no `chez` on `PATH` builds the compiler, runs a program, starts
  the REPL, and inspects the IL after each pass
- **THEN** all four succeed through the shipped binary, and no step reports a missing Chez

#### Scenario: Chez remains the verification host

- **WHEN** the Chez-gated developer suite runs
- **THEN** it still verifies the committed IR is not stale, re-derives the self-hosting
  fixed point from an independent host, and checks the shipped compiler's stage dump against
  the Chez driver's dump

#### Scenario: The Chez driver's dump is retained as the reference

- **WHEN** the shipped binary's stage dump and the Chez driver's stage dump are produced for
  the same program
- **THEN** the two agree on the stage names, their order, and the intermediate form at each
  stage, compared structurally rather than byte-for-byte
