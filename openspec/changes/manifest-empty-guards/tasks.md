## 1. Pin the defect before changing anything

- [x] 1.1 Add failing fixtures to `test/project-door-tests.sh` for `emit build` with an absent,
      empty, whitespace-only, and comment-only manifest; assert exit is non-zero **and below 128**
      (no signal death) and that a diagnostic reached stderr
- [x] 1.2 Add the same four fixtures for `emit run` with a program importing only baked libraries,
      asserting the program's normal output
- [x] 1.3 Add an `emit run` fixture importing an undeclared library under an entryless manifest,
      asserting the unresolved-import error names the library
- [x] 1.4 Add a fixture for the fourth site found during implementation: a manifest naming a library
      whose source exists but holds no datum, imported by a program — currently exit 139
- [x] 1.5 Confirm 1.1-1.4 fail against the current binary in the way #63 describes, so the suite is
      known to be testing the defect rather than passing vacuously

## 2. Scheme side: stop assuming a non-empty read (design D2)

- [x] 2.1 Add `manifest-entries` to `src/repl-core.ss` beside the manifest parsers, returning the
      first top-level form or `()` when the text holds no datum, with a comment citing the
      unchecked-`car` decision in `core-language`
- [x] 2.2 Route `repl-manifest-paths` (:387), `repl-manifest-user-paths` (:407), and
      `repl-manifest-programs` (:474) through it, replacing each `(car (read-all-from-string text))`
- [x] 2.3 Guard `repl-load-library-text` (:349, mode 4) with the `compile-one-form-text` error idiom:
      a library source holding no datum returns `(error . MSG)` naming it, not `(car '())`
- [x] 2.4 Verify no other `read-all-from-string` call site in `src/repl-core.ss` or `src/core.ss`
      takes `car` of the result without a pair test
- [x] 2.6 Make the three entry walks terminate on `(not (pair? es))` rather than `(null? es)`, so a
      manifest that is a bare atom or an improper list is total rather than a second crash (found in
      review; `hello`, `42`, `"str"`, `(a . b)` all segfaulted). Fixture 34 covers it
- [x] 2.5 N/A as written: `src/repl-core.ss` is concatenated only by `tools/regen.sh`, not included by
      `src/compile.ss`, so the Chez driver cannot exercise these parsers. Substituted a Chez
      read-through syntax check (55 forms) to catch structural errors before spending a regen

## 3. Mode 10 returns a status pair (design D3)

- [x] 3.1 Change `repl-manifest-programs` to return `(ok . TRIPLES)`, and `(error . MSG)` when the
      manifest text holds no datum, with MSG naming the entryless condition
- [x] 3.2 Update the mode-10 comment block (`src/repl-core.ss:466-472`) to document the new
      contract, noting it now matches modes 4 and 8
- [x] 3.3 Update `resolve_program` (`src/emit.cpp:633`) to read the status pair via the existing
      `status_of` / `door_msg` helpers

## 4. C++ side: name the cause (design D1, D3)

- [x] 4.1 In `resolve_program`, report "no manifest found" when `manifest.empty()`, naming
      `kManifestName` rather than interpolating an empty path, and exit 1
- [x] 4.2 Print the mode-10 `(error . MSG)` payload for the entryless case and exit 1
- [x] 4.3 Leave the existing `progs.empty()` branch as the no-`program`-entry case, and confirm it
      is now reachable rather than dead
- [x] 4.4 Check `EMIT_VERBOSITY` handling matches `docs/OUTPUT.md`: these are errors on stderr, not
      narration, so they are not suppressed at `quiet`

## 4b. Name the unresolved import on the program path (found by fixture 31)

- [x] 4b.1 Factor `lone-library-unresolved-msg`'s loop into `unresolved-imports-msg`, taking import
      NAMES rather than a library form, since only one of the two callers has a form
- [x] 4b.2 Call it from the program path (`src/repl-core.ss`, the `else` arm of mode 7), replacing the
      constant `"program imports a library not found in the manifest"` which named nothing
- [x] 4b.3 Confirm `emit run` now names the library in all three cases — no manifest, entryless
      manifest, and a well-formed manifest lacking the entry — and that `emit lib`'s message, which
      was already correct, is unchanged

## 5. Verify

- [x] 5.1 Tighten the fixtures from group 1 to assert the specific message text for each of the
      three `emit build` causes, per design D4 ("no manifest found" + the filename, "declares no
      entries" + the manifest, "no program entry in manifest")
- [x] 5.2 Confirm a library-only manifest still reports `no program entry in manifest <path>`
      unchanged, and that an ordinary `emit build` of a real program entry is unaffected
- [x] 5.3 Confirm a *malformed* (not merely empty) manifest is not misreported as entryless. What it
      *is* reported as is out of scope: the reader closes an unterminated list silently, so a
      truncated manifest is accepted as complete (see 6.4)
- [x] 5.4 Finish every source edit, then run `make regen` to convergence (barrier: no further
      compiler-source edits until the suites finish)
- [ ] 5.5 Run `./run-all-tests.sh`, then `./run-dev-tests.sh`; run suites individually if the batch
      outlives the command timeout
- [ ] 5.6 Commit, then run `test/trust-check.sh` (it `[SKIP]`s on a dirty `bootstrap/`)

## 6. Close out

- [ ] 6.1 Reference the issue from the fixing commit as `Fixes #63`
- [x] 6.2 Filed #67: a manifest's second top-level form is silently ignored (design "Risks", noted
      while consolidating the three parsers)
- [ ] 6.3 Sync delta specs into `openspec/specs/module-system` and `openspec/specs/project-build`,
      then `openspec validate --all` and grep the main specs for stray delta headers
- [x] 6.4 Filed #66: an unterminated list or string is closed silently at end of input in any source,
      so a truncated file compiles as though complete. `reader-lexical-conformance` closed the
      unterminated-block-comment half of this (#59) and left this half open
