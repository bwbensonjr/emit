## MODIFIED Requirements

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
