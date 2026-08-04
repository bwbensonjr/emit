## 1. Pin the current behaviour

- [x] 1.1 Record the pre-change baseline: `./run-all-tests.sh` and `./run-dev-tests.sh` both green,
      with timings; note that `bootstrap/` and `test/module-scaffold-baseline.sha256` are clean.
      **Baseline:** `run-all-tests.sh` 20 suites / 0 failed / 331s; `bootstrap/` and the baseline
      sha are clean. `run-dev-tests.sh` recorded separately (long-running).
- [x] 1.2 Inventory every in-tree use of the sixteen relocated names outside `src/prelude.scm`
      (`demos/`, `test/`, `docs/`, `lib/`) so step 5's sweep has a checklist. Expect the compiler's
      48 `caddr`/`cadddr`/`cdddr` sites (nine `CORE_FLAT` files) and `src/repl-core.ss`'s nine
      `rd-skip-ws`/`rd-token-end` sites — both are handled by the substrate import, not by edits.
      **Inventory.** The users split cleanly in two:
      *Chez-hosted, UNAFFECTED* (they run under Chez and bind Chez's own `read`/`open-*-file`, not
      the prelude's): `src/compile.ss`, `tools/gen-scheme-base.ss`, `test/repl.ss`,
      `test/repl-batch.ss`, `test/repl-frames.ss`, `test/repl-frontend.ss`, `test/dump-parity.ss`,
      `historical/genesis/*.ss`.
      *Emit-compiled, NEED IMPORTS in 5.5*: `demos/case-cxr.scm` (cxr), `demos/ports.scm`
      (`open-input-file`, `open-output-file`, `read`), and `test/io-ports-tests.sh` — the largest
      item, ~20 embedded programs using the file procedures and `read`.
      *Compiler core, handled by the substrate import, no edits*: `src/emit.ss` (10),
      `src/parse.ss` (9), `src/core.ss` (8), `src/passes/lower.ss` (5), `src/repl-core.ss` (3),
      `src/passes/expand.ss` (2), `simplify.ss`/`convert-closures.ss`/`convert-assignments.ss` (1
      each) for cxr; `src/repl-core.ss` for the two reader helpers.
- [x] 1.3 Confirm against `docs/r7rs/` whether `(scheme cxr)` is specified to export *only* the
      depth-3+ forms or also re-offer the depth-2 four (design open question 2), and record the
      answer in the design.
      **Answered** (`docs/r7rs/09-standard-libraries.md:190-215`): `(scheme cxr)` exports
      **twenty-four** procedures, the compositions of three to four `car`/`cdr` operations, and
      "the procedures `car` and `cdr` themselves and the four two-level compositions are included
      in the base library" — so the depth-2 four stay in `(scheme base)` and are NOT re-offered.
      Design open question 2 is closed. This also surfaced that Emit defines only 9 of the 24 →
      new decision **D9** (complete the library; task 5.1b).

## 2. Partition map (behaviour-preserving)

- [x] 2.1 Rewrite `src/prelude-surface.scm` from a subtraction set into a partition map: each
      prelude definition assigned to the library that exports it, or marked as belonging to no
      export list. Support assigning one definition to **two** libraries (needed in 4.2/4.3).
- [x] 2.2 Rewrite that file's header: it documents that list ordering is free "because this is a set
      to SUBTRACT", an invariant this change replaces. State the new one — order comes from the
      prelude, assignment comes from here.
- [x] 2.3 Assign every name to `(scheme base)` for now, so the surface is unchanged. Both guards
      (`test/scheme-base-surface-check.sh`, `test/scheme-base-gen-check.sh`) must pass untouched,
      and `git diff lib/scheme/base.sld` must be empty.

## 3. N-library baked form (behaviour-preserving)

- [x] 3.1 Generalize `scheme-base-library-form` (`src/core.ss:153`) from one hardcoded
      import-free `(scheme base)` to emitting the declared partition in dependency order, each
      member with its own exports, body, and imports. Make `scheme-base-export-names` per-library.
- [x] 3.2 Teach `tools/gen-scheme-base.ss` to emit one `.sld` per partition member instead of one
      file, and `test/scheme-base-gen-check.sh` to diff all of them.
- [ ] 3.3 With the partition still one member, verify nothing moved: full `./run-all-tests.sh` and
      `./run-dev-tests.sh` green, `git diff bootstrap/ lib/scheme/base.sld` empty, no baseline
      re-record. **Do not proceed until this holds** — it is what proves the generalization is
      behaviour-preserving before anything relocates.
      **BLOCKED — the gate did not hold, and the task's own wording was wrong.**
      (a) *Wording:* `git diff bootstrap/` can never be empty, because `src/prelude-surface.scm`
      and `src/core.ss` are compiler source in `CORE_FLAT` — adding a function to the compiler
      necessarily changes the compiler's IR. The correct gate is: `scheme.base.ll`,
      `lib/scheme/base.sld` (content), and `module-scaffold-baseline.sha256` unmoved, and both
      suites green.
      (b) *What holds:* after step 2, `run-all-tests.sh` 20/20 green;
      `bootstrap/scheme.base.ll` byte-identical (512594 both); `base.sld` exports+body
      byte-identical (only the regenerated header comment differs);
      `module-scaffold-baseline.sha256` unmoved.
      (c) *What does NOT hold — unexplained IR growth.* The three compiler IR files each grew
      ~18% (`schemec.ll` 2738890 -> 3230202) and gained **186 LLVM function definitions**
      (679 -> 865). Isolated by controlled experiment: the SAME compiler binary on the old flat
      source emits 679 program functions, on the new flat source 865 — so it is caused by the
      source change, not by a regen or fixed-point artifact. Bisected to `src/core.ss`: a hybrid
      of the new `prelude-surface.scm` with the OLD `core.ss` emits 679, i.e. the declaration
      helpers cost nothing. ~11 new defines and ~5 lambdas in `core.ss` should cost roughly 20
      functions, not 186; the flat source grew only 7157 bytes (2.8%) while IR grew 491312 bytes
      (18%), against a repo-wide source->IR ratio of ~10.6x.
      **Must be understood before steps 4-8 build on it** — binary size is an explicit
      `CLAUDE.md` design concern, and the substrate step multiplies whatever this is.

## 4. The substrate (behaviour-preserving for user programs)

- [ ] 4.1 Add `(emit internal)` as a partition member: the port representation group and the
      reader group (~40 names) move from "private in `(scheme base)`" to "exported by the
      substrate"; `(scheme base)` imports it. Verify a user program still cannot see them.
- [ ] 4.2 Assign the nine `cxr` forms to **both** `(emit internal)` and `(scheme base)` (dual
      assignment), so the compiler's 48 call sites keep resolving while `(scheme base)` still
      exports them at this step.
- [ ] 4.3 Move `rd-skip-ws`/`rd-token-end` into the substrate and delete
      `*scheme-base-unstable*` and its prose (design D8 — the consumer is `src/repl-core.ss`, not a
      macro template, per `src/prelude-surface.scm:51-52`). Retire the tier's guard assertion at
      `test/prelude-base-run-tests.sh:63`.
- [ ] 4.4 Add `(import (emit internal))` to the compiler's flat source (`tools/regen.sh`'s
      `CORE_FLAT` assembly) and confirm the bootstrap orders the substrate before `(scheme base)`.
- [ ] 4.5 Decide and implement whether `(emit internal)` is listed in `emit-libs.scm` for the Chez
      driver (design open question 1); whichever way, both drivers must resolve it identically.
- [ ] 4.6 Re-record `test/module-scaffold-baseline.sha256` **here**, with the delta explained per
      that script's header protocol — unit boundaries and `__init` order moved. This is the one
      re-record; keep it to this step so it has a single explanation.
- [ ] 4.7 Both suites green, including the self-hosting fixed point and the anti-stale trust-check.

## 5. Relocate (the breaking step)

- [ ] 5.1 Reassign the nine `cxr` forms so `(scheme base)` no longer exports them: the dual
      assignment becomes `(emit internal)` + `(scheme cxr)`, and `(scheme cxr)` is emitted as a
      generated on-disk `.sld`.
- [ ] 5.1b Add the fifteen missing four-level accessors (`caaaar` `caaadr` `caadar` `caaddr`
      `cadaar` `cadadr` `caddar` `cdaaar` `cdaadr` `cdadar` `cdaddr` `cddaar` `cddadr` `cdddar`
      `cddddr`) to the prelude, assigned to `(scheme cxr)` ONLY (design D9 — the compiler does not
      use them, so they do not go to the substrate). `(scheme cxr)` then exports all twenty-four.
- [ ] 5.2 Reassign `read` to `(scheme read)` and the six file procedures to `(scheme file)`, each
      importing `(emit internal)`. Generated on-disk `.sld` files.
- [ ] 5.3 Add the three libraries to `emit-libs.scm` with manifest-relative `(source …)` paths.
      `make install` already globs `lib/scheme/*.sld`, so confirm rather than edit.
- [ ] 5.4 Update `test/scheme-base-surface-check.sh` for the partition, and confirm the sixteen
      names are gone from `lib/scheme/base.sld`.
- [ ] 5.5 Sweep the in-tree users found in 1.2 — `demos/`, `test/`, any `.sld` — adding imports
      where a relocated name is used.
- [ ] 5.6 Both suites green.

## 6. Tests

- [ ] 6.1 New suite (or extend `test/prelude-base-run-tests.sh`): each of the sixteen names is
      **unbound** in a bare program and **bound and correct** after importing its library, on the
      run door, the AOT door, and the REPL door.
- [ ] 6.2 Assert `(cadr '(1 2 3))` still works with no import (the depth-2 four stay in
      `(scheme base)`), so the partition is not over-applied.
- [ ] 6.3 Assert substrate names (`rd-atom`, `rd-skip-ws`, `%make-port`) are unbound in a bare
      program — #29's privacy guarantee, preserved through the move.
- [ ] 6.4 Extend `test/install-layout-tests.sh`: an installed `emit` imports each of the three new
      libraries from an unrelated directory.
- [ ] 6.5 Assert a program importing nothing still runs with **no manifest present** — the
      guarantee the baked substrate exists to protect.

## 7. Docs

- [ ] 7.1 `docs/MODULES.md`: the shipped-library inventory, the baked-vs-manifest table (now two
      baked members), the substrate and why it is not API, and the partition map's role.
- [ ] 7.2 `README.md`: note the three new libraries and the breaking relocation.
- [ ] 7.3 Update `openspec/explorations/library-sources-and-artifacts.md` — mark step ④ landed,
      record that open question 2 is answered (no deprecation window, mechanically) and that
      question 6 was resolved by generating N `.sld` files from one partition map without `include`.

## 8. Close out

- [ ] 8.1 Verify every scenario in the two delta specs has a corresponding check.
- [ ] 8.2 Reference the issues in the commit: `Fixes #33` (relocation half) and `Fixes #32` (the
      unstable tier is retired by 4.3). Note in the PR that #33's §6 absence audit remains open —
      consider re-filing it as its own issue so `Fixes #33` does not close unfinished work.
- [ ] 8.3 `openspec validate scheme-base-partition`; sync specs and archive.
