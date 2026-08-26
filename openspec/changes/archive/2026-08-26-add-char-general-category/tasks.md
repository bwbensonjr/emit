## 1. Generate General-Category Data

- [x] 1.1 Extend `tools/gen-unicode-tables.ss` to parse, validate, and coalesce
  UnicodeData general-category intervals, including strict `First`/`Last` pairing
  and category-range narration; verify generation fails on inconsistent pairing
  logic and reports the category interval count on stderr while quiet mode remains
  silent
- [x] 1.2 Emit the sorted flat `%unicode-general-category` triple table and
  regenerate `lib/scheme/char-data.scm`; verify two generations are byte-identical,
  every UnicodeData singleton and compact range maps to its pinned category, gaps
  remain absent for `Cn` fallback, and `test/unicode-data-gen-check.sh` passes

## 2. Implement and Exercise the Library Surface

- [x] 2.1 Export and implement `char-general-category` in
  `lib/scheme/char.sld` as an aligned binary search with `Cn` fallback; verify
  representative `Lu`, `Ll`, `Lt`, `Mn`, `Nd`, `Zs`, `So`, and `Co` characters,
  the endpoints and interior of a UnicodeData compact range, and a pinned
  unassigned scalar all return the expected symbols
- [x] 2.2 Extend the Pitch prerequisite fixture with the derived reader's exact
  initial, subsequent, and intraline-whitespace category sets; verify non-ASCII
  accepted and rejected examples behave identically through a user library, REPL,
  `emit run`, and AOT in `test/pitch-prerequisites-tests.sh`
- [x] 2.3 Extend library-surface and installed-layout probes for the documented
  `(scheme char)` extension; verify the name resolves after an explicit import,
  remains absent from auto-imported `(scheme base)`, and works from an installed
  Emit outside the checkout

## 3. Document and Measure the Extension

- [x] 3.1 Update character-library documentation to list
  `char-general-category` separately from the R7RS-small exports and describe its
  Unicode 17.0.0 result symbols; verify the documented library surface matches
  `lib/scheme/char.sld` and does not claim an R6RS library alias
- [x] 3.2 Record generated-source, character artifact, cold compile, and stripped
  AOT size deltas in the change evidence; verify an otherwise-equivalent program
  that does not import `(scheme char)` still links no character-library artifact
  or Unicode category table payload

## 4. Complete Verification

- [x] 4.1 Run the focused Unicode-generation, Pitch-prerequisite,
  library/module-surface, artifact-cache, and install-layout suites, then run
  `./run-all-tests.sh`; verify all suites pass without `make regen`
- [x] 4.2 Review the final diff and test narration against `docs/OUTPUT.md`;
  verify no compiler source covered by `tools/regen.sh`, bootstrap artifact,
  Unicode version, Pitch source, R6RS alias, or unrelated library surface changed
