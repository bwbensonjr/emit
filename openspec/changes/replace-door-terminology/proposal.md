# Proposal

## Why

Emit uses "door" for several different ideas: CLI commands, compiler hosting paths, execution
paths, and the host-side boundary around the compiler core. The metaphor obscures those distinctions
and produces contradictory-looking counts such as three architectural doors versus four CLI doors.

## What Changes

- Establish context-based terminology: **command** or **verb** for the CLI surface, **compilation
  path** for ways source reaches the shared compiler core, **execution path** for ways compiled code
  runs, **host** for the component supplying I/O and integration, and **workflow** only for broader
  development or delivery activities.
- Replace "door" in user and developer documentation, current OpenSpec specs, explorations, archived
  planning prose, code comments, test descriptions, and narration with the term that states the
  intended concept.
- Rename live filenames and internal identifiers whose names encode the metaphor when the rename
  improves the design vocabulary, including the project-wide command coverage test and C++
  parameters that actually hold an invoked verb or command name.
- Preserve exact external and historical identifiers, including archived OpenSpec change names such
  as `run-door-user-libraries`, when changing them would break traceability; rewrite the surrounding
  prose so the identifier is clearly a quoted name rather than preferred terminology.
- Add a short preferred-terminology section to `CLAUDE.md`, which also updates `AGENTS.md` through its
  symlink, to keep future documentation and implementation vocabulary consistent.
- Regenerate committed compiler IR after compiler-source comments or identifiers change, and verify
  that the terminology-only refactor does not change behavior or non-comment emitted IR.

## Capabilities

### New Capabilities

None. This change introduces no new system behavior.

### Modified Capabilities

None. Existing requirements will be reworded without changing their normative meaning; this change
therefore opts out of delta specs.

## Impact

The change affects documentation under `docs/`, top-level and source documentation, contributor
instructions, main and archived OpenSpec prose, source comments and narrowly named internal
identifiers, test names/descriptions, suite labels, and generated bootstrap IR derived from edited
compiler sources. User-visible descriptive text may change where it uses the retired term, but error
conditions and diagnostic prefixes do not. The change does not alter the Scheme language, CLI
syntax, artifact formats, library resolution, compiler pipeline, or runtime behavior, and adds no
dependency.
