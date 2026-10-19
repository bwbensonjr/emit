# Validation implementation evidence

This is an acceptance record in progress, not a claim that all change tasks are
complete. The controlled equal-coverage comparison passes; the non-publishing
CI rehearsal must still pass before integrated acceptance is complete.

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
