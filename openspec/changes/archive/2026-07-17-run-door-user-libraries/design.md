## Context

The module system has three doors, all sharing one compile-unit core:

```
                       manifest + files          compile-unit core
                       ────────────────          ─────────────────
   AOT door   bin/scheme-compile / compile.ss  → build-modular-artifacts*
     (Chez or --emit)   reads manifest, topo-loads units, then
                        compile-program-with-imports(prog, direct-tables, order)

   REPL door  src/repl/host.cpp                → repl-core.ss modes
     (Chez-free)        preload_libraries(): host reads manifest (mode 5) + each
                        source, mode 4 compiles each unit → (ir . init-symbol),
                        JITs it, mode 6 auto-imports (scheme base); forms via mode 3

   RUN door   src/run.cpp                       → entry-embed.scm  ◀── THE GAP
     (Chez-free)        calls the BATCH entry: read stdin, bake in (scheme base),
                        return (scheme base)+program IR. NO manifest, NO file I/O,
                        so (import (mylib)) is unbound.
```

`src/run.cpp` links the **batch** embedded entry (`entry-embed.scm` → `bootstrap/embed.ll`),
which by design has "no manifest and no filesystem" (`src/core.ss:80,114`). The REPL host
links the **mode-dispatched** entry (`entry-repl.scm` → `bootstrap/embed-repl.ll`) and does
all file/manifest I/O host-side, feeding source text to the compiler through a tiny mode
protocol (`src/repl-core.ss:332-354`). The REPL's `preload_libraries()`
(`src/repl/host.cpp:154-231`) is precisely the Chez-free user-library loader this change
needs — it topologically loads manifest units into a shared JITDylib, detecting cycles and
missing-from-manifest imports.

The AOT door compiles the *program* against its direct imports' export tables via
`compile-program-with-imports` (`src/compile.ss:553`); the emitted program module is already
documented as byte-identical to what the JIT/embedded path would run.

## Goals / Non-Goals

**Goals:**
- `scheme-run` loads user libraries via the manifest and runs importing programs, Chez-free.
- **Reuse, not fork**: drive the same manifest resolution + compile-unit core the AOT and
  REPL doors use; add no second resolution path.
- Byte-identical program/unit modules vs the AOT door (fidelity by construction).
- Zero behavior change for programs that import only `(scheme base)` or nothing.

**Non-Goals:**
- Manifest schema growth (bin/project entry) — packaging slice #2.
- Any dependency/registry/version/lockfile model — undecided, out of scope.
- Unified `emit` CLI / binary renames — packaging slice #1.
- Full whole-closure `--emit` for multi-unit programs may be scoped as follow-up (see Open
  Questions); the JIT run path is the deliverable here.

## Decisions

**D1 — Host-side manifest/file I/O, factored out of the REPL host and shared.** Lift
`preload_libraries()` (and its helpers) out of `src/repl/host.cpp` into a shared C++
translation unit consumed by both `host.cpp` and `run.cpp`. The compiler stays filesystem-
free; the host owns I/O. *Alternative:* teach `entry-embed.scm` to resolve imports — rejected:
it violates the embedded compiler's "no filesystem" invariant and forks a second resolution
path, exactly what the charter's "one compiler core" goal forbids.

**D2 — The run host drives the mode-dispatched entry, not the batch entry.** `scheme-run`
links `bootstrap/embed-repl.ll` (the mode-dispatched compiler) so it can call mode 5
(manifest text → source paths) and mode 4 (library source → unit IR + init symbol), reusing
the REPL's proven loader. This collapses the run and REPL hosts toward one core (charter-
aligned). *Cost:* the dispatched entry is larger than the batch entry (~2.15 MB vs ~2.0 MB IR),
so `build/scheme-run` grows modestly; measured and reported per the output convention.
*Alternative:* keep the batch entry and add manifest logic beside it — rejected (second path).

**D3 — Program compilation reuses `compile-program-with-imports` verbatim, via a new mode
(mode 7).** After the host preloads the units (D1/D2), a new dispatched mode reads the whole
program text and calls the **same** `compile-program-with-imports` the AOT door calls
(`src/core.ss:362`) with the same four inputs: the baked-in prelude's macro forms, the program
forms, the program's DIRECT imports' export tables, and `init-libs` = the program's transitive
import closure in topological order. Same function + same inputs ⇒ the run-door program module
is byte-identical to the AOT `prog.ll` — fidelity by construction. It is a *fresh* whole-program
compile (it does not thread the incremental session macro-env), exactly like the batch
`compile-source-rehomed` (`src/core.ss:155`), which already drives this function for the
`(scheme base)`-only case. *Alternative:* run the program as REPL forms through mode 3 —
rejected: a program's single-`scheme_entry` / trailing-value semantics differ from incremental
REPL evaluation and would not share the AOT program-module bytes.

Two mechanics this depends on, discovered while grounding the port:

- **The host must JIT-add each unit module WITHOUT running its `__init`.** The program module's
  `@scheme_entry` runs each `init-libs` unit's one-shot `__init` in topo order before the body
  (`src/core.ss:357-360`) — exactly as a fresh AOT executable does. This differs from the REPL
  preload, which runs `__init` at load time (there is no program entry to do it interactively).
  The shared loader (D1) therefore takes an "init now?" flag: true for the REPL, false for the
  run door. Running both would double-initialize.
- **`init-libs` (the transitive closure in topo order) is computed in-language.** The driver's
  `toposort-libs` / `with-scheme-base` live in the Chez-only `src/compile.ss` and read files, so
  they cannot be reused in the embedded compiler. Mode 7 instead records each loaded library's
  direct imports in session state (extending `*repl-libs*` bookkeeping) and runs a small
  in-language topological closure over that in-memory graph — no second file-reading path. It
  prepends `(scheme base)` to the program's direct imports (the in-language equivalent of
  `with-scheme-base`), matching the AOT door.

Program-module entry name is `scheme_entry`: the JIT'd program module's definition wins over the
linked-in compiler's `scheme_entry` (a process-symbol fallback in the JITDylib), so
`JIT->lookup("scheme_entry")` resolves the program — the pattern today's `run.cpp` already relies
on. The C++ side keeps calling the compiler dispatcher through the extern link symbol, unaffected.

**D4 — Preserve the current fast path exactly.** When the program imports only `(scheme
base)` (or nothing) and no manifest resolves user libraries, keep today's behavior: bake in
`(scheme base)`, emit the two-module `(scheme base)`+program bundle, JIT and run. The
manifest/preload path engages only when the program imports a non-baked-in library. This
guarantees no regression for existing programs and demos.

**D6 — `(scheme base)` is always baked-in from `*prelude-source*`; the manifest is consulted
only for USER libraries.** `(scheme base)` has a real source (`lib/scheme/base.sld`, generated
from `src/prelude.scm`) and is listed in every manifest, and the AOT/REPL doors build it from
that file. But the batch runner deliberately bakes it in so a plain `scheme-run < prog.scm`
needs no manifest and no filesystem — the self-contained property D4 protects. So mode 7 builds
`(scheme base)` from the baked-in `*prelude-source*` exactly as `compile-source-rehomed` does
today (returning the `(scheme base)` module + boundary + program module), and only *user*
imports come from the manifest via the host preload. Byte-identity with the AOT door still
holds because `lib/scheme/base.sld` is generated from the same `src/prelude.scm` the baked
source comes from — the equivalence the batch runner already relies on. Consequence: a program
importing a user library requires a manifest (as the AOT/REPL doors do); a plain program never
does. To keep the closure/table assembly uniform, mode 7 registers the baked `(scheme base)`
into session bookkeeping (`*repl-libs*` / the import-graph) before computing the program's
direct-import tables and topological `init-libs`.

**D5 — Init and run order mirror the REPL host.** JIT each unit and invoke its `L:__init`
exactly once in topological order (diamond-safe, as the REPL already does), then look up and
call the program's `scheme_entry`. The existing trap/`setjmp` handling in `run.cpp` is
unchanged.

**D7 — Keep a batch bootstrap runner; ship the dispatched one (decision made during
implementation).** `tools/regen.sh` seeds its bootstrap compiler as `run.o + embed.ll` (the
batch entry) and drives the whole self-hosting fixed point through it via `scheme-run --emit`.
A dispatched `run.o` cannot drive the batch `embed.ll`, so swapping the shipped runner's entry
(D2) collides with the bootstrap. Resolution: preserve today's batch runner as `src/run-boot.cpp`
and have regen link it into `build/scheme-run-boot` for the fixed point — the fixed-point logic
is byte-for-byte unchanged, only the runner is renamed. The shipped `build/scheme-run` is then
linked by `make all` from `run.o + embed-repl.ll` (the dispatched, module-aware door) and never
participates in the bootstrap. `embed.ll` stays as the bootstrap runner's backing. *Alternative
(Y):* retarget the entire fixed point onto `embed-repl.ll` and retire `embed.ll` — rejected:
higher risk to the self-hosting core, for no near-term benefit. This is a pure factoring choice.

## Risks / Trade-offs

- **[The new program-with-imports mode is the one genuinely new compiler surface]** → keep it
  a thin wrapper that forwards the host-supplied direct-import tables to the existing
  `compile-program-with-imports`; add a byte-identity test (run-door program module ==
  AOT-door `prog.ll`) so any divergence fails loudly.
- **[Emitter IR changes ⇒ regen]** → adding a mode to `repl-core.ss` changes emitted
  `embed-repl.ll`/`embed.ll`; run `make regen` + the trust-check (clean-tree regen leaves
  `git diff bootstrap/` empty). Runtime C is expected unchanged.
- **[Binary growth]** → linking the dispatched entry grows `scheme-run`; measure and report,
  and confirm it stays within the project's small-clean-binary intent (it is the same IR the
  REPL host already links).
- **[`--emit` and multi-unit programs]** → today `scheme-run --emit` emits `(scheme
  base)`+program. With user imports the Chez-free AOT front-half (`bin/scheme-compile`) must
  emit the full transitive closure, boundary-separated, or explicitly defer multi-unit
  `--emit`. Decide scope (Open Questions) so `bin/scheme-compile` does not silently drop units.
- **[Missing-from-manifest / cycle errors]** → reuse the REPL loader's fixpoint-with-no-
  progress detection so the run door reports the same diagnostic rather than looping.

## Open Questions

- **Does D3 need a brand-new mode, or can an existing mode be generalized?** Confirm during
  implementation whether the session already exposes a "compile program against current
  scope" path that can be reused instead of a new mode number.
- **`--emit` multi-unit scope.** Land full transitive-closure `--emit` in this change, or
  scope this change to the JIT run path and follow up on `--emit`/`bin/scheme-compile`? Lean
  toward including it if the preload machinery makes the unit list readily available; else
  follow-up with an explicit note (no silent unit-dropping).
