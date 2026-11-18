# Tasks

## 1. Generic writer registration and callback ABI

- [x] 1.1 Extend record descriptors with optional writer state and add checked registration primitives plus the originating-unit ccc bridge in all compiler hosts; verify source-level fixtures for captured closures, invalid registration, replacement/removal, default opaque output, and unchanged record equality.
- [x] 1.2 Add optional `(emit write)` with `set-record-type-writer!` and the `(object port mode recur)` adapter; update library manifests, installed/source payload checks, primitive inventories, and ABI/cache invalidation as needed; verify export resolution and independent library compilation without Malt.
- [x] 1.3 Document the exemplar registration API, mode symbols, callback lifetime, and default behavior with a runnable custom-record example; verify the example through current-source compilation and retain its expected output as a fixture.

## 2. Shared rendering, graph boundaries, and recovery

- [x] 2.1 Replace global graph-label state with scoped traversal contexts and preserve the ordinary pair/vector algorithms; verify existing write/readback fixtures remain byte-compatible, including acyclic sharing, pair/vector cycles, and write-simple/shared distinctions.
- [x] 2.2 Dispatch registered writers recursively, supply valid output ports and lifetime-checked child renderers, and implement active-record cycle boundaries; verify all four modes, string/file/default destinations, nested custom objects, self/mutual cycles, callbacks invoked only during rendering, borrowed-port close/expiry protection, and expired inner child-renderer rejection while an outer callback is still active.
- [x] 2.3 Integrate printer checkpoints with Scheme exceptions, native traps, and supported nonlocal exits; guard automatic printing in REPL, run, bootstrap runner, and standalone hosts; verify nested same/different-port output, clean state after each failure/escape, and a successful REPL form after a failing result writer.
- [x] 2.4 Document graph-boundary/readability limitations and partial-output behavior; verify generic fixtures exercise custom records inside cyclic/shared built-in graphs and leave unrelated ordinary vectors and records unchanged.
- [x] 2.5 Add generic custom-writer suites to native and classified reference coverage; verify registered closures work across full-library artifacts, cached native objects, later JIT forms, and standalone output under supported optimization profiles.

## 3. Malt objects and automatic formatting

- [x] 3.1 Replace sentinel dual vectors with private dual records while preserving primal/backprop APIs and identity accumulation; verify existing analytic, shared-node, equal-value, repeated-gradient, and nested-gradient fixtures through current-source compilation.
- [x] 3.2 Introduce vector-backed tensor-axis records and migrate constructors, indexing, shape, rank descent, reshape, and numerical operations; add shallow `tensor->vector` to the facade and export inventories; verify raw-vector interoperability, checked construction, shallow copies, row-major order, and dual identity through reshape.
- [x] 3.3 Migrate `map*`, accumulation, recording, diagnostics, and training traversal to the tensor abstraction; verify mixed list/vector/tensor fixtures preserve container kinds and mathematical results, with raw-vector gradient results preserved as the specified exception to object-producing operations.
- [x] 3.4 Add an acyclic shared formatting-state module and register tensor/dual writers; keep diagnostics using the same print-limit parameter location; verify exact outputs `6`, `(tensor 3 6 9)`, nested tensors/duals in ordinary vectors, per-axis truncation, zero/unlimited limits, and unchanged gradients before and after printing.
- [x] 3.5 Update Malt core/training/install/XOR tests, reference adapters, export metadata, provenance, demos, and user documentation for object representation, identity equality, conversion, and automatic printing; verify explicit diagnostics still work and preserve independent reference numerical expectations.

## 4. Compiler barrier and integration acceptance

- [x] 4.1 Finish all compiler-source/partition/assembly edits, run current-source units and applicable reference fixtures, and run `make format`; verify covered source formatting before crossing regeneration and avoid further compiler-input edits until validation finishes.
- [x] 4.2 Run explicit `make regen`, full native regression (`bash tools/test.sh full`), source units, classified targeted reference suites, and `bash tools/test.sh source`; preserve suite reports and verify every declared bootstrap module matches current source. If inputs change, repeat the barrier and affected validation.
- [x] 4.3 Run Malt core, training, install, and XOR acceptance across REPL, run, standalone, and their source-driven/reference profiles, including full artifact reuse; verify exact completion counts, expected presentation, derivative checks, seeded training results, and source-free standalone execution.
- [x] 4.4 Measure Malt core/XOR runtime and standalone size against the pre-change baseline, record measurements, and document material performance debt under project policy; verify programs without Malt retain an optional Malt dependency closure.
- [x] 4.5 Bump `VERSION` once at the minor level and add a matching nonempty changelog section for the implementation PR; verify version/changelog consistency and the classified CI/release preflight gates.

## Workflow follow-up

- Use `emit-finish-change` after implementation acceptance to sync specs semantically, archive this change into the same reviewable PR, and run release-handoff preflight/PR preparation. Preparing the PR does not merge it.
