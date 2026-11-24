# Spec Delta

## MODIFIED Requirements

### Requirement: The collection's main branch is the package source

A networked subcommand SHALL resolve the `main` branch of `bwbensonjr/emit-packages` to exactly one commit, then obtain that commit's archive over HTTPS. Every package that the invocation reads or installs SHALL come from that one commit. The commit SHALL be named in the narration and recorded with each package installed. Resolution SHALL use the collection's current tip without consulting an Emit-maintained collection revision; advancing the collection SHALL require no Emit update.

#### Scenario: Install records the commit it used

- **WHEN** `emit pkg install malt` succeeds
- **THEN** the narration names the 40-character commit that `main` resolved to, and `emit pkg list` reports that commit for `malt`

#### Scenario: A package absent from the collection is refused

- **WHEN** `emit pkg install no-such-package` runs
- **THEN** it reports that the package is not in the collection at the resolved commit, exits with status 1, and writes nothing

#### Scenario: The same Emit installs a later collection tip

- **WHEN** collection `main` advances from A to B and a user runs `emit pkg install` with the same Emit installation
- **THEN** installation uses B without an Emit source edit, pull request, rebuild, or release

#### Scenario: The same Emit updates to a later collection tip

- **WHEN** a package was installed from A, collection `main` advances to B, and `emit pkg update` runs with the same Emit installation
- **THEN** the package files and installed source record move to B, subject to the existing compatibility and preflight checks
- **AND** the next compilation uses B's sources

## ADDED Requirements

### Requirement: The collection owns published-tip compatibility

The package source contract SHALL assign emit-packages responsibility for keeping `main` compatible with the latest stable released Emit. Package manifests SHALL declare a minimum Emit when required. Older Emit installations SHALL use the existing minimum-version refusal rather than require Emit to carry a collection pin or select a historical compatible commit.

#### Scenario: A package requires a newer released Emit

- **WHEN** a collection update raises a package's declared minimum above the running Emit version
- **THEN** installation or update refuses before changing installed packages and names both versions
- **AND** the user can upgrade Emit or explicitly install an older local checkout with `--from`

#### Scenario: Collection compatibility policy is published

- **WHEN** maintainers consult the package-source documentation
- **THEN** it identifies emit-packages as owner of compatibility checks for its published tip against the latest stable Emit, with no paired Emit pin-update pull request
