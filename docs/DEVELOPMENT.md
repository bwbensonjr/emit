# Development validation

`tools/test.sh dev` is focused feedback, not comprehensive verification. It checks
CLI/help, diagnostics, closures, runtime errors, persistent REPL state, AOT, and
library compilation. It tests the committed bootstrap compiler unless the report
explicitly identifies matching regeneration inputs. Python 3.9 or later, LLVM,
libgc, Git, and the existing native test prerequisites are needed; Python uses
only its standard library. Chez is needed only for explicitly selected units or
reference checks.

```sh
tools/test.sh dev --plan
tools/test.sh dev --changed main --plan
tools/test.sh dev --changed main --report /tmp/emit-dev.json
tools/test.sh --suite indexed-access-bounds --jobs 1
tools/test.sh full --jobs 2 --report /tmp/emit-full.json
tools/test.sh units
tools/test.sh source
tools/test.sh reference --suite self-emission --suite dump-parity
```

`--suite ID` is repeatable and selects only those IDs, independent of profile.
Unknown IDs/profiles, empty selections, unavailable Chez, and failed workers fail
the command. `--list` and `--plan` print selected registry records without building.
`tools/test.sh --classify BASE --ci` prints policy JSON without LLVM discovery.
`--direct` compares the exact base commit rather than its merge base. Local
`--changed BASE` includes staged, unstaged, deleted, renamed, and nonignored
untracked files; CI excludes uncommitted inputs. Both rename paths participate.
Unknown inputs/history choose full validation. Documentation-only plans use an
explicit prose allowlist and do no compiler work; project instructions, vendored
input Markdown, test fixtures, and CI configuration are not prose exemptions.

For known code categories, changed development plans union the small baseline
with runtime safety/control/I/O checks, host discovery/install checks, library
imports/artifact/REPL checks, or compiler reader/binding checks as appropriate.
Compiler edits still require direct `units` before regeneration and `source`
after explicit regeneration; native feedback alone cannot establish freshness.

## Profiles and claims

| Profile | Claim | Scope |
| --- | --- | --- |
| `dev` | Focused committed-native feedback | Small baseline plus changed-category checks |
| `full` | Complete native regression inventory | All 53 baseline native groups, Chez-free |
| `compat` | Representative LLVM-sensitive behavior | Native paths, closures, trap/bounds, macro libraries, explicit artifacts, installed version identity and relocation |
| `source` | Current source reproduces every bootstrap module | Isolated Chez-free regeneration and exact byte comparison |
| `units` | Current-source compiler unit behavior | Direct Chez source units; no regeneration |
| `reference` | Cross-host and independent-host correctness | All unique legacy developer integration, parity, fixed-point, scaling assertions |
| `conformance` | Optional conformance bookkeeping | Vendored R7RS sections and stale exclusions |

Compatibility intentionally omits large conformance, package, and compiler-wide
regressions; it supplements full LLVM 23 coverage rather than replacing it.
`run-all-tests.sh` delegates to `full`; `EMIT_R7RS=1` retains its optional stale
exclusion sweep. `run-dev-tests.sh` is the deduplicated union of units, source,
and reference. Missing Chez fails that explicit aggregate instead of skipping it.
See [retained coverage](VALIDATION-COVERAGE.md) and [CI policy](RELEASE-PIPELINE.md).

## Isolation and resource use

The runner snapshots the current Git input set once, including uncommitted bytes
and nonignored untracked files. Deleted files stay deleted. It makes a fresh
workspace, build configuration, home, XDG cache/config/data, and temporary
directory for every suite. Ambient `DESTDIR` and recursive Make override flags
are removed so fixture installs cannot be redirected outside their workspace.
No test changes the developer checkout. External symlinks are rejected. Native
profiles build an immutable seed once; workers copy its binaries/objects with
preserved timestamps, but never share mutable outputs or caches. Configuration,
VERSION, install, cold-cache, invalidation, and process-recovery assertions remain
unchanged. Negative tests are not batched into stateful sessions.

Audited direct Chez source units share the immutable source snapshot with private
temporary/cache directories. The runner hashes the seed before and after worker
execution and fails if any worker changes it. All other suites remain in separate
workspace copies; read-only sharing does not extend to Make/install/cache tests.

Default concurrency is two suites (`EMIT_TEST_JOBS` or `--jobs`, range 1-32).
Use `--jobs 1` for constrained memory or serial reproduction; each Emit compiler
process can consume substantial memory and child builds add parallel work.
Nested fixture parallelism defaults to one (`EMIT_TEST_CHILD_JOBS`); an explicit
`EMIT_JOBS` remains authoritative. Seed and fixture Make builds can use two jobs.
Cancellation signals private process sessions (including GNU `timeout`'s
separate process groups), escalates termination, waits for workers,
and fails the aggregate. A failed suite does not hide other suite outcomes.
Logs and proof JSON remain in the printed temporary report directory; disposable
workspaces are removed. Remove retained log directories when no longer needed.

## Reports and proof boundaries

Stdout is one JSON object; narration and captured worker diagnostics go to stderr.
`EMIT_VERBOSITY=quiet|default|verbose` (or `-q`/`-v`) controls narration, not data.
Reports use `schema: 1`, commit, platform, architecture, requested profile, policy,
selected suite results/coverage, jobs, cache state, toolchain signature, native
feedback label, and separate build/test/wall durations. Unobserved provisioning
and queue times are `null`, never zero or counted as test savings. Suite results
name exit status, elapsed seconds, isolation and retained log path.

Regeneration fingerprints are content-bound local hints, not CI proof. Missing
or changed source/bootstrap/toolchain inputs label native feedback as
`committed-bootstrap-only`; direct source units stay useful before regeneration.
`make regen` is explicit. Source proof outputs can be recognized only within the
same invocation with matching before/after hashes; another run's hint never
substitutes for source consistency or independent-host verification.

See [baseline protocol](VALIDATION-BASELINE.md) for paired equal-coverage timings.
For separate counting runs, `--trace-compilers` records actual external CC/CXX
and Make calls in per-suite JSONL logs. It uses transparent argv-preserving
proxies, never a replacement Emit binary. Counts distinguish compiler queries
from compile/link/preprocess work; they do not count in-process LLVM or Scheme
compilation. Alternate compiler paths explicitly chosen by a fixture are outside
that observation scope. Observer startup adds overhead, so do not mix these
counting runs into uninstrumented timing samples. Source/reference proof profiles
reject this instrumentation.
Do not call a smaller profile an equal-coverage speedup. Roll back parallelism
with `--jobs 1`, select individual IDs for diagnosis, and use the full/reference
profiles whenever focused feedback does not establish the claim you need.
