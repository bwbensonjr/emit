# Spec Delta

## ADDED Requirements

### Requirement: Installed package integration checks use local fixtures

Emit SHALL verify installed package integration with Emit-owned local fixtures, without fetching emit-packages. Checks SHALL cover environment-root resolution, a collection linked as the user root, and a package installed into the user root with the installed package manager. Package-specific behavior SHALL remain the collection's responsibility.

#### Scenario: Installed Emit consumes a fixture package offline

- **WHEN** staged-install acceptance runs without access to emit-packages
- **THEN** a local fixture library resolves through each supported test root and after `emit pkg install --from` from an unrelated directory
- **AND** the existing negative check that Malt is absent from the installed payload remains covered
