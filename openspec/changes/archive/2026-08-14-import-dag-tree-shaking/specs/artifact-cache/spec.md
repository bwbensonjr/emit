## MODIFIED Requirements

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

#### Scenario: An open-world door never reads a shaken entry

- **WHEN** `emit repl` or `emit run` seeds a session after `emit build` has populated shaken entries
  for the same library and compiler
- **THEN** the session is seeded from full units, and every binding of that library remains available
  regardless of what any program referenced

#### Scenario: A unit whose importer was pruned differently is not served a stale entry

- **WHEN** two programs cause the same imported library to be pruned to different retained sets,
  and each therefore imposes a different root set on a library that **it** imports
- **THEN** each build is served the transitively imported unit pruned to its own root set, and
  neither is served the other's
