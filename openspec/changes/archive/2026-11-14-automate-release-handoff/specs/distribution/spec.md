# Spec Delta

## ADDED Requirements

### Requirement: Generated channel promotions merge automatically after verification

After the Homebrew or Nix channel accepts a published release and opens or reuses its promotion
pull request, automation SHALL request merging of that pull request only when it is verified as
the generated promotion for that release. The merge SHALL wait for the target repository's
required check and SHALL apply only to the verified pull request head.

#### Scenario: A verified tap promotion merges

- **WHEN** the tap promotion pull request changes only `Formula/emit.rb`, its content equals the formula rendered from the release identity, its URL and SHA-256 match the published archive, and its branch and head are the ones the promotion produced
- **THEN** automatic merge is requested for that head, and the pull request merges once the tap's required check succeeds

#### Scenario: A verified Nix pin merges

- **WHEN** the Nix promotion pull request changes only `packaging/release.json`, its content equals the release identity both Nix systems accepted, and its branch and head are the ones the promotion produced
- **THEN** automatic merge is requested for that head, and the pull request merges once Emit's required check succeeds

#### Scenario: The pull request diverges from the generated file

- **WHEN** a promotion pull request contains any other file or any content other than the generated file, or its head moved after promotion
- **THEN** automatic merge is not requested, the pull request stays open for a maintainer, and the channel report names the mismatch

#### Scenario: The required check fails

- **WHEN** the required check fails on a promotion pull request with automatic merge requested
- **THEN** the pull request does not merge and that channel is not reported available for the release

#### Scenario: A hand-written packaging change is opened

- **WHEN** a pull request on the tap or in Emit changes the formula or the Nix pin and was not produced by channel promotion
- **THEN** automation never requests its merge and it retains maintainer review

#### Scenario: The promotion is retried

- **WHEN** channel promotion runs again for a release whose promotion pull request already has automatic merge requested or has merged
- **THEN** it reports the existing state, requests nothing new, and succeeds

### Requirement: Promotion pull requests start their required checks

A promotion pull request SHALL be opened with a credential whose pull requests start the target
repository's workflows, so its required check reports without a manual run approval. Each
promotion credential SHALL be limited to its target repository and the operations it performs.

#### Scenario: A Nix pin pull request is opened

- **WHEN** the Nix promotion opens its pull request in Emit
- **THEN** Emit's compatibility workflow starts for it without a maintainer approving the run

### Requirement: Automatic promotion merging requires an enforced merge policy

Automation SHALL request a promotion merge only after verifying that the target's default branch
requires its aggregate check, has no bypass actor, and allows automatic merge. Emit's default
branch SHALL require `Required validation`; the tap's SHALL require its aggregate check. A
read-only policy check SHALL report these settings, and each promoting job SHALL verify its
credential can perform every operation it needs before building.

#### Scenario: The target does not enforce its check

- **WHEN** the target's default branch does not require the aggregate check, lists a bypass actor, or automatic merge is disabled
- **THEN** no merge is requested, the promotion pull request remains open for a maintainer, and the report names the missing policy

#### Scenario: A promotion credential cannot manage pull requests

- **WHEN** the tap or Nix promotion credential is absent, or can push but cannot read or update pull requests
- **THEN** that channel's job fails its credential preflight naming the credential and the missing permission, before building

#### Scenario: Policy is intact

- **WHEN** both repositories enforce their required checks with no bypass actor and allow automatic merge
- **THEN** the policy check succeeds and reports each setting it verified
