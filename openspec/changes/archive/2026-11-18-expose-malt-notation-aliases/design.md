# Design

## Context

See proposal.md for motivation. The facade imports core Scheme syntax and prefixed implementation libraries, then exports ASCII names through ordinary library renames. The current malt-learner spec explicitly describes ASCII adaptations, so its inventory language needs updating together with a concrete alias contract.

The local pinned Racket sources export mathematical accessor, differentiation, diagnostic, and primal-operation names. Racket provides lambda syntax through its base language; Malt's `learner/lang.rkt` re-exports those language bindings. Hyperparameters remain ASCII upstream. Little-learning's `app/runtimes/emit.py` already sends code encoded as UTF-8 to a persistent Emit REPL, with `(malt learner)` as an ordinary requirement.

## Goals / Non-Goals

**Goals:** Reuse canonical binding identity, preserve the existing ASCII API, and expose the book's supported spellings through one explicit import.

**Non-Goals:** Global core-language lambda changes, Racket language compatibility, alternate hyperparameter spellings, additional numerical operations, or upstream's unimplemented extension-gradient stubs.

## Decisions

1. Add export renames in `lib/malt/learner.sld`, including a rename of imported `lambda` syntax. This preserves syntax identity and avoids runtime wrappers or a second implementation of lambda. A forwarding `syntax-rules` macro could emulate application syntax but adds unnecessary indirection and would not preserve canonical syntax identity. No compiler edit is expected; verify syntax import and re-export behavior before expanding scope if a defect emerges.
2. Export only aliases of supported facade operations, using the exact mapping in the delta spec. In particular, primal extensions alias the existing `ext1-primal` and `ext2-primal`, and `zeroes` remains the existing training utility while the Unicode primal spelling aliases `zeroes-primal`. Additional internal upstream helpers are outside this change.
3. Keep the internal libraries' interfaces stable. Update `test/malt-reference/export-map.json` for every added public name, with provenance distinguishing Racket syntax from Malt procedures. The existing `check.py` compares that map with every facade export; numerical reference fixtures do not need regeneration merely for aliases. Update `docs/MALT.md` and `lib/malt/PROVENANCE.md` to describe both spellings.
4. Extend the existing focused Malt test infrastructure with alias inventory checks and a small notation program. Check same-binding behavior, lambda formals and lexical scope, prefixed and renamed imports, and library re-exports. Exercise it through native run/REPL/build and the Chez source driver, plus installed-library coverage. A separate full compiler regeneration would add no evidence for a facade-only library edit.
5. Verify little-learning with its existing adapter using the local Emit executable and library root. This is an integration smoke check and requires no little-learning file edits. Install/release the resulting Emit version for normal application use; pointing `LL_EMIT_LIBRARY_PATH` at the updated sources also makes a compatible existing Emit binary consume the aliases during development.

## Risks / Trade-offs

- Import conflicts from newly exported names: existing explicit `only`, `except`, `prefix`, and `rename` import sets remain the resolution mechanism.
- Syntax renaming could expose a module-system defect: validate formal arguments, prefixing, re-export, lexical scope, and binding identity through the source and native paths. If compiler changes prove necessary, reassess the implementation and apply the compiler validation barrier before accepting it.
- Export provenance can drift: run the existing exact export-map guard after extending the inventory.
- A stale installed facade could hide the change from little-learning: run a smoke check with explicit local paths, and document installation/version expectations.

## Migration Plan

No caller migration is required. Existing ASCII expressions continue working. Implementation takes one minor SemVer bump with a matching changelog entry. Finish the completed implementation through `emit-finish-change`, including spec sync and archive in its reviewable PR. Reverting the alias addition removes the new API without changing the original ASCII procedures.
