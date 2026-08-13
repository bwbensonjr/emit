## Context

See `proposal.md` — Why, and `docs/PERFORMANCE.md` P3 for the measurements.

Three facts about the current code shape the approach:

1. **The shipped binary has no artifact cache.** `seed_session` → `register_baked_set`
   (`src/emit.cpp`) drives mode 8 = `run-register-baked-set` (`src/repl-core.ss`) →
   `compile-baked-set` (`src/core.ss`) at every process start.  `preload_user_libraries`
   recompiles every reached `.sld` via mode 4.  The `artifacts-fresh?` +
   `build/lib/*.{ll,exports,stamp}` cache belongs to the *Chez driver* (`src/compile.ss`) and is
   reachable only from `chez --script`.
2. **The write side of the artifact format already exists Chez-free.**  `emit lib` (mode 11,
   `src/emit.cpp:1602-1636`) writes `.ll` + a readable `.exports` datum of the shape
   `((mylib) ((greet . "mylib:greet")) ((greet "mylib:code:greet" 0)))`.  The module system already
   requires that a driver holding the table plus the unit "SHALL have everything needed to resolve
   references into the library with no access to the library's source."  Nothing reads one back.
3. **The host can already identify itself.**  `exe_path()` (`src/emit.cpp:294`) exists for the
   manifest search path's executable-relative candidates, so keying on the running binary needs no
   new mechanism.

**The prerequisite investigation is resolved, and there is no anomaly.**  An earlier note in P3
(committed in `7b7538b`, since corrected) reported that `emit repl` with no resolvable manifest
starts in 0.01 s while still evaluating a `(scheme base)` procedure correctly, and asked whether the
process's already-linked `(scheme base)` was reusable or whether that path was a dev→ship fidelity
gap.  That was a conflation of two different invocations.  Measured properly:

| case | time | `map` bound? |
|---|---|---|
| `emit repl`, manifest, prelude | 2.05 s | yes |
| `emit repl`, manifest, `--no-prelude` | 1.69 s | **no** |
| `emit repl`, no manifest, prelude | 1.87 s | yes |
| `emit repl`, no manifest, `--no-prelude` | 0.05 s | no |

No case both starts instantly and has a standard library.  The REPL bakes from `*prelude-source*`
like the run door (~1.9 s), which is consistent and correct.  So there is **no** cheap
reuse-the-linked-unit win to design around, and **no** fidelity hazard to fix first.  The design
below therefore proceeds on the ordinary caching path.

That measurement did surface one unrelated defect, out of scope here: `emit repl --no-prelude` with a
manifest present spends 1.69 s compiling `(scheme base)` from the manifest and then does not bind it
— ~1.6 s of pure waste against the 0.05 s floor, and arguably contrary to the existing
`--no-prelude` parity requirement ("the entry SHALL … emit no `(scheme base)` IR").  Filed as GitHub
issue #101.

## Goals / Non-Goals

**Goals:**

- Recover the ~1.43 s Scheme-level compile of the standard library on every Chez-free door.
- One mechanism serving the baked set and user libraries, and behaving the same in a checkout and an
  install.
- Transparency that is *verified* by construction, not asserted.

**Non-Goals:**

- The remaining ~0.30 s of IR parse/JIT (would need a `.bc`/`.o` layer — independent, and better
  measured once the larger half is gone).
- Any change to `src/compile.ss`'s existing `build/lib` cache. It keeps working as it does; this
  change does not unify the two.
- The `emit repl --no-prelude` waste noted above.
- P8 and P11 (see `proposal.md`).

## Decisions

### D1 — Cache the IR text and export table, not bitcode or objects

The `--emit` measurement splits the 1.72 s into ~1.43 s of Scheme-level compilation and ~0.30 s of
LLVM parse + JIT. Caching the text recovers 83% of it with no LLVM-side work, no target/ABI
sensitivity, and no new file formats — the two artifacts are exactly what `emit lib` already writes.

*Alternative — precompile to `.bc`/`.o`* (what the P3 backlog entry originally proposed): attacks the
smaller half, and introduces target- and ABI-specific artifacts whose validity is harder to
establish than "same compiler, same source." Deferred, and cheaply measurable afterwards.

### D2 — Compiler identity is a hash of the running executable, not of the compiler sources

The Chez driver hashes `compiler-source-files` and says why: "in this driver path the compiler runs
as interpreted source, so those files are on disk at run time — hashing them IS the running
compiler's identity." For the shipped binary that reasoning **inverts**: the compiler is compiled in,
so the sources on disk are not what is running, and in an install they may not be present at all.
Hashing them would be both wrong and impossible.

So the Chez-free key hashes the executable located by `exe_path()`. It is self-evidently correct — a
different compiler is a different binary — and costs one ~1.7 MB FNV-1a pass, roughly 1–2 ms against
the 1.43 s being saved.

*Alternatives:* a stamp constant baked in at build time (zero I/O, but needs build plumbing and can
silently go stale if a build path forgets to regenerate it — a possible later optimization once the
win is banked); `stat` of mtime + size (cheapest, but two different binaries can share both, and
installs routinely preserve mtimes — a wrong-reuse risk in exchange for ~2 ms).

### D3 — Mirror the existing stamp format and its deliberate-invalidation lever

The sidecar keeps the `(emit-artifact-stamp VERSION HEX-DIGEST)` shape and its own hand-bumped
version integer, so a change to the cache format can force a global invalidation on purpose. FNV-1a
is kept for the same reason it was chosen: no new dependency, and it guards against accidental
staleness rather than adversarial collision. Torn writes fail safe toward rebuild, as
`artifacts-fresh?` already does by writing the stamp last.

### D4 — One cache location, resolved by a documented search order, with an env override

Order: `$EMIT_CACHE` if set; otherwise the platform user cache directory; otherwise **no caching at
all** (compile from source, silently, and succeed). `EMIT_CACHE` follows the established
`EMIT_MANIFEST` / `EMIT_PREFIX` naming.

A checkout deliberately does **not** get special treatment — it does not reuse `build/lib`. One
location means a door behaves identically in a checkout and from an install, which is the same
argument dev→ship fidelity makes elsewhere in this project; two locations would mean two code paths
and a class of bug that only appears for installed users.

The install contract (`installed-emit-completeness` deliberately ships no compiled artifacts) is
**unchanged**: nothing is shipped or installed, and every entry is derived locally on demand and
regenerable from source. That contract objects to *shipped* artifacts because they put staleness on
the install surface; a locally derived, keyed, regenerable cache has neither property.

### D5 — The baked set is cached and invalidated as a whole, not per member

`compile-baked-set` walks `baked-library-entries` and emits the partition as **one** stream, because
a member may import another and the lone-`define-library` path resolves no imports — the same reason
`tools/regen.sh` takes every baked module from one `--emit`. The cache follows that grain: one entry
covering all members in dependency order, valid or invalid together. Caching members independently
would invite a set that is individually fresh and mutually inconsistent.

### D6 — Transparency is verified by a cold-vs-warm byte-identity check

The specs require that no door's output depend on cache state. That is testable directly: compile the
demo corpus with an empty cache and again with a warm one and require byte-identical emitted IR,
in the discipline `test/module-scaffold-baseline.sh` already establishes for IR stability. This is
the load-bearing test of the change; the timing improvement is the easy part to confirm.

### D7 — Every failure path compiles from source

A miss, a stale or corrupt entry, an unreadable file, an uncreatable or unwritable directory, and a
concurrent partial write all lead to the same place: compile from source and succeed. The cache is
never consulted for correctness, so it cannot introduce a new failure mode. This is what makes D4's
"otherwise no caching at all" acceptable rather than a silent degradation to worry about.

### D8 — Writes are atomic, because the test suites are parallel

`run-all-tests.sh` and the R7RS suite run many `emit` processes concurrently (`EMIT_JOBS`), so
several will race to populate a cold cache on the very first run after a rebuild. Entries are
therefore written to a temporary file and atomically renamed into place, with the stamp last. A
loser of the race overwrites with identical bytes, and a reader either sees a complete entry or
falls back per D7. No locking.

## Risks / Trade-offs

- **A stale entry is used and silently yields a wrong compile** → the worst outcome, and the reason
  D2 keys on the binary itself rather than on mtimes. Layered: executable hash, source content hash
  including the `include` closure, a format version for deliberate invalidation, and stamp-written-
  last so a torn entry reads as absent.
- **Concurrent first-run population under parallel suites** → D8's atomic rename; a partial entry is
  never trusted.
- **Entries accumulate across compiler rebuilds** — every `make regen` changes the key, so a
  developer's cache grows one baked set per compiler build → bounded to a cache directory the user
  can delete; a prune policy is an open question, not a blocker.
- **`src/repl-core.ss` is in `CORE_FLAT`** → this change requires `make regen`, must reconverge, and
  must reproduce `bootstrap/` byte-identically. The `make regen` barrier in `CLAUDE.md` applies.
- **The win is easy to mis-measure** → the acceptance figures must be taken on a comparatively idle
  machine, and reported as cold-vs-warm on the same machine in the same session. The load caveat now
  recorded in P3 applies to any re-measurement.
- **Trade-off accepted:** ~1–2 ms of hashing on every door invocation, including the cold path where
  it buys nothing, in exchange for a key that cannot be wrong.

## Migration Plan

No migration: the cache starts empty and populates itself. Rollback is deleting the cache directory
and reverting the change; nothing persists that a later `emit` depends on. Because a cold cache is
exactly today's behavior, the change can be verified against `HEAD` by simply pointing `EMIT_CACHE`
at an empty directory per run.

## Open Questions

- **Pruning.** Should the cache bound its own size, or is "delete the directory" enough? Answerable
  after seeing how fast it grows in practice; it changes no spec, no approach, and no task here.
- **A `.bc`/`.o` layer for the remaining ~0.30 s.** Independent of everything above and best decided
  on a measurement taken once this lands.
