## Context

`resolve-globals` classifies the target of a `set!` that is not a lexical local, and
`assign-global` admits exactly one case: a REPL session global (`n.gN`), added by issue #5. The
other three arms error, and one of them — *this unit's own top-level binding*, told apart because
the resolved symbol **is** the plain name — is what issue #14 asks for.

The restriction is load-bearing rather than accidental. `cross-unit-direct-calls` design D4 rests a
cross-unit direct call on library globals being written once by `__init` and never reassigned, and
it gives three reasons. Reason (2) is the syntactic prohibition itself: "`set!` on a top-level or
imported name is a compile error, not a store." Removing the error removes the reason. The failure
mode is the one D4 singles out as having no loud signal — an importer that emitted
`call fastcc @"lib:code:f"` keeps running the closure that was in the slot at link time, while the
slot now points elsewhere.

The relevant machinery, all of it already present:

- `lower-global-init` (`src/passes/lower.ss`) hoists a library top-level lambda initializer under
  the **stable, name-derived** label `lib:code:<name>` (D1) and, when the arity is fixed, records
  `(name label arity)` into `*unit-procs*`.
- `unit-procs` is read in exactly one place: `export-call-rows` in `src/core.ss`, once per unit,
  after every form has been lowered — on both the whole-unit and the tree-shaken path.
- Everything an importer knows about a callee comes from that table (`import-tables->call-alist`
  → `known-import` → the `known-app` node). There is no other channel.
- A unit's calls to its *own* top-level procedures are already indirect: `known-import` is
  populated only from *imported* tables, and `hoist-code!` is given no self-name from
  `lower-global-init`, so no intra-unit direct call exists to invalidate.

## Goals / Non-Goals

**Goals:**

- A library unit may `set!` a name it defines at its own top level, with the store landing in that
  unit's global slot so importers see it (R7RS §5.3.1).
- Replace D4's reason (2) with the property the direct call actually needs, stated positively: the
  export table advertises a call label only for a binding whose closure cannot move.
- Zero effect on any existing unit or program. `(scheme base)` assigns nothing at its own top
  level, so no call row may change and no emitted library or program IR may differ.

**Non-Goals:**

- **Assigning an imported binding.** Still an error. The assigning unit does not own the slot, the
  exporter's table has already been published, and a cross-unit write would need a story for the
  exporter's own direct calls. Issue #5 settled this; nothing here reopens it.
- **A non-define form at a library top level**, including a top-level `set!`. Those are silently
  dropped before lowering (issue #16) — a separate defect. This change reaches a `set!` inside a
  procedure body, which is the form the R7RS example and issue #14 use.
- **Library reload.** D4's reason (3) still depends on there being none.
- **Keeping the direct call for an assigned binding** via a slot-versioning or
  re-patching scheme. The binding simply loses the optimization.

## Decisions

### D1 — Withhold the row at the table, not at the point the label is handed out

The obvious reading of the fix (and the one issue #14 sketches) is to stop `lower-global-init` from
calling `add-unit-proc!` for an assigned binding. That needs the assigned set *before* lowering,
because `bump`'s `set!` may be lowered after `f`'s `define` has already been recorded — hence the
issue's "pre-pass over the unit's expanded forms".

**Decision: no pre-pass.** `*unit-procs*` has exactly one reader, `export-call-rows`, and it runs
after every form in the unit has been lowered. So `assign-global` appends the name to a per-unit
`*unit-assigned*` list as it resolves, and `unit-procs` — the reader — filters the assigned names
out. By the time the table is built the set is complete regardless of the order the forms were
lowered in.

This is the same soundness property the issue asks for ("stop advertising a direct-callable label
for any binding the unit assigns"), reached without a second traversal and without the ordering
question. The binding's code is still emitted under its stable label, because the `define`'s
`make-closure` needs it; the label just stops appearing in the published interface, exactly as it
does for a variadic export.

*Alternatives considered.*

- **A source pre-pass** scanning each define for `(set! <name> …)` with `<name>` in
  `defined-names`, before lowering. Rejected: it must over-approximate to stay sound, so a
  library with a *lexical* `f` it assigns, alongside an unrelated top-level `f`, would lose
  `f`'s call row. In `(scheme base)` that risks silently converting direct calls back to indirect
  ones and churning `bootstrap/*.ll` — a real regression in exchange for nothing, since resolution
  already knows the answer precisely.
- **An expanded pre-pass**, hoisting expansion out of the per-form path to get macro-introduced
  `set!`s. Rejected as a much larger refactor of `compile-library*`'s whole-unit path (the pruned
  path already expands up front; the default path expands per form, and the fold order is
  load-bearing for cross-host determinism). Resolution-time recording sees macro output for free,
  because it runs after `expand`.

### D2 — The stable top-level label belongs to the top-level *spine*, not to `global-set!`

This is the part that bites, and the reason the change is not a one-line edit to `assign-global`.
`lower`'s `global-set!` arm routes **every** `global-set!` through `lower-global-init`, wherever it
appears. Today a library only ever has one per form, at the top level. Permit the assignment and
`(set! f (lambda (x) (+ x 100)))` inside `bump`'s body becomes a second `global-set!` whose target
is `f` and whose rhs is a lambda — so it would claim the label `lib:code:f` a second time and emit
a **duplicate LLVM function definition**. Loud (a link error), but wrong.

`locals`/`fmap` cannot tell the two apart: `bump` takes no arguments and captures nothing, so its
body is lowered with the same empty `locals` and `fmap` as a top-level form.

**Decision:** make the position explicit. `lower-program` enters through a new `lower-top`, which
walks the top-level spine of one lowered form — a `global-set!`, and the `seq` chains a
`define-record-type` expands into — and applies `lower-global-init` there. `lower`'s `global-set!`
arm becomes the ordinary `(global-set! s (L rhs))`, so a nested one lowers its rhs through the
normal anonymous-lambda arm and gets a counter-derived label. The rest of `lower` is untouched.

The `seq` spine is not optional: `repl-lower-form*` returns a `seq` chain of `global-set!`s for a
`define-record-type`, and those constructors/accessors are genuine top-level initializers that
must keep their name-derived labels or the whole/pruned label stability of D1 breaks for records.

*Alternatives considered.* (a) *Thread a `top?` flag through `lower`* — touches every recursive
call for one arm's benefit. (b) *Refuse the stable label for a name that has already taken one in
this unit* — order-dependent (whether `bump` or `f` is lowered first would decide which one gets
the counter label), and order-dependent labels are precisely what D1 exists to eliminate.

### D3 — Why the whole and pruned tables are allowed to disagree here

Issue #14 lists "the pruned recompile must reach the same decision" as a requirement. Under D1 it
does not, in one case: if the *assigning* binding is pruned away, the pruned unit never lowers that
`set!`, so `*unit-assigned*` is empty and the pruned table offers the row the full table withheld.

That is sound, twice over, and the argument is worth writing down rather than engineering around:

1. **Nothing consumes the pruned table.** `build-modular-artifacts*` compiles the program against
   the **full** tables and only then recompiles each prunable unit; it keeps `(car res)` — the IR
   text — and discards the pruned table. The `.exports` artifact is always the full table.
2. **Even if something did, the pruned decision is right in its own closed world.** The assigning
   binding was dropped because the program cannot reach it, so nothing in the linked image can move
   the slot, and the row is accurate.

The direction that would be unsound is the reverse — the full table offering a row the pruned world
invalidates — and it cannot happen: `dep-alist` derives the assigner's dependencies from
`all-symbols` of its body, which contains the assigned name, so keeping the assigner always keeps
the assigned binding, and keeping the assigner is what puts the name in `*unit-assigned*`.

### D4 — What replaces `cross-unit-direct-calls` reason (2)

D4's argument had three legs; this change knocks out the second and puts a stronger one in its
place. The amended invariant:

> **A unit's export table records a call label only for a binding whose slot cannot be reassigned
> after `__init`** — i.e. a fixed-arity top-level lambda that the unit does not itself assign.

The three legs then read:

1. **A library global is written only by its own unit.** Unchanged, and it is now the real content
   of the old reason (2): assignment to an *imported* binding is still a compile error, so no unit
   can write another unit's slot. What changed is only that a unit may write its *own*.
2. **A binding its unit assigns is never advertised as direct-callable.** The table is the sole
   channel by which an importer learns a label, so withholding the row is sufficient — an importer
   with no row emits the indirect call and reads the slot on every call, which is correct by
   construction.
3. **A REPL redefinition allocates a fresh program global.** Unchanged, and still dependent on
   there being no library-reload path.

Reason (2) has to be *tested*, not asserted, for the same reason the original D4 gave: its failure
mode is silent misdispatch. The test that matters is an importing program that calls the binding,
calls the mutator, and calls the binding again — it must observe the new value, which it cannot do
if the call was lowered direct.

## Risks / Trade-offs

- **A future path teaches something other than the export table to direct-call a unit's globals**
  (intra-unit direct calls are the obvious candidate — they are listed as remaining work in
  `cross-unit-direct-calls`' open questions) → it would bypass the withheld row and reintroduce the
  silent misdispatch. Mitigation: `*unit-assigned*` is the unit-wide record of the hazard and the
  comment at both ends says what it is for, so an intra-unit direct-call change has a predicate to
  consult rather than a fact to rediscover.
- **The label-collision hazard of D2 is invisible until someone writes the test** → a nested
  `global-set!` of a lambda in a library is a shape no existing test produces. Mitigation: the new
  suite emits exactly that unit and asserts the IR defines `lib:code:f` once; without D2 the unit
  does not even link.
- **Losing the direct call is a silent perf cliff** for a library that assigns one of its own hot
  exports → measured in nothing today (no library assigns), and the alternative is unsoundness.
  Accepted; the export table dump makes it observable for anyone who looks.
- **`make regen` diff review** → the compiler source changed, so `bootstrap/*.ll` changes; but no
  library's emitted interface does. The check that this is *only* compiler churn is that
  `build/lib/scheme.base.ll` and the program IR for the demo suite are byte-identical before and
  after, which is what the byte-identity tests already assert.

## Migration Plan

No migration. The change is a strict relaxation: every program that compiled before compiles to
the same IR, and the newly admitted programs were compile errors.

## Open Questions

- **Should an assigned export be reported?** A binding losing its direct-call row is a real, if
  small, cost that the author did not ask for. A note at `EMIT_VERBOSITY` above the default
  (`withhold call row for f: assigned by its own unit`) would fit the narration convention in
  `docs/OUTPUT.md`. Left out of the first cut because the export table already shows it and
  nothing today triggers it.
- **Does the same relaxation want to reach a library's top-level `set!`?** That is gated on issue
  #16 (non-define library body forms are dropped), and the reachability rule an expression needs on
  the pruned path is a genuine design question. Not folded in here.
