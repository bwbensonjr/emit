# Compiler development

## Source and component map

| Location | Role |
| --- | --- |
| `src/*.scm`, `src/*.ss`, `src/passes/` | Flat Scheme compiler sources: reader, expander, parser, passes, emitter, and shared compiler core. Entry programs select batch, embedded, or interactive operation. |
| `src/prelude.scm`, `src/prelude-surface.scm`, `lib/` | Standard-library implementation, partition/export declarations, and generated or hand-authored R7RS library sources. |
| `src/repl-core.ss` | Interactive compilation state and per-form orchestration, sharing the batch compiler core. |
| `src/emit.cpp` | Native command host for `emit run`, `emit repl`, `emit build`, and `emit lib`; embeds the compiler, manages ORC/LLJIT, and invokes clang for executable delivery. |
| `src/runtime/` | C runtime, tagged values, allocation under Boehm GC, and host I/O edges. See [LLVM conventions](../LLVM.md#ir-conventions-used-by-this-project). |
| `src/run-boot.cpp` | Minimal batch host used by regeneration; it is not the installed command. |
| `bootstrap/` | Committed compiler and baked-library LLVM IR used by normal native builds. |
| `tools/compiler-inputs.sh`, `tools/regen.sh` | Authoritative assembly/input inventory and self-hosted regenerator. |
| `test/`, `demos/`, `tools/test-registry.json` | Unit/regression tests, example programs, and the validation inventory. |
| `historical/genesis/` | Frozen Chez assembler and earlier library-structured sources, retained for provenance. |
| `openspec/` | Current specifications, active changes, archived designs, and explorations. |

See [the complexity catalogue](COMPLEXITY.md) for component sizes and generated,
vendored, and hand-authored classifications; [the pipeline](PIPELINE.md) explains
the compiler stages.

## Regenerating the compiler

Normal `make` links the committed `bootstrap/*.ll` inputs. Editing Scheme compiler
source does not silently regenerate them. After finishing a compiler-source edit,
run `make regen` explicitly; regeneration itself needs LLVM and libgc, without Chez.

The bootstrap artifacts have distinct roles:

| Artifact | Consumer |
| --- | --- |
| `bootstrap/embed.ll` | The minimal `build/emit-boot` batch runner that drives self-compilation. |
| `bootstrap/embed-repl.ll` | The mode-dispatched embedded compiler linked into the shipped `emit` host, serving all four commands. |
| `bootstrap/schemec.ll` | The optional `build/schemec` source-to-IR filter. It does not resolve library imports and is not the regeneration seed. |
| `bootstrap/emit.internal.ll`, `bootstrap/scheme.base.ll` | The baked substrate and standard library linked with the compiler artifacts. |

`make regen` runs [tools/regen.sh](../tools/regen.sh), then relinks the native
binaries. Its three stages are:

1. Assemble the flat compiler sources in the order declared by
   [tools/compiler-inputs.sh](../tools/compiler-inputs.sh). The embedded targets
   carry the prelude source as a string; the prelude is not prepended as program
   definitions. Compiler sources use the baked library set.
2. Link `build/emit-boot` from the committed batch compiler and baked libraries.
   Use it to compile the assembled batch compiler, producing both the baked
   modules and compiler IR. Relink the runner and repeat until every module is
   byte-identical across successive generations. This is the self-hosting fixed
   point; Chez does not participate.
3. Use the converged runner to emit `schemec.ll` and `embed-repl.ll`, publish the
   bootstrap modules, and record a content-bound source fingerprint. The Make
   target then rebuilds `emit` and `schemec` from those modules.

Use `bash tools/compiler-inputs.sh --list` for the current regeneration-input
inventory and `--bootstrap` for the declared output modules. Do not maintain a
second assembly list in documentation.

Regeneration is a barrier: finish those input edits first, then keep them fixed
until validation completes. Compiler acceptance requires direct source units,
full native regression, classified targeted reference checks, and the isolated
source comparison:

```sh
bash tools/test.sh units       # current Scheme source, before regeneration
make regen
bash tools/test.sh full
bash tools/test.sh units
bash tools/test.sh source
```

Also run the targeted reference suites selected by
`bash tools/test.sh --classify BASE --ci` for the change, replacing `BASE` with
its comparison revision. `bash tools/test.sh reference` runs the complete
independent-host inventory when needed. Chez is required for units and reference
checks, but not for regeneration, native checks, or source consistency.

The `source` profile regenerates an isolated snapshot of the current working-tree
inputs, including uncommitted changes and deletions, and compares every declared
bootstrap module. It never rewrites this checkout. Independent-host verification
instead re-derives the compiler under Chez; it proves a separate claim. A local
fingerprint is only a freshness hint and replaces neither proof.

If explicit regeneration is interrupted, rerun it to convergence before relying
on native results: `bootstrap/` may contain modules from different generations.

## Development validation

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
| `full` | Complete native regression inventory | All 53 baseline native groups plus 2 later native groups, Chez-free |
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
Workspace isolation prevents fixture interference; it is not a security sandbox
for arbitrary test code.

The cyclic-datum and printer recovery suites prepare their private REPL library
cache before applying their 30-second regression deadlines. Cold setup has its
own 180-second bound when a timeout command is available; a failed setup fails
the suite and prints its captured diagnostics. This preserves the legacy
warm-start hang assertions without relying on another suite's cache.

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
