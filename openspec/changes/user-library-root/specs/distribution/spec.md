## MODIFIED Requirements

### Requirement: The installed payload carries no package-collection libraries

Installation SHALL NOT include `(malt learner)`, its internal libraries, or its license and provenance files. A library provided by the external package collection SHALL resolve from an installed Emit only through a library root the user supplies: an explicit root, `EMIT_LIBRARY_PATH`, a project root, or the user library root.

#### Scenario: An installed Emit does not resolve Malt by itself

- **WHEN** a program importing `(malt learner)` is run against a staged installation from an unrelated directory with no manifest, no `-L` root, no `EMIT_LIBRARY_PATH`, no project `lib/`, and an empty user library root
- **THEN** compilation fails with the resolver's unresolved-library diagnostic naming `(malt learner)`
- **AND** the staged payload contains no file under a `malt/` library directory

#### Scenario: A supplied collection root resolves Malt

- **WHEN** the same program is run against the same installation with the package collection's `lib/` directory in `EMIT_LIBRARY_PATH`
- **THEN** `(malt learner)` resolves from that root and the program completes

#### Scenario: A collection linked as the user root resolves Malt

- **WHEN** the same program is run against the same installation with no `EMIT_LIBRARY_PATH` and the package collection's `lib/` directory linked at the user library root
- **THEN** `(malt learner)` resolves from the user root and the program completes
