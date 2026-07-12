# macro-system Specification

## Purpose

Defines user-defined syntactic extensions via `define-syntax` and `syntax-rules`: pattern
matching with literals, the `_` wildcard, and ellipsis; hygiene for macro-introduced
identifiers; and fixpoint expansion that rewrites macro uses into core forms (or reports
non-termination).

## Requirements

### Requirement: Define syntactic extensions with define-syntax and syntax-rules

The compiler SHALL support top-level `(define-syntax <keyword> (syntax-rules (<literal>
...) (<pattern> <template>) ...))`, binding `<keyword>` to a transformer. A use of a bound
keyword SHALL be rewritten by the first rule whose `<pattern>` matches the use, with the
rule's `<template>` instantiated under the captured bindings. `define-syntax` and
`syntax-rules` are reserved keywords. These forms are compile-time only: no
`define-syntax` form survives into the parsed core language.

#### Scenario: User-defined macro expands and runs

- **WHEN** a program defines `(define-syntax swap! (syntax-rules () ((_ a b) (let ([tmp
  a]) (set! a b) (set! b tmp)))))` and uses `(swap! x y)`
- **THEN** the executable swaps the values of `x` and `y` and produces the correct result
  on all three backends

#### Scenario: First matching rule is selected

- **WHEN** a `syntax-rules` transformer has multiple rules and a use matches more than one
- **THEN** the earliest matching rule is used

#### Scenario: define-syntax leaves no runtime binding

- **WHEN** a program compiled with `--dump` defines and uses a macro
- **THEN** the `expand` stage output contains only core forms, with the macro fully
  rewritten and no `define-syntax`/`syntax-rules` form remaining

### Requirement: Pattern matching with literals, wildcard, and ellipsis

`syntax-rules` patterns SHALL support: the `_` wildcard (matches anything, binds nothing);
literal identifiers (declared in the literals list, matching only the identical
identifier); pattern variables (any other identifier, binding the aligned syntax); proper
and dotted list structure; and ellipsis (`...`), where `(p ... . tail)` matches zero or
more repetitions of `p` and each pattern variable within `p` is captured for lockstep
instantiation in the template.

#### Scenario: Ellipsis over a variadic macro

- **WHEN** a program defines `(define-syntax my-list (syntax-rules () ((_ e ...) (list e
  ...))))` and evaluates `(my-list 1 2 3)`
- **THEN** the result is the list `(1 2 3)`, and `(my-list)` yields the empty list

#### Scenario: Literal identifier matches only itself

- **WHEN** a transformer declares a literal (e.g. `=>` or `else`) and a use supplies that
  exact identifier in the corresponding position
- **THEN** the literal-bearing rule matches; a use with a different identifier there does
  not match that rule

#### Scenario: Nested ellipsis binds at the correct depth

- **WHEN** a macro pattern nests ellipsis (e.g. `((v e) ...)`) and the template uses `v`
  and `e` under a matching ellipsis
- **THEN** each captured group is instantiated in lockstep at the correct depth; a
  template use whose ellipsis depth does not match its capture depth is a compile error

### Requirement: Hygiene for macro-introduced identifiers

Expansion SHALL be hygienic with respect to identifiers a template introduces: an
identifier written in a template that is not a pattern variable and does not name a core
keyword, primitive, or known top-level/prelude binding SHALL be consistently renamed to a
fresh identifier per expansion, so a macro's introduced bindings can neither capture user
identifiers nor be captured by them. Syntax substituted from the macro use SHALL retain
its original identifiers.

#### Scenario: Introduced temporary does not capture user code

- **WHEN** a macro introduces a temporary binding (e.g. `or`'s `t`, or `swap!`'s `tmp`)
  and is used with argument expressions that reference an identifier of the same name
- **THEN** the user's identifier and the macro's temporary remain distinct and the program
  produces the correct result

#### Scenario: Referenced primitive stays bound to its definition

- **WHEN** a template references a core keyword or primitive (e.g. `let`, `if`, `cons`)
- **THEN** that identifier is left unrenamed and resolves to its usual definition

### Requirement: Expansion reaches a fixpoint or reports non-termination

The `expand` stage SHALL repeatedly rewrite macro uses until only core forms and known
primitive/arithmetic heads remain, re-expanding the output of each rewrite. Quoted data
(`quote`) SHALL NOT be expanded. A recursion-depth guard SHALL bound re-expansion and
raise a clear error when a macro fails to terminate, rather than looping indefinitely.

#### Scenario: Recursive macro terminates

- **WHEN** a recursively-defined macro (e.g. `and`/`or` over many operands) is used
- **THEN** expansion terminates and the resulting core form evaluates correctly

#### Scenario: Non-terminating macro is reported

- **WHEN** a macro expands into a use of itself without reducing
- **THEN** the compiler halts with a clear macro-expansion error rather than hanging

#### Scenario: Quoted data is not expanded

- **WHEN** a macro keyword or ellipsis-shaped form appears inside `(quote ...)`
- **THEN** it is left untouched as literal data
