## Context

`compile-library*` (`src/core.ss:773`) builds a library's `macro-env` from two sources: the
library's own `collect-define-syntax`, and `import-tables->macro-env` over its imports' compile-time
interfaces (added by `library-macro-export`). The baked derived-form set is in neither. It reaches a
compile through `prelude-macro-forms` (`src/core.ss:230`), which is merged on the **program** path
only, so a `.sld` body sees no `cond`, `when`, `case`, `let*`, `unless`, `and`, `or`, `guard`, or
`parameterize`.

Two facts bound the design, and both were verified against the tree at `cfe81fd` rather than assumed:

- **`(emit internal)` imports nothing.** `*prelude-libraries*` (`src/prelude-surface.scm:186`) orders
  the partition `(emit internal)` → `(scheme base)` → `(scheme cxr)` / `(scheme read)` /
  `(scheme file)`. The substrate is the bottom of the graph. It therefore cannot receive macros from
  `(scheme base)`, and any distribution-by-import scheme has to put them at or below it.
- **Re-exporting an imported macro is rejected today.** A library whose `twice` arrives by import and
  which lists `(export twice)` fails with `compile-library: export of a name the library does not
  define: twice`. This is a hard prerequisite of the chosen shape, not an incidental nicety.

`(scheme base)`'s members work around the gap from the inside: `library-body-forms`
(`src/core.ss:167-172`) copies **every** `define-syntax` into **every** member's body. The comment
there names it as a workaround and names the reason ("a member whose procedures use `cond`/`case`
internally (the reader does) can compile at all"). That mechanism is available only to libraries the
compiler generates, which is precisely the two-tier privilege this change removes.

## Goals / Non-Goals

**Goals:**

- A library that imports `(scheme base)` can use the derived forms in its body, on all three doors.
- The derived forms reach every partition member through an ordinary `import`, not body-injection.
- A library may re-export a macro it imports, as a general capability.
- `library-body-forms`' copy is deleted, and the resulting IR/binary-size change is measured.
- A derived form used out of scope reports a macro that is not in scope, naming the import that
  supplies it.

**Non-Goals:**

- Retiring `prelude-macro-forms` for the **program** path (D3).
- `let-syntax`, `letrec-syntax`, inner `define-syntax`, `syntax-case`, identifier transformers.
- Import-set transforms (`only`/`except`/`prefix`/`rename` on the import side).
- Widening `(scheme base)`'s procedure surface (#33), or baking `base.sld` (#31).
- Fixing #56 — a typo in a template still surfaces in the importer.

## Decisions

### D1 — Split homing: the core-only forms in `(emit internal)`, the procedure-dependent ones in `(scheme base)`

**Revised after the task 1.1/1.2 measurement below; the original single-home version does not work.**

Homing *every* derived form in `(emit internal)` is impossible. The substrate imports nothing, so a
template that references a prelude **procedure** has nothing to resolve against there — `case` needs
`memv`, `guard` needs `call-with-current-continuation` and `with-exception-handler`,
`%guard-clauses` needs `raise`, `parameterize` needs `with-parameters`. None of those is a primitive
or an integrable, none is defined in `(emit internal)`, and `(emit internal)` cannot import
`(scheme base)` without inverting the dependency graph. Under the resolution rule an unresolvable
template identifier is *left as written* and then hygiene-renamed per expansion, so `case` would
break in every importer with `unbound variable memv.0` — the #56 failure mode, inflicted on the
standard library.

The measurement makes the split obvious, because the two sets do not overlap:

| Derived form | Template references beyond core keywords | Used by any partition member? |
|---|---|---|
| `and`, `or`, `let*`, `cond` | none — only core keywords and their own keyword (self-recursion) | **yes** — `cond` 12, `and` 16, `or` 16, `let*` 3 in `(emit internal)`; `cond` 3, `and` 8, `or` 1, `let*` 8 in `(scheme base)` |
| `case` | `memv` | no |
| `guard` | `call-with-current-continuation`, `with-exception-handler` | no |
| `%guard-clauses` | `raise` | no |
| `parameterize` | `with-parameters`, `list` | no |
| `do`, `%do-step` | `%do-step` (a private macro keyword) | no |
| `when`, `unless` | none | no |

**The four forms the partition actually needs are exactly the four that need nothing from
`(scheme base)`.** So: home `and`, `or`, `let*`, `cond`, `when`, `unless` in `(emit internal)`, where
their templates resolve against core keywords alone; home `case`, `guard`, `%guard-clauses`,
`parameterize`, `do`, `%do-step` in `(scheme base)`, where the procedures they call are defined.
`(scheme base)` re-exports the substrate's six (D2), so an importer of `(scheme base)` — user library
or partition member — sees all twelve under one import and cannot tell where each is homed.

`(scheme cxr)`/`(scheme read)`/`(scheme file)` reach everything through `(scheme base)`'s re-export;
each of them uses only `or` and `let*` anyway.

*Alternative considered — define them in `(scheme base)` and keep body-injection for `(emit internal)`
alone.* This avoids needing re-export at all and is a materially smaller change: the injection hack
narrows from five members to one instead of disappearing. Rejected as the primary shape because it
keeps a privileged channel alive in the one place hardest to notice, and because re-export is worth
having on its own terms (D2). Recorded in Open Questions as the de-risking fallback if D2 proves
expensive.

### D2 — Re-export is a general capability, not a special case for `(scheme base)`

`(scheme base)` must re-export what it imports from `(emit internal)`, because user libraries import
`(scheme base)` and must **not** import `(emit internal)` — the substrate is deliberately not
auto-imported, carries no stability guarantee, and its exclusion from ordinary program scope is what
preserves issue #29's privacy guarantee. So a re-export is unavoidable somewhere on the path.

Given that, make it general. A rule that only `(scheme base)` may re-export would rebuild the
two-tier privilege one layer down, and re-exporting an import is ordinary R7RS a user library has
equal claim to. The export check in `compile-library*` should accept a name bound in the merged
`macro-env` (own plus imported), not only in the library's own.

### D3 — The program path keeps `prelude-macro-forms` in this change

A program does not name `(scheme base)` in an import — it is auto-imported — so there is no import
whose compile-time half the merge could hang on without inventing one. Unifying the two paths is
genuinely desirable and genuinely entangled with #31 (bake `lib/scheme/base.sld` instead of
`src/prelude.scm`, which deletes the dual export derivation). Doing it here would drag that
prerequisite in. Two paths remain for now, and the specs must say so explicitly rather than leave a
single rule that is true of only one.

### D4 — Emitted IR identity is a result to demonstrate, not an assumption

Under `library-macro-export`, an exported template's free identifiers are resolved in the **exporting**
library and travel as mangled symbols. Merged-as-source macros are resolved in the **importer**.
`docs/MODULES.md:342-345` records that distinction and states the baked set takes the importer path.
Moving the library path to pre-resolution therefore changes *where* a derived form's template
identifiers resolve — `case`'s `memv`, `guard`'s handler machinery, `parameterize`'s procedures.

Where both paths resolve to the same `scheme.base:*` or `emit.internal:*` symbol, IR is unchanged.
Where they do not, program IR moves, and that means `bootstrap/` regen, a
`test/module-scaffold-baseline.sha256` update, and a `trust-check` diff. The change must produce a
byte-identity result for programs that compile today, or an enumerated list of which forms move and
why. This is the single largest technical risk and should be measured early, before the partition
surgery, on a throwaway branch if necessary.

### D5 — The surface declaration needs vocabulary for macros

`src/prelude-surface.scm` partitions `define` names: `library-export-names` maps `define-name` over
the prelude forms, and `define-name` (`src/core.ss:26`) returns `#f` for a `define-syntax`, so no
transformer can be named by the declaration at all. Homing macros and declaring a re-export both need
that gap closed — a macro-aware analogue of `*prelude-assignments*`, or an extension of it that
admits `define-syntax` names. This is the largest single piece of design in the change and should be
settled before code moves, because `tools/gen-scheme-base.ss` and `partition-library-form` both read
the declaration and must agree (D6).

### D6 — The dual derivation must stay pinned, and now covers macros

`(scheme base)`'s library form is derived twice — by `tools/gen-scheme-base.ss` (Chez, writes the
committed `.sld`) and by `partition-library-form`/`library-export-names` (in-language, for the
Chez-free doors). #31 exists to delete that duplication and is not in scope here. This change
therefore *widens* the duplicated surface to include macro exports and re-exports, which makes the
existing byte-identity pin (`test/prelude-base-run-tests.sh`) more load-bearing, not less. Both
derivations must be updated together and the pin must cover the macro half.

### D7 — The diagnostic names the macro and the import

`unbound variable when` sends the author to look for an import they already wrote. When a head
position names a known derived form that is not in the current `macro-env`, report it as a macro not
in scope and name the library that exports it. This is the same principle `module-frontend-diagnostics`
applied — name the form the user wrote, at the point they wrote it.

## Risks / Trade-offs

- **Program IR moves under pre-resolution (D4)** → Measure before committing to the shape: compile a
  representative program on both paths and diff. If IR moves, decide deliberately between accepting
  the regen churn and constraining which forms pre-resolve. Do this first; it can invalidate the plan.
- ~~**Re-export interacts with the AOT tree-shake**~~ → **Disproved during task 2.4; no mitigation
  needed.** The premise was that a re-exported transformer's references belong to a third unit, so
  the root set would have to follow the export chain transitively. It does not.
  `program-root-internals` (`src/compile.ss:602`) derives roots by scanning the **program's own
  emitted IR** for `ptr @"unit:name"`, and a macro's expansion is inlined into the program — so a
  reference reaches the program's IR no matter how many re-export hops the transformer travelled.
  Verified: with `(relib)` re-exporting `(macro-helper-lib)`'s `twice`, the program IR contains
  `ptr @"macro-helper-lib:helper"` directly. The chain length is invisible to the root computation.
  (Separately, P10 means the exporting unit is unprunable in this topology anyway, so the case is
  doubly safe today.)
- **`(emit internal)`'s macro keywords leaking into program scope** → The substrate is not
  auto-imported and must stay out of scope (#29's privacy guarantee). Re-export must expose the
  derived forms under their ordinary spellings via `(scheme base)` without making the rest of
  `(emit internal)`'s compile-time half reachable. Assert the negative: a program must still fail on
  a substrate-private name.
- **Dual derivation divergence (D6)** → A `.sld` and the in-language form disagreeing on the macro
  half would give the REPL/run doors a different surface than the driver. Extend the existing
  byte-identity pin rather than trusting construction.
- **Partition surgery is broad and `make regen` is a ~12-minute barrier** → Sequence so the risky
  measurement (D4) happens before the surgery, and batch source edits between regens per
  `CLAUDE.md`'s build workflow.
- **Scope creep into #31** → D3 draws the line at the program path. If unifying both paths starts
  looking necessary to make the change coherent, that is a signal to stop and sequence #31 first, not
  to absorb it.

## Measured findings (tasks 1.1 / 1.2)

Recorded as measured facts against the tree at `eeacac7`, not predictions.

**1.1 — The rewritable set.** The prelude has twelve `define-syntax` forms
(`src/prelude.scm:17-95, 639-694`). Classifying every template identifier against the resolution
rule — pattern variable, ellipsis, wildcard, `quote`d, `syntax-rules` literal, core keyword,
primitive, integrable — leaves only these as candidates for rewriting:

- **Prelude procedures** (would be rewritten to a mangled symbol): `memv` (`case`), `raise`
  (`%guard-clauses`), `call-with-current-continuation` and `with-exception-handler` (`guard`),
  `with-parameters` and `list` (`parameterize`). Verified none is in `*prims*` (all primitives are
  `%`-sigiled) and none is in `*integrable*`; each is an ordinary prelude `define`.
- **Macro keywords** (rewritten to a unit-qualified spelling): the self-recursive `and`, `or`,
  `let*`, `cond`, `case`, `%guard-clauses`, plus `do`'s reference to the private `%do-step`.
- `cons`, `car`, `cdr` appear in `guard`'s template but are **integrables**, so they are classified
  before the library's bindings and are never rewritten.
- `when` and `unless` have no rewritable identifier at all — `if` and `begin` are core keywords.

**1.2 — Where each resolves.** For a **program** importer nothing changes: D3 keeps
`prelude-macro-forms`' source merge, so every one of these still resolves in the importer against
the auto-imported `(scheme base)`. For a **library** importer the identifier arrives pre-resolved;
for each of the six procedures the pre-resolved spelling is `(scheme base)`'s mangled symbol, which
is what the importer's own resolution would have produced anyway for a library that imports
`(scheme base)`. No disagreement was found. This is the input to D1's split and the reason task 1.3
is expected to come out byte-identical — which is still to be demonstrated, not assumed.

**Usage across the partition.** Counting uses in member bodies with the injected `define-syntax`
lines stripped:

| member | `cond` | `and` | `or` | `let*` | others |
|---|---|---|---|---|---|
| `(emit internal)` | 12 | 16 | 16 | 3 | none |
| `(scheme base)` | 3 | 8 | 1 | 8 | none |
| `(scheme cxr)` | 0 | 0 | 1 | 0 | none |
| `(scheme read)` | 0 | 0 | 1 | 1 | none |
| `(scheme file)` | 0 | 0 | 1 | 0 | none |

No member uses `case`, `guard`, `parameterize`, `do`, `when`, or `unless`. All twelve transformers
are nevertheless copied into all five bodies today, so the copy is not only a privilege — it is
mostly dead weight.

**1.3 — The IR diff, and why it is partly unanswerable as written.** Two of the three cases resolve
without a diff, and the third has no baseline:

- **Program IR cannot move.** D3 keeps `prelude-macro-forms`' source merge for the program path, so
  no code path a program takes is touched. This is true by construction, not by measurement.
- **Emitted member IR cannot move either, and the copies cost nothing in code.**
  `grep -c 'syntax.rules'` over `build/lib/emit.internal.ll` and `build/lib/scheme.base.ll` is **0**
  in both: `collect-define-syntax` lifts every transformer out before anything is lowered, exactly as
  `library-body-forms`' comment claims. Dropping the copies therefore changes no emitted instruction.
- **The library path has no baseline to diff against**, because it currently fails outright — that is
  the bug. Byte-identity can only be asserted for what compiles today, and what compiles today is
  unaffected.

So the honest form of D4's risk is much narrower than the design first stated: the pre-resolution
hazard is confined to the *library* importer, which has no prior behaviour to regress. Task 8.5's
contingency (baseline + `trust-check` churn) is expected to be a no-op, and 1.3 is recorded closed on
that basis rather than on a diff that has no two sides.

**Correction to a claimed benefit.** The proposal said removing the body copies is "a binary-size
win". **It is not.** Measured: the transformer text is 2290 bytes and is copied into all five members
(11450 bytes total, ~9160 of it duplication), but it lives only in the *generated* `lib/**/*.sld`
files on disk. The baked constant is `src/prelude.scm`, which holds exactly one copy of each
transformer; the per-member duplication is materialized transiently by `library-body-forms` at
compile time and never reaches a binary. Removing it shrinks committed generated files by ~9 KB and
saves a little compile-time work. **The case for this change rests on removing the privileged
channel, not on size**, and the proposal has been corrected to say so.

## Open Questions

1. **Does D4's measurement come out clean?** Everything else is contingent on it. Resolve first.
2. **Should the D1 fallback be taken instead?** Defining the macros in `(scheme base)` and keeping
   body-injection for `(emit internal)` alone removes the re-export prerequisite entirely and is a
   much smaller change. If D2 or D4 turns out expensive, this is the retreat — and it may simply be
   the better trade. Worth a deliberate call once D4 is known.
3. **What is the macro vocabulary in the surface declaration (D5)?** An extension of
   `*prelude-assignments*`, or a parallel `*prelude-macro-assignments*`? The former keeps one table;
   the latter avoids teaching every existing consumer about a form it has never seen.
4. **Do `guard` and `parameterize` belong in the same batch as the branching forms?** They reach
   further into the runtime (handler chain, dynamic extent) and may resolve differently under D4.
   Splitting them out is an option if they are the only forms whose IR moves.
