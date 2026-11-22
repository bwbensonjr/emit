## ADDED Requirements

### Requirement: A user library root sits between the project and the installation

Library lookup SHALL include one user library root, a conventional directory provider placed after the project conventional root and before the first installed manifest, so precedence runs project, then user, then installed. It SHALL behave as any directory root: a duplicate of an earlier root is used once at the earlier position, a missing directory is skipped, and a library it answers is narrated as resolved from that root. Emit SHALL never create or write it.

#### Scenario: A user-root library resolves from any directory

- **WHEN** `(acme util)` exists only at `ROOT/acme/util.sld`, where ROOT is the user library root, and a program importing it runs from a directory with no manifest and no project `lib/`
- **THEN** the library resolves from the user root and the narration names that root

#### Scenario: The project overrides the user root

- **WHEN** both project `lib/` and the user root contain `acme/util.sld`
- **THEN** the project copy is selected

#### Scenario: The user root overrides the installation

- **WHEN** the user root and an installed provider both supply a non-baked library
- **THEN** the user root's copy is selected, and a baked library is still never replaced

#### Scenario: A missing user root changes nothing

- **WHEN** the user root directory does not exist
- **THEN** resolution proceeds to the installed providers without an error

### Requirement: The user library root location is fixed by the XDG data rule

The user library root SHALL be `emit/lib` under `XDG_DATA_HOME` when that variable is an absolute path, and otherwise `.local/share/emit/lib` under `HOME`. With neither usable there SHALL be no user root. The location SHALL be the same on every platform, and the native commands and the Chez source driver SHALL derive it identically.

#### Scenario: XDG_DATA_HOME selects the root

- **WHEN** `XDG_DATA_HOME` is an absolute path
- **THEN** the user root is `$XDG_DATA_HOME/emit/lib`

#### Scenario: HOME is the fallback

- **WHEN** `XDG_DATA_HOME` is unset, empty, or relative and `HOME` is set
- **THEN** the user root is `$HOME/.local/share/emit/lib`

#### Scenario: Native and source drivers agree

- **WHEN** the same program importing a user-root-only library is compiled by `emit run` and by the Chez source driver
- **THEN** both resolve the same source file
