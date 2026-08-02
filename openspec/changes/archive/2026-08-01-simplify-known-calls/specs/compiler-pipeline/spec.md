## ADDED Requirements

### Requirement: Simplify (optimizing) pass

The frontend pass ladder SHALL include a `simplify` pass that removes work from the intermediate
language rather than translating it: it inlines a known, singly-referenced lambda binding into its
one call site, propagates constant `let` bindings and folds primcalls over constant arguments, and
drops bindings that have become unreferenced. The pass SHALL run **after** assignment conversion
and **before** closure conversion, so that every variable it reasons about is immutable (`set!`
has already been eliminated by boxing) and no rule needs its own assignment analysis. The pass
SHALL be value-preserving: for every program, the value produced with the pass enabled is
identical to the value produced without it.

#### Scenario: A known singly-referenced lambda binding is inlined

- **WHEN** a `letrec` or `let` binds a name to a `lambda`, the name occurs exactly once in the
  term, that occurrence is the operator of a `call`, and the call's argument count matches the
  lambda's fixed arity
- **THEN** the pass substitutes the lambda at that call site, forms the corresponding `let` of
  parameters to arguments, and removes the binding

#### Scenario: A multiply-referenced or recursive binding is not inlined

- **WHEN** a lambda-bound name occurs more than once — including the case where the extra
  occurrence is inside the lambda's own body, i.e. the function is self-recursive
- **THEN** the pass leaves the binding and every call site unchanged, so the pass never
  duplicates code and never grows the emitted output

#### Scenario: A name used in a non-operator position is not inlined

- **WHEN** a lambda-bound name's single occurrence is an argument, a captured value, or any
  position other than the operator of a `call`
- **THEN** the pass leaves the binding unchanged, because the procedure value itself is required

#### Scenario: Immediate constants propagate and primcalls over constants fold

- **WHEN** a `let` binds a variable to an immediate `(const …)` — an exact integer, boolean,
  character, or the empty list — or a foldable `primcall` has an all-`const` argument list
- **THEN** the pass substitutes the constant into the body, and folds the primcall to a single
  `(const …)` node

#### Scenario: A non-immediate constant is not propagated

- **WHEN** a binding's constant is one that materializes at run time — a string, a pair, a
  flonum, a symbol
- **THEN** the pass does NOT substitute it, because copying it to several use sites would
  allocate a separate object per site, changing both code size and the `eq?`-identity that two
  references to one binding previously had

#### Scenario: Folding is refused outside a range that guarantees no overflow

- **WHEN** either operand of a foldable primcall lies outside the range in which no addition,
  subtraction, or multiplication of two such operands can leave the target fixnum range
- **THEN** the pass does NOT fold and leaves the primcall for the runtime to evaluate

The condition SHALL be checked *before* the pass computes any result, and SHALL NOT be expressed
as a range test applied to an already-computed value: the compiler is self-hosted and the target's
fixnum arithmetic wraps silently, so a computed result may already have wrapped. The condition
SHALL be sufficient rather than exact — declining a fold whose result would in fact have been
representable is correct behavior, whereas performing one that would not is not.

#### Scenario: Bindings left unreferenced are dropped

- **WHEN** inlining or folding leaves a `letrec` or `let` binder with no remaining references,
  and its right-hand side is a `lambda` or is otherwise effect-free
- **THEN** the pass removes the binding, so the closure allocation is eliminated and not merely
  the arithmetic it guarded

#### Scenario: The pass appears in the documented ladder and in --dump

- **WHEN** a program is compiled with `--dump` on any door
- **THEN** the IL after `simplify` is printed as its own named stage between the
  `convert-assignments` and `convert-closures` stages
- **AND** `docs/PIPELINE.md` lists the stage with its input and output IL shape, consistent with
  the project's one-IL-per-stage discipline

#### Scenario: Existing program values are unchanged

- **WHEN** the demo and test suites are run with the pass in the ladder
- **THEN** every program produces output identical to its output before the pass was added
- **AND** the self-hosting regeneration fixed point still converges
