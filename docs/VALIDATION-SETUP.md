# Validation setup measurements

## R7RS range assembly

`bash test/r7rs-suite-tests.sh --measure-assembly` measures only construction of
the 21 native R7RS section programs. It makes three timed old-assembler samples
and three timed one-AWK-assembler samples, then byte-compares all 21 corresponding
programs after each pair. The JSON is written to stdout. This mode bypasses
`make emit`; it does not invoke Emit, clang, LLVM, or the test programs. The
measurement is reproducible on the current machine with Bash, awk, sed, cmp, and
Python 3 available.

Measured on 2026-10-18:

| Assembler | Sample 1 | Sample 2 | Sample 3 | Median |
| --- | ---: | ---: | ---: | ---: |
| Previous per-range `sed` | 2.110 s | 2.087 s | 2.019 s | 2.087 s |
| One-pass AWK slicing | 0.256 s | 0.242 s | 0.254 s | 0.254 s |

Each sample compared all 21 section programs byte-for-byte. For the default
`--sections-only` native run, source manifests contain 1,180 form ranges, of
which 189 are excluded and 991 are materialized. The old assembler starts 991
`sed` slicing processes; the new assembler starts 21 AWK slicing processes.
The range-selection AWK processes remain in both implementations and are not
included in that comparison. This is setup-only evidence, not a full-suite or
Emit runtime speedup claim. The optional stale-exclusion pass still runs one
Emit probe per excluded form; it is deliberately not timed here.

## Six dominant native suites: static invocation census

These are source-derived invocation structures, not measured process traces.
Compiler invocations, native rebuilds, cache misses, and wall times must be
measured by running the suites; they are not inferred from shell call sites.

| Suite | Static setup / invocation structure | Why stateful checks stay separate |
| --- | --- | --- |
| `r7rs-suite-tests.sh` | 21 section assemblies and 21 native section runs in the standard `--sections-only` path. Assembly slicing falls from 991 `sed` processes to 21 AWK processes; the 21 range-selection AWKs remain. Optional stale checking adds 189 excluded-form probes and is outside the default path. | Each section is a distinct compiled program. Excluded forms are negative/staleness probes and must not be combined with accepted forms. |
| `library-partition-tests.sh` | 16 relocated-name cases each check bare unbound behavior, imported `run`, imported AOT build plus delivered executable, and REPL: 16 x 5 = 80 launches. Four depth-2 accessors, all 24 `(scheme cxr)` compositions, seven substrate-visibility checks, port identity/handler behavior, and no-manifest behavior add distinct probes (14 launches in the source census). | Bare/imported status, AOT and REPL resolution, inaccessible substrate names, and no-manifest behavior are separate contracts. |
| `srfi-upstream-tests.sh` | Five pinned upstream suites plus three runner-control programs. In native mode each program uses `run` (1), `build` plus delivered executable (2), and REPL (1): 8 x 4 = 32 launches, plus the provenance guard. | Intentional assertion failure, missing completion, and nonzero process status independently test result-file and frontend status handling. |
| `import-set-tests.sh` | The script contains 43 positive value checks, 16 rejection checks, 9 REPL value checks, 3 REPL diagnostic checks, 3 IR parity checks, and one stdin-include run. The three parity checks need Chez and are omitted in Chez-free native mode. Cache invalidation uses four native runs across library-presence states; feature/SRFI checks are separate probes. | Import shape changes alter lookup/results; the four cache states and negative diagnostics cannot share a cache result without losing invalidation evidence. REPL error-followed-by-valid-input checks preserve session recovery. |
| `install-layout-tests.sh` | Three initial `make install` calls cover prefix-sensitive rebuild, repeat idempotence, and DESTDIR-only staging, followed by a quiet install check. The suite then exercises installed/relocated resolver paths, run/REPL/build/lib commands, and cold, warm, and unavailable artifact-cache cases. | Prefix and DESTDIR are intentionally different configurations. Cold/warm/no-cache behavior, resolver precedence, diagnostics, and install narration/silence are separate assertions. Do not merge the install calls. |
| `binding-context-tests.sh` | Eleven positive fixtures each run natively twice with one shared cache, then build and execute AOT: 11 x 4 = 44 launches. Additional negative run/build and library rejection checks cover distinct frontend diagnostics. | Error wording, non-trapping errors, library rejection, artifact-interface reuse, host parity, and REPL recovery are separate behaviors. The repeated positive run has no explicit cache-hit assertion, so removing it needs evidence that a representative warm-hit check remains. |

The invocation counts above describe commands encoded by the scripts, not
compiler subprocess counts. One Emit command may spawn zero or more native
compiler processes depending on cache state, build configuration, and source
changes. In particular, the install suite intentionally asserts one prefix
rebuild and then asserts that subsequent identical-prefix installs do not
rebuild.

## Counting native compiler processes safely

For baseline measurements, the optional telemetry tools place transparent wrappers for
`CC` and `CXX` first on `PATH` (or set them to wrapper paths) while preserving
the resolved real compiler paths inside each wrapper. Each wrapper should
append one JSONL record containing compiler kind and argv, then `exec` the real
compiler with unchanged arguments and environment. This counts actual clang
and clang++ invocations without wrapping Emit or changing generated binaries.
Keep separate counters for build commands and compiler processes; compiler
wrappers alone do not prove a rebuild occurred. Use fresh isolated snapshots
for cold builds and retain the Make logs to distinguish compile and link
commands. Use `tools/test.sh --suite ID --trace-compilers --jobs 1` for current
suite counts, or `python3 tools/test-baseline.py --revision COMMIT --suite ID
--trace-compilers --output REPORT.json` for a selected legacy snapshot. Repeat
`--suite` to profile all six groups. Without instrumentation the baseline still
reports compiler counts as unmeasured (`null`). These are observed external
CC/CXX and Make calls, not counts of in-process LLVM/Scheme compilation. Keep
counting runs separate from uninstrumented timing samples because proxy startup
adds observer overhead.

## Observed six-suite counting runs

Measured on the environment in [the acceptance record](VALIDATION-RESULTS.md).
Both runs passed all six suites without Chez. The legacy snapshot is immutable
commit `a6238520b38551b1042e9f35a5768e0bcdd29d36`; it starts with one empty,
writable invocation cache. The current runner snapshots the working tree during
the startup corrections (report commit `f1ee629`, `working_tree_dirty: true`,
with its exact `input_digest`) and gives every suite a fresh private cache.
The underlying compiler sources/bootstrap are unchanged. Current counting runs
partly overlap the representative scenario runs. These instrumented elapsed
times describe the counting runs; use the separate controlled full samples for
speedup claims.

| Suite | Legacy elapsed | Current elapsed | External compiler work, before/after | Make calls, before/after | Retained assertions |
| --- | ---: | ---: | ---: | ---: | --- |
| R7RS sections | 32.849 s | 31.242 s | 0 / 0 | 0 / 0 | 986 passing assertions; 991 forms, 189 exclusions, 21 section groups |
| Library partition | 44.519 s | 62.131 s | 16 / 16 | 1 / 1 | 78 passing checks, including run/AOT/REPL and unavailable names |
| Upstream SRFIs | 198.140 s | 207.491 s | 8 / 8 | 1 / 1 | 24 passing host/control groups, including failed/missing completion and nonzero status |
| Import sets | 15.725 s | 37.618 s | 0 / 0 | 1 / 1 | 74 passing checks, including cold/invalidation and REPL recovery |
| Installed layout | 63.555 s | 71.698 s | 9 / 9 | 4 / 4 | 79 passing checks, including relocated install, cold/warm/unavailable caches and precedence |
| Binding contexts | 51.435 s | 57.815 s | 12 / 12 | 0 / 0 | 61 passing checks, including errors, frontend recovery and warm artifact reuse |

The install suite also makes one compiler query in each run. It recompiles
`src/emit.cpp` exactly once in each trace for its prefix-sensitive configuration;
the other five suites record no such recompilation. These observations preserve
the intentional prefix rebuild and repeated-install no-rebuild assertions.
The legacy seed build records three external compiler-work calls and one Make;
the current seed records four and one because it additionally builds `schemec`.
Seed build times are 6.021 and 4.264 s and are separate from suite execution.
Compiler-work calls include linking/preprocessing, not in-process Scheme/LLVM
compilation. Zero proxied compiler calls never means zero Scheme compilation.

The measured setup optimization remains the byte-identical R7RS assembler above:
991 slicing processes become 21, with the 21 selection processes and every
accepted/excluded form retained. The other five suites retain their commands
and external compiler counts. Their configuration, cold-cache, negative and
stateful recovery contracts do not justify batching them into shared sessions.
Private setup can cost more per suite; bounded scheduling supplies the measured
full-profile elapsed improvement. No per-suite compiler speedup is inferred.

Raw reports are `/private/tmp/emit-apply-six-before.json` and
`/private/tmp/emit-apply-six-after.json`; each retains per-suite logs and JSONL
compiler traces. The latter also passes both corrected REPL suites, with 18
cyclic-datum and 21 printer assertions. The historical baseline helper's
selected-suite runner counter was zero despite six completed suite records;
commit `c754dc5` corrects that bookkeeping. The six per-suite records and raw
tool traces, not that old aggregate field, establish the counts above.
