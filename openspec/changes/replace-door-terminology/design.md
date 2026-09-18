# Design

## Context

See `proposal.md` for motivation. The term appears in more than user documentation: it is common in
main OpenSpec requirements, archived planning records, compiler comments, test narration and helper
names, build comments, and a few C++ identifiers and Scheme diagnostic strings. `AGENTS.md` is a
symlink to `CLAUDE.md`, so one edit governs both contributor entry points.

The existing uses do not denote one stable abstraction. Some count the Chez driver, embedded
compiler, and REPL as three hosting arrangements; others count the four `emit` verbs; still others
compare an in-process computation with a delivered executable. A global word-for-word substitution
would preserve the ambiguity under a new name.

## Goals / Non-Goals

**Goals:**

- Make each comparison name the layer it is actually comparing.
- Give contributors a small vocabulary that works in prose, comments, identifiers, and tests.
- Leave no unquoted use of the retired metaphor in first-party tracked text.
- Preserve behavior while allowing descriptive diagnostics and test narration to adopt the new
  vocabulary.

**Non-Goals:**

- Rename the `emit` verbs or alter their option syntax.
- Rename historical commits, issue titles, or OpenSpec change identifiers.
- Replace established technical terms such as frontend, backend, driver, runner, host, AOT, JIT, or
  REPL when they already identify the intended component precisely.
- Turn this terminology policy into a new runtime abstraction or public API.

## Decisions

### 1. Choose terminology from the layer being discussed

Use the following mapping:

| Intended concept | Preferred term | Examples |
|---|---|---|
| A user invocation selected by `argv[1]` | **command**; **verb** only for its syntactic selector | `emit run` command, `run` verb |
| A way source reaches the shared compiler core | **compilation path** | Chez-hosted compilation path, embedded compilation path |
| A way compiled code is evaluated or delivered | **execution path** | in-process execution path, standalone executable |
| The component that supplies files, callbacks, or process integration | **host** or a concrete component name | Chez driver, `emit` host, REPL host |
| A broader developer activity | **workflow** | development workflow, delivery workflow |
| A specific implementation segment | Existing precise term | resolver, reader, pipeline, backend, driver, runner |

Prefer a concrete name over a category when only one component is meant: write “`emit build`” rather
than “the build command,” and “the Chez driver” rather than “the Chez-hosted compilation path.” When
several members are compared, enumerate them if a category would hide meaningful differences.

Alternatives considered:

- **Mode** was rejected because Emit already has compiler protocol modes and option-controlled
  modes.
- **Backend** was rejected because AOT, JIT, and bitcode already use that term precisely.
- **Frontend** was rejected because the compared paths share the language frontend.
- **Entry point** remains appropriate for the single `emit` binary or callable symbols, but is too
  overloaded to name every comparison.
- **Route** merely exchanges one metaphor for another without resolving the layer.

### 2. Treat the replacement as semantic editing, not bulk substitution

Each occurrence is classified before rewriting. Plural claims such as “all doors” must state whether
they apply to all four commands, all compiler hosts, both shipping compilation paths, or all tested
execution paths. Contradictory-looking counts are removed instead of recreated as “three paths” and
“four paths” without qualification.

This applies to README files, `docs/`, contributor documentation, current specifications,
explorations, and archived OpenSpec prose. Archived prose may be copy-edited because it remains
first-party documentation, but its decisions and historical claims must not be modernized or
reinterpreted.

### 3. Preserve exact historical identifiers

Names such as `run-door-user-libraries`, `baked-set-on-every-door`, and `emit-cli-front-door` are
stable OpenSpec change identifiers. They remain byte-for-byte unchanged wherever cited. Surrounding
text must present them as exact identifiers, normally in backticks, and must not use their wording as
the current generic term.

The same exception applies to a quoted external title or historical diagnostic when changing the
quote would make it inaccurate. Git history and third-party/vendor content are outside the editable
tree. The terminology audit therefore allows only documented exact-name or quotation exceptions;
the change proposal and design may also quote the retired word because they define the migration.

Renaming all historical identifiers was considered and rejected because it would break links among
specs, archived changes, commits, tests, and issue discussions while providing no design benefit.

### 4. Rename live implementation vocabulary when it carries the same ambiguity

Comments, local identifiers, helper functions, test helpers, test output, suite labels, and filenames
are part of the design vocabulary and are updated when they describe a current concept. Examples
include:

- C++ parameters holding `run` or `repl` become `verb` or `command`, while the helper that removes an
  internal `repl:` prefix receives a name describing message normalization rather than a metaphor.
- Test helpers such as `run_door`, `aot_door`, and `repl_door` become names describing the action,
  such as running a program, building and executing it, or evaluating it in the REPL.
- `test/project-door-tests.sh` becomes a command- or workflow-oriented name, with all callers and
  documentation updated atomically.
- A diagnostic such as “this door installed no source reader” names the responsible host or
  compilation path.

No new abstraction is introduced solely to centralize these names. Existing exact change-name
references embedded in comments remain under Decision 3.

### 5. Put the durable rule in the shared contributor instructions

Add a short “Terminology” section to `CLAUDE.md`; the `AGENTS.md` symlink exposes the same text. It
states the contextual mapping from Decision 1, asks authors to name concrete commands/components
when possible, and reserves the retired term for exact historical identifiers or quotations.

A permanent source scanner was considered but rejected initially. The legitimate historical
identifiers make a simple banned-word check noisy, while the important property is contextual
accuracy rather than absence of a byte sequence. Implementation uses an inventory and reviewed
allowlist; contributor guidance provides the ongoing guardrail.

## Risks / Trade-offs

- [Large wording diff accidentally changes a normative requirement] → Review main specs by
  requirement and require wording-only edits that preserve every SHALL/SHALL NOT condition and
  scenario outcome.
- [A mechanical replacement introduces a different ambiguity] → Classify each occurrence using
  Decision 1 and prefer concrete command/component names.
- [Historical traceability is lost] → Preserve exact identifiers and quoted historical material;
  change only their surrounding generic prose.
- [A renamed test is omitted from a suite] → Rename the file and all references together, then
  enumerate suite membership and run the default suite.
- [Compiler-source text changes leave bootstrap artifacts stale] → Observe the regen barrier,
  regenerate once after all compiler-source edits, and run both required suites.
- [Descriptive diagnostic wording breaks asserted output] → Update assertions in the same change
  and verify error conditions, prefixes, stdout/stderr placement, and exit status remain unchanged.

## Migration Plan

1. Capture a repository-wide occurrence inventory and classify uses by command, compilation path,
   execution path, host, workflow, precise component, or allowed exact identifier.
2. Update contributor instructions and first-party prose, including main specs and archived planning
   records, without changing normative meaning or historical decisions.
3. Update live comments, strings, identifiers, test helpers, suite labels, and filenames; update all
   references atomically.
4. Format affected hand-authored Scheme sources according to project policy. Finish all
   compiler-source edits, run `make regen` once, and make no further compiler-source edits until the
   required suites finish.
5. Run the focused renamed tests, `./run-all-tests.sh`, and `./run-dev-tests.sh`; then repeat the
   terminology inventory and review every remaining occurrence against the narrow exceptions in
   Decision 3.

Rollback is a normal revert of the wording/rename commit together with its regenerated bootstrap
artifacts; there is no data or compatibility migration.
