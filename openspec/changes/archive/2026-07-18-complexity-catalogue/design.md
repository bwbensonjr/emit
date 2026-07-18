## Context

A one-off audit established the shape of the problem: the repo is ~229K LOC across ~681
tracked files, but ~74% of that is generated LLVM IR (`bootstrap/*.ll`, ~154K) plus
vendored nanopass (~18K), an imported R7RS reference doc (~14K), and OpenSpec tracking
(~25K). The hand-authored system — compiler frontend, codegen, runtime, prelude, REPL,
tooling — is ~8K LOC. Any single LOC number is misleading unless it separates these roles.

The project already has a `tooling-observability` capability that mandates how tools
narrate (action + inputs + outputs on stderr, data on stdout, metrics, `EMIT_VERBOSITY`),
and a `tools/` directory of small shell utilities (`log.sh`, `regen.sh`, `llvm-env.sh`)
plus a `Makefile` that is the conventional entry point for tasks. This change adds a
reporting tool in that same idiom and a persisted document it maintains.

## Goals / Non-Goals

**Goals:**
- A deterministic, agent-free engine that classifies every git-tracked file by component,
  role, and language and emits a catalogue.
- A persisted `docs/COMPLEXITY.md` whose tables are regenerated idempotently and whose
  interpretive prose survives regeneration.
- A single, obvious place to update the classification policy when code moves.
- Conformance with `tooling-observability`.

**Non-Goals:**
- Cyclomatic/cognitive complexity or any AST-level metric. This is a *catalogue* (counts by
  category), not a complexity analyzer. LOC + role classification is the deliverable.
- Enforcing a LOC budget or failing a build on growth. (If that becomes desirable it is a
  separate change against `project-build`/`tooling-observability`.)
- Counting untracked files, build output, or `.git`.

## Decisions

### Decision 1: Engine is a narrating shell script, data on stdout
Implement the engine as `tools/complexity.sh`, matching the existing `tools/*.sh` idiom and
reusing `tools/log.sh` for stderr narration. The classification is pure path/extension
rules plus `git ls-files` + `wc -l` — no parsing, so shell is the simplest fit and needs no
new dependency.
- **Alternative considered:** a Scheme tool (`tools/*.ss`). Rejected for now: it would pull
  the host into a task that is textbook shell, and `wc`/`git` glue in Scheme is heavier than
  in shell. Revisit if the catalogue ever needs to parse source (e.g. count public
  definitions), which would justify the language.
- **Contract:** machine-consumable catalogue (a TSV of `role, component, language, lines,
  path` and aggregate tables) goes to **stdout**; all narration to **stderr**; verbosity via
  `EMIT_VERBOSITY`. This satisfies the tooling-observability separation requirement and lets
  `make catalogue` pipe stdout somewhere while a human still sees narration.

### Decision 2: Classification policy is a single ordered case block
Path→(component, role) and extension→language live in one clearly-marked section of
`tools/complexity.sh` as ordered `case` rules (first match wins, most specific first — e.g.
`spike/nanopass/vendor/*` before `spike/*`). A file that matches no rule gets an explicit
`other` role and still appears, so gaps are visible, not silent (per the spec's
misclassification scenario). This is the "one identifiable place" the maintainability
requirement demands: relocating code is a one-edit fix.

### Decision 3: Roles are a fixed, small taxonomy
`authored | generated | vendored | reference | tracking | test | demo | spike | other`.
Authored is the headline subtotal. Generated = `bootstrap/*.ll` (+ any future checked-in
build output). Vendored = `spike/nanopass/vendor/*`. Reference = imported external docs
(e.g. `docs/r7rs-small.md`). Tracking = `openspec/**`. The report shows the authored
subtotal *and* the full total side by side so the gap is the point, not a footnote.

### Decision 4: `docs/COMPLEXITY.md` uses generated-section markers
The document is hand-authored prose (purpose, how-to-regenerate, interpretation) with the
mechanical tables enclosed between literal markers, e.g.:

```
<!-- BEGIN GENERATED: complexity-catalogue -->
... tables + provenance line (command used) ...
<!-- END GENERATED: complexity-catalogue -->
```

Regeneration rewrites only the span between the markers (awk/sed splice), leaving prose
intact and producing byte-identical output on an unchanged tree (idempotent). The provenance
line inside the block names the regenerating command. This keeps the "living document" honest
without a templating dependency.
- **Alternative considered:** fully generate the file each run. Rejected: it would either
  discard the interpretive prose (the most valuable part) or force prose into the tool.

### Decision 5: Two entry points over one
- `make catalogue` runs the engine and splices the tables into `docs/COMPLEXITY.md` — the
  agent-free, CI-capable path that satisfies the "runs without an agent" scenario.
- The `complexity-catalogue` **skill** runs `make catalogue` *and then* refreshes the
  interpretive prose (takeaways, notable shifts) that needs judgment. The skill is the
  "update the whole document including commentary" path the user asked for.
- **Rationale:** the mechanical tables must be reproducible without a model; the commentary
  benefits from one. Splitting the responsibilities keeps each honest.

## Risks / Trade-offs

- **LOC is a coarse proxy for complexity.** → The document states this explicitly and leans
  on the role/component breakdown (where the code is) rather than a headline number; scope
  is deliberately "catalogue," not "complexity score."
- **Classification drift as files move.** → Mitigated by Decision 2 (one policy block) and
  the `other` fallback surfacing anything unclassified; a moved file shows up wrong loudly
  rather than vanishing.
- **Marker-splice fragility if a human deletes the markers.** → The tool detects missing
  markers and fails with a clear message rather than appending a duplicate block.
- **Prose and tables can disagree over time.** → The skill path re-reads the fresh tables
  before rewriting commentary; `make catalogue` alone only touches tables, so numbers are
  never stale even if prose lags.

## Migration Plan

Additive only. New files (`tools/complexity.sh`, `docs/COMPLEXITY.md`, the skill) and one
new `Makefile` target. No existing behavior changes; rollback is deletion of the added
files and target.

## Open Questions

- Exact aggregate tables to generate (by-role, by-component, by-language, and the
  authored-only component×language matrix are the candidates). Resolved during apply against
  the audit's proven-useful set.
- (Resolved) `docs/COMPLEXITY.md` will be linked from `README.md` — user-requested.
