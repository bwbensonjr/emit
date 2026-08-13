## ADDED Requirements

### Requirement: A library unit can be registered into a session from a prebuilt artifact

The embedded compiler SHALL expose an entry point that registers a library into the current session
from an already-compiled unit module plus its export table, performing no compilation and reading no
library source. The registered library SHALL be indistinguishable from one registered by compiling
it: the same export table is published, the same import declarations are recorded for
initialization ordering, and a program compiled against it resolves the same bindings to the same
symbols.

This is the read counterpart to the export table the compiler already writes. It performs no file
I/O of its own — the host supplies the unit text and the table datum, as it does for the entries
that compile from source.

#### Scenario: A registered prebuilt unit resolves imports

- **WHEN** a library is registered from its prebuilt unit and export table, and a program importing
  that library is then compiled against the session
- **THEN** the program compiles and its references resolve to that library's exported symbols

#### Scenario: Registering from a prebuilt artifact matches registering by compiling

- **WHEN** one session registers a library by compiling its source and another registers it from the
  prebuilt unit and table produced by that same compile
- **THEN** the two sessions publish the same export table and the same import declarations, and a
  program compiled against either emits byte-identical IR

#### Scenario: A malformed artifact is refused rather than half-registered

- **WHEN** an export table datum cannot be read, or does not correspond to the unit supplied with it
- **THEN** the entry reports the failure and leaves the session unchanged, so the caller can fall
  back to compiling from source

## MODIFIED Requirements

### Requirement: The embedded runner agrees with the batch path (dev→ship fidelity)

The in-process runner and the batch AOT path SHALL produce the same observable result for
the same program, because they share one compiler core and one prelude re-homing. There
SHALL NOT be a separate compilation path for the runner: a prelude-using program SHALL resolve
its prelude procedures through `(scheme base)` on the embedded runner exactly as on the Chez
batch driver, not through a prepended prelude.

Reusing a cached library unit SHALL NOT constitute a second compilation path. A session seeded from
cached units and a session seeded by compiling those units from source SHALL be indistinguishable:
the same export tables, the same initialization ordering, and byte-identical emitted IR for any
program compiled against them. Whether a unit was reused or recompiled SHALL therefore be
unobservable in any door's output.

#### Scenario: Runner output matches AOT output

- **WHEN** the same program is run through the in-process runner and compiled-and-run
  through the batch AOT path
- **THEN** both print the same value

#### Scenario: Runner emitted IR matches the Chez driver

- **WHEN** the same prelude-using program is compiled by `scheme-run --emit` (Chez-free) and by
  the Chez batch driver
- **THEN** the program's emitted core IR is byte-identical between the two paths — the runner no
  longer inlines the prelude's definitions but references `(scheme base)` exports as the Chez
  driver does

#### Scenario: A cached seeding is indistinguishable from a compiled one

- **WHEN** the same program is compiled by the runner with an empty cache and again with a warm
  cache
- **THEN** the emitted IR is byte-identical between the two runs, and matches the Chez driver's as
  above
