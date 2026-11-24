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

## Coverage added after the baseline

New suites use their profile membership and stable coverage IDs, with an empty
`legacy` list. The historical label counts and hashes remain unchanged.

| Added suite | Profiles | Coverage |
| --- | --- | --- |
| `stdlib-precompilation` | full | Explicit standard-library cache preparation |
| `program-toplevel-order-native` | full | Program definition and command order |
| `scheme-base-generator-native` | full | Declaration guards, serialization, and whole-file freshness |
| `scheme-base-generator-reference` | reference | Emit/Chez generation and diagnostic parity |
| `baked-library-source-chez` | units, reference | Baked membership, imports, and complete IR/interfaces |
| `bake-libraries-contracts` | full, reference | Wrapped declaration rows and CLI contracts |
| `performance-measurement-runner` | full | Calibration, paired sample statistics/order, provenance, output oracles, and failure/reporting contracts |
| `writer-resource-reuse` | full | Independent writer output oracles, bounded traversal allocation/retention, cleanup, and callback lifecycle resource checks |
| `fixnum-tagging` | full | Negative and boundary fixnums through every C runtime arithmetic entry point, built with undefined behavior trapped (#188) |
| `user-library-root` | full | Default user library root: location rules, precedence against project, environment, and installed roots, `--no-library-paths`, doctor rows, and help |
| `user-library-root-chez` | reference | The Chez source driver locates and orders the user root as the native host does |
| `process-execution` | full | `(emit process)`: verbatim arguments, exit codes and signals, output ordering, capture (including more than a pipe buffer), start failures, inheritance, export surface, and `emit run`/standalone parity |
| `package-manager` | full | `emit pkg` against fixture collections: usage, `--from` and `file://` sources, fresh `main` resolution and snapshot-consistent updates, compatibility, symbolic-link and collision refusals, all-or-nothing installs, update, remove, recovery, lock, missing tools, and narration levels |

The existing `scheme-base-gen-guard-native` also joins the full profile now that
it runs without Chez. It retains its original developer-runner label and reference
profile. The full profile currently contains 69 suites and the units profile contains 16.
The baker contracts run in a private workspace, preserving the rule that only
direct Chez source units share read-only source inputs.

The two performance investigation suites check deterministic runner behavior and
writer resource invariants without timing thresholds. They add coverage to the
full-native profile; neither the opt-in paired benchmark runs nor their local
speedup targets become CI timing gates. Both suites run in private workspaces.

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

## External package coverage transfer

The collection owns package semantics and compatibility with the latest stable
released Emit. Its [collection-owned checks](https://github.com/bwbensonjr/emit-packages/blob/main/docs/COMPATIBILITY.md)
replace Emit's former collection suites. Emit retains generic contract checks
against local fixtures; a generic fixture is not Malt semantic coverage.

| Retiring coverage | Executable owner | Host and trigger |
| --- | --- | --- |
| `malt-core`, `malt-training`, `malt-xor` | Collection `tools/run-checks.py EMIT`, corresponding `checks.scm` entries through run, REPL, standalone, artifacts, and installed sources | Native macOS/Linux, required collection PR/main checks, weekly/manual |
| `malt-core-source`, `malt-training-source`, `malt-xor-source` | Collection `tools/run-checks.py --source EMIT_SOURCE`, same checks | Chez plus matching released source tree, collection weekly/manual reference job |
| Malt semantics within `malt-installed` | Collection installed-source path plus `tools/install-check.py EMIT` | Native macOS/Linux, required collection PR/main checks, weekly/manual |
| Artifact publication/reuse for loaded package libraries | Collection artifact path of `tools/run-checks.py EMIT` | Required native collection checks |
| Generic package installation, fresh-tip update, and preflight refusals | Emit `package-manager` suite, `test/package-manager-tests.sh` | Native full profile |
| `srfi-27-installed`, `package-installed-roots` (generic installed-library providers and SRFI 27 source closure) | Emit `srfi-27-install` suite, `test/srfi-27-install-tests.sh` | Native full profile |

The independent `own-emit-compatibility` collection change supplies this handoff.
Its [manual run](https://github.com/bwbensonjr/emit-packages/actions/runs/45393655882)
verified Emit 0.13.0 on both platforms, with 35 native paths and 37 lifecycle
operations per platform and all seven Chez source checks. This link records
historical validation evidence; it selects no collection revision for Emit.
Future package updates remain entirely collection-owned. Generic compiler/module
artifact and independent-host checks remain in Emit's existing suites.

The distribution spec's positive Malt examples remain functional guarantees.
Their provider-resolution assertions are checked with generic installed fixtures
in Emit, while actual Malt package execution is checked by the collection.
Transferring those assertions changes their test owners, not installed import behavior.
