## 1. Import sets rejected by name (#45)

- [x] 1.1 Add one import-spec validator in `src/core.ss`: a spec whose head is `only`, `except`,
      `prefix`, or `rename` is a compile-time error naming the form and stating that imports are
      whole-library (design D5, D7)
      → `check-import-spec` / `import-set-spec?` / `*import-set-keywords*`, `src/core.ss`.
- [x] 1.2 Call it from the program path (`collect-imports`, `src/core.ss:221`) before a spec is
      read as a library name
- [x] 1.3 Call it from the library path (the declared imports taken from `parse-define-library`,
      `src/core.ss:261`), so `(import (only …))` inside a `define-library` stops reporting
      "unresolved or cyclic import"
      → called from `parse-define-library`'s `import` arm rather than from the one call site at
      `:261`, so every consumer of the parser (the batch doors, the REPL's library loader, the
      Chez driver) rejects an import set identically.
- [x] 1.4 Confirm the two paths produce the **same** message for the same form — the property that
      makes the fix verifiable, and the one today's code does not have
      → measured: `import: import sets are not supported: (only (scheme inexact) sqrt) -- imports
      are whole-library, as (import (library name))` on both, differing only in the door prefix
      (`emit:` vs `emit lib:`). Pinned by `import-set-same-message`.
- [x] 1.5 Confirm `(rename …)` in an `export` declaration is untouched (design D4):
      `test/modules/rename-lib.sld` and the spec's renamed-export scenario stay green
      → `emit lib test/modules/rename-lib.sld` writes its unit; `aot-rename`, `repl-rename`,
      `run-rename`, `rename-exports`, `rename-symbol` all pass.

## 2. Unrecognized library declarations rejected by name (#18 item 3)

- [x] 2.1 Replace `parse-define-library`'s `[else]` arm (`src/core.ss:369`) with a rejection: the
      recognized declarations are `export`, `import`, `begin`
- [x] 2.2 Split the diagnostic two ways (design D2): `include` / `include-ci` /
      `include-library-declarations` / `cond-expand` are recognized R7RS declarations this stage
      does not support; anything else is not a library declaration at all
      → `reject-library-declaration` / `*unsupported-library-declarations*`.
- [x] 2.3 Word the unsupported-declaration message so it promises no schedule — #18 owns when these
      land, and `cond-expand` is expected to land before the `include` family
      → "`<kw>` is an R7RS library declaration this stage does not support": no date, no ordering,
      no "coming soon".
- [x] 2.4 Verify against the case that motivated the split: `(include "body.scm")` providing an
      exported name currently reports `export of a name the library does not define g`, and
      `(frobnicate 1 2 3)` currently reports `unbound variable frobnicate`
      → both baselines reproduced before the change and asserted gone after: the suite fails if
      `does not define g` or `unbound variable` reappears.

## 3. Macro exports reported as macro exports (#48, first half)

- [x] 3.1 In `compile-library*` (`src/core.ss:566-587`), consult the `macro-env` already produced
      by `collect-define-syntax` before reporting an export as a name the library does not define
      (design D3)
      → one `(assq (cdr e) macro-env)` on the already-held binding list; no new scan.
- [x] 3.2 Report a macro export as such, naming the macro; state that exports are procedures in
      this stage
      → `compile-library: a library cannot export a macro (exports are procedures in this stage)
      swap!`
- [x] 3.3 Confirm the ordinary undefined-export error is unchanged for a name that is neither a
      definition nor a macro — the existing spec scenario pins it
      → `export of a name the library does not define missing`, byte-for-byte as before; pinned by
      `undefined-export-unchanged`.

## 4. Misplaced `define-library` reported as one (#49, first half)

- [x] 4.1 Where `single-define-library` fails but the source contains a `define-library` form,
      report it as needing to be the only form in its source, instead of falling through to
      `compile-forms` (`compile-source-string` / `compile-source-rehomed`, `src/core.ss`)
      → `check-library-position`, called from the TWO pipelines a program reaches —
      `compile-forms` and `compile-program-with-imports` — rather than from each entry point.
      That is one call per pipeline instead of five per door, and it covers the Chez driver's
      `compile-file` and `schemec`'s filter mode as well.
- [x] 4.2 On the REPL's per-form path, report a `define-library` at the prompt as not supported
      there, naming the manifest as where libraries come from
      → new first arm in `compile-one-form`, `src/repl-core.ss`: `define-library: libraries are
      not defined at the prompt: (r) -- a library is imported, named in the manifest`.
- [x] 4.3 Confirm the session survives it (design D6) — a `define-library` at the prompt currently
      leaves the REPL alive, and this must not regress
      → raised (not returned), so it takes the guard that restores the session snapshot; the
      following `(+ 1 2)` still evaluates to 3. Pinned by `repl-session-survives`.

## 5. Error channel and door agreement

- [x] 5.1 Confirm every new guard raises through the recoverable compile-time error channel the
      existing export error uses, not an abort — the REPL catches it, reports it, and returns to
      the prompt (design D6)
      → every guard uses `(error 'who "message" …)`. One gap had to be closed to make this true:
      mode 12 (`repl-source-imports`, the run door's lazy-preload query) borrows both parsers but
      returns a plain string, so a raise there escaped uncaught and **aborted** the door before
      the compile that owns the diagnostic ran — the message printed with no door prefix and the
      process died. It is now guarded: a source whose imports cannot be read has none to preload,
      and the guarded compile reports it once, through its door.
- [x] 5.2 Confirm each message reads `emit <verb>: <message>` on `emit run` / `emit build` /
      `emit lib` with no interior `repl:` segment, per `emit-cli`'s "a door's diagnostics name that
      door" requirement
      → no interior `repl:` segment on any door; `emit lib:` on the lib door, `error:` at the
      prompt. **Finding:** `emit run` and `emit build` both prefix `emit:`, not `emit run:` /
      `emit build:` — that is pre-existing (their shared compile front half), identical for
      `program imports a library not found in the manifest` today, and not something this change
      introduces or can fix without touching the door prefixes themselves. Left to
      `emit-cli-front-door`.
- [x] 5.3 Check the messages against `docs/OUTPUT.md`: diagnostics on stderr, no stdout change,
      quiet-mode behaviour unaffected
      → measured: stdout empty on every rejection, exit 1, and `EMIT_VERBOSITY=quiet` still shows
      the diagnostic (it suppresses narration, not errors).

## 6. Tests

- [x] 6.1 Add the negative cases to `test/library-body-declarations-tests.sh` (the #16 suite that
      already owns declaration classification): each of the four unsupported R7RS declarations, an
      unrecognized declaration, and a macro export — asserting on the **message**, not only a
      non-zero exit, since every case exits the same way
      → 11 new assertions, including three that fail if a superseded message returns.
- [x] 6.2 Add the import-set cases to `test/modules-tests.sh`: all four keywords in a program, the
      same form inside a `define-library`, and an assertion that the two messages match
      → added to `test/modules-run-tests.sh` instead. **Deviation, with reason:**
      `modules-tests.sh` is Chez-GATED (it `exit 0`s when `chez` is absent), so cases placed there
      would not run on the Chez-free path these doors take — which contradicts 6.4. The run-door
      suite is Chez-free, already has a `check_fail` helper, and reaches all four doors.
- [x] 6.3 Add the misplaced-`define-library` cases: a second top-level form in the same source, and
      a `define-library` at the prompt followed by a form proving the session is alive
      → same suite, for the same reason.
- [x] 6.4 Confirm every suite stays Chez-free and runs under `./run-all-tests.sh`
      → both edited suites are Chez-free. `./run-all-tests.sh`: 22 suites, 0 failed.
      `./run-dev-tests.sh` (Chez-gated, incl. the self-hosting fixed point): 20 suites, 0 failed.
- [x] 6.5 Confirm `test/module-scaffold-baseline.sha256` is **unchanged** — no IR moves, so a diff
      there means a form was reclassified rather than rejected
      → `byte-identity OK: 80 demo IR hashes match`; the file is untracked-clean in `git status`.

## 7. Docs and issues

- [x] 7.1 `docs/MODULES.md`: state what happens when the whole-library-imports-only rule is broken,
      and what an unsupported declaration reports
      → new **When you break a rule** section: the six diagnostics as a table, the two deliberate
      distinctions (recognized-vs-unrecognized, `rename` by position), and the door-agreement and
      recoverability properties. Also corrected "Bare forms outside a `begin` are also accepted",
      which this change makes false, and cross-linked from `Writing a library`, `Semantics`, and
      `Scope & limits`.
- [ ] 7.2 Reference the issues from the implementing commits: `Fixes #45`; #48, #18, and #49 each
      keep their remaining halves open, so use `Refs #48` / `Refs #18` / `Refs #49` and phrase the
      PR body without a closing keyword near those numbers
- [ ] 7.3 Comment on #18 that item 3 is done and items 1-2 (`cond-expand`, then the `include`
      family) remain; comment on #48 and #49 that the diagnostic half is done and what remains
