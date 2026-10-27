# emit-cli Specification

## Purpose

Defines the single compiled `emit` binary as the sole user-facing entry point to the
compiler's four commands — `lib`, `build`, `run`, and `repl` — dispatched by verb. It
covers verb dispatch and usage errors, the Chez-free in-process runner (`emit run`), the
interactive REPL (`emit repl`), the compile-unit command (`emit lib`), the self-contained
build/lib pipeline (no external bash wrapper), and the self-hosting bootstrap driven
through `emit`.
## Requirements
### Requirement: Single `emit` binary is the sole user-facing entry point

The project SHALL ship one compiled `emit` binary that is the sole user-facing entry
point to the compiler's four compilation commands and its diagnostic command. It SHALL
dispatch on its first argument (the *verb*) to `lib`, `build`, `run`, `repl`, or
`doctor`, and SHALL report a usage error naming the known verbs when given an unknown
or missing verb. Top-level help and version requests SHALL be handled before verb
dispatch. The previously separate entry points (`build/scheme-run`, `build/repl-host`,
`bin/scheme-compile`, and the `bin/emit` bash wrapper) SHALL be removed; no user-facing
invocation depends on them.

#### Scenario: A verb dispatches to its command

- **WHEN** the user runs `emit run`, `emit repl`, `emit build`, `emit lib`, or `emit doctor`
- **THEN** the corresponding command executes

#### Scenario: An unknown verb is an error

- **WHEN** the user runs `emit frobnicate` (or `emit` with no verb)
- **THEN** it prints a usage error naming the known verbs (`lib`, `build`, `run`,
  `repl`, `doctor`) and exits non-zero

#### Scenario: The old entry points are gone

- **WHEN** the repository is built
- **THEN** no `build/scheme-run`, `build/repl-host`, `bin/scheme-compile`, or
  `bin/emit` is produced or required; every command is reached through `emit <verb>`

### Requirement: `emit run` runs a program in-process (Chez-free)

`emit run [--manifest F] [--no-prelude] [FILE]` SHALL compile and run a whole program
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

### Requirement: `emit lib` compiles one library to an artifact (compile-unit command)

`emit lib SRC [-o DIR] [--manifest F]` SHALL compile a single `define-library` source
to its artifact — the unit IR (`<name>.ll`) and the readable export table
(`<name>.exports`) — Chez-free, where `<name>` is derived from the library's
`define-library` name. Artifacts SHALL default under `build/lib` and be written under
`DIR` when `-o` is given. The emitted unit IR SHALL be byte-for-byte identical to the
unit the AOT and REPLs produce for the same source (one compile-unit core).

`emit lib` SHALL compile a library whose body resolves names through the library's **imports**, not
only an import-free library. It SHALL therefore register the baked library set and resolve the
source's imports before it derives either artifact, so that a library importing `(scheme base)`,
importing another manifest-resolvable library, or both, compiles successfully. Both artifacts SHALL
be derived from **one** compile session with one import environment, so the export table cannot
describe a different resolution than the unit IR does.

An import the command cannot resolve — a library that is neither a member of the baked set nor named in
the manifest — SHALL be reported as an error naming the unresolved library, and no artifact SHALL be
written.

#### Scenario: Compile a library to its artifact

- **WHEN** `emit lib test/modules/mylib.sld -o build/lib` is run
- **THEN** it writes `build/lib/mylib.ll` and `build/lib/mylib.exports`, with the `.ll`
  byte-identical to the unit the other compilation paths emit for `mylib`

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

### Requirement: every command accepts `--dump` for per-pass stage inspection

`emit run`, `emit build`, `emit lib`, and `emit repl` SHALL accept a `--dump` flag that
prints the intermediate language after each named compiler pass. The flag SHALL also be
settable through the environment so that tools and scripts can enable it without editing a
command line. All dump output SHALL be written to standard error; the flag SHALL NOT alter
what any command writes to standard output, and SHALL NOT alter the delivered executable, the
library artifact, or the value a program computes.

#### Scenario: `--dump` on the `emit run` command

- **WHEN** `emit run --dump FILE` is run
- **THEN** the IL after each named pass is printed to standard error, and the program's
  value is still printed on standard output exactly as without `--dump`

#### Scenario: `--dump` does not perturb emitted IR

- **WHEN** the same program is compiled with `emit run --emit` and with
  `emit run --emit --dump`
- **THEN** the bytes written to standard output are byte-for-byte identical

#### Scenario: `--dump` on the `emit lib` command

- **WHEN** `emit lib SRC --dump` compiles a library
- **THEN** the stages of that library's unit compilation are printed to standard error, and
  the written `.ll` and `.exports` artifacts are byte-identical to those written without
  `--dump`

#### Scenario: `--dump` on the `emit build` command

- **WHEN** `emit build NAME --dump` delivers a native executable
- **THEN** the stages are printed to standard error and the delivered executable behaves
  identically to one built without `--dump`

#### Scenario: `--dump` in the REPL

- **WHEN** the user starts `emit repl --dump` and enters a top-level form
- **THEN** the stages of that form's incremental compilation are printed to standard error
  before its value is printed, and the session state is unaffected

#### Scenario: The environment enables dumping

- **WHEN** a command is run with the dump environment variable set and no `--dump` on the
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

### Requirement: A command's diagnostics name that command, not the compiler's internal mode

A diagnostic a command prints SHALL be prefixed by the invoked command's name and SHALL NOT carry the
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
  applies to the diagnostics the non-REPLs print

### Requirement: A diagnostic that names a datum renders that datum

When a command's diagnostic reports a value the user wrote — a library name, a form, a literal — it
SHALL render that value's external representation rather than a placeholder. A diagnostic SHALL NOT
print `?` in place of a datum it is reporting.

This applies to error irritants on every command, not only the interactive one: the commands share one
error-rendering path, so an irritant that renders as a placeholder loses the same information
wherever it surfaces. The renderer SHALL handle at minimum symbols, strings, numbers, booleans,
characters, the empty list, pairs and proper lists, vectors, and bytevectors — the data a path's
diagnostics can be handed.

Where the rendering is genuinely impossible for a datum, the diagnostic SHALL say so rather than
substituting a placeholder that reads as if it were the value.

#### Scenario: An interactive import of a library that did not load names the library

- **WHEN** a session runs `(import (bad))` for a manifest library that failed to load
- **THEN** the diagnostic names `(bad)` — the library name the user typed — rather than reporting
  `imported library not loaded ?`

#### Scenario: A list irritant renders on a non-interactive execution path

- **WHEN** any command reports an error whose irritant is a list
- **THEN** the diagnostic renders that list's external representation

#### Scenario: A vector irritant renders

- **WHEN** a command reports an error whose irritant is a vector or bytevector
- **THEN** the diagnostic renders it as `#(...)` or `#u8(...)` rather than `?`

#### Scenario: The session survives the improved diagnostic

- **WHEN** an interactive form fails with a rendered diagnostic
- **THEN** the session restores its snapshot and the next form still evaluates, as it does today

### Requirement: every command answers `--help` and rejects an unknown option

Asking `emit` what it does SHALL succeed. `--help` and `-h` SHALL be accepted at the top level and
in every verb's option loop, SHALL print usage, and SHALL exit with a success status. They SHALL NOT
be reported as an unknown verb or an unknown option.

At the top level, `--help` SHALL print the summary of verbs and shared flags. For a verb,
`emit <verb> --help` SHALL print that verb's own usage — its argument form, the options it accepts,
and the shared options — so that every verb can be asked what it takes.

`emit help` SHALL be accepted as a spelling of the same request: bare, it SHALL print the top-level
summary; with a verb, `emit help <verb>` SHALL print exactly what `emit <verb> --help` prints. Named
with something that is not a verb, it SHALL be reported and SHALL exit non-zero, like any other
unknown verb.

**Destination follows why the text was printed.** Usage printed *because it was requested* is the
output the user asked for and SHALL go to standard output, so it can be piped or paged without
redirection. Usage printed *as part of an error* SHALL remain on standard error alongside the
diagnostic, and the process SHALL exit non-zero as it does today (missing verb, unknown verb,
unknown option).

**Every command SHALL reject an unknown option**, naming the command and the option, and exit non-zero. No
command SHALL silently ignore an option it does not recognize — a mistyped flag that changes nothing
and reports nothing is indistinguishable from one that worked.

#### Scenario: Top-level help succeeds

- **WHEN** `emit --help` (or `emit -h`) is run
- **THEN** the usage summary is printed on standard output and the process exits zero, with no
  `unknown verb` diagnostic

#### Scenario: A verb reports its own usage

- **WHEN** `emit run --help` is run, and likewise for `repl`, `build`, and `lib`
- **THEN** that verb's usage — its argument form and the options it accepts — is printed on standard
  output and the process exits zero

#### Scenario: `emit help` is the same request spelled as a word

- **WHEN** `emit help` is run, and separately `emit help <verb>`
- **THEN** the first prints the top-level summary and the second prints that verb's own usage, both
  on standard output with a zero exit; and **WHEN** `emit help` names something that is not a verb,
- **THEN** it is reported on standard error and the process exits non-zero

#### Scenario: Usage after an error stays on standard error

- **WHEN** `emit` is run with no verb, or with a verb it does not recognize
- **THEN** the diagnostic and the usage summary are printed on standard error and the process exits
  non-zero, as before

#### Scenario: An unknown option is rejected by every command

- **WHEN** any of `emit run`, `emit repl`, `emit build`, or `emit lib` is given an option it does not
  recognize
- **THEN** it reports the command and the offending option and exits non-zero, rather than ignoring the
  option and proceeding

### Requirement: The shipped JIT commands expose an optimization profile

`emit run` and `emit repl` SHALL accept exactly the optimization options `-O0`, `-O1`, and
`-O2`.  With no explicit option they SHALL use `-O1`.  `-O0` SHALL preserve the unoptimized JIT
backend behavior for diagnosis and measurement, while `-O1` and `-O2` SHALL select progressively
stronger standard LLVM optimization profiles before JIT execution.

At most one optimization option SHALL be accepted per invocation.  An unsupported level or
conflicting levels SHALL be a usage error naming the invoked command and offending options.  The
`build` and `lib` commands SHALL continue to reject these JIT-only options as unknown.  The `run` and
`repl` help text SHALL list the options and identify `-O1` as the default.

#### Scenario: Run defaults to the development profile

- **WHEN** a program is executed with `emit run` and no optimization option
- **THEN** it is JITted with the `-O1` profile and produces the same value and output as the
  unoptimized path

#### Scenario: Run accepts each supported profile

- **WHEN** the same program is executed separately with `emit run -O0`, `emit run -O1`, and
  `emit run -O2`
- **THEN** all three invocations succeed and produce byte-identical program output

#### Scenario: Repl accepts each supported profile

- **WHEN** a session is started separately with `emit repl -O0`, `emit repl -O1`, and
  `emit repl -O2`
- **THEN** each invocation starts a working session under the requested profile

#### Scenario: Unsupported and conflicting profiles are usage errors

- **WHEN** a JIT execution path is passed an unsupported level such as `-O3`, or more than one of
  `-O0`, `-O1`, and `-O2`
- **THEN** it names the command and options on standard error and exits non-zero without compiling
  or running user source

#### Scenario: Non-JIT commands reject a JIT profile

- **WHEN** `emit build` or `emit lib` is passed `-O0`, `-O1`, or `-O2`
- **THEN** it rejects the option as unknown rather than changing its existing backend profile

#### Scenario: Help documents the profile contract

- **WHEN** `emit run --help` or `emit repl --help` is requested
- **THEN** the usage text lists `-O0`, `-O1`, and `-O2`, explains their JIT scope, and identifies
  `-O1` as the default

### Requirement: A JIT profile is not silently ignored by a non-executing run mode

`emit run --emit` SHALL continue to write the compiler-produced, pre-backend modular IR used by
regen and byte-identity checks.  It SHALL NOT optimize or otherwise change those bytes.  Because
`--emit` and `--resolve-program` do not start a JIT, combining either mode with a JIT optimization
option SHALL be a usage error rather than a successful invocation that ignored the option.

#### Scenario: Emitted IR remains the compiler artifact

- **WHEN** a program is compiled with `emit run --emit`
- **THEN** stdout contains the same modular IR bytes as before this change and no JIT optimization
  is performed

#### Scenario: Emit mode rejects a JIT profile

- **WHEN** `emit run --emit` is combined with `-O0`, `-O1`, or `-O2`
- **THEN** the invocation reports the conflicting options on standard error, writes no IR to
  stdout, and exits non-zero

#### Scenario: Resolve mode rejects a JIT profile

- **WHEN** `emit run --resolve-program` is combined with `-O0`, `-O1`, or `-O2`
- **THEN** the invocation reports the conflicting options on standard error, writes no resolved
  paths to stdout, and exits non-zero

### Requirement: emit run stops option parsing at the program source

The executing form of `emit run` SHALL accept `emit run [OPTIONS] [FILE [ARG ...]]` and SHALL stop
option parsing at the first positional FILE (`-` names stdin). Before FILE, Emit options SHALL retain
their meanings, unknown options SHALL be rejected, and `--` SHALL end option parsing so the next token
is FILE. Every token after FILE, including `--`, SHALL be forwarded to the Scheme program unchanged.

#### Scenario: A dash-prefixed program argument is forwarded

- **WHEN** `emit run cli.scm --check input.scm` is invoked
- **THEN** `--check` and `input.scm` reach the Scheme process context in order and neither is treated
  as an Emit option

#### Scenario: A separator after FILE is forwarded verbatim

- **WHEN** `emit run cli.scm -- -x` is invoked
- **THEN** the program receives `--` and `-x` as its arguments, in that order

#### Scenario: Stdin source receives arguments

- **WHEN** `emit run - --check ''` is invoked with a program on standard input
- **THEN** the program's command line is `("-" "--check" "")`

#### Scenario: An unknown tool option remains an error

- **WHEN** `emit run --bogus cli.scm` is invoked
- **THEN** the command reports `--bogus` as an unknown Emit option and exits non-zero

#### Scenario: A separator before FILE ends option parsing

- **WHEN** `emit run -- -odd.scm a` is invoked and `-odd.scm` is a program source
- **THEN** `-odd.scm` is compiled and run as the program and receives `a` as its one argument

#### Scenario: An Emit option after FILE is a program argument

- **WHEN** `emit run app.scm --manifest m.scm` is invoked
- **THEN** `--manifest` and `m.scm` reach the program as its arguments and no manifest is loaded from
  them

#### Scenario: A second positional token is a program argument

- **WHEN** `emit run first.scm second.scm` is invoked
- **THEN** `first.scm` is the program and `second.scm` is its first argument, not a second source

### Requirement: Non-executing run modes reject program arguments

`emit run --emit` and `emit run --resolve-program` SHALL treat any program argument (a token after
FILE) as a usage error, reporting that program arguments require execution, and SHALL write nothing
to stdout.

#### Scenario: Arguments conflict with emit-only mode

- **WHEN** `emit run --emit cli.scm value` is invoked
- **THEN** the command reports that program arguments require execution and emits no IR

### Requirement: A program source may begin with an interpreter line

When `emit run` or `emit build` compiles a program source whose first line begins with `#!/` or
`#! `, that line SHALL be ignored up to and including its line terminator, as if it were a comment.
No other line, and no other `#!` spelling, SHALL be treated this way; reader directives such as
`#!fold-case` keep their meaning on every line. The same source SHALL produce the same program with
or without the interpreter line.

#### Scenario: A shebang script runs with arguments

- **WHEN** an executable file beginning `#!/usr/bin/env -S emit run` and printing `(command-line)` is
  invoked as `./tool.scm --check a.scm`
- **THEN** it prints `("./tool.scm" "--check" "a.scm")` and exits zero

#### Scenario: Script and executable see the same arguments

- **WHEN** the same source is invoked once as a shebang script and once as its `emit build`
  executable, each with the arguments `-- -x`
- **THEN** both programs receive `--` and `-x` after their command name

#### Scenario: A space after the bang is an interpreter line

- **WHEN** a program source begins with `#! /usr/bin/env -S emit run`
- **THEN** `emit run` ignores the first line and runs the program

#### Scenario: A leading case directive is still a directive

- **WHEN** a program source begins with the line `#!fold-case` followed by `(display 'ABC)`
- **THEN** the directive applies and the program prints `abc`

#### Scenario: An interpreter line is recognized only on the first line

- **WHEN** a program source contains `#!/usr/bin/env` on a line other than its first
- **THEN** compilation reports a read error, as it does today

#### Scenario: Standard input sources accept the line too

- **WHEN** a program beginning with `#!/usr/bin/env -S emit run` is piped to `emit run -`
- **THEN** the first line is ignored and the program runs

### Requirement: Every library-aware command accepts conventional library roots

`emit run`, `emit repl`, `emit build`, and `emit lib` SHALL accept repeatable `-L DIR` and
`--library-path DIR` options, preserving their command-line order. They SHALL also read a
host-path-list from `EMIT_LIBRARY_PATH` after explicit roots and before default project and installed
roots. An empty path-list element SHALL be rejected rather than interpreted as the current
directory.

Each command SHALL accept `--no-library-paths`, which disables explicit, environment, project-default,
and installed conventional roots while retaining baked and manifest providers. All verb help SHALL
document the options, environment variable, precedence, path derivation example, and relationship to
`--no-manifest-chain`.

#### Scenario: Repeated explicit roots are accepted by every command

- **WHEN** any library-aware command receives `-L first --library-path second`
- **THEN** both roots participate in that order and the first matching library wins

#### Scenario: Environment roots follow explicit roots

- **WHEN** an explicit root and an `EMIT_LIBRARY_PATH` root both contain the imported library
- **THEN** the explicit root's source is selected

#### Scenario: Empty environment elements are rejected

- **WHEN** `EMIT_LIBRARY_PATH` contains an empty element
- **THEN** the invoked command reports a configuration error rather than adding the current directory

#### Scenario: Conventional lookup can be disabled

- **WHEN** a command is invoked with `--no-library-paths`
- **THEN** it probes no conventional root and continues to resolve baked and exact manifest entries

#### Scenario: Help explains zero-mapping project layout

- **WHEN** help is requested for a library-aware command
- **THEN** it shows how `(my stats)` maps to `my/stats.sld` beneath a root and names the available
  root configuration and opt-out controls

### Requirement: Top-level version reports the built compiler identity

`emit --version` SHALL print `emit <VERSION> (LLVM <LLVM_VERSION>)` followed by a newline on stdout and exit zero. LLVM_VERSION SHALL identify the LLVM used to build Emit, independent of tools currently on PATH. The request SHALL require no source, library resolution, toolchain discovery, or JIT initialization. Verbosity SHALL NOT change these stdout bytes. Extra arguments SHALL be rejected as usage errors.

#### Scenario: Version works without an installed source tree

- **WHEN** a runnable Emit binary is invoked with `--version` from an unrelated directory with no discoverable native toolchain or library sources
- **THEN** it reports its compiled Emit and LLVM versions and exits zero

#### Scenario: Runtime discovery does not redefine build identity

- **WHEN** PATH contains a different LLVM major from the one used to build Emit
- **THEN** `emit --version` continues to identify the build-time LLVM version

#### Scenario: Version rejects ignored arguments

- **WHEN** `emit --version extra` is invoked
- **THEN** it reports a usage error on stderr and exits non-zero

### Requirement: Doctor reports effective installation and toolchain settings

`emit doctor` SHALL report Emit and build-time LLVM versions, executable and prefix locations, effective cc/clang path and version, libgc include/library locations, and runtime/discovery support files. It SHALL identify overrides, discovered values, and compiled defaults, distinguish unavailable from unknown versions, and identify an upstream AOT clang older than build-time LLVM. Apple clang's vendor major SHALL NOT be compared with upstream LLVM majors; its textual-IR compatibility SHALL be reported as unverified without alone failing doctor. Missing settings SHALL NOT prevent reporting other findings.

#### Scenario: Override and fallback origins are visible

- **WHEN** explicit native toolchain settings override discovery or discovery uses compiled defaults
- **THEN** doctor reports the effective values and their origins using the same precedence as `emit build`

#### Scenario: Missing dependency produces a complete report

- **WHEN** native discovery cannot find a usable compiler, libgc inputs, or required support files
- **THEN** doctor names each missing or invalid item, continues the remaining checks, and exits non-zero

#### Scenario: An incompatible AOT compiler is diagnosed

- **WHEN** the effective AOT compiler is upstream clang with a major older than Emit's build-time LLVM
- **THEN** doctor reports both versions, explains the textual-IR compatibility problem, and exits non-zero

#### Scenario: Apple clang has a separate compatibility status

- **WHEN** discovery selects Apple clang 21 for an Emit built with LLVM 23 and every required installation check passes
- **THEN** doctor identifies Apple clang and its version, reports textual-IR compatibility as unverified, and exits zero
- **AND** it performs no compilation and does not change compiler selection

#### Scenario: Apple clang does not hide other failures

- **WHEN** Apple clang is selected but a required support file or native dependency is missing
- **THEN** doctor still reports the missing item and exits non-zero

### Requirement: Doctor exposes the actual library provider order

Doctor SHALL accept `--manifest`, repeatable `-L`/`--library-path`, `--no-manifest-chain`, and `--no-library-paths` and honor `EMIT_MANIFEST` and `EMIT_LIBRARY_PATH` as compilation commands do. Its report SHALL list effective manifest and directory providers in lookup order, label their origins and availability, and identify disabled tiers. It SHALL use the same resolver rules as library compilation.

#### Scenario: Project overrides and installed fallbacks are shown in order

- **WHEN** doctor runs with an explicit project manifest, explicit and environment roots, and a relocated installation
- **THEN** its provider order matches an equivalent compilation, including the executable-relative installed tier before the compiled-prefix tier

#### Scenario: Resolver controls change the report

- **WHEN** doctor is invoked with either resolver opt-out flag
- **THEN** disabled providers are excluded from effective lookup and the report identifies the disabled tier

#### Scenario: Invalid resolver configuration fails legibly

- **WHEN** doctor receives a missing explicit manifest or an empty `EMIT_LIBRARY_PATH` element
- **THEN** it reports the same configuration error as compilation, marks the provider report incomplete, and exits non-zero

### Requirement: Doctor is a read-only diagnostic command

Doctor SHALL write its requested human-readable report to stdout at every verbosity, with narration and errors on stderr under `EMIT_VERBOSITY`. It SHALL compile no Scheme, write no artifacts, install nothing, and perform no network access. It SHALL exit zero when required installation checks pass, non-zero for failures, and treat absent optional providers as informational.

#### Scenario: Healthy installation leaves no artifacts

- **WHEN** doctor checks an installation with usable native dependencies, required support files, and shipped library providers
- **THEN** it exits zero without modifying the installation, project, or artifact cache
- **AND** stdout is identical at quiet, default, and verbose levels for the same settings

#### Scenario: Optional provider absence is informational

- **WHEN** a healthy relocated installation has no project manifest or project `lib/` and its old compiled prefix is absent
- **THEN** doctor describes those absences and still exits zero

#### Scenario: Missing shipped library payload is a failure

- **WHEN** no installed or checkout provider supplies the required shipped library payload
- **THEN** doctor identifies the incomplete installation and exits non-zero

### Requirement: Diagnostic command help follows the CLI conventions

Top-level usage SHALL list `doctor` and `--version`. `emit doctor --help`, `emit doctor -h`, and `emit help doctor` SHALL print identical doctor-specific usage on stdout and exit zero. Doctor SHALL reject unknown options and extra positional arguments with the command name and offending argument on stderr and a non-zero exit.

#### Scenario: Doctor has discoverable help

- **WHEN** any supported doctor help spelling is requested
- **THEN** usage lists diagnostic scope, resolver controls, output streams, and exit status without running checks

#### Scenario: Doctor rejects a mistyped option

- **WHEN** `emit doctor --bogus` or `emit doctor input.scm` is invoked
- **THEN** the command reports the offending argument on stderr, writes no report to stdout, and exits non-zero

### Requirement: Build can prepare the shipped standard libraries

`emit build --stdlib` SHALL prepare the baked library set and all non-baked entries in Emit's shipped default manifest without user source or a program executable. It SHALL prepare portable IR and native objects for the default `-O1` JIT profile, use the payload belonging to the invoked Emit, and ignore ambient project manifests and library roots. By default it SHALL prepare the user cache; with `--shared` it SHALL instead prepare the invoked Emit's shared cache. Help SHALL describe this mode, the `--shared` variant, and their cache destination policies.

#### Scenario: Prepare libraries from an unrelated directory

- **WHEN** an installed Emit runs `emit build --stdlib` from a directory containing no project
- **THEN** it prepares the shipped default-manifest libraries, including their compile-time interfaces, and exits zero after verifying cache persistence
- **AND** it reads no stdin, runs no program or library initializer, and creates no program executable

#### Scenario: A valid shared cache satisfies user preparation

- **WHEN** `emit build --stdlib` runs for an installation whose shared cache already holds valid entries for this executable and host
- **THEN** it reports those entries as reused from the shared cache, writes no duplicate of them into the user cache, and exits zero

#### Scenario: Prepare the installation's shared cache

- **WHEN** `emit build --stdlib --shared` runs with write access to the installation's shared cache location
- **THEN** it prepares the shipped libraries into that location, names it as the destination, and exits zero

#### Scenario: Project configuration cannot change the warm set

- **WHEN** a project manifest, `EMIT_MANIFEST`, or `EMIT_LIBRARY_PATH` supplies conflicting library definitions
- **THEN** `emit build --stdlib`, with or without `--shared`, still prepares the invoked Emit's own shipped libraries

#### Scenario: Incompatible build arguments are rejected

- **WHEN** `--stdlib` is combined with a program name, source file, `-o`, resolver-selection flags, a JIT optimization option, or stage-dump flags, or `--shared` is given without `--stdlib`
- **THEN** `emit build` names the incompatible arguments on stderr and exits non-zero without warming or building

#### Scenario: Help and narration follow CLI conventions

- **WHEN** the user requests `emit build --help` or `emit help build`
- **THEN** identical help on stdout describes ordinary builds, `--stdlib`, and `--shared`
- **AND** a warm invocation respects `-q`, `-v`, and `EMIT_VERBOSITY`, with status on stderr and no payload on stdout

### Requirement: The REPL banner and top-level help identify the running version

The `emit repl` banner SHALL name the Emit version and build-time LLVM version that `emit --version` reports, on standard error at every verbosity. The top-level usage summary SHALL begin with the `emit --version` line. Per-verb help and the output of every other command SHALL be unchanged.

#### Scenario: The REPL banner names the version

- **WHEN** `emit repl` starts at default, quiet, or verbose verbosity
- **THEN** standard error contains `Emit <VERSION> (embedded compiler, ORC/LLJIT, LLVM <LLVM_VERSION>).  ^D to exit.` with the same versions `emit --version` prints
- **AND** standard output carries only the session's results

#### Scenario: Top-level help starts with the version

- **WHEN** `emit --help`, `emit -h`, or bare `emit help` is run
- **THEN** the first line of standard output equals the output of `emit --version`, and the verb summary follows unchanged

#### Scenario: Program and verb output are unchanged

- **WHEN** `emit run`, `emit build`, `emit lib`, or `emit <verb> --help` is run
- **THEN** its standard output and narration contain no added version line

### Requirement: Doctor reports the library cache locations

`emit doctor` SHALL report the effective user cache location, and the shared cache location with its origin: installation, `EMIT_SHARED_CACHE`, or disabled. For the shared cache it SHALL report presence, entry count, and whether the running executable produced it. The shared cache's state SHALL NOT by itself make doctor exit non-zero, and doctor SHALL NOT compile or modify any cache entry to report it.

#### Scenario: A packaged installation reports a matching shared cache

- **WHEN** doctor runs from an installation whose shared cache was prepared by the installed executable
- **THEN** it reports the shared cache path, its entry count, and that it matches this executable

#### Scenario: A stale or absent shared cache is visible but not fatal

- **WHEN** doctor runs with a shared cache prepared by a different executable, or with none
- **THEN** it reports the shared cache as stale or absent and otherwise exits as it would without the shared cache

#### Scenario: A disabled shared cache is labeled

- **WHEN** doctor runs with `EMIT_SHARED_CACHE` set to the empty string
- **THEN** it reports the shared cache as disabled by the environment
