# compiler-pipeline Specification

## Purpose

Defines how the compiler's pass pipeline is structured and justified: the choice of
framework for expressing passes (nanopass versus stylized hand-rolled Scheme), and the
documented boundary between the frontend passes the compiler owns and the work delegated
to LLVM.
## Requirements
### Requirement: Pass-pipeline framework decision is evidence-backed and recorded

The project SHALL record a decision on how the compiler's pass pipeline is expressed —
the nanopass framework versus stylized hand-rolled Scheme — supported by a direct
comparison of representative passes translated both ways, together with the rationale
and the scoring that produced it.

#### Scenario: Representative passes are translated both ways

- **WHEN** the framework decision is made
- **THEN** at least three representative Chez passes (a trivial-traversal pass, an
  assignment-conversion pass, and a closure-conversion pass) have been translated into
  both nanopass and stylized hand-rolled Scheme
- **AND** each pair produces equivalent output on the same shared test inputs

#### Scenario: Decision is recorded with rationale

- **WHEN** the comparison is complete
- **THEN** the frontend/pass-ladder design doc records the chosen framework, the
  scoring (line count, boilerplate share, readability, safety lost), and the rationale
- **AND** `LLVM.md`'s framing of the pass pipeline is consistent with the recorded
  decision

### Requirement: Frontend pass-ladder and LLVM boundary are documented

The project SHALL document the transferable frontend pass spine
(`read → expand → core → assignment-conv → closure-conv → lambda-lift → emit .ll`) and
the boundary below which LLVM subsumes the work (ANF, calling conventions, basic-block
layout, instruction selection, register allocation, code generation).

#### Scenario: Pipeline doc distinguishes owned passes from LLVM-subsumed work

- **WHEN** the frontend/pass-ladder design doc exists
- **THEN** it identifies which passes the compiler owns and which are delegated to LLVM
- **AND** it notes that the minimal subset requires neither CPS nor ANF, with CPS tied
  to future `call/cc` support

### Requirement: Primitive-inlining pass

The frontend pass ladder SHALL include a primitive-inlining pass that rewrites a direct call
whose operator resolves to a global primitive-layer binding into the corresponding bare
primcall, provided the operator is not lexically shadowed, not user-redefined, and not
`set!`-ed. The pass SHALL key its decision on the resolved binding (so shadowing is respected
automatically) and SHALL be an observable stage in the pass ladder, consistent with the
project's one-IL-per-stage discipline.

#### Scenario: The pass is shadow-aware

- **WHEN** a primitive name is shadowed lexically, redefined at top level, or `set!`-ed
- **THEN** the inlining pass does NOT rewrite calls to it; the call remains an ordinary
  closure call

#### Scenario: The pass appears in the documented ladder

- **WHEN** the frontend pass ladder is documented (`docs/PIPELINE.md`)
- **THEN** the primitive-inlining stage is listed with its input and output IL shape

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

### Requirement: Standard prelude prepended to programs

The compiler SHALL support a standard **prelude** — a file of Scheme definitions — whose
top-level forms are prepended to every compiled program's forms before the program is
assembled, so prelude definitions are in scope for every program. If a user program defines
a name the prelude also defines, the user's definition SHALL win (the prelude's definition
for that name is dropped), so the prelude never collides with or clobbers user code. The
compiler SHALL provide a way to compile a program without the prelude.

#### Scenario: Prelude procedures are available to a program

- **WHEN** a program that defines none of the prelude names calls a prelude procedure (e.g.
  `(map f (list 1 2 3))`)
- **THEN** it compiles and runs using the prelude's definition, producing the correct result

#### Scenario: User definitions shadow the prelude

- **WHEN** a program defines a name that the prelude also defines
- **THEN** the program's definition is used and the prelude's definition of that name is
  dropped (no duplicate-binding error), and the program produces the result of its own
  definition

#### Scenario: Prelude can be disabled

- **WHEN** a program is compiled with the prelude disabled
- **THEN** it is compiled from its own forms alone, and a program that does not reference any
  prelude procedure produces the same result as with the prelude enabled

### Requirement: syntax-rules matcher selection is evidence-backed and recorded

The project SHALL record a decision on which `syntax-rules`-based pattern matcher replaces
the compiler's `syntax-case` `match`, supported by an empirical comparison rather than paper
analysis. Candidate matchers SHALL be filtered by hard gates (`syntax-rules`-only; coverage
of the pattern subset the passes use, including ellipsis-with-tail `(p ... plast)`; use of
no feature Emit lacks), the survivors SHALL be compared empirically, and the chosen
matcher SHALL be recorded together with the rationale and the exact expander work the
follow-on rewrite requires.

#### Scenario: Candidates are gated and scored

- **WHEN** the matcher selection is made
- **THEN** the candidate matchers considered are recorded with a pass/fail against the hard
  gates and a weighted score for the survivors (pass churn, expander work, test-suite reuse,
  size, maturity)

#### Scenario: Candidate constructs are validated against the real expander

- **WHEN** the top candidates are compared
- **THEN** representative matcher constructs (at minimum a flat pattern, an ellipsis pattern,
  and an ellipsis-with-tail pattern) are expanded against the actual expander and the results
  are recorded, including any construct the expander does not yet support
- **AND** if that spike is insufficient to decide, representative passes are ported and their
  emitted IR is checked byte-identical to the current baseline

#### Scenario: Decision is recorded with required expander work

- **WHEN** the comparison is complete
- **THEN** the change's design doc records the chosen matcher, the scores, the bake-off
  evidence, and the specific `syntax-rules` construct(s) (if any, e.g. the ellipsis escape
  `(... ...)`) that the expander must gain before the rewrite

### Requirement: Pass pattern-matching depends only on syntax-rules

The pattern-matching facility used to express the compiler's passes SHALL be implementable
with `syntax-rules` alone and SHALL NOT depend on `syntax-case` or any other procedural-macro
facility. This keeps the compiler's own source within reach of Emit's expander (a
self-hosting enabler). The hand-rolled pass-framework decision is unchanged; only the
matcher's macro-level requirements are constrained.

#### Scenario: The matcher carries no syntax-case dependency

- **WHEN** the compiler source is inspected after this change
- **THEN** no pass or matcher module imports or uses `syntax-case`, `with-syntax`,
  `generate-temporaries`, `datum`, or quasisyntax, and the previous `syntax-case`-based
  `match` module is removed

#### Scenario: Passes behave identically under the new matcher

- **WHEN** the full test suite (`./run-all-tests.sh`) is run after the passes are rewritten
  to the `syntax-rules` matcher
- **THEN** all suites pass, and emitted IR / program results are unchanged from before the
  change (the port is behavior-preserving)

#### Scenario: A single matcher serves host and self-hosted builds

- **WHEN** the matcher is chosen and integrated
- **THEN** the same matcher module is used by the host (Chez) build and is expressible by
  Emit's own expander, so there is no separate host-only matcher to diverge

### Requirement: Pure compiler core is separable from the I/O driver

The compiler SHALL be structured as a pure core that maps source forms (or source text) to
LLVM IR text, and a driver that performs all input/output — reading source, writing the
`.ll`, invoking the C toolchain/JIT, and supplying the host target header. The core SHALL NOT
perform file, subprocess, or port I/O, so that the self-hosting target is the core alone.

#### Scenario: Core produces IR without I/O

- **WHEN** the pure core is given a program's forms (or source string)
- **THEN** it returns the program's LLVM IR text without reading or writing any file,
  spawning any process, or requiring the host target header

#### Scenario: Driver behavior is unchanged

- **WHEN** the driver compiles a program through the refactored core
- **THEN** the emitted IR and program results are identical to before the split, and all
  existing CLI modes (AOT, JIT, bitcode, `--dump`, `--no-prelude`, `--repl`) behave as before

#### Scenario: Core runs as a text filter

- **WHEN** source text is provided on stdin in the core's filter mode
- **THEN** the corresponding IR text is written to stdout, with the target header and
  toolchain invocation left to the driver/host

