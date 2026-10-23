# Validation implementation evidence

Implementation acceptance is complete. The controlled equal-coverage comparison,
corrected four-cell full-native rehearsal, source/unit/reference proofs, and both
offline archives pass. Earlier failed checkpoints below are retained as historical
evidence; the approved canonicalization/prerequisite fixes and explicit
regeneration are validated in the final section.

## Local environment

Measurements on 2026-10-18 use Mac15,3, ARM64, eight physical/logical CPUs,
16 GiB RAM, macOS 26.6.2, LLVM/clang 23.1.2, libgc 8.2.12, and Chez 10.4.1
where explicitly required. Native baseline PATH excludes Chez; native builds
use explicit matching CC/CXX/LLVM_CONFIG and libgc include/library paths.
Dependencies were already installed. Queue/provisioning time is not applicable
locally and remains separate from project build and tests.

The immutable pre-change checkout is commit
`a6238520b38551b1042e9f35a5768e0bcdd29d36`. Initial detailed macOS `time -l`
returned nonzero after a successful build because sandboxed clockrate access was
denied; no test result was taken from that attempt. Portable `time -p` is used
for the retained baseline logs. Lightweight implementation checks overlapped
parts of the baseline; record the observed variation rather than assuming a
quiet host or comparing isolated single best samples.

### Cache-state correction

The first two legacy samples used the ambient macOS user-cache location, outside
the sandbox's writable roots. The new runner instead supplies writable isolated
caches. Large per-suite differences exposed this mismatch (for example, import
sets took 197-200 s in those legacy samples versus 35.380 s in the first new
sample, with the same 74 passing assertions). These initial legacy samples are
ambient-sandbox evidence, not the accepted equal-coverage speed comparison.

Controlled legacy samples must explicitly provide a fresh writable `EMIT_CACHE`
per invocation. The legacy runner may share that cache across its suites, while
the new runner deliberately isolates suites; both begin with writable empty
caches. Record this policy difference, which favors legacy cross-suite reuse,
and do not attribute cache availability to scheduling improvement.

## Completed checks

- Both pre-change full-native baselines passed all 53 suites without Chez:
  2,553.87 and 2,410.48 s wall (median 2,482.175 s, range 2,410.48-2,553.87 s),
  with dependencies already installed. User/system times were 2,435.81/47.46 s
  and 2,338.88/38.74 s. These cache-mismatched samples are excluded from the
  accepted comparison below.
- Both new-runner full-native samples passed all 53 suites without Chez:
  report durations were 682.665 and 682.890 s. The first took 682.90 s external
  wall time, 4.084 s seed build, 675.108 s worker execution, and
  1,200.32/95.15 s user/system time. Both ran
  immutable checkpoint `cbd2e55f6c7708b33bc97d5682cbc9a9753a987a` with two
  workers, writable per-suite caches, and unchanged seeds.
- Final three-sample documentation policy durations were 0.330, 0.313, and
  0.315 s (median 0.315), with no build or suites selected. All 15 compiler
  source units passed in 6.414, 6.367, and 6.347 s (median 6.367) after the
  recorded harmless compiler comment fixture; no native build or regen ran.
- Runtime comment-fixture feedback passed in 71.941, 72.112, and 71.770 s
  (median 71.941); each sample used the changed-runtime development selection,
  not the full-native profile.
- Native-host comment-fixture feedback passed in 94.548, 94.059, and 94.235 s
  (median 94.235), retaining configuration, toolchain-discovery, installation,
  CLI/doctor, and native execution checks in its focused selection.
- Runner regressions cover GNU `timeout` descendants in separate process
  groups, a SIGTERM-ignoring child, failed aggregate reports on interruption,
  private home/cache roots, and inherited install-destination overrides.
- Classifier regressions retain independent staged/unstaged obligations and
  compiler dependencies aliased into otherwise allowlisted Markdown. Source
  fingerprints include internal symlink target bytes and reject unsafe aliases.
- The three selected native configuration, VERSION, and installation suites
  passed concurrently with two workers: 79.248 s wall, 4.410 s seed build,
  72.475 s worker execution. No tracked compiler/bootstrap bytes changed.
- The first focused native development selection passed all three suites:
  37.263 s wall, 4.084 s seed build, 29.095 s worker execution. This is focused
  feedback, not equivalent coverage to the 53-suite full profile.
- All 15 direct source units passed in every comparison sample. Per-unit
  repository copies took 14.520, 14.619, and 14.422 s (median 14.520). Shared
  immutable inputs with private temporary/cache roots took 9.034, 6.310, and
  6.097 s (median 6.310). Before/after seed hashes matched. Coverage tests pin
  all 15 groups, including REPL import transactions, to the source-unit profile.
- Targeted reference selection passed self-emission, dump parity, and datum
  rendering: 25.205 s wall, with all three explicitly selected groups retained.
- [R7RS assembly evidence](VALIDATION-SETUP.md) compares byte-identical programs
  for all 21 sections and records setup-only process counts/timings. This is not
  a full-native speedup measurement.

Raw local reports/logs are retained under `/private/tmp/emit-streamline-*`,
`/private/tmp/emit-units-*`, and their printed per-invocation log directories.
These temporary paths are evidence locations on the measurement host, not
portable project inputs. Reproduce them using the documented harness and retain
the emitted JSON and logs alongside future measurements.

## Controlled equal-coverage comparison

Both controlled legacy runs used baseline commit
`a6238520b38551b1042e9f35a5768e0bcdd29d36`, the same installed dependencies and
hardware recorded above, no Chez, and a distinct initially empty writable
`EMIT_CACHE` per invocation. Both full-native logs end with 53 suites and zero
failures; both reports have `test_returncode: 0`. The new-runner samples above
also passed all 53 registered native suites without Chez. The legacy runner
shares its invocation cache across suites; the new runner isolates each suite.
The inventory consistency check retains every legacy native group.

| Measured phase | Legacy sample 1 | Legacy sample 2 | New sample 1 | New sample 2 |
| --- | ---: | ---: | ---: | ---: |
| Project build | 3.910 s | 3.824 s | 4.084 s | 3.865 s |
| Full-native test execution | 977.047 s | 960.798 s | 675.108 s | 675.300 s |
| External invocation wall time | 983.05 s | 966.74 s | 682.90 s | 683.08 s |
| User CPU time | 915.24 s | 897.09 s | 1,200.32 s | 1,202.62 s |
| System CPU time | 33.79 s | 32.05 s | 95.15 s | 94.52 s |

Full-native test execution has a legacy median of 968.9225 s (range
960.798-977.047 s) and a new median of 675.204 s (range 675.108-675.300 s):
30.31% less elapsed test time. The slowest new sample is 285.498 s faster than
the fastest legacy sample, exceeding either observed within-pair range.
This measures the combined setup/isolation/scheduling implementation with equal
native coverage; it does not attribute the gain to a single optimization or
profile reduction. Each sample builds once and invokes one full runner.
External compiler counts were not instrumented in these timing runs and remain
unknown; separate telemetry runs must not be mixed into this timing comparison.
Local queue and dependency provisioning are not applicable (`null` in reports).

The wall-time gain has a CPU cost: median user+system CPU rises from 939.085 to
1,296.305 s (38.04%). The new runner uses two workers and private suite copies
and caches, while legacy suites share a checkout and invocation cache. These
measurements establish shorter elapsed feedback, not lower aggregate CPU use.
Further safe setup reuse needs separate measurement and must preserve isolation
and invalidation assertions.

Raw controlled reports are `/private/tmp/emit-streamline-controlled-baseline-1.json`
and `-2.json`; each identifies its retained build and full-native logs. New
reports are `/private/tmp/emit-streamline-modern-1.json` and `-2.json`.

## Proof reuse and rehearsal findings

The 11 runner-source checks pass, including source/bootstrap/toolchain hash
invalidation, failed/cancelled/missing proof rejection, invocation-local lifetime,
and duplicate selection running a source proof only once. All 22 source-proof
fixtures and 15 classifier checks pass. Contributor obligations are documented
in `AGENTS.md` and `docs/DEVELOPMENT.md`.

Non-publishing [rehearsal 39174934899](https://github.com/bwbensonjr/emit/actions/runs/39174934899)
uses commit `f1ee629bf32a00c20dcb49b0fd4740e2153b97d9` on the change branch.
Its canonical Linux source proof passed in 630.073 s, reproducing all five
bootstrap modules with no differences. Both exact offline archives, packaging
identity/retry guards, policy checks, and all four candidate preparation jobs
passed. This is partial rehearsal evidence; native and reference acceptance
remain open.

All four Linux/macOS LLVM 22/23 full-native cells each passed 51/53 suites.
The cyclic-datum and printer suites timed out during cold REPL library setup,
before their evaluated regression forms. Their legacy cross-suite cache had
hidden that setup cost. The tests now prepare their own private REPL cache in
a separately bounded setup step, preserving the 30-second termination/recovery
checks. Setup failure and timeout remain fatal with retained diagnostics.
Four dedicated setup checks cover this propagation and verbosity, plus the
CI Chez wrapper's boot-name and argument handling.

The corrected cyclic-datum and printer suites pass locally with fresh private
caches: 18/18 and 21/21 assertions, respectively (25.727 and 22.448 s suite
time). Each measured startup setup took 16 s; subsequent regression sessions
retain their original 30-second limits. The two-suite report is
`/private/tmp/emit-apply-repl.json`. These are focused correction checks,
not a replacement for the four-cell CI rehearsal.

The source-unit job failed because the renamed Debian `scheme` symlink selected
`chez.boot`, which is not installed. The workflow now executes `scheme` through
a wrapper preserving its executable name. Full reference verification was not
reached in that attempt. No compiler-source or bootstrap files changed for
these infrastructure corrections; regeneration in the developer checkout is
not required.

The ten policy checks and classifier fixtures cover compiler/bootstrap/assembly
source selection, host-only omission, canonical targeted reference selection,
weekly/manual full verification, and failed/missing/cancelled proof rejection.
The real rehearsal's required aggregator failed after unavailable Chez units
and native timeouts; publication was skipped. Passing source consistency did
not conceal unavailable independent-host verification. A successful corrected
full/reference rehearsal is still required for tasks 6.4 and 7.2.

Downloaded diagnostic artifacts are retained at
`/private/tmp/emit-apply-rehearsal.8CqMWt` on the measurement host.

## Dependency preparation acceptance

All four preparation jobs in that rehearsal succeeded and transferred their
same-run candidates to isolated native consumers. Every native consumer's
restore/re-probe step succeeded, as did canonical verification and both archive
consumers' restore/re-probe steps. For LLVM 23, the macOS candidate was
51,249,107 bytes (2.13 s extraction), and the Linux candidate was 76,198,945
bytes (2.48 s extraction). Consumers only restore and re-probe; no LLVM source
build runs there. Producer caches were warm; consumer transfer is independent
of those caches. This proves candidate transport, not a seeded trusted-main
channel or complete native correctness.

All 14 bundle/resolver/preparation tests pass. They include approved
main/push/schedule/manual policy, rejected PR/fork/failed producers,
missing/expired artifacts, digest/identity/stamp rejection, safe extraction,
and cache-free approved artifact restoration. The new forced-miss fixture
executes the actual preparation and bundle code for both recipe majors. It
stubs the expensive source-build boundary and observes exactly one build and
four probes per recipe: preparation plus three initially empty
native/archive/verification consumers. It does not claim real cold LLVM build
durations. Actual provisioning probe fixtures separately retain exact version,
SDK, dylib normalization/signing, LTO, C-API, and runtime checks.

Trusted default-branch seeding remains the documented post-merge follow-up in
`docs/TOOLCHAIN.md`; no PR-controlled artifact is published into that channel.

## Measurement report checks

All 14 baseline-harness checks pass. Scenario runs now retain the child runner
report and its separate project-build/test phases, selected coverage and native
telemetry, rather than only an aggregate wall time. Missing child reports fail
measurement. Documentation policy explicitly records no build or tests, while
legacy unobserved phase values and local queue/provisioning remain unknown.
Native tracing is rejected for direct source-unit scenarios.
Scenario and selected-suite runner invocations are counted explicitly, and
quiet metadata runs preserve JSON while suppressing stderr narration.

## Representative edit feedback

Fresh three-sample runs use immutable implementation commit
`c754dc58dc67edd8c2646d0d6f48ad5fb701f47a` and the same machine/dependencies
recorded above. Each disposable snapshot receives the harness's exact recorded
comment/prose fixture. The compiler scenario alone includes Chez on PATH;
runtime, host and prose scenarios exclude it. Every invocation starts a fresh
runner seed and private suite caches. All 12 samples pass. Some native samples
overlap the separate compiler-counting runs; these are observed local feedback
times, not quiet-host component benchmarks.

| Fixture | Wall samples (s) | Wall median (range), s | Median build / worker test (s) | Selection |
| --- | --- | --- | --- | --- |
| Compiler pass comment | 6.616, 6.395, 6.421 | 6.421 (6.395-6.616) | 0 / 3.123 | 15 direct current-source units |
| Runtime C comment | 74.223, 74.813, 72.789 | 74.223 (72.789-74.813) | 4.033 / 66.712 | 9 focused runtime/execution/CLI groups |
| Native host comment | 97.978, 95.659, 102.228 | 97.978 (95.659-102.228) | 4.056 / 90.569 | 6 discovery/configuration/install/CLI/execution groups |
| Prose addition | 0.282, 0.265, 0.271 | 0.271 (0.265-0.282) | 0 / 0 | Policy only; zero suites and no LLVM work |

Each scenario report records three runner invocations. Raw reports are
`/private/tmp/emit-apply-scenario-{compiler,runtime,host,documentation}.json`;
each retains the exact fixture, command, runner JSON and logs for every sample.
Local queue/provisioning remain `null` independently of build/test phases.
Wall time also includes snapshot, fingerprint, cleanup and command overhead;
it is not simply build plus worker time.

All four retained pre-change fixture plans select `bash run-all-tests.sh`.
The two controlled complete legacy invocations above take 966.74-983.05 s wall
(median 974.895 s). Those measure the common old native obligation, not twelve
additional fixture-specific baseline runs; compiler acceptance previously also
required developer verification. Every focused sample is shorter than the
fastest complete legacy run, but the selections establish narrower claims.
Compiler units are pre-regen feedback, not acceptance of a semantic compiler
change; source/native/reference obligations still follow the contributor
workflow. Harmless comment fixtures measure selection/build overhead, not the
correctness of a changed compiler algorithm.

The separate controlled 53-suite comparison establishes the equal-coverage
elapsed improvement. Neither this smaller selection nor moving reference
checks to different triggers is counted as that speedup. Documentation policy
fixtures and CI plan tests establish zero toolchain provisioning, while ordinary
code policy selects two LLVM 23 full and two LLVM 22 focused cells. Cold
dependency consumption is covered separately by candidate transfer and the
forced-miss transport fixtures.

Separate one-sample native counting runs at commit `3558d9b` exercise the same
runtime and host fixtures with transparent proxies. They are not timing samples.
The runtime selection observes four seed compiler-work calls plus five suite
calls, 11 compiler queries, and ten Make calls total; `src/emit.cpp` and
`src/runtime/runtime.c` each compile once. The host selection observes four
seed compiler-work calls plus 21 suite calls, 12 queries, and 15 Make calls;
each of those source files compiles five times across the seed and intentional
configuration/prefix fixtures. These are observed external calls/object
compiles, not in-process Scheme/LLVM counts or inferred rebuilds from Make.
The source-unit profile launches no native build, and documentation launches
neither a build nor suites. Uninstrumented counts stay unknown in timing runs.
Raw counting reports are `/private/tmp/emit-apply-count-runtime.json` and
`/private/tmp/emit-apply-count-host.json`, with retained child reports and raw
JSONL paths. A missing trace file for a zero-observed-call suite is the
telemetry contract's zero, not a failed build or a silently omitted assertion.

## Integrated non-publishing rehearsal

[Run 39182790264](https://github.com/bwbensonjr/emit/actions/runs/39182790264)
manually validates commit `c754dc58dc67edd8c2646d0d6f48ad5fb701f47a` on the
change branch. All four cells run `full`, not the ordinary LLVM 22 focused
profile. Each report records 53 selected/passing suites, unchanged immutable
seed and proof inputs, and no failures.

| Cell | LLVM version | Seed build (s) | Native worker execution (s) | Native runner wall (s) |
| --- | --- | ---: | ---: | ---: |
| Linux x86_64 / 22 | 22.1.0 | 8.814 | 1,243.933 | 1,254.995 |
| Linux x86_64 / 23 | 23.1.0 | 11.242 | 1,240.967 | 1,254.735 |
| macOS arm64 / 22 | 22.1.0 | 6.814 | 1,084.161 | 1,094.206 |
| macOS arm64 / 23 | 23.1.0 | 9.913 | 1,185.870 | 1,200.573 |

These are runner phases, not whole-job timings: checkout, dependency restore
and probes, and the CI entry point's preliminary build remain separate.
Workflow creation at 00:53:23 UTC and policy start at 00:55:03 UTC on
2026-10-19 give 100 s initial queue/concurrency wait; later dependency waits
are not counted as native execution. All four preparation jobs and all
consumer restore/probe steps pass. Producer caches are warm; consumers use
the transferred immutable candidates without rebuilding LLVM.

Packaging identity/determinism/retry guards and both exact Linux/macOS offline
archive validations pass. The isolated canonical source workflow step passes
in 842 s (841.126 s runner report), followed by all 15 direct Chez units in
6.410 s. Complete reference verification finishes in 1,099.042 s with 20/25
groups passing. Its independent-host fixed-point group passes in 449.446 s,
but five other groups fail, so the required aggregate fails and publication is
skipped. Manual dispatch creates no tag.

Reports are retained under
`/private/tmp/emit-apply-rehearsal.8CqMWt/final-native/compatibility-*`.
Later commit `3558d9b` changes only baseline narration, its local regression
test, and CPU-cost documentation; all 14 baseline-harness checks pass locally.
It changes no native/compiler/bootstrap/library code or archive/reference
validation commands. The rehearsed source archive remains the exact `c754dc5`
payload; any future tag must validate its own exact payload.

### Remaining acceptance blockers

[Issue #137](https://github.com/bwbensonjr/emit/issues/137) records the incomplete
reference prerequisites: the LLVM distribution omits backend commands used by
the Chez driver, and Debian's installed Chez lacks `path-build`. The binding
parity suite passes locally with Chez 10.4.1. The demo backend harness also
overwrote inherited/exported `CC` with its Scheme driver; it now uses a dedicated
argument array, preserving the native compiler environment. All five local
verification-setup tests pass, including that exported-CC regression. The LLVM
distribution and compatible CI Chez provisioning still need correction.

[Issue #136](https://github.com/bwbensonjr/emit/issues/136) records the SRFI 227
interface mismatch reproduced on Linux and local Chez 10.4.1. The full suite
passes 38 checks but fails export byte parity; its runtime values, cache checks
and emitted IR agree. Retaining a full-suite fixture shows 7,068 native export
bytes versus 6,944 Chez bytes, with `equal?` returning `#t` for the parsed data.
Compiler-owned `(lambda core (builtin core lambda) lambda)` descriptors have
different aliasing, so the shared renderer assigns different graph labels.
A smaller direct compilation produces identical bytes; compilation/cache
history exposes the difference. The existing byte comparison has not been
weakened or removed.

The user approved extending this change to canonicalize compiler-owned
interface metadata and cross the explicit regeneration barrier. The retained
byte comparison remains unchanged. Tasks 6.4, 7.2 and 7.3 remain unchecked
pending a successful corrected rehearsal.

Failed reference reports are retained at
`/private/tmp/emit-apply-rehearsal.8CqMWt/final-proofs`; the complete job log is
`/private/tmp/emit-apply-reference.log`. The retained local full-suite fixture is
`/private/tmp/emit-exports-parity.KzQv0Z`, with its failed native interface under
the printed temporary directory in `full.log`. The original compiler/bootstrap
sources remained unchanged at that checkpoint.

### Approved acceptance fixes

The shared export renderer now rebuilds schema-owned metadata without
incidental spine sharing and interns complete binding descriptors, including
their spelling and lexical keys. Transformer aliases share a payload by origin;
user syntax graphs retain explicit identity and cycles, without structural
hash-consing of user datums. Both retained mismatching SRFI 227 artifacts render
as the same 8,229-byte canonical datum under Chez. Added unit assertions cover
allocation/restoration history, idempotence, distinct lexical keys/aliases,
identifier fallbacks, forged reader-vector tags, and user pair/string sharing
and cycles. Existing full-suite export byte comparisons are unchanged.

Recipe 6 adds exact-version `llvm-as`, `llvm-link`, and `lli`, plus a two-module
assembly/link/JIT execution probe on every provision/restore. Failure-injection
tests exercise all four subprocess steps; the real probe also passes with local
LLVM 23.1.2. Relative-root joining no longer requires Chez's newer `path-build`;
the actual driver helpers are tested by the binding source units.

Pre-regeneration validation passed all 15 direct source-unit suites (5.932 s)
and the Chez-only Snow package checks (4/4). Reports/logs are retained at
`/private/tmp/emit-fix-pre-regen-final-units.json` and
`/private/tmp/emit-fix-pre-regen-snow.log`. These are current-source checks, not
evidence that native bootstrap artifacts include the fixes.

Explicit `make regen` then completed in 472 s, with four self-compiles and a
fixed point at iteration 1 (234 s fixed-point stage, 231 s final emission stage).
All five declared bootstrap modules were regenerated or verified stable;
the two baked modules stayed byte-identical. The resulting `build/emit` is
2,857,352 bytes and `build/schemec` is 963,768 bytes. The log is retained at
`/private/tmp/emit-fix-regen.log`. Compiler inputs were frozen before regeneration
and remain unchanged during subsequent acceptance validation.

Post-regeneration source units passed 15/15 in 6.341 s. The full cross-host Snow
suite passed 39/39, including the unchanged SRFI 227 export byte comparison;
complete backend equivalence also passed. Native, source, and reference
acceptance profiles run concurrently for correctness evidence, not as additional
samples of the controlled performance comparison above.

All required local post-regeneration profiles passed:

| Profile | Result | Runner elapsed |
| --- | --- | ---: |
| Full native, without Chez | 53/53 suites | 768.047 s |
| Direct source units | 15/15 suites | 6.341 s |
| Isolated source consistency, without Chez | All five modules identical | 673.206 s |
| Complete reference | 25/25 suites | 797.905 s |

The reference fixed-point group independently re-derived the committed modules
from Chez; the source profile separately reproduced all five bootstrap modules,
including the matching uncommitted source/IR pair. Native cyclic-datum and printer
regressions also passed. Compiler/bootstrap inputs and isolated seeds stayed
unchanged throughout validation. Raw JSON reports are retained as
`/private/tmp/emit-fix-{full,units,source,reference}.json`, with corresponding logs.

The restricted Chez-free PATH selected LLVM clang 23.1.2 rather than the Apple
clang default used for the initial regeneration. Accordingly, those native
reports conservatively retain a toolchain-mismatched local fingerprint label;
the successful independent source comparison, not that hint, establishes current
source/bootstrap consistency. CI will use its explicit pinned CC/CXX throughout.
Policy, bundle, version, runner, classification, coverage, source/fingerprint,
telemetry, measurement-harness, prerequisite, archive-isolation, discovery, and
range-assembly self-tests all passed. Strict OpenSpec validation also passed.

### Corrected non-publishing CI rehearsal

[Run 39243651510](https://github.com/bwbensonjr/emit/actions/runs/39243651510)
tests commit `112d9a7a11345f8004aa96fe49756da1a939ed89`. Recipe 6 invalidated
the previous installations, so each tuple performed one exact source build.
All four preparations passed their native and new bitcode backend probes:

| Tuple | LLVM source build | Provision through probes | Bundle bytes |
| --- | ---: | ---: | ---: |
| Linux LLVM 22.1.0 | 6,033 s | 6,104 s | 74,893,709 |
| Linux LLVM 23.1.0 | 6,449 s | 6,510 s | 76,321,143 |
| macOS LLVM 22.1.0 | 4,071 s | 4,175 s | 49,444,456 |
| macOS LLVM 23.1.0 | 3,264 s | 3,371 s | 51,330,837 |

These are cold dependency costs, not Emit test durations or speedup samples.
Provisioning includes fetch/configure/install/probes; bundle packaging, upload,
runner setup, and queue time are separate. Logs are retained at
`/private/tmp/emit-fix-ci-{linux,macos}{22,23}-prepare.log`.

Both exact offline archive jobs passed. Isolated Linux/macOS consumers restored
the new LLVM 23 candidate bundles in 2.48/3.58 s, reran the backend probes, and
performed no LLVM source build. The offline source builds took 46/65 s,
respectively, with network and checkout reads denied. Logs are retained at
`/private/tmp/emit-fix-ci-{linux,macos}-archive.log`.

All four full-native cells passed 53/53 suites, with unchanged bootstrap inputs
and isolated seeds:

| Tuple | Runner elapsed | Seed build | Suite execution |
| --- | ---: | ---: | ---: |
| Linux LLVM 22 | 1,232.290 s | 11.774 s | 1,217.898 s |
| Linux LLVM 23 | 1,208.401 s | 11.125 s | 1,194.626 s |
| macOS LLVM 22 | 1,390.256 s | 10.602 s | 1,374.426 s |
| macOS LLVM 23 | 1,266.751 s | 7.730 s | 1,255.172 s |

The complete CI proof set passed on LLVM 23.1.0 and Ubuntu Chez 9.5.8:

| Proof | Result | Runner elapsed |
| --- | --- | ---: |
| Chez-free source consistency | All five bootstrap modules identical | 907.062 s |
| Direct source units | 15/15 suites | 6.685 s |
| Complete reference | 25/25 suites | 1,254.145 s |

The independent-host fixed-point group passed in 468.226 s. All five previously
failing reference groups passed, including the complete Snow cross-host artifact
parity suite (89.441 s); its byte comparisons remain unchanged. The source and
bootstrap digests match the locally validated inputs, and every report retains
unchanged-seed/input checks. This verifies both canonicalization and the backend
prerequisite/older-Chez fixes on the actual CI host.

`Required validation` passed. The manual rehearsal's `publish` job was skipped;
it created no public tag or release. All 29 OpenSpec implementation tasks are
complete. Trusted default-branch channel seeding remains the documented
post-merge rollout, not a simulated publication from this branch.

Native reports/logs and source/unit/reference reports are retained under
`/private/tmp/emit-fix-ci-evidence.nqlO0L/{compatibility-*,compiler-verification}`.
The verification job log is `/private/tmp/emit-fix-ci-verification.log`; final
run/gate metadata is `/private/tmp/emit-fix-ci-final.json`. The tested compiler
and bootstrap remain committed at `112d9a7`; subsequent acceptance bookkeeping
changes only documentation and task status.

## Distribution channels: first release 0.1.1

Change `low-cost-distribution-channels`, recorded 2026-10-23.

**Source release.** Tag `v0.1.1` is on merge commit `4d7ac42`. Release run
[39951247509](https://github.com/bwbensonjr/emit/actions/runs/39951247509)
passed all four full native cells, source, units, and reference verification,
and both offline archives. It published
[v0.1.1](https://github.com/bwbensonjr/emit/releases/tag/v0.1.1):
`emit-0.1.1.tar.gz`, SHA-256
`882be3ccca53f9cd8c61d8825bcff38ee09ad72c13898b309ac2f8e745440e5c`. `v0.1.0`
is unchanged.

**Channel promotion.** That release's success triggered channel run
[39956760742](https://github.com/bwbensonjr/emit/actions/runs/39956760742).
Promotion was single-step, which the maintainer chose: each channel runs its own
acceptance against the published archive, and only then promotes.

- Attempt 1 passed identity, both Nix systems, and OCI. It failed in two pull
  request steps, both caused by permission settings:
  - The tap token had read-only Contents, so the push was rejected with 403.
  - The repository did not allow Actions to create pull requests, so PR
    creation failed after the branch was pushed. That PR was opened by hand
    from the same branch.
- Attempt 2 reran only the failed jobs, after the token was granted
  Contents: Read and write and the Actions setting was enabled. Every job
  passed, and the reruns were idempotent: the OCI job was not rerun, and the
  flake job found its existing branch and pull request.

| Channel | Promotion | Merged |
| --- | --- | --- |
| OCI | `ghcr.io/bwbensonjr/emit:0.1.1` and `:latest`, digest `sha256:3c5308b898f01a63308556c276a94b95c57d0a91350bd5edc9bd35a85c2b5278`, publicly pullable | (direct push) |
| Homebrew | `Formula/emit.rb` for the release URL and SHA-256 above; `brew test-bot` passed on `macos-26` and Ubuntu | [homebrew-emit#2](https://github.com/bwbensonjr/homebrew-emit/pull/2) |
| Nix | `packaging/release.json` pinning `v0.1.1` | [emit#143](https://github.com/bwbensonjr/emit/pull/143) |

**Installed checks from the public channels, after merge:**

| Channel | Command | Result |
| --- | --- | --- |
| Homebrew | `brew install bwbensonjr/emit/emit` (Apple Silicon, maintainer's Mac) | installs and runs; a stale `~/.local` source install first had to be removed with the new `make uninstall` |
| OCI | fresh `docker pull --platform linux/amd64 ghcr.io/bwbensonjr/emit:0.1.1` | digest `sha256:3c5308b…`; labels version `0.1.1`, revision `4d7ac42`; `emit 0.1.1 (LLVM 22.1.2)`; doctor ok with the pinned `/usr/lib/llvm-22/bin/clang`; `tools/channel-accept.sh` 11/11 with `--network none --read-only --user 12345:12345` |
| Nix | `nix run github:bwbensonjr/emit -- --version` on `x86_64-linux` (emulated) | `emit 0.1.1 (LLVM 22.1.8)`; `packages.x86_64-linux.default.version` is `0.1.1`; doctor ok with the pinned Nix clang; acceptance 11/11 outside any shell with networking unshared |

**Documented rehearsal dispatch.** `gh workflow run channels.yml -f tag=v0.1.1
-f publish=false`, as written in `docs/RELEASE-PIPELINE.md`, produced run
[40011418618](https://github.com/bwbensonjr/emit/actions/runs/40011418618).
Identity, Homebrew, both Nix systems, and OCI passed against the published
archive. `nix-promote` and every promotion step were skipped. No tap or emit
pull request was created, and no image tag was pushed.

**Findings fixed during the rollout:**

- The OCI promotion now pushes from an unpacked `oci:` layout, because
  `skopeo`'s `oci-archive:` transport needs root to unpack.
- The Homebrew formula test now clears inherited compiler variables.

**Open follow-up:**

- The Homebrew credential preflight checks `permissions.push`, which reports
  the account's role rather than the fine-grained token's scope. It passed for
  a token that could not push. An authenticated `git push --dry-run` would
  catch this before building.
