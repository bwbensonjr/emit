## ADDED Requirements

### Requirement: N-ary identity predicates

The identity predicates `eq?` and `eqv?` SHALL accept any number of arguments as chained
(pairwise) comparisons: for operands `a b c …` the result is the conjunction
`(op a b) ∧ (op b c) ∧ …`, short-circuiting to `#f` on the first false pair. Each operand
SHALL be evaluated exactly once, left to right. A comparison of fewer than two arguments
(`(op)` or `(op a)`) SHALL evaluate to `#t`. This SHALL be a frontend expansion into
binary `eq?` / `eqv?` primitive calls, reusing the comparison-chaining mechanism, with no
change to the runtime calling convention.

#### Scenario: Chained identity comparison

- **WHEN** a program evaluates `(eq? 'a 'a 'a)` and `(eq? 'a 'a 'b)`
- **THEN** the results are `#t` and `#f`

#### Scenario: Single evaluation of operands

- **WHEN** a program uses a middle operand with a side effect in an n-ary `eq?`,
  such as `(eq? 1 (begin (set! calls (+ calls 1)) 1) 1)` where `calls` starts at `0`
- **THEN** the comparison is `#t` and the operand runs exactly once (`calls` ends at `1`)

#### Scenario: Trivial arity

- **WHEN** a program evaluates `(eqv? 5)` and `(eq?)`
- **THEN** both results are `#t`

### Requirement: eqv? primitive

The compiler SHALL provide `eqv?` as a reserved primitive that returns `#t` when its two
arguments are the same object, and `#f` otherwise. In the current subset `eqv?` SHALL agree
with `eq?`: it holds for fixnums (immediate) and interned symbols. Characters are boxed and
not interned, so `eqv?` on distinct character literals is `#f` — correct value comparison
of characters is deferred to a change that interns/immediates characters.

#### Scenario: eqv? on fixnums and symbols

- **WHEN** a program evaluates `(eqv? 3 3)`, `(eqv? 3 4)`, and `(eqv? 'x 'x)`
- **THEN** the results are `#t`, `#f`, and `#t`

### Requirement: not primitive

The compiler SHALL provide `not` as a reserved boolean-negation primitive that returns
`#t` when its argument is `#f` and `#f` for every other value. `not` SHALL be a primitive
(not a prelude procedure).

#### Scenario: Boolean negation

- **WHEN** a program evaluates `(not #f)`, `(not #t)`, and `(not 0)`
- **THEN** the results are `#t`, `#f`, and `#f` (only `#f` is false)
