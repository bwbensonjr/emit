## Context

`compile-library*` (`src/core.ss`) takes the library's body forms, splits the macros out with
`collect-define-syntax`, and then narrows what remains to the defines:

```scheme
[defs          (filter define-form? runtime)]
[defined-names (map (lambda (p) (car (normalize-define p))) defs)]
```

`defs` feeds phase 1 (register every name for mutual reference) and phase 2 (lower each form), on
both the whole-unit and the tree-shaken path. Nothing else reaches either, and nothing reports the
loss. `parse-define-library` already preserves body order across `begin` declarations and bare forms,
so the ordering information the fix needs is present and simply thrown away.

The shapes that fall out, and how each fails today — established by running them, not by reading:

| body form | today | severity |
|---|---|---|
| a command, e.g. `(display "x")` | dropped, **no diagnostic**; unit links and runs | silent wrong answer |
| `define-record-type`, exported | `compile-library: export of a name the library does not define make-pt` | loud; blocks records |
| `define-record-type`, internal | `repl: unbound variable pt-x` at the first accessor reference | loud; blocks records |
| `define-syntax` | works — `collect-define-syntax` takes it before the filter | fine |
| `define-values` | unimplemented compiler-wide, not a library issue | out of scope |

The program path is unaffected: `collect-toplevel` folds a program's top level into a `letrec` whose
body keeps the expressions.

Two constraints the fix inherits and must not break:

- **Cross-host determinism.** Phase 2 uses `fold-left`, not `map`, because the gensym counter is
  mutated per form and Chez's `map` and the prelude's `map` apply in different orders — which would
  diverge the AOT-door and REPL-door bytes for the same unit. Any new traversal over the body has the
  same requirement.
- **`(scheme base)` must not move.** Its body is 120 `define` plus 11 `define-syntax` and nothing
  else, so this change must leave `bootstrap/scheme.base.ll` byte-identical. That is the regression
  test for "no existing unit is affected."

## Goals / Non-Goals

**Goals:**

- A library body's commands are evaluated as part of the unit's initialization, in source order
  relative to the definitions around them (R7RS §5.6.1).
- `define-record-type` works in a library body: usable by sibling procedures, and exportable.
- The tree-shake keeps working, with a stated rule for a form that defines *no* name and a form that
  defines *several*.
- No change to any unit that compiles today, verified byte-wise on `(scheme base)`.

**Non-Goals:**

- The other R7RS library declarations — `include`, `include-ci`, `include-library-declarations`,
  `cond-expand`. Each is its own reader/splicer question and none is blocked on this one.
- `define-values`, which no door implements.
- **Making a command's effects visible to reachability analysis.** The shake will keep every command
  unconditionally (D3); teaching it which commands are dead is a separate optimization with no
  current payer.
- Assignment semantics inside a library body, settled by `library-toplevel-set`. A top-level `set!`
  is a *command* and so simply starts working here — see D5.

## Decisions

### D1 — Lower the whole body in source order, one `__init_N` thunk per form

The narrowing to `defs` is replaced by a fold over the whole of `runtime`, keeping every form. A
define lowers as it does now; anything else lowers through `repl-lower-form*`'s existing bare-form
arm (`[else (prep form)]`), which already produces the right IL for an expression — the capability is
present and merely unreachable from this path.

Source order is not cosmetic. `emit-library-batch` numbers the per-form thunks in the order `progs`
arrives and calls them in that order from `@"L:__init"`, so emitting a command in position keeps
initialization sequential: a command sees the definitions above it and not the ones below. Sorting
definitions before commands (the cheaper alternative) would silently reorder effects relative to the
source, which is exactly the class of bug this change exists to remove.

`fold-left` stays, for the determinism constraint above.

*Dump tagging.* `unit-def-lcode` tags each form's stage dump with the define's name; a command has
none. It gets a positional tag instead so `--dump` output stays legible and stable.

### D2 — A record-type declaration is spliced into plain defines, in place

`define-record-type` introduces several mutually-visible top-level bindings, so phase 1 has to know
all of its names, or a sibling procedure's reference to an accessor is an unbound variable and an
`(export make-pt)` is rejected.

**Decision:** normalize the body before it is split, replacing each `(define-record-type …)` with the
sequence of `(define <name> <init>)` forms that `record-type-bindings` returns, in place. Everything
downstream — phase-1 registration, per-form lowering, the export validator, the dependency graph — is
then unchanged, because every body form is a `define` or a command and nothing else.

This is not a new mechanism: `collect-toplevel` already does exactly this for a *program*
(`src/parse.ss:548` splices `record-type-bindings` into the letrec's binding list), so libraries end
up handling the form the same way programs do rather than a second way.

*Consequences, both good:*

- **`repl-lower-form*` is untouched.** Its `record-type-form?` arm binds through `repl-env-define!`
  unconditionally, which would have given a library's record bindings generation-mangled symbols
  (`pt-x.g0`) instead of the plain names the export table mangles. No record form reaches that arm on
  the unit path, so the shared REPL behaviour carries no risk from this change.
- **Pruning gets tighter, not coarser** — see D3.

*Consequence found while implementing: a library using `define-record-type` must import
`(scheme base)`.* The constructor the declaration lowers to builds its field vector with
`(list …)`, and a library does not auto-import the prelude the way a program does — so a
prelude-free library gets `unbound variable list`. That is correct behaviour rather than a defect
(the name is genuinely free in the expansion), but it is surprising enough to document in
`docs/MODULES.md` and to state in the fixture. Rewriting the desugaring over `%cons`/`'()` so records
work prelude-free is the obvious follow-up, and is deliberately **not** folded in here: it would
change the emitted IR of every existing record-using program and so churn `bootstrap/` for a reason
unrelated to this change.

*Determinism check.* The descriptor binding's name is a gensym (`rtd.N`), so it has to be identical
in the whole compile and the pruned recompile or the two units disagree. It is: `compile-library*`
calls `reset-counter!` first, and normalization runs over the same full body list before any lowering
in both calls, so the counter is in the same state when `record-type-bindings` is reached. The
constructor/predicate/accessor bindings are lambdas and take their stable labels from their own plain
names, so `cross-unit-direct-calls` D1 holds for records unchanged.

*Alternative considered — and initially chosen.* Keep the form intact, register its group of names in
phase 1, and lower it through `repl-lower-form*`'s existing `record-type-form?` arm with that arm
taught the unit binder. Rejected once the code was read: it is more code, it modifies a function the
REPL shares (so interactive record redefinition becomes a regression risk for no gain), and it forces
the coarser dependency node D3 describes. The original objection to splicing — that it would
duplicate the record layout — was simply wrong: splicing *calls* `record-type-bindings`, it does not
reimplement it.

### D3 — Tree-shake: a command is always kept; a record's bindings prune independently

The pruned path builds `expanded` as `(name . form)` pairs and prunes forms whose name is not
reachable from the program's roots. After D2 a record declaration is already several `define` forms,
so the only shape that breaks that keying is the **command**, which defines no name.

**Decision:** keep the one-name-per-form node, and give the command a rule of its own.

- **A command is kept unconditionally, and the unit's own names it references join the root set.**
  A command's effect is a store into state that reachability analysis does not model, so there is no
  sound way to conclude it is dead: dropping a command that initializes a table the program reads
  through an exported accessor would produce a silently wrong answer, the same class of bug as the
  present drop. Keeping it is the conservative direction, and its references must become roots or the
  shake could prune a binding the kept command calls — a link-time undefined symbol.
- **A record type's bindings prune independently**, which falls out of D2 and is *tighter* than
  treating the declaration as one node. Each accessor, the constructor and the predicate all
  reference the descriptor, so reaching any one of them keeps the descriptor it needs; but reaching
  `pt-x` does not drag in `make-pt`. The bindings are separate globals over a shared descriptor, so
  emitting a subset is well-defined — there is no group to keep whole.

This is a pruning *loss* for a library with commands: it pins whatever they reference. That is
correct rather than unfortunate, and it costs `(scheme base)` nothing, since it has no commands. Per
`docs/OUTPUT.md` the shake already narrates what it kept, so the cost is visible.

### D4 — Implement R7RS rather than reject the form loudly

Issue #16 offers a cheaper option: error on a non-define body form. One line, and it converts a
silent wrong answer into a diagnostic.

**Rejected**, for three reasons that compound:

1. **It does nothing for records**, which is the half that blocks work. A loud error is already what
   `define-record-type` produces; making it a *better* loud error is not progress.
2. **The fixed cost dominates the marginal cost.** Any compiler source edit means `make regen`
   (~5 min), `test/trust-check.sh` on the commit, and both suites. Option 1 pays that in full for a
   way-station that the R7RS-small target (stated in `docs/MODULES.md` and in the project's module
   goal) commits to deleting later — so the cheap fix costs the same as the real one, twice.
3. **It narrows a documented target.** Rejecting commands means writing into the spec that Emit's
   library body is definitions-only, which contradicts the module-surface goal.

The honest form of option 1 survives as a fallback: if the tree-shake rule in D3 turns out to be
wrong, rejecting commands is still better than dropping them.

### D5 — What this unblocks in `library-toplevel-set`

`library-toplevel-set` (issue #14) permits a unit to `set!` its own top-level binding, but only from
inside a procedure body, because a *top-level* `set!` is a command and was dropped. It starts working
here with no further change — the assignment reaches `assign-global`, which records the name and
withholds its direct-call row exactly as it does from a procedure body. Worth a test, since it is the
interaction most likely to be assumed rather than checked, and its failure mode (a row advertised for
a slot that moves) is silent misdispatch.

## Risks / Trade-offs

- **Thunk renumbering changes emitted bytes for a unit with commands** → none exists today, so
  nothing regresses; but the `(scheme base)` byte-identity check is what proves it, and it must be
  run rather than assumed.
- **The record arm's binder change touches the REPL path** → `repl-lower-form*` is shared, so
  breaking the generation-mangled behaviour would break REPL record redefinition. Mitigation: the
  change is gated on the same `register?` flag the `define` arm uses, and
  `test/record-type-syntax-tests.sh` plus the REPL suites already cover the interactive side.
- **A command that raises during `__init`** → the unit's initialization aborts partway, with the
  `@"L:__inited"` flag already set to 8, so a retry would report `already`. This is pre-existing for
  a define whose initializer raises; the change widens the surface that can trigger it. Out of scope
  to fix, worth recording.
- **Over-keeping in the shake** (D3) → measurable as binary size on a library with commands; nothing
  in the repo has any, so it starts at zero cost.

## Migration Plan

No migration. A library whose body relied on a command being dropped now evaluates it — and no such
library can exist meaningfully, since the effect never happened, so nothing could have depended on
it. Every library that compiles today compiles to the same bytes.

## Open Questions

- **Should the shake be able to drop a command?** A command whose referenced names are all otherwise
  unreachable *and* whose effects touch nothing exported is dead, but proving that needs an effect
  model. Deferred to `docs/PERFORMANCE.md` if a real library ever makes it matter.
- **`include` and friends** — worth folding in, or a separate change? They are a reader concern
  (splicing a file's forms into the body) rather than a lowering one, and they land on the surface
  this change fixes, so they are probably cleaner *after* it than with it.
