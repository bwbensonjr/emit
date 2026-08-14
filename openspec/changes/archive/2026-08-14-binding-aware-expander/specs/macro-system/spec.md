## MODIFIED Requirements

### Requirement: Define syntactic extensions with define-syntax and syntax-rules

The compiler SHALL support top-level `(define-syntax <keyword> (syntax-rules (<literal>
...) (<pattern> <template>) ...))`, binding `<keyword>` to a transformer. A use of a bound
keyword SHALL be rewritten by the first rule whose `<pattern>` matches the use, with the
rule's `<template>` instantiated under the captured bindings. `define-syntax` and
`syntax-rules` are reserved keywords. These forms are compile-time only: no
`define-syntax` form survives into the parsed core language.

**A binding SHALL shadow a keyword of the same name.** A macro keyword is a binding like any other
(R7RS §4.2, §5.3), so where an identifier is bound as a **variable** at the point of use, that
identifier SHALL NOT be treated as a macro keyword: the form SHALL be expanded as an ordinary
application of the bound variable, and its subforms expanded normally. The expander SHALL therefore
carry the set of identifiers bound at each point of the traversal, extended by every binding form it
descends through — `lambda` formals (fixed, dotted, and a symbol rest-formal), `let` / `letrec` /
`letrec*` binding names, the loop name of a named `let`, and the names bound by **internal
definitions** in a body — and seeded with the program's **top-level** definition names, since a
program's top-level bindings are folded into one mutually-recursive scope and are in scope
throughout.

This is a **narrowing of accepted behaviour**: a program that relies on the keyword winning over a
binding of the same spelling is incorrect under R7RS, and previously produced either a rewrite of
the wrong form or — where the shadowed keyword's rules happened to accept the argument list — a
silent wrong answer with no diagnostic. Shadowing SHALL apply to every keyword in scope, whether
defined by the prelude, by an imported library, or by the program itself.

**Core keywords are out of scope.** `quote`, `if`, `lambda`, `let`, `letrec`, `letrec*`, `begin`,
`set!`, `define`, `apply`, `define-syntax`, and `syntax-rules` SHALL continue to be recognized by
spelling, because `parse` recognizes them independently of the expander; making them shadowable is a
change to that pass and is not required here.

**An implementation-internal auxiliary keyword is shadowable on the same terms, with a known
consequence.** Because hygiene is a name-set test with no marks, an identifier a template introduces
and an identifier the user bound are indistinguishable, so a derived form whose expansion calls an
auxiliary keyword *inside* a scope that binds the user's variables SHALL lose that keyword if the
user's variable is spelled the same. This is the correct reading of the shadowing rule and the
residual cost of the model: it makes `(let ((%do-step f)) (%do-step 4))` call `f` — where it
previously expanded the internal helper and silently answered `4` — at the price of a `do` whose loop
variable is literally named `%do-step` failing loudly instead of working by accident (issue #106).

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

#### Scenario: A let binding shadows a prelude macro keyword

- **WHEN** a program evaluates `(let ((when (lambda (x) x))) (when 5))`
- **THEN** the result is `5` — the lexical procedure is called — rather than the unspecified value
  produced by expanding the `when` macro with an empty body

#### Scenario: A named let shadows a macro keyword in its own body

- **WHEN** a program defines a macro `my-or` and then writes `(let my-or ((j 0)) (if (>= j 3) 'done
  (my-or (+ j 1))))`
- **THEN** the recursive call invokes the loop procedure and the result is `done`, rather than
  reporting no matching `syntax-rules` pattern for a use of `my-or`

#### Scenario: A top-level or internal define shadows a macro keyword

- **WHEN** a program defines `(define (when x) (* x 2))` at top level and evaluates `(when 5)`, and
  when a body contains `(define when (lambda (x) (* x 3)))` before a use of `(when n)`
- **THEN** both call the defined procedure — `10` and `3n` — rather than expanding the macro

#### Scenario: A lambda formal shadows a macro keyword

- **WHEN** a procedure is defined as `(lambda (unless) (unless 7))` and applied to a procedure
- **THEN** the argument is called, rather than the `unless` macro being expanded

### Requirement: Pattern matching with literals, wildcard, and ellipsis

`syntax-rules` patterns SHALL support: the `_` wildcard (matches anything, binds nothing);
literal identifiers (declared in the literals list, matching only the identical
identifier); pattern variables (any other identifier, binding the aligned syntax); proper
and dotted list structure; and ellipsis (`...`), where `(p ... . tail)` matches zero or
more repetitions of `p` and each pattern variable within `p` is captured for lockstep
instantiation in the template.

**The literals list SHALL take priority over the special identifiers.** An identifier named in a
rule's literals list SHALL be matched as a literal — matching only the identical identifier —
**even when it is spelled `_` or `...`**. R7RS §4.3.2 gives the literals list this priority, and a
matcher that tests for the wildcard or the ellipsis by name before consulting the literals list
silently accepts input the rule was written to reject. The priority SHALL hold in every place the
distinction is made: when matching a pattern against a form, and when collecting a pattern's
variables for template instantiation. A rule whose literals list is empty, or which names neither
`_` nor `...`, SHALL be matched exactly as before.

**A literal SHALL NOT match an identifier that is bound at the use site.** R7RS §4.3.2 compares a
literal by *binding* rather than by spelling, so an auxiliary keyword the program has shadowed is an
ordinary identifier there: a rule whose literal position is filled by a lexically bound identifier
SHALL NOT match, and matching SHALL fall through to the following rules. This is what makes
`(let ((=> #f)) (cond (#t => 'ok)))` answer `ok` (R7RS §4.2.1's own illustration) instead of
applying the clause body as a receiver. The comparison is against the **use site's** bindings; a
literal's binding in the transformer's own definition environment is not modelled, and full
referential transparency for literals remains out of scope.

#### Scenario: Ellipsis over a variadic macro

- **WHEN** a program defines `(define-syntax my-list (syntax-rules () ((_ e ...) (list e
  ...))))` and evaluates `(my-list 1 2 3)`
- **THEN** the result is the list `(1 2 3)`, and `(my-list)` yields the empty list

#### Scenario: Literal identifier matches only itself

- **WHEN** a transformer declares a literal (e.g. `=>` or `else`) and a use supplies that
  exact identifier in the corresponding position
- **THEN** the literal-bearing rule matches; a use with a different identifier there does
  not match that rule

#### Scenario: A literal _ is matched literally, not as a wildcard

- **WHEN** a program defines a transformer whose literals list is `(_)`, with rules `((_) 0)`,
  `((_ _) 1)`, `((_ _ _) 2)`, and `((x . y) 'fail)`, and applies it to `(_ _)`, `()`, `(a b)`, and
  `(a b c d)`
- **THEN** the results are `2`, `0`, `fail`, and `fail` — the `(_ _ _)` rule requires two literal
  `_` arguments, so a use supplying `a b` falls through to the `(x . y)` rule

#### Scenario: A literal ellipsis identifier is matched literally

- **WHEN** a transformer names `...` in its literals list and a use supplies an identifier other
  than `...` in that position
- **THEN** the rule does not match, and the repetition reading of `...` does not apply to that
  pattern

#### Scenario: An empty literals list leaves wildcard behaviour unchanged

- **WHEN** a transformer with an empty literals list uses `_` in its patterns
- **THEN** `_` matches anything and binds nothing, exactly as before

#### Scenario: Nested ellipsis binds at the correct depth

- **WHEN** a macro pattern nests ellipsis (e.g. `((v e) ...)`) and the template uses `v`
  and `e` under a matching ellipsis
- **THEN** each captured group is instantiated in lockstep at the correct depth; a
  template use whose ellipsis depth does not match its capture depth is a compile error

#### Scenario: A shadowed => is an ordinary cond clause expression

- **WHEN** a program evaluates `(let ((=> #f)) (cond (#t => 'ok)))`
- **THEN** the result is `ok` — the clause is read as `(test expression ...)` — rather than the
  clause body being applied to the test value

#### Scenario: A shadowed else is an ordinary cond test

- **WHEN** a program evaluates `(let ((else #f)) (cond (else 'wrong) (#t 'right)))` and
  `(let ((else #f)) (cond (else 'wrong)))`
- **THEN** the results are `right` and the unspecified value — the `else` clause form does not apply
  where `else` is bound as a variable

#### Scenario: An unshadowed auxiliary keyword still matches

- **WHEN** a program evaluates `(cond ((assv 2 '((1 a) (2 b))) => cadr) (else 'none))`
- **THEN** the receiver form still applies and the result is `b`, so the use-site test narrows only
  the shadowed case

### Requirement: Hygiene for macro-introduced identifiers

Expansion SHALL be hygienic with respect to identifiers a template introduces: an
identifier written in a template that is not a pattern variable and does not name a core
keyword, primitive, or known top-level/prelude binding SHALL be consistently renamed to a
fresh identifier per expansion, so a macro's introduced bindings can neither capture user
identifiers nor be captured by them. Syntax substituted from the macro use SHALL retain
its original identifiers.

A transformer that arrives from an **imported library** carries template identifiers already
resolved in the library that defined it — unit-qualified symbols naming that library's own or its
imports' bindings. Those identifiers SHALL count as known bindings in the importing unit and SHALL NOT
be renamed as introduced, since renaming one would break the reference the exporting library resolved.
The same SHALL hold for the unit-qualified keyword of a private macro carried alongside an exported
one.

**The bindings a `define-record-type` introduces SHALL count as known bindings on every compilation
path.** A record's type descriptor, constructor, predicate, accessors, and modifiers are top-level
bindings once the form is lowered, so a template that references one SHALL NOT be renamed as
introducing it. This SHALL hold identically for a program, a library unit, and a form entered at the
REPL: the known-binding set SHALL be computed from the form list **after** record types are lowered,
so the path a program takes cannot decide whether a macro over a record expands.

#### Scenario: Introduced temporary does not capture user code

- **WHEN** a macro introduces a temporary binding (e.g. `or`'s `t`, or `swap!`'s `tmp`)
  and is used with argument expressions that reference an identifier of the same name
- **THEN** the user's identifier and the macro's temporary remain distinct and the program
  produces the correct result

#### Scenario: Referenced primitive stays bound to its definition

- **WHEN** a template references a core keyword or primitive (e.g. `let`, `if`, `cons`)
- **THEN** that identifier is left unrenamed and resolves to its usual definition

#### Scenario: A resolved identifier from an imported transformer is not renamed

- **WHEN** an imported macro's template references its own library's binding as the unit-qualified
  symbol the exporting library resolved it to, and the macro is used in the importing unit
- **THEN** that identifier is left unrenamed and lowers as a reference to the exporting unit's global

#### Scenario: Two imported macros' resolved identifiers coexist

- **WHEN** a unit imports two libraries that each export a macro whose template references a private
  helper of the same spelling in its own library
- **THEN** each expansion references its own library's binding, and neither is renamed away

#### Scenario: A template references a record constructor and accessor

- **WHEN** a program defines `(define-record-type box (mk v) box? (v unbox))` and
  `(define-syntax m (syntax-rules () ((_ e) (mk e))))`, then evaluates `(unbox (m 5))`
- **THEN** the result is `5`, rather than a report of an unbound variable under a renamed spelling

#### Scenario: A record-referencing template expands identically on every path

- **WHEN** the same record definition and macro are compiled as a program, as the body of a library
  unit, and entered form-by-form at the REPL
- **THEN** all three expand and evaluate identically (dev→ship fidelity), where previously only the
  library unit succeeded
