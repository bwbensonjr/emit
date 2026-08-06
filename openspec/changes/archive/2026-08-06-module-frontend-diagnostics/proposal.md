## Why

Three R7RS forms are deliberately out of scope for Modules v0, and the `module-system` spec says so
in as many words: "`only`/`except`/`prefix` import-set transforms remain out of scope", "the
remaining R7RS library declarations — `include`, `include-ci`, `include-library-declarations`, and
`cond-expand` — remain out of scope", and exports are procedures only (the export table's "macro
slot is reserved but unused").

But **nothing enforces those boundaries**, so out-of-scope does not mean rejected — it means
accepted, mishandled, and reported as something else. `parse-define-library` (`src/core.ss:356-369`)
has an `[else]` arm that drops any declaration it does not recognize into the body, and
`collect-imports` reads every import spec as a library *name*. The front end never says no; it lets
the form flow downstream and reports whatever breaks second.

Measured against `build/emit`, five distinct diagnostics — and not one of them names the form the
user actually wrote:

| what the user wrote | what Emit says |
|---|---|
| `(import (only (scheme inexact) sqrt))` in a program | `program imports a library not found in the manifest` |
| the same inside a `define-library` | `library isl.sld: unresolved or cyclic import (dependency missing from manifest?)` |
| `(cond-expand (else (begin (define (f x) x))))`, `f` exported | `export of a name the library does not define f` |
| `(include "body.scm")` providing an exported `g` | `export of a name the library does not define g` |
| `(export swap!)` where `swap!` is a `define-syntax` (#48) | `export of a name the library does not define swap!` |
| `(frobnicate 1 2 3)` as a declaration | `unbound variable frobnicate` |
| a `define-library` that is not its file's only form, or typed at the REPL (#49) | `parse: internal defines with no following body expression ?` |

Three of them accuse the author of not defining a name they plainly defined. One invents a
dependency cycle. One sends the author off to debug a manifest that is fine. One reports a trailing
`?` that is an artifact of the misparse. The user's next move is wrong in every case.

This is the same defect class `validate-record-type-syntax` fixed for `define-record-type` — a
front end that destructures user syntax without validating its shape — and the same argument that
motivated `library-body-declarations` (#16): a form the compiler does not handle must be named, not
absorbed.

Now, because it is cheap and pre-tag: this is what a new user hits when they write their first
library, and `homebrew-tap-distribution` is about to make first users more common.

## What Changes

- **An import set is rejected by name.** `only`, `except`, `prefix`, and `rename` in an import
  position report that import sets are unsupported and that imports are whole-library, naming the
  offending form — on both the program and the library paths, which today produce two *different*
  wrong messages.
- **An unrecognized library declaration is rejected by name.** `parse-define-library`'s `[else]`
  arm stops absorbing declarations into the body. The four R7RS declarations Emit does not
  implement (`include`, `include-ci`, `include-library-declarations`, `cond-expand`) are named as
  recognized-but-unsupported; anything else is named as not a library declaration at all. The
  distinction matters: one is a promise not yet kept, the other is a typo.
- **Exporting a macro is reported as exporting a macro.** An exported name bound by a
  `define-syntax` in the library body is reported as such, instead of falling into "a name the
  library does not define" because `collect-define-syntax` lifted it out before the export check
  could see it (#48, first half).
- **A misplaced `define-library` is reported as one** (#49, first half). A `define-library` that is
  not the sole top-level form in its source, or that is typed at the REPL prompt, is named as such
  rather than misparsed as an application with an empty body. Whether the REPL *should* accept a
  `define-library` is a product question left on #49; saying what currently happens is not.
- **Body forms keep their current handling.** A command is still a command and is still lowered;
  this change only stops *declarations* from being silently reclassified as body forms.
- **Explicit non-goals — the features themselves.** Implementing import sets, the `include` family,
  `cond-expand`, or macro export (#48's second half) each remains separate, larger work; `#18`'s own
  fix order puts `cond-expand` first because it needs no I/O, and this change does not preempt that.
  Rejecting a form cleanly is what makes deferring it honest.

## Capabilities

### New Capabilities
<!-- None. -->

### Modified Capabilities

- `module-system`: the export surface and the whole-module import surface gain the requirement that
  an unsupported or unrecognized form is rejected at the front end, naming the form — turning three
  prose "out of scope" notes into enforced, testable behaviour.

## Impact

- `src/core.ss`: `parse-define-library` (`:356-369`) — the `[else]` arm becomes a rejection with a
  recognized/unrecognized split; `collect-imports` (`:221`) and the library import path
  (`:261`) — recognize the four import-set keywords ahead of treating a spec as a library name;
  `compile-library*`'s export validation (`:585-587`) — consult the `macro-env` that
  `collect-define-syntax` (`:566`) already produced before reporting a name as undefined;
  `compile-source-string` / `compile-source-rehomed` — a `define-library` that fails
  `single-define-library` is named rather than passed to `compile-forms`.
- Error channel: these are compile-time errors on the path the REPL already catches and reports
  before returning to the prompt (the mechanism `validate-record-type-syntax` relies on), so a bad
  declaration must not take down a session — dev→ship fidelity applies to the diagnostic too.
- Diagnostics reach the user through each door's prefix, so the messages must satisfy `emit-cli`'s
  "a door's diagnostics name that door" requirement on `emit lib`, `emit run`, `emit build`, and
  the REPL.
- Tests: `test/library-body-declarations-tests.sh` and `test/modules-tests.sh` are where the
  negative cases belong; both are Chez-free.
- Docs: `docs/MODULES.md` states the whole-library-imports-only rule and can now say what happens
  when you break it.
- No IR change. No door's output moves by a byte for any program that compiles today, so
  `test/module-scaffold-baseline.sha256` is untouched.
