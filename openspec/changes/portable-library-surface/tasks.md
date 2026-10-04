# Tasks

> **Regen barrier** (`CLAUDE.md`): groups 2–7 edit `CORE_FLAT`, `src/repl-core.ss`, or
> `src/prelude.scm`. Iterate with `chez --libdirs src --script src/compile.ss` and finish every
> compiler-source edit before group 9's `make regen`. `src/compile.ss` is exempt from regen.
> `src/emit.cpp` reaches the binary through plain `make`.

## 1. Baseline and bookkeeping

- [x] 1.1 Write a test that observes the precedence rule overlapping whole imports follow today
      (two libraries exporting `f`, plus the same for a macro keyword) on the Chez driver and
      `emit run`. Verify it passes unchanged on the current tree (design D5).
- [x] 1.2 File a GitHub issue (account `bwbensonjr`) for the R7RS rule that an identifier imported
      with two bindings is an error. Include the reproduction from 1.1, a pointer to design D5,
      and a possible fix. Verify with `gh issue view`. *Filed as #118. The rule observed in 1.1 is
      first-import-wins, for procedures and macros alike, on both paths.*
- [x] 1.3 Record `test/module-scaffold-baseline.sh check` passing on the starting tree, and one
      self-compile wall-clock figure for design's expander-cost risk. Verify by noting both in the
      task. *Recorded 2026-10-03: scaffold check OK (82 hashes); `make regen` on the unchanged tree
      converged at iteration 1 in 206 s, with the fixed point's two self-compiles at 104 s (~52 s
      each).*

## 2. Import-set parsing and table transforms (design D1, D2)

- [x] 2.1 Replace `check-import-spec` in `src/core.ss` with an import-set parser that returns
      `(library-name . transform)` and validates shape, so a malformed `prefix`/`rename`/`only` is
      an error naming the set. Route every "spec to library name" use through one accessor:
      `collect-imports`, `parse-define-library`, and the imports query. Verify with new cases in
      `test/expander-tests.ss` or a new `test/import-set-core-tests.ss` run under Chez.
- [x] 2.2 Implement the table transform over runtime rows, call rows (renamed in lockstep), and the
      ct-half. Keep hidden or renamed public macro entries installed under their unit-qualified
      spelling. Raise an error naming the set when `only`/`except`/`rename` names an absent export.
      Verify with core tests covering nesting, a prefixed macro whose template calls a private
      helper, and `except` of a macro that a kept macro's template uses.
- [x] 2.3 Apply derived tables wherever import tables become an environment, macro-env, call-alist,
      or keyword set, for both programs and libraries. Verify `test/modules-tests.sh` (Chez driver)
      with new fixtures under `test/modules/` for each spec scenario in "Import sets select and
      rename exports in the importer".
- [x] 2.4 Confirm a direct cross-unit call survives `prefix`/`rename`, meaning the call row is
      still found. Verify by adding a case to `test/cross-unit-direct-call-tests.sh` that inspects
      the IR for the direct call.

## 3. Implicit `(scheme base)` and the REPL (design D3, D4)

- [x] 3.1 Make an explicit `(scheme base)` import set suppress the implicit view's bindings and
      macros, while keeping linking and initialization, and keep a bare `(import (scheme base))`
      identical to today. Verify with the two new scenarios of "Implicit import of (scheme base)" in
      `test/prelude-base-tests.sh` and `test/prelude-base-run-tests.sh`. *Landed in
      `test/import-set-tests.sh` instead (cases `base-*`), which runs the Chez driver and
      `emit run` against the same fixtures. Both prelude-base suites still pass unchanged.*
- [x] 3.2 Change the REPL import mode in `src/repl-core.ss`, and its caller in `src/emit.cpp`, to take
      a whole spec and merge the derived table. Verify with `test/modules-repl-tests.sh` cases for
      `only`, `prefix`, and successive imports of one library through different sets. *The host
      needed no change: it already resolves through mode 12, which now reports the libraries a set
      reaches. The cases landed in `test/import-set-tests.sh` (`repl-*`), beside the batch cases
      they mirror.*
- [x] 3.3 Document the precedence rule observed in 1.1 and the `(scheme base)` replacement rule in
      `docs/MODULES.md`. Delete the import-set entry from "When you break a rule" and from "Scope &
      limits". Verify every example added to the doc is drawn from a `test/modules/` fixture. *The
      examples come from `test/import-sets/`, this change's fixture directory.*

## 4. Program-level `include` and `cond-expand` (design D8)

- [x] 4.1 Factor the cond-expand evaluator, include stack, and `read-included` out of
      `expand-library-declarations` so a top-level form splicer can share them. Add the splicer and
      run it before `collect-imports` on every path, including mode 12. Verify with
      `test/library-include-tests.sh` still passing unchanged.
- [x] 4.2 Splice each REPL input the same way, evaluating spliced forms in order. Verify with
      `test/modules-repl-tests.sh` and `test/repl-equiv-tests.sh` cases using `(include "defs.scm")`.
      *A prompt splice is queued in the session state and drained through a new mode 22. The
      host's `process_form` was split into `compile_guarded` and `handle_form_result` for this.
      The cases are `repl-include*` and `repl-cond-*` in `test/import-set-tests.sh`.*
- [x] 4.3 Add program fixtures for each spec scenario in "`include` and `cond-expand` splice at a
      program's top level", run from a temporary directory outside the repo on every path. Verify
      with a new `test/program-include-tests.sh`, registered in `run-all-tests.sh`. *Landed as
      sections of `test/import-set-tests.sh` (`top-*`, including a stdin case), which shares its
      fixtures and its Chez-driver and `emit run` runners. Building the cases exposed one host
      fix: the Chez driver now restores the program's source home before compiling it, after
      its libraries moved the home.*

## 5. Body-level and expression-level splicing (design D9)

- [x] 5.1 Splice `include`/`include-ci`/`cond-expand` in `exp-body` before `add-body-defines`, and
      add the expression-position `begin` arm to `exp` in `src/passes/expand.ss`, both honoring
      `bound` shadowing. Verify with `test/expander-tests.ss` cases for a body definition from a
      file, expression-position `cond-expand`, and a shadowed `include`. *The splice calls into
      the core (include reader, feature table), which `test/expander-tests.ss` does not load, so
      these cases run end to end instead: `body-include`, `expr-cond`, `expr-cond-none`,
      `body-cond`, and `shadow-include` in `test/import-set-tests.sh`. The expander suite still
      passes, 39/39.*
- [x] 5.2 Add the `eq?`-keyed include-origin table populated by `read-included` (skipping
      `quote`/`quasiquote`), cleared per compilation unit and consulted by the expander. Verify with
      a library fixture whose included body file includes a sibling file, from a temporary working
      directory, on every path. Also verify the cycle and unreadable-file diagnostics for it.
      *The table is NOT cleared per unit. The Chez driver parses a whole closure before
      compiling any of it, so a per-unit reset would drop entries still needed. Entries are keyed
      by identity, so a stale one cannot answer for another form. The unit's own forms are
      anchored too, through a host-installed source-home reader read at parse time. Cases:
      `lib-include` (via `iset/inc/body.scm` -> `more.scm` -> `deep.scm`), `top-nested`,
      `top-cycle`, and `body-unreadable`.*
- [x] 5.3 Extend the cross-host equivalence suites (`test/reader-datum-parity-tests.sh` or
      `demos/run-embedded.sh`) with one program-level and one body-level include. Verify the Chez
      driver and the binary emit identical IR for them. *Added as `ir_parity` in
      `test/import-set-tests.sh`, covering top-level, body-level, and nested includes.*

## 6. `(library …)` requirements (design D6, D7)

- [x] 6.1 Replace the D8 refusal in `feature-requirement-met?` with a lookup in a core availability
      table, plus a host-installed predicate side channel. Validate the `(library ⟨name⟩)` shape.
      Install the Chez driver's predicate over its resolver in `src/compile.ss`. Verify with Chez
      driver fixtures for the root-present and root-absent scenarios. *The predicate saves and
      restores the source home and include record, because validating a directory source parses
      it mid-parse. Baked members answer #t in the core without asking.*
- [x] 6.2 Add pending-name recording and the pending reply to the imports query, plus an
      answer-submission mode, in `src/repl-core.ss`. Answer them from the C++ resolver in
      `src/emit.cpp` through the memoized resolution `import` uses, looping until settled. Treat a
      miss during compilation as an internal error. Verify with a fixture that needs two rounds,
      where an answer selects a clause with a second `(library …)`, under `emit run`, `emit build`,
      and `emit repl`. *Every host call site of the imports query now settles. So does the REPL's
      eager preload, and so does a prompt form whose text mentions `library`. The mode-18 identity
      check tolerates an unanswered requirement, because a declared name depends on no clause.
      `emit build` shares `emit run`'s preload. The cases are `two-rounds-*`, `lib-req-*`, and
      `repl-lib-req`.*
- [x] 6.3 Record `(name . answer)` pairs in the unit stamp and validate them by re-resolution. Bump
      `compiler-stamp-version`. Verify with the two new `artifact-cache` scenarios in
      `test/artifact-cache-tests.sh`, adding then removing `srfi/8.sld` under a root. *Both
      hosts: the binary's `.sources` record carries `LIBRARY` lines, re-checked through the
      command's resolver, with `kCacheVersion` 2 -> 3. The Chez `.stamp` gains a fifth element,
      with `compiler-stamp-version` 2 -> 3. The cases ("cache follows the answer", "Chez driver
      stamp follows the answer") live in `test/import-set-tests.sh`, beside the fixtures they
      toggle.*
- [x] 6.4 Document `(library …)` answering, its bake-time rule for baked libraries, and the cache
      behavior in `docs/MODULES.md`. Remove the D8 refusal text. Verify with an example drawn from a
      fixture.

## 7. `features` and feature identifiers (design D10, D11)

- [x] 7.1 Add the intrinsic that expands to the quoted `*advertised-features*` list. Define
      `features` in `src/prelude.scm` and declare it in `src/prelude-surface.scm`. Verify with
      `test/scheme-base-surface-check.sh` and `test/scheme-base-gen-check.sh`, then a program
      checking `(memq 'emit (features))` on every path. *`lib/scheme/base.sld` was regenerated
      with `tools/gen-scheme-base.ss`. The new export moved every demo's IR by exactly the
      `features` definition plus one extern declaration, verified by a before/after capture and
      recorded in `test/module-scaffold-baseline.sh`, whose reference was re-recorded.*
- [x] 7.2 Add `srfi-0`. For each candidate SRFI in design D11, add a behavior test first and then
      either add the identifier or record the absence and its reason beside
      `*advertised-features*`. Verify with the `features`-agrees-with-`cond-expand` scenario looping
      over `(features)`. *Added srfi-6, -9, -16, -23, -30, -39, -62, and -87, each with a fixture
      under `test/import-sets/srfi/`. srfi-2 and srfi-8 are recorded as absent.*
- [x] 7.3 Update the R7RS conformance inventory (`openspec/explorations/r7rs-conformance-suite/`
      and `test/r7rs/`) for import sets, program/body `include` and `cond-expand`, and `features`.
      Verify with `test/r7rs-manifest-gen-check.sh` and `EMIT_R7RS=1 test/r7rs-suite-tests.sh`.
      *The two 6.14 `(features)` exclusions were removed, and the suite now runs 977 forms with 203
      excluded, recorded in `test/r7rs/README.md`. The exploration's `inventory.txt` is a dated
      snapshot and was left alone. The suite has no import-set or include forms; the full
      staleness pass runs in group 9.*

## 8. Snow-fort acceptance (design D12)

- [x] 8.1 Vendor the first candidate SRFI package (SRFI 1 from snow-fort.org) under
      `test/snow/` with its license and an origin note giving the URL, version, and date. Compile
      it unmodified from a library root. If it needs anything out of scope, file an issue per gap
      and fall back to a smaller package. Verify with the package compiling under `emit lib`.
      *SRFI 1 0.1.3 is blocked twice, by #121 (re-exporting an imported procedure) and by #120
      (its dependency `(srfi 227)`'s macro reaches an imported `case-lambda`), both filed with
      minimal reproductions. Per design D12, `(srfi 8)` 0.1.2 and `(srfi 2)` 0.1.1 are vendored
      unmodified under `test/snow/lib/`, with metadata, tests, and provenance (URL and sha256) in
      `test/snow/README.md`.*
- [x] 8.2 Add a smoke program exercising the vendored package through an import set, for example
      `(import (prefix (srfi 1) s1:))`, on the Chez driver, `emit run`, `emit build`, and
      `emit repl`. Verify with a new `test/snow-package-tests.sh` in `run-all-tests.sh` with
      identical output across paths. *`test/snow/smoke.scm` imports `(prefix (srfi 2) s2:)` and
      `(srfi 8)`, uses expression-position `cond-expand`, and gets the same value on all four
      paths.*
- [x] 8.3 Update "Scope & limits" in `docs/MODULES.md` and the snow-fort status in
      `openspec/explorations/library-sources-and-artifacts.md` to name what now works and what the
      package run exposed. Verify the issues it cites exist.

## 9. Regen and integration

- [x] 9.1 Run `make format`, then `make regen`, after every compiler-source edit is finished.
      Verify that it converges and that `test/module-scaffold-baseline.sh check` still passes, or
      that any delta is explained before re-recording. *`make format-check` is clean. The final
      regen converged at iteration 1 in 234 s and left `bootstrap/` byte-identical, so the
      committed IR is the regenerated IR. The baseline moved only by `features`, which was
      explained and re-recorded in group 7.*
- [x] 9.2 Run `./run-all-tests.sh` and then `./run-dev-tests.sh`, suite by suite if a timeout
      requires it. Commit, then run `test/trust-check.sh`. Verify all suites pass. Compare one
      self-compile's wall clock against the figure from 1.3 and record the delta. *Results:
      `run-all-tests.sh` 44/44. The one first-run failure, reader datum parity, used an import set
      as its load-failure fixture and was updated. `run-dev-tests.sh` 23/26: every failing case is
      the Chez driver's `lli` JIT backend (`jit=` empty, `-load=` rejected by LLVM 23), which is
      pre-existing issue #117 and fails identically on `main`. Self-compile: the fixed point's
      pair went 104 s -> 119 s across this change. The same-input comparison (main's committed
      `embed.ll` vs this branch's, each compiling the new flat source, alternating runs) gives
      57/59 s old vs 58/53 s new, so the compiler is not slower per byte. The growth is the
      compiler's own source, which grew ~23.5 KB (~4.5%, most of it comments in `src/core.ss`).
      `test/trust-check.sh` after commit f393d00: OK, the committed IR is exactly what the source
      regenerates.*
