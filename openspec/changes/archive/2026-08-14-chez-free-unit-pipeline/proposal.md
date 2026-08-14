## Why

The Chez-free doors now own every shipping path — `emit run`, `emit repl`, `emit build`, `emit lib`
— but their library-unit pipeline is finished only where the last three changes reached into it.
Three known gaps remain, all on the same seam (how a door obtains a library unit), and all three
have measurements already in hand:

- **`emit repl --no-prelude` compiles `(scheme base)` from the manifest and then does not bind it**
  (issue #101): 1.69 s against a 0.05 s floor, ~1.6 s of work performed and discarded. The REPL door
  seeds user libraries with mode 5 (every manifest entry, `(scheme base)` included) while the run
  door uses mode 9 (the same list minus `(scheme base)`, which is baked). `--no-prelude` suppresses
  the auto-import but not the load, so the compile happens and nothing consumes it.
- **The artifact cache covers only the baked set.** `baked-set-artifact-cache` deferred user-library
  caching (its tasks 4.3 and 5.2) because keying a user library needs the include closure of its
  `.sld`, and the Chez-free include reader tracks nothing — only the Chez driver's `*includes-read*`
  does. Every process that imports a user library still recompiles it, ~0.4–0.9 s.
- **`emit build` does not tree-shake** (`docs/PERFORMANCE.md` P8). The Chez AOT driver ships 34,720 B
  for `hello.scm`; `emit build` ships 134,248 B of the same program, and the unshaken IR is also
  ~23% of that door's 2.95 s wall clock. The size of a standalone binary is currently a function of
  *which door built it*, and only the door that is not the product honours the flagship
  small-executable goal.

They are one change because they are one seam and one regen barrier. P8 in particular cannot be
designed apart from the cache: shaking recompiles a unit against a root set, and a cache-seeded
session (mode 14) holds no body forms to recompile, so a shake bolted on naively would spend the
1.43 s that `baked-set-artifact-cache` just recovered in order to save ~0.68 s of LTO — a net loss
on the metric that change was landed to fix.

## What Changes

- **The REPL door's library seeding converges on the run door's.** The REPL preloads manifest
  libraries through the `(scheme base)`-omitting path (mode 9) rather than mode 5, in both prelude
  and `--no-prelude` sessions. Every door registers the baked set, so the manifest's `(scheme base)`
  entry is redundant with the prelude and forbidden without it. Fixes #101; the REPL stays eager
  (open world) for genuine user libraries — only the baked member leaves the preload list.
- **The artifact cache is extended from the baked set to any library unit.** A user library gets the
  cache's second key half: the identity of its source, which is its `.sld` **plus its include
  closure**. Entries continue to be transparent, best-effort, and self-populating.
- **The Chez-free include reader tracks what it read.** `src/include-reader.ss` accumulates the
  resolved token of every file the include family opens, and the core gains a query for the closure
  a library's registration consumed — the Chez driver's `*includes-read*`/`library-includes`
  arrangement, on the shipped side. This is the missing input to the key above, and it is also what
  lets a stale entry be detected when only an included fragment changed.
- **`emit build` tree-shakes, and its shaken units are cache entries.** The door drives the existing
  `compile-library*` reachability pass over each prunable unit, with roots read out of the emitted
  program IR exactly as `src/compile.ss` does today. The result is stored under a key that adds a
  digest of the root set to the two halves above, so the first build of a program pays the
  recompile and every rebuild of it hits warm. The run/REPL/JIT doors keep full units (open world),
  unchanged.
- Not in scope: P11 (`runtime.c` → bitcode, 0.16 s), precompiling units to `.bc`/`.o` (the ~0.30 s
  JIT half), issue #29's curation of the `(scheme base)` export surface, and any change to
  `src/compile.ss`'s own `build/lib` cache.

## Capabilities

### New Capabilities

*(None. The cache capability already exists; this change widens its subject.)*

### Modified Capabilities

- `artifact-cache`: today the capability is written about "the baked standard library". It becomes a
  cache of **library units**, with three requirement additions: a user library's source identity
  (its `.sld` and include closure) as the second half of the key; a shaken unit as a distinct,
  root-set-keyed entry that can never be served to a door that wants the full unit; and the
  existing transparency, degradation, install, and narration requirements restated over the wider
  subject so that a user library or a shaken unit inherits them rather than being a second regime.
- `aot-codegen`: the tree-shake requirement currently applies to "the AOT backend" but is satisfied
  only by the Chez driver, and its "SHALL apply ONLY to the AOT/build door" clause reads as if
  there were one such door. It gains the requirement that **every** ship door shakes, so that a
  delivered executable's size does not depend on which driver produced it, with the door-parity
  scenario stated in bytes.
- `compiler-embedding`: gains two entry points beside the existing prebuilt-registration one — a
  query for the source files a library's registration read (its include closure), and a recompile of
  an already-registered library against an explicit root set. The `--no-prelude` parity requirement
  is tightened so that "emits no `(scheme base)` IR" is a statement about work performed, not only
  about IR handed back: no door may compile the standard library under `--no-prelude`.
- `interactive-repl`: the "session's standard library does not depend on the manifest" requirement
  gains the converse — the session's standard library also does not *come* from the manifest, and a
  manifest entry naming a baked member costs nothing in either prelude mode.

## Impact

- `src/emit.cpp` — `preload_libraries` (REPL) moves to the mode-9 index for its first manifest too;
  `preload_user_libraries` becomes cache-aware; the cache gains a per-unit key half and a shaken
  variant; `emit_build` gains a shake step between `compile_program` and the temp-`.ll` write.
- `src/repl-core.ss` — new modes: include-closure query, and shake-to-root-set. **In `CORE_FLAT`, so
  this change requires `make regen`** (one barrier for all three items).
- `src/include-reader.ss` — the tracker. Also `CORE_FLAT`.
- `src/core.ss` — `compile-library*` already takes `keep-roots`; expected to need only the plumbing
  that reaches it from a registered (rather than freshly parsed) library.
- `src/compile.ss` — one deletion: the shake's root-extraction helpers move into the shared core so
  both drivers call one implementation (design D8), and the driver keeps the call. Its `build/lib`
  cache and its shake behave exactly as today; the two caches stay separate, as
  `baked-set-artifact-cache` decided.
- `docs/PERFORMANCE.md` — P8 ticked with its measured outcome; P3's entry cross-referenced for the
  cache generalization.
- Tests — door-parity byte comparisons (`emit build` vs the Chez driver on the same program),
  cold/warm identity extended to user libraries and shaken units, include-closure invalidation, and
  the #101 regression (`emit repl --no-prelude` performs no standard-library compile).
- GitHub issue #101 closes with this change.
