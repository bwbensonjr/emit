Three commits, in this order, none red in between (design §"Migration"/D1–D7). The atomicity rule
throughout: `src/prelude-surface.scm`, the regenerated `lib/scheme/base.sld`, and the regenerated
`bootstrap/*.ll` land **in the same commit** — a `base.sld` that disagrees with the baked compiler
makes the driver and the run door emit different program modules, which
`test/prelude-base-run-tests.sh` catches, and `run-all-tests.sh` links `build/emit` from committed IR.

## 1. Commit 1 — the mechanism, with an empty policy (provably inert)

- [x] 1.1 Write `src/prelude-surface.scm` with **both lists empty** — `*scheme-base-private*` and
      `*scheme-base-unstable*` — and the full doc header: that `src/prelude.scm` is the source of
      truth for what `(scheme base)` *contains* while this file is the source of truth for what it
      *exports*; that both derivations read it; that export order comes from the prelude so this
      file's arrangement is free and can never move emitted IR; that the file rides the flat compiler
      core so its symbol cost lands in the three compiler binaries and never in `scheme.base.ll`; and
      the three tiers (R7RS / extension / unstable, the last requiring a per-name reason).
- [x] 1.2 Add the file to the flat-core lists, immediately **before** `src/core.ss` in each:
      `CORE_FLAT` in `tools/regen.sh:43-47`, the `(include …)` block in `src/compile.ss:40-50`,
      `compiler-source-files` in `src/compile.ss:459-471` (the "KEEP IN SYNC" comment at `:458`),
      **and the fourth copy the plan missed** — `test/self-host-fixpoint.sh:35-39` keeps its own
      `CORE_FLAT` (also marked KEEP IN SYNC), and without the new file stage-1 dies on an unbound
      `*scheme-base-private*`. Note in the commit message that `compiler-source-files` bumps the
      compiler stamp and so invalidates cached `.ll`/`.exports` — expected, not a failure.
- [x] 1.3 Replace the derivation in `src/core.ss:143-147` with `scheme-base-export-names`:
      `(filter (lambda (n) (and n (not (memq n *scheme-base-private*)))) (map define-name prelude-forms))`,
      keeping `scheme-base-library-form`'s signature unchanged so `src/core.ss:175`,
      `src/repl-core.ss:424`, and `src/entry-embed.scm:17` are untouched. Update the comment to say
      the export list is the declared surface and that order comes from the prelude.
- [x] 1.4 Teach `tools/gen-scheme-base.ss` to `(load "src/prelude-surface.scm")` and apply the same
      filter, so the two derivations read one declaration.
- [x] 1.5 Add the four rot assertions to the generator, each failing loudly with the offending names:
      a private name the prelude does not define; a private name that is a `define-syntax` (macros
      are never exported); an unstable name that is not in the resulting export list; a duplicate
      export (which would emit two identical `external global` lines and fail LLVM).
- [x] 1.6 Change the generator to write the export list **one name per line**, so any future surface
      change is a `+1`/`-1` diff in a committed file rather than a rewrite of one 3 KB line.
- [x] 1.7 Regenerate `lib/scheme/base.sld` (`chez --script tools/gen-scheme-base.ss`): same 213 names,
      reformatted. Confirm `test/scheme-base-gen-check.sh` is green (it diffs the whole file).
- [x] 1.8 Write `test/scheme-base-surface-check.sh` — Chez-free, wired into `run-all-tests.sh` next to
      the other `(scheme base)` suites: recompute the expected export list from `src/prelude.scm`'s
      top-level defines minus `*scheme-base-private*` and diff it against `base.sld`'s `(export …)`
      block; assert every private name is actually defined by the prelude and every unstable name is
      exported (mirroring 1.5 into the default suite, which the Chez-gated generator guard cannot do).
      The sigil invariant moves to 2.10: it can only be green once the policy exists, and this commit
      must stay green with an empty policy.
- [x] 1.9 `make regen`, confirm the fixed point converges in one iteration, and re-commit
      `bootstrap/{embed,embed-repl,schemec}.ll`. Verify the diff is only the new file's own code and
      that `bootstrap/scheme.base.ll` is **byte-identical**.
- [x] 1.10 Verify the checkpoint claim — "the mechanism landed and changed nothing observable": the
      export **set** is unchanged, so `test/module-scaffold-baseline.sha256` needs **no** re-record and
      `test/module-scaffold-baseline.sh check` passes untouched. Run `./run-all-tests.sh` then
      `./run-dev-tests.sh`; add `src/prelude-surface.scm` to the flat-file table in `src/README.md`.

## 2. Commit 2 — the policy: 213 → 136 exports

- [x] 2.1 Populate `*scheme-base-private*` with the 77 names, grouped by prelude section with a
      comment per group (list/utility helpers; numeric folds and kernels; the unsigiled-by-history
      internals `chr-cmp` / `ns-digits` / `ns-digits-radix`; dynamic-extent state and unwinding
      `*winds*` / `*handlers*` / `%unwind-to`; the `%ht-*` representation; the `rd-*` reader, noting
      #25 will change them; the `%port-*` / `%std*-port` representation). Derive the list mechanically
      from the prelude (all `%…`, `*…*`, `rd-…` names plus those three) minus the four in 2.2, and
      check the count: 213 defines − 77 private = **136 exports**.
- [x] 2.2 Populate `*scheme-base-unstable*` with `%with-handler`, `%with-parameters`, `rd-skip-ws`,
      `rd-token-end`, each with its reason: the first two are mentioned by the `guard`
      (`src/prelude.scm:612`) and `parameterize` (`:656`) templates, which expand in the importer's
      scope; the last two are used by the REPL's input-completeness probe
      (`src/repl-core.ss:528-600`), which deliberately reuses the reader's lexeme helpers so the two
      cannot drift.
- [x] 2.3 Regenerate `lib/scheme/base.sld` and confirm the diff is exactly 77 deleted export lines
      with no body change.
- [x] 2.4 `make regen`; confirm the fixed point converges; re-commit `bootstrap/*.ll`. Verify
      `bootstrap/scheme.base.ll` is byte-identical and that each of `embed.ll`, `embed-repl.ll`,
      `schemec.ll` loses exactly 77 `= external global i64` lines (213 → 136). *Done and verified
      (136 declares per module, `scheme.base.ll` byte-identical); the later comment fix in
      `src/prelude.scm` changes the baked `*prelude-source*` string, so the committed IR is
      re-derived once more in 3.5 rather than twice here.*
- [x] 2.5 Capture the demo-IR evidence the re-record protocol demands
      (`test/module-scaffold-baseline.sh:20-27`): all 80 demo IRs before and after, showing **only**
      `−77 external global i64` lines per demo — zero additions, zero deletions elsewhere, zero
      reordering. Re-record `test/module-scaffold-baseline.sha256` and add the log entry to that
      script's header, including the two facts that answer the issue's caveats: shipped binary sizes
      and the shaken AOT output are unchanged (`program-root-internals`, `src/compile.ss:563-568`, is
      reference-driven, and an unreferenced declaration produces no relocation).
- [x] 2.6 Add the issue's repro to `test/prelude-base-run-tests.sh`: `rd-atom`, `%map1`, and
      `%port-buf` are unbound under `emit run` (using the existing `run_unbound` helper) while `map`
      still resolves; confirm the same on the REPL door in `test/prelude-base-repl-tests.sh`.
- [x] 2.7 Confirm the private helpers still serve their callers on every door — `read-from-string`
      over the `rd-*` family, the ports and hash tables over their `%` representations, `guard` /
      `parameterize` / `dynamic-wind` over the wind list — via
      `test/io-ports-tests.sh`, `test/dynamic-extent-tests.sh`, and `chez --script
      test/read-all-tests.ss` (a raw `(load "src/prelude.scm")`, unaffected by export status).
- [x] 2.10 Add the sigil invariant to `test/scheme-base-surface-check.sh` (deferred from 1.8): no
      exported name is spelled `%…`, `*…*`, or `rd-…` unless it is declared unstable — the naming
      convention as a *checked consequence* of the declaration rather than as the mechanism.
- [x] 2.8 Update `docs/MODULES.md`'s `(scheme base)` section (`:210-223`): the surface is declared,
      not derived; the three tiers with the extension list named; `base.sld`'s export list is a
      reviewed golden and the guard that enforces it. Correct the two stale comments that claim
      `%str-concat` is in use (`src/parse.ss:151`, `src/passes/expand.ss:338`).
- [x] 2.9 *(subsumed by 3.6 — the renames landed before the final verification run, so both suites
      were run once over the finished state rather than twice.)* `./run-all-tests.sh` then
      `./run-dev-tests.sh` (the latter adds
      `test/scheme-base-gen-check.sh`, `test/prelude-base-tests.sh`, `test/aot-tree-shaking-tests.sh`,
      `test/self-emit-equiv.sh`, `test/self-host-fixpoint.sh`, `test/trust-check.sh`).

## 3. Commit 3 — retire two unstable names by renaming the definitions

- [x] 3.1 Rename `%with-handler` → `with-exception-handler` at its definition
      (`src/prelude.scm:569`) and in the `guard` template (`:612`); keep the R7RS §6.11 note in the
      comment and state that `raise-continuable` is still absent. There are no other call sites in
      the tree (uses of `guard` are macro uses, not calls).
- [x] 3.2 Rename `%with-parameters` → `with-parameters` at its definition (`src/prelude.scm:646`) and
      in the `parameterize` template (`:656`), preserving design D3's "restoration comes from one
      place" comment.
- [x] 3.3 Shrink `*scheme-base-unstable*` to `(rd-skip-ws rd-token-end)` and move the two renamed
      names into the documented tiers — `with-exception-handler` as R7RS, `with-parameters` as an
      extension.
- [x] 3.4 Add cases to `test/dynamic-extent-tests.sh`: `with-exception-handler` called directly (a
      handler that escapes sees the raised object; the chain is restored on normal exit) and
      `with-parameters` called directly with computed lists; confirm `guard` and `parameterize` still
      pass unchanged on all four doors.
- [x] 3.5 Regenerate `lib/scheme/base.sld`; `make regen`; re-commit `bootstrap/*.ll`. This is the only
      commit in which `bootstrap/scheme.base.ll` moves — verify the diff is exactly two renamed
      globals and two renamed code labels (labels are name-derived, `src/passes/lower.ss:91-92`) — and
      re-record `test/module-scaffold-baseline.sha256` again, with its own log entry noting the diff
      shape differs from commit 2's pure deletions.
- [x] 3.6 `./run-all-tests.sh` then `./run-dev-tests.sh`.

## 4. Close-out

- [x] 4.1 Refresh `docs/COMPLEXITY.md` for the new file (the `complexity-catalogue` skill).
- [x] 4.2 Sync the delta specs into `openspec/specs/module-system/spec.md` and
      `openspec/specs/dynamic-extent/spec.md`.
- [x] 4.3 Open follow-up issues (filed as #31 D6, #32 hygiene, #33 R7RS audit): (a) bake `lib/scheme/base.sld` instead of `src/prelude.scm` once the
      generator can run under `build/emit run` — deletes the dual derivation and removes ~33 KB of
      baked comments from `embed.ll`/`embed-repl.ll` (design D6); (b) resolve prelude macro-template
      names hygienically against library-internal bindings, which would retire the unstable tier
      entirely; (c) the R7RS surface audit — what `(scheme base)` is missing, and the nine names Emit
      ships in it that R7RS puts in `(scheme cxr)` / `(scheme read)` / `(scheme file)`.
- [ ] 4.4 Reference `Fixes #29` on the final commit, and note in the issue that the extension tier is
      documented rather than moved to an `(emit extras)` library. *Left for the repo owner: nothing
      in this change has been committed, and the three-commit split above is the intended shape
      (mechanism / policy / renames). `test/trust-check.sh` stays SKIPped until `bootstrap/` is
      committed — `test/self-host-fixpoint.sh` covers the same derivation from source and passes.*
