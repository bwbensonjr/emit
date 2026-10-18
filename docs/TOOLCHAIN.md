# Source compatibility CI

The release gate requires all ten combinations below. This is a required test
matrix, not evidence that a workflow which has not run has passed. Consult the
Actions results for the exact commit being released. Discovery still accepts
newer LLVM versions and warns below its configured floor; this table adds no
upper bound.

| LLVM release | Linux runner | macOS runner |
| --- | --- | --- |
| 19.1.7 | ubuntu-24.04 | macos-15 |
| 20.1.8 | ubuntu-24.04 | macos-15 |
| 21.1.0 | ubuntu-24.04 | macos-15 |
| 22.1.0 | ubuntu-24.04 | macos-15 |
| 23.1.0 | ubuntu-24.04 | macos-15 |

`tools/ci-provision.sh` pins each upstream release to its full Git commit and
builds LLVM, clang, and libgc 8.2.8 from source. The same recipe works when a
package manager no longer provides a historical major. Cache entries include
platform, architecture, major, and the pinned dependency recipe identity emitted
by `tools/ci-provision.sh --identity <major>`. This read-only mode reports the
LLVM version and revision, libgc revision, and recipe identifier without creating
directories or building anything. Bump the recipe identifier when changing CMake
configuration or other dependency build semantics; logging edits do not require
rebuilding LLVM. A completion stamp and actual compiler versions are checked on
cache hits.
Cache visibility follows [GitHub's ref isolation rules](https://docs.github.com/en/actions/reference/workflows-and-actions/dependency-caching#restrictions-for-accessing-a-cache):
pull-request caches can warm reruns of that pull request, but not a release tag.
A first tag may therefore build cold until the default branch has populated the
same dependency keys. Tags still run every gate; cache access is not widened.
Validated dependencies are saved before Emit tests so a later test failure does
not discard the toolchain build. A missing release
or wrong major fails the job. A cold LLVM build can take hours; link parallelism
is limited to control memory use. Recipe 5 explicitly installs clang and its
required `clang-cpp` shared library, resource headers, llvm-config, the shared LLVM
library, and development headers for the
native target; unused tool executables, other target backends, and the clang
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
versioned filename. Only the exact preceding recipe 4 identity with identical
source pins and CMake flags can migrate without recompilation; unrelated cache
identities fail. The recipe 5 completion stamp is written after every probe
succeeds. Linux migration revalidates the same native dependency installation.
Every installation and cache hit compiles, links, and executes a small C program
with `clang -flto` and implicit linker selection, a C++ standard-library program,
an LLVM C-API program, and a complete native Emit runtime object linked with libgc.
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

The pins were checked against the official upstream release pages for
[19.1.7](https://github.com/llvm/llvm-project/releases/tag/llvmorg-19.1.7),
[20.1.8](https://github.com/llvm/llvm-project/releases/tag/llvmorg-20.1.8),
[21.1.0](https://github.com/llvm/llvm-project/releases/tag/llvmorg-21.1.0),
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

CI prepares this alias automatically when `timeout` is absent and verifies its
version before provisioning. Then run from the checkout:

```sh
dependencies=$(mktemp -d)
tools/ci-provision.sh 23 "$dependencies" > "$dependencies/environment"
set -a
. "$dependencies/environment"
set +a
tools/ci-check.sh 23
```

Provisioning uses the network. The emitted environment explicitly selects that
installation's `LLVM_CONFIG`, clang `CC`, clang++ `CXX`, and libgc paths. Keep
these variables together: setting only `LLVM_CONFIG` can leave a system clang
reading newer textual IR. Build and test logs include actual compiler versions.
Chez must be absent from PATH for compatibility checks. `ci-check.sh` builds
committed bootstrap IR, runs the native suite plus version, doctor, and
installation checks, and verifies the IR bytes did not change. It never invokes
regeneration or the development suite.

Pull requests, pushes to `main`, and release commits share
`.github/workflows/compatibility.yml`; failures are retained as workflow artifacts.
The release workflow additionally tests the exact packaged archive on both OSes
with network access and checkout reads denied. See [release preparation](RELEASE-PIPELINE.md).
