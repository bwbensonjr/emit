# Spec Delta

## ADDED Requirements

### Requirement: Conventional-path libraries are registered on demand

The REPL SHALL NOT enumerate or scan conventional library roots at startup. When an import names a
library not already registered from the baked set or an exact manifest entry, the session SHALL ask
the shared resolver for that name and SHALL register its transitive dependency closure before
initialization and scope merge. Resolution, compilation, cache loading, and registration failures
SHALL be reported at that import, and the session SHALL restore its pre-import compiler state and
continue accepting forms.

Manifest entries SHALL retain eager startup registration and startup diagnostics. Regardless of
registration time, every non-baked library SHALL retain import-time initialization, dependency-first
ordering, at-most-once execution, and merge-after-success semantics.

#### Scenario: Startup does not scan a conventional root

- **WHEN** a library root contains libraries that no prompt imports
- **THEN** REPL startup does not read, compile, cache-load, register, initialize, or report those
  sources

#### Scenario: First import performs the complete registration closure

- **WHEN** a prompt imports conventional library `(a)` and `(a)` imports conventional library `(b)`
- **THEN** the session resolves and registers `(b)` before `(a)`, initializes `(b)` before `(a)`,
  and then commits `(a)`'s exports and macros to the session

#### Scenario: A failed on-demand load leaves the session usable

- **WHEN** a prompt imports a conventional library whose source is unreadable, mismatched, or fails
  to compile
- **THEN** the error names the requested library and source when known, none of its names enter
  scope, and the next valid form evaluates normally

#### Scenario: Manifest startup validation is unchanged

- **WHEN** an exact manifest entry names an unreadable or invalid source
- **THEN** the REPL reports it before the first prompt even if no form would import it

