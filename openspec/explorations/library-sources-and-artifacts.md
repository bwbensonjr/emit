# Exploration: library sources, baked artifacts, and the manifest

Status: exploration / living roadmap (individual steps become their own changes)
Related:
- GitHub **#18** (R7RS library declarations: `include`, `include-ci`, `include-library-declarations`, `cond-expand`), **#31** (bake `lib/scheme/base.sld` instead of `src/prelude.scm`), **#33** (R7RS surface audit — nine names Emit ships in `(scheme base)` that R7RS puts elsewhere)
- `openspec/changes/homebrew-tap-distribution` (the install story this note turns out to touch)
- archived `2026-08-03-scheme-base-declared-surface` (#29 — made the surface declarable, which is what made these questions askable)
- `openspec/explorations/packaging-and-emit-cli.md` (D7's "settle modules before packaging"), `openspec/explorations/modules-v0-design.md`, `openspec/explorations/modules-and-embedding.md`
- `docs/MODULES.md` (the manifest, the `.exports` table, the lazy preload, and "import specifiers are whole-library only")
- `CLAUDE.md` design goals: standalone executables as a first-class deliverable; a module is the shared unit of compilation; R7RS-small as the module surface
Captured: 2026-08-03 (against `main` at `ab5aa0d`)

## Why this note exists

Three open issues each answer part of a question none of them asks on its own: **what is the
relationship between a library's source, the artifact a door consumes, and the manifest?** #18 adds
a third way source becomes a library body (`include` splices before anything else runs), #31
collapses two derivations of `(scheme base)` into one, and #33 multiplies the number of libraries.
Deciding the shared question once is what keeps them from re-litigating it three times.

## Today's picture

```
   SOURCE                    ARTIFACT                  HOW A DOOR FINDS IT
   ══════                    ════════                  ═══════════════════

   src/prelude.scm ──gen──▶ lib/scheme/base.sld ──┐
        │                   (committed)            ├──▶ manifest  (Chez driver)
        │                                          │    emit-libs.scm
        └────────bake───▶ *prelude-source* ────────┤
                          (string in the compiler) └──▶ BAKED: the library form is
                                                        rebuilt in-language by
                                                        scheme-base-library-form
                                                        (run / build / REPL doors)

   lib/scheme/inexact.sld ──────────────────────────▶ manifest, lazily preloaded
   (hand-written)                                     (transitive closure of imports)
```

`(scheme base)` uses **both** mechanisms; `(scheme inexact)` is deliberately ordinary
(`docs/MODULES.md` says so, and that is the point of shipping it that way). Both derivations of
`(scheme base)`'s export list now read one declaration (`src/prelude-surface.scm`, #29), so they
cannot disagree about the *surface* — but they remain two derivations of the *artifact*.

## Finding 1 — the axis is *in the binary* vs *on disk*, and it is already user-visible

The default manifest is the literal string `"emit-libs.scm"`, resolved against the **current
directory** (`src/emit.cpp:409`, `:579`, `:867`, `:956`), with no exe-relative and no
install-prefix fallback. A missing manifest is not an error — `preload_user_libraries`
(`src/emit.cpp:230-235`) returns "no manifest: no user libraries" — so the failure surfaces later,
at the import.

Measured from a directory outside the repo:

```
$ cd /tmp
$ echo '(display (map (lambda (x) (* x x)) (list 1 2 3)))' | emit run
(1 4 9)                                                   ← baked: works anywhere

$ echo '(import (scheme inexact)) (display (sqrt 2.0))' | emit run
emit: program imports a library not found in the manifest  ← on disk: does not
```

That is the design showing through rather than a defect: a **baked** library is CWD-independent, a
**manifest** library is not. Every question below is really about which side of that line a library
sits on.

> **AMENDED** (`baked-set-on-every-door`). The axis is right, but the claim that a baked library is
> CWD-independent held only on the **run** door when this was written. The REPL and `emit lib`
> resolved `(scheme base)` from the manifest, so on those two doors even a *baked* library was
> CWD-dependent — measured from a user project directory, `emit repl` had no standard library at all
> and `emit lib` could not compile a library that imports one. The RESOLVED note in Finding 2 spotted
> the REPL half (as #39); the `emit lib` half was never filed. Both are fixed: **every door now
> registers the baked set before it consults the manifest**, so Finding 1's sentence is true as
> written for the first time.
>
> Two things that change the map above. A manifest entry naming a baked member is now a no-op on the
> Chez-free doors (the baked member wins), which is what lets this repository keep the entries the
> Chez driver needs. And the deeper cause was not door wiring at all: `compile-library-form`
> hardcoded empty import tables, so *every* lone-`define-library` compile resolved no imports on any
> door — the tables are now threaded in. Open question 3 below (manifest as a single file vs. a
> library *path*) gained a concrete symptom in the process: a project's own `emit-libs.scm` shadows
> an installed one entirely, so a project that imports `(scheme inexact)` must name it even on a
> system where Emit is installed.
>
> **That closing symptom is gone** (`installed-emit-completeness`, issue #44). The searched
> candidates 3–5 now **chain**: every one that exists is consulted, in order, and a library *name*
> resolves to the first manifest that names it — so a project manifest *extends* the installed one
> instead of replacing it, and needs no absolute path into the prefix. An explicit `--manifest` /
> `EMIT_MANIFEST` still names exactly one file and is never extended, which is what keeps a hermetic
> build expressible. Open question 3 is thereby **narrowed, not settled** — see its note below.

## Finding 2 — #33 moves nine names across the line, and it collides with packaging

> **LANDED** (`scheme-base-partition`). Sixteen names, not nine — the nine `cxr` forms were #33's
> count for that group alone. The packaging collision below is real and was resolved exactly as this
> finding's RESOLVED note says: #35 first, then relocate. See open questions 2 and 6, both now
> answered, and note what this finding did not foresee — the relocated procedures need private
> port/reader machinery, so the change also introduced a baked internal substrate that `(scheme base)`
> itself imports.

Relocating `read` (→ `(scheme read)`), the depth-3+ `cxr` forms (→ `(scheme cxr)`), and the six
file procedures (→ `(scheme file)`) moves them from *in the binary* to *on disk*. A program calling
`read` would stop working outside a directory that can see `emit-libs.scm` and `lib/`.

It is already latent: `homebrew-tap-distribution` installs the binary and never mentions
`emit-libs.scm` or `lib/` (checked across its proposal, design, and specs), so a brew-installed
`emit` cannot `(import (scheme inexact))` today. #33 would escalate that from "one optional library
is unreachable" to "part of R7RS-small is unreachable."

| Way out | Cost | Note |
|---|---|---|
| Bake the relocated libraries too | Compiler grows; `scheme-base-library-form` generalizes to N libraries | Preserves standalone behaviour; contradicts the deliberate "(scheme inexact) is ordinary" stance |
| **Give the manifest a search path (exe-relative, then `$PREFIX/share/emit`, then CWD)** | Host-side, small | **CHOSEN — landed as `manifest-search-path` (#35)** |
| `(scheme base)` re-exports relocated names for a window | Cheap, temporary | Needs import sets, which do not exist (`docs/MODULES.md`: whole-library imports only) |

**This decision must precede #33**, and it is a product question — *should an installed `emit` have
the full standard surface with no files beside it?* — not a compiler one.

> **RESOLVED (2026-08-03).** The **search path** was taken, not bake-more: an installed library is
> found on disk beside the binary rather than compiled into it, so #33 may relocate names out of
> `(scheme base)` without making them unreachable. Open question 1 below is thereby answered *no* —
> an installed `emit` is not expected to carry the full standard surface in its binary; it is
> expected to carry it in `<prefix>/share/emit/`. Two things landed with it that the note did not
> anticipate:
>
> - **The defect was worse than measured here.** The `emit repl` door resolves even `(scheme base)`
>   through the manifest (eager preload, mode 5), so from outside the repo an installed REPL had
>   *no standard library at all* — `map` unbound, primitives only. Finding 1's "baked libraries are
>   CWD-independent" holds for the run door; it never held for the REPL.
> - **A second, independent instance of the same family**, now #36: `emit build`/`emit lib` locate
>   `tools/llvm-env.sh` and `src/runtime/runtime.c` through `repo_root()`, which assumes a checkout,
>   so they still do not work from an install. That is toolchain/runtime, not library resolution,
>   and it overlaps `homebrew-tap-distribution` task group 3.

## Finding 3 — #18's `include` has exactly one shape that keeps the Chez driver

> **LANDED** (`library-include-declarations`, 2026-08-07). Shape (a) is what was built, and the
> prediction held exactly: `src/include-reader.ss` rides `CORE_FLAT` and is excluded from the
> driver's include block (the `src/dump.ss` arrangement), the driver installs its own reader over
> Chez ports, and `src/core.ss` still performs no I/O. Two things this finding did not foresee.
> The reader protocol needs a **token**, not just forms: a nested include is expanded *after* the
> reader returned, so a door-side "current file" would already be stale — the core threads the
> token back as the next call's base. And `cond-expand` landed **with** the include family rather
> than before it (step ② and ③ together): both `include-library-declarations` and `cond-expand`
> splice at the *declaration* level, so one recursive walker serves both and doing them separately
> would have meant writing that loop twice.

`src/core.ss` performs no I/O by design, and the tree already contains two different ways around
that. They are not equivalent:

```
  (a) INJECTED SIDE-CHANNEL              (b) %-PRIM FILE READS
      the shape of `dump`                    the shape of src/dump.ss
      host reads; core splices forms         core reads through port primitives
      ✓ works on all four doors              ✗ Chez cannot EVALUATE %-ops, so the
      ✓ core stays I/O-free                    driver's include block excludes the file
      ✓ mirrors how `emit lib` already       → the Chez driver would lose `include`
        hands source TEXT to the core          (tools/regen.sh's note on dump.ss)
```

Only (a) survives the Chez driver, which is where the byte-identity guarantees live
(`test/self-emit-equiv.sh`, `test/dump-parity-tests.sh`, `test/prelude-base-run-tests.sh`). So the
`include` family wants an injected `path -> forms` reader, supplied by whichever door is driving,
exactly as `dump` is threaded today.

Everything (b) would require now exists in Scheme — `read` on ports, `open-input-file`,
`with-output-to-file`, plus `render-datum` (`src/repl-core.ss:489`) for writing data back out. That
matters for #31, not for #18.

`cond-expand` needs neither and is genuinely separable, as #18 already argues: evaluate feature
requirements in `parse-define-library` and splice the selected declarations. It is the one piece
that can land any time.

## Finding 4 — ordering: #18 before #31, or re-derive

Once a library can `include`, "the source" is no longer one file, so **what gets baked must be the
post-splice form**. Bake first and the splicer forces the question open again.

## Finding 5 — baking freezes `cond-expand`

> **DECIDED** (`library-include-declarations`, design D12). Stated rather than discovered later: a
> baked library resolves its feature requirements at bake time, which for the baked set is the
> correct reading because those libraries *are* the implementation; a manifest library is compiled
> when it is imported, so nothing is frozen there. No shipped library uses `cond-expand`, so the
> commitment costs nothing today. This answers open question 4.

A baked library resolves feature requirements at *bake* time, against the compiler that baked it,
not at the importer's compile time. For `(scheme base)` — part of the compiler — that is arguably
correct, and for a user library resolved through the manifest it is clearly wrong. Either way it is
a semantic commitment to state, not a behaviour to discover later.

## Finding 6 — the case against #31 is narrower than it was filed as

#31 was deferred (design D6 of the #29 change) because a Chez-generated file would become
load-bearing for the Chez-free build. Two facts cut against that:

- `lib/scheme/base.sld` is **already** a build input: `tools/regen.sh:96,102` derives
  `bootstrap/scheme.base.ll` from it. It is load-bearing now.
- Baking it makes door *divergence impossible*. Today a stale `base.sld` means the driver and the
  run door disagree; afterwards both are consistently stale, and `test/scheme-base-surface-check.sh`
  (Chez-free, added by #29) already catches stale. The failure mode becomes less interesting, not
  more.

What survives is a **bootstrap cycle**: a generator that runs under `build/emit` needs a working
`emit` to produce an input to building `emit`. That is breakable exactly the way `bootstrap/*.ll`
breaks it — `base.sld` stays committed — but it should be a stated invariant rather than a
coincidence. Note the prize is real: the baked string shrinks from ~65.6 KB to ~32.1 KB (the `.sld`
carries no comments), removing ~33 KB from each of `embed.ll` and `embed-repl.ll`.

## Sequence that falls out

```
  ① manifest search path  ✅ LANDED (#35, manifest-search-path)   ← unblocked brew
        │
        ├──▶ ②③ #18 cond-expand + include family  ✅ LANDED (library-include-declarations)
        │         (one declaration-level splicer; injected reader, tokens threaded back)
        │
        ├──▶ ④ #33(a) partition  ✅ LANDED (scheme-base-partition)  ← did NOT need ②/③
        │       (BREAKING; landed before the 0.1.0 tag, as intended)
        │
        └──▶ ⑤ #31 bake the spliced .sld        ← after include exists, after the partition settles
                  #33(b) §6 absence audit       ← additive; floats anywhere
```

Step ① did not come from any of the three issues. It was the cheapest item with the widest reach,
and it landed first (#35).

**④ landed without ② or ③, which the diagram above had as prerequisites.** The dependency was on
the assumption that splitting the prelude across libraries needs `include` to avoid duplicating
source. It does not: ONE generator emits N `.sld` files from one partition map — which answers open
question 6 in favour of its first branch, and removes #18 from #33's critical path entirely. ②/③ have since landed
together, and ⑤ — which Finding 4 says must wait for the splicer — is now unblocked.

Each step keeps the property the repo's guards depend on: one IR-shaping change at a time, so each
`test/module-scaffold-baseline.sha256` re-record can be explained as a specific delta the way the
protocol in that script's header requires.

## Open questions

1. ~~**Should an installed `emit` have the full standard surface standalone?**~~ **ANSWERED** by
   #35: no — search-path, not bake-more. An installed `emit` carries its libraries in
   `<prefix>/share/emit/`, so #33 may relocate names freely. See the RESOLVED note in Finding 2.
2. ~~**Does `(scheme base)` re-export relocated names during a deprecation window?**~~
   **ANSWERED** by `scheme-base-partition`: there is no window, and it was never a preference.
   `compile-library*` (`src/core.ss`) rejects "export of a name the library does not define", and a
   unit's export table maps each external name to a symbol mangled *to that unit* — so
   `(scheme base)` cannot re-export what it imports without new re-export machinery (and plausibly
   import sets, which do not exist). Clean break, which is what pre-`0.1.0` is for.
3. Is the manifest the right long-term resolution mechanism, or should there be a library *path*
   with the manifest as one entry?
   **NARROWED** by `installed-emit-completeness` (issue #44), not answered. The symptom that made
   this urgent — a project's own `emit-libs.scm` hiding the installed one, so the project lost every
   shipped library it did not name — is fixed by chaining the searched candidates the spec already
   listed: resolution walks them in order and takes the first manifest that names the library, so an
   earlier manifest extends a later one. That is strictly smaller than a library path: it adds no new
   manifest form, no `(include-manifest …)`, and no new configuration surface, and it deliberately
   does not decide whether libraries should be discoverable by *location* rather than by name-to-file
   mapping. The question stands for whatever motivates it next — third-party packages, versioned
   dependencies, artifact reuse across projects — with the pressure taken off.
4. ~~`cond-expand` at bake time or at the importer's compile time — and does the answer differ for a
   baked library versus a manifest one?~~ **ANSWERED** by `library-include-declarations` (design
   D12): bake time for a baked library, importer's compile time for a manifest one, and yes the
   answer differs — see the note on Finding 5.
5. If #31 makes `lib/scheme/base.sld` the baked artifact, is "`base.sld` stays committed" written
   down as an invariant (with the bootstrap cycle named), or left implicit?
6. ~~**One tool emitting N `.sld` files, or N `.sld` files each `include`-ing a fragment?**~~
   **ANSWERED** by `scheme-base-partition`: the first. `tools/gen-scheme-base.ss` writes one `.sld`
   per partition member from one declaration, and the portable core builds the baked members from the
   same declaration — so #18 was not a prerequisite after all. What the partition *did* need, and
   what Finding 2 did not anticipate, was an internal substrate library: the relocated procedures
   stand on private port/reader machinery, and giving it to them without publishing it meant a baked
   library that another baked library imports (`(emit internal)`; design D1/D2/D10 of that change).
   Finding 2's "the compiler grows; generalizes to N libraries" cost was therefore paid — bounded at
   N=2 baked — but reached by relocation rather than by the bake-more option it was attributed to.
