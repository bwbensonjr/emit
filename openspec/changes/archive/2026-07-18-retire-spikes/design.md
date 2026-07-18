## Context

`spike/` holds prototypes that informed settled decisions. An audit (the
`complexity-catalogue` change) quantified it: 20,003 LOC / 8.7% of the tree, mostly the
18,487-LOC vendored nanopass. Each spike maps to a live spec (the decision) and an archived
change (the rationale + numbers):

| Spike | Decision spec | Archived rationale |
|---|---|---|
| `nanopass/` (+vendor) | `compiler-pipeline` | `spike-nanopass-translation`, `select-syntax-rules-matcher` |
| `calling-convention/` | `aot-codegen` | `calling-convention-spike`, `argc-overflow-calling-convention` |
| `flatten/` | `self-hosting` | `self-hosting-completion` |
| `form-complete/` | (repl-core.ss) | `repl-embedded-incremental` |
| `guard/` | (runtime.c) | — |

Verified: no spec requirement asserts spike retention (the "retained as historical tooling"
line in `self-hosting` refers to `tools/assemble-core.ss`, not `spike/`); the archived design
docs contain the empirical numbers; and nothing under `spike/` is on any build path.

## Goals / Non-Goals

**Goals:**
- Delete `spike/` in full.
- Leave zero dangling references and lose zero cited findings.

**Non-Goals:**
- Changing any spec requirement or system behavior.
- Touching `historical/` (that is a separately-scoped `reference` tree, out of scope here).

## Decisions

### Reference handling: reword to the durable record, don't relocate files
The findings cited from live docs are already stated *inline* in those docs — `LLVM.md`'s
calling-convention paragraph gives the ns/call numbers and the 5.4× rejection; `PIPELINE.md`
summarizes the nanopass scoring in its "Summary of the finding" bullets. Only the trailing
"full data: `spike/.../RESULTS.md`" pointers reach into the tree being deleted. So the fix is
to **reword each pointer to name the archived change** that holds the full data, not to copy
`RESULTS.md` files elsewhere. This keeps the docs self-sufficient and points readers at the
canonical OpenSpec record.
- **Alternative considered:** move `RESULTS.md` into `docs/` or into the archived change dirs.
  Rejected: the archived design docs already hold the same numbers, so moving the files would
  duplicate the record and re-introduce the "second source of truth" the deletion removes.

### Comment provenance: keep the fact, drop the live path
The three source comments (`recognize-let.ss` "Promoted from spike/nanopass/hand-passes.ss";
`repl-core.ss` "spike/form-complete"; `runtime.c` "Validated by spike/guard/") record real
provenance. Reword each to state the fact without pointing at a deleted path (e.g. name the
archived change, or state the provenance without the path). The history stays in git.

## Risks / Trade-offs

- **A future reader wants to re-run a spike.** → The prototypes are recoverable from git
  history; the decisions and numbers persist in specs + archived changes. Reproduction code
  is the least valuable and most reconstructable artifact.
- **A missed reference dangles.** → Mitigated by a repo-wide `git grep "spike/"` gate in the
  tasks: after deletion, the only permitted matches are inside this change's own archived
  proposal/design and the `complexity-catalogue` policy/spec text describing the taxonomy.

## Migration Plan

Deletion + edits only; recoverable via git. No build, runtime, or artifact impact.
