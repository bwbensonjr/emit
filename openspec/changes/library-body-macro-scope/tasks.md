## 1. De-risk first: does pre-resolution move emitted IR? (design D4)

Everything downstream is contingent on this. Do it before touching the partition, on a throwaway
branch — a bad result sends the change to the D1 fallback (design Open Question 2), not into surgery.

- [x] 1.1 Enumerate the derived forms and, for each, list the template identifiers that are not
      pattern variables, core keywords, primitives, or integrables — the ones pre-resolution would
      rewrite. Expect `case`→`memv`, `guard`→the handler machinery, `parameterize`→its procedures.
- [x] 1.2 For each such identifier, record what it resolves to on the **program** path today and
      what it would resolve to pre-resolved in `(emit internal)`/`(scheme base)`. Flag every
      disagreement.
- [x] 1.3 Build a representative program both ways and diff the emitted program IR byte-for-byte.
      Record the result in `design.md` under D4 as a measured fact, not a prediction.
      **Closed without a diff, because two of three cases resolve by construction and the third has
      no baseline** — see design "Measured findings 1.3". Program IR cannot move (D3 keeps the source
      merge); emitted member IR contains zero `syntax-rules` references so the copies cost no code;
      the library path currently fails, so there is nothing to regress. Also corrected a proposal
      claim: dropping the copies is **not** a binary-size win.
- [x] 1.4 Decide and record: proceed with the export-interface shape, or retreat to the D1 fallback
      (define the macros in `(scheme base)`, keep body-injection for `(emit internal)` alone). If
      retreating, revise `proposal.md` and the delta spec before continuing.
      **Decision: proceed, with D1 revised to SPLIT homing.** Single-home-in-`(emit internal)` is
      impossible — `case`/`guard`/`%guard-clauses`/`parameterize` reference prelude procedures the
      substrate cannot resolve, and an unresolvable template identifier is left as written and
      hygiene-renamed, which would break `case` in every importer. The measurement showed the four
      forms the partition actually uses (`cond`, `and`, `or`, `let*`) are exactly the four whose
      templates need nothing from `(scheme base)`, so the split is clean. The Open-Question-2
      fallback is **not** taken; re-export is still required.

## 2. Re-export of an imported macro (spec: "A library may re-export a macro it imports")

Independently useful and the hard prerequisite for `(scheme base)` re-exporting the substrate's
transformers. Verified absent today: `compile-library: export of a name the library does not define`.

- [ ] 2.1 Relax `compile-library*`'s export check (`src/core.ss:773`+) to accept a name bound in the
      merged `macro-env` (own plus `import-tables->macro-env`), not only in the library's own.
- [ ] 2.2 Carry a re-exported transformer into the re-exporting library's compile-time half with its
      original resolution intact, so an importer two units away expands against the defining
      library's bindings.
- [ ] 2.3 Make `(rename <internal> <external>)` work over a re-exported macro.
- [ ] 2.4 Extend the tree-shake root set to follow a re-exported transformer's referenced symbols
      **transitively**, so a private binding two units away is not pruned into a link-time undefined
      symbol (design R2).
- [ ] 2.5 Keep the "exports a name the library does not define" error for a name that is neither a
      definition nor a macro in scope.

## 3. Macro vocabulary in the surface declaration (design D5)

- [ ] 3.1 Decide the representation (design Open Question 3): extend `*prelude-assignments*` to admit
      `define-syntax` names, or add a parallel macro table. Record the choice and why.
- [ ] 3.2 Teach the declaration to assign a macro a **home** and to mark a **re-export**.
- [ ] 3.3 Update `library-export-names` (`src/core.ss:159`) so an export list can include macro names
      — today it maps `define-name`, which is `#f` for a `define-syntax`.
- [ ] 3.4 Mirror all of the above in `tools/gen-scheme-base.ss` so the two derivations still agree
      (design D6).

## 4. Home the derived forms and distribute them by import (design D1/D2)

- [ ] 4.1 Declare `and`, `or`, `let*`, `cond`, `when`, `unless` homed in `(emit internal)` — the six
      whose templates reference only core keywords and their own keyword (task 1.1).
- [ ] 4.2 Declare `case`, `guard`, `%guard-clauses`, `parameterize`, `do`, `%do-step` homed in
      `(scheme base)`, where the procedures their templates call (`memv`, `raise`,
      `call-with-current-continuation`, `with-exception-handler`, `with-parameters`) are defined.
      Homing these in the substrate is **not possible** — see design D1.
- [ ] 4.3 Declare `(scheme base)` as re-exporting the substrate's six, so a unit importing
      `(scheme base)` sees all twelve and cannot tell where each is homed.
- [ ] 4.4 Delete the body copy in `library-body-forms` (`src/core.ss:167-172`) and the comment that
      documents it as a workaround.
- [ ] 4.5 Confirm `(scheme cxr)` / `(scheme read)` / `(scheme file)` still compile — measured usage is
      only `or` and `let*`, both substrate-homed and reached through `(scheme base)`'s re-export.
- [ ] 4.6 Assert the negative: a program must still fail on a name private to `(emit internal)`, so
      the re-export does not widen program scope past #29's privacy guarantee (design R4).

## 5. The library path picks the macros up

- [ ] 5.1 Verify `compile-library*`'s existing `import-tables->macro-env` merge needs no change — the
      hook already exists; the work above is what makes it carry the derived forms.
- [ ] 5.2 Confirm a library's own `define-syntax` still shadows an imported keyword of the same
      spelling (`macro-lookup` is an `assq` and own macros come first).
- [ ] 5.3 Leave `prelude-macro-forms`' program-path merge in place (design D3), and confirm no
      program's `macro-env` changed.

## 6. Diagnostic (design D7)

- [ ] 6.1 When a head names a known derived form not in the compiling unit's `macro-env`, report a
      macro that is not in scope and name `(scheme base)` as the library that exports it.
- [ ] 6.2 Make the message identical on all three doors.

## 7. Tests

- [ ] 7.1 `test/modules-tests.sh`: a fixture library using `cond`, `when`, and `and` in its body;
      a re-export fixture (`relib` re-exporting `macro-helper-lib`'s `twice`); a fixture whose
      re-exported template reaches the original library's private helper.
- [ ] 7.2 `test/modules-run-tests.sh` and `test/modules-repl-tests.sh`: the same fixtures on the run
      and REPL doors, for dev→ship fidelity.
- [ ] 7.3 `test/aot-tree-shaking-tests.sh`: a private binding reachable only through a **re-exported**
      template survives the shake, and is pruned when the macro is unused.
- [ ] 7.4 A negative test for the new diagnostic: a library without `(import (scheme base))` using
      `(when …)` reports a macro not in scope, not an unbound variable.
- [ ] 7.5 A negative test that a substrate-private name is still unbound in a program.
- [ ] 7.6 Extend the driver-vs-run-door byte-identity pin (`test/prelude-base-run-tests.sh`) to cover
      the macro half of the export interface (design D6).
- [ ] 7.7 Update `test/scheme-base-gen-check.sh` / `test/scheme-base-surface-check.sh` for a
      generated surface that now includes macro exports.

## 8. Build barrier and full verification

Per `CLAUDE.md`: finish every compiler-source edit before starting `make regen`, and make no more
until the suites finish.

- [ ] 8.1 Iterate the whole edit/test loop with `chez --libdirs src --script src/compile.ss` — no
      regen until the work is done.
- [ ] 8.2 `make regen` (~12 min), once, after the last source edit.
- [ ] 8.3 `./run-all-tests.sh`, then `./run-dev-tests.sh`. Run long suites individually if they
      outlive the command timeout.
- [ ] 8.4 Record the size delta from dropping the body copies (task 4.4). Task 1.3 measured the
      expected effect as ~9 KB of committed generated `.sld` text and **zero** change to any binary;
      confirm that, and correct the record if a binary does move.
- [ ] 8.5 Task 1.3 expects program IR not to move, so this should be a no-op. If it does move,
      update `test/module-scaffold-baseline.sha256` and confirm `test/trust-check.sh` is clean
      **after** committing — and treat the surprise as a signal to re-read D3.

## 9. Documentation and close-out

- [ ] 9.1 `docs/MODULES.md`: delete the "A library body cannot use a derived-form macro" bullet from
      Scope & limits; update the export surface for re-export; correct the importer-vs-exporter
      resolution note at `:342-345`, which currently states the baked set is always resolved in the
      importer.
- [ ] 9.2 `docs/PROJECTS.md`: remove the derived-form-in-a-library-body limit from "Limits you will
      hit" and keep the `syntax-rules`-only bullet.
- [ ] 9.3 `docs/PIPELINE.md`: the macro-env sources for the library path.
- [ ] 9.4 Reference the issue from the implementing commit (`Fixes #55`).
- [ ] 9.5 Comment on #48 noting that its design D5 bound — an exported template mentioning a derived
      form fails in a library importer — no longer holds.
- [ ] 9.6 If the D1 fallback was taken (task 1.4), file a follow-on issue for the residual
      body-injection in `(emit internal)` rather than leaving it undocumented.
- [ ] 9.7 Sync specs and archive the change.
