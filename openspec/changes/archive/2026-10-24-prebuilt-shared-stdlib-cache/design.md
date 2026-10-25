# Design

## Context

**Where entries live today.** Cache entries are found through `cache_dir()` (`src/emit.cpp:1535`).
It resolves to a single directory:

1. `$EMIT_CACHE`;
2. otherwise `$XDG_CACHE_HOME/emit`;
3. otherwise `~/Library/Caches/emit` on macOS, or `~/.cache/emit` elsewhere.

**How paths are built.** Two functions build every entry path under that directory:

- `cache_entry_stem` (`src/emit.cpp:1583`) for the portable `baked-`, `unit-`, and `shake-` entries;
- `native_stem` (`src/emit.cpp:2086`) for `native-baked-` and `native-unit-` entries.

`cache_load_entry` and `cache_store_entry` (`src/emit.cpp:1765`, `:1845`) read and write through
those paths.

**What keys an entry.** An entry's name and stamp hold the cache format version and
`compiler_digest()`, the FNV-1a hash of the running executable's bytes (`src/emit.cpp:1506`). A
`unit-` entry also holds a digest of its library's canonical absolute path. Its `.sources` file
records the content digests of the library's sources and includes, which are checked on every load.
A native entry's key adds the JIT environment: target triple, data layout, host CPU name and
features, LLVM version, relocation and code models, and optimization profile (`src/emit.cpp:2279`).

**What preparation costs.** `emit build --stdlib` (`warm_stdlib`, `src/emit.cpp:3711`) prepares 11
portable and 11 native entries in whatever `cache_dir()` resolves to. Measured on Apple Silicon with
the installed 0.2.1:

| Measurement | Value |
|---|---|
| Cold preparation | 18.7 s |
| Of which portable IR | about 15.5 s |
| Of which native objects | about 3.2 s |
| Cache size | 7.5 MB (1.1 MB gzipped) |
| Native objects' share of the size | about 2.0 MB |

**How the payload is found.** The installed payload is found by `support_file()`
(`src/emit.cpp:596`), which tries these locations in order:

1. the checkout root;
2. `<exe>/../share/emit` (symlinks resolved);
3. the compiled-in `EMIT_PREFIX`.

**How each channel installs.**

| Channel | How it installs | Install-time warming |
|---|---|---|
| Homebrew | `make install` straight into the keg | disabled with `WARM_STDLIB=0` |
| Nix | `make install` into `$out`; `fixupPhase` then strips binaries and `postFixup` wraps `bin/emit` | disabled with `WARM_STDLIB=0` |
| OCI | `make install` at `/opt/emit` in a builder stage; the tree is copied to the same path in the final stage | disabled with `WARM_STDLIB=0` |

A plain `make install` warms the installing user's cache, except when it runs as root or with
`DESTDIR` set.

**Constraint on acceptance.** Channel acceptance (`tools/channel-accept.sh`) already digests the
installed payload before and after its checks. It requires the payload to be unchanged.

## Goals / Non-Goals

**Goals:**

- A packaged or `make install`ed Emit has its shipped libraries prepared before any user runs it.
- No new entry format, key, or validity rule. A shared entry is valid exactly when a user-cache
  entry with the same bytes would be.
- Ordinary commands never write into the installation. The shared cache stays a disposable
  accelerator.
- When the shared cache doesn't fit the binary that uses it, the failure is visible: in doctor, in
  verbose narration, and in channel acceptance.

**Non-Goals:**

- Relocatable source identity. A shared `unit-` entry is valid only at the path where it was
  prepared.
- CPU-generic native objects. A shared native object built on another CPU is a miss. The portable
  entries still cover about 85% of the cost.
- Shipping profiles other than `-O1`, or user libraries, in the shared cache.
- Preparing a shared cache for staged (`DESTDIR`) installs, or for distributor packages that build
  in one place and install somewhere else.
- Homebrew bottles.

## Decisions

### D1 — Two lookup tiers, one write tier

Entry lookup produces an ordered list of candidate paths: the shared directory first, then the user
cache directory. Writes always use the user candidate.

- **Where it changes.** `cache_entry_stem` and `native_stem` keep their meaning for writes. A new
  lookup variant returns both stems, and the load paths try them in order.
- **Portable entries.** The callers are `cache_load_baked_set`, the unit loader near
  `src/emit.cpp:2035`, and the shake loader near `:2453`. They go through one helper that tries the
  shared stem, and then the user stem when the result isn't `Hit`.
- **Native entries.** The native loaders near `:2244` and `:2262` do the same.
- **Shake entries.** Only `emit build` produces `shake-` entries, and preparation never does, so
  they will always miss in the shared tier. Sending them through the same helper costs one failed
  `stat` and saves a special case.

*Alternative: copy shared entries into the user cache on first use.* Rejected. It doubles disk use
and adds a write path, and it gains nothing because reads from either tier cost the same.

### D2 — The shared directory is `share/emit/library-cache` beside the payload's manifest

The default shared directory is the directory holding the shipped manifest that `support_file()`
resolves for the running executable, plus `/library-cache`.

- **Installed.** This is `<prefix>/share/emit/library-cache`.
- **Checkout.** It is `<repo>/library-cache`, which doesn't exist, so checkout builds and the test
  suites behave as they do today.
- **Environment variable.** `EMIT_SHARED_CACHE` overrides the default. A path relocates the shared
  cache. The empty string disables it.
- **Why the override exists.** Checkout tests need it to exercise the shared tier. Users need it to
  rule the shared tier out when diagnosing a problem.

*Alternative: a `cache` directory.* Rejected. The name is too likely to collide with something a
user creates. A dedicated `EMIT_PREFIX`-only lookup was also rejected, because it would ignore
relocated installs and duplicate `support_file()`.

### D3 — `--shared` builds a fresh directory and swaps it in

`emit build --stdlib --shared` runs the existing `warm_stdlib` with two changes:

- The shared tier is disabled.
- `cache_dir()` is overridden to a new sibling directory, `library-cache.tmp-<pid>`.

It runs with `umask(022)` and creates directories with mode `0755`, not `mkdirs`' private `0700`, so
the result is readable by everyone. After every entry has been persisted and verified, it replaces
the old cache in three steps:

1. Rename the old `library-cache` aside.
2. Rename the new directory into place.
3. Remove the old one.

If anything fails, the temporary directory is removed and the command exits non-zero, naming the
destination. Because the old directory is renamed aside first, an interruption leaves the old cache,
no cache, or an orphaned temporary directory, which the next preparation removes. It never leaves a
partially built cache in place.

**Why build from scratch every time.** Each preparation runs the whole 18 s compile. That guarantees
the shared cache holds entries for exactly one executable, and that nothing from a user's cache, or
from a cache someone else prepared, leaks into a file every user trusts.

### D4 — Installation always prepares when the final location is known

`make install` runs `"$(BINDIR)/emit" build --stdlib --shared` after the payload, the support files,
and the toolchain pin are in place. It does this whenever `DESTDIR` is empty and `WARM_STDLIB` isn't
`0`.

- **Privileged installs** are no longer deferred. The reason they were deferred, populating the
  wrong user's cache, doesn't apply to the shared cache.
- **The installing user's cache is no longer warmed.** The shared cache serves that user too.
- **Failure** is still best-effort. It is narrated with the retry command, and the install still
  succeeds.
- **`make uninstall`** removes `$(SHAREDIR)/library-cache` with `rm -rf`. That is safe because the
  directory is wholly derived.
- **`WARM_STDLIB` keeps its name and meaning.** Setting it to `0` skips library preparation, and
  existing packager invocations keep working.

### D5 — Each channel prepares against its final executable bytes

**Homebrew.** The formula drops `WARM_STDLIB=0`, so `make install` prepares the cache inside the
keg. It also drops the `caveats` block.

- **Risk.** Homebrew may rewrite the binary after `install`: `fix_dynamic_linkage` and ad hoc
  re-signing. Today's binary already links only to `opt/` paths (checked with `otool -L` on the
  installed 0.2.1), so no rewrite is expected.
- **Check.** The formula's `test do` asserts that `emit doctor` reports the shared cache as
  matching, which makes that expectation a tested fact.

**Nix.** The package keeps `WARM_STDLIB=0` in `installFlags`. It prepares the cache at the end of
`postFixup`, after `wrapProgram`:

```
EMIT_SHARED_CACHE=$out/share/emit/library-cache $out/bin/emit build --stdlib --shared
```

- **Why so late.** `fixupPhase` strips, and on Linux patches, `bin/emit`. A cache prepared during
  `installPhase` would describe bytes that no longer exist.
- **The wrapper.** It only renames the real binary to `.emit-wrapped`. The executable digest is
  taken from the bytes, so the rename doesn't affect it.
- **The sandbox's `HOME`.** It is `/homeless-shelter`. That doesn't matter, because `--shared`
  never touches the user cache.

**OCI.** The builder stage drops `WARM_STDLIB=0`, so its `make install PREFIX=/opt/emit` prepares
`/opt/emit/share/emit/library-cache`. That tree is copied byte for byte into the final stage at the
same path. The native objects record the CPU of the GitHub runner that built the image, so on other
hosts they miss and the portable entries carry the benefit.

**Acceptance.** `tools/channel-accept.sh` adds two checks. Doctor must report the shared cache as
present and matching. A `build --stdlib` run against an empty private `EMIT_CACHE` must report every
portable entry as reused from the shared cache. Native counts are not asserted, because a published
image re-tested on another runner legitimately regenerates them. The existing payload digest
comparison already proves that no command wrote into the shared cache.

### D6 — Doctor and narration name the tier

**Doctor.** `emit doctor` adds two informational lines.

- `user cache: <path> [<origin>]`
- `shared cache: <path> [<origin>; <state>]`

The origin is one of `installation`, `EMIT_SHARED_CACHE`, or `disabled`. The state is one of
`absent`, `<n> entries, matches this executable`, or `<n> entries, built by another executable`.
A match means the `baked-` stamp named by the current `compiler_digest()` is present. Doctor reads
stamps only. It does not compile or write anything, and these lines never fail it.

**Narration.**

- **Verbose cache messages** gain a tier word, for example `cache: baked set reused [shared]` and
  `native object reused for scheme.char -O1 [shared]`. A shared miss that falls through narrates the
  shared rejection reason before the user-cache lookup.
- **The `--stdlib` summary line** keeps its `portable N reused/M generated` shape, so existing tests
  and scripts still match. When some entries came from the shared tier, the line adds
  `(K shared)`.
- **`docs/OUTPUT.md`** is updated if it lists these phrases.

## Risks / Trade-offs

**A packaging step rewrites the binary after preparation.** Every shared entry then misses silently,
and users are back to today's behavior. Mitigation (D5): doctor's match line, the Homebrew
`test do` assertion, and channel acceptance turn this into a failure.

**Relocating an installed prefix.** `unit-` entries key on canonical source paths, so after a move
they miss. The `baked-` entries carry no source path and still hit. This is documented as the
existing "relocation may invalidate cached paths" behavior; no new code.

**Nix output purity.** Shared native objects depend on the build machine's CPU. Two builds of the
same derivation on different CPUs therefore produce different `$out` contents (`nix build --check`
reports a difference), though either output works everywhere. This is accepted because the flake is
built locally in practice.

- *Fallback.* If it becomes a problem, Nix can prepare portable entries only.
- *What that would need.* A `--portable-only` flag on `emit build --stdlib`, which this change does
  not add.

**Install time and size.** Every channel build takes about 20–25 s longer, and installs grow by
about 8 MB. The maintainer accepted both when choosing this change.

**Tests that expect a cold standard library in an installed Emit** (`test/install-layout-tests.sh`,
acceptance checks of compile narration) change meaning. They must disable the shared tier
explicitly with `EMIT_SHARED_CACHE=` or assert the new behavior.

**Version.** This is a minor bump (0.3.0). `make install` no longer warms the user's cache and
now writes about 8 MB into the prefix, which is an incompatible change to installer behavior. The
`CHANGELOG.md` section says so.
