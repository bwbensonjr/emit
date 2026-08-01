## Why

A library cannot assign its own top-level binding. R7RS permits it (§5.3.1 — a definition
introduces a mutable location), but the compiler rejects it outright:

```
$ build/emit lib /tmp/mut.sld
emit lib: repl: cannot assign to a unit's top-level binding f
```

The rejection is not an oversight. It is load-bearing: `cross-unit-direct-calls` design D4
justifies a cross-unit direct call on "a library global is assigned once, by its unit's `__init`,
and never reassigned", and reason (2) of that argument is literally *"`set!` on a top-level or
imported name is a compile error"*. Lifting the restriction without replacing that reason would
produce the one failure mode in D4 with no loud signal: a program that direct-called
`@"lib:code:f"` keeps calling the code that was there at link time while the slot points somewhere
else — a **silent misdispatch**.

So the reason this is worth doing now is not the missing feature on its own; it is that the
compiler's soundness argument currently rests on a *syntactic prohibition* rather than on the
property it actually needs. Replacing the prohibition with the narrower rule — *do not advertise a
direct-callable label for a binding whose slot can move* — makes the argument robust and admits
the R7RS behaviour as a side effect. Issue #14.

## What Changes

- A library unit MAY `set!` a name it defines at its own top level. The assignment stores into that
  unit's global slot, so every reader of the binding — inside the unit, and every importer —
  observes the new value.
- The unit's export table WITHHOLDS the direct-call row (code label + arity) for any binding the
  unit assigns. The binding is still exported and still callable; calls to it are lowered
  indirectly through its closure, as they are for a value export or a variadic procedure.
- A top-level initializer keeps its stable, name-derived code label (`lib:code:f`), but that label
  is now handed out only for the top-level *spine* of a lowered form. A `set!` of a top-level name
  from inside a procedure body gets an ordinary counter-derived label, so it can no longer collide
  with the label its `define` already owns.
- Assignment to an **imported** binding stays an error, unchanged: the assigning unit does not own
  that slot. Assignment to a primitive stays an error. A REPL session global stays assignable
  (issue #5).
- No change to any existing library. Nothing in `(scheme base)` assigns its own top level, so the
  withheld-row rule withholds nothing today and the emitted IR for every current unit and program
  is unaffected.

## Capabilities

### New Capabilities

(none — this narrows an existing prohibition rather than adding a surface)

### Modified Capabilities

- `module-system`: a library unit may assign its own top-level binding; the export table's
  direct-call row is withheld for any binding the unit assigns, so what the table advertises is
  restricted to bindings whose closure cannot move after `__init`.

## Impact

- `src/parse.ss` — `assign-global`: the "this unit's own top level" arm stops erroring and records
  the name as assigned.
- `src/passes/lower.ss` — the unit's assigned-name set lives here alongside `*unit-procs*`, and
  `unit-procs` (the single reader, consumed by the export table) filters against it. The stable
  top-level-initializer label moves behind a new top-level-spine entry so it is not reused by a
  nested `global-set!`.
- `src/core.ss` — `compile-library*` resets the assigned set per unit, next to `reset-unit-procs!`.
- `openspec/changes/cross-unit-direct-calls` — design D4's reason (2) is superseded and must say so;
  that change is complete but not yet archived, and its delta spec modifies the same "Library
  export table" requirement this change modifies. This change's delta carries the merged text, so
  whichever syncs last leaves the spec correct.
- `bootstrap/*.ll` — regenerated (`make regen`): the compiler's own source changed, though no
  library's *emitted* interface does.
- Tests: a new suite pinning the semantics (an importer observes the reassignment) and the codegen
  decision (no call row, no label collision, imported assignment still rejected).
