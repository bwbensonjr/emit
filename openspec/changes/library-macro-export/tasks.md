## 1. Baselines and fixtures (do first — they are the evidence)

- [x] 1.1 Record today's behaviour for the three cases the change must flip, against the current
      `build/emit`: `(export swap!)` where `swap!` is a `define-syntax`
      (`a library cannot export a macro …`), the same library with the macro dropped from the export
      list (importer gets `unbound variable swap!`), and a template calling a private helper
      → recorded for all six fixtures. Both symptoms reproduce verbatim. **Unplanned finding:** the
      double-binding case (1.7) does not error today — it silently *succeeds*, exporting the
      procedure and discarding the `define-syntax` (`prog-macro-dupname` => 2). So D3's rejection
      replaces a silent drop, not an arbitrary pick.
- [x] 1.2 Add fixture `test/modules/macrolib.sld`: exports one macro (`swap!`) plus one procedure,
      with the macro's template mentioning **only** universally-known names — the simplest case that
      must work first
      → plus `prog-macrolib.scm`, which defines its own `tmp` so a hygiene failure is a wrong
      answer (32) rather than a compile error.
- [x] 1.3 Add fixture `test/modules/macro-helper-lib.sld`: exports a macro whose template calls a
      **private** helper and uses a **private** macro, and exports neither (design D2, D3)
      → plus `prog-macro-helper.scm`, which defines its own conflicting `helper`, so resolving in
      the importer would give a wrong answer rather than a link error. Doubles as the D6 shake
      fixture; `prog-macro-unused.scm` is its negative half for task 7.3.
- [x] 1.4 Add fixture `test/modules/macro-rename-lib.sld`: `(export (rename %swap swap!))` over a
      `define-syntax` — the case the removed spec requirement used to prohibit
      → plus `prog-macro-rename.scm` and `prog-macro-rename-bad.scm` (the internal keyword must
      stay invisible).
- [x] 1.5 Add fixture pair `test/modules/macro-dup-a.sld` / `macro-dup-b.sld`: two libraries each
      exporting a macro whose template calls a private helper **of the same spelling**, for the
      composition case in R3
      → plus `prog-macro-dup.scm` => 103; a shared resolution gives 4 or 202, so this is a value
      check, not a link check.
- [x] 1.6 Capture `test/module-scaffold-baseline.sha256` and the `.exports` of every library in
      `build/lib` before any source change, so "not a byte moves" is measured, not asserted
      → 13 files copied aside with their sha256; `test/module-scaffold-baseline.sh` green before
      the change (80 demo IR hashes match).
- [x] 1.7 Add negative fixture `test/modules/macro-dupname-lib.sld` (one name bound by both
      `define` and `define-syntax`) for the D3 rejection, and register every fixture in
      `test/modules/emit-libs.scm`

## 2. The compile-time interface: shape, render, read (design D1)

- [x] 2.1 Define the fourth `.exports` field as
      `(<macro-entry> … ) <own-refs> <foreign-refs>` with `<macro-entry>` in
      `parse-define-syntax` shape (`src/passes/expand.ss:37-43`), so neither side converts
      → `make-ct-half` / `table-ct-half` / `ct-macros` / `ct-own-refs` / `ct-foreign-refs`,
      `src/core.ss`. Own-refs are the unit's **internal names** (the shake wants those);
      foreign-refs are mangled **strings**, matching the runtime rows' convention.
- [x] 2.2 Extend `render-datum` (`src/core.ss:356`) to render the fourth field, keeping it the
      single renderer shared by the artifact writer and the diagnostics
      → **stronger than planned, and it simplified the change:** the *driver* now writes through
      `render-datum` too (`src/compile.ss`), replacing Chez's `write`. Measured first — the two agree
      byte-for-byte on all 9 committed tables including `scheme.base.exports` — so unifying moved
      nothing and made cross-door byte-identity (6.2) hold by construction instead of by two
      implementations agreeing. Added booleans (common in templates) and `render-char`, which errors
      rather than emit a spelling the other door's reader cannot read back.
- [x] 2.3 Add accessors beside `import-tables->env-alist` (`src/core.ss:607`) that read the fourth
      field and **return empty for a three-field table**, so a stale or hand-copied artifact is read
      rather than crashed on (risk R1)
      → and the inverse: `export-table-datum` **omits** the field when empty, so a macro-free library
      writes the datum it always wrote. Every pre-existing `build/lib` artifact is byte-identical
      (verified, 13 files), which is a stronger form of 8.5 than planned.
- [x] 2.4 Pin R1 directly: hand-write a three-field `.exports` and confirm a program importing that
      library still compiles and links
      → covered for free by 2.3: every macro-free library in the tree *is* a three-field table, and
      35 module-suite cases read them. Pinned explicitly in `modules-tests.sh` by the byte-identity
      of the committed artifacts.

## 3. Export-time resolution (design D2, D3)

- [x] 3.1 Add the classification helper beside `collect-renames` (`src/passes/expand.ss:129`), which
      already walks a template classifying identifiers: pattern variables, `.../_`, `quote`d
      subtrees, core keywords, `*prims*`, `*integrable*`, `*extra-op-keywords*` are left alone
      → `universally-known-id?` + `resolve-exported-macros`, `src/passes/expand.ss`. The
      universally-known arm runs **first**, ahead of the unit's own bindings: otherwise a library
      defining its own `+` would rewrite `(+ a b)` in a template into a call to a global and lose
      `expand-arith`'s inline arithmetic.
- [x] 3.2 Add the baked `(scheme base)` macro keywords to the left-alone set (design D5) — sourced
      from the same baked list the doors register, not a second hand-maintained list
      → **no code needed, and the task's premise was wrong.** A baked keyword is in no `defined-names`,
      no `macro-env`, and no import env, so D4's fall-through already leaves it alone — D5 is
      implemented by D4. Naming the set explicitly would only serve a rejection D4 says we do not do.
      Separately, measuring the premise turned up issue #55: a library body cannot use a derived form
      *at all* today, so a library importing such a macro inherits a pre-existing gap. Recorded in the
      design and `docs/MODULES.md`; not caused by this change and not in scope.
- [x] 3.3 Rewrite an identifier naming one of the library's own top-level bindings to
      `(mangle <unit> <name>)` and record it in `<own-refs>`
- [x] 3.4 Rewrite an identifier naming an entry of the library's import env to that already-mangled
      symbol and record it in `<foreign-refs>`
- [x] 3.5 Rewrite a macro keyword to `(mangle <unit> <keyword>)`, carry that transformer in the
      interface, and recurse so a helper two macros deep is reached (design D3)
      → the queue is keyed on the **output** keyword, not the internal name. Keying on the internal
      name silently broke a macro that is both exported *and* mentioned by another template: the
      export emitted it under its external name, `seen` then blocked the hidden entry, and the second
      template referenced a keyword no entry defined. Pinned by an expander unit test.
- [x] 3.6 Leave every other identifier **exactly as written** (design D4) — no binding analysis, no
      rejection; assert on a fixture that a template temporary is still renamed per expansion
      → `prog-macrolib.scm` defines its own `tmp` = 900 and adds `(- tmp 900)` to the answer, so a
      hygiene failure is a wrong value (not a compile error) on all three doors.
- [x] 3.9 **Unplanned:** skip a rule's `syntax-rules` **literals** as well as its pattern variables.
      Found on self-review, not by a test: a literal is matched by identity at the use site
      (`match-pat`), so rewriting one breaks the match in the importer — which a library that happens
      to define a top-level binding of that name (`else`, `=>`) would have caused. Spec requirement
      and expander test added.
- [x] 3.7 Confirm the pass calls no `fresh-name` and reads no counter, so the interface is
      deterministic and byte-identical across doors
      → asserted in `expander-tests.ss` by advancing the counter between two runs and comparing;
      confirmed end-to-end by `emit lib`'s artifact matching the driver's byte-for-byte.
- [x] 3.8 Reject a library that binds one name with both `define` and `define-syntax`, naming the
      name (design D3) — the ambiguity `mangle` would otherwise collapse
      → `compile-library: a library binds one name with both define and define-syntax f`. Baseline
      (1.1) shows this **silently succeeded** before, exporting the procedure and discarding the
      transformer — so the rejection replaces a silent drop.

## 4. `compile-library*`: accept the export, emit the interface (design D2)

- [x] 4.1 In the export validation (`src/core.ss:718-726`), stop erroring on a macro export: a name
      in `macro-env` is a name the library defines. Keep the ordinary undefined-export error for a
      name that is neither
      → the check consults `own-macro-env`, not the merged one, so a library still cannot "export" a
      macro it merely imports (re-export is out of scope for runtime names too).
- [x] 4.2 Partition the exports into runtime and macro exports; the runtime export table and call
      rows are built from the runtime partition alone, so a macro export contributes no symbol row
      → `runtime-exports`; without it the table would advertise `@"unit:swap!"`, a global no unit
      defines. Pinned by a `modules-tests.sh` case asserting the private helper never reaches the rows.
- [x] 4.3 Build the compile-time interface from the macro partition via the task-3 pass and return it
      as the fourth field, from **both** the default and the pruned (`keep-roots`) paths, identically
- [x] 4.4 Leave the library's own body compiling against the **unresolved** `macro-env` (design D2),
      so no emitted IR moves for a library that uses a macro it also exports

## 5. The importing side (design D7)

- [x] 5.1 Add `import-tables->macro-env` beside `import-tables->env-alist`, so all three call sites
      share one reader
      → plus `import-tables->macro-refs` and `import-tables->macro-keywords`.
- [x] 5.2 Union the imported macro entries into `macro-env` in `compile-library*`
      (`src/core.ss:695`) and `compile-program-with-imports` (`:826`)
      → the unit's own entries come **first** in both, so a local `define-syntax` shadows an imported
      keyword of the same spelling; pinned by `repl-macro-shadow`.
- [x] 5.3 Add the imported macro keywords **and** every ref symbol to `known`
      (`compute-known`, `src/core.ss:45`), so `collect-renames` cannot rename a resolved identifier
      away (risk R3)
      → done, **and** `collect-renames` now refuses structurally: it never renames a
      `unit-qualified?` symbol. That predicate already existed (`src/util.scm`) as the "belongs to
      another unit" encoding, so the guard cannot be defeated by an incomplete known-set — belt to
      the known-set's braces.
- [x] 5.4 Add `(<ref-sym> . <ref-sym>)` to the environment alist for every ref, so a resolved
      reference lowers as `(global-ref <ref-sym>)` and emits as an `external global`
      (`src/emit.ss:1515,1548`)
- [x] 5.5 Verify against the two-library fixture (1.5) that two units' resolved helpers of the same
      spelling coexist and each reaches its own library's binding
      → `prog-macro-dup` => 103 on all three doors (a shared resolution would give 4 or 202).

## 6. Doors (design D8)

- [x] 6.1 Chez driver: write the fourth field in the `.exports` writer (`src/compile.ss:695`+) and
      read it on the reuse path (`:688`)
      → the reuse path needed no change: it reads the whole datum and `table-ct-half` reads the field
      off it.
- [x] 6.2 `emit lib` (mode 11, `repl-library-exports-text`, `src/repl-core.ss:596`): produce the same
      four-field datum the driver writes, for the same library — compare the two byte-for-byte
      → **no code change needed** once 2.2 unified the renderer: mode 11 already rendered whatever
      `compile-library` returned. Verified byte-identical for `macro-helper-lib`.
- [x] 6.3 REPL import path (`src/repl-core.ss:240-260`): merge into `*repl-macro-env*`,
      `*repl-known*`, and `*repl-env*`; confirm the merge is captured by the session-state
      save/restore (`:713`, `:721`) so a failed form does not lose an imported macro
      → the save/restore already snapshots all three vars, so rollback was free. Pinned by
      `macro-survives-failed-form` (18, error, 33).
- [x] 6.4 Run door: confirm no new mode is needed — a program using only a macro still `import`s the
      library, so the mode-12 closure walk already links the unit whose globals the expansion
      references. Measure it rather than reasoning about it
      → measured: all five positives and both negatives behave identically to the AOT door, with no
      `emit.cpp` change at all.
- [x] 6.5 Narration: the lib door names what it wrote, per `docs/OUTPUT.md` — the macro count belongs
      in the existing line rather than a new one
      → `compile (macro-helper-lib) -> … [6730 bytes, 2 macros, recompile: missing]`; the clause is
      omitted at zero, so a macro-free library narrates exactly what it always did.

## 7. Tree-shaking (design D6)

- [x] 7.1 Extend `program-root-internals` (`src/compile.ss:596`) to nominate candidates from
      `exports ∪ <own-refs>`, keeping the "does the program's IR mention it" gate unchanged
      → signature now takes candidate internal names directly, computed at the call site, rather than
      an export alist it has to project.
- [x] 7.2 Confirm a private helper reached only through an exported template survives the shake and
      the program links (`test/aot-tree-shaking-tests.sh`)
      → pinned in `modules-tests.sh` instead, where the fixture and its `build` helper already live;
      `aot-tree-shaking-tests.sh` stays green unchanged (8 passed).
- [x] 7.3 Confirm the helper is still **pruned** when the program imports the library but never uses
      the macro — the property unconditional rooting would have destroyed
      → `prog-macro-unused`: 0 roots reached, `@"macro.helper.lib:helper"` absent from the pruned unit,
      program links and runs.

## 8. Tests

- [x] 8.1 `test/expander-tests.ss`: the resolution pass in isolation — each row of the D2 table,
      including the left-alone cases and the transitive private macro
      → 16 new checks, 19 passing. Needed `src/match.scm` + `src/parse.ss` added to the file's
      include list (the pass classifies against `*prims*`/`*integrable*`).
- [x] 8.2 `test/modules-tests.sh` (AOT door), `test/modules-run-tests.sh` (run door),
      `test/modules-repl-tests.sh` (REPL door): each fixture from task 1, same expected output on
      all three — the dev→ship fidelity claim
      → 32 / 18 / 21 / 103 / 22 / 10 identical on all three doors, plus `emit build` (`macro-app`
      => 18). **Coverage gap found and closed:** a spec scenario said "a library uses a macro
      exported by a library it imports" and no fixture drove it — `macro-user-lib.sld` /
      `prog-macro-user.scm` now do, on all three doors. That path is the `compile-library*` merge,
      not the program one.
      → also added `macro-rec-lib.sld` / `prog-macro-rec.scm`: a **recursive variadic** macro, the
      commonest real shape and the end-to-end exercise of "one macro under two keywords" (3.5), which
      until then only a unit test covered. The program shadows the helper the template calls, so
      resolving in the importer would give 3 instead of 17.
- [x] 8.3 A REPL test that imports a macro, enters a form that fails to compile, then uses the macro
      again (spec scenario; risk covered by 6.3)
      → `macro-survives-failed-form`; also `repl-macro-shadow`, pinning that a session's own
      `define-syntax` beats an imported keyword.
- [x] 8.4 A negative test for the double-binding rejection (3.8)
      → three: `macro-double-binding` (`emit lib`), `macro-dupname` (AOT), `run-macro-dupname` (run
      door). The fixture lives in its own manifest (`emit-libs-macdup.scm`) because the REPL door
      preloads every manifest library eagerly and a deliberately-invalid one would make every
      session in these suites report it at startup.
- [x] 8.5 Re-run `test/module-scaffold-baseline.sha256`, `test/self-emit-equiv.sh`, and
      `test/self-host-fixpoint.sh`; diff every `build/lib/*.ll` against the 1.6 baseline (risks R6,
      R8). `(emit internal)` exports no macro, so assert the pass is a no-op there
      → scaffold baseline green (80 hashes); all 13 pre-change `build/lib` artifacts byte-identical,
      `.ll` **and** `.exports`; full default suite 23/23. The no-op claim has a cause, not just a
      measurement: `define-name` returns `#f` for a `define-syntax`, so `library-export-names` never
      put a transformer in a baked library's export list — no shipped library exports a macro.
      → R8 cleared at its strongest: `self-emit-equiv` 15/15 byte-identical, and
      `self-host-fixpoint` reports both `stage-2 == stage-3` (fixed point) **and** `stage-2 ==`
      committed `embed.ll` / `emit.internal.ll` / `scheme.base.ll` — an independent Chez host
      re-deriving the committed IR byte-for-byte.
      → every Chez-gated dev suite run individually and green: demos AOT 80, backend equivalence 55,
      embedded-vs-AOT 80, modules AOT 37, shake 8, expander 20, simplify 34, repl-equiv 17,
      repl-interactive 19, dump-parity 9, read-all 6, mangle 8, repl-frontend 8, prelude-base 7,
      repl-batch 8, io-primitives 3, scheme-base-gen 5. `test/trust-check.sh` is the one exception —
      see 9.5.
- [x] 8.6 Confirm the compile-time interface reaches no `.ll` — grep an emitted unit for a template
      fragment (risk R7) — and record the `.exports` size delta
      → no emitted unit contains a template fragment. Artifacts: `macrolib` 141 B,
      `macro-helper-lib` 153 B, `macro-dup-a` 75 B; `scheme.base.exports` unchanged at 9248 B.

## 9. Docs and issues

- [x] 9.1 `docs/MODULES.md`: the export surface now includes macros; document the four-field
      `.exports` shape and the resolution rule; update the diagnostics table (`:530`), whose
      macro-export row no longer describes a refusal
      → new *How an exported macro travels* section reading a real artifact; the export-surface
      bullet; the diagnostics row replaced by the double-binding one; **and** the two
      `(scheme base)` curation rules narrowed to the baked set, since they no longer bind a user
      library. Scope & limits now records #55 and #56.
- [x] 9.2 `openspec/explorations/modules-v0-design.md:52`: mark the macro-export/phase-separation
      deferral closed, pointing at this change
- [x] 9.3 File the D4 diagnostic gap as a GitHub issue: a typo inside an exported template is
      reported in the importer as an unbound renamed variable, with the reason a heuristic was
      rejected
      → **#56**, with the reproduction measured (`emit lib` succeeds; the importer reports
      `unbound variable helpr.0`) and both candidate fixes weighed.
- [x] 9.4 Note in `docs/PERFORMANCE.md` if the `.exports` growth or the extra resolution walk is
      measurable — a design entry with the measurement, not a ticket
      → **nothing to add.** The pass is a no-op for every library that exports no macro, which is
      every shipped library (`define-name` returns `#f` for a `define-syntax`, so `(scheme base)`
      never exported its derived forms). A macro library's artifact grows to 141–153 bytes; no
      emitted `.ll` and no binary changes size. An entry asserting "no measurable cost" would be
      noise in a design backlog.
- [ ] 9.5 Reference `Fixes #48` from the implementing commit and comment the outcome on the issue
      → **not done: awaiting the user's go-ahead to commit.** `test/trust-check.sh` also waits on
      this — it `[SKIP]`s while `bootstrap/` has uncommitted changes, by design (it compares
      *regenerated* IR against *committed* IR, so it is a post-commit check on a clean tree). Its
      claim is largely already established for three of the five committed IR files by
      `self-host-fixpoint`'s independent-host re-derivation (8.5); what it adds is `schemec.ll` and
      `embed-repl.ll`. Run it right after committing.
- [x] 9.6 File the unplanned finding from 3.2 as an issue: a library body cannot use a derived-form
      macro at all, which is what bounds D5 for a library importer
      → **#55**, with the cause traced to `prelude-macro-forms` being program-path-only and
      `library-body-forms`' body-injection workaround being generator-only.
