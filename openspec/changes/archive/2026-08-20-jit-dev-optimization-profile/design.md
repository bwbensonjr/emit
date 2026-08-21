## Context

See `proposal.md` for the performance motivation.  The shipped host currently creates two bare
`LLJIT` instances in `src/emit.cpp`, one for `emit run` and one for `emit repl`.  Both feed modules
through the shared `add_ir`: parse one IR string into its own `LLVMContext`, set the JIT data
layout, and call `addIRModule`.  Library modules, the run door's program module, and each REPL form
therefore remain separate; there is no merged module at the point where P13 originally suggested
installing a pipeline.

That separation is load-bearing for the REPL.  A form is compiled before future forms exist,
previous globals are external declarations, definitions must remain visible to later modules, and
redefinition is prospective rather than retroactive.  Conversely, compiler-produced IR is a
load-bearing artifact: `emit run --emit` feeds regeneration and byte-identity checks, while
`--dump` observes the Scheme pass ladder before LLVM owns the module.  Backend optimization must
not rewrite either observation channel.

The supported LLVM already supplies ORC and the new pass manager through the headers and link
flags used to build `src/emit.cpp`; no additional runtime or installed artifact is needed.

## Goals / Non-Goals

**Goals:**

- Put one implementation of LLVM optimization behind both shipped ORC doors.
- Optimize each independently added module without weakening external linkage or incremental
  session semantics.
- Make the development trade-off explicit and reproducible through `-O0`/`-O1`/`-O2`, with a
  low-latency optimized default.
- Measure JIT optimization/materialization cost separately from guest execution, so a faster
  workload cannot hide a slower development loop.
- Preserve compiler IR, bootstrap fixed points, stage dumps, stdout, and delivered AOT artifacts.

**Non-Goals:**

- Merging the module set, cross-module inlining, LTO, symbol internalization, or closed-world DCE.
- Changing the AOT or Chez-driver backends, the Scheme pass ladder, calling conventions, linkage,
  or runtime representation.
- Making the optimization profile mutable after a REPL session starts.
- Establishing a performance threshold in a timing-sensitive automated test; measurements are
  recorded evidence, while correctness and option behavior remain deterministic gates.

## Decisions

### D1 — Install one ORC IR transform; do not fork `add_ir`

After constructing either `LLJIT`, install the same transform on its IR transform layer before any
module is added.  For every `ThreadSafeModule`, the transform sets up the new-pass-manager analysis
managers and `PassBuilder`, runs the pipeline selected for the session, and returns the module or a
normal LLVM error.  `add_ir` remains the one parser/admission path, so baked cache hits, source
fallbacks, manifest libraries, run programs, and interactive forms cannot accidentally take
different optimization routes.

The transform layer is preferred to invoking a pass manager directly inside `add_ir`: it is the
ORC seam designed for a module transformation before compilation, keeps parsing separate from
backend policy, and naturally includes modules materialized through every current caller.  A
custom hand-picked list of inlining and simplification passes is rejected because it would create
a local optimizer policy to maintain across LLVM versions and would make `-O1`/`-O2` labels
misleading.

### D2 — Optimize per module with LLVM's standard O1/O2 pipelines

`-O1` maps to `PassBuilder`'s per-module default `OptimizationLevel::O1`; `-O2` maps to its O2
counterpart.  `-O0` installs an identity transform and otherwise follows the same ORC path, giving
the change a fair baseline without maintaining a second JIT setup.  Analysis managers are local to
the module transform and cross-registered in the standard new-pass-manager arrangement.

No module is merged with another.  This means the pipeline can inline and simplify within
`(emit internal)`, `(scheme base)`, a user library, a whole program, or one REPL form, but cannot
inline across their external declarations.  That is the safe and bounded first slice: P12's reader
classifier chain is within its defining unit, while cross-unit optimization would require a
different symbol and lifecycle design.

### D3 — O1 is the development default; O0 is the rollback lever

O1 is LLVM's size- and compile-time-conscious optimized profile and is the appropriate default for
an interactive compiler.  O2 remains opt-in for a longer-running JIT workload, and O0 reproduces
the old backend when diagnosing an optimizer interaction or comparing measurements.  The same
choice applies to every module in one invocation and is parsed before the JIT is constructed.

Only `run` and `repl` accept the three exact spellings.  Conflicting flags are errors rather than
last-one-wins because an accidental benchmark command must not silently measure a different
profile.  `build` and `lib` retain their existing profiles and option loops.  Help text is the
discoverable contract.

An alternative is an environment-only switch.  It is rejected because the profile materially
changes latency, needs to be visible in benchmark commands, and would be harder to discover and
narrate than an ordinary backend option.

### D4 — Backend optimization starts after every compiler-IR observation point

`emit run --emit` continues to stop before an LLJIT exists and writes byte-identical modular IR.
The Scheme `--dump` stages likewise remain upstream of LLVM.  `-O` with `--emit` or
`--resolve-program` is rejected because those modes do not execute a JIT; accepting it would either
silently ignore the request or turn the bootstrap's stable compiler artifact into a
backend-specific artifact.

The optimized LLVM module is not added to `--dump` in this change.  Retaining or serializing it
would create a new observation surface and overlaps issue #111's broader JIT introspection
question.  Verbose narration identifies the selected profile and reports aggregate transform time
on stderr; program data remains on stdout.

### D5 — External linkage is the open-world safety boundary

The standard per-module pipeline may remove internal implementation details, but definitions and
global slots emitted with external linkage must stay externally resolvable.  The design adds no
internalization pass, keep-list, whole-program assumption, or `GlobalDCE` setup.  Existing tests
for later references, captured old definitions, user-library imports, heap persistence, and error
recovery run at O1 and O2 as the proof that the pipeline respects this boundary.

This is preferred to a special reduced REPL pipeline.  A shared standard pipeline gives run and
repl the same backend policy; open-world soundness comes from module linkage, not from maintaining
two hand-curated pass lists.

### D6 — Measurement separates compiler, transform, materialization, and execution

Use a warm artifact cache and record at least these components where the door exposes them:

1. Scheme compile/cache time before LLJIT construction;
2. LLVM transform time accumulated by the transform callback;
3. remaining lookup/materialization time;
4. guest execution time; and
5. total wall clock observed by a user.

Run O0/O1/O2 interleaved, with multiple samples and the best or median stated explicitly, over:

- a trivial program/session to expose fixed and per-form latency;
- `tools/gen-reader-bench.ss`'s 200,000-token workload, which reproduces P12/P13;
- an existing call/arithmetic-heavy workload; and
- an existing allocation-heavy workload.

The measurements decide whether the expected benefit appeared, but do not silently change the
specified default.  If O1 fails to improve representative execution or imposes disproportionate
interactive latency, the planning artifacts are revised with the evidence before shipping a
different default.

### D7 — This is a host-only change and does not cross the regen barrier

The implementation belongs in `src/emit.cpp`, its host tests, and documentation.  No file in
`CORE_FLAT`, `src/repl-core.ss`, the baked prelude, or an entry Scheme source needs to change, so
`make regen` is neither required nor appropriate and `bootstrap/` must remain clean.  A plain
`make` relinks the host after the C++ edit.

## Risks / Trade-offs

- **O1 adds work to tiny programs and every REPL form** → keep O0 available, measure trivial and
  per-form latency separately, and choose O1 specifically rather than unconditionally using O2.
- **A standard pipeline exposes latent invalid IR or a runtime assumption that O0 tolerated** →
  run the complete run/REPL, trap, dynamic-extent, module, and backend-equivalence suites at the
  default; exercise O2 explicitly on the sharp incremental cases.
- **Optimization removes a symbol a later form needs** → prohibit internalization/closed-world
  passes and gate external references, imports, redefinition, and captured-old-definition cases at
  both optimized levels.
- **LLVM releases tune O1/O2 differently** → depend on the semantic profile contract rather than
  a fixed pass list; keep value tests authoritative and record the LLVM version with measurements.
- **Timing narration becomes noise or perturbs stdout** → aggregate timing at verbose verbosity on
  stderr under the existing output convention; do not emit a line per pass.
- **The P13 gain is smaller after recent cache and tree-shaking changes** → re-baseline current
  `main` before attributing a result; report execution and fixed startup independently.

## Migration Plan

There is no data or artifact migration.  Add the shared transform and option parser, run the
deterministic suites, then record interleaved O0/O1/O2 measurements before enabling O1 as the
default in the final patch.  `-O0` is the immediate operational rollback for users.  Code rollback
removes the transform installation and the two doors' new options; because emitted compiler IR is
unchanged, no cache format bump or bootstrap regeneration is involved.
