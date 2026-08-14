## Context

Three doors obtain library units through one seam in `src/emit.cpp`: `seed_session` (registration of
the baked set, then a manifest preload) for `emit run`/`emit build`/`emit lib`, and a hand-rolled
eager preload for `emit repl`. `baked-set-artifact-cache` put a cache in front of the first half of
that seam; this change finishes the seam.

Current state, with the facts each item rests on:

- **`emit repl` seeds differently from every other door.** `preload_libraries`
  (`src/emit.cpp:1288`) reads its *first* manifest through mode 5 (`repl-manifest-paths`,
  `src/repl-core.ss:485` — every `(library ...)` entry's source path) and only uses mode 9
  (`repl-manifest-user-paths`, `src/repl-core.ss:505`) to de-duplicate the chained manifests.
  `preload_user_libraries` (`src/emit.cpp:570`), the run door's, uses mode 9 throughout. The
  difference is `(scheme base)`, which mode 9 omits and mode 5 does not, and which under
  `--no-prelude` is nobody's job to register — so the REPL compiles it, binds nothing to it, and
  discards it. Measured at HEAD 7b7538b: 1.69 s against a 0.05 s no-manifest floor (issue #101).
- **Mode 9's omission is one hard-coded name.** `(and src (not (equal? name '(scheme base))))`.
  But the baked set is a *partition* of two members — `(emit internal)` and `(scheme base)`
  (`src/prelude-surface.scm:232`) — and this repository's own `emit-libs.scm:32-33` names both,
  because the Chez driver resolves them from there. So the substrate leaks through the same hole,
  eagerly on the REPL door and on demand on the run door.
- **The cache is keyed on the executable alone.** That is exactly right for the baked set, whose
  source is compiled *into* the binary, and insufficient for a user library, whose source is on
  disk. The second half of the key needs the library's `.sld` **and its include closure**, and the
  Chez-free include reader (`src/include-reader.ss`) records nothing it reads. The Chez driver
  already solves the same problem: `*includes-read*` (`src/compile.ss:220`), stored into the unit's
  stamp datum (`stamp-datum`/`stamp-includes`, `src/compile.ss:640-670`) and re-checked by
  `artifacts-fresh?`.
- **The shake is driver-side.** `compile-library*` (`src/core.ss:1109`) takes `keep-roots` and is in
  the shared core, but everything that *drives* it — `program-root-internals`, the prunability rule,
  the root extraction from the emitted program text — lives in `build-modular-artifacts*`
  (`src/compile.ss:728`), which the Chez-free door does not run. `emit_build` (`src/emit.cpp:1710`)
  writes the units it was handed by `compile_program` straight to temp `.ll` files and forks clang.

Constraints that shape everything below: the core performs no file I/O (doors do); mode numbers are
a positional protocol between `src/emit.cpp` and `src/repl-core.ss`; `src/repl-core.ss`,
`src/core.ss`, and `src/include-reader.ss` are all in `CORE_FLAT`, so every edit to them shares one
`make regen` barrier (~22 min, 5 self-compiles); and the cache must stay a pure accelerator —
nothing may become load-bearing for correctness.

## Goals / Non-Goals

**Goals:**

- One seeding path for every door, so `--no-prelude` means the same thing on all of them and no door
  compiles a library it will not bind.
- The cache covers every unit a Chez-free door consumes — baked, user, and shaken — under one key
  discipline and one set of degradation rules.
- A delivered executable's size does not depend on which driver produced it.
- P8's saving does not come out of P3's: a warm rebuild of the same program must be faster than
  today's `emit build`, not merely smaller.

**Non-Goals:**

- The ~0.30 s IR-parse/JIT half (a `.bc`/`.o` layer — independent, still better measured after this).
- P11 (`runtime.c` → bitcode, 0.16 s / 5%).
- Curating `(scheme base)`'s export surface (issue #29). P8's own entry records why that is not a
  substitute: the shake already reaches the ideal on the door that has one.
- Unifying with `src/compile.ss`'s `build/lib` cache. Two caches, as `baked-set-artifact-cache`
  decided; the Chez driver's freshness rules do not move.
- Cache eviction (see Open Questions).

## Decisions

### D1 — The REPL preloads through the run door's index, first manifest included

`preload_libraries` uses mode 9 for every manifest in the chain, not mode 5 for the first and mode 9
for the rest. The REPL stays **eager** — a session is an open world and any prompt may import
anything — so the change is only *which entries* are preloaded, not when. The eager/lazy split
between the REPL and the run door is deliberate and stays.

*Alternative — teach the REPL host a `--no-prelude` branch that skips the `(scheme base)` entry.*
This is issue #101's broader reading and is rejected for the reason the issue itself gives: it adds
a second special case to a flag, where the underlying fact is that the manifest is no longer a source
of standard libraries for **any** door. `baked-set-on-every-door` made registration universal; this
is the other half of that change, arriving late.

### D2 — Mode 9 omits every baked member, not the one name it hard-codes

`repl-manifest-user-paths` filters on baked-set membership (`src/core.ss:211-230`) rather than on
`(equal? name '(scheme base))`. This closes the substrate leak D1 would otherwise inherit: with the
prelude, a manifest entry for `(emit internal)` is absorbed by the already-registered guard and costs
a parse; without it, the entry would be compiled by a door that has deliberately registered no
standard library at all. One predicate replaces one literal, and the mode's contract is unchanged.

### D3 — Mode 5 is retired, not renumbered

With D1, no door calls mode 5. Its number stays reserved and `repl-manifest-paths` is deleted, rather
than renumbering 6-15 downward: the mode number is a wire protocol between two files that regen
compiles independently, and a gap costs a comment while a renumber costs a mixed-source window in
which the host and the core disagree about what mode 7 means.

### D4 — Under `--no-prelude`, a user library that imports `(scheme base)` no longer loads in the REPL

This follows from D1 and is a deliberate behavior change. Today the REPL's mode-5 preload loads
`(scheme base)` from the manifest even under `--no-prelude`, so such a library resolves — by accident,
in a session where the user cannot reference those names themselves. The run door has behaved the
other way since `run-door-user-libraries`. After this change both doors agree: `--no-prelude` is a
session with no standard library, and a library depending on one reports an unresolved import
through the existing path (`src/emit.cpp:1368-1372`), rather than silently working.

### D5 — A user library's cache key: compiler digest plus a digest over its source closure

The key gains a second half for units whose source is on disk. It is a digest over the `.sld` and
every file the include family read while loading it, and the **closure is recorded inside the entry**
— which is what dissolves the apparent chicken-and-egg (you cannot know the closure without
compiling, and you want to avoid compiling). Lookup is by `.sld` path; validation re-digests the
files the entry names. An added, removed, or changed `include` necessarily changes the `.sld`'s own
digest, so a closure change is always witnessed by a file the entry already records. `cond-expand`
selecting a different file is covered by the compiler-identity half, since the feature set is fixed
in the binary.

This mirrors the Chez driver's stamp datum rather than inventing a rule: `stamp-includes` records the
same closure for the same reason (`src/compile.ss:640-670`).

### D6 — Content digests, not modification times

`artifacts-fresh?` compares mtimes because its artifacts sit *beside* the sources it compares them
to. This cache does not: entries live in a user cache directory shared across checkouts, worktrees,
and branch switches, where mtime ordering is noise — `git checkout` restores content and moves
mtimes, so mtime produces both false misses (a touched but unchanged file) and, across two
checkouts of the same commit, entries that are hard to reason about. FNV-1a over a few KB of `.sld`
and includes is negligible beside the 2.64 ms the executable digest already costs.

### D7 — The Chez-free include reader tracks what it opened; a mode reports it

`emit-include-reader` (`src/include-reader.ss:64`) already resolves each filename to a token before
reading it, so tracking is an accumulate at that one point, with a reset at the start of each
registration — `reset-includes-read!`/`includes-read` (`src/compile.ss:220-222`) transposed. A new
mode returns the closure for the library just registered, in the same "pure query over state a
previous mode established" shape mode 15 already uses, so the compile is not repeated to produce it.

### D8 — One shake implementation, moved into the shared core

`program-root-internals` and `str-contains?` (`src/compile.ss:700-722`) move into the core so both
drivers call the same code, and `src/compile.ss` keeps only the call. Copying them into
`src/repl-core.ss` would leave two implementations of "which of a unit's candidate names does this
program's IR actually mention" — a rule that already has one subtle bug fixed in it (`member` vs
`memq`, recorded at `src/compile.ss:770-780`) and whose divergence would show up as undefined symbols
at link time, on one door only. This is the change's only edit to `src/compile.ss`, and it is a
deletion plus a call; its behavior does not move.

### D9 — `emit build` shakes by recompiling against roots, and the shaken unit is a cache entry

The mechanism, after `compile_program` has produced the program IR:

1. Determine the prunable units (D11) and, for each, the root set the program's IR actually mentions
   (D8).
2. Look for a cache entry keyed by compiler digest + source identity (D5) + **a digest of the root
   set**. On a hit, link that IR.
3. On a miss, submit the unit's source to a new mode that recompiles it with `keep-roots`
   (`compile-library*`'s existing parameter), link the result, and store it.

**Refined during implementation: the third key half is a digest of the program's emitted IR,
not of the root set.** The entry has to be findable *before* the roots are known — computing
them is most of the work being avoided — and the program's IR is what determines them: same
IR, same roots, necessarily. It is a coarser key (two programs with identical root sets do not
share an entry) and an exactly sufficient one for the case D9 promises, rebuilding a program
that has not changed. Emitted IR is already required to be byte-identical for unchanged input,
which is what makes it usable as a key at all.

Step 3 is a from-source compile of that unit, because a cache-seeded session holds no body forms —
mode 14 registers from prebuilt IR and export table by design. That cost is the collision this
change exists to resolve, and the resolution is that it is paid **once per (program, compiler)**
rather than per invocation:

| `emit build`, trivial program | today | after, cold | after, warm |
|---|---|---|---|
| baked-set registration | ~0.30 s (cached) | ~0.30 s | ~0.30 s |
| shake recompile of the prunable units | — | ~1.4 s | 0 (cache hit) |
| clang LTO + link | ~1.07 s | ~0.4 s | ~0.4 s |
| **executable** | **134 KB** | **~34 KB** | **~34 KB** |

The warm row is the one that matters for the dev loop, and it is strictly better than today on both
axes. The cold row is roughly a wash in time and a 100 KB win in size. Both rows are projections
from P8's and P3's measurements and are acceptance criteria, not claims — task 8 measures them.

**Measured (`hello.scm`, idle machine, best of 3).** Executable 212,232 B -> **93,656 B**, exactly
the Chez door's figure. Rebuild of an *unchanged* program 0.732 s -> **0.611 s**; build of a
*changed* program ~0.73 s -> **~0.90 s**; fully cold 1.902 s -> **2.054 s**. So the warm row held and
the cold row cost more than "roughly a wash" — a shake is a recompile, and only an unchanged program
is served from the cache. 56% smaller always, 16% faster on a rebuild, ~0.17 s slower on an edit.

*Alternative — prune the emitted IR text at the build door.* Preserves the cache exactly and needs no
recompile, but it is a second, independent reachability implementation over LLVM text, with
link-time undefined symbols as its failure mode. Rejected against D8's reasoning.

*Alternative — accept the recompile on every build.* P8's own sketch. Rejected: it spends the 1.43 s
`baked-set-artifact-cache` just recovered to save ~0.68 s, regressing the metric that change landed
to fix.

*Alternative — retain body forms in the session so a registered unit can be shaken without re-reading
source.* Does not help: on a cache hit there were never any body forms to retain, which is precisely
what makes the cache fast.

### D10 — An entry's kind is part of its name, and kinds are not interchangeable

Entries are named `<kind>-v<VERSION>-<keys>`: `baked-…` (today's), `unit-…` (a full user library),
`shake-…` (a root-pruned unit). A shaken unit is a *different artifact* for the same source — sound
only for the program whose roots produced it — so it must be impossible to serve where a full unit is
wanted. Putting the kind in the name makes that a lookup property rather than a discipline, exactly
as the format version and the compiler digest already are.

### D11 — The prunability rule ports unchanged

A unit is prunable only if it is a direct import of the program **and** no other unit in the closure
imports it (`src/compile.ss:762-790`). The Chez-free side has the input it needs: mode 15's metadata
already carries each registered library's imports. The rule keeps `(emit internal)` full, because
`(scheme base)` imports it — the same conclusion `scheme-base-partition` reached the hard way, and
the reason the comparison in that rule must be `member` and not `memq`.

**It reduces to its second half on this door.** The session *is* the program's import closure — the
run door preloads lazily, and `emit build` reaches libraries through that same seeding — so "a
direct import of the program that no other unit imports" becomes "no other registered library
imports it": something must import a library that is present, and if no unit does, the program does.
One predicate over `*repl-lib-imports*`, and no program-import list to thread through the protocol.

**Measured consequence, worth stating plainly.** This rule bounds P8's win to programs whose direct
imports are their only importers. `hello.scm` is that shape and drops from 212,232 B to 93,656 B;
`uses-lib.scm`, which imports a user library that imports `(scheme base)`, is 212,296 B after the
change — `(scheme base)` is imported by `(demo util)` and must stay whole. The **Chez door produces
212,304 B for the same program**, so this is not a gap between the doors but the shake's own limit,
and closing it means backward propagation through the import DAG rather than anything door-specific.
Out of scope here, and recorded so the next reader does not mistake it for a regression.

### D12 — Narration names the unit and the kind

The cache's existing narration requirement extends to per-unit entries: reused vs recompiled, with
the reason when recompiled, naming the library and whether the entry was a full or shaken unit —
stderr, verbosity-controlled, per `docs/OUTPUT.md`. Without the unit name, a build that reuses three
entries and rebuilds one is unreadable.

### D13 — A cached unit registers only when its imports are registered (added in implementation)

Mode 14 gained a third answer: `deferred`, the status mode 4 already uses for a library whose
dependencies are not loaded yet. A cache hit would otherwise be *order-blind* exactly where
compiling is not — the REPL door runs each unit's `__init` as it adds it, so registering a cached
unit ahead of a unit it reads globals from would initialize against uninitialized slots. With the
status, both preloads retry a deferred entry in the fixpoint loop they already run, and a hit and a
compile go around it identically.

This repository's own manifest has no user-to-user dependency, so nothing here would have caught it;
it is the kind of thing that shows up in someone's project a year later.

### D14 — Naming a local after a macro keyword miscompiles, silently and only when self-hosted

`str-search`'s inner loop was first written as `(let match ([j 0]) …)`. Under Chez that shadows the
`match` macro correctly and every Chez-gated suite passed; in the compiled compiler the expander
resolves a keyword by name *before* consulting the lexical environment, so the recursive call
expanded into the matcher's own "no matching clause" raise. Every `emit build` shake failed with
`match: no matching clause 0`, pointing at a file that has nothing to do with the shake.

Renamed to `at?`, with the reason recorded at the site. The underlying defect — a lexical binding
cannot shadow a macro keyword — is **GitHub issue #103**, filed rather than fixed here: it is an
expander change, and this change is already three items wide.

Two things follow for how this change was built. The cheap loop was a Chez probe that `include`s
`CORE_FLAT` + `src/repl-core.ss` and calls a mode directly (`scratchpad/shake-probe.ss`), which
runs in seconds against the self-compile's four minutes — but it is exactly the loop that could not
see this bug, because Chez is the host that gets it right. And mode 17's errors now carry the step
they failed at (`*shake-step*`, a plain variable rather than a nested `guard`), because "kept whole
(match: no matching clause 0)" named neither the step nor the library.

## Risks / Trade-offs

- **A second shake implementation would diverge silently** → D8 keeps one, in the shared core; the
  acceptance test is a byte comparison of `emit build`'s executable against the Chez driver's on the
  same program, not just "it runs".
- **A shaken unit served to an open-world door would break at the first unreferenced binding** → D10
  puts the kind in the key; a test asserts the REPL and run doors never read a `shake-` entry.
- **Cold `emit build` could get slower before the cache warms** → measured as an acceptance
  criterion (D9's table); if the cold row regresses beyond the projection, the shake is gated on the
  entry being cacheable at all rather than shipped unconditionally.
- **Include tracking is global state and could leak across loads** → reset at the start of each
  registration, with a test that two libraries including the same fragment record it once each
  rather than the second inheriting the first's closure.
- **D4 is an observable behavior change** → deliberate, door parity, and covered by a scenario; it
  affects only `emit repl --no-prelude` with a manifest whose libraries import `(scheme base)`.
- **Three items, one regen barrier** → every `CORE_FLAT` edit (modes, tracker, D8's move) must be
  finished before the single `make regen`; the task list orders them accordingly, and the iteration
  loop before that point runs through `chez --libdirs src --script src/compile.ss`.
- **Cache growth becomes program-shaped** → previously one entry per binary; now one per
  (library, compiler) plus one per (program root set, compiler). Entries are tens to hundreds of KB
  and the location is `$EMIT_CACHE`-overridable, but nothing removes them.

## Open Questions

- **Eviction.** Nothing in this change deletes an entry, and D9's keying makes entry count grow with
  the number of distinct programs built. An LRU sweep, a total-size cap, or an `emit cache` verb are
  all plausible; none is in scope. To be recorded in `docs/PERFORMANCE.md` if the measurement in task
  8 shows the directory growing faster than expected.
- **Should `emit lib` shake to the library's own exported interface?** The `aot-codegen` requirement
  already states the root set is a parameter so that exactly this becomes possible. Out of scope
  here; worth an issue once P8 lands.
- **Does the run door want the shake too?** No — it JITs into an open world. But `emit run` on a
  program that is about to be built shares nothing with the build door's shaken entries, which is
  correct and worth stating in the spec so it is not later read as a miss.
