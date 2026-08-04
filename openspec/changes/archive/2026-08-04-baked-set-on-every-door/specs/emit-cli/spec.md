## MODIFIED Requirements

### Requirement: `emit lib` compiles one library to an artifact (compile-unit door)

`emit lib SRC [-o DIR] [--manifest F]` SHALL compile a single `define-library` source
to its artifact — the unit IR (`<name>.ll`) and the readable export table
(`<name>.exports`) — Chez-free, where `<name>` is derived from the library's
`define-library` name. Artifacts SHALL default under `build/lib` and be written under
`DIR` when `-o` is given. The emitted unit IR SHALL be byte-for-byte identical to the
unit the AOT and REPL doors produce for the same source (one compile-unit core).

`emit lib` SHALL compile a library whose body resolves names through the library's **imports**, not
only an import-free library. It SHALL therefore register the baked library set and resolve the
source's imports before it derives either artifact, so that a library importing `(scheme base)`,
importing another manifest-resolvable library, or both, compiles successfully. Both artifacts SHALL
be derived from **one** compile session with one import environment, so the export table cannot
describe a different resolution than the unit IR does.

An import the door cannot resolve — a library that is neither a member of the baked set nor named in
the manifest — SHALL be reported as an error naming the unresolved library, and no artifact SHALL be
written.

#### Scenario: Compile a library to its artifact

- **WHEN** `emit lib test/modules/mylib.sld -o build/lib` is run
- **THEN** it writes `build/lib/mylib.ll` and `build/lib/mylib.exports`, with the `.ll`
  byte-identical to the unit the other doors emit for `mylib`

#### Scenario: The export table lists the library's exports

- **WHEN** `emit lib` compiles a library that exports `greet`
- **THEN** the written `.exports` table maps each external name to its mangled symbol
  (e.g. `greet` → `mylib:greet`)

#### Scenario: A library importing (scheme base) compiles to its artifact

- **WHEN** `emit lib` is run on a library that declares `(import (scheme base))` and whose body
  calls a standard-library procedure such as `map`, in a directory whose manifest does not name
  `(scheme base)`
- **THEN** it writes the unit IR and the export table, resolving `map` against the registered baked
  member rather than failing with an unbound variable

#### Scenario: A library importing another library compiles to its artifact

- **WHEN** `emit lib` is run on a library that imports a second library named in the manifest and
  calls one of its exports
- **THEN** the import resolves through the manifest, the unit IR references the exporter's mangled
  symbol as an external global, and both artifacts are written

#### Scenario: An unresolvable import is reported and writes nothing

- **WHEN** `emit lib` is run on a library that imports `(nope)`, which is neither baked nor in the
  manifest
- **THEN** it reports an error naming `(nope)` and writes neither the `.ll` nor the `.exports`

## ADDED Requirements

### Requirement: A door's diagnostics name that door, not the compiler's internal mode

A diagnostic a door prints SHALL be prefixed by the invoked door's name and SHALL NOT carry the
name of the embedded compiler's internal REPL orchestration. A compile error surfaced by `emit lib`,
`emit run`, or `emit build` SHALL therefore read `emit <verb>: <message>` with no interior `repl:`
segment, so the message names the tool the user ran.

#### Scenario: emit lib reports an unbound variable without the repl prefix

- **WHEN** `emit lib` compiles a library whose body references a name it cannot resolve
- **THEN** the diagnostic reads `emit lib: unbound variable <name>` rather than
  `emit lib: repl: unbound variable <name>`

#### Scenario: The REPL's own diagnostics are unchanged

- **WHEN** an interactive form in `emit repl` fails to compile
- **THEN** the session reports the error and continues exactly as before, since the prefix removal
  applies to the diagnostics the non-REPL doors print
