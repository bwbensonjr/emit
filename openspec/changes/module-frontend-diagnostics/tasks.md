## 1. Import sets rejected by name (#45)

- [ ] 1.1 Add one import-spec validator in `src/core.ss`: a spec whose head is `only`, `except`,
      `prefix`, or `rename` is a compile-time error naming the form and stating that imports are
      whole-library (design D5, D7)
- [ ] 1.2 Call it from the program path (`collect-imports`, `src/core.ss:221`) before a spec is
      read as a library name
- [ ] 1.3 Call it from the library path (the declared imports taken from `parse-define-library`,
      `src/core.ss:261`), so `(import (only …))` inside a `define-library` stops reporting
      "unresolved or cyclic import"
- [ ] 1.4 Confirm the two paths produce the **same** message for the same form — the property that
      makes the fix verifiable, and the one today's code does not have
- [ ] 1.5 Confirm `(rename …)` in an `export` declaration is untouched (design D4):
      `test/modules/rename-lib.sld` and the spec's renamed-export scenario stay green

## 2. Unrecognized library declarations rejected by name (#18 item 3)

- [ ] 2.1 Replace `parse-define-library`'s `[else]` arm (`src/core.ss:369`) with a rejection: the
      recognized declarations are `export`, `import`, `begin`
- [ ] 2.2 Split the diagnostic two ways (design D2): `include` / `include-ci` /
      `include-library-declarations` / `cond-expand` are recognized R7RS declarations this stage
      does not support; anything else is not a library declaration at all
- [ ] 2.3 Word the unsupported-declaration message so it promises no schedule — #18 owns when these
      land, and `cond-expand` is expected to land before the `include` family
- [ ] 2.4 Verify against the case that motivated the split: `(include "body.scm")` providing an
      exported name currently reports `export of a name the library does not define g`, and
      `(frobnicate 1 2 3)` currently reports `unbound variable frobnicate`

## 3. Macro exports reported as macro exports (#48, first half)

- [ ] 3.1 In `compile-library*` (`src/core.ss:566-587`), consult the `macro-env` already produced
      by `collect-define-syntax` before reporting an export as a name the library does not define
      (design D3)
- [ ] 3.2 Report a macro export as such, naming the macro; state that exports are procedures in
      this stage
- [ ] 3.3 Confirm the ordinary undefined-export error is unchanged for a name that is neither a
      definition nor a macro — the existing spec scenario pins it

## 4. Misplaced `define-library` reported as one (#49, first half)

- [ ] 4.1 Where `single-define-library` fails but the source contains a `define-library` form,
      report it as needing to be the only form in its source, instead of falling through to
      `compile-forms` (`compile-source-string` / `compile-source-rehomed`, `src/core.ss`)
- [ ] 4.2 On the REPL's per-form path, report a `define-library` at the prompt as not supported
      there, naming the manifest as where libraries come from
- [ ] 4.3 Confirm the session survives it (design D6) — a `define-library` at the prompt currently
      leaves the REPL alive, and this must not regress

## 5. Error channel and door agreement

- [ ] 5.1 Confirm every new guard raises through the recoverable compile-time error channel the
      existing export error uses, not an abort — the REPL catches it, reports it, and returns to
      the prompt (design D6)
- [ ] 5.2 Confirm each message reads `emit <verb>: <message>` on `emit run` / `emit build` /
      `emit lib` with no interior `repl:` segment, per `emit-cli`'s "a door's diagnostics name that
      door" requirement
- [ ] 5.3 Check the messages against `docs/OUTPUT.md`: diagnostics on stderr, no stdout change,
      quiet-mode behaviour unaffected

## 6. Tests

- [ ] 6.1 Add the negative cases to `test/library-body-declarations-tests.sh` (the #16 suite that
      already owns declaration classification): each of the four unsupported R7RS declarations, an
      unrecognized declaration, and a macro export — asserting on the **message**, not only a
      non-zero exit, since every case exits the same way
- [ ] 6.2 Add the import-set cases to `test/modules-tests.sh`: all four keywords in a program, the
      same form inside a `define-library`, and an assertion that the two messages match
- [ ] 6.3 Add the misplaced-`define-library` cases: a second top-level form in the same source, and
      a `define-library` at the prompt followed by a form proving the session is alive
- [ ] 6.4 Confirm every suite stays Chez-free and runs under `./run-all-tests.sh`
- [ ] 6.5 Confirm `test/module-scaffold-baseline.sha256` is **unchanged** — no IR moves, so a diff
      there means a form was reclassified rather than rejected

## 7. Docs and issues

- [ ] 7.1 `docs/MODULES.md`: state what happens when the whole-library-imports-only rule is broken,
      and what an unsupported declaration reports
- [ ] 7.2 Reference the issues from the implementing commits: `Fixes #45`; #48, #18, and #49 each
      keep their remaining halves open, so use `Refs #48` / `Refs #18` / `Refs #49` and phrase the
      PR body without a closing keyword near those numbers
- [ ] 7.3 Comment on #18 that item 3 is done and items 1-2 (`cond-expand`, then the `include`
      family) remain; comment on #48 and #49 that the diagnostic half is done and what remains
