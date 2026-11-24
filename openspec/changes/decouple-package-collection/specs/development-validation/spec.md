# Spec Delta

## ADDED Requirements

### Requirement: External package coverage transfers are explicit

Transferring external package assertions out of Emit SHALL document their new executable owners, hosts, and triggers in the coverage inventory. The transfer SHALL retain package execution-path coverage in emit-packages and package-contract coverage in Emit before retiring the old suites.

#### Scenario: Package semantics move to their owning repository

- **WHEN** the pinned collection suites are retired
- **THEN** the coverage map names collection-owned checks for package semantics and execution paths, including artifact reuse and source-driver checks
- **AND** Emit retains executable fixture checks for installation, update, and library-root resolution

### Requirement: Emit package integration validation is self-contained

Emit's required build, test, and release gates SHALL validate the package contract using Emit-owned fixtures. They SHALL NOT fetch the external collection or depend on its availability or revision. Emit SHALL maintain no collection compatibility pin. External package semantics and their compatibility with released Emit SHALL be owned by emit-packages.

#### Scenario: Collection commits require no Emit maintenance

- **WHEN** emit-packages publishes another commit without a change to Emit
- **THEN** Emit's required validation inputs are unchanged and no pin edit, Emit pull request, or Emit release is needed

#### Scenario: Collection unavailability does not affect Emit gates

- **WHEN** the collection repository is unavailable and Emit's other declared prerequisites are present
- **THEN** Emit's package integration checks run from fixtures without contacting the collection

#### Scenario: An Emit package-contract regression fails locally

- **WHEN** Emit can no longer install or update a valid fixture package or resolve its installed library
- **THEN** Emit's required checks fail with the affected operation and expected and actual result

## REMOVED Requirements

### Requirement: The external package collection is validated at a pinned commit

**Reason**: The collection owns package compatibility and advances independently of Emit releases.

**Migration**: Remove the checked-in pin and required fetch/check suites. Retain Emit package-contract checks using fixtures and transfer collection semantics to emit-packages CI.

### Requirement: Pinned package checks run on every execution path

**Reason**: Package-specific execution-path validation belongs to the package collection.

**Migration**: Transfer run, REPL, standalone, published-artifact reuse, installed-package, and Chez source-driver checks to emit-packages with explicit coverage ownership. Retain Emit's own compiler and integration regression checks.

### Requirement: A local collection checkout can stand in for the pin

**Reason**: Removing the pin removes the pinned/unpinned evidence distinction.

**Migration**: Use collection-owned test tools against an explicitly supplied Emit binary or source tree. Continue to support `emit pkg install --from` and `emit pkg update --from` for local package development.
