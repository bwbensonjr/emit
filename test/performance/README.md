# Writer performance fixtures

These fixtures distinguish runtime traversal cost from the Scheme callback ABI.
They are opt-in measurements, with deterministic output/resource checks suitable
for the ordinary test runner. No elapsed-time threshold is part of CI.

Run deterministic checks from the repository root:

```sh
bash test/performance-writer-tests.sh
```

The script discovers LLVM/libgc through `tools/llvm-env.sh`, compiles a production
and an instrumented executable, verifies every supported workload/mode against
an independent byte oracle on file and bounded string sinks, checks invalid CLI
inputs, and checks allocation, cleanup, capacity, and trap recovery invariants.
`EMIT_TEST_KEEP=1` preserves its diagnostics directory.

## Build an isolated runtime benchmark

To reconstruct the historical runtime snapshots, production and instrumented
harnesses, actual Scheme controls, provenance manifests, optimized runtime LLVM,
and final disassembly together, run:

```sh
EMIT_PACKAGES_DIR=../emit-packages python3 tools/writer-performance-build.py --output build/writer-performance
```

The Malt fixtures come from the explicit local `EMIT_PACKAGES_DIR` checkout. The
builder never fetches the collection and refuses full Scheme reconstruction when
the checkout or required fixtures are unavailable. This requires Chez for source-driver IR capture; `--skip-scheme` builds only the
runtime harness evidence. The builder uses the discovered LLVM clang consistently
for both runtime versions. It also constructs a separate mode-symbol-cache
experiment without editing the production runtime. Outputs use `bench-released`,
`bench-candidate`, and `bench-mode-cache`, with corresponding metadata files.
Run `build/emit` from a current native build for the minimal no-Malt size control.
The manual equivalent below is useful for a single runtime comparison; it names
its executables `released` and `candidate` rather than the builder's `bench-*`
outputs and leaves provenance recording to the caller.

```sh
. tools/llvm-env.sh
mkdir -p build/writer-performance
printf '%s\n' 'snapshot runtime at the released writer implementation' >&2
git show 8c69a18:src/runtime/runtime.c > build/writer-performance/runtime-released.c
printf '%s\n' 'snapshot runtime before custom writers' >&2
git show '8c69a18^:src/runtime/runtime.c' > build/writer-performance/runtime-pre.c
printf '%s\n' 'compile released runtime benchmark -> build/writer-performance/released' >&2
"$CC" -std=gnu11 -O2 -flto -I"$GC_INC" \
  -DEMIT_RUNTIME_SOURCE="\"$PWD/build/writer-performance/runtime-released.c\"" \
  test/performance/writer-bench.c -L"$GC_LIB" -lgc -lm \
  -o build/writer-performance/released
printf '%s\n' 'compile working runtime benchmark -> build/writer-performance/candidate' >&2
"$CC" -std=gnu11 -O2 -flto -I"$GC_INC" \
  test/performance/writer-bench.c -L"$GC_LIB" -lgc -lm \
  -o build/writer-performance/candidate
```

Record full revision ids, dirty inputs, hashes, compiler/libgc versions, and these
exact commands in the measurement manifest. `8c69a18` names the historical
implementation being attributed, not a general prescription for future work.
Compile the pre-writer snapshot using `-DEMIT_PRE_WRITER` as well as its absolute
`EMIT_RUNTIME_SOURCE`; that build intentionally omits writer-only workloads and
uses the old four-argument internal printer signature. Each snapshot compiles
its own runtime layouts; do not interchange record/port artifacts between them.

The harness includes the selected C runtime in its own translation unit. It
constructs values and calls the shared printer directly, isolating the runtime
mechanism from Scheme loop, adapter, compilation, and process startup costs. This
is a runtime fixture, not a replacement for delivered Scheme program evidence.

```sh
build/writer-performance/candidate --list
build/writer-performance/candidate --workload small-list --iterations 100000
build/writer-performance/candidate --workload custom-nested --iterations 100000 --sink string
build/writer-performance/candidate --workload shared --mode shared --verify
```

`--mode` accepts `ordinary`, `display`, `simple`, or `shared`. `--sink` accepts
`file` (a buffered `/dev/null` stream) or `string` (a reused buffer whose length
resets between renders, so accumulated output cannot dominate memory). The pure
pair-cycle/simple combination is rejected because simple writing may diverge.
All normal invocations first render and check independent expected bytes, then
warm the selected value eight times. Graph construction and sink opening precede
the timed region. `--verify` selects one timed render. `small-after-large` first
renders a 1,024-element in-bound graph, then measures small renders with its grown
capacity retained. The separate `oversized-list` fixture exceeds the retention
bound; resource checks cover its release and subsequent small printing.

JSON stdout contains in-process `cpu_seconds` and `wall_seconds`, the fixture
name/mode/sink, iterations, bytes per render, and an FNV-1a `output_digest` of the
verified render. FNV is an output oracle, not a provenance or security digest;
the measurement runner records SHA-256 for fixture/binary identity. The timed
file output is discarded; string output is checked again after the timed loop.
The runner should also record end-to-end process timing, separately labelled.

## Resource instrumentation

Add `-DEMIT_BENCH_INSTRUMENT` to a separate build to intercept only this test
translation unit's `GC_MALLOC` calls. The wrapper attributes printer allocations
by runtime caller (`print_*`, `pl_*`, and `writer_borrowed_port`); graph setup and
collector internal overhead are excluded. The wrapper does not instrument
`GC_MALLOC_ATOMIC` buffer storage. Timed counters are reset after setup and
warm-up. Collector allocated bytes and collection deltas are separately reported
and include unrelated allocation. Production builds have no wrapper or runtime
counter overhead; printer-specific fields are JSON null there. Never compare
instrumented timings against production timings.

The reconstruction tool builds the candidate with both
`-DEMIT_BENCH_INSTRUMENT -DEMIT_EXPECT_REUSE`. Run its resource checks with:

```sh
build/writer-performance/bench-candidate-instrumented --resource-check
```

Resource checks cover all modes for atom/opaque, fixed compound and larger
in-bound graphs, unrelated writers and registration removal; idle keys and
context links; oversized release; hostile prior generation state; collection
during callback rendering; trap/unwind cleanup; and subsequent printing. The
checks inspect runtime-private state deliberately, because allocation and root
retention are not exposed as Scheme APIs. They are separate from the existing
Scheme suite's callback, guard, continuation, borrowed-port, and cross-host
contracts.

The released runtime's small-list workload requests two printer allocations per
render (80-byte context plus 3,072-byte table on the inspected 64-bit layout).
Its atom-number workload requests none. Verify those observations on each target;
they are not a universal layout assumption or an elapsed-time claim.

## Actual Scheme adapter controls

`writer-adapter.scm` asserts explicit string-port output and returns flat/nested
custom records for automatic borrowed-port rendering. Expected final output is:

```text
(adapter <(1 2 3 4)> <<42>>)
```

`writer-repeat.scm` constructs its graph before the loop, verifies one render,
then writes the selected value repeatedly to a fixed `/dev/null` output port.
Build it with the same source/IR and runtime options for both sides:

```sh
build/emit build -L lib test/performance/writer-repeat.scm -o /tmp/writer-repeat
/tmp/writer-repeat 100000 flat
/tmp/writer-repeat 100000 nested
```

Both print `writer-repeat-complete`. Timing this executable includes startup,
construction, validation, and sink setup; the calibrated repeat loop should
amortize those costs. It exercises the real generated C-to-Scheme bridge,
adapter closure, user callback, and recursive renderer. Do not label it as an
in-process timed region; use the C harness for that separately isolated metric.


## Batch a short acceptance control

The Malt core acceptance executable is too short for a single-process timing
comparison. `process-repeat.py PROGRAM N` runs it in N fresh processes, verifies
stable stdout within the batch, and reports summed child CPU plus batch wall
time. Child CPU includes startup and excludes the Python parent; it is not an
in-process renderer measurement. The ordinary measurement runner can calibrate
`N` using `{iterations}` and compare `output_digest`/`output_bytes`. Pass each
control executable and the wrapper as `--fixture` inputs so their hashes remain
part of the report. The fixture's own numerical assertions remain the oracle.
