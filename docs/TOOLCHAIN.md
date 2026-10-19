# Source compatibility CI

The release gate requires all four combinations below. This is a required test
matrix, not evidence that a workflow which has not run has passed. Consult the
Actions results for the exact commit being released. Discovery still accepts
newer LLVM versions and warns below its configured floor; this table adds no
upper bound.

| LLVM release | Linux runner | macOS runner |
| --- | --- | --- |
| 22.1.0 | ubuntu-24.04 | macos-15 |
| 23.1.0 | ubuntu-24.04 | macos-15 |

LLVM 22 is the default tested floor. LLVM 19-21 are outside maintained coverage;
explicit selection still warns and continues. `EMIT_LLVM_MIN` changes the warning
floor, not the maintained matrix. Discovery retains no upper bound.

`tools/ci-provision.sh` pins each maintained release to its full Git commit and
builds LLVM, clang, and libgc 8.2.8 from source. The same recipe works when a
package manager no longer provides a historical major. Cache entries include
platform, architecture, major, and the pinned dependency recipe identity emitted
by `tools/ci-provision.sh --identity <major>`. This read-only mode reports the
LLVM version and revision, libgc revision, and recipe identifier without creating
directories or building anything. Bump the recipe identifier when changing CMake
configuration or other dependency build semantics. Bundle/cache identities also
include a SHA-256 of the complete recipe, so any recipe edit invalidates reuse
conservatively. A completion stamp and actual compiler versions are checked on
cache hits.
Cache visibility follows [GitHub's ref isolation rules](https://docs.github.com/en/actions/reference/workflows-and-actions/dependency-caching#restrictions-for-accessing-a-cache):
pull-request caches can warm reruns of that pull request, but not a release tag.
A cold ref can instead restore an approved default-branch dependency artifact,
independently of cache visibility. Tags still run every gate; cache access is not widened.
Validated dependencies are saved before Emit tests so a later test failure does
not discard the toolchain build. A missing release
or wrong major fails the job. A cold LLVM build can take hours; link parallelism
is limited to control memory use. Recipe 6 explicitly installs clang and its
required `clang-cpp` shared library, resource headers, llvm-config, the shared LLVM
library, development headers, and the `llvm-as`, `llvm-link`, and `lli` backend
commands for the native target; unused tool executables, other target backends, and the clang
static analyzer are excluded. Linux also builds and installs lld, including the
`ld.lld` launcher, and configures clang to use it by default so Emit's `-flto`
AOT links do not depend on a system LLVMgold plugin. macOS retains the SDK
linker and installs the matching `libLTO.dylib` that clang supplies to it.
Provisioning preserves an explicit `SDKROOT`, or selects the macOS SDK with
`xcrun --sdk macosx --show-sdk-path`, validates its headers and libraries, and
exports it for subsequent compiler probes, builds, and installed smoke tests.
Private macOS LLVM and libgc libraries are given absolute install IDs within
their existing dependency prefix and ad-hoc signed after modification. IDs and
signatures are verified on fresh installs and cache reuse. Symlinks are resolved
to regular files inside the canonical private prefix before modification;
external targets are rejected. This makes newly
linked Emit and AOT programs independent of `DYLD_LIBRARY_PATH`, which system
Bash and other protected macOS tools discard. The LLVM library is selected from
`llvm-config --libnames --link-shared`; the libgc ID retains its installed
versioned filename. Only the exact current recipe completion identity is reused;
older recipe stamps are rejected, never silently relabeled as current. The recipe
6 completion stamp is written after every probe succeeds. The bundle manifest
must also match that exact completion stamp before packaging and after extraction.
Every installation and cache hit compiles, links, and executes a small C program
with `clang -flto` and implicit linker selection, a C++ standard-library program,
an LLVM C-API program, and a complete native Emit runtime object linked with libgc.
The clang and clang++ banners must match the exact pinned full version. An
exact-version check also covers `llvm-as`, `llvm-link`, and `lli`, included in
the distribution for independent-host backend verification. Every provision or
restore assembles two modules, links their bitcode, and executes it with `lli`;
native embedding success alone cannot mask missing backend commands. An
additional C probe asserts libgc 8.2.8 in both headers and `GC_get_version()`
from the linked shared library, not just a compatible ABI or directory name.
The LLVM and runtime probes execute through system Bash with DYLD overrides
removed. The latter retains
all runtime functions so unused code cannot hide missing builtin dependencies.
Darwin's compiler driver permits absent compiler-rt builtins for this native
configuration; the current Emit runtime links using SDK system libraries without
that resource archive. Sanitizer and profiling runtimes are outside this recipe.
Both libraries use an explicit `lib` directory.
Runner images are selected by OS version but
their bundled bootstrap compiler, CMake, Ninja, and system SDK still receive
runner maintenance updates.

The maintained pins are the official upstream releases
[22.1.0](https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.0),
[23.1.0](https://github.com/llvm/llvm-project/releases/tag/llvmorg-23.1.0), and
[libgc 8.2.8](https://github.com/bdwgc/bdwgc/releases/tag/v8.2.8).
The source recipe avoids assuming that a macOS binary distribution exists.

To reproduce a cell, install Git, CMake, Ninja, a bootstrap C/C++ compiler, and
the platform SDK. The native test suite also requires GNU `timeout`. On macOS,
install Homebrew `coreutils` and expose only its `gtimeout` command under that
name, keeping the platform's other utilities unchanged:

```sh
brew install coreutils
test_tools=$(mktemp -d)
ln -s "$(command -v gtimeout)" "$test_tools/timeout"
export PATH="$test_tools:$PATH"
```

CI prepares this alias automatically when `timeout` is absent. Then run from the checkout:

```sh
dependencies=$(mktemp -d)
tools/ci-provision.sh 23 "$dependencies" > "$dependencies/environment"
set -a
. "$dependencies/environment"
set +a
tools/ci-check.sh 23 full
# The deliberately focused floor check:
# tools/ci-check.sh 22 compat
```

Provisioning uses the network. The emitted environment explicitly selects that
installation's `LLVM_CONFIG`, clang `CC`, clang++ `CXX`, and libgc paths. Keep
these variables together: setting only `LLVM_CONFIG` can leave a system clang
reading newer textual IR. Build and test logs include actual compiler versions.
Chez must be absent from PATH for compatibility checks. `ci-check.sh` builds
committed bootstrap IR, runs the native suite plus version, doctor, and
installation checks, and verifies the IR bytes did not change. It never invokes
regeneration or the development suite.

## Trusted dependency transport

`dependency-preparation.yml` is the only reusable trusted producer. It runs on
`main` after recipe/transport changes, weekly, or by manual dispatch on `main`.
After merging this change, dispatch that workflow on `main` to seed all four
tuples, then verify a cold subsequent PR consumer restores an approved run.
PR runs cannot seed or refresh this channel; their artifacts are candidates
usable only by other jobs in that same run.

`ci-resolve.py` queries the Actions API with read-only permissions. It accepts
only a completed successful run from the same repository, the exact preparation
workflow, `main`, and a push/schedule/manual event. It rejects fork/PR producers,
failed runs, expired/missing artifacts, and missing producer metadata. Each
artifact contains `manifest.json` and `dependencies.tar.gz`. The manifest binds
the producer repository/run/commit/ref/workflow, LLVM/libgc revisions and full
versions, recipe SHA-256, OS, architecture, runner image family, exact macOS SDK
version/settings digest, deployment target, absolute install prefix, and payload
SHA-256. Every identity field must match before extraction. The approved run's
metadata, not the manifest's own assertion, establishes trust.

The payload contains only `llvm/`, `gc/`, and the verified completion stamp.
Extraction rejects absolute/traversing/duplicate paths, special files, escaping
symlinks, unsafe hardlinks, and writes through symlinks. It verifies bytes before
writing into an empty private prefix. Absolute prefix identity preserves native
install names; this is an internal runner transport, not a relocatable user
toolchain distribution. Bundles cannot silently cross SDK or layout identities.

All restored installations rerun the original compiler version, private dylib
ID/signature, C++, implicit LTO linker, LLVM C-API, bitcode assembly/link/JIT,
and complete-runtime probes.
Missing/expired/mismatched approved artifacts narrate an exact-source fallback.
A corrupt bundle is never executed; a probe failure fails validation. Artifacts
expire after 30 days, so weekly preparation refreshes availability. Git, CMake,
Ninja, Python 3, `gh`, and `jq` are CI orchestration prerequisites; no Python
packages or package-publication credentials are required.

`prepare-toolchains.yml` provisions each required OS/major tuple once and
uploads a same-run candidate. Native, canonical verification, and archive jobs
download that candidate and only re-probe it; they never build LLVM. A forced
cache/artifact miss therefore causes four source builds, not a separate LLVM 23
build for every archive/verification consumer. Preparation stores verified caches
before Emit tests. Cache keys include the entire platform/SDK/recipe identity.
Rollback can restore source-only provisioning without changing Emit artifacts;
expiry recovery is a preparation dispatch or the automatic exact-source fallback.

## Validation triggers

| Event or input | Native checks | Additional required proofs |
| --- | --- | --- |
| Allowlisted prose-only PR/main | None; no LLVM provisioning | Lightweight policy/runner checks |
| Code PR/main | LLVM 23 full, LLVM 22 compat; both OSes | Classified source/units/targeted reference |
| Packaging/install/release infrastructure | Same four cells | Package guards and both offline archives |
| Weekly/manual compatibility | All four full | Source, units, complete reference |
| Manual release rehearsal or version tag | All four full | Source, units, complete reference, package, both offline archives |

The focused inventory exercises representative JIT numeric/closure/primitive/trap
behavior, persistent REPL state, macro library/import/artifact reuse, AOT,
version/doctor, and relocated installation. It is not the full suite; see the
versioned coverage inventory and `tools/test.sh --list` for ownership.
Main validates the merged tree, not a reused PR result. The always-running policy
and `Required validation` aggregate distinguish intentional omissions from missing,
failed, cancelled, or unexpectedly skipped required proofs. Unknown paths/history
select conservative code checks. Superseded runs cancel only for the same
workflow and PR; main, tags, different PRs, and release workflows are separate.

Failures retain JSON reports and logs as artifacts. Archive validation denies
network access and checkout reads. See [release preparation](RELEASE-PIPELINE.md).
