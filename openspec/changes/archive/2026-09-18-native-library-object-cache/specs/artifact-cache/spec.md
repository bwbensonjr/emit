# Spec Delta

## ADDED Requirements

### Requirement: JIT execution caches relocatable native library objects

The `emit run` and `emit repl` commands SHALL be able to reuse a relocatable native object produced
from a full, open-world library unit instead of parsing, optimizing, and generating machine code
from that unit's LLVM IR in every process. A native object SHALL be derived from the same full unit
and optimization profile that the command would otherwise submit to the JIT, and SHALL remain a
cache accelerator rather than an authoritative or shipped artifact.

Native objects SHALL NOT replace the portable LLVM IR artifacts, SHALL NOT be used as input to the
closed-world `emit build` tree-shaking path, and SHALL NOT be substituted for a unit pruned to a
particular program.

#### Scenario: A second JIT execution reuses native code

- **WHEN** a library is imported through `emit run` or `emit repl`, producing a native object, and
  the same unchanged library is imported again in a later process with the same JIT profile
- **THEN** the later process admits the cached object without parsing, optimizing, or generating
  machine code from that library's LLVM IR

#### Scenario: AOT delivery remains IR-based

- **WHEN** `emit build` delivers a program after JIT execution has populated native objects for its
  libraries
- **THEN** the build continues to tree-shake and optimize its portable IR units and does not link a
  cached full-unit native object in place of them

### Requirement: A native object is valid only for an identical execution environment

A native-object entry SHALL be reusable only when every input that can affect its instructions,
object format, symbols, or runtime ABI matches. Its identity SHALL cover at least the Emit compiler
and runtime, native-cache format, library and include-source identity, target triple, data layout,
CPU and enabled target features, LLVM identity, relocation and code model, and JIT optimization
profile.

The entry SHALL carry a completeness witness and content integrity check written only after the
object and its metadata are complete. An environment mismatch, incomplete entry, or integrity
failure SHALL be treated as a cache miss.

#### Scenario: A different optimization profile misses

- **WHEN** a library has a native object produced under `-O1` and a later session requests `-O2`
- **THEN** the `-O1` object is not reused and the library is compiled under `-O2`

#### Scenario: A different target or LLVM misses

- **WHEN** the target configuration or LLVM identity differs from the one recorded by a native
  object
- **THEN** the object is not admitted and execution falls back to the portable artifact path

#### Scenario: Corruption is detected before admission

- **WHEN** a native object or its metadata is truncated or changed after it was written
- **THEN** its integrity or completeness check fails before the object enters the JIT

### Requirement: Native-cache failure falls back to portable IR

An absent, stale, incompatible, corrupt, unreadable, or unwritable native-object entry SHALL NOT add
a failure mode to `emit run` or `emit repl`. The command SHALL use the existing portable IR path and
produce the same values, diagnostics, symbol availability, initialization order, and output it would
produce with no native-object tier. A successful fallback MAY populate a replacement native object.

Requests that require observing library compilation SHALL bypass native reuse on the same terms as
the existing IR cache, so a warm native cache cannot suppress requested compiler-stage output.

#### Scenario: An empty native cache is transparent

- **WHEN** a program or session runs with an empty native cache
- **THEN** it succeeds through the portable IR path and may leave an entry for a later process

#### Scenario: An unwritable native cache is transparent

- **WHEN** the native cache location cannot be written
- **THEN** execution succeeds through portable IR without reporting a program error

#### Scenario: Dump-all still observes compilation

- **WHEN** a command requests the library-stage output covered by `--dump-all` while a native object
  is available
- **THEN** the command bypasses native reuse and prints the same requested stages as a cold run

### Requirement: Native objects are derived locally and narrated separately

Native objects SHALL be created in the same user-writable cache hierarchy used by an installed or
in-checkout Emit, and SHALL NOT be shipped in or written into the installation tree. Cache narration
SHALL distinguish portable IR reuse, native-object reuse, and native-object generation, name the
library and JIT profile concerned, write narration only to standard error, and obey
`EMIT_VERBOSITY`.

#### Scenario: An installed command derives an object on its machine

- **WHEN** an installed `emit` first imports a library and later imports it again under a matching
  environment
- **THEN** the first process derives the native object in a user-writable cache and the later process
  reuses it without modifying the installation

#### Scenario: Quiet mode hides native-cache narration

- **WHEN** a native object is generated or reused under `EMIT_VERBOSITY=quiet`
- **THEN** no native-cache narration is written and the program's standard output is unchanged
