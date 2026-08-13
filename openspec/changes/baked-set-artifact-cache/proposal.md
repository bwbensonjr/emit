## Why

Every `emit run`, `emit build`, and `emit lib` process recompiles the whole standard library from
source before it does anything else. Measured on a trivial `(display 1)`: **1.72 s of a 1.80 s run**,
of which ~1.43 s is the Scheme-level compile of the baked-in `*prelude-source*` (118 KB of
`src/prelude.scm`) and ~0.30 s the JIT of the 953 KB of IR it produces. Nothing about that work
varies with the program being compiled, and it is repeated on every invocation, forever.

The cost is not marginal, it is most of the development loop. `./run-all-tests.sh` is 28 suites /
1605 s, and across the 431 processes countable exactly (1017 s of it) this fixed cost is **~74%**.
Almost every suite sits at ~2.0–2.4 s per process against a 1.80 s floor, i.e. the suites spend most
of their wall clock re-deriving the same library rather than testing anything. `emit repl` pays it as
startup latency, on the loop `CLAUDE.md` names primary.

It also grows with every standard-library addition — the same mechanism `PERFORMANCE.md` P8 records
for binary size, with the clock as the axis. This is backlog item **P3**, re-measured 2026-08-13 and
re-rated low → high; its previously recorded figure of 0.12 s was stale by more than an order of
magnitude.

The fix is smaller than the backlog entry assumed. Because the compile half is 5× the JIT half,
caching the **IR text alone recovers ~83%** — no `.bc`/`.o`, no LLVM-side work. And the hard part is
already built: an export table is a readable datum, and `emit lib` already *writes* `.ll` +
`.exports` Chez-free. Nothing ever *reads* one back.

## What Changes

- **A cache of compiled library units for the Chez-free doors.** A unit is compiled once and reused
  by later processes, keyed so that a stale entry can never be used. `emit run`, `emit build`,
  `emit lib`, and `emit repl` all consult it.
- **A new compiler-core entry point that registers a library unit into a session from a prebuilt
  unit + export table, without compiling.** This is the missing read side of the export-table
  contract the module system already specifies.
- **The baked standard library becomes a cache client.** Today `register_baked_set` (mode 8) drives
  `compile-baked-set` on every process start; it will reuse a cached set when one is valid.
- **User library units become cache clients too.** `preload_user_libraries` recompiles every `.sld`
  in a program's import closure at every invocation; it will reuse cached units on the same terms.
- **The cache is transparent, never load-bearing for correctness.** A miss, a stale entry, an
  unreadable entry, or an unwritable cache directory SHALL fall back to compiling from source and
  succeed. No door acquires a new failure mode, and no program's emitted IR depends on whether the
  cache was warm.
- **The cache works from an install, not only a checkout** — it needs a user-writable location,
  since `<prefix>/share/emit/` is not writable and the existing `build/lib` is checkout-only.

Explicitly **not** in scope: P8 (tree-shaking on the `emit build` door) and P11 (the `runtime.c`
recompile, measured at 0.16 s / 5% and deliberately not scheduled). Precompiling units to `.bc`/`.o`
is also out — it attacks the 0.30 s JIT half and can follow independently once the 1.43 s is gone.

## Capabilities

### New Capabilities

- `artifact-cache`: A keyed, self-populating, transparent cache of compiled library artifacts for
  the Chez-free doors. Covers what identifies a cache entry (compiler identity + source identity),
  where entries live for both a checkout and an install, when an entry may be reused, and the
  requirement that every failure path degrades to compiling from source rather than to an error.

### Modified Capabilities

- `compiler-embedding`: gains an entry point that registers a library unit into the session from a
  prebuilt unit module + export table with no compilation, alongside the existing per-form and
  whole-program entries. The dev→ship fidelity requirement is extended to state that a session
  seeded from cached units is indistinguishable from one seeded by compiling them.
- `module-system`: the Chez-free doors' library resolution gains artifact reuse, and the existing
  freshness rule ("An artifact is stale when a file it included changes") is extended to cover the
  baked set and the Chez-free doors, which it currently does not reach.

## Impact

- `src/repl-core.ss` — a new mode for register-from-prebuilt; `run-register-baked-set` becomes
  cache-aware. In `CORE_FLAT`'s regen set, so this change requires `make regen`.
- `src/core.ss` — `compile-baked-set` grows a reuse path; the export table gains a read
  counterpart to the writer it already has.
- `src/emit.cpp` — host-side cache I/O (locate, read, write, invalidate) for `seed_session`,
  `register_baked_set`, and `preload_user_libraries`. Host C++, so it reaches the binaries through
  plain `make`, not regen.
- Cache location and key interact with `artifact-compiler-stamp` (the existing stamp) and with the
  `installed-emit-completeness` install contract, which deliberately ships no compiled artifacts —
  a *derived, local, regenerable* cache is consistent with that, but the reasoning must be recorded.
- No change to emitted IR, to any door's output, or to the AOT ship path. The self-hosting fixed
  point must still converge and `bootstrap/` must be reproduced byte-identically.
- Two measurements become the change's acceptance evidence: a trivial `emit run` should approach its
  0.08 s `--no-prelude` floor, and `./run-all-tests.sh` should drop substantially from 1605 s.
