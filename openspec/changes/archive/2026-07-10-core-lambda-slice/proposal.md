## Why

The pipeline framework question is settled (`docs/PIPELINE.md`: hand-rolled `match`,
revisit nanopass past ~7–10 passes), and three of the spine passes are already
prototyped in `spike/nanopass/`. Nothing yet compiles and runs. This change builds the
first **production** vertical slice: a real program in a minimal core-lambda subset,
taken all the way `read → core → passes → LLVM IR → clang → run`. It proves the whole
toolchain path end to end and stands up the `src/` skeleton, the `match`-based pass
convention, and the named-IL-per-stage discipline that everything later plugs into.

## What Changes

- Add a production `src/` compiler for the **M1 core-lambda subset** (a deliberately
  minimal source language — see design D2), compiling a single top-level expression to a
  native executable.
- Establish the pass pipeline, hand-rolled over s-expressions with `match`, one named
  intermediate language per stage:
  `read → core → recognize-let → convert-assignments → convert-closures → lambda-lift →
  closure/alloc lowering → emit .ll`.
- **Promote** the three spike passes (`recognize-let`, `convert-assignments`,
  `convert-closures`) from `spike/nanopass/` reference into production; add the two new
  passes the slice needs (`lambda-lift`, closure/allocation lowering).
- Add a small **C runtime** (tagged values, the primitive set, `cons`/`car`/`cdr`,
  a value printer, program entry) linked against **Boehm GC** (phase 1).
- Add the **LLVM IR emitter** (textual `.ll`, opaque pointers, LLVM 22) and the **clang
  driver** that links IR + runtime + libgc into a runnable binary — implementing the
  AOT backend from `LLVM.md`.
- Adopt `LLVM.md`'s existing IR conventions as-is (tagged pointers, heap closures,
  single internal calling convention, `musttail` tail calls, Boehm GC) — referenced,
  not re-decided.
- Add stage-dump transparency (observe the IL after each named pass).

Deliberately **out of scope** (deferred): macros/`syntax-rules`, `call/cc`/CPS, strings,
vectors, chars, flonums, bignums, symbols-as-data, top-level `define`, precise GC,
in-process JIT, and any optimization passes.

## Capabilities

### New Capabilities
- `core-language`: the M1 core-lambda source subset the compiler accepts and its
  runtime semantics (what programs mean and how they run), including proper tail calls.
- `aot-codegen`: lowering core IL to textual LLVM IR and linking, via clang + a C
  runtime + Boehm GC, into a native executable; plus per-stage observability.

### Modified Capabilities
<!-- None. `compiler-pipeline` (from the spike) records the framework decision; this
     change implements against it without changing its requirements. -->

## Impact

- **New**: `src/` (reader glue, core rep, passes, emitter, driver), a C runtime
  (`runtime/`), demo programs, and a test harness (mirroring the spike's `run.ss`).
- **New tooling dependency**: clang / LLVM 22 and `libgc` (per `LLVM.md` install notes),
  in addition to the existing Chez host.
- **Reuses**: host Chez `read` and `match` (`spike/nanopass/vendor/match.sls`); the
  three promoted passes.
- **Governed by**: `docs/PIPELINE.md` (framework) and `LLVM.md` (IR conventions, AOT
  backend, GC).
