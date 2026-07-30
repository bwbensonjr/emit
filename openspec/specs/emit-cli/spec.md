# emit-cli Specification

## Purpose

Defines the single compiled `emit` binary as the sole user-facing entry point to the
compiler's four doors — `lib`, `build`, `run`, and `repl` — dispatched by verb. It
covers verb dispatch and usage errors, the Chez-free in-process runner (`emit run`), the
interactive REPL (`emit repl`), the compile-unit door (`emit lib`), the self-contained
build/lib pipeline (no external bash wrapper), and the self-hosting bootstrap driven
through `emit`.
## Requirements
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

### Requirement: Every door accepts `--dump` for per-pass stage inspection

`emit run`, `emit build`, `emit lib`, and `emit repl` SHALL accept a `--dump` flag that
prints the intermediate language after each named compiler pass. The flag SHALL also be
settable through the environment so that tools and scripts can enable it without editing a
command line. All dump output SHALL be written to standard error; the flag SHALL NOT alter
what any door writes to standard output, and SHALL NOT alter the delivered executable, the
library artifact, or the value a program computes.

#### Scenario: `--dump` on the run door

- **WHEN** `emit run --dump FILE` is run
- **THEN** the IL after each named pass is printed to standard error, and the program's
  value is still printed on standard output exactly as without `--dump`

#### Scenario: `--dump` does not perturb emitted IR

- **WHEN** the same program is compiled with `emit run --emit` and with
  `emit run --emit --dump`
- **THEN** the bytes written to standard output are byte-for-byte identical

#### Scenario: `--dump` on the lib door

- **WHEN** `emit lib SRC --dump` compiles a library
- **THEN** the stages of that library's unit compilation are printed to standard error, and
  the written `.ll` and `.exports` artifacts are byte-identical to those written without
  `--dump`

#### Scenario: `--dump` on the build door

- **WHEN** `emit build NAME --dump` delivers a native executable
- **THEN** the stages are printed to standard error and the delivered executable behaves
  identically to one built without `--dump`

#### Scenario: `--dump` in the REPL

- **WHEN** the user starts `emit repl --dump` and enters a top-level form
- **THEN** the stages of that form's incremental compilation are printed to standard error
  before its value is printed, and the session state is unaffected

#### Scenario: The environment enables dumping

- **WHEN** a door is run with the dump environment variable set and no `--dump` on the
  command line
- **THEN** it dumps as if `--dump` had been passed

### Requirement: Library units are dumped only on request

Because a program compiled with the auto-imported `(scheme base)` compiles that library
before the program itself, `--dump` SHALL by default dump only the **unit under
inspection** — the program for `run`/`build`, and the library named on the command line for
`lib`. A separate opt-in flag SHALL additionally dump the auto-imported `(scheme base)` and
any preloaded manifest libraries.

#### Scenario: The prelude's stages are not dumped by default

- **WHEN** `emit run --dump` compiles a program with the prelude auto-imported
- **THEN** the dump contains the program's stages and not the stages of `(scheme base)`

#### Scenario: Library units are dumped on request

- **WHEN** the same program is compiled with the opt-in all-units dump flag
- **THEN** the dump additionally contains the stages of `(scheme base)` and of each
  preloaded manifest library, each identified by its library name

