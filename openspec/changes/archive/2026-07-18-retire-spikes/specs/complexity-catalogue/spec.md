## MODIFIED Requirements

### Requirement: The catalogue separates authored code from generated, vendored, reference, and tracking material

The catalogue SHALL classify each file into a **role** so that a lines-of-code total does
not conflate hand-authored complexity with material the project did not write by hand. The
role taxonomy SHALL at minimum distinguish: **authored** (hand-written compiler, runtime,
standard library, and tooling source); **generated** (build artifacts checked into the
tree, e.g. `bootstrap/*.ll`); **vendored** (third-party code copied into the tree, when
present); **reference** (external material reproduced for convenience, e.g. an imported
standard document); **tracking** (OpenSpec changes and specs); **test**; **demo**; and
**spike** (first-party experiments). A role MAY legitimately have zero members at a given
time (for example, after vendored code or experiments are removed); its classification rule
remains so the role is applied consistently if such code returns. The catalogue SHALL report
totals both including and excluding non-authored roles, and SHALL make the authored subtotal
prominent.

#### Scenario: Generated and non-authored code are excluded from the authored subtotal

- **WHEN** the catalogue is produced
- **THEN** `bootstrap/*.ll` is classified as `generated`
- **AND** any file matching a non-authored role rule (generated, vendored, reference,
  tracking, config, test, demo, spike) is excluded from the authored subtotal
- **AND** the report shows both the authored subtotal and the full total so the difference
  is visible

#### Scenario: A misclassified path is a policy defect, not a silent miscount

- **WHEN** a file's role cannot be determined by the classification rules
- **THEN** the tool assigns it an explicit fallback role (e.g. `other`) rather than
  dropping it or guessing silently
- **AND** the file still appears in the catalogue so the gap is visible and can be fixed in
  the classification policy
