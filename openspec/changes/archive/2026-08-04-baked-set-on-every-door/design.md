## Context

Four doors — `emit run`, `emit build`, `emit repl`, `emit lib` — drive one compiler core through the
mode-dispatched embedded compiler (`src/repl-core.ss`, `rt_repl_set` + `scheme_entry`). Two of them
register the baked library set and two do not:

```
  emit run    ─┐
  emit build  ─┴─▶ compile_program()   mode 1 init-session
                                       mode 8 register the baked set   ← (scheme base) + (emit internal)
                                       mode 9 preload the program's imports (lazy closure)
                                       mode 7 compile the program

  emit repl    ──▶ emit_repl()         mode 1 init-session  (returns "" — macros only)
                                       mode 5 preload EVERY manifest library   ← (scheme base) must be here
                                       mode 6 auto-import (scheme base)

  emit lib     ──▶ emit_lib()          mode 0 init-session
                                       mode 11 export table            ← FAILS: nothing is loaded
                                       compile_program()  ← re-inits the session, so its mode 8 is too late
```

`init-session` has returned `""` since the prelude was re-homed as `(scheme base)`
(`src/repl-core.ss:190-210`): it merges the derived-form *macros* and emits no procedure batch. So
every door's procedures must come from a loaded `(scheme base)`, and only run/build have one without
a manifest.

Two constraints shape the fix. `src/core.ss` and `src/repl-core.ss` perform **no file I/O** by
design — the host reads files and hands text in — so "find the standard library" is a host-side
decision on every door. And `src/repl-core.ss` rides `CORE_FLAT`, so any change to it is IR-shaping:
`make regen`, the self-hosting fixed point, and the trust-check are in play.

The dedup machinery this needs already exists. `repl-load-library-text` returns `already` for a
library whose name is in `*repl-libs*` (`src/repl-core.ss:280-286`), added so the run door tolerates
a manifest that lists `(scheme base)` after mode 8 registered it. Its comment says "The REPL never
double-loads, so it never sees this status" — which this change makes false, deliberately.

## Goals / Non-Goals

**Goals:**

- One session-seeding sequence, used by all four doors, that registers the baked set before the
  manifest is consulted.
- `emit repl` started in any directory has the standard library, the derived-form macros, and the
  ability to load a project library that imports `(scheme base)`.
- `emit lib` compiles a library whose body resolves names through its imports.
- A manifest entry naming a baked member is a no-op, so the repository's own `emit-libs.scm` and
  every existing user manifest keep working unchanged.
- `docs/PROJECTS.md`, verified by building the project it describes.

**Non-Goals:**

- Changing what the baked set *contains*, or how it is derived (`compile-baked-set` is untouched).
- Removing `(scheme base)` / `(emit internal)` from the repository manifest — the Chez driver still
  resolves them from there, and `tools/regen.sh` derives `bootstrap/scheme.base.ll` from
  `lib/scheme/base.sld`.
- Making the REPL lazy. It stays eager (a session is an open world); only the *source* of the
  standard library changes.
- The final-value print, `emit --help`/`--version`, and issue #36 — see the proposal's out-of-scope
  list.

## Decisions

### D1 — Register the baked set on every door, rather than teaching each door to find `base.sld`

The alternative was to keep the manifest as the REPL's source of the standard library and make the
lookup better — e.g. have the REPL synthesize a default entry pointing at the installed
`<prefix>/share/emit/lib/scheme/base.sld` when the manifest omits one. Rejected: it adds a *second*
answer to "where does the standard library come from", door-dependent, and it reintroduces a file
dependency that the module-system spec explicitly removed ("a program importing only `(scheme base)`
needs no manifest present at all"). Registering the baked set is the answer the other two doors
already give; making it universal removes a special case instead of adding one.

It also subsumes #39's own suggestion ("have the REPL door bake the set the way the run door does")
and generalizes it to `emit lib`, which #39 did not know about.

### D2 — The REPL host runs each member's initializer; mode 8 returns one init symbol per member

On the run and build doors nothing runs the baked initializers at registration time: the program's
`@scheme_entry` calls them in topological order, exactly as an AOT executable does. A REPL session
has no program entry, so the **host** must run them, once, at startup — the same shape as the
`__repl_prelude` thunk the REPL runs today.

Mode 8 currently returns `(ok . (ir . init-symbol))` with `(scheme base)`'s symbol only, "kept for
protocol compatibility; the host does not use it" (`src/repl-core.ss:427`). It becomes one symbol per
member, newline-joined, in the same order as the boundary-joined modules — which is already
dependency order. This is **additive**: the run door reads `rt_car(rt_cdr(r))` and never looks at the
cdr (`src/emit.cpp:470`), so it needs no change and its emitted IR does not move.

Rejected alternative: a new mode returning the init symbols separately. It would mean two calls that
must agree on ordering, for no benefit — the modules and their initializers are one list.

### D3 — Dedup through the existing `already` guard, and keep mode 5 for the REPL

The REPL keeps using mode 5 (every manifest library) rather than switching to mode 9 (paths *sans*
`(scheme base)`). Mode 9 omits exactly one hard-coded library name; the guard in
`repl-load-library-text` is keyed on "is this name already registered", so it covers **every** member
of the baked set — including `(emit internal)`, which mode 9 does not omit — and keeps covering
whatever the partition holds later. One mechanism, name-driven, no list to maintain in two places.

So the ordering is: register the baked set, *then* preload the manifest. A manifest entry for a baked
member hits the guard and loads nothing.

### D4 — Thread resolved import tables into the lone-library compile, and seed `emit lib`'s session once

**Corrected during implementation.** The host-side ordering below is necessary but was not
sufficient: the deeper cause is that `compile-library-form` (`src/core.ss:88-90`) hardcodes `'()`
for the import tables, so **every** lone-`define-library` compile resolves no imports at all. The
defect is therefore wider than `emit lib` — the run door fails the same way:

```
$ emit run --emit < stats.sld        # a library importing (scheme base)
emit: repl: unbound variable fold-left
```

Four callers share that hardcoded `'()`: `compile-source-string`, `compile-source-with-prelude`,
`compile-source-rehomed` (`src/core.ss:230`), and mode 7's library branch; mode 11 passes `'()`
separately (`src/repl-core.ss:533`). So `compile-library-form` gains an optional tables argument,
defaulting to `'()` so no existing caller changes, and the two kinds of caller supply what they can
resolve:

- **`compile-source-rehomed`'s library branch** (in-core, no I/O) compiles the baked set for its
  export tables and resolves the library's declared imports against those. That fixes a lone library
  importing `(scheme base)` on the run door. It still emits only the library's own module — the unit
  *resolves against* `(scheme base)` without *emitting* it, which is what the existing "a lone
  define-library compiles to a single unit with no baked base" rule means.
- **mode 7's library branch and mode 11** (host-driven) resolve against the **session** via
  `repl-import-tables`, which after mode 8 holds the baked members and after the manifest preload
  holds the project's libraries. That is the only path that can resolve a library importing another
  *manifest* library, because the core performs no I/O.

`repl-import-tables` returns `#f` when a named import is not loaded, which supplies the unresolvable-
import diagnostic the `emit-cli` spec requires — and closes a third defect found while testing: a
lone library importing a library that does not exist compiles **silently** today, while a *program*
importing one is correctly rejected. Same asymmetry, same fix.

The host-side ordering is still required, because mode 11 must run against a session that already
holds those tables. `emit_lib` cannot simply call mode 8 itself before mode 11, because
`compile_program` re-runs `init-session` afterwards and would discard the registration. Split it:

```
  seed_session(no_prelude, manifest, src, &modules)   init-session; mode 8; preload imports
  compile_unit(src, &prog_ir, &is_library)            mode 7
```

`emit_run` and `emit_build` call the two in sequence — the same mode sequence in the same order, so
their behavior and emitted IR are unchanged. `emit_lib` calls `seed_session`, then mode 11, then
`compile_unit`, dropping its own `mode 0` init. The export table and the unit IR then come from one
session with one import environment, which is what keeps `emit lib`'s `.ll` byte-identical to the
other doors' — a requirement the `emit-cli` spec already states and this change must not weaken.

Rejected alternative: give `emit_lib` its own copy of the seeding sequence. It would be the second
place that knows the startup protocol, and the spec's "one compile-unit core" is the property most
worth protecting here.

### D5 — The baked set wins over a manifest entry for the same library

A stated consequence, not an accident: after this change, editing `lib/scheme/base.sld` does not
change what `emit repl` sees until `make regen`. That is already true of `emit run` and `emit build`,
and it is the existing stance that committed IR is authoritative and never silently rebuilt (design
D4 of `fix-stale-repl-host-rebuild`, reaffirmed by the README's "the default build does not
auto-regenerate"). Making the REPL agree removes the one door where a stale `base.sld` produced a
*different* answer than the others — the failure mode gets less interesting, which is the same
argument the `library-sources-and-artifacts` exploration makes for #31.

The escape hatch a compiler developer needs already exists and is one word: `make regen`.

### D6 — Measure the REPL's startup cost; `--no-prelude` stays the fast path

**Measured** (best of five, `emit repl` evaluating one trivial form; `before` is `main` at `011cb37`,
linked from its committed IR in a worktree):

| | before | after |
|---|---|---|
| in-repo, prelude | 0.83s | 0.84s |
| in-repo, `--no-prelude` | 0.72s | 0.72s |
| project dir, prelude | 0.06s | 0.77s |

In-repo it is a **wash**, as predicted: the same two libraries are compiled either way, only the
source differs. `--no-prelude` is untouched. The project-directory row looks like a 13× regression and
is not one — the 0.06s was a session that had loaded *no standard library at all*, which is the defect
this change fixes. A project session now costs what an in-repo session costs, which is the point.

No `docs/PERFORMANCE.md` entry is warranted for a regression, because there isn't one. The ~0.8s
absolute cost is worth recording against **P3** ("Precompiled prelude / library objects") instead: it
is the baked set being compiled from source at every session start, which is what P3 proposes to
cache, and it is now paid by all four doors rather than three.

The REPL trades "read and compile `base.sld` + `internal.sld` from the manifest" for "compile the
baked set from the baked-in `*prelude-source*`". Both compile the same procedures, so the expectation
is a wash, but the two paths differ (the `.sld`s carry no comments; the baked string is ~66 KB) and
the REPL now also compiles the substrate it previously got from the manifest in the repo. Task 5
measures startup before and after and records the delta; a regression beyond noise is reported rather
than absorbed, and `docs/PERFORMANCE.md` gets an entry if it is material. `--no-prelude` continues to
skip the whole thing.

### D7 — `docs/PROJECTS.md` is a guide, kept separate from `docs/MODULES.md`

`docs/MODULES.md` is reference: the requirements, the `.exports` format, the semantics table, the
`(scheme base)` surface. The new document is a **task-ordered walkthrough** of a project — layout,
first program, first library, the manifest, the REPL loop, the delivered executable — and it links
into `MODULES.md` for the details rather than restating them. Folding a tutorial into the reference
would make both worse; `MODULES.md` is already 501 lines and is the wrong thing to hand someone on
their first day.

It is verified the way the workflow was investigated: the change builds the project the document
describes and checks the output it claims, so the document cannot drift from a door's behavior
without a test noticing (task 6.3).

## Risks / Trade-offs

- **`src/repl-core.ss` is in `CORE_FLAT`, so this is IR-shaping** → the fixed point, the trust-check,
  and `test/module-scaffold-baseline.sha256` are all in play. Mitigation: land the mode 8 payload
  change as its own step with its own `make regen`, so the baseline re-record is one explainable
  delta (the protocol in that script's header requires this); keep the C++ door changes, which are
  not IR-shaping, in separate steps.
- **The REPL startup sequence is the riskiest edit** — it must add modules and run initializers in
  dependency order before any user form, and a mistake shows up as an unbound name or a null slot
  rather than a clean error. Mitigation: D2 makes the order the same list the modules arrive in;
  task 5.1 asserts a fresh REPL resolves a `(scheme base)` name, a substrate-only name is still
  unbound, and an imported project library works.
- **Double-loading in the repository's own manifest** → the repo's `emit-libs.scm` names both baked
  members, so every in-repo REPL start exercises the `already` guard. Mitigation: a test asserts
  exactly one module per baked member is added (a duplicate would surface as a JIT symbol collision,
  so the guard failing is loud rather than silent) — and that is the common case in this tree, so it
  gets caught immediately rather than only in a user project.
- **A stale `base.sld` becomes invisible in the REPL** (D5) → accepted, and consistent with the other
  doors. Mitigation: documented in `docs/MODULES.md` and `docs/PROJECTS.md`, and `make regen` is the
  one-word refresh; the trust-check already fails a compiler edit that forgot it.
- **The documentation can rot** → mitigation is D7's verified example; the risk that remains is prose
  about limits (macro exports, whole-library imports) drifting as those limits lift, which is the
  ordinary cost of having documentation.

## Migration Plan

No user migration: every existing manifest keeps working, since a baked member's entry becomes a
no-op rather than an error. A user project's manifest may *drop* its `(scheme base)` /
`(emit internal)` entries after this change, and `docs/MODULES.md` stops telling people to add them.

Rollback is per-step and ordinary — the C++ door changes revert independently of the `repl-core.ss`
payload change, and the latter reverts with a `make regen`.

## Open Questions

1. Should `emit lib` gain `--no-prelude` for symmetry with the other three doors? A library that
   imports nothing does not need the baked set, and skipping it would make `emit lib` on
   `test/modules/mylib.sld` measurably faster. Deferred — no one has asked, and the default must
   work first.
2. ~~Does the REPL want to narrate the baked set at default verbosity or only under
   `EMIT_VERBOSITY=verbose`?~~ **SETTLED: verbose-only.** The startup banner is already two lines and
   the manifest line is `vsay`, so a default-verbosity session says nothing new. It narrates
   `register baked library scheme.base` per member at `EMIT_VERBOSITY=verbose`, which is also what
   the "registered exactly once" test counts.

**Found during implementation, and folded in rather than deferred** (see the revised D4 and the
proposal's What Changes):

3. A lone `define-library` importing a library that does not exist compiled **silently**, while a
   program importing one was rejected. Now reported, naming the library.
4. A manifest entry whose `(source …)` file does not exist **segfaulted `emit repl`** at startup — the
   host read the missing file as `""`, and mode 4's `(car '())` trap is not catchable by the
   in-language `guard` around it. Confirmed on `main`, so it predates this change. Both preload paths
   now name the unreadable path; the REPL keeps the session, the run door exits non-zero.
