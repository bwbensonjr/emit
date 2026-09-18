# Spec Delta

## ADDED Requirements

### Requirement: Every library-aware path accepts conventional library roots

`emit run`, `emit repl`, `emit build`, and `emit lib` SHALL accept repeatable `-L DIR` and
`--library-path DIR` options, preserving their command-line order. They SHALL also read a
host-path-list from `EMIT_LIBRARY_PATH` after explicit roots and before default project and installed
roots. An empty path-list element SHALL be rejected rather than interpreted as the current
directory.

Each path SHALL accept `--no-library-paths`, which disables explicit, environment, project-default,
and installed conventional roots while retaining baked and manifest providers. All verb help SHALL
document the options, environment variable, precedence, path derivation example, and relationship to
`--no-manifest-chain`.

#### Scenario: Repeated explicit roots are accepted by every path

- **WHEN** any library-aware path receives `-L first --library-path second`
- **THEN** both roots participate in that order and the first matching library wins

#### Scenario: Environment roots follow explicit roots

- **WHEN** an explicit root and an `EMIT_LIBRARY_PATH` root both contain the imported library
- **THEN** the explicit root's source is selected

#### Scenario: Empty environment elements are rejected

- **WHEN** `EMIT_LIBRARY_PATH` contains an empty element
- **THEN** the invoked path reports a configuration error rather than adding the current directory

#### Scenario: Conventional lookup can be disabled

- **WHEN** a path is invoked with `--no-library-paths`
- **THEN** it probes no conventional root and continues to resolve baked and exact manifest entries

#### Scenario: Help explains zero-mapping project layout

- **WHEN** help is requested for a library-aware path
- **THEN** it shows how `(my stats)` maps to `my/stats.sld` beneath a root and names the available
  root configuration and opt-out controls

