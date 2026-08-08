## ADDED Requirements

### Requirement: A diagnostic that names a datum renders that datum

When a door's diagnostic reports a value the user wrote — a library name, a form, a literal — it
SHALL render that value's external representation rather than a placeholder. A diagnostic SHALL NOT
print `?` in place of a datum it is reporting.

This applies to error irritants on every door, not only the interactive one: the doors share one
error-rendering path, so an irritant that renders as a placeholder loses the same information
wherever it surfaces. The renderer SHALL handle at minimum symbols, strings, numbers, booleans,
characters, the empty list, pairs and proper lists, vectors, and bytevectors — the data a door's
diagnostics can be handed.

Where the rendering is genuinely impossible for a datum, the diagnostic SHALL say so rather than
substituting a placeholder that reads as if it were the value.

#### Scenario: An interactive import of a library that did not load names the library

- **WHEN** a session runs `(import (bad))` for a manifest library that failed to load
- **THEN** the diagnostic names `(bad)` — the library name the user typed — rather than reporting
  `imported library not loaded ?`

#### Scenario: A list irritant renders on a non-interactive door

- **WHEN** any door reports an error whose irritant is a list
- **THEN** the diagnostic renders that list's external representation

#### Scenario: A vector irritant renders

- **WHEN** a door reports an error whose irritant is a vector or bytevector
- **THEN** the diagnostic renders it as `#(...)` or `#u8(...)` rather than `?`

#### Scenario: The session survives the improved diagnostic

- **WHEN** an interactive form fails with a rendered diagnostic
- **THEN** the session restores its snapshot and the next form still evaluates, as it does today
