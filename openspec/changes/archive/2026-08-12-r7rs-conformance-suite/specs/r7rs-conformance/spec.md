## ADDED Requirements

### Requirement: An external R7RS-small suite is vendored verbatim and attributed

The repository SHALL vendor chibi-scheme's `tests/r7rs-tests.scm` under `test/r7rs/` **byte-for-byte
unmodified**, together with a note recording the upstream source and the revision vendored.

Verbatim is normative, not stylistic: the suite's value is that it was written without knowledge of
Emit's limitations, so any local edit — quoting a vector literal, widening an expected float,
deleting a form Emit cannot compile — would silently absorb a gap the suite exists to report. Local
adaptation SHALL be expressed only in the harness and the exclusion manifest, never in the suite
text.

Because the file is unmodified, its license SHALL NOT be carried in a source header — a header would
make it differ from upstream and defeat the checksum guard. Emit is MIT-licensed; the vendored
suite's own license (BSD-3-clause) SHALL be committed as a separate file beside it, retaining the
copyright notice, the list of conditions and the disclaimer, and the repository's own license
documentation SHALL name it. Any third-party code vendored later SHALL follow the same convention.

#### Scenario: The vendored copy matches upstream

- **WHEN** the vendored file is compared against the upstream revision named in its accompanying note
- **THEN** the files are byte-for-byte identical, and no license header has been added to it

#### Scenario: The third-party license travels beside the file

- **WHEN** the vendored directory is inspected
- **THEN** it contains the upstream license text with its copyright notice, conditions and disclaimer,
  and the repository's license documentation names that file

#### Scenario: A local adaptation is not made in the suite text

- **WHEN** a form in the suite cannot be compiled by Emit
- **THEN** it is recorded in the exclusion manifest, and the suite text is unchanged

### Requirement: A generated form manifest locates every top-level form

A Chez-hosted generator SHALL read the vendored suite and emit a committed manifest naming every
top-level form: its section (from the suite's own `test-begin` grouping), its extent in the file,
and a stable key.

The generator SHALL locate forms by scanning characters — tracking string literals, character
literals, block comments, datum comments and bar-quoted symbols — and SHALL NOT call `read`. Emit's
own reader cannot read this suite (it contains `#\alarm`, `#\x03BB`, `1/3`, `#0=` and
`#!fold-case`), which is the very thing being measured, so the manifest SHALL NOT depend on Emit;
and scanning rather than reading keeps the generator independent of its host's datum extensions
too.

A form's key SHALL be stable against unrelated edits elsewhere in the suite: a raw line number
SHALL NOT be the key, so that refreshing the vendored suite does not invalidate every exclusion.

Keys SHALL be unique. Since the suite repeats some text verbatim — `(test-end)` markers, and
assertion pairs written twice on purpose — a content-derived key SHALL disambiguate repeated text
by its occurrence order, while text that appears once SHALL keep a key derived from content alone.

#### Scenario: Every form is accounted for

- **WHEN** the generator runs over the vendored suite
- **THEN** the manifest's form extents tile the file's top-level forms with no gaps and no overlaps

#### Scenario: Lexical edge cases are located correctly

- **WHEN** the suite contains a bar-quoted symbol, a `#\(` character literal, a parenthesis inside a
  string, a nested block comment, and a datum comment
- **THEN** each surrounding top-level form's extent is correct, and no form is merged into another

#### Scenario: Sections come from the suite's own grouping

- **WHEN** the manifest is generated
- **THEN** each form carries the section named by the `test-begin` that encloses it, and the section
  list matches the suite's own

#### Scenario: An unrelated edit does not move other forms' keys

- **WHEN** a form is added to or removed from one section of the suite and the manifest is regenerated
- **THEN** the keys of forms in other sections are unchanged

#### Scenario: Repeated text still yields distinct keys

- **WHEN** the suite contains the same form text more than once, as it does for `(test-end)`
- **THEN** each occurrence has its own key, and generation does not fail on the repetition

### Requirement: A checksum guard ties the manifests to the vendored suite

The vendored suite's checksum SHALL be committed, and the runner SHALL verify it. When the suite is
refreshed without regenerating the manifest, the suite SHALL fail with a diagnostic naming the
mismatch and the regeneration command, rather than reporting results computed against stale form
extents.

#### Scenario: A refreshed suite with a stale manifest fails loudly

- **WHEN** the vendored suite is replaced and the runner is invoked without regenerating the manifest
- **THEN** the run fails with a checksum diagnostic naming the regeneration command, and reports no
  pass or fail counts

### Requirement: Excluded forms are declared with a reason

A committed exclusion manifest SHALL name every form Emit cannot compile or run, each with a reason
drawn from a closed set:

- `deliberate` — Emit will never support it; SHALL cite the issue or spec that decided so
- `issue-NN` — a filed defect; SHALL cite the issue
- `unimplemented` — a known gap with no issue yet
- `blocked-by` — the form is only excluded because a form it depends on is excluded; SHALL name that
  form

`blocked-by` SHALL be distinguished from the others so the inventory does not overstate itself: a
reference to a helper whose `define` was excluded is not an independent gap.

#### Scenario: Every exclusion carries a reason from the closed set

- **WHEN** the exclusion manifest is validated
- **THEN** every entry has a reason from the closed set, and every `deliberate` and `issue-NN` entry
  cites an issue or spec

#### Scenario: A dependency-blocked form is not counted as a gap

- **WHEN** a form is excluded solely because a helper it calls was excluded
- **THEN** its reason is `blocked-by` naming that helper's form, and the runner's gap count excludes it

### Requirement: The runner is Chez-free and narrates per section

`run-all-tests.sh` SHALL run the suite, and the runner SHALL require no Chez: it consumes only the
vendored suite and the committed manifests. It SHALL assemble one program per section, run each
through the shipped `emit` binary, and report per section the number of assertions passed, failed,
and forms excluded, following `docs/OUTPUT.md` — narration on stderr, results on stdout, honouring
`EMIT_VERBOSITY`.

A failing assertion SHALL be reported with its expression, its expected value and the value obtained.

#### Scenario: The suite runs from committed artifacts alone

- **WHEN** `run-all-tests.sh` runs on a machine with no `chez` on `PATH`
- **THEN** the R7RS suite runs and reports results

#### Scenario: Per-section reporting

- **WHEN** the suite completes
- **THEN** each section reports passed, failed and excluded counts, and the run reports a total

#### Scenario: A failure names the expression and both values

- **WHEN** an assertion fails
- **THEN** the report names the failing expression, the expected value and the obtained value

### Requirement: Inexact results are compared approximately

The harness SHALL compare inexact numbers approximately, not with `equal?`.

The suite writes its expected flonums to about 15 significant digits because `(chibi test)` compares
that way; comparing exactly reports a failure for every correctly-rounded double whose shortest
representation is longer than the literal in the suite — 13 such false failures in section 6.2
alone. Comparison SHALL treat a result as passing when it agrees with the expectation to the
precision the expectation was written at, and SHALL still report a genuine numeric disagreement.

#### Scenario: A correctly-rounded double matching a truncated expectation passes

- **WHEN** the suite expects `1.4142135623731` and Emit returns `1.4142135623730951`
- **THEN** the assertion passes

#### Scenario: A genuine numeric disagreement still fails

- **WHEN** the suite expects `#f` for `(= 9007199254740992.0 9007199254740993)` and Emit returns `#t`
- **THEN** the assertion fails

#### Scenario: Exact results are compared exactly

- **WHEN** an assertion's expected value is an exact integer
- **THEN** it is compared exactly, and no tolerance is applied

### Requirement: The exclusion manifest is checked in both directions

The runner SHALL check the exclusion manifest for staleness as well as for regression, and either
SHALL fail the suite.

- A form that is **not** excluded but no longer compiles or runs is a regression.
- A form that **is** excluded but now compiles, runs and passes is a **stale exclusion**, and SHALL be
  reported by form so the entry can be deleted.

This is what makes the manifest a ratchet rather than a snapshot: closing a gap announces itself
instead of waiting for someone to re-measure. A `deliberate` exclusion SHALL be checked the same
way — if a permanently-excluded form starts passing, either the exclusion or the belief behind it is
wrong.

#### Scenario: A newly passing excluded form fails the suite

- **WHEN** a gap is closed so that a form named in the exclusion manifest now passes
- **THEN** the suite fails, naming that form as a stale exclusion

#### Scenario: A regression in a non-excluded form fails the suite

- **WHEN** a form that ran before no longer compiles, and it is not in the exclusion manifest
- **THEN** the suite fails, naming the form and the error

#### Scenario: Closing a gap is a manifest deletion

- **WHEN** the self-evaluating-literal gap is closed
- **THEN** the suite reports the affected forms as stale exclusions, and removing their entries makes
  it pass

#### Scenario: An excluded form that still fails does not fail the suite

- **WHEN** a form named in the exclusion manifest still cannot compile
- **THEN** the suite counts it as excluded and does not fail
