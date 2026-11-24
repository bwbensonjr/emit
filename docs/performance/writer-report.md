# Writer traversal investigation

## Claim, scope, and correctness

The 0.9.0 writer implementation added repeated traversal allocation to ordinary
compound printing. This investigation isolates that runtime cost from Scheme
adapter overhead and Malt tensor representation. Correctness uses independent
byte oracles in `test/performance/writer-bench.c`, the existing custom-writer
contract suite expanded to 84 assertions, real Scheme adapter fixtures, and
unchanged Malt numerical acceptance results.

The implementation reuses only the outermost traversal. It retains at most 4,096
graph slots (96 KiB on this arm64 layout), clears idle roots on return/unwind,
and keeps nested graph state independent. A bounded 8 KiB index array records
occupied outer slots, avoiding capacity-wide cleanup after small prints. Escapable callback tokens keep unique
identities and retire their object/destination links.

## Reproduction and provenance

Malt moved to the [emit-packages](https://github.com/bwbensonjr/emit-packages) collection after this
evidence was recorded. The builder now takes the Malt core and XOR fixtures from an explicit
local collection checkout selected with `EMIT_PACKAGES_DIR`, without fetching or an Emit-maintained
collection revision. A rebuild records
different fixture paths and hashes than the archived evidence; the XOR fixture's final output lines
also changed when it became a collection check.

From a checkout containing this change:

```sh
make emit
EMIT_PACKAGES_DIR=../emit-packages python3 tools/writer-performance-build.py --output build/writer-performance
bash test/performance-writer-tests.sh
python3 test/performance-runner-tests.py
```

The builder resolves the parent of `8c69a18` for the pre-writer runtime and
`8c69a18` for the released writer implementation. Each harness compiles its own
runtime layout. Actual Scheme program/library IR is emitted once through the
current Chez source driver and linked identically against released and candidate
runtime snapshots with the discovered LLVM clang at `-O2 -flto` and shared libgc.
Historical attribution uses only supported ordinary workloads; writer-only
calls are never linked against the pre-writer runtime.

Full revisions, runtime/fixture/binary hashes, compiler/libgc identities, dirty
runtime inputs, exact build argv, sample order, calibration, and raw observations
are retained with the evidence. This machine is macOS arm64 with LLVM 23.1.4 and
Boehm GC 8.2.12. The reported figures apply to this machine and these workloads.
The process and report template are linked from
[Performance evaluation](../PERFORMANCE-EVALUATION.md).

## Hypotheses and alternatives

| Candidate | Prediction | Decision evidence |
|---|---|---|
| Reuse outermost traversal/table | Removes two ordinary per-print allocations and repeated table growth | Allocation counters and generated-code branches; paired timing below |
| Clear only occupied slots | Avoids clearing a retained 96 KiB table after a four-pair print | Clear-all cleanup roughly doubled exploratory small-after-large CPU; final paired comparison below |
| Initialize cache lazily in zero-fill storage | Avoids a writable-data file page in minimal Mach-O executables | Initialized cache exceeded the size budget; lazy cache avoids the file page; final occupied-slot design adds 128 bytes to the minimal control |
| Cache four mode symbols | Removes repeated interning lookup during callbacks | Separate isolated candidate; comparison below |
| Pool nested traversal storage | Could reduce compound-child callback allocation | Assess against nested measurements and lifecycle/retention complexity before expanding |
| Reuse invocation tokens | Would reduce allocation | Rejected: escaped handles could become valid during a later callback |
| Emit fewer unused bridges | Could reduce build/JIT work | Deferred absent an attributed build/JIT cost; unoptimized IR presence is not execution cost |

## Mechanism and generated code

Ten warmed ordinary small-list writes request 20 printer allocations and 31,520
bytes in the released runtime: an 80-byte context plus a 3,072-byte initial table
per call on this layout. The candidate requests zero. Ten repeated 1,024-element
list prints request 70 allocations and 1,936,160 bytes before versus zero after.
Atomic printing requests zero in both. Instrumentation is confined to the test
translation unit; acceptance timing uses uninstrumented executables.

Same-options runtime-only optimized LLVM retains the released 80-byte and
3,072-byte allocations. Candidate IR branches on whether an outer context is
already active: the warmed outermost branch reuses storage, while nested
traversals retain allocation. Final AOT adapter disassembly retains that branch
and the Scheme adapter's recursive-renderer closure construction and indirect
callback dispatch. Emitted IR, optimized runtime IR, and final linked machine
code are distinct evidence layers; code shape alone does not establish speed.

The first cache initializer created a writable-data segment, increasing some
small executables by roughly 16 KiB. That candidate failed the predeclared 1 KiB
size budget and was corrected before final timing. Lazy initialization leaves
the cache in zero-fill storage. Minimal no-Malt executable size is 35,888 bytes
before and 36,016 after; seeded XOR is 174,704 versus 174,816 bytes. No Malt import
or compiler-input change is needed for traversal reuse.

Cleanup initially cleared the retained table's full capacity. Three exploratory
pairs (during concurrent validation, excluded from acceptance) measured released
small-after-large CPU at 0.064504, 0.073813, and 0.068809 seconds, versus 0.126763,
0.126832, and 0.127007 for clear-all reuse over 100,000 renders. The mechanism was
96 KiB of clearing per small print after a 1,024-element graph. The retained
candidate instead records occupied slot indices and clears those entries only.
The index array is 8 KiB and contains no Scheme pointers; maximum idle storage is
96 KiB retained heap table plus the 3 KiB initial table, 8 KiB indices, and context.
This is a bounded memory trade-off, distinct from executable file size.

## Acceptance evidence

Measured 2026-11-18. Each session uses ten alternating pairs, one process warm-up
per side, baseline calibration to at least 0.5 seconds, fixed within-pair work,
and independent byte validation. Session two reverses the starting side and
recalibrates. No builds or suites ran during these accepted samples. Raw samples
retain process timings/RSS as well as the separately reported C repeat-region
CPU/wall timings and collector counters. The actual Scheme and XOR rows use
process CPU, including startup. Negative changes below mean less CPU time.

| Workload | Session 1 CPU change | Session 2 CPU change |
|---|---:|---:|
| Small list, four pairs | -49.51% | -49.52% |
| Small vector | -51.37% | -52.54% |
| List, 1,024 elements | -22.57% | -21.60% |
| Small list after retained large table | -50.63% | -51.13% |
| Shared graph | -42.33% | -43.25% |
| Cyclic graph | -52.32% | -52.03% |
| Atomic number | -0.10% | -0.15% |
| Atomic string | -1.66% | -1.68% |
| Opaque record | -1.78% | -1.87% |
| Native callback, flat | -6.17% | -4.79% |
| Native callback, compound child | +0.24% | -0.09% |
| Native callback, eight levels | -0.32% | -0.52% |
| Actual Scheme adapter, flat | -3.95% | -4.48% |
| Actual Scheme adapter, three levels | +3.17% | +2.22% |
| Seeded XOR, 4,000 updates | +0.03% | +0.72% |

The primary clears the 5% target in both sessions. Atomic, callback, actual
Scheme, and XOR controls stay within the predeclared 5% regression limit. Nested
Scheme rendering is 2.22-3.17% slower, so this is not a claim that every custom
writer becomes faster. We retain the simpler independent nested traversal design
rather than add a depth pool without an application-driven benefit. The C nested
fixture still allocates 23 objects/1,584 requested bytes per render versus
24/1,664 before; immutable invocation tokens and borrowed ports remain necessary,
and the actual Scheme adapter separately allocates its recursive closure.

A runtime-only comparison against the pre-writer implementation measured +2.20%
CPU for small lists and +0.72% for large lists. Thus the final candidate recovers
nearly all observed ordinary traversal overhead while preserving the newer
callback, unwind, and root-retirement behavior. These are one-session historical
controls, not proof of identical costs across every platform or workload.

Mode-symbol caching was tested separately and rejected: clean flat callbacks
improved 4.19%, compound children slowed 3.25%, and eight-level nesting improved
4.72%. That mixed result did not justify extra state and per-invocation branching.
An earlier flat trial overlapped the final source test; it is preserved as excluded
contention evidence and was rerun after validation stopped. No timing gate was
weakened to accept the production change.

The fixed core control uses the same current 120-assertion fixture on both sides;
it is distinct from the earlier release's historical 95-assertion comparison.
Core assertions and executable sizes match their intended contracts. A separate
ten-pair comparison batches 300 fresh core processes per observation to meet the
0.5-second baseline target. Summed child CPU changes by
-0.03%, including child startup and excluding the
Python parent. This establishes no material timing change for the fixed core;
individual millisecond processes are not used for a throughput claim.

## Durable evidence and commands

[The evidence README](writer-evidence/README.md) describes lossless decoding of
[experiment metadata](writer-evidence/experiments.json) and
[raw samples](writer-evidence/samples.jsonl), including calibration/warm-up rows,
accepted runs, rejected alternatives, and explicit exclusions. It also retains
source-input hashes/patches, executable identities, allocation observations,
control outputs, and fresh emitted/optimized/final code excerpts. No temporary
executable is needed to reconstruct the comparison.

For an individual C comparison after running the builder:

```sh
python3 tools/performance-measure.py \
  --before build/writer-performance/bench-released \
  --after build/writer-performance/bench-candidate \
  --before-metadata build/writer-performance/released-metadata.json \
  --after-metadata build/writer-performance/candidate-metadata.json \
  --arg=--workload --arg=small-list \
  --arg=--iterations '--arg={iterations}' \
  --metric-field cpu_seconds \
  --oracle-field output_digest --oracle-field output_bytes \
  --fixture test/performance/writer-bench.c \
  --fixture src/runtime/runtime.c \
  --fixture build/writer-performance/source-inputs.json \
  --report build/writer-performance/repeated-small-list.json
```

Repeat with `--start after` for the second session. Replace the workload using
`--list` to obtain controls; shared-writing measurements add
`--arg=--mode --arg=shared`. Scheme controls use `scheme-repeat-released` and
`scheme-repeat-candidate`, their corresponding metadata, `--arg={iterations}`
and `--arg=flat` or `--arg=nested`, without the JSON metric/oracle options. XOR
uses `malt-xor-released`/`malt-xor-candidate` and no iteration argument. For the short
core executable, use the batch fixture (reported CPU sums child processes,
including their startup):

```sh
python3 tools/performance-measure.py \
  --before "$(command -v python3)" --after "$(command -v python3)" \
  --arg=test/performance/process-repeat.py \
  --before-arg=build/writer-performance/malt-core-released \
  --after-arg=build/writer-performance/malt-core-candidate \
  '--before-arg={iterations}' '--after-arg={iterations}' \
  --before-metadata build/writer-performance/malt-core-released-metadata.json \
  --after-metadata build/writer-performance/malt-core-candidate-metadata.json \
  --metric-field cpu_seconds --oracle-field output_digest --oracle-field output_bytes \
  --fixture test/performance/process-repeat.py \
  --fixture build/writer-performance/malt-core-released \
  --fixture build/writer-performance/malt-core-candidate \
  --iterations 100 --report build/writer-performance/core-batch.json
```


## Validation and limits

- Full native inventory: 68/68 passed on the first reuse implementation. After
  lazy initialization and occupied-slot cleanup, all five affected native writer,
  graph, trap, and port suites passed again on the final runtime.
- Source units: 16/16 passed. The final targeted reference/release invocation
  passed self-emission, dump parity, datum rendering, custom-writer source
  acceptance, version identity, and the measurement runner (6/6 suites).
- `make format-check`: 46 considered, zero changes. No hand-authored covered
  Scheme/compiler assembly input was edited; runtime C reaches binaries through
  ordinary rebuilding, not checkout regeneration.
- Writer contract fixture: 84 assertions across existing native profiles,
  artifacts, standalone, REPL, and source-driver paths. Resource fixture: 268
  output-oracle cases plus warm allocation, growth/oversize, idle-root,
  generation-state, callback collection, and unwind checks. Runner: 13 tests.
- Final source-consistency proof: passed after runtime/version edits
  (456.317 seconds), with proof inputs unchanged during the invocation.
  The comparison regenerated an isolated snapshot and matched all declared bootstrap modules.

The local regeneration hint reported a mismatch, so native reports are not used
as proof that changed compiler sources were regenerated. The isolated source
comparison and independent source/reference checks establish their own claims;
no compiler input changed and no checkout `make regen` was required.

Null-sink renderer CPU does not predict terminal/disk I/O speed, REPL compilation
latency, or complete application speedups. Collector totals are not retained
memory; peak RSS is not allocation volume. The 96 KiB table bound, 3 KiB static
table, 8 KiB occupied-index array, and stable context describe intentional idle
storage; callback tokens and nested tables are transient. We do not claim a
cross-platform timing improvement, a cure for the historical combined Malt
slowdown, or a global optimum for callback-heavy printing. Remaining Malt
traversal/representation work stays in P25.
