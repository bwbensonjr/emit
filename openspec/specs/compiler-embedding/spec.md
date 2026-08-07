# compiler-embedding Specification

## Purpose

Defines how the compiler core is embedded as a callable, in-process compiler: assembling the
core into a program whose C-callable entry compiles Scheme source text to LLVM IR text
in-process (with the standard prelude baked in), and a runner that JIT-compiles and executes
a whole program in a single process without spawning Chez Scheme, `clang`, or `lli`. It also
fixes the fidelity, textual-IR, and host-agnostic artifact guarantees that make the embedded
path a faithful, portable stand-in for the batch path.
## Requirements
### Requirement: Compiler core assembles into a callable in-process entry

The project SHALL provide a way to assemble the compiler core into a program whose
C-callable entry compiles Scheme source text to LLVM IR text in-process and returns that
IR as a value, using the same compiler core as the batch compiler. Instead of prepending the
prelude as source text, the assembled entry SHALL re-home the prelude as the library
`(scheme base)`: from the compiler's **baked-in prelude source** — with no filesystem access —
it SHALL compile `(scheme base)` into a library artifact and export table, compile the user
program as if it began with `(import (scheme base))` via the same `compile-program-with-imports`
machinery the batch driver uses, and merge the derived-form macros into the program's
`macro-env` at expand time. The entry SHALL return two emitted modules separated by a fixed
boundary marker (a line that cannot occur in emitted core IR): the `(scheme base)` library IR,
the marker, then the program IR, with no target header on either. The host SHALL split on the
marker and treat the two as separate LLVM modules (they cannot be merged into one — each emits a
fixed `@__apply0` and reset string globals that would collide). Unless `--no-prelude` is in
effect, this re-homed behavior applies; `--no-prelude` SHALL skip both halves and emit only the
program (no marker).

#### Scenario: The assembled entry returns emitted IR

- **WHEN** the core is assembled in embedded-entry mode, linked, and its entry is called
  with a Scheme program supplied as source text
- **THEN** the entry returns a string containing the emitted `(scheme base)` library IR, a
  boundary marker, then the program's core IR (the program referencing `scheme.base` external
  globals for prelude procedures), and no target header is included on either module

#### Scenario: The embedded entry shares the batch compiler core

- **WHEN** the embedded entry and the batch Chez driver are each given the same prelude-using
  program
- **THEN** they produce the same core IR for the program, because both compile it through the
  same `compile-program-with-imports` path with `(scheme base)` auto-imported — the embedded
  entry differs only in assembling `(scheme base)` from baked-in source rather than reading it
  from disk

#### Scenario: Prelude shadowing matches the batch driver

- **WHEN** a program redefines a name also defined by the prelude and is compiled by the
  embedded entry
- **THEN** the user's definition wins (user-wins shadowing), identically to the batch driver,
  because the program's own top-level define takes precedence over the auto-imported
  `(scheme base)` binding in the Stage 0 resolution order

### Requirement: A runner compiles and runs a whole program in one process

The project SHALL provide a runner that embeds the compiled compiler and executes a whole
Scheme program in a single process: it SHALL obtain the program's IR from the embedded
compiler in-process, JIT-compile and run that IR, and print the program's value — with no
Chez Scheme process, no `clang`/`lli`, and no per-run subprocess.

#### Scenario: A program is compiled and run in-process

- **WHEN** a Scheme program is supplied to the runner as source
- **THEN** the runner prints the program's value, having compiled it via the embedded
  compiler and JIT-executed the emitted IR without spawning Chez, `clang`, `lli`, or any
  other subprocess

#### Scenario: The runner reads IR bytes from the embedded compiler

- **WHEN** the embedded compiler returns the emitted IR as a string value
- **THEN** the runner reads that string's bytes through the runtime's exported string
  accessors and parses them into an LLVM module for JIT execution

#### Scenario: A runtime trap is reported without aborting abruptly

- **WHEN** the running program triggers a runtime trap (for example an arity error)
- **THEN** the runner reports the trap message rather than crashing the process silently

### Requirement: The embedded runner agrees with the batch path (dev→ship fidelity)

The in-process runner and the batch AOT path SHALL produce the same observable result for
the same program, because they share one compiler core and one prelude re-homing. There
SHALL NOT be a separate compilation path for the runner: a prelude-using program SHALL resolve
its prelude procedures through `(scheme base)` on the embedded runner exactly as on the Chez
batch driver, not through a prepended prelude.

#### Scenario: Runner output matches AOT output

- **WHEN** the same program is run through the in-process runner and compiled-and-run
  through the batch AOT path
- **THEN** both print the same value

#### Scenario: Runner emitted IR matches the Chez driver

- **WHEN** the same prelude-using program is compiled by `scheme-run --emit` (Chez-free) and by
  the Chez batch driver
- **THEN** the program's emitted core IR is byte-identical between the two paths — the runner no
  longer inlines the prelude's definitions but references `(scheme base)` exports as the Chez
  driver does

### Requirement: The embedded compiler still emits textual IR

The embedded compiler SHALL return LLVM IR as text, and the runner SHALL parse that text
into a module. Embedding SHALL NOT replace the textual-IR boundary with direct in-memory IR
construction.

#### Scenario: Emitted IR remains inspectable text

- **WHEN** the embedded compiler compiles a program
- **THEN** its output is LLVM IR text — the same form of IR the batch path emits and
  `--dump` exposes — which the runner parses with the IR text parser

### Requirement: The embedded compiler artifact is host-agnostic and committed

The generated embedded-compiler IR artifact SHALL contain no host target header, so it is
cross-platform, and it SHALL be committed to the repository at a tracked path so a checkout
without Chez can build the runner from it. The build SHALL regenerate the artifact when the
compiler core sources change.

#### Scenario: A Chez-free checkout builds the runner

- **WHEN** the repository is checked out on a supported platform without Chez available and
  the runner is built
- **THEN** the build links the committed embedded-compiler IR and produces a working runner,
  because the committed IR carries no platform-specific target header

#### Scenario: A compiler-source change regenerates the artifact

- **WHEN** a compiler core source is changed and the runner is rebuilt
- **THEN** the embedded-compiler IR artifact is regenerated from the updated sources before
  the runner is linked

### Requirement: Stateful incremental per-form compilation entry

The embedded compiler SHALL expose an entry that compiles one entered form at a time,
maintaining its compilation state (REPL environment, macro environment, known-names set, and
form counter) across successive calls within one process, so that a form can reference
bindings and macros established by earlier forms. The entry SHALL return, for a successfully
compiled form, both the emitted IR and the name of that form's entry thunk (the entry-name
handshake), so the host looks up exactly the symbol the compiler chose rather than predicting
it.

#### Scenario: A later form sees an earlier definition, compiled in-process

- **WHEN** `(define x 41)` is compiled by the entry and then `(+ x 1)` is compiled as a
  separate call
- **THEN** the second call succeeds with `x` resolved to the earlier binding, and returns the
  IR together with the entry-thunk name for the host to run

#### Scenario: The compiler reports the entry-thunk name

- **WHEN** the entry compiles a form
- **THEN** it returns the form's entry-thunk symbol name alongside the IR, and the host
  resolves that exact name

### Requirement: The input-completeness probe agrees with the reader about comments and quoted identifiers

The embedded compiler's input-completeness probe — the entry a host calls to decide whether the text
typed so far is a whole form — SHALL recognize every comment form the reader recognizes: `;` to end
of line, nested `#| … |#`, and `#;` discarding the next datum. It SHALL likewise treat a bar-quoted
identifier `|…|` as one datum extent, the way it already treats a string. It SHALL continue to share
the reader's lexeme helpers rather than reimplementing them, so the two cannot disagree about where a
datum begins.

Text whose only defect is an **unfinished** lexeme SHALL be reported as **incomplete** — more input
is needed — and not as malformed: an unterminated `#|`, a `#;` with nothing after it yet, or an
unterminated `|`. A host therefore keeps reading lines instead of rejecting the form, which is what
lets a block comment or a quoted identifier be typed across several lines at a prompt.

#### Scenario: An unterminated block comment is incomplete, not malformed

- **WHEN** the probe is given `"#| a comment that continues"`
- **THEN** it reports incomplete, so the host asks for another line

#### Scenario: A completed multi-line block comment yields the following form

- **WHEN** the probe is given `"#| a\nmultiline comment |# (+ 1 2)"`
- **THEN** it reports a complete form, measuring the datum after the comment

#### Scenario: A datum comment awaiting its datum is incomplete

- **WHEN** the probe is given `"(list 1 #;"`
- **THEN** it reports incomplete rather than malformed

#### Scenario: An unterminated bar-quoted identifier is incomplete

- **WHEN** the probe is given `"(list |a b"`
- **THEN** it reports incomplete rather than malformed

#### Scenario: The probe and the reader answer for the same text

- **WHEN** any text the reader accepts as one complete datum is given to the probe
- **THEN** the probe reports it complete, and the length it reports is the extent the reader
  consumed

### Requirement: Compile-error recovery preserves the session

When compiling one form raises an error, the embedded compiler SHALL restore the compilation
state it held before that form and report the error, so that a subsequent form compiles as if
the failed form had never been entered. This recovery SHALL be expressed with the in-language
exception facility (`guard`), not by aborting the process.

#### Scenario: A bad form does not corrupt the session

- **WHEN** a form that fails to compile (for example, one referencing an unbound variable) is
  entered, followed by a valid form
- **THEN** the failed form is reported, the compiler's state is unchanged by it, and the valid
  form compiles and runs normally

#### Scenario: Recovery uses in-language guard

- **WHEN** the embedded compiler compiles a form that raises during expansion or lowering
- **THEN** the raise is caught in-language and the pre-form state is restored, rather than the
  raise reaching the outermost trap and ending compilation

### Requirement: The runner supports --no-prelude parity

The runner (`scheme-run` and `bin/scheme-compile`) SHALL accept `--no-prelude` and forward it to
the embedded entry through the smallest viable channel (an environment variable the entry reads
via a runtime primitive). With `--no-prelude`, the entry SHALL skip the `(scheme base)`
auto-import and the derived-form macro merge, emit only the program IR, and leave prelude names
unbound — matching the Chez batch driver's `--no-prelude`. The runner's single-module IR handling
(JIT for `scheme-run`, clang link for `scheme-compile`) SHALL be otherwise unchanged.

#### Scenario: --no-prelude skips the (scheme base) auto-import on the runner

- **WHEN** a program that references a prelude procedure is run through `scheme-run --no-prelude`
- **THEN** the embedded entry emits no `(scheme base)` IR and the reference is an unbound-variable
  error, exactly as under the Chez driver's `--no-prelude`

#### Scenario: --no-prelude on the runner matches the driver's --no-prelude

- **WHEN** the same program is compiled with `bin/scheme-compile --no-prelude` and with the Chez
  driver's `--no-prelude`
- **THEN** both emit only the program IR (no `(scheme base)`) and agree on the observable result

### Requirement: The embedded compiler has a standard-error narration channel

The embedded compiler SHALL be able to write informational output to standard error. The
runtime SHALL provide a primitive that prints a value to standard error in either
display or write style, sharing the runtime's existing tag-walking value printer so there
is only one printer to keep in sync. Standard output SHALL remain reserved for the
embedded compiler's data payload (emitted IR), so narration SHALL NOT be written there.

#### Scenario: Narration reaches stderr, not stdout

- **WHEN** the embedded compiler narrates while a door compiles a program
- **THEN** the narration appears on standard error and the door's standard output is
  unchanged

#### Scenario: Write style matches the runtime's printer

- **WHEN** the embedded compiler prints an IL form to standard error in write style
- **THEN** the bytes are those the runtime's existing write-style printer produces for that
  value (strings quoted, characters `#\`-prefixed)

### Requirement: The embedded compiler supports stage-dump parity

The embedded compiler SHALL accept a stage-dump level forwarded by its host through the
smallest viable channel (an environment variable the entry reads via a nullary runtime
primitive), matching the channel used for `--no-prelude`. The level SHALL distinguish
**off**, **stage names only** (the concise trace the Chez driver emits at verbose
verbosity), and **full per-pass IL dump**. The entry — not the pure compiler core — SHALL
read the level and construct the dumper, which is then passed through the core's existing
`dump` parameter; the core SHALL remain free of ports and of environment access.

#### Scenario: The host forwards the dump level

- **WHEN** a door is invoked with `--dump` and sets the dump-level variable before the
  first entry call
- **THEN** the embedded compiler dumps each pass, and with the variable unset it dumps
  nothing

#### Scenario: Stage names only at the intermediate level

- **WHEN** a door runs at the stage-names level rather than the full-dump level
- **THEN** the embedded compiler announces each pass by name in the order it runs, without
  printing the IL

#### Scenario: The pure core stays port-free

- **WHEN** the compiler core is inspected after this change
- **THEN** it still receives its dumper as a parameter and contains no standard-error
  write and no environment probe of its own

### Requirement: Stage dumping cannot alter emitted IR

Enabling any stage-dump level SHALL NOT change the IR the embedded compiler emits. The
dumper SHALL only read the intermediate language, and in particular SHALL NOT consume
gensym counter values, so the self-hosting fixed point and the anti-stale trust-check are
unaffected by dumping.

#### Scenario: Regen is unaffected by dumping

- **WHEN** the committed IR is regenerated with dumping enabled and with it disabled
- **THEN** the resulting `bootstrap/*.ll` are byte-identical in both cases

### Requirement: A door installs the compiler's source reader

The compiler core SHALL perform no file access. Where a source form names another file — the
`include` family of library declarations — the core SHALL obtain that file's forms by calling a
reader the **door** installed, taking the filename as written in the source and returning its
top-level forms. Resolution of a filename to a location, and the reading itself, SHALL belong to the
door, so the same core serves the Chez-hosted driver and the Chez-free binary without either one's
I/O mechanism appearing in it.

The Chez-free reader SHALL live in a source file that rides the Chez-free assembly only and is
excluded from the Chez driver's include block, as the stage dumper already is, because it calls
runtime primitives that are unbound identifiers when Chez evaluates the core sources.

A door that installs no reader SHALL still fail comprehensibly: an inclusion attempted without an
installed reader SHALL be a recoverable compile-time error naming the declaration and the filename,
never a crash or a silently empty body.

#### Scenario: Every door reads an included file

- **WHEN** the same library using `include` is compiled by the Chez driver and by each Chez-free
  door
- **THEN** each door reads the included file through its own installed reader and produces the same
  unit

#### Scenario: The core still performs no I/O

- **WHEN** the compiler core is inspected after this change
- **THEN** it contains no file-reading primitive and no path manipulation, and reaches an included
  file only through the installed reader

#### Scenario: An inclusion with no installed reader is named

- **WHEN** a compile path that installed no reader encounters an `include` declaration
- **THEN** a recoverable compile-time error names the declaration and the filename

### Requirement: A door tells the compiler where the source it submits came from

A door SHALL be able to tell the embedded compiler the location of the source it is about to submit,
through the same mode-based entry protocol used for the door's other operations, before submitting
that source for library loading, program compilation, export-table production, or an imports query.
The compiler SHALL use that location, and not the process's working directory, to resolve filenames
appearing in the source. When a door submits source with no location — text read from standard input
— the working directory SHALL be the fallback, and this SHALL be the only case in which it is used.

An imports query SHALL report the imports the source has **after** inclusion and feature selection,
so that a door's dependency resolution sees an import that arrived through
`include-library-declarations` or `cond-expand`.

#### Scenario: A library resolves its includes from outside the project directory

- **WHEN** a door compiles a manifest library that includes a file beside it, from a working
  directory unrelated to the library
- **THEN** the included file is found beside the library source

#### Scenario: Standard input falls back to the working directory

- **WHEN** a program or library is piped to a door with no filename
- **THEN** a relative included filename resolves against the current directory

#### Scenario: An import behind an inclusion is preloaded

- **WHEN** a program imports a library whose own `import` declaration arrives through
  `include-library-declarations`, and that dependency is named in the manifest
- **THEN** the door's dependency walk reaches the dependency and preloads it, rather than reporting
  an unresolved or cyclic import
