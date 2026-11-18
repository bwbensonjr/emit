# Design

## Context

See proposal.md for the problem and capability scope. The current implementation has useful shared boundaries:

- `src/runtime/runtime.c` routes textual output through `print_val` / `print_node`; records have identity descriptors and default opaque output. Pair/vector discovery and labels currently live in process-global `pl_*` state.
- `src/emit.cpp` calls `rt_write` for both run results and REPL results. REPL result printing currently occurs after `execute_thunk` has restored its trap boundary. `src/run-boot.cpp` and the runtime standalone entry point also print final results.
- `src/parse.ss` lowers `define-record-type` to hidden type descriptors. Scheme callbacks use the compiler's fastcc closure ABI and module-specific register budget; a C function cannot simply call their code addresses. `src/emit.ss` already emits ccc bridges such as `__apply0` for runtime callbacks.
- Malt duals are sentinel vectors; tensors are ordinary nested vectors. `tref`, `tlen`, `tmap`, shape traversal, `map*`, accumulation, recording, and diagnostics currently assume these representations. Core, training, install, reference, and XOR tests exercise those assumptions.
- The existing Malt spec deliberately requires explicit diagnostics without printer hooks. This change intentionally supersedes that adaptation and the vector-only representation contract.

## Goals / Non-Goals

Goals are library-owned printing, readable interactive numerical results, unchanged ordinary-vector output, and identical REPL-to-executable behavior. Keep Malt optional and avoid Malt tags or names in the native runtime.

Non-goals are Racket's full printing/property system, pretty-print layout, custom readers, structural record equality, or readable reconstruction and sharing preservation through arbitrary custom representations. No differentiation algorithm or optimizer formula changes are intended.

## Decisions

### 1. Register a writer on an existing record type

Provide `(emit write)` with `(set-record-type-writer! exemplar writer-or-false)`. A library supplies one instance of its own type; the runtime obtains its descriptor. This affects every instance of that descriptor, including old instances. Return the unspecified value. Validate arguments before mutation. `#f` clears the writer.

The exemplar avoids changing the R7RS `define-record-type` grammar, exposing hidden descriptor bindings, or maintaining a global predicate registry. It is an explicit capability: code holding an instance can change that type's writer, just as other mutable operations require access to their objects. This is not a security boundary. Merely importing the extension has no output effects.

Extend descriptors with the installed closure and the originating unit's callback bridge. Preserve type identity and default output. No closure is called during equality. Register library writers once during their ordinary initializer; closures capture private accessors and parameter objects normally. No per-instance native lookup table is needed.

### 2. A port-aware callback with explicit recursive rendering

The signature is `(writer object port mode recur)`. Modes are the symbols `write`, `display`, `write-simple`, and `write-shared`; automatic final-value printing uses `write`. Return values are ignored. Writers emit literal delimiters with the ordinary port procedures and call `(recur child)` for children.

The runtime supplies the destination as a Scheme output port. Preserve explicit destination identity where it is already a Scheme port; native stdout/stderr result paths need a borrowed port wrapper referring to the existing sink, without closing or transferring ownership. A borrowed wrapper is valid only during that callback; closing it raises a catchable error, and use after return raises an expired-port error. Explicit Scheme ports retain their ordinary ownership and lifetime. Avoid temporarily changing `current-output-port`. String ports stay backed by their existing runtime sinks.

Implement Scheme-to-C registration and C-to-Scheme dispatch using a generated ccc bridge that knows the registering unit's closure ABI and register budget. Model its symbol ownership and separate-compilation handling on existing bridges, rather than casting fastcc code to a C pointer. A Scheme adapter builds `recur` around an opaque runtime context token; that token checks its active lifetime before rendering. Invalidate each callback's token immediately when that callback returns, even while an outer callback is active. A saved callback cannot dereference an expired stack frame. Trace closure, token, and port references correctly for GC. All compiler hosts and artifact formats must agree on the primitive and bridge ABI; cache keys must invalidate incompatible old objects.

An alternative callback returning a printable datum would simplify callbacks but cannot emit arbitrary delimiters without imposing a separate document format. A direct port callback with an explicit child renderer provides the needed generality.

### 3. Reentrant contexts and explicit graph boundaries

Replace global graph state with a stack of per-traversal contexts carrying sink, mode, label table, and lifecycle. Ordinary pair/vector discovery stays purely structural and treats custom records as leaves. Never invoke user writers in discovery: callbacks can have effects, and calling them twice is observable.

`recur` renders a child with the active mode/destination and a nested traversal context for that child's ordinary graph. Maintain a dynamically scoped set of active custom record identities across nested traversals and direct print calls, including calls targeting other ports. Reentry emits `#<cycle TYPE>` without another callback. This bounds recursion through records, including pair-to-record-to-pair cycles. Acyclic repeats render normally. `write-simple` retains its existing permission to diverge on ordinary pair/vector cycles; custom-record reentry still uses the marker.

A custom representation is an opaque presentation boundary. Labels remain correct for ordinary graphs within a traversal; identity and readable reconstruction are not promised across callback boundaries. Independent traversals can reuse label numbers, so custom output is not promised to be a single readable labeled datum. This limitation is explicit in the write-library delta. A full user-supplied graph enumeration or document-tree protocol would be substantially larger and is not necessary for tensor presentation.

Nested explicit printing receives independent graph state and restores the outer traversal exactly. Ordinary byte-for-byte output and readback tests on graphs without custom records remain acceptance gates.

### 4. Guard callbacks and restore state on every supported exit

Use lifetime-managed contexts with runtime checkpoints integrated into exception, trap, and supported continuation unwinding. Restoration invalidates outstanding context tokens and releases active-record entries even when a C frame is bypassed. Do not rely only on C stack destructors across longjmp.

Keep automatic printing inside a valid host error boundary, including the REPL's print phase, run, bootstrap runner, and standalone entry point. Writer failures follow existing diagnostic channels; the next REPL form remains usable. Explicit printing propagates Scheme errors to guards. Partial output is retained. Tests must exercise both Scheme raises and native traps, not only successful callbacks.

### 5. Use distinct records for tensor axes and scalar duals

Replace the dual sentinel vector with a private record containing primal and backward closure fields. Its custom writer recursively prints only the primal value. Preserve the identity-based gradient table behavior.

Represent each constructed nonscalar tensor axis as a private record containing a vector of children. Children are scalars, tensor axes, or accepted raw-vector subtrees. `tref` and `tlen` accept both representations; `tmap` and nonscalar tensor constructors/operations return tensor objects. `tensor?` keeps accepting scalars and raw vectors for compatibility. `list->tensor` stays shallow, including ordinary-list children; shape validation still rejects invalid tensor leaves when requested.

Add facade export `tensor->vector` for a fresh shallow vector copy, retaining child/dual identities without exposing the backing vector. Mutation through general vector procedures and structural `equal?` on constructed tensors are intentionally incompatible; document `tref`/`tlen`/`tmap`, conversion, and `check-dual-equal?` as the supported alternatives. Empty shape still returns a scalar. Preserve leaf identity through reshape.

Audit direct vector operations in `autodiff.sld`, `diagnostics.sld`, `recording.sld`, and all other Malt libraries. `map*` preserves raw-vector, list, and tensor-object containers; gradients preserve their input container kinds. This is an explicit exception to the rule that tensor-producing numerical operations return objects. Recording produces primal copies of the same container kinds.

An alternative marker vector would still be caught by ordinary vector printing and require predicate interception for all vectors. A single wrapper around only outer tensors would leave row results as ordinary vectors; axis objects make nested and indexed results consistent.

### 6. Share tensor formatting without introducing an import cycle

The tensor writer emits `(tensor ...)`, renders children through `recur`, and reads the existing shared `max-tensor-print-length` parameter: initial value five, zero unlimited, positive values truncate each tensor axis using `...`. The dual writer never shows marker or callback fields. Both write and display use tensor syntax, with leaf rendering following the active mode.

Move shared print-limit state to a small private Malt formatting module imported by tensors and diagnostics, or an equivalent acyclic leaf module; diagnostics re-exports the same parameter location. Do not make tensors depend on diagnostics or autodiff. Keep `make-printable` and `trace-print`, updated to traverse both object tensors and raw vectors. Formatting must not construct new duals or modify gradient edges. Ordinary vectors containing duals still use `#(...)`, while nested dual leaves print as numbers.

## Risks / Trade-offs

- Calling Scheme from C can break module ABI assumptions. Mitigate with generated per-unit bridges, a native artifact ABI invalidation, and separate-library/cached-object tests under multiple optimization profiles.
- Printer recursion can corrupt labels or leave stale state after errors. Mitigate with explicit contexts and checkpoint restoration plus nested-port, cycle, guard, trap, and supported-escape tests.
- Tensor records change vector mutation and equality behavior. Preserve raw-vector inputs, provide shallow conversion, update documented APIs and fixtures, and use a minor release.
- Extra axis records and callback crossings can affect allocation and throughput. Measure core/XOR execution and standalone size against a baseline, report the results, and record material performance debt under the project's performance policy.
- Custom text need not be readable. Limit graph/readback guarantees to ordinary readable data within traversal boundaries and test that existing built-in behavior stays unchanged.

## Migration Plan

1. Land callback plumbing and context safety with generic custom-record fixtures before migrating Malt.
2. Migrate all Malt traversal and construction together; update exports, provenance/adaptation metadata, examples, and expected outputs. Preserve independent mathematical reference answers rather than regenerating numerical expectations from Emit.
3. Complete compiler edits, format, then cross the explicit regeneration barrier. Run current-source and native validation appropriate to all changed inputs.
4. Include one minor version bump and matching changelog section in the eventual implementation PR; planning alone has no bump. Finish the completed implementation through `emit-finish-change` for semantic spec sync, archive, and a reviewable PR.

Rollback before release reverts implementation and generated artifacts together. Once published, removing the public facility or tensor representation requires an explicit compatibility decision; old cached objects must never be silently reused with a changed runtime ABI.
