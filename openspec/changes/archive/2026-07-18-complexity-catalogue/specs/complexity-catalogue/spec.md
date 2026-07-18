## ADDED Requirements

### Requirement: A reproducible tool catalogues tracked code by component, role, and language

The project SHALL provide a catalogue tool that enumerates the git-tracked files of the
repository and, for each file, reports its line count together with three classifications:
its **component** (derived from its path), its **role** (see the role taxonomy
requirement), and its **language** (derived from its file extension). The tool SHALL
operate on the set of git-tracked files only (so untracked scratch and build output are
excluded) and SHALL be deterministic: the same working tree SHALL always produce the same
catalogue. The tool SHALL run from the repository toolchain alone (`git`, a POSIX shell,
`wc`) without requiring an agent.

#### Scenario: The catalogue reports every tracked file exactly once

- **WHEN** the catalogue tool runs against the repository
- **THEN** every git-tracked regular file is counted exactly once
- **AND** each file is assigned exactly one component, one role, and one language
- **AND** the per-file line counts sum to the reported totals

#### Scenario: The tool runs without an agent

- **WHEN** a developer invokes the tool via its `make` target
- **THEN** the mechanical tables are produced using only the repository toolchain
  (`git`, POSIX shell, `wc`) with no network or agent dependency

### Requirement: The catalogue separates authored code from generated, vendored, reference, and tracking material

The catalogue SHALL classify each file into a **role** so that a lines-of-code total does
not conflate hand-authored complexity with material the project did not write by hand. The
role taxonomy SHALL at minimum distinguish: **authored** (hand-written compiler, runtime,
standard library, and tooling source); **generated** (build artifacts checked into the
tree, e.g. `bootstrap/*.ll`); **vendored** (third-party code, e.g. the nanopass copy under
`spike/`); **reference** (external material reproduced for convenience, e.g. an imported
standard document); **tracking** (OpenSpec changes and specs); **test**; **demo**; and
**spike** (first-party experiments). The catalogue SHALL report totals both including and
excluding non-authored roles, and SHALL make the authored subtotal prominent.

#### Scenario: Generated and vendored code are excluded from the authored subtotal

- **WHEN** the catalogue is produced
- **THEN** `bootstrap/*.ll` is classified as `generated` and the vendored nanopass tree is
  classified as `vendored`
- **AND** neither is counted in the authored subtotal
- **AND** the report shows both the authored subtotal and the full total so the difference
  is visible

#### Scenario: A misclassified path is a policy defect, not a silent miscount

- **WHEN** a file's role cannot be determined by the classification rules
- **THEN** the tool assigns it an explicit fallback role (e.g. `other`) rather than
  dropping it or guessing silently
- **AND** the file still appears in the catalogue so the gap is visible and can be fixed in
  the classification policy

### Requirement: The classification policy is explicit and maintainable in one place

The rules that map a file path to its component and role, and a file extension to its
language, SHALL be defined explicitly in the tool's source in one identifiable place, so
that when the architecture changes or code is relocated the policy is updated deliberately
rather than by re-deriving it. The policy SHALL be versioned with the repository.

#### Scenario: Relocating code requires only a policy edit

- **WHEN** a source file or directory is moved to a new path
- **THEN** restoring its correct component and role classification requires editing only
  the tool's classification rules
- **AND** no other part of the catalogue pipeline needs to change

### Requirement: The tool regenerates a persisted complexity document idempotently

The tool SHALL maintain a persisted, human-readable document at `docs/COMPLEXITY.md`. The
mechanically generated portions (the catalogue tables and totals) SHALL be written between
explicit begin/end markers so that regenerating the document replaces only those portions
and leaves hand-authored prose outside the markers intact. Running the tool twice against
an unchanged working tree SHALL leave the generated portions byte-identical (idempotent).
The document SHALL record the provenance of its generated portions (that they are
tool-generated and how to regenerate them).

#### Scenario: Regeneration preserves authored prose

- **WHEN** the tool regenerates `docs/COMPLEXITY.md` after a developer edited prose outside
  the generated markers
- **THEN** the generated tables between the markers are refreshed
- **AND** the authored prose outside the markers is unchanged

#### Scenario: Regeneration is idempotent

- **WHEN** the tool runs twice in succession against an unchanged working tree
- **THEN** the generated portions of `docs/COMPLEXITY.md` are byte-identical between the
  two runs

#### Scenario: The document states how it was generated

- **WHEN** a reader opens `docs/COMPLEXITY.md`
- **THEN** the document identifies its generated sections as tool-produced and names the
  command that regenerates them

### Requirement: The catalogue tool conforms to the tooling-observability conventions

The catalogue tool SHALL follow the project's tooling-observability conventions: it SHALL
announce the action it performs and name its inputs and outputs on stderr, emit its
machine-consumable catalogue data on stdout so narration never contaminates the data, and
respect the `EMIT_VERBOSITY` control. It SHALL report the relevant metrics (file counts and
line-count totals per role and language).

#### Scenario: Narration and data are on separate streams

- **WHEN** the tool runs and its stdout is captured to a file
- **THEN** the captured stdout contains only the catalogue data
- **AND** the human-readable narration (what it is doing, inputs, outputs) appears on
  stderr

#### Scenario: The run reports its metrics

- **WHEN** the tool finishes at the default verbosity
- **THEN** it reports the totals it produced (e.g. authored subtotal, full total, and
  per-language counts) as part of its narration
