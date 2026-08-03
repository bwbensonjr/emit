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

## Finding 2 — #33 moves nine names across the line, and it collides with packaging

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
| Give the manifest a search path (exe-relative, then `$PREFIX/share/emit`, then CWD) | Host-side, small | The honest fix, and it unblocks brew whether or not #33 happens |
| `(scheme base)` re-exports relocated names for a window | Cheap, temporary | Needs import sets, which do not exist (`docs/MODULES.md`: whole-library imports only) |

**This decision must precede #33**, and it is a product question — *should an installed `emit` have
the full standard surface with no files beside it?* — not a compiler one.

## Finding 3 — #18's `include` has exactly one shape that keeps the Chez driver

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
  ① manifest search path (host-side, small)          ← unblocks brew; independent of all three
        │
        ├──▶ ② #18 cond-expand            (self-contained, no I/O)
        │         │
        │         └──▶ ③ #18 include family    (injected path->forms side-channel)
        │                      │
        ├──▶ ④ #33(a) partition ────────────┘   ← uses include to split without duplicating source
        │       (BREAKING; wants to precede the 0.1.0 tag)
        │
        └──▶ ⑤ #31 bake the spliced .sld        ← after include exists, after the partition settles
                  #33(b) §6 absence audit       ← additive; floats anywhere
```

Step ① did not come from any of the three issues. It is the cheapest item with the widest reach,
and it is currently nobody's.

Each step keeps the property the repo's guards depend on: one IR-shaping change at a time, so each
`test/module-scaffold-baseline.sha256` re-record can be explained as a specific delta the way the
protocol in that script's header requires.

## Open questions

1. **Should an installed `emit` have the full standard surface standalone?** Decides bake-more vs
   search-path, and therefore #33's shape. A product question.
2. Does `(scheme base)` re-export relocated names during a deprecation window — and does that
   require import sets (`only`/`except`/`prefix`) to exist first?
3. Is the manifest the right long-term resolution mechanism, or should there be a library *path*
   with the manifest as one entry?
4. `cond-expand` at bake time or at the importer's compile time — and does the answer differ for a
   baked library versus a manifest one?
5. If #31 makes `lib/scheme/base.sld` the baked artifact, is "`base.sld` stays committed" written
   down as an invariant (with the bootstrap cycle named), or left implicit?
6. Does the partition change what "generated from the prelude" means — one tool emitting N `.sld`
   files, or N `.sld` files each `include`-ing a prelude fragment? The second needs #18; the first
   does not, and is available sooner.
