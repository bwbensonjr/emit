## 1. Catalogue engine (`tools/complexity.sh`)

- [x] 1.1 Create `tools/complexity.sh` that enumerates git-tracked regular files via `git ls-files -z` and emits a per-file TSV of `role<TAB>component<TAB>language<TAB>lines<TAB>path` to stdout
- [x] 1.2 Add the classification policy as one clearly-marked, ordered `case` block: path→(component, role) most-specific-first, extension→language, with an explicit `other` fallback role for unmatched paths
- [x] 1.3 Encode the role taxonomy `authored|docs|generated|vendored|reference|tracking|config|test|demo|spike|other`, classifying `bootstrap/*.ll` as generated, `spike/nanopass/vendor/*` as vendored, `docs/r7rs-small.md` as reference, and `openspec/**` as tracking
- [x] 1.4 Wire narration through `tools/log.sh`: announce action/inputs/outputs on stderr, honor `EMIT_VERBOSITY`, keep stdout data-only
- [x] 1.5 Emit the aggregate tables (by-role, by-component, by-language, and the authored-only component×language matrix) plus authored-subtotal and full-total lines
- [x] 1.6 Report the totals as end-of-run metrics on stderr (file counts + LOC per role/language)

## 2. Persisted document (`docs/COMPLEXITY.md`)

- [x] 2.1 Author `docs/COMPLEXITY.md` prose: purpose, the LOC-is-a-proxy caveat, the role taxonomy, and the exact command to regenerate
- [x] 2.2 Add `<!-- BEGIN GENERATED: complexity-catalogue -->` / `<!-- END GENERATED -->` markers with a provenance line naming the regenerating command inside the block
- [x] 2.3 Implement the marker-splice in the engine (or a thin wrapper): replace only the span between markers; fail with a clear message if markers are missing rather than duplicating a block
- [x] 2.4 Verify idempotence: two runs against an unchanged tree leave the generated span byte-identical

## 3. Entry points

- [x] 3.1 Add a `catalogue` target to the `Makefile` that runs the engine and splices the tables into `docs/COMPLEXITY.md`, narrating per convention
- [x] 3.2 Create the `complexity-catalogue` skill under `.claude/skills/` that runs `make catalogue` then refreshes the interpretive prose (takeaways/notable shifts) outside the markers
- [x] 3.3 Link `docs/COMPLEXITY.md` from `README.md` (user-requested)

## 4. Verification

- [x] 4.1 Confirm every tracked file is counted exactly once and per-file lines sum to the totals (no drops, no double-counts)
- [x] 4.2 Confirm stdout captured to a file contains only catalogue data and all narration is on stderr
- [x] 4.3 Confirm authored subtotal excludes generated/vendored/reference/tracking and that both subtotal and full total are shown
- [x] 4.4 Confirm relocating a sample file only requires a one-line policy edit to reclassify it correctly
