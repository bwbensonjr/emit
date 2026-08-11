## Why

An unterminated list or string is closed **silently** at end of input, so a truncated source
compiles and runs as though it were complete (issue #66). The file `(display (list 1 2 3)` — no
closing paren — prints `(1 2 3)` and exits 0. So does `(display "abc`. The reader's own probe
confirms the read, not the door: `(read-all-from-string "(a b")` returns `((a b))`.

That is the same failure class `reader-lexical-conformance` closed for the unterminated **block
comment** (issue #59), which now reports `read: unterminated block comment #| opened at index 12`.
It closed one third of "unterminated construct" and left the list and string thirds open.

A truncated file is what a partial write, an interrupted editor save, a bad `sed`, or a paste that
drops the last line produces. Silently supplying the missing delimiter means the program compiles to
something the author did not write, with no diagnostic anywhere. For a **manifest** it is worse,
because the manifest is data the compiler acts on: a truncated `emit-libs.scm` resolves as though
complete and `emit build` writes an executable, exit 0. `manifest-empty-guards` named this gap and
deferred it here in as many words — "a truncated manifest is accepted as though complete. That is a
reader-level gap tracked separately."

The adjacent manifest defect is that a manifest's **second top-level form is silently discarded**
(issue #67). A manifest is one form — a list of entries — and the natural mistake is writing one
parenthesized group per entry, which looks like a list of entries and reads as several. The dropped
entries produce an unresolved-import error naming the importer, never the manifest that dropped
them.

Both are tag-timed. `homebrew-tap-distribution` puts SemVer 0.1.0 on the accepted language and the
CLI; the manifest grammar is inside that contract, so deciding it after the tag makes it a breaking
change rather than a fix.

## What Changes

- **The reader reports an unterminated list, vector, bytevector, and string** instead of closing it
  at end of input, through every entry point (`read-from-string`, `read-all-from-string`, and
  `read` over a port), naming the index the construct **opened** at — the detail that made #59's
  message useful. `rd-list`'s and `rd-string`'s end-of-input arms become failures carrying that
  opening index, and flow through the existing `rd-report`.
- **A dangling escape at end of input is reported** rather than reading past the end of the string.
  `rd-string` reads the character after a backslash with no bounds test, so `(display "abc\` reads
  `s[n]`. This is an out-of-bounds read today, and the reader's own instance of issue #70.
- **An unterminated `#;`** — a datum comment with no following datum — keeps its current report,
  which is already correct; it gains a test so the coverage is uniform across the constructs.
- **The interactive prompt keeps its current behavior, deliberately.** The probe and the reader give
  *different* answers for the same text, and must: the probe answers **incomplete** (keep typing) so
  a list can be typed across lines, while a batch read of the same text is an **error**. That
  divergence is the arrangement `reader-lexical-conformance` design D2 established, and it is now
  load-bearing for far more text, so it gets pinned as a requirement rather than left as an
  implementation accident.
- **A manifest that is not exactly one top-level form is an error naming the count.** The silent
  `(cdr forms)` drop in `manifest-entries` (`src/repl-core.ss:446`) becomes a report. This is a
  grammar *decision*, not only a bug fix: the alternative — concatenating several top-level lists
  into one entry list — is more permissive and would make the natural mistake simply work, but it
  changes the documented grammar rather than enforcing it, and it should not be adopted
  incidentally. Rejecting is the smaller change and the safer default before a tagged release;
  accepting later is purely additive, and the reverse is not.
- **Every consumer of `read-all-from-string` inherits the reader fix** — the manifest parsers,
  `include`/`include-ci`, the `.exports` reader, and `string->number` (which is built from the
  reader's classifiers). None of them needs its own truncation check.

Not in scope: making indexed access checked in general (issue #70). This change fixes the reader's
one dangling-escape instance because it is a reader bug reachable from a source file; the
tower-wide question of bounds-checking `vector-ref`/`vector-set!`/`string-ref` is a separate change
with its own performance trade-off.

## Capabilities

### New Capabilities

None. This change completes a requirement `core-language` already states for one construct and
extends it to the rest, and settles a manifest grammar question `module-system` left open.

### Modified Capabilities

- `core-language`: the "An unterminated block comment is reported, not read as end of input"
  requirement generalizes to every unterminated construct — list, `[`-list, vector, bytevector,
  string (including one ending in a dangling escape), and datum comment — each reported with the
  position it opened at. The existing block-comment requirement is extended, not revised.
- `module-system`: gains the manifest form-count requirement — a manifest SHALL be exactly one
  top-level form, and a second form SHALL be reported naming the count rather than discarded. The
  "A manifest containing no datum is an empty manifest" requirement's closing paragraph, which
  defers the truncated-manifest case to a separate reader-level change, is replaced by the
  behavior this change lands.
- `compiler-embedding`: the "input-completeness probe agrees with the reader about comments and
  quoted identifiers" requirement extends its unfinished-lexeme list to the unterminated list,
  vector, bytevector, and string, and states the intended **directional** divergence — the probe
  answers incomplete where a batch read errors — so a later attempt to unify the two paths cannot
  silently destroy multi-line entry at the prompt.

## Impact

- `src/prelude.scm` — `rd-list`, `rd-string`, `rd-report`, and the `rd-hash` vector/bytevector arms
  that call `rd-list`. **In `CORE_FLAT`, so this costs a `make regen` cycle.** New failure-reason
  symbols are internal to the reader; any new helper needs its home declared in
  `src/prelude-surface.scm` or `test/scheme-base-surface-check.sh` fails.
- `src/repl-core.ss` — **two** manifest parsers, not one. `manifest-empty-guards` consolidated
  `repl-manifest-paths` and `repl-manifest-user-paths` into `manifest-entries`, but
  `repl-manifest-programs` (mode 10) kept its own `(car forms)` because it returns a status pair
  rather than raising. Both need the form-count rule or the build door still drops the second form.
  Also in `CORE_FLAT`.
- `(scheme read)`'s private copy of the reporting path — it cannot import a private name, so it
  keeps its own copy of `rd-report`, the arrangement `%check-input-port` already has. Both copies
  move together or the two entry points disagree.
- `src/repl-core.ss` `fc-*` probe — **verified to need no change**: `fc-list`, `fc-string`, and
  `fc-bar` already return `fc-incomplete` for these constructs, which is why multi-line entry works
  today. The tests pin that it stays that way.
- Tests — reader cases for each unterminated construct on both entry points; a probe case asserting
  incomplete for the same text; manifest fixtures for a truncated manifest and for a two-form
  manifest, on the `build` and `run` doors.
- IR moves for every program, because the reader is in the baked substrate. `bootstrap/*.ll` and the
  generated `.sld` files change; `test/module-scaffold-baseline.sha256` is re-recorded with the
  delta explained, per the baseline protocol.
- No surface change: no library gains or loses a name.
