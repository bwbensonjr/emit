## Context

`src/prelude.scm` is the single source of truth for what `(scheme base)` **contains**. Nothing is
the source of truth for what it **exports** — the export list is derived twice, from every top-level
`define`:

1. **`tools/gen-scheme-base.ss:33-36`** — a Chez script that writes the committed
   `lib/scheme/base.sld`, which the Chez driver resolves through the manifest
   (`emit-libs.scm:11`). Guarded byte-for-byte by `test/scheme-base-gen-check.sh` (Chez-gated,
   `run-dev-tests.sh:61`).
2. **`scheme-base-library-form` (`src/core.ss:143-147`)** — the portable derivation, in the
   self-hosted compiler, working from the baked `*prelude-source*` string
   (`tools/regen.sh:66-73`) with no filesystem. It serves `emit run` / `emit build`
   (`src/core.ss:167-183`, `src/entry-embed.scm:17`) and the run door's mode 8
   (`src/repl-core.ss:421-431`).

The two must agree in **content and order**: `test/prelude-base-run-tests.sh` pins that the run
door's program module is byte-identical to the driver's `prog.ll`, and `run-with-scheme-base`
(`src/repl-core.ss:387-395`) exists only to keep the two compilation orders identical. Any fix has
to be visible to both, and the portable one has no filesystem.

Three further constraints shape the design:

- **Prelude macro templates are instantiated in the importer's scope.** `guard`
  (`src/prelude.scm:606-617`) expands to a call to `%with-handler`; `parameterize`
  (`src/prelude.scm:653-657`) to `%with-parameters`. With the Stage 3 split the importer's
  `runtime-forms` no longer contain the prelude, so **the export list is the only source of prelude
  names in the hygiene `known` set** (`src/core.ss:560`, `:448`, `src/repl-core.ss:238`); a template
  symbol not in `known` is hygiene-renamed (`src/passes/expand.ss:130-146`) and dies at
  `src/passes/lower.ss:190`. Verified: neither helper has a call site anywhere outside those two
  templates.
- **The compiler is its own user.** `tools/regen.sh:43-47,71-73` concatenates the compiler sources
  into programs that auto-import `(scheme base)`, so names those sources call must stay exported:
  `list-head` (`src/emit.ss:999,1029,1061`, `src/passes/convert-assignments.ss:145`),
  `rd-skip-ws`/`rd-token-end` (`src/repl-core.ss:550-598`), and the extension names `iota`, `memp`,
  `void`, `fold-left`, `fold-right`, `read-all-from-string`.
- **Cost lands where the file lands.** Anything defined in `src/prelude.scm` is emitted into
  `scheme.base.ll` and thus into every user binary's init; anything defined in a flat-core file is
  emitted only into the three compiler binaries.

## Goals / Non-Goals

**Goals:**

- One declaration, read by every derivation, that states which prelude definitions are public.
- Internals stay in the library body (the exported procedures call them); only the `export` list
  shrinks.
- Adding a prelude definition **forces** a visibility decision — the default suite fails otherwise.
- The residual "exported but not API" set is small, labelled, and each entry carries a reason.
- Emitted IR changes only by the removed `external global` declarations — no reordering, no
  change to `scheme.base.ll` (until the renames), no change to shipped binary sizes.

**Non-Goals:**

- Moving the extension tier into an `(emit extras)` library (the compiler's own sources reach those
  names through the auto-import; that is a separate change).
- Auditing what `(scheme base)` is *missing* against R7RS §6, or relocating the nine names R7RS puts
  in `(scheme cxr)` / `(scheme read)` / `(scheme file)`. Recorded as debt.
- Import sets (`only`/`except`/`prefix`), which remain unimplemented (`docs/MODULES.md:299`).
- Any change to tree-shaking, code labels, or the `.exports` format.

## Decisions

### D1 — The declaration is a flat-core Scheme file, `src/prelude-surface.scm`

```scheme
(define *scheme-base-unstable* (quote (%with-handler %with-parameters rd-skip-ws rd-token-end)))
(define *scheme-base-private*  (quote (%append2 %map1 … rd-datum chr-cmp ns-digits ns-digits-radix)))
```

It joins `CORE_FLAT` (`tools/regen.sh:43-47`) immediately before `src/core.ss`, and the driver's
`include` block plus `compiler-source-files` (`src/compile.ss:40-50`, `:459-471`). This mirrors what
already works: `src/core.ss` reads sibling flat-file globals (`*prims*`, `*integrable*`,
`*core-keywords*` from `src/parse.ss`). The Chez generator reads the same file with
`(load "src/prelude-surface.scm")`.

Consequences that made this the choice:

- **No new plumbing.** No second escaper in `tools/regen.sh`, no baked string to parse at runtime,
  and no new argument threaded through `scheme-base-library-form` → `compile-source-rehomed` →
  `src/entry-embed.scm:17` / `src/repl-core.ss:424`. The function signature is unchanged.
- **Cost lands in the compiler, not in user binaries**: ~81 interned symbols in
  `bootstrap/{embed,embed-repl,schemec}.ll`, which already emit ~1,500 symbol globals each. Nothing
  is added to `scheme.base.ll`.

*Alternatives rejected:*

- **Convention filter** (private iff `%…` / `*…*` / `rd-…`, implemented in both derivations). Hard
  failure: `rd-skip-ws`/`rd-token-end` match the rule but must stay exported, and every escape is
  worse than a label — duplicating the lexeme logic in `src/repl-core.ss` is what that code's own
  comment (`:528-533`) forbids, and unsigiled public names for `(s n i)` index scanners are
  dishonest. It also cannot express "exported but not API", still defaults a new unsigiled helper to
  public (the actual defect), entangles visibility with spelling, and needs the same predicate
  implemented twice. Its one good part — that no exported name *should* look internal — is kept, as
  an assertion in the new guard rather than as the mechanism.
- **A declaration form inside `src/prelude.scm`.** A comment marker (`;;; @private`) is invisible to
  the portable derivation, which reads the prelude with `read-all-from-string` and discards
  comments. A quoted-list `define` would emit ~80 symbol globals plus interning into
  `scheme.base.ll`'s init — in every user binary, forever. A `define-private` head would have to be
  rewritten back to `define` by both derivations *and* tolerated by the two raw consumers
  (`src/compile.ss:200-204` legacy prepend, `test/read-all-tests.ss:19`'s bare Chez `load`) — two
  mechanisms for one job, still defaulting to public. Hiding the list in a `syntax-rules` template
  works and is free, but ships prelude data into every program's macro-env for no reason.

### D2 — Subtract a set; order comes from the prelude

```scheme
(define (scheme-base-export-names prelude-forms)
  (filter (lambda (n) (and n (not (memq n *scheme-base-private*))))
          (map define-name prelude-forms)))
```

Both derivations already walk `prelude-forms` in source order, so with a *subtracted set* they agree
on content and order **by construction, from the same two files** — there is no ordering
contract to keep in step. Rearranging or re-commenting the declaration file cannot move a byte of
emitted IR. It also makes the whole change's IR diff the cleanest possible shape: pure deletions of
`= external global i64` lines, no additions, no reordering — which is exactly the evidence
`test/module-scaffold-baseline.sh:20-27`'s re-record protocol asks for. A declaration that *listed*
the exports would instead have to fix an order and would put a second, independently-orderable
source in the critical path.

### D3 — Three tiers; only two of them are machine data

- **`r7rs`** — names R7RS-small defines.
- **`extension`** — Emit additions with no R7RS home: `filter`, `fold-left`, `fold-right`, `andmap`,
  `memp`, `iota`, `list-head`, `void`, `list->bytevector`, `port-closed?`, `read-from-string`,
  `read-all-from-string`, the `hash-table-*` family.
- **`unstable`** — `*scheme-base-unstable*`: exported only because something outside the library
  resolves the name; no stability guarantee, not documented as API. Every entry carries its reason
  in the file.

Only `*scheme-base-private*` (load-bearing) and `*scheme-base-unstable*` (checked) are data. An
`*scheme-base-r7rs*` list would be a define nothing references — and program top-levels are never
tree-shaken (the strip is library-only, `src/core.ss:487-535`) — so it would intern ~130 symbols in
three binaries to serve a comment. The R7RS-vs-extension split therefore lives in the surface file's
header and `docs/MODULES.md`, where it is read by people.

### D4 — No `(rename internal external)`

The tempting use — `(export (rename %with-handler with-exception-handler))` — cannot work, and the
reason generalizes into a spec requirement. `normalize-export` (`src/core.ss:217-220`) makes the
**external** name the import-table key, so the importer's env and `known` set would contain
`with-exception-handler` and not `%with-handler`; `guard`'s template mentions `%with-handler`, which
would then be hygiene-renamed and die unbound. **A name mentioned by an exported macro template must
be exported under exactly that spelling.** Where a name should change, change the definition.

### D5 — Retire two unstable names by renaming the definitions

`%with-handler` → **`with-exception-handler`**: the signature `(handler thunk)` and the semantics
(install for the dynamic extent of `thunk`; `raise` calls the handler with the chain popped to the
outer one, `src/prelude.scm:580-587`; a returning handler falls through to `%raise`) are R7RS §6.11,
and `src/prelude.scm:566-568` already commits to the name in writing. `%with-parameters` →
**`with-parameters`**, an extension: one definition rename and one word in the template, preserving
design D3's "restoration on a normal exit, an escape, and a raise all come from one place" — better
than inlining `dynamic-wind` into the `parameterize` template, which would cost four closures per
use site and dilute that property.

Accepted hazard: a user who defines their own `with-exception-handler` breaks `guard` for that
program. This is pre-existing and already accepted for `case`→`memv` and for `list` in
`parameterize`; `test/prelude-base-run-tests.sh` deliberately tests user shadowing of `map`.

`rd-skip-ws` and `rd-token-end` stay unstable rather than being renamed or eliminated: moving the
~70-line `fc-*` probe into the prelude would grow `scheme.base.ll` — linked into *every* user
binary — to save two names.

### D6 — Keep baking `src/prelude.scm`, not `lib/scheme/base.sld` (follow-up)

Baking the generated `.sld` would delete the dual derivation outright and shrink the baked string
from ~65.6 KB to ~32.1 KB (the `.sld` has no comments), removing ~33 KB from each of `embed.ll` and
`embed-repl.ll`. Rejected here because it makes a **Chez-generated** file load-bearing for the
Chez-free build: a stale `base.sld` would silently give the run door a different surface, and
`run-all-tests.sh` is Chez-free by design. Revisit once `tools/gen-scheme-base.ss` can run under
`build/emit run`; file as an issue.

### D7 — Forcing the decision: a committed golden plus generator assertions

`lib/scheme/base.sld` is committed, so reformatting its export list **one name per line** makes any
surface change a `+1`/`-1` diff. The forcing test is a new Chez-free
`test/scheme-base-surface-check.sh` in `run-all-tests.sh` (the existing
`test/scheme-base-gen-check.sh` is Chez-gated, so it cannot be the gate): recompute the expected
export list from `src/prelude.scm` minus the private list and diff it against `base.sld`'s `(export
…)` block. An author adding a helper then has exactly two ways forward — declare it private, or
commit a diff that visibly publishes it. The same test asserts that no exported name is spelled
`%…`, `*…*`, or `rd-…` except the members of `*scheme-base-unstable*`, and that the issue's repro
holds (`rd-atom` unbound under `emit run`, `map` still resolving). The generator adds four
rot assertions: a private name the prelude does not define, a private name that is a
`define-syntax`, an unstable name that is not exported, and a duplicate export (which would emit two
identical `external global` lines and fail LLVM).

## Risks / Trade-offs

- **The declaration and the prelude drift on a deletion** (a removed helper lingers in the private
  list) → the generator's "private name not defined by the prelude" assertion, mirrored in the
  Chez-free guard so it runs in the default suite.
- **The three committed artifacts must land together** — `src/prelude-surface.scm`,
  `lib/scheme/base.sld`, `bootstrap/*.ll`. If `base.sld` shrinks while the baked compiler still
  exports 213, the driver and the run door disagree and `test/prelude-base-run-tests.sh`'s
  byte-identity check goes red; `run-all-tests.sh` links `build/emit` from committed IR, so a stale
  `bootstrap/` tests the old policy → the task list keeps them in one commit each time.
- **The compiler stamp changes** (a new entry in `compiler-source-files`), invalidating every cached
  `.ll`/`.exports` → expected and correct; do not mistake the rebuild for a failure.
- **BREAKING for any program that used an internal** → intended, and cheap only before the first
  tag; that is the "why now".
- **The unstable tier is a residual compromise** (2 names after D5) → each carries a reason, is
  checked by the guard, and the principled fix (hygienic resolution of prelude macro templates
  against library-internal bindings) is filed as a follow-up. 213 → 136 still removes 77 names from
  every user's namespace.
- **De-exporting dead helpers makes them permanently unreachable** (`%str-concat` and `ns-digits`
  are called by nothing, and were kept alive only by being exported) → the shaken unit gets slightly
  smaller; the two stale comments that mention `%str-concat` (`src/parse.ss:151`,
  `src/passes/expand.ss:338`) get corrected. `andmap` is dead in-tree too but stays exported as a
  declared extension, since it is a name a user program may reasonably want.
