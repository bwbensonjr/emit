# Validation Baseline and Comparison Procedure

## Recorded pre-change evidence

The current checked-in reference is commit `a6238520b38551b1042e9f35a5768e0bcdd29d36`. The recorded native run used LLVM 23.1.2, libgc 8.2.12, and no Chez. It completed all 53 `run-all-tests.sh` suites in **2466 seconds (41:06)** with zero failures. The per-suite log shows that the slowest recurring work is concentrated in R7RS sections, library partition, upstream SRFIs, import sets, installation, and binding contexts. The source design notes also record three direct Chez unit suites at 0.12, 0.18, and 0.22 seconds; those are distinct from native integration cost.

The archived full-run log at `/private/tmp/emit-release-foundations-native-chez-free.log` is useful supporting detail, but its host model, cache state, queue time, and provisioning time are not preserved. Do not infer those values. The release workflow run [39152320199](https://github.com/bwbensonjr/emit/actions/runs/39152320199) is historical CI evidence: 144 minutes elapsed, 755 aggregate compatibility-provisioning minutes, and 277 aggregate native build/test minutes. These totals overlap across jobs and are not local test-execution comparisons.

The baseline registry in [tools/test-registry.json](../tools/test-registry.json) maps the exact 53 native suites and 41 developer-runner labels. This makes the assertion inventory inspectable independently from any faster profile selection.

## Reproduce a local baseline

The stdlib-only harness [tools/test-baseline.py](../tools/test-baseline.py)
(Python 3.12 or later for safe archive extraction) snapshots tracked source into
a temporary Git checkout, records the commit, platform, toolchain and environment,
and emits JSON. It does not write into the checkout. Its default mode records
metadata without starting a test suite:

```sh
python3 tools/test-baseline.py --output /tmp/emit-validation-metadata.json
```

To capture the complete native baseline, run it on a quiet machine with the intended LLVM and libgc already provisioned:

```sh
LLVM_CONFIG=/path/to/llvm-config \
CC=/path/to/clang CXX=/path/to/clang++ GC_PREFIX=/path/to/gc \
python3 tools/test-baseline.py --full-native --output /tmp/emit-validation-full.json
```

The harness reports the isolated snapshot build and test durations separately. Local queue and dependency provisioning are reported as unavailable (`null`): they do not occur inside this local invocation. Record CI queue and provisioning measurements from workflow timestamps and provisioning logs as separate fields. Without `--trace-compilers`, compiler process counts are unavailable; a make invocation is not a compiler invocation. Preserve the raw report and logs with each measurement set.

The harness can also run selected native registry suites serially against the
same disposable snapshot, after one native `make all`. Repeat `--suite ID` to
select multiple suites; Chez-dependent entries and unknown IDs are rejected,
and `--suite` cannot be combined with `--full-native`. For example:

```sh
python3 tools/test-baseline.py --revision a6238520b38551b1042e9f35a5768e0bcdd29d36 \
  --suite r7rs-sections --suite library-partition \
  --output /tmp/emit-validation-selected.json
```

Add `--trace-compilers` to wrap CC, CXX, and make with the existing transparent
telemetry proxies. The report includes separate build and per-suite raw counts,
retained JSONL trace paths, and the exact observed `-c src/emit.cpp` compiler
commands when present. These are external tool invocations only: they do not
count in-process Emit/LLVM compilation, and no rebuild count is inferred from
make calls. Test and trace logs live under the reported private `logs.root`
outside the automatically removed source snapshot. Snapshot Git and suite
processes have ambient `GIT_*` variables stripped to prevent inherited
repository/index overrides from redirecting operations into the developer
checkout.

Use `--working-tree` only when the exact tracked working-tree bytes are the target under study. The snapshot still excludes untracked files and remains disposable. Default `HEAD` mode is the repeatable pre-change baseline. Neither mode calls `make regen`; native validation consumes the committed bootstrap IR.

Use `--revision a6238520b38551b1042e9f35a5768e0bcdd29d36` to retain the
pre-change runner after this change lands. `--scenario compiler|runtime|host|documentation`
applies a recorded harmless comment/prose fixture only inside the snapshot and
reports its exact command without executing it. Add `--run-scenario --samples 3`
to measure it. Modern compiler fixtures select direct current-source units;
other modern fixtures use changed-category development feedback. Legacy
snapshots retain the old full-native entry point. A comment fixture measures
selection/rebuild overhead, not a semantic compiler change or its correctness.
Do not accidentally request three complete legacy runs when only a plan is
needed; the two paired full baseline samples provide the equal-coverage record.

## Edit fixtures and before/after protocol

For each fixture below, save the exact diff, classifier plan, selected suite IDs, toolchain identity, cache state, build duration, and test duration. Use the same host and toolchain for paired before/after runs. Take at least three samples for short selections and two complete samples for full native coverage; report median and range. Report equal-coverage execution separately from a reduced test selection.

| Fixture | Representative edit | Expected obligation to measure |
| --- | --- | --- |
| Compiler pass | Change one file under `src/passes/` in an isolated copy | Current-source `units`, then source consistency and the relevant native/reference checks; native-on-committed-IR alone is not proof of the edit |
| Runtime C | Change one runtime primitive in `src/runtime/runtime.c` | Focused runtime regression plus native full profile when measuring equal coverage |
| Native host C++ | Change `src/emit.cpp` | Focused host/CLI/build checks and the planned full/compat native cells |
| Prose documentation | Change a non-executable Markdown page | Documentation policy only; no LLVM provisioning or compiler build |

Record four durations independently: CI queue, dependency provisioning, project build, and test execution. For local runs, queue and provisioning are not applicable and must remain distinct from the measured test duration. Record compiler invocation and rebuild counts only when observable from logs or an instrumented wrapper; use `null` plus an explanation otherwise. Include warm and cold toolchain/cache state rather than averaging them together.

The maintained comparison is complete only when every fixture has a before and after plan, all required coverage groups are mapped, and results show both the focused-feedback change and the same-coverage full-suite change. Moving an assertion to a less frequent trigger is a coverage-frequency change, not an execution-speedup.
