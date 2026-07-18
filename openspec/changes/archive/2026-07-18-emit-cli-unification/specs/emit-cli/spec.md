## ADDED Requirements

### Requirement: Single `emit` binary is the sole user-facing entry point

The project SHALL ship one compiled `emit` binary that is the sole user-facing entry
point to the compiler's four doors. It SHALL dispatch on its first argument (the
*verb*) to `lib`, `build`, `run`, or `repl`, and SHALL report a usage error naming the
known verbs when given an unknown or missing verb. The previously separate entry
points (`build/scheme-run`, `build/repl-host`, `bin/scheme-compile`, and the `bin/emit`
bash wrapper) SHALL be removed; no user-facing invocation depends on them.

#### Scenario: A verb dispatches to its door

- **WHEN** the user runs `emit run`, `emit repl`, `emit build`, or `emit lib`
- **THEN** the corresponding door executes

#### Scenario: An unknown verb is an error

- **WHEN** the user runs `emit frobnicate` (or `emit` with no verb)
- **THEN** it prints a usage error naming the known verbs (`lib`, `build`, `run`,
  `repl`) and exits non-zero

#### Scenario: The old entry points are gone

- **WHEN** the repository is built
- **THEN** no `build/scheme-run`, `build/repl-host`, `bin/scheme-compile`, or
  `bin/emit` is produced or required; every door is reached through `emit <verb>`

### Requirement: `emit run` runs a program in-process (Chez-free)

`emit run [FILE] [--manifest F] [--no-prelude]` SHALL compile and run a whole program
in-process without Chez, resolving user-library imports through the manifest, with
behavior identical to the prior `scheme-run`. The program source SHALL be read from
`FILE` when given, otherwise from stdin. `emit run --emit` SHALL write the emitted IR
to stdout instead of running (the Chez-free AOT front half used by `emit build` and the
self-hosting regen), and `emit run --resolve-program NAME` SHALL resolve a manifest
program entry (as in slice #2), printing its source and output without running.

#### Scenario: Run a program that imports a user library

- **WHEN** `emit run` runs a program importing `(mylib)` with `(mylib)` in the manifest
- **THEN** it loads/initializes the imports and prints the program's value, identical
  to the prior `scheme-run`

#### Scenario: `--emit` writes IR without running

- **WHEN** `emit run --emit` is given a program on stdin
- **THEN** it writes the program's IR (units joined by the boundary marker) to stdout
  and runs nothing

### Requirement: `emit repl` is the interactive REPL

`emit repl [--manifest F]` SHALL start the persistent interactive REPL, with behavior
identical to the prior `repl-host`: a persistent JIT session, per-form incremental
compilation, and manifest-driven `import`.

#### Scenario: Interactive import and evaluation

- **WHEN** the user starts `emit repl` with a manifest and imports a library, then
  evaluates an expression using its export
- **THEN** the session behaves exactly as the prior `repl-host` did

### Requirement: `emit lib` compiles one library to an artifact (compile-unit door)

`emit lib SRC [-o DIR] [--manifest F]` SHALL compile a single `define-library` source
to its artifact — the unit IR (`<name>.ll`) and the readable export table
(`<name>.exports`) — Chez-free, where `<name>` is derived from the library's
`define-library` name. Artifacts SHALL default under `build/lib` and be written under
`DIR` when `-o` is given. The emitted unit IR SHALL be byte-for-byte identical to the
unit the AOT and REPL doors produce for the same source (one compile-unit core).

#### Scenario: Compile a library to its artifact

- **WHEN** `emit lib test/modules/mylib.sld -o build/lib` is run
- **THEN** it writes `build/lib/mylib.ll` and `build/lib/mylib.exports`, with the `.ll`
  byte-identical to the unit the other doors emit for `mylib`

#### Scenario: The export table lists the library's exports

- **WHEN** `emit lib` compiles a library that exports `greet`
- **THEN** the written `.exports` table maps each external name to its mangled symbol
  (e.g. `greet` → `mylib:greet`)

### Requirement: `emit build`/`emit lib` are self-contained (no external wrapper)

`emit build` and `emit lib` SHALL perform their full pipeline within the `emit` binary:
emit the IR in-process and, for `build`, invoke the C toolchain (`clang`) to link the
runtime and units into the native executable. They SHALL NOT depend on the removed
`bin/scheme-compile` / `bin/emit` bash wrappers. Toolchain discovery SHALL remain
single-sourced through `tools/llvm-env.sh`.

#### Scenario: `emit build` links without the old wrapper

- **WHEN** `emit build NAME` is run with `bin/scheme-compile` absent from the tree
- **THEN** it resolves the program entry, emits the IR, links via `clang`, and delivers
  a working standalone executable

### Requirement: The self-hosting bootstrap runs through `emit`

The Chez-free regeneration of the committed IR (`tools/regen.sh`, `make regen`) and the
trust-check SHALL drive the compiler through `emit` (e.g. `emit run --emit`) rather than
the removed `scheme-run`, and SHALL still reach a byte-stable fixed point (a clean-tree
`make regen` leaves `git diff bootstrap/` empty).

#### Scenario: Regen is byte-stable through emit

- **WHEN** `make regen` runs from a clean tree using `emit`
- **THEN** the regenerated `bootstrap/*.ll` are byte-identical to the committed ones
