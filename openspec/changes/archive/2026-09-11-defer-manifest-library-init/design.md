## Context

See `proposal.md` — Why for the motivation and `docs/PERFORMANCE.md` P23 for the measurements.
What matters here is the machinery that already exists, because this change wires existing pieces
together rather than building new ones.

The REPL door seeds a session in three steps (`src/emit.cpp:2140-2225`): register the baked set
(mode 8), preload every manifest library (`preload_libraries`, `src/emit.cpp:1935`), auto-import
`(scheme base)` (mode 6). The preload, per library, does `add_ir` then `run_init`. `add_ir` is
cheap in JIT terms — ORC materializes lazily at lookup, so a module that is added and never
referenced is never code-generated. `run_init` is the lookup: it resolves the unit's `__init`
through `jit_lookup` (`src/emit.cpp:227`), which forces transform and codegen immediately.

Four pieces the fix needs are already built:

- **`*repl-lib-imports*`** (`src/repl-core.ss:49`) — each loaded unit's direct imports, populated
  by every registration path (source load, cache registration, baked set).
- **`run-closure-order`** (`src/repl-core.ss:715`) — the transitive import closure in dependency
  order over that graph, DFS post-order with a cycle check. The **run door already uses it** to
  order a program's inits, and it exists precisely because the driver's `toposort-libs` reads
  files and is Chez-only.
- **A newline-joined init-symbol list** as a core→host payload convention, which mode 8 already
  returns and the host already parses (`std::istringstream isyms`, `src/emit.cpp:1293`).
- **An `import` status arm** in `process_form` (`src/emit.cpp:2061`) whose comment already marks
  the seam: "nothing to JIT — the unit was preloaded; the session scope now sees it."

So the shape of the work is: stop calling `run_init` in the preload, and make the `import` arm run
the right inits in the right order.

## Goals / Non-Goals

**Goals:**

- Session startup stops scaling with manifest libraries the session does not import.
- The REPL and the run door initialize a given import closure in the **same order**, because
  dev→ship fidelity is a stated project requirement and a divergence here would be invisible until
  a library body's effects differed between `emit repl` and `emit build`.
- A failed initialization leaves no partially imported library behind.
- Every observable other than timing is unchanged — the lesson P3's cache regression taught.

**Non-Goals:**

- Deferring the **registration** as well as the initialization (read, compile/cache-load, `add_ir`).
  That would make startup independent of manifest size entirely, but it moves a broken library's
  diagnostic from startup to the import. Recorded as the follow-on in P23, not taken here.
- The run, build and lib doors. The run door already preloads only the program's import closure
  (mode 9's lazy closure) and inits it from `@scheme_entry`; nothing about it is eager in the way
  this change targets.
- The `.bc`/`.o` object-code cache (P23 fix 2) and shrinking `(scheme char)`'s IR (P23 fix 3).
  Both are independent of this change and remain in the backlog.

## Decisions

### D1 — Defer the `__init`, keep the registration eager

`preload_libraries` keeps reading, cache-loading and `add_ir`-ing every manifest library at
startup; it stops calling `run_init`. The open world is preserved by construction: the set of
importable libraries, their export tables, their macro interfaces and their failures are all
established before the first prompt, exactly as today. Only the code generation moves.

*Alternative considered:* defer the whole load, so a library is untouched until imported. It is
worth more (the remaining IR parse goes too, and startup stops reading the cache at all) but it
relocates a diagnostic a user currently gets before the prompt. Deferring init alone is the change
whose observable surface is small enough to hold to "every observable is the same"; the fuller
deferral can be argued on its own evidence later.

### D2 — Split the prompt's import into resolve-then-commit

Today mode 3's `import` arm merges the library's exports into the session scope (`repl-import!`)
and returns `(import . "")`. If the host then ran the init and it trapped, the names would already
be bound to a library whose body never completed.

So the arm splits:

1. Mode 3's `import` arm resolves the closure — `run-closure-order` over the imported names — and
   returns `(import . <newline-joined __init symbols>)` **without merging**.
2. The host runs those inits in order, skipping the ones already run (D3).
3. The host asks the core to merge, via mode 6 generalized to take a library name in `repl-input`
   (empty input keeps its present meaning, `(scheme base)`), which is what `repl-import!` already
   does for the auto-import.

This costs one extra host→core round trip per import form and buys the spec's failure semantics
directly, with no new rollback path.

*Alternative considered:* keep the merge in mode 3 and, on an init trap, have the host ask the
core to restore the pre-form session snapshot. The snapshot machinery exists (`compile-one-form`'s
guard, design D3 of the embedding work), but it is entered from *inside* the compiler's guard,
whereas this trap happens in host code after the compiler returned. Reaching it from outside is a
new path through the most delicate state in the session, for no gain over ordering the steps
correctly in the first place.

*Alternative considered:* a new mode 18 rather than generalizing mode 6. Rejected as a mode whose
body would be `repl-import!` — which is mode 6's body. The generalization is backward compatible
because mode 6 ignores `repl-input` today.

### D3 — The "already initialized" set is host state, not session state

A session's library state (`*repl-libs*`, `*repl-lib-imports*`, the macro env) lives in the core
and is snapshot-restored when a form's compile fails. The set of libraries whose `__init` has
*run* must not participate in that: running an `__init` mutates the JIT'd heap and is
irreversible, so restoring a snapshot that says "not yet initialized" would re-run a body that
already ran — the once-only guarantee broken by the very mechanism meant to protect the session.

The division is therefore: **the core answers what the import graph implies** (which inits, in
what order), **the host records what actually happened in this process**. The host already keeps
exactly this kind of state for the baked set's inits.

### D4 — One ordering, shared with the run door

The import arm calls `run-closure-order`, the same function the run door's mode 7 calls to order a
program's inits. Two orderings that agree today and drift tomorrow is the specific failure that
would break dev→ship fidelity silently, and the cheapest guard against it is that there is only
one function. Its cycle check comes along for free.

### D5 — The baked set stays eager

`(scheme base)` and `(emit internal)` are auto-imported into every session, so a deferred init
would run within milliseconds of startup anyway, while adding a way for a session to reach a
prompt with an uninitialized standard library. The `register baked library` narration, the mode 8
path and the 0.34 s no-manifest start are untouched. This also keeps the spec's existing
"the session's standard library does not depend on the manifest" guarantee mechanically true
rather than newly conditional.

### D6 — Narration moves with the work

The startup narration still names every manifest library it registered, so the session's inventory
stays as visible as it is today. Running a deferred init adds one verbose line at the import,
following `docs/OUTPUT.md`. Nothing moves to stdout, and nothing appears at default verbosity that
does not appear today.

## Risks / Trade-offs

- **An observable changes that no test watches** → This is P3's cache regression exactly: values
  identical, an observability surface quietly broken, caught only by a pre-existing dump test. Test
  the observables explicitly — dump output under `--dump`/`--dump-all`, the verbose narration at
  startup and at import, the `[N/M modules]` session line, stdout byte-identity — not just the
  values.
- **The REPL and the run door initialize in different orders** → D4 puts both on
  `run-closure-order`. Add a test that a session importing a library chain and a program importing
  the same chain report the same order.
- **A library body's effects never happen in a session that never imports it** → True, and it is
  what "deferred" means. It is also already true of the run door, which inits only a program's
  closure, so this makes the REPL *more* like a delivered program rather than less. Worth stating
  in the spec, which it is.
- **An init trap leaves the JIT'd heap half-mutated** → Unavoidable for any initialization that
  fails partway, and no worse than today's startup failure. The change the spec requires is that
  the session not *also* gain the library's names; D2 delivers that by ordering.
- **`src/repl-core.ss` is in `CORE_FLAT`** → the regen barrier. See Migration Plan.

## Migration Plan

No user-facing migration: the change is internal to one door and has no flag, no artifact format
change, and no cache-key change.

The build discipline is the constraint. `src/repl-core.ss` is a compiler source in `CORE_FLAT`, so
per `CLAUDE.md`: finish every compiler-source edit, then `make regen` (~5 min, converges at
iteration 2 after a source edit), then `./run-all-tests.sh` (~10 min), then `./run-dev-tests.sh`
(~14 min). Do not interleave further compiler-source edits with the regen. `src/emit.cpp` is host
C++ and reaches the binaries through plain `make`, so the host half can be iterated without regen;
iterate the core half with `chez --libdirs src --script src/compile.ss` and regen once at the end.

Rollback is a revert: the change adds no persisted state and no artifact anyone else can hold.

## Open Questions

- Should the import-time narration name only the library the user imported, or every library in
  the closure it initialized? The latter is more informative in a deep chain and noisier in a
  shallow one. Cosmetic, verbose-only, and settleable when the line is written.
