# Installation diagnostics

`emit doctor` is a read-only report on stdout. Narration and failures go to stderr;
`EMIT_VERBOSITY=quiet` suppresses narration while preserving the report. Exit zero
means required checks passed. A nonzero status identifies incomplete installation,
invalid resolver configuration, missing native inputs, or an incompatible AOT clang.
The command does not compile Scheme, populate caches, install files, or access the
network. Native version and discovery probes are bounded to five seconds each.

The first line gives Emit and build-time LLVM versions. Executable and compiled
prefix fields distinguish the running installation from its fallback location.
The `toolchain` field names the layer that selected LLVM for the AOT link:
`override` (`EMIT_LLVM_BIN`/`LLVM_CONFIG`, or explicit `CC`/`GC_INC`/`GC_LIB`
together), `package` (an installed toolchain pin), or `discovery`. The
`toolchain pin` field gives the pin file's path, or `none`.
`cc` and libgc fields give effective values and origins: an explicit override,
a package pin, shared discovery, or a compiled default. The libgc version comes from the selected
include directory's headers; unavailable metadata is reported as unknown and is
informational. Missing headers or link libraries fail the check. The current AOT
pipeline consumes textual LLVM IR. An upstream clang older than the LLVM used to
build Emit fails the check. Apple clang uses vendor version numbers, so doctor
reports its textual-IR compatibility as `unverified` without failing solely for
that version. This status does not prove that every emitted program will compile;
use the LLVM installation's clang through `CC` for a matching upstream compiler.

Support fields name the discovery script, its logging dependency, and the runtime
C source. The shipped payload count checks the build's installation inventory,
independently of resolver opt-outs. This permits diagnosis of an intentionally
restricted resolver without mistaking its disabled roots for an incomplete install.

Provider rows use the same prepared resolver as compilation. They show the project
manifest, explicit `-L` roots, `EMIT_LIBRARY_PATH`, project `lib/`, and installed
manifest/root tiers in order. Manifest providers are readable by construction;
directory rows explicitly report availability. Duplicate physical directory roots
are suppressed as in compilation. Candidate rows show optional installed manifest
locations, including absent old prefixes after relocation.

Doctor accepts `--manifest`, repeated `-L`/`--library-path`,
`--no-manifest-chain`, and `--no-library-paths`; `EMIT_MANIFEST` and
`EMIT_LIBRARY_PATH` retain their usual meaning. Missing optional project roots or
unused fallback locations do not fail a healthy install. Unknown options, extra
positional arguments, missing explicit manifests, and empty environment path-list
elements are errors. Help is available through `emit doctor --help`, `-h`, or
`emit help doctor`.

The operating system must first load Emit's linked LLVM and libgc. If a loader
error prevents startup, restore the system dependencies used to build Emit or
rebuild it against the installed toolchain; doctor cannot inspect a process that
cannot start.
