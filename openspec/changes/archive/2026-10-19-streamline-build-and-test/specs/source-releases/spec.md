# Spec Delta

## MODIFIED Requirements

### Requirement: Source compatibility is checked across the supported matrix

CI SHALL build committed bootstrap IR without Chez using LLVM 22 and 23 on Linux and macOS. Code PRs and main builds SHALL run full native regression on LLVM 23 and focused compatibility checks on LLVM 22 on both platforms. Release commits SHALL run full native regression in all four cells. Each required cell SHALL verify its intended tools and installed commands; missing tools or failures SHALL fail the gate. Discovery SHALL retain no upper bound.

#### Scenario: Every supported combination is exercised

- **WHEN** compatibility CI runs for a code change or release commit
- **THEN** all four platform/LLVM combinations build with matching headers, libraries, clang, and clang++
- **AND** code changes use the documented full/focused profiles while releases use full regression in every cell
- **AND** bootstrap IR is consumed as committed, without regeneration in these cells

#### Scenario: Installed commands are exercised

- **WHEN** a matrix cell completes its build and staged installation
- **THEN** version and doctor checks, a program run, scripted REPL evaluation, library compilation, and a delivered AOT executable all pass using installed files from an unrelated directory

#### Scenario: A matrix dependency cannot be provisioned

- **WHEN** a required LLVM major is unavailable to a matrix job
- **THEN** that cell fails visibly and release publication remains blocked

#### Scenario: Documentation-only validation avoids the matrix

- **WHEN** conservative change classification identifies only non-executable documentation changes
- **THEN** PR and main validation run lightweight checks instead of provisioning compatibility toolchains
- **AND** this exception never reduces a tagged release's required coverage

#### Scenario: Focused compatibility exercises execution and delivery

- **WHEN** the LLVM 22 PR profile runs
- **THEN** it checks representative JIT evaluation, persistent REPL state, macro-bearing library import and reuse, AOT execution, primitive/runtime behavior, installation diagnostics, and relocated library lookup

### Requirement: Tagged publication validates and identifies its exact payload

Release automation SHALL reject tag/version/changelog mismatches, require full regression on all four supported platform/LLVM cells, source/bootstrap consistency, one independent-host reference run, and both exact offline archive validations for the tagged commit. It SHALL publish only the validated archive, SHA-256 checksums, and matching changelog notes. Actions SHALL be SHA-pinned; published assets SHALL NOT be silently overwritten with different bytes.

#### Scenario: Valid tag produces a complete release

- **WHEN** a version tag matches the committed version and changelog and all release checks pass
- **THEN** publication provides the versioned source archive, SHA256SUMS, and matching release notes
- **AND** the checksum verifies the exact archive that passed validation

#### Scenario: Invalid identity or failed validation stops publication

- **WHEN** tag identity differs from the version file or changelog, a matrix check fails, or the extracted archive fails validation
- **THEN** no public release is published

#### Scenario: A release job is retried

- **WHEN** publication is retried for an already published version
- **THEN** existing published assets are preserved and differing bytes cause a visible failure

#### Scenario: Bootstrap or reference validation fails

- **WHEN** tagged source/bootstrap consistency or independent-host verification fails or is unavailable
- **THEN** publication remains blocked even if the native compatibility cells pass
