## Why

`(scheme base)` ships **sixteen** names that R7RS-small puts in other libraries, so a program
importing only `(scheme base)` sees identifiers a conforming implementation would leave unbound:

| names | count | R7RS home |
|---|---|---|
| `caaar caadr cadar caddr cdaar cdadr cddar cdddr cadddr` | 9 | `(scheme cxr)` |
| `read` | 1 | `(scheme read)` |
| `open-input-file` `open-output-file` `with-input-from-file` `with-output-to-file` `call-with-input-file` `call-with-output-file` | 6 | `(scheme file)` |

(Issue #33 says "nine"; that is the `cxr` group alone. All sixteen are in `lib/scheme/base.sld`
today.)

**The window is closing.** `homebrew-tap-distribution` establishes SemVer at `0.1.0`, after which
relocating a name out of `(scheme base)` is a breaking change to a released surface. This is the
same timing argument that motivated #29, which curated the surface so this question could be posed
at all.

**The blocker is gone.** Relocation moves names from *in the binary* to *on disk*, which until
yesterday meant "unreachable from an installed `emit`". `manifest-search-path` (#35) fixed exactly
that, which is why the exploration sequenced it first. This is step ④ of
`openspec/explorations/library-sources-and-artifacts.md`.

## What Changes

- **Complete `(scheme cxr)` while creating it.** R7RS specifies twenty-four procedures for that
  library (`docs/r7rs/09-standard-libraries.md:190`); Emit defines nine. Shipping a library named
  after the standard in which `(caddar x)` is unbound would be a worse conformance state than
  today, so the fifteen missing four-level forms are added — one-line `car`/`cdr` compositions,
  needed by nothing else. A bounded exception to the scope line below: completing a library *this
  change creates* is part of creating it; auditing `(scheme base)` for absences is not.
- **BREAKING — relocate all sixteen names** into three new standard libraries, each resolved
  through the manifest and installed under `$PREFIX/share/emit` like `(scheme inexact)`:
  `(scheme cxr)`, `(scheme read)`, `(scheme file)`. A program that used them via the auto-imported
  `(scheme base)` must now import the owning library.
- **No deprecation window.** Not a preference — `compile-library*` (`src/core.ss:462`) rejects
  "export of a name the library does not define", and a unit's export table maps each external name
  to a symbol mangled *to that unit*, so `(scheme base)` cannot re-export what it imports without
  new re-export machinery. This settles the exploration's open question 2: clean break, which is
  what pre-`0.1.0` is for.
- **Introduce a baked internal substrate library** holding the private machinery the relocated
  procedures stand on — the port representation (`%make-port`, `%port-buf`, `%check-*-port`, …) and
  the ~30-name `rd-*` reader — so `(scheme read)` and `(scheme file)` can reach it without
  `(scheme base)` publishing it. Chosen over `include`-based splicing (would make #18 a
  prerequisite) and over a generator duplicating the reader into each `.sld` (duplicated compiled
  code; binary size is a stated design concern).
- **Generalize the baked library form from one library to a partition.**
  `scheme-base-library-form` (`src/core.ss:153`) synthesizes exactly one import-free
  `(define-library (scheme base) …)` from the baked-in prelude string. `(scheme base)` keeps
  `read-from-string` and the port procedures, so it too needs the substrate — and it must stay
  baked, because the module-system spec pins that a program importing only `(scheme base)` needs no
  manifest at all. So the substrate is baked as well: **N=2 baked libraries**, emitted in
  dependency order.
- **Turn `src/prelude-surface.scm` from a subtraction set into a partition map.** It currently
  declares only what is *private*, with exports derived as "prelude defines minus private". It must
  now say, for each name, *which library owns it*. Its header documents that the list ordering is
  free "because this is a set to SUBTRACT" — that invariant changes and the header is rewritten.
- **Keep the compiler self-hosting.** The compiler core uses `caddr` ×35, `cadddr` ×10 and
  `cdddr` ×3 across nine `CORE_FLAT` files, and it compiles as a program auto-importing
  `(scheme base)` — so relocation would put 48 of its own call sites out of scope. The substrate
  therefore also defines the nine `cxr` forms for the compiler's use (one added `import` in the
  flat source), while the on-disk `(scheme cxr)` defines its own nine one-liners for users. Nine
  trivial duplicated definitions, no compiler edits.
- **Update both derivations and both guards.** `tools/gen-scheme-base.ss` (Chez) must emit N `.sld`
  files rather than one; `scheme-base-export-names` / `scheme-base-library-form` (portable) must
  agree with it. `test/scheme-base-surface-check.sh` (Chez-free) and `test/scheme-base-gen-check.sh`
  (Chez) both recompute or diff the surface and must learn the partition.
- **Retire the `unstable` export tier, closing #32.** The tier holds exactly two names,
  `rd-skip-ws` and `rd-token-end`, exported only because something outside the library resolves
  them — and that something is `src/repl-core.ss` (the REPL's input-completeness probe,
  `src/prelude-surface.scm:51-52`), i.e. the *compiler*, not a macro template. Once the compiler
  imports the substrate they move there with the rest of the reader and leave `(scheme base)`'s
  export list, emptying the tier. #32's goal, reached as a side effect rather than as separate work.

**Out of scope — issue #33's second half.** The R7RS §6 absence audit ("what is `(scheme base)`
*missing*") stays out. It is an inventory producing decisions recorded in the surface declaration's
tiers and `docs/MODULES.md`, it floats anywhere in the schedule, and folding an open-ended survey
into a breaking IR-shaping change would bloat both. Also out: `include`/`cond-expand` (#18),
retiring the unstable export tier (#32), baking `lib/scheme/base.sld` (#31).

## Capabilities

### New Capabilities
<!-- None. Three new libraries are new *surface* under the existing module-system and
     core-language capabilities, not a new capability. -->

### Modified Capabilities
- `module-system`: the baked-library requirement changes from one synthesized `(scheme base)` to a
  partitioned set emitted in dependency order, and gains the rule that a baked library may import
  another baked library. The "program with no user imports needs no manifest" guarantee is
  restated as covering the whole baked set.
- `core-language`: `(scheme base)`'s declared surface loses sixteen names to three new standard
  libraries, and the surface declaration becomes a partition map rather than a privacy subtraction.

## Impact

- **`src/prelude-surface.scm`** — subtraction set → partition map; header rewritten.
- **`src/core.ss`** — `scheme-base-library-form` generalized to N libraries with imports;
  `scheme-base-export-names` becomes per-library. **In `CORE_FLAT`, so this is IR-shaping**: the
  self-hosting fixed point, the anti-stale trust-check, and a `test/module-scaffold-baseline.sha256`
  re-record are all in play. (Contrast `manifest-search-path`, which touched no IR.)
- **`src/prelude.scm`** — the relocated procedures and the substrate names move between partitions;
  the definitions themselves need not change.
- **`tools/gen-scheme-base.ss`** — emits N `.sld` files; **`tools/regen.sh`** — the flat source
  gains one `import`, and the bootstrap must order the substrate before `(scheme base)`.
- **`lib/scheme/`** — new committed `cxr.sld`, `read.sld`, `file.sld`; **`emit-libs.scm`** — three
  new manifest entries; **`Makefile`** — `make install` already globs `lib/scheme/*.sld`, so the new
  libraries install with no change.
- **Tests** — both surface guards updated; new coverage that each relocated name is unbound in a
  bare program and bound after importing its library; `test/install-layout-tests.sh` extended to the
  new libraries.
- **Docs** — `docs/MODULES.md` (the library inventory and the baked-vs-manifest table), `README.md`.
- **Risk concentrated in the bootstrap**: the compiler compiles itself while the surface it is
  compiled against is changing. Task ordering must keep a working compiler at every step.
