# Validation Coverage Inventory

The versioned, machine-readable inventory is [tools/test-registry.json](../tools/test-registry.json). Its `baseline_commit` is `a6238520b38551b1042e9f35a5768e0bcdd29d36`; each stable suite ID owns one or more coverage-group IDs and records its exact argv, profile, category, isolation, Chez host flag, and legacy runner label.

## Legacy coverage accounted for

| Inventory source | Entries | Coverage retained |
| --- | ---: | --- |
| `run-all-tests.sh` | 53 required native suites | All 53 legacy labels and their exact commands; Chez-free full profile |
| `run-dev-tests.sh` | 41 labels | All direct source units and developer/reference checks; old trust-check label now maps to source consistency |
| Optional R7RS stale-exclusion sweep | 1 opt-in check | Separate `conformance` profile; not counted as the sections-only full-native check |
| Chez-free source consistency | 1 synthetic obligation | `source` profile, replaces the old trust-check mechanism |

Rows that are byte-for-byte the same command and host are represented once with both legacy mappings. Different host settings remain separate commands, including the native and Chez binding-context runs and the cross-host `both` settings for library composition, Snow packages, and upstream SRFIs. The cross-host settings remain explicit in argv so a future profile cannot accidentally collapse them to one host.

`coverage` is an auditable group identifier for every legacy suite. The group currently includes all assertions emitted by that existing script; the script remains the assertion source of truth. The registry retains the three direct performance/scaling groups (`string-port-scaling-p21`, the P21 native-object cache and artifact/cache checks), the complete native R7RS sections, and the Chez/native parity groups. R7RS stale exclusions remain deliberately opt-in because they are conformance bookkeeping, not the everyday regression sections.

The canonicalization extension adds allocation-history, restored-artifact,
idempotence, binding-key/spelling, identifier-fallback, and user graph identity
checks to `import-binding-identities-chez`. The unchanged Snow cross-host suite
retains full `.exports` byte comparisons, including the SRFI 227 reproducer.
Provisioning self-tests verify exact backend utility versions and failure
propagation at each assemble/link/execute step; real recipe probes run for both
fresh installations and restored bundles. The same binding unit checks the Chez
driver's relative-root helper on the CI host.

## Isolation

Direct Chez `.ss` units run in `units`. The larger Chez binding-context
compilation/parity script runs in `reference`, with full independent-host checks
on weekly/manual runs and releases. Targeted PR reference IDs are self-emission,
dump parity, and datum rendering; native binding-context regressions remain in
every full native profile. This is an explicit frequency split, not deletion.

All scripts other than direct Chez `.ss` unit invocations are marked `workspace`.
This conservative classification covers tests that run `make`, alter configuration
or installation state, exercise caches, or invoke integration scripts. Each gets
a private copy of the immutable native seed, home, cache, and temporary roots
before concurrent scheduling. Only direct `chez --script ... .ss` source-unit
invocations are `readonly`; they share source inputs while retaining private
temporary/cache roots, and the runner verifies the seed is unchanged.

The cyclic-datum and printer suites explicitly prepare their private REPL caches
before the existing 30-second hang/recovery checks. This restores the warm setup
previously supplied by earlier legacy suites without sharing mutable state. All
18 cyclic-datum and 21 printer assertions remain in their existing full-native
groups; setup failure also fails the suite.

## Auditing changes

When a legacy runner changes, update its corresponding registry row and coverage group in the same change. For each removed or merged row, preserve the old label in `legacy` and identify the equivalent retained group; do not infer equivalence from matching final output alone. Optional coverage stays separately named and must not be silently folded into or dropped from the required full inventory.
