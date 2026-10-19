# self-hosting Specification

## Purpose

Defines the path toward compiling the compiler with itself: assembling the compiler core
into a single program expressed in the subset Emit accepts, and maintaining a complete
inventory of the remaining constructs the language does not yet support, so the stage-1
self-hosting build can proceed without discovering gaps ad hoc.
## Requirements
### Requirement: The core is assembled into a single self-hostable program

There SHALL be a repeatable step that assembles the compiler core into one program in the
language Emit accepts, with the source reader provided by the in-language `read-all-from-string`.
The core sources SHALL remain in a flat, concatenation-ready form (top-level
`define-syntax`/`define`s with no `library`/`import`/`include` wrappers and no top-level name
collisions), so assembling the program is ordered concatenation of the source files with a chosen
entry, performable with LLVM-era tooling alone. The assembly step SHALL NOT prepend the prelude:
the prelude is re-homed as the library `(scheme base)`, which the module-aware embedded compiler
auto-imports into the assembled program (its procedures resolving as `scheme.base:*` external
globals and its derived-form macros merged compile-time), and against which the compiler binary is
linked. This step SHALL NOT require Chez. The Chez assembler (`tools/assemble-core.ss`) MAY be
retained as historical/reproduction tooling but SHALL NOT be on the default build path.

#### Scenario: Assembled core is a flat program compiled against (scheme base)

- **WHEN** the assembly step runs over the core sources
- **THEN** it produces one file containing no `library`/`import`/`include` forms and no prepended
  prelude, and that file, compiled with `(scheme base)` auto-imported and linked, behaves like the
  core when run under the embedded compiler

#### Scenario: Assembly requires no Chez

- **WHEN** the compiler is assembled on a machine with only LLVM and libgc installed (no Chez)
- **THEN** the flat program is produced by concatenating the checked-in flat source files with the
  chosen entry (without prepending the prelude), and no Chez process is invoked

### Requirement: Remaining self-hosting gaps are fully enumerated

Compiling the assembled core with Emit SHALL yield a complete inventory of the
constructs the language does not yet accept, each classified (missing primitive, missing
prelude procedure, unsupported special form, or reader gap) and assigned a fix path, recorded
as the self-hosting gap backlog.

#### Scenario: Gap inventory is complete and sized

- **WHEN** the sweep has compiled the assembled core as far as it can
- **THEN** every remaining unsupported construct is recorded in the self-hosting gap list with
  a location and a fix path, so no further gap is discovered ad hoc during the stage-1 build

### Requirement: The compiler core compiles its own source

The compiler core SHALL be expressible in the language Emit accepts, such that the
core's own source can be compiled by Emit to produce a working compiler. Building the
core with the host-hosted compiler SHALL yield a native `schemec` that maps source text to
LLVM IR without Chez at compile time.

#### Scenario: Core builds to a native compiler

- **WHEN** the core source is compiled by the (Chez-hosted) compiler
- **THEN** a native `schemec` is produced that, given a program's source text, emits the same
  IR the Chez-hosted compiler emits for that program

### Requirement: Self-compilation reaches a stable fixed point

Compiling the compiler source with the self-built, module-aware embedded compiler SHALL reproduce
the compiler: the IR emitted for the source by the stage-1 compiler (call it stage-2), linked into
a stage-2 binary and used to recompile the source (stage-3), SHALL yield stage-2 byte-identical to
stage-3 (the triple test). Because the re-homed compiler links the `(scheme base)` library, this
fixed point SHALL span the set `{scheme.base.ll} ∪ {schemec.ll, embed.ll, embed-repl.ll}`:
`scheme.base.ll` is emitted from `lib/scheme/base.sld` and the compiler IRs are emitted with
`(scheme base)` auto-imported and linked against it, and all SHALL be byte-stable across a recompile.
This fixed point across self-compiled binaries is the acceptance criterion for self-hosting.

The stage-1 IR emitted by the *Chez-hosted* compiler is NOT required to match stage-2: Chez and
Emit intern the constant pool in different orders, so stage-1 legitimately differs. The compiler
converges after one recompile off Chez, not zero.

#### Scenario: Stage-2 and stage-3 IR are identical

- **WHEN** the compiler source is compiled by the stage-1 compiler (yielding stage-2), and stage-2
  is linked (with `scheme.base.ll`) and used to recompile the same source (yielding stage-3)
- **THEN** the stage-2 and stage-3 IR outputs are byte-identical, for `scheme.base.ll` and for each
  compiler binary's IR

### Requirement: Compiled compiler replaces Chez at compile time (path C)

Compiling a program SHALL require no Chez. The compiled `schemec` (source text → LLVM IR) and
the in-process runner `scheme-run` (source text → run) SHALL be buildable from committed IR with
only LLVM, and SHALL be the standard way to compile and run programs. A Chez-free path SHALL
exist to produce a standalone native executable from a program's source (for example
`scheme-run --emit` piped to `clang`), honoring standalone executables as a first-class
deliverable. The REPL host's removal of Chez is delivered separately by path A (in-process
embedding).

#### Scenario: A program is compiled and run without Chez

- **WHEN** a program is compiled and run through `scheme-run` (or `schemec` + `clang`) on a
  machine without Chez
- **THEN** compilation and execution complete with no Chez process, and the result matches the
  result the Chez-hosted driver produces for that program

#### Scenario: A standalone executable is produced without Chez

- **WHEN** a program's source is compiled to a native executable using only the committed
  compiler IR and LLVM (no Chez)
- **THEN** a standalone binary is produced whose output matches the AOT build's output

### Requirement: Committed self-compiled compiler artifacts are the authoritative form

The compiler's own emitted IR — for the batch compiler (`schemec`), the in-process runner
(`embed`), and the interactive REPL (`embed-repl`) — together with the re-homed prelude library
`scheme.base.ll` that all three link, SHALL be checked into the repository as host-agnostic stage-0
artifacts and SHALL be the favored, authoritative form from which the binaries are built. These
artifacts SHALL be produced by the compiled compiler itself (the self-hosting fixed point), not
only by the Chez-hosted compiler, so that they can be regenerated without Chez.

#### Scenario: Binaries build from committed IR without Chez

- **WHEN** the repository is checked out on a machine with only LLVM and libgc, and the default
  build is run
- **THEN** the compiler, runner, and REPL binaries are produced by linking the committed IR —
  including `bootstrap/scheme.base.ll` — with the runtime, and no Chez process is invoked and no
  regeneration is attempted

#### Scenario: Committed IR is self-produced

- **WHEN** the committed compiler IR is regenerated
- **THEN** it is emitted by the compiled compiler (`scheme-run`) over the assembled source and the
  library source, reaching the same byte-identical fixed point the triple test asserts

### Requirement: The compiler is regenerable from source without Chez

A developer SHALL be able to change the compiler source (for example add a primitive, a pass, or
module support) and rebuild the committed compiler IR and all binaries using only LLVM and libgc —
no Chez. This regeneration SHALL be an explicit, opt-in step (distinct from the default build,
which only links committed IR), and after it the rebuilt compiler SHALL compile programs with the
changed behavior. Regeneration SHALL emit `scheme.base.ll` from `lib/scheme/base.sld` and
module-compile the compiler sources against it (auto-importing `(scheme base)`), rather than
prepending the prelude.

#### Scenario: A compiler-source change is rebuilt Chez-free

- **WHEN** a developer edits a compiler source file and runs the regeneration step on a machine
  without Chez
- **THEN** the assembled program is reconcatenated (no prelude prepend), `scheme.base.ll` is
  emitted from the library source, the compiled compiler re-emits the committed IR auto-importing
  `(scheme base)`, the binaries relink against `scheme.base.ll`, and a program exercising the change
  compiles with the new behavior — all with no Chez process

### Requirement: Source consistency and independent-host verification are separate checks

A Chez-free check SHALL regenerate current compiler sources in an isolated clean checkout and compare every committed bootstrap module byte-for-byte. It SHALL run once for compiler/bootstrap/assembly-input changes and every release, failing on stale IR. Separately, Chez-seeded re-derivation SHALL verify the independent-host fixed point once per release and on scheduled/manual reference runs; absence of Chez SHALL NOT suppress source consistency.

#### Scenario: Un-regenerated compiler change is caught

- **WHEN** compiler source changes without matching regenerated bootstrap IR
- **THEN** source-consistency validation reports a mismatch and fails even with Chez absent
- **AND** the developer's checkout and bootstrap files are not modified

#### Scenario: An independent host reproduces the fixed point

- **WHEN** reference validation builds the current compiler source under Chez and then self-compiles it
- **THEN** the resulting stable compiler and baked modules match committed IR
- **AND** this is reported separately from Chez-free source consistency without requiring a rebuild of frozen genesis

#### Scenario: Host-only edits do not trigger compiler regeneration

- **WHEN** a change touches only native host integration and no compiler, bootstrap, or assembly inputs
- **THEN** classification does not require source-consistency regeneration and native host validation still runs

#### Scenario: Required verification is unavailable

- **WHEN** a required source-consistency or independent-host check cannot execute
- **THEN** its gate fails rather than treating a missing tool or skipped check as success

### Requirement: No developer-facing compiler capability requires Chez

Every capability needed to build, run, inspect, or debug a program SHALL remain reachable through shipped binaries without Chez, including per-pass inspection and bootstrap regeneration. Chez SHALL remain an independent verification and frozen-genesis host, not a native test prerequisite. Source units and targeted cross-host checks SHALL be separately selectable; the developer verification entry point SHALL retain source consistency, reference parity, and independent-host checks.

#### Scenario: A Chez-free machine can inspect the pipeline

- **WHEN** a developer with no `chez` on PATH builds the compiler, runs a program, starts the REPL, and inspects the IL after each pass
- **THEN** all four succeed through the shipped binary, and no step reports a missing Chez

#### Scenario: Chez remains the verification host

- **WHEN** the complete developer verification entry point runs with Chez available
- **THEN** it verifies source/bootstrap consistency, independent-host fixed-point re-derivation, and shipped stage-dump parity against the Chez driver
- **AND** those obligations remain individually selectable with separately reported costs

#### Scenario: The Chez driver's dump is retained as the reference

- **WHEN** the shipped binary's stage dump and the Chez driver's stage dump are produced for the same program
- **THEN** the two agree on the stage names, their order, and intermediate forms, compared structurally rather than byte-for-byte

#### Scenario: Fast units exercise edited source directly

- **WHEN** source-unit validation runs after a compiler pass is edited and before regeneration
- **THEN** it tests the current source under Chez without first running the native regression or bootstrap suites
- **AND** its result does not claim that the committed native compiler incorporates those edits

#### Scenario: Export metadata is independent of compilation history

- **WHEN** fresh and artifact-restored dependencies supply equal binding identities to the two compiler hosts
- **THEN** their complete export interfaces are byte-identical, including compiler-owned graph labels
- **AND** explicit sharing and cycles in user macro literal/template data remain preserved

