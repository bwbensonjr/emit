# Writer measurement evidence

This directory retains the raw reports and code evidence used by the
[writer investigation](../writer-report.md). It preserves 38 report JSON objects
and every field in their 930 samples, including calibration, warm-up, stderr,
output digests, process and in-process metrics, collector counters, and sample
order. It contains no executable or full generated module.

## Decode and verify

From the repository root:

```sh
python3 docs/performance/writer-evidence/decode.py
python3 docs/performance/writer-evidence/decode.py --output /tmp/writer-decoded
```

The decoder verifies the canonical SHA-256 of every reconstructed JSON object.
When the original build reports are still available, also compare every restored
object and original file byte hash:

```sh
python3 docs/performance/writer-evidence/decode.py \
  --verify-source build/writer-performance
```

JSON objects are losslessly reconstructed; original whitespace and key ordering
are not part of that guarantee. Original file hashes and byte sizes remain in the
manifest. Historical absolute paths identify captured inputs, not paths required
to decode this archive.

## Archive schema

`experiments.json` schema version 1 contains:

- `commands`: content-addressed argument arrays, shared by samples and build metadata.
- `provenance`: content-addressed per-side executable/build provenance. Each nested
  `build_commands` entry is a `command_id` reference to `commands`.
- `experiments`: each original filename, classification, limitations, original
  byte/canonical hashes, sample range, per-side provenance references, and every
  remaining top-level report field, including settings and summary statistics.

`samples.jsonl` contains one object per original sample, in manifest experiment
order and original sample order. Its `experiment` and zero-based `index` identify
the sample. `sample` retains its original fields, replacing only the `command`
array with `command_id`. The decoder restores commands and provenance, inserts
the samples, and checks the canonical hash. No measurements are rounded or
recalculated during packing.

The 30 `session-*` experiments are the final two sessions of 12 runtime controls,
two actual Scheme adapter controls, and seeded XOR. The additional `core-batch.json` application control sums short core child-process
CPU, including their startup/output and excluding the Python wrapper's CPU.
The two `historical-*`
experiments compare ordinary workloads with the pre-writer runtime. The three
mode-cache experiments evaluate a separate candidate. The extra flat mode-cache
run marked `excluded-contention` is retained but excluded from decisions because
validation overlapped it. `cleanup-exploration.json` is exploratory evidence with
its original contention limitation; it is not acceptance timing.

`source-inputs.json`, `source-inputs.patch`, and `candidate-runtime.patch` preserve
the source context and uncommitted source delta. `artifact-identities.json`
records the current source/fixture/tool hashes used for this investigation.
`allocation-evidence.json` and `control-outputs.json` retain separate deterministic
resource and numerical-output observations from the final binaries.

`code-evidence.json` retains hashes and exact line-numbered function excerpts from
the final runtime-only optimized LLVM, actual Scheme adapter emitted LLVM, and
final AOT adapter disassembly. The candidate excerpts include occupied-slot
cleanup tracking. Runtime-only optimized IR is labelled separately from final
linked code; code shape does not establish the timing benefit.

Rebuild the full code artifacts and executable inputs with
`python3 tools/writer-performance-build.py --output build/writer-performance`.
The [fixture README](../../../test/performance/README.md) and shared
[evaluation process](../../PERFORMANCE-EVALUATION.md) describe workload, sink,
instrumentation, metadata, and paired-run commands. Fresh timings will naturally
differ; decoding this archive verifies the captured data rather than rerunning it.
