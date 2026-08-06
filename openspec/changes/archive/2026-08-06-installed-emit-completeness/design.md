## Context

`manifest-search-path` (#35) gave the manifest lookup five ordered candidates and stopped at the
first that exists (`src/emit.cpp:255`, `module-system` spec "Locating the manifest"). That was the
right shape for the defect it fixed — an installed `emit repl` with no standard library at all —
and it left two holes that only appear once a *project* exists:

- a project's own `./emit-libs.scm` is candidate 3, so candidates 4-5 are never reached and the
  installed standard libraries vanish (#44);
- `emit build` locates `tools/llvm-env.sh` and `src/runtime/runtime.c` through `repo_root()`
  (`src/emit.cpp:219`), which strips `/emit` and `/build` from the binary's path on the assumption
  that it sits in a checkout (#36).

Both were measured against a real `make install` prefix; see the proposal for the transcript.

Two constraints shape everything below. **The from-source workflow cannot move**: every guard in
the tree (`test/self-emit-equiv.sh`, `test/module-scaffold-baseline.sh`, the byte-identity suites)
runs from a checkout, so the checkout candidate must stay first and must resolve exactly as it does
today. And **`homebrew-tap-distribution` is unstarted**, so its task 3.2 can be redirected at this
change's mechanism rather than reworked after the fact.

One correction to #36 recorded here because the tasks depend on it: the issue titles both doors,
but **`emit lib` is not affected**. `repo_root()` has exactly one caller (`src/emit.cpp:1086`, the
build door); `emit lib` emits `.ll` and never links. Verified from the install prefix —
`emit lib mine.sld` succeeds with no toolchain in the environment.

## Goals / Non-Goals

**Goals:**

- A project with its own manifest keeps the installed standard libraries, with no absolute path
  anywhere in the project's manifest.
- `emit build` from an install produces a working executable with nothing beside it and nothing in
  the environment.
- One resolution shape — "checkout first, installed second" — serves libraries, support files, and
  the toolchain, so there is one thing to learn and one thing to narrate.
- `homebrew-tap-distribution` consumes the toolchain-default mechanism instead of inventing it.

**Non-Goals:**

- A general library search path, or retiring the manifest (exploration open question 3). Chaining
  candidates the spec already lists is strictly smaller and answers the reported defect.
- Import sets, `(include-manifest …)` syntax, or any new manifest form.
- A prebuilt `runtime.o` / `libemitrt.a`. The install contract excludes compiled artifacts on
  purpose; the speed argument goes to `docs/PERFORMANCE.md`.
- Changing what `--manifest` / `EMIT_MANIFEST` mean.

## Decisions

### D1 — Chain the searched candidates; do not add an `(include-manifest …)` form

#44 offers two shapes. **Chosen: chain.** A library name the first manifest does not resolve falls
through to the next *searched* candidate, project manifest first and compiled-in prefix last.

Why not the explicit form: `(include-manifest …)` makes inheritance visible, but it puts a line of
boilerplate in every project for something that should be ambient, and the line has to name a path
— which is the very thing #44 is about — unless argument-less `(include-manifest)` is defined to
mean "whatever the search would have found", at which point it is the chain with a mandatory opt-in.
The standard library is not a dependency a project should have to declare.

The chain is also the smaller conceptual change: the spec already calls candidates 3-5 "a search".
This makes it a search *for a library* rather than a search *for a file*.

### D2 — An explicit request names exactly one manifest and does not chain

`--manifest FILE` and `EMIT_MANIFEST` stay single. The existing rule — an explicit request that
names a missing file is an error rather than a fall-through, because "falling through would
silently run against DIFFERENT libraries than were asked for" (`src/emit.cpp:255`) — has the same
force against chaining. This is what keeps a hermetic build expressible: one flag, one manifest,
nothing ambient.

So the ladder splits cleanly: **explicit = exactly that file; searched = a chain.**

### D3 — First manifest wins per name; the chain resolves names, not files

For a library both manifests define, the earlier candidate wins — a project can override a shipped
library by naming it, which is the behaviour the current first-match accidentally provides and the
only part of it worth keeping. A relative `(source …)` continues to resolve against **its own**
manifest's directory; that rule does not change, it merely now applies to more than one manifest.

### D4 — Program-entry lookup does **not** chain

`emit build NAME` resolves a `(program …)` entry. That is project-specific by nature, and chaining
would mean a typo'd program name reaching into the installed manifest before failing. Program
lookup stays first-manifest-only, so `emit: no program entry in manifest <path>` keeps naming the
project's own manifest — the file the user can actually fix.

Only *library* resolution chains.

### D5 — Support files are found by the manifest lookup's shape, at repo-relative subpaths

`repo_root()` is replaced by a resolver taking a repo-relative path and trying: the checkout layout
first, then `<exe>/../share/emit/<relpath>`, then `<EMIT_PREFIX>/share/emit/<relpath>`. `make
install` places the files at those same repo-relative subpaths — `share/emit/tools/llvm-env.sh`,
`share/emit/src/runtime/runtime.c`.

Mirroring rather than flattening is the convention the install target already follows and explains
for `lib/` ("the installed tree has to mirror the repo's lib/ layout rather than flatten it").
Keeping the subpaths identical means the resolver is one function with no per-file path rewriting,
and a support file added later needs no new lookup.

**`tools/log.sh` ships too.** `llvm-env.sh` sources it (`. "$_llvm_env_dir/log.sh"`) for its
`say`/`vsay` narration, so installing the script alone would produce a script that fails on its
first line. Easy to miss; it is a task.

### D6 — Both halves of #36's toolchain fix, layered

The issue offers "install `llvm-env.sh`" and "bake the toolchain in" as alternatives that "can land
separately". Take both, in one precedence ladder:

```
  1. CC / GC_INC / GC_LIB (+ EMIT_GC_* mirrors)   explicit env      — unchanged
  2. tools/llvm-env.sh --print-env                discovery         — now findable when installed (D5)
  3. EMIT_DEFAULT_CC / _GC_INC / _GC_LIB          compiled-in       — NEW, lowest
```

They are not redundant. Layer 2 re-discovers at run time, so a user who upgrades LLVM after
installing Emit is followed rather than stranded — and `llvm-env.sh` already searches the Homebrew
keg paths directly (`/opt/homebrew/opt/llvm*/bin/llvm-config`), so shipping it covers most of the
keg-only case on its own. Layer 3 is the floor: the values `make` resolved when this binary was
built, recorded the way `EMIT_PREFIX` already is, for when discovery finds nothing at all.

Ordering layer 3 *below* discovery is deliberate and matches `toolchain-discovery`'s existing
"explicit overrides take precedence over discovery" requirement — a baked path is the stalest
information in the system and must never beat a live answer.

This is the mechanism `homebrew-tap-distribution` task 3.2 describes. That change's task becomes
"depends on `installed-emit-completeness`" rather than a second design.

### D7 — The REPL preloads the union of the chain; the lazy doors resolve on demand

The doors already differ: the REPL preloads **eagerly** (`src/emit.cpp:760`ff — "a manifest entry
the session never imports still reaches this"), while run/build resolve the transitive closure of
what the program actually imports.

Under a chain the lazy doors need no decision — an unresolved name simply walks to the next
manifest. The REPL does: preload the first manifest only, or the union? **Union.** An installed
REPL having the full standard surface interactively is the same argument #35 made when it fixed the
REPL door, and a session where `(import (scheme file))` fails because the project's manifest does
not mention it would reintroduce #44 one layer up.

The cost is REPL startup compiling the installed manifest's non-baked libraries. Measuring it is a
task; if it is material, the fallback is to preload the first manifest eagerly and later ones on
demand, which is a strictly internal change to `preload_libraries`.

**Measured (task 3.6): ~78 ms, and the union stands.** From a project directory holding a manifest
that names only its own program, driving an installed `emit repl` (macOS/arm64, 8 runs each,
interleaved): **591 ms** with the chain suppressed (`--manifest ./emit-libs.scm`, so the project's
own manifest and nothing else) against **667 ms** chained, where the installed manifest contributes
five libraries — `(emit internal)`, `(scheme inexact)`, `(scheme cxr)`, `(scheme read)`,
`(scheme file)`. That is ~13% on top of a startup already dominated by the prelude and the baked
set, for the full standard surface at the prompt. Not material; the eager-first-plus-on-demand
fallback is not taken.

### D8 — Narration reports the chain

`say_manifest()` currently prints one line. With a chain it reports what was actually resolved, in
`docs/OUTPUT.md` form — the searched candidates that exist, in order, on stderr. "Which
`emit-libs.scm` am I getting?" must stay a one-line answer now that the answer can be plural; a
door that silently consults two manifests is worse than one that consults the wrong one.

## Risks / Trade-offs

- **A project unknowingly resolves a library from the installed manifest, and the same source built
  elsewhere resolves it differently.** → This is the intended behaviour for the standard library
  and the reason the change exists, but it is real ambient state. Mitigated by D8's narration and
  by D2: a build that must be hermetic says `--manifest`, and gets exactly one file.
- **REPL startup slows by the installed manifest's library compiles** (D7). → Measure before
  believing it matters; the fallback is internal and does not change any requirement.
- **A baked toolchain path goes stale** — the LLVM it names is upgraded or removed. → Layer 3 is
  the lowest precedence, so live discovery wins whenever it produces an answer; the stale value is
  only ever reached when the alternative is failing outright. It should still fail with a message
  naming the compiled-in path rather than clang's own error.
- **`resolve_manifest()` returning a list touches every door.** → Mechanical, but it is the widest
  blast radius here; the doors' existing behaviour in a checkout is pinned by the byte-identity
  suites, which is the guard that this refactor is transparent.
- **Installing `llvm-env.sh` makes a developer script part of the install contract.** → It is
  already the single source of toolchain truth for the Makefile and the Chez driver; shipping it
  makes an existing dependency visible rather than creating one. Its `log.sh` dependency (D5) is
  the concrete edge.

## Migration Plan

No user-visible break. A project that today names a standard library with an absolute path keeps
working — its own entry is candidate 1 in the chain and wins. Removing that line becomes possible,
and `docs/PROJECTS.md`'s sharp-edge note becomes a note about what changed.

Rollback is per-decision: D1 and D5/D6 are independent, and either can land without the other.

## Open Questions

1. Should `emit build` narrate which layer of D6's ladder supplied the toolchain, or only when it
   falls to the compiled-in default? Narrating always is more transparent and noisier.
2. Does `make install` need to record the *prefix-relative* location of the support files anywhere
   the Homebrew formula can read, or is `<prefix>/share/emit/` stable enough to hardcode in the
   formula? (Deferrable to `homebrew-tap-distribution`.)
