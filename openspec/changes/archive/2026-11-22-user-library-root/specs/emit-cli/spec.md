## ADDED Requirements

### Requirement: Library-aware commands include the user library root

`emit run`, `emit repl`, `emit build`, `emit lib`, and `emit doctor` SHALL consult the user library root after `EMIT_LIBRARY_PATH` roots and the project root and before installed roots. `--no-library-paths` SHALL disable it with the other conventional roots. Verb help SHALL name the user root's location and its place in the lookup order.

#### Scenario: Environment roots precede the user root

- **WHEN** an `EMIT_LIBRARY_PATH` root and the user library root both contain the imported library
- **THEN** the environment root's source is selected

#### Scenario: The opt-out covers the user root

- **WHEN** a command is invoked with `--no-library-paths`
- **THEN** it does not probe the user root and continues to resolve baked and exact manifest entries

#### Scenario: Help names the user root

- **WHEN** help is requested for a library-aware command
- **THEN** the library lookup summary lists the user root, between project `lib/` and the installed providers, with its location

### Requirement: Doctor reports the user library root

Doctor SHALL list the user library root among its directory providers in lookup order, labelled `user` with the rule that located it and its availability. A missing directory, or no usable `XDG_DATA_HOME` or `HOME`, SHALL be reported as informational and SHALL not fail the check.

#### Scenario: A missing user root is listed but not a failure

- **WHEN** doctor runs with `XDG_DATA_HOME` set to an absolute path that has no `emit/lib` directory
- **THEN** it lists that path's `emit/lib` as a `user` directory provider marked missing, after the project root, and exits zero

#### Scenario: An unavailable user root is informational

- **WHEN** doctor runs with neither a usable `XDG_DATA_HOME` nor `HOME`
- **THEN** it reports the user root as unavailable and exits zero when the other checks pass
