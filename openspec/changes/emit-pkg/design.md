# Design

## Context

See `proposal.md` for the motivation, and the delta specs for the observable contract.

**Where packages go.** Since 0.12.0 the resolver consults a user library root at `$XDG_DATA_HOME/emit/lib`, falling back to `$HOME/.local/share/emit/lib`. It sits after the project and environment roots and before installed roots. `user_library_root()` in `src/emit.cpp` computes it, and `(user-library-root)` in `src/compile.ss` mirrors it.

**Library cache.** Cache entries are validated by a content digest of their sources (`sources_still_match`). A changed or removed source therefore invalidates an entry without any other action.

**Host process and filesystem access.** Emit has no host process access today. `(emit filesystem)` exists with this pattern:

- private runtime entry points in `src/runtime/runtime.c`;
- declarations in the primitive tables of `src/emit.ss` and `src/parse.ss`;
- a Scheme wrapper that turns status results into kinded errors.

The archived `add-filesystem-access` design gives the precedent and its size measurements. Editing the primitive tables is a compiler-source edit and crosses the `make regen` barrier.

**Version.** Scheme code cannot see the Emit version, because `(features)` carries none. The host knows `EMIT_VERSION` at compile time.

**Collection layout.** emit-packages keeps:

- library sources under `lib/`;
- per-package metadata at `packages/NAME/package.scm`, a `(package (name ...) (version ...) (summary ...) (license ...) (emit (minimum ...)) (upstream ...) (libraries ...))` form;
- tests and docs under `packages/NAME/`.

**GitHub endpoints.** Two have been verified:

- `GET https://api.github.com/repos/bwbensonjr/emit-packages/commits/main` with `Accept: application/vnd.github.sha` returns the bare commit SHA as the body;
- `https://codeload.github.com/bwbensonjr/emit-packages/tar.gz/<sha>` serves that commit's archive, with one top-level directory.

## Goals / Non-Goals

**Goals:**

- Write the package manager in Scheme on Emit's own libraries, so the tool exercises the language it serves.
- Make `(emit process)` the narrow first layer of a later, fuller process library without reserving names that library would want.
- Never lose or corrupt a user's file. Refuse before writing rather than repair afterwards.
- Make every behavior testable offline.

**Non-Goals:**

- Dependencies between packages, version constraints between packages, or more than one collection.
- Installing a version other than the one at the resolved commit. There is no pinning and no rollback to an older commit; `--from` a checkout at that commit covers both.
- Verifying signatures or checksums of archives. Trust rests on HTTPS to GitHub and on the protected `main` of emit-packages.
- Installing package tests, docs or license files. The record keeps the license name.
- A general subprocess API: pipes between children, writing to a child's input, environment or working-directory overrides, or asynchronous process objects.
- Windows. `posix_spawn` and the POSIX directory calls follow the existing POSIX-only runtime, and `docs/WINDOWS.md` gains an entry.
- Changing how linked user roots work. They stay hand-managed, and `pkg` refuses to touch them.

## Decisions

### D1. The tool is a Scheme program run by a thin C++ verb

The tool's code is split three ways:

- `lib/emit/pkg.sld` exports one entry procedure and holds all logic.
- `share/emit/pkg.scm` is the installed driver, `tools/pkg.scm` in the checkout, resolved by `support_file`. It is a few lines that import `(emit pkg)` and call that procedure with `(command-line)`.
- `emit pkg` in `emit.cpp` finds the driver, then calls the same code path `emit run` uses. It passes these arguments, in order: the driver path, then `--emit-version <EMIT_VERSION>`, then `--data-dir <dir>`, then `--`, then the user's arguments. `--data-dir <dir>` is passed only when `user_library_root()` yields one.

Because `(emit pkg)` is a shipped library, `emit build --stdlib --shared` precompiles it into the shared cache. A warm start then costs only the small driver compile, which is about 0.25 s, the same as a measured Malt import.

The host passes the version and data directory instead of the Scheme side recomputing them. Each fact then has one source: the version is the compiled constant, and the location is `user_library_root()`, so `pkg` can never disagree with the resolver about where the user root is. `pkg.sld` rejects a direct invocation that lacks those leading options with "run through emit pkg".

Alternatives considered:

- A C++ implementation would be faster to start, but it would add a large hand-written host surface and leave the language's process story unexercised.
- A shell script would depend on quoting and `sh` behavior, and could not share the resolver's facts.
- Adding the version to `(features)` (`emit-0.13.0`) or a `(emit-version)` procedure would change compiler-visible surfaces for one consumer. The argument is enough now, and either can come later.

### D2. `(emit process)` sits on spawn, read and wait primitives

There are three private runtime entry points, declared like the filesystem ones:

- `%process-spawn program args capture?` flushes Emit's buffered standard output and error. It then calls `posix_spawnp` with the argument vector built from the strings, inherited environment (`environ`), and, when capturing, a pipe whose write end is `dup2`'d onto file descriptor 1. It returns a pair `(pid . fd-or-#f)` on success, or an errno fixnum on failure.
- `%process-read-all fd` reads to EOF, closes, and returns a string built like `read-string` on a file port. It returns `#f` on a read error.
- `%process-wait pid` calls `waitpid`, retries on `EINTR`, and returns the exit code or the negated signal number.

The Scheme layer (`lib/emit/process.sld`) checks its argument types, raises a `'file`-kinded error naming the program on a spawn errno, and composes the primitives:

- `run-program` is spawn then wait;
- `program-output` is spawn, then read-all, then wait, returning `(values status text)`. Reading before waiting avoids a pipe-full deadlock.

The names are chosen to make room for a later library: the procedures are not prefixed with `process-`, which stays free for a future process-object layer (`process-wait`, `process-pid`). A later optional trailing options argument (`'(directory "...")`, environment, stdin) extends both procedures compatibly. The split primitives are exactly what such a layer needs, so nothing here has to be replaced.

Alternatives considered:

- `system(3)` brings in shell quoting.
- `fork`/`exec` by hand interacts badly with the GC's threads and is what `posix_spawn` exists to avoid.
- A single blocking "run and capture" primitive would need rewriting for the fuller library.

### D3. Filesystem additions follow the existing three-state pattern

There are two runtime entry points:

- `%filesystem-create-directory` uses `mkdir(path, 0777)`;
- `%filesystem-delete-directory path recursive?` uses an `lstat`-driven depth-first walk with `unlink`/`rmdir`, where links are never followed.

Each returns success or failure and is wrapped into file errors in `filesystem.sld`. The recursive walk is done in C rather than Scheme on `directory-list`, so the "is this a link?" check and the removal happen on the same `lstat` result without a Scheme round trip per entry. `create-directory` failing on an existing path is deliberate: D6's lock depends on it.

### D4. Source resolution: one commit per invocation

A networked subcommand performs four steps:

1. Run `program-output "curl" ("-fsSL" "--proto" "=https" "-H" "Accept: application/vnd.github.sha" URL)`, and require a 40-hex-character body. `--proto =https` forbids a redirect to plain HTTP.
2. Run `run-program "curl" ("-fsSL" "--proto" "=https" "-o" STAGE/archive.tar.gz CODELOAD/<sha>)`.
3. Run `run-program "tar" ("-xzf" archive "-C" STAGE/src)`, require exactly one top-level directory, and treat that directory as the collection tree.
4. Read `packages/*/package.scm` from the tree with `read`, never `eval`, and validate each form's shape.

With the testing override, step 1 is replaced by `EMIT_PKG_COMMIT`, and step 2 fetches `EMIT_PKG_ARCHIVE`. In that case the allowed protocols are `https,file`, which is the only way `file://` is accepted.

`--from DIR` skips steps 1 to 3 and uses `DIR` as the tree directly, so it needs neither `curl` nor `tar`. Files are then copied through text ports (read whole, write whole). Emit has no binary ports, and package files are Scheme source, so a test checks that non-ASCII text round-trips.

Tar safety: GNU tar and bsdtar both refuse absolute and `..` members by default. `pkg` also copies only the declared `lib/`-relative paths out of the extracted tree, after checking each one is a relative path without `..` components. Nothing else from the archive is ever placed.

### D5. On-disk state under `<data>/emit`

```
<data>/emit/
  lib/                         user library root (resolver input; pkg places files here)
  packages/
    NAME.scm                   committed record
    NAME.pending               journal while an operation is in flight
  .pkg-lock/                   exclusive lock (D6)
  .pkg-tmp/                    staging for one invocation; removed at the end
```

The record is a single datum written with `write`:

```
(emit-package
  (format 1)
  (name malt)
  (version "0.1.0")
  (license "MIT")
  (source (commit "5f214cc0..."))     ; or (source (directory "/abs/path"))
  (files "malt/learner.sld" "malt/learner/autodiff.sld" ...))
```

Ownership is the union of every `NAME.scm` `files` list. `list` reads only these records. `(format 1)` lets the record grow later, for example with an install timestamp. The record has no timestamp now, because Emit has no clock primitive that would be worth adding for this.

### D6. Write protocol: lock, check, journal, place, commit, clean

Every writing subcommand (`install`, `update`, `remove`) runs these steps in order:

1. **Lock.** `create-directory <data>/emit/.pkg-lock`. If it already exists, refuse and name the path. Every exit path releases the lock with `dynamic-wind`.
2. **Recover.** For each `*.pending` record, delete the files it lists that are not owned by a committed record, then delete the pending record and narrate the recovery.
3. **Check symbolic links.** Check `<data>/emit`, `lib/`, `packages/`, and every existing component on every path to be written or deleted. Any link refuses the invocation.
4. **Stage and check.** Build every package's file set in `.pkg-tmp/` and run every check in the spec: declared files, minimum version, and collisions. Do this for all named packages before writing anything under `lib/`.
5. **Journal.** Write `NAME.pending`, listing the union of old and new files, by writing a temporary file and then `replace-file`.
6. **Place.** Create missing directories, then `replace-file` each staged file into `lib/`. Staging lives on the same filesystem, so each placement is one rename. Then delete old owned files that are no longer declared, and prune directories this leaves empty.
7. **Commit.** `replace-file` the new record onto `NAME.scm`, then delete `NAME.pending`. For `remove`, delete `NAME.scm`.
8. **Clean.** Remove `.pkg-tmp`, then the lock.

Between steps 5 and 7, a crash leaves at most a pending record and a mix of old and new owned files. Step 2 of the next run removes exactly those. A crash after an update's step 5 therefore loses the package entirely instead of leaving it half-updated, and the narration says to install it again. That is acceptable: the files are reproducible from the collection, and nothing the user wrote is ever touched.

`list` takes no lock and writes nothing. If it sees a `*.pending` record, it reports that package as interrupted.

Alternatives considered:

- `flock` would need a new primitive and is advisory over NFS anyway.
- Placing the whole tree with one rename is impossible, because the user root is shared with the user's own files.
- Copy-then-delete placement loses atomicity per file.

### D7. Versions and output

The minimum check parses `X.Y.Z` into integers and compares the components lexicographically. A malformed version in `package.scm` refuses that package. The running version comes from `--emit-version`. A development build whose version is not numeric (for example `unknown`) passes the check with a narrated warning, so a checkout build stays usable.

For narration, `pkg.sld` reads `EMIT_VERBOSITY` with the same spellings `tools/log.sh` accepts. It writes `emit pkg: ...` lines to the current error port, and data only to the current output port. Child programs inherit standard error, so `curl -sS` prints its own error text, and `pkg` adds the program and exit status.

## Risks / Trade-offs

- **A compromised or broken `main` installs directly to users** → Protect `main` with the required "Package checks" status, and add a Linux job, before 0.13.0 ships. This is listed as an external prerequisite in the proposal. Recording the commit makes any affected install identifiable.
- **The GitHub API rate limit (60 unauthenticated requests per hour per IP)** → Only one API call is made per invocation, and the codeload download is not rate-limited the same way. The diagnostic suggests `--from` when the call fails.
- **`curl` or `tar` missing, or different, on a host** → Only POSIX-common flags are used (`-fsSL`, `--proto`, `-o`; `-xzf`, `-C`). Presence is checked up front with a named diagnostic, and `--from` needs neither.
- **The pipe-full deadlock in `program-output`** → Read to EOF before waiting (D2), with a test that captures more than 64 KiB.
- **Spawning from the JIT host with GC threads running** → `posix_spawnp` avoids running user code between fork and exec. A test spawns under `emit run` as well as in built executables.
- **Crash between journal and commit loses an update** → Recovery is narrated, and the next install restores the package. User files are never at risk (D6).
- **New runtime symbols cost executables that don't use them** → The libraries are non-baked and LTO drops unreferenced entry points. As with `add-filesystem-access`, stripped sizes with and without the import are measured and recorded.
- **Mixed bootstrap from an interrupted regen** → Finish every compiler-source edit (primitive tables) before one `make regen`, and make no further edits to those inputs until the full suites pass.

## Migration Plan

1. Phase 1 (compiler-source edits): the runtime entry points, primitive-table declarations, `process.sld` and the `filesystem.sld` additions, with their suites iterated through the Chez source driver. Then one `make regen` to convergence, followed by full native, units, classified reference suites and the source check.
2. Phase 2 (no regen inputs): `pkg.sld`, the driver, the `pkg` verb and help, install and uninstall lists, and the package-manager suite on `--from` and `file://` fixtures.
3. Phase 3: docs, the installed-layout probe, the emit-packages pinned suite path, and the version bump to 0.13.0 with its CHANGELOG entry.

Users who linked a checkout as their user root keep working unchanged, and `pkg` refuses to touch that link. To switch, they remove the link and run `emit pkg install`.

Rollback is a normal revert plus regenerated bootstrap. No persisted Emit data format changes. A user's `<data>/emit/packages` and placed files remain usable by the resolver even under an older Emit.

## Open Questions

- Whether `emit doctor` should report installed packages and stale locks. This is deferred, since doctor's provider rows already show the user root.

## Implementation Evidence

The pay-for-use check in `test/aot-tree-shaking-tests.sh` was measured through the Chez source driver on macOS arm64 on 2026-11-22.

| Probe | Stripped size | Unstripped size |
|---|---|---|
| `(display ...)`, no extension import | 35,624 bytes | 36,528 bytes |
| Program that calls `(run-program "true" '())` | 52,520 bytes | 55,232 bytes |

The importing program costs about 16.9 KB more. The equivalent `(emit filesystem)` probe in the same run cost 52,216 bytes, a similar delta, so the cost is mostly the shared error and string machinery an extension unit pulls in, not the process edges themselves.

The non-importing binary contains no `rt_process_spawn`, `rt_process_read_all` or `rt_process_wait` symbol, and no `emit.process:` symbol. The importing binary keeps `rt_process_spawn` and `rt_process_wait`, and LTO drops `rt_process_read_all` because `run-program` never captures.
