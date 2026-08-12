# Measurement artifacts for the R7RS conformance exploration

Evidence behind `../r7rs-conformance-suite.md`, kept so the baseline in that document can be
re-derived and so the exclusion manifest in change `r7rs-conformance-suite` (task 5.2) can be
populated without re-running discovery from scratch.

**These are throwaway measurement tools, not repo tooling.** They are Python, which the shipped
build deliberately is not, and they will be superseded: the change's design (D2) specifies a
Chez-hosted `tools/r7rs-manifest.ss` and a Chez-free `test/r7rs-suite-tests.sh` for exactly the job
`discover.py` did once by hand. Nothing in `make`, `run-all-tests.sh` or `run-dev-tests.sh` runs
anything here.

## The suite itself is not vendored here

`r7rs-tests.scm` is deliberately absent. Licensing is not the reason — Emit is MIT-licensed and
chibi-scheme's BSD-3-clause terms are compatible with vendoring it. The reason is placement: the
vendored copy belongs in `test/r7rs/` alongside its license notice, its checksum and the runner that
consumes it (change `r7rs-conformance-suite`, task group 2). A second copy here would be a second
thing to keep in sync, and these throwaway tools are not what the suite should hang off.

To re-run anything below, fetch the exact revision measured:

```sh
curl -sLO https://raw.githubusercontent.com/ashinn/chibi-scheme/master/tests/r7rs-tests.scm
shasum -a 256 r7rs-tests.scm
# 9b10cac782ef9c52c4cb0a3a489f01415b1262785d7eb14c70fa88ab859cf950
```

That checksum is the file as measured on 2026-08-11 (2516 lines, 1035 top-level forms). `master`
moves, so a mismatch means the suite changed and the saved results below describe a different file.

## Files

| File | What it is |
|---|---|
| `discover.py` | The growing-prefix scan. Splits the suite by section, grows each section form by form, isolates every form that will not compile or run, then reports pass/fail for what survives. 8-way parallel, ~12 minutes, ~895 `emit run` invocations. Needs `forms.json` and `build/emit`. |
| `split.py` | Produces `forms.json`: the top-level form extents `discover.py` consumes. |
| `harness.scm` | The `(chibi test)` substitute, in the subset Emit accepts. |
| `surface-diff.py` | Static companion: diffs R7RS-small's own export lists against what Emit binds. Independent of whether anything runs. |
| `results.json` | Output of the recorded run: per section, the accepted forms, every rejected form with its error, and each failing assertion. **This is the seed for the exclusion manifest.** |
| `forms.json` | The form index for the checksummed suite above. |
| `baseline-summary.txt` | The per-section table as printed. |
| `inventory.txt` | The surface diff as printed. |

Typical order: `split.py` → `discover.py` → read `results.json`.

## Known limits of these tools

Recorded because the numbers in the exploration doc inherit them.

- **`split.py` does not handle `|bar-quoted symbols|`.** It swallows everything from line 2268 to
  the end of the file into one form, so the *Numeric syntax* section (110 cases) and *6.14 System
  interface* are absent from `results.json`. This is the specific defect task 3.4 of the change
  exists to avoid repeating.
- **`discover.py` reports raw errors, and raw errors overstate the gaps.** Two examples from this
  very run: `parse: bad expression #(a b c)` reads as "no vector literals" when in fact only the
  *unquoted* form is rejected, and `unbound variable =>` reads as "no `cond` `=>`" when the real
  gap is in `case`. Every entry that becomes an exclusion wants a standalone probe before its reason
  tag is trusted.
- **A rejected form cascades.** When a `define` is rejected, every later form referencing it is
  rejected too, with an `unbound variable` error naming a helper rather than a real gap
  (`any-arity`, `rest-arity`, `dead-clause`, `head`, `sequence1`…). Roughly 35 of the 438 rejections
  are these. The change's manifest marks them `blocked-by` for this reason.
- **`harness.scm` compares floats with `equal?`.** The suite writes expected flonums truncated to
  ~15 digits because `(chibi test)` compares approximately, so this produces 13 false failures in
  section 6.2 where Emit's doubles are correctly rounded. The change's harness must compare
  approximately (design D5); this one is left as-is so `results.json` stays the record of what was
  actually run.
- **`surface-diff.py`'s CxR row is unreliable** — the spec markdown's CxR block includes prose that
  the extractor reads as names. Every other library's counts are clean.

## The baseline recorded here

506 assertions pass, 32 reported failures of which 19 are genuine (13 are the float-comparison
artifact above), and 438 of 999 forms do not run. Nine defects found and filed: #74-#82. Full
per-section numbers and interpretation are in `../r7rs-conformance-suite.md`.
