# Standard-library generator coverage

Run `bash test/scheme-base-generator-tests.sh` for Emit generation, guard diagnostics,
serialization, and freshness controls. Add `--reference --skip-freshness` to require
Chez and compare the same generated files independently across hosts. Explicit
reference verification fails if Chez is unavailable. The native suite requires the
already-built compiler and does not regenerate compiler IR.

Each negative case starts with the current declaration and prelude in temporary
files and changes one invariant. A test requires a nonzero status, its specific
message, and the offending name or row. A random earlier error cannot pass. Failed
runs preserve fixture inputs, output streams, child status, and a JSON summary in
the temporary report directory printed by the harness.

| Case | Guard exercised | Offending value |
|---|---|---|
| `stale-private` | private name absent from prelude | `guard-missing` |
| `stale-assignment` | assignment names absent definition | `guard-missing` |
| `duplicate-assignment` | name assigned more than once | `guard-probe` |
| `unknown-home` | home is not a partition member | `(guard unknown)` |
| `duplicate-home` | same library occurs twice in a home list | `guard-probe` |
| `missing-elsewhere` | non-base name absent from elsewhere list | `guard-probe` |
| `extra-elsewhere` | base name incorrectly listed elsewhere | `guard-probe` |
| `duplicate-builtin` | duplicate builtin surface name | `cons` |
| `raw-builtin` | raw primitive published as builtin | `%guard-raw` |
| `malformed-builtin` | builtin row has mismatched identity | `guard-row` |
| `invalid-extension` | extension is not a base primitive | `guard-extension` |
| `invalid-write-owner` | write primitive lacks base owner | `guard-write` |
| `duplicate-write-owner` | duplicate write primitive owner | `display` |
| `write-identity` | write surface identity differs from declared base identity | `guard-write` |
| `duplicate-export` | generated export occurs twice | `guard-duplicate` |

The final guard is reachable: two definitions with the same public name in a
prelude fixture yield two exports even though the declaration and builtin names
are otherwise valid. It remains covered rather than being removed as redundant.

The valid private-macro control checks that the macro remains in the generated
body but is absent from exports. The ordinary real declaration additionally
exercises macro re-exports and definitions with public and private homes. Its
complete output is compared between hosts. Serialization controls add escaped
strings, bar-quoted symbols, character literals, finite and non-finite flonums,
and a vector datum; generation must agree across hosts, temporary roots, and all
three verbosity levels. Successful quiet generation emits no narration and all
generator stdout remains empty.

Freshness controls copy the source inputs and library tree into a temporary tree.
They check valid files, then stale body bytes, a missing declared member, and an
orphan generated file. Each failure must identify its category and leave the
fixture unchanged. The ordinary whole-file guard can be run independently with
`bash test/scheme-base-gen-check.sh`; `--tree PATH` selects such a fixture root.

Run `bash test/bake-libraries-tests.sh` for fast assembly contract checks. It
wraps a real baked partition row between imports and its destination and requires
byte-identical output from the committed libraries. It also checks help on stdout
with exit zero and named unknown-option errors on stderr. No compiler runs.
