# Installation diagnostics

`emit doctor` is a read-only report on stdout. Narration and failures go to stderr;
`EMIT_VERBOSITY=quiet` suppresses narration while preserving the report. Exit zero
means required checks passed. A nonzero status identifies incomplete installation,
invalid resolver configuration, missing native inputs, or an incompatible AOT clang.
The command does not compile Scheme, populate caches, install files, or access the
network. Native version and discovery probes are bounded to five seconds each.

The first line gives Emit and build-time LLVM versions. Executable and compiled
prefix fields distinguish the running installation from its fallback location.
`cc` and libgc fields give effective values and origins: an explicit override,
shared discovery, or a compiled default. The libgc version comes from the selected
include directory's headers; unavailable metadata is reported as unknown and is
informational. Missing headers or link libraries fail the check. The current AOT
pipeline consumes textual LLVM IR, so the selected compiler must be clang at least
as new as the LLVM used to build Emit.

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
