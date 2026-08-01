## Why

`compile-library*` lowers only the `(define …)` forms of a library body:

```scheme
[defs (filter define-form? runtime)]
```

`defs` is the only list that reaches either lowering path, so every other body form is discarded.
Two shapes fall into that hole, and they fail very differently:

- **A command** (an expression evaluated for effect) is **silently dropped**. The unit links and
  runs; the side effect just never happens. R7RS §5.6.1 makes the commands in a `begin` declaration
  part of the library's initialization.

  ```scheme
  (define-library (drop)
    (export g)
    (begin (define (g) 1)
           (display "TOP-LEVEL EXPRESSION RAN")))     ; never emitted, no diagnostic
  ```

- **`define-record-type`** fails loudly, but it means **a library cannot declare a record type at
  all** — the one that blocks real work. Exported, the export validator catches it
  (`export of a name the library does not define make-pt`); kept internal, the first reference to an
  accessor does (`unbound variable pt-x`). Records are part of `(scheme base)`'s surface, so a
  library not being able to use them is a hole in the module system, not a missing nicety.

The command half has a total workaround — bind the effect to a name and it becomes a define with its
own `__init_N` thunk, verified end to end. The record half does not: the alternative is hand-writing
the vector representation with raw primitives.

Issue #16.

## What Changes

- A library body form that is **not** a `define` is lowered instead of dropped. Commands and
  definitions are emitted in **source order**, each as its own `@"L:__init_N"` thunk, so the unit's
  initialization runs the declarations in the order written (R7RS §5.6.1).
- **`define-record-type` works in a library body.** Its group of names (descriptor, constructor,
  predicate, accessors, modifiers) is registered as one mutually-visible group in the unit's phase-1
  pass, so a sibling procedure may reference an accessor and the names may be exported.
- The closed-world AOT tree-shake gets a rule for both shapes. A **command** has no name to be
  reachable *from*, so it is always kept and the unit's own names it references join the root set. A
  **record-type group** is reachable as a unit: reaching any one of its names keeps the whole form,
  since the form emits them together.
- **BREAKING (in the safe direction):** a library whose body relied on a command being dropped now
  evaluates it. No library in the repo does — `(scheme base)` is all definitions — and a program
  cannot have depended on the effect, since the effect never happened.
- Not addressed: the remaining R7RS library declarations (`include`, `include-ci`,
  `include-library-declarations`, `cond-expand`) and `define-values`, which is unimplemented
  everywhere.

## Capabilities

### New Capabilities

(none — this closes a gap in an existing surface)

### Modified Capabilities

- `module-system`: the library body surface admits commands and `define-record-type`, not only
  `define`; declarations are evaluated in source order during the unit's initialization; and the
  tree-shake's reachability rule is extended to cover a nameless form and a multi-name form.

## Impact

- `src/core.ss` — `compile-library*`: both lowering paths fold over the whole body rather than
  `filter define-form?`; phase 1 registers a record-type group's names alongside the defines; the
  pruned path's `expanded` list becomes keyed by a *set* of defined names (empty for a command) and
  its root set absorbs each command's references.
- `src/parse.ss` — `repl-lower-form*`'s `record-type-form?` arm binds through `repl-env-define!`
  unconditionally, which would give a library's record bindings generation-mangled symbols
  (`pt-x.g0`) instead of the plain names the export table mangles. It has to respect the unit binder,
  the way the `define` arm already respects `register?`.
- `src/core.ss` — `unit-def-lcode` tags its dump with the define's name; a command has none and needs
  a positional tag so `--dump` output stays readable.
- `bootstrap/*.ll` — regenerated (`make regen`), then `test/trust-check.sh` on the commit.
- Tests: a library that runs a command at init and one that declares, uses, and exports a record
  type, through all three doors and through the tree-shake.
