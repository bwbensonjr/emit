# Design

## Context

See `proposal.md` for motivation. The shipped host currently keeps a portable cache entry containing
LLVM IR, registration metadata, source identities, and a stamp. `emit run` and `emit repl` parse a
cached `.ll`, install the selected per-module optimization transform, and call `addIRModule`; ORC
then lowers the module when a symbol lookup materializes it. The September deferred-initialization
change prevents an unimported manifest library from reaching machine code, but a library that is
used pays that backend cost again in every process.

The persistent JIT already puts all library and REPL modules in one `JITDylib`, resolves `rt_*`
against the host process, and keeps initialization under explicit host control. LLVM 19+ exposes
both an object-cache hook at the IR compilation layer and `LLJIT::addObjectFile`, so the host can
capture the relocatable object produced on a cold materialization and admit it directly on a later
process.

The design must preserve three existing constraints: LLVM IR remains the portable bootstrap and
shipping representation; `emit build` remains a closed-world tree-shaken/LTO path; and every cache
failure falls through to a correct compile rather than becoming a user-visible failure.

## Goals / Non-Goals

**Goals:**

- Remove repeated IR parsing, JIT optimization, and code generation for unchanged library units
  after their first materialization on a particular execution environment.
- Reuse the same native object from both `emit run` and `emit repl` when their complete JIT identity
  matches.
- Preserve ORC's lazy materialization, cross-unit symbol resolution, import-time initialization, and
  the REPL's open world.
- Make native reuse locally derived, integrity checked, observable, and safely disposable.
- Measure cold generation, warm loading, startup, and first-import effects separately.

**Non-Goals:**

- Shipping native standard-library objects in an installation or release archive.
- Replacing `.ll`, `.meta`, public `emit lib` artifacts, or bootstrap IR.
- Feeding full native units to `emit build`, changing tree shaking, or replacing AOT LTO.
- Caching native code for interactive forms or per-program shaken units in this change.
- Designing cache eviction; `docs/PERFORMANCE.md` P17 continues to own that debt.
- Introducing operating-system shared libraries or an `emit` plugin ABI.

## Decisions

### D1: Cache relocatable objects, not shared libraries or bitcode

Each native artifact is the object buffer LLVM already produces immediately before ORC links it.
The host admits a hit with `addObjectFile` into the existing main `JITDylib`. Undefined library and
runtime symbols therefore resolve through the same ORC namespace and process-symbol generator as
IR-compiled units.

A `.so` or `.dylib` would add platform loader namespaces, PIC/export policy, install names, and a
second dynamic-linking ABI. Bitcode would avoid text parsing but would still repeat optimization and
machine-code generation. A relocatable object is the narrow artifact that removes all three backend
steps while leaving final address binding to ORC.

### D2: Add a derived native tier beside, not inside, the portable tier

The existing portable entry remains authoritative for registration metadata, compile-time exports,
source validation, initializer identity, and fallback IR. A native hit is considered only after the
portable entry has validated the library and established its unit identity. The native object never
supplies Scheme-level metadata of its own.

The native tier uses distinct `native-` stems and its own format version. A disk-sourced unit has one
object; the baked set has one object per partition member plus one set-level metadata/stamp pair, so
the baked members remain invalidated as a mutually consistent set. Native files are written into the
existing `EMIT_CACHE`/platform cache directory, not a checkout's `build/lib` and not the install
prefix.

An alternative is to replace each portable `.ll` with an object after its first use. That would
remove the correctness fallback, make `--emit` and `--dump-all` dependent on cache history, and blur
the platform-independent artifact boundary.

### D3: A JIT signature completes the existing cache identity

The native stem is derived from the validated portable entry identity plus a canonical JIT
signature containing:

- native-cache format version;
- running Emit executable digest, covering the compiled Scheme compiler and statically linked
  runtime ABI;
- LLVM version/build identity;
- target triple and data layout;
- CPU name and normalized enabled/disabled feature set;
- relocation model and code model;
- JIT optimization profile.

The source and include closure are inherited from the portable entry identity. The complete
signature, not merely a filename hash, is repeated in the native metadata. The object content digest
is recorded there, and a stamp containing that identity is atomically renamed last. A reader accepts
an entry only after checking the stamp, metadata identity, object digest, and LLVM object parser.

The executable digest alone is insufficient because Emit dynamically links LLVM and because one
binary may request several optimization profiles. Target triple alone is insufficient because a
host-native object may contain CPU-feature-specific instructions.

### D4: Check for a native hit before parsing IR; capture misses at ORC's compile seam

Library admission becomes one operation with two branches:

```text
validated portable metadata + unit identity
                  |
          native entry valid?
             /           \
           yes            no
            |              |
     addObjectFile      parse .ll / addIRModule
            |              |
       lazy link       lazy transform + compile
                           |
                     capture object atomically
```

On a hit the host reads no `.ll` for JIT admission. On a miss it follows the current IR path. The
module identifier is set to the complete native cache identity, and LLVM's IR compiler object-cache
hook records the object buffer produced after the configured transform and code generation. The
hook returns no native hit itself in the ordinary path: the host-level hit check is what avoids IR
parsing. Keeping capture at the compiler layer guarantees that the cached bytes are exactly those
ORC would have linked for that module and profile.

Object admission remains a lazy ORC materialization unit. Exact manifest entries may therefore be
registered and admitted before the prompt without linking their objects; their initializer lookup
at first import triggers linking. Conventional-path libraries retain their existing on-demand
registration closure.

Compiling a library is not enough to create a native object: only materialization reaches LLVM's
object compiler. This is intentional. A session that never imports a large library creates neither
machine code nor a native cache entry for it.

### D5: Keep initialization and compiler registration independent of code representation

The existing `.meta` registration path runs before native admission and continues to publish a
library's name, imports, export table, macros, and initializer symbol. Whether the following code
unit comes from `.ll` or `.o` is not exposed to the Scheme compiler.

The host continues to look up and invoke initializer symbols in dependency order and records each
as run before merging imports into REPL scope. A native object is never initialized by a platform
constructor. This preserves one-shot guards, error isolation, and dev-to-ship behavior.

### D6: Restrict native reuse to full library units on JIT execution paths

`emit run` and `emit repl` share native entries for the same full unit and JIT signature. `emit
build` ignores them and continues from IR because its units can be pruned differently for each
program and then optimized with LTO. `emit lib` continues to produce the public `.ll + .exports`
pair; it may seed the portable cache through existing behavior but does not promise a native object
without execution.

Caching shaken objects was considered and rejected for this change. Their identity would require
the existing program/root-set half, they cannot serve the open-world REPL, and native linking would
trade away the cross-unit optimization and binary-size properties the AOT path prioritizes.

### D7: Validate before admission and fail safe toward IR

Atomic object/metadata writes and a last-written stamp prevent torn entries from becoming visible.
The content digest detects later mutation, and LLVM's object parser rejects structurally invalid
bytes before they are submitted to LLJIT. These checks occur before `addObjectFile`, while fallback
is still a simple call to the existing IR admission path.

The complete environment key is intended to make a validly parsed but ABI-incompatible object
unreachable. If immediate object admission still returns an error, the host discards that entry and
uses IR. A materialization error after successful admission remains a genuine JIT failure unless it
can be attributed to the cache before session state changes; implementation tests must establish
that all corrupt-entry cases covered by the contract are rejected before that boundary.

`--dump-all` bypasses both portable and native reuse because it asks to observe library compilation.
Normal `--dump` remains orthogonal because it does not request library-unit stages.

### D8: Extend metrics and narration without changing program data

Verbose narration distinguishes `native object reused`, `native object generated`, and the reason a
native candidate missed. It names the unit, profile, object byte count, and relevant duration while
remaining on stderr. The existing aggregate JIT line gains native hit/generation counts and separates
object loading/linking from IR transform/materialization time.

Acceptance measurements compare empty and warm caches for the baked set, a small ordinary library,
and `(scheme char)`. They record process wall time, first-import latency, object size, and aggregate
JIT phases. Correctness gates require identical values, effects, diagnostics, initialization counts,
and emitted portable IR across native-cache states and optimization profiles.

## Risks / Trade-offs

- [LLVM object-cache APIs drift across the supported LLVM 19+ range] → Isolate LLVM-facing capture
  and admission behind one host adapter and compile/test against the minimum and current supported
  versions before enabling the tier by default.
- [A cache key omits a target or ABI input] → Build the signature from the configured JIT target
  machine, repeat it in metadata, and test deliberate changes to profile, executable, LLVM identity,
  target features, and format version.
- [A corrupt object poisons a persistent JIT before fallback] → Verify digest and parse the object
  before admission; use a resource tracker where supported; constrain fallback tests to occur before
  publishing session bindings.
- [Native objects increase cache growth] → Keep the tier disposable and separately prefixed so it
  can be measured and cleared; record the added growth under P17 rather than inventing eviction here.
- [Full native objects tempt reuse in AOT builds and increase executable size] → Make native lookup
  callable only from the shared JIT admission path and test that `emit build` output is independent
  of populated native entries.
- [Object loading saves less than expected because linking dominates] → Land measurements as an
  explicit gate and retain the simple IR fallback; the tier remains independently removable.

## Migration Plan

1. Introduce the versioned native namespace with reuse disabled, then validate signature and
   corruption handling against synthetic entries.
2. Enable capture on IR materialization and verify that cold execution remains byte-for-behavior
   identical while creating complete objects.
3. Enable host-level object admission for `emit run`, then for `emit repl`, with per-path metrics and
   cold/warm tests.
4. Measure the standard libraries and full suites before enabling native reuse by default.
5. Document the new files, narration, invalidation inputs, and safe manual removal.

Rollback requires only disabling native lookup/capture or reverting the host change. Existing
portable entries and installed sources remain intact; versioned native entries become harmless
orphaned cache files.
