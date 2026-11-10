# Design

## Context

See proposal.md for scope and the issue comparison. R7RS section 6.14 specifies sequential source evaluation, default interaction scope, unchanged current ports, and an unspecified return value. Emit currently has no `(scheme eval)` or environment constructors. `compile-one-form` in `src/repl-core.ss` already maintains incremental definitions and compiler-error snapshots; the host's `process_form`, `handle_form_result`, and `run_thunk` currently combine evaluation, result printing, and locally handled failures. They cannot directly implement a nested, catchable procedure call.

`emit run` compiles a whole program whose top-level definitions become lexical bindings; treating that as an interaction scope would require a different compilation model. The runtime request channel stores compiler session state in GC roots. The primitive, prelude partition, and bootstrap assembly inventories are centralized in the source files and `tools/compiler-inputs.sh`.

## Goals / Non-Goals

Goals: reuse the shared compiler and resolver, make runtime loads composable with Scheme calls and guards, preserve small AOT output, and amortize regeneration and host regression coverage for #177 and #176.

Non-goals: general `eval`, environment constructors, interactive library declaration/reloading (#49), automatic visibility of loaded bindings in already compiled caller code, and runtime compilation in standalone binaries. The latter is an explicit dev-to-ship limitation for this release. Statically shipped code should use modules or includes.

## Decisions

1. **Runtime procedure with a host callback.** Provide `load` through the declared `(scheme load)` partition and a private primitive backed by a runtime callback defaulting to an unsupported-host error. Install the callback only in compiler-bearing execution hosts. Keep tag checks and Scheme error construction in the runtime/prelude boundary. Reject a special-form implementation: aliases and computed filenames must work. Reject subprocess execution: it loses shared heap, bindings, and errors. Reject compiler linkage into all executables because of binary size and complexity.

2. **One interaction scope per execution host.** REPL loads use its existing session. For `emit run`, lazily initialize a separate incremental session seeded with the standard library and using the same resolver and JIT, with explicit imports in loaded files. Use a unique symbol prefix/counter range for this session so its entry thunks, global slots, and lambda labels cannot collide with batch program symbols. Preserve batch program compilation and already admitted library identities/initialization records; session initialization must not reset those records or initialize them twice. Caller lexical bindings are inaccessible. The optional environment argument remains explicitly unsupported rather than inventing an environment API as a prerequisite.

3. **Separate execution policy from host display.** Refactor form processing into an internal result/error interface with policies for result echo and failure propagation. The prompt adapter preserves existing output and recovery; the loader suppresses echoes and returns failures to its Scheme caller. Import resolution, queued includes, initialization, and spliced forms must use the same failure policy rather than swallowing errors. Do not route load through the existing void helpers unchanged.

4. **Incremental reading and a stack of load contexts.** Open a dedicated source port, read one datum, compile and execute it, then read the next; parsing the entire file first would violate partial-progress semantics. Preserve filename origins for includes and diagnostics. Relative nested loads resolve beside the active file; outer calls resolve against the working directory. Save and restore reader state, source origin, pending splice queue, request-channel input/mode, runtime trap/raiser state, and host callback context around nested calls. Do not restore away successful nested definitions or roll counters backward. Keep active values rooted across nested compilation/GC. Reject process `chdir` and global stdin substitution.

5. **Errors cross the boundary as values before raising.** The host returns a structured failure after closing loader resources and restoring host state; the Scheme wrapper then raises in the caller's handler chain. Preserve original runtime exception objects where possible and attach filename context to loader/compiler failures. Audit existing setjmp/longjmp paths: never jump across live C++ objects requiring destruction. Earlier successful forms remain committed, matching existing incremental behavior. A failed compile restores its snapshot; runtime side effects are not transactional. Nested failure must restore the outer trap and guard chain rather than clearing them with the current top-level helpers.

6. **Quiet execution is command-local.** Keep the parsed verbosity setting intact and add an execution narration policy for ordinary `emit run`, applied before resolution and compilation, including callbacks. Default execution routes informational messages to verbose-only output; errors and explicit dumps bypass suppression. Do not mutate `EMIT_VERBOSITY` or globally silence `say`, since build/lib/repl still follow their contracts. Update `docs/OUTPUT.md` and the three affected observability requirements together. Preserve final-value echo and emitted-IR behavior.

7. **Escape-safe execution boundary.** The Scheme loader owns its read/evaluate loop, file port, and nested context under `dynamic-wind`. The C++ callback only compiles and admits code, returning native entry handles; it never executes loaded guest code or library initializers. A small C runtime primitive invokes those entries after C++ has returned. Escape continuations therefore cross only C/Scheme frames, and Scheme unwind thunks close ports and restore loader state. Import initialization and merge are separate steps so escaping initializers do not publish exports. This decision supersedes any earlier suggestion of executing guest code inside the C++ callback.

## Risks / Trade-offs

- Nested compiler calls can corrupt session/channel state or JIT names. Mitigation: stack contexts, monotonic unique names, recursive-load tests, failure followed by continued outer execution, and forced-GC coverage.
- Runtime loading in `emit run` is larger work than the REPL callback because batch bindings are lexical. Mitigation: explicitly separate the interaction scope; test cross-load persistence and lack of accidental caller capture.
- Unsupported AOT loading limits fidelity. Mitigation: export a linkable procedure with a catchable diagnostic and document the restriction prominently. Optional compiler-bearing standalone delivery requires a separate design.
- Adding `load` does not complete R7RS conformance. Mitigation: correct library placement and explicit one-argument/host restrictions; keep #33 open.
- Broad narration suppression can hide diagnostics. Mitigation: test stdout, stderr, and status separately at unset/quiet/verbose levels, with cold and warm caches.

## Migration Plan

Land implementation and fixtures before one explicit regeneration barrier. Update generated library partitions through their generator. Apply one minor VERSION bump and matching changelog section in the implementation PR. Preserve bootstrap/source consistency and native acceptance reports. Rollback removes the new surface and host callback together; no persistent data migration is involved.
