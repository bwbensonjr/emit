# Spec Delta

## MODIFIED Requirements

### Requirement: The LLVM version requirement is a floor, not an exact pin

The project SHALL accept any LLVM version at or above a documented minimum, with no upper bound, and SHALL NOT require an exact major version. The default tested floor SHALL be LLVM 22. Below the configured floor, discovery SHALL warn and continue rather than fail. The floor SHALL remain overridable by an environment variable. Tool-presence checks SHALL probe discovered tools rather than a single pinned path; discovery precedence SHALL remain unchanged.

#### Scenario: A newer LLVM is accepted without warning

- **WHEN** the discovered LLVM major version is at or above the documented floor
- **THEN** the project uses it with no version warning

#### Scenario: An older LLVM warns but proceeds

- **WHEN** the discovered LLVM major version is below the documented floor
- **THEN** the project emits a single warning naming the discovered version and the floor, and continues

#### Scenario: LLVM 22 and 23 satisfy the default floor

- **WHEN** no floor override is configured and valid LLVM 22 or 23 tools are selected
- **THEN** discovery accepts them without a version-floor warning

#### Scenario: Legacy versions are outside maintained coverage

- **WHEN** LLVM 19, 20, or 21 is explicitly selected without a floor override
- **THEN** discovery warns that it is below 22 without substituting another installation or claiming supported CI coverage

#### Scenario: A floor override remains effective

- **WHEN** EMIT_LLVM_MIN explicitly changes the floor
- **THEN** warning decisions follow that floor while the documented maintained compatibility matrix remains LLVM 22 and 23
