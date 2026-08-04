## Why

The baked library set — `(scheme base)` and the `(emit internal)` substrate it imports — is
registered on the run and build doors but **not** on the REPL or `emit lib` doors. Those two doors
resolve `(scheme base)` from the manifest instead, so in any directory whose manifest does not name
it they have no standard library at all. Measured in a scratch project whose manifest names only the
project's own libraries:

```
$ emit repl                      # in a user project directory
error: library lib/stats.sld: unresolved or cyclic import (dependency missing from manifest?)
warning: auto-import (scheme base): (scheme base) not loaded (missing from manifest?)
> (map (lambda (x) (* x x)) (list 1 2 3))
error: repl: unbound variable map

$ emit lib lib/stats.sld -o build/lib
emit lib: repl: unbound variable map
```

Neither is a manifest authoring mistake that better documentation could fix. The REPL is the
project's stated primary development loop (`CLAUDE.md`), and `emit lib` is the compile-unit door;
between them a user cannot develop a project interactively or compile a library artifact unless
their manifest re-points two entries into the Emit checkout's own `lib/` — paths no project should
have to know. The run and build doors already need no such entry, which is exactly the asymmetry to
remove. Issue **#39** filed the REPL half; the `emit lib` half was found while walking the workflow
this change documents and has no issue.

Doing it now, before the `0.1.0` tag and the Homebrew tap, is deliberate: a working project workflow
is the thing a first release is *for*, and both defects are in the doors a new user meets first.

## What Changes

- **Register the baked set on the REPL door.** `emit repl` SHALL build and register the baked set
  at session startup — as `emit run`/`emit build` do — before it preloads the manifest, and SHALL
  run each member's initializer in dependency order (a session has no program entry to drive them).
  A REPL started anywhere then has the standard library, and a project library that imports
  `(scheme base)` loads.
- **Resolve a lone library's imports, on every door.** `compile-library-form` (`src/core.ss`)
  hardcodes empty import tables, so *every* lone-`define-library` compile resolves no imports —
  `emit lib` and `emit run --emit < lib.sld` both fail on a library that imports `(scheme base)`.
  The resolved tables SHALL be threaded in: from the baked set in-core, and from the session (baked
  members plus preloaded manifest libraries) on the host-driven modes. `emit lib` SHALL additionally
  seed its session and register the baked set *before* deriving the export table, so both artifacts
  come from one import environment. Today only an import-free library compiles, which is why
  `test/modules/mylib.sld` passes and a four-line library using `map` does not.
- **Report a lone library's unresolvable import.** A `define-library` importing a library that is
  neither baked nor in the manifest compiles **silently** today, while a *program* importing one is
  correctly rejected. The lone-library path SHALL report it and write no artifact. Found while
  testing this change; the same asymmetry and the same fix as the item above.
- **A manifest entry naming a baked member becomes a no-op on every door.** The
  already-loaded guard in `repl-load-library-text` that makes the run door tolerate a manifest
  listing `(scheme base)` SHALL apply to the REPL and `emit lib` too, for every member of the baked
  set. The repository's own `emit-libs.scm` keeps its `(scheme base)` / `(emit internal)` entries and
  keeps working; a user project's manifest no longer needs them. This closes **#39** without
  removing the entries the Chez driver still resolves from the manifest.
- **The baked set wins over a manifest entry for the same library.** A consequence worth stating:
  after this change, editing `lib/scheme/base.sld` no longer changes what `emit repl` sees until
  `make regen`, exactly as it already does not change what `emit run` sees. That is the existing
  "committed IR is authoritative, never silently rebuilt" stance (design D4 of
  `fix-stale-repl-host-rebuild`), applied consistently rather than a new rule.
- **Add user documentation: `docs/PROJECTS.md`** — how to develop and compile your own Scheme
  project against a cloned Emit checkout with LLVM installed: project layout, writing a library,
  the manifest, the `emit repl` development loop, `emit build` for a delivered executable,
  `emit lib` for a single artifact, which names need which `import`, `--dump`, and the current
  limits. Written against the fixed doors, so it needs no workaround paragraphs, and verified by
  building the project it describes.
- **Drop the leaked `repl:` prefix** from diagnostics on the non-REPL doors, so `emit lib` reports
  `emit lib: unbound variable map` rather than `emit lib: repl: unbound variable map`.
- **Name an unreadable manifest source instead of crashing.** A manifest entry whose `(source …)`
  file does not exist **segfaults `emit repl`** at startup today (confirmed on `main`, so it predates
  this change): the host reads the missing file as `""`, mode 4 takes `(car '())` on the empty form
  list, and a primitive trap is not catchable by the in-language `guard` wrapping that mode. Because
  the REPL preloads eagerly, an entry the session never imports is enough. Both preload paths SHALL
  report the unreadable path and name it — the REPL keeping the session, the run door exiting
  non-zero. Found while adding the installed-session test; a typo'd path in a project manifest is
  exactly the first-day mistake this change exists to stop being fatal.

**Explicitly out of scope**, each noted in the documentation and filed rather than fixed here:

- `emit run` and a delivered executable both print the program's **final value**, so a program whose
  last form is `(newline)` prints a trailing `#<unspecified>`. The demo harnesses compare that value,
  so changing it is its own change.
- `emit --help` and `emit --version` do not exist (`emit --help` prints `unknown verb '--help'`).
  `--version` belongs to `homebrew-tap-distribution`; `--help` is a separate small fix.
- Issue **#36** — an *installed* `emit build`/`emit lib` still cannot find `tools/llvm-env.sh` or
  `src/runtime/runtime.c`. This change targets the cloned-checkout workflow, where both work.

## Capabilities

### New Capabilities
<!-- None. This makes an existing guarantee hold on two more doors; the documentation is a
     deliverable, not a spec'd capability. -->

### Modified Capabilities
- `module-system`: the baked-set requirement gains that **every door** registers the set before
  consulting the manifest, and that a manifest entry naming a baked member resolves to the baked
  one rather than loading a second copy. The REPL-door requirement changes: the session's standard
  library comes from the baked set, not from the manifest, so the manifest is consulted only for
  libraries outside the baked set.
- `emit-cli`: `emit lib` SHALL compile a library whose body resolves names through its imports —
  `(scheme base)`, another manifest library, or both — not only an import-free library. Diagnostics
  from the non-REPL doors SHALL not carry the `repl:` prefix.
- `interactive-repl`: a session started in a directory whose manifest does not name `(scheme base)`
  SHALL still have the standard library and the derived-form macros, and SHALL still load a project
  library that imports it.

## Impact

- **`src/emit.cpp`** — `compile_program` splits into a session-seeding step (init-session, register
  the baked set, preload the imported libraries) and a compile step, so `emit_lib` can seed once and
  then run both the export-table mode and the unit compile against that one session; `emit_repl`
  gains the baked-set registration plus a per-member initializer run before `preload_libraries`.
- **`src/repl-core.ss`** — mode 8's payload carries one initializer symbol **per member** in the
  modules' dependency order (the run door ignores the field today, so this is additive); the
  already-loaded guard's stale comment ("the REPL never double-loads") is corrected. **In
  `CORE_FLAT`, so this is IR-shaping**: `make regen`, the self-hosting fixed point, and the
  trust-check are all in play.
- **Tests** — new coverage that `emit repl` and `emit lib` work in a project directory whose
  manifest names only the project's own libraries; that a manifest naming a baked member still
  loads exactly one copy of it; and that `emit lib`'s unit IR stays byte-identical to the other
  doors' for the same source.
- **Docs** — new `docs/PROJECTS.md`, an index line in `docs/README.md`, and a pointer from
  `README.md`; `docs/MODULES.md`'s note that a hand-written manifest must also name
  `(emit internal)` is removed, since it no longer must.
- **Risk** — concentrated in the REPL startup sequence and in the bootstrap: the compiler is
  IR-shaping here, so task ordering must keep a working compiler at every step, and the REPL's
  startup cost changes shape (it compiles the baked set from the baked-in prelude source instead of
  loading `base.sld` from the manifest). Measure and report it; `--no-prelude` stays the fast path.
