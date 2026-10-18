# macro-system Specification

## Purpose

Defines user-defined syntactic extensions via `define-syntax` and `syntax-rules`: pattern
matching with literals, the `_` wildcard, and ellipsis; hygiene for macro-introduced
identifiers; and fixpoint expansion that rewrites macro uses into core forms (or reports
non-termination).
## Requirements
### Requirement: Define syntactic extensions with define-syntax and syntax-rules
The compiler SHALL support top-level and internal `(define-syntax <keyword> (syntax-rules (<literal>
...) (<pattern> <template>) ...))`, binding `<keyword>` to a transformer. A use of a bound
keyword SHALL be rewritten by the first rule whose `<pattern>` matches the use, with the
rule's `<template>` instantiated under the captured bindings. `define-syntax` and
`syntax-rules` SHALL be syntactic bindings resolved by identity. These forms are compile-time only: no
`define-syntax` form survives into the parsed core language.

**A binding SHALL shadow a keyword of the same name.** A macro keyword is a binding like any other
(R7RS §4.2, §5.3), so where an identifier is bound as a **variable** at the point of use, that
identifier SHALL NOT be treated as a macro keyword: the form SHALL be expanded as an ordinary
application of the bound variable, and its subforms expanded normally. The expander SHALL therefore
carry lexical binding identities at each point of traversal, extended by every binding
form it descends through, including fixed, dotted, and rest-only formals, named and
ordinary `let` forms, recursive bindings, and internal definition groups. Program top-level
definitions SHALL retain their existing mutually visible scope.

This is a **narrowing of accepted behaviour**: a program that relies on the keyword winning over a
binding of the same spelling is incorrect under R7RS, and previously produced either a rewrite of
the wrong form or — where the shadowed keyword's rules happened to accept the argument list — a
silent wrong answer with no diagnostic. Shadowing SHALL apply to every keyword in scope, whether
defined by the prelude, by an imported library, or by the program itself.

Core and auxiliary syntax SHALL follow the same lexical resolution rule. A source-written
keyword use is syntactic only when its identifier resolves to that syntax binding.
Definition-site core syntax and helper references introduced by a macro SHALL retain their
identities even when the user binds the same spelling. A user-written reference to a shadowing
variable SHALL still resolve to that variable, including implementation-helper spellings.

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
literal identifiers (declared in the literals list, matching by binding identity); pattern variables (any other identifier, binding the aligned syntax); proper
and dotted list structure; and ellipsis (`...`), where `(p ... . tail)` matches zero or
more repetitions of `p` and each pattern variable within `p` is captured for lockstep
instantiation in the template.

**The literals list SHALL take priority over the special identifiers.** An identifier named in a
rule's literals list SHALL be matched as a literal - matching by binding identity -
**even when it is spelled `_` or `...`**. R7RS §4.3.2 gives the literals list this priority, and a
matcher that tests for the wildcard or the ellipsis by name before consulting the literals list
silently accepts input the rule was written to reject. The priority SHALL hold in every place the
distinction is made: when matching a pattern against a form, and when collecting a pattern's
variables for template instantiation. A rule whose literals list is empty, or which names neither
`_` nor `...`, SHALL be matched exactly as before.

**Literals SHALL compare their definition-site and use-site bindings.** A literal SHALL match
when both occurrences denote the same binding, even through aliases. Two unbound occurrences
SHALL match only when their source names are equal. Equal spelling with different bindings SHALL
NOT match; conversely, being lexically bound at the use site SHALL NOT by itself prevent a match
to the same binding. Local shadowing of auxiliary literals such as `else` and `=>`
SHALL continue to make them ordinary expressions in the existing `cond` examples.

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

#### Scenario: A literal matches the same enclosing lexical binding

- **WHEN** a local transformer declares literal `x` while an enclosing `let` binds `x`, and a use supplies that same binding
- **THEN** the literal-bearing rule matches
- **AND** supplying a nested shadowing binding also spelled `x` selects a different rule

#### Scenario: An imported alias matches its original literal

- **WHEN** a transformer literal denotes an imported binding and the use supplies another alias of the same binding
- **THEN** the literal matches despite different visible spellings

### Requirement: Hygiene for macro-introduced identifiers
Expansion SHALL distinguish definition-site identifiers, introduced binders, and syntax
substituted from the macro use. Introduced binders SHALL receive fresh identities per
expansion and their template references SHALL follow them, even when their spelling matches
a known global, primitive, or keyword. Substituted syntax SHALL retain its use-site context.

Free template references SHALL denote their definition-site bindings, including lexical
variables, core syntax, primitives, and private or imported transformers. Importer bindings
SHALL NOT capture those references. Repeated expansions and nested generated transformers
SHALL preserve this separation. Unbound free references SHALL NOT capture use-site bindings.
Quoted data SHALL preserve its original symbols.

An imported transformer SHALL retain the same contexts and private dependency identities
through selection, renaming, forwarding, and saved interfaces; public names hidden by an
import set SHALL remain available only to definition-site references that already denote them.

**Record-introduced bindings SHALL participate in the enclosing definition environment.**
A record's type descriptor, constructor, predicate, accessors, and modifiers SHALL be visible
before transformer free references resolve. A template reference to one SHALL denote that
binding rather than be treated as an introduced identifier. This SHALL hold identically for
a program, library unit, and REPL form.

#### Scenario: Introduced temporary does not capture user code

- **WHEN** a macro introduces a temporary binding (e.g. `or`'s `t`, or `swap!`'s `tmp`)
  and is used with argument expressions that reference an identifier of the same name
- **THEN** the user's identifier and the macro's temporary remain distinct and the program
  produces the correct result

#### Scenario: Referenced primitive stays bound to its definition

- **WHEN** a template references a core keyword or primitive (e.g. `let`, `if`, `cons`)
- **THEN** that identifier resolves to its definition-site binding even under a use-site binding of the same spelling

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

#### Scenario: The do helper survives a same-spelled loop variable

- **WHEN** a program evaluates `(do ((%do-step 0 (+ %do-step 1)) (acc '() (cons %do-step acc))) ((= %do-step 3) acc))`
- **THEN** it returns `(2 1 0)`, with parallel explicit step semantics preserved

#### Scenario: A default do step retains its variable

- **WHEN** a program evaluates `(do ((%do-step 0 (+ %do-step 1)) (stable 7)) ((= %do-step 3) stable))`
- **THEN** it returns `7`, preserving the omitted-step variable while the helper remains distinct from the loop variable

#### Scenario: A user-written helper name still shadows normally

- **WHEN** a program evaluates `(let ((%do-step (lambda (x) (* x 11)))) (%do-step 4))`
- **THEN** it returns `44`

#### Scenario: Guard helpers resist capture

- **WHEN** a guarded body or handler binds a variable spelled like a private helper required by `guard`'s expansion
- **THEN** exception selection and recovery still use the definition-site helper while user-written references use the local variable

#### Scenario: A template binder collides with a known top-level name

- **WHEN** a macro introduces temporary `tmp` and its argument refers to an existing top-level `tmp`
- **THEN** the introduced binder is fresh and neither captures nor is captured by the top-level binding

#### Scenario: A definition-site lexical reference survives use-site shadowing

- **WHEN** a transformer defined inside a binding of `x` expands a reference to `x` inside a nested binding with the same spelling
- **THEN** the reference denotes the enclosing definition-site binding

#### Scenario: Private macro dependencies survive a restricted base view

- **WHEN** a program hides the public primitive, core keyword, or helper name used by an imported macro's template and then invokes that macro
- **THEN** the expansion still resolves its definition-site dependencies without making their public names visible to user source

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

### Requirement: Expander rewrites quasiquote into core forms
The expander SHALL treat `quasiquote` as a built-in derived form (not a `syntax-rules` macro),
rewriting a quasiquoted datum into core forms — `cons`, `append`, `list`, and `quote` — with
`unquote` inserting an expanded expression and `unquote-splicing` contributing an `append`ed
list, and with quasiquote nesting levels tracked so that only level-matching unquotes splice
values. The rewrite SHALL run within the existing fixpoint expansion, so unquoted expressions
are themselves fully expanded, and no `quasiquote`, `unquote`, or `unquote-splicing` form SHALL
survive into the parsed core language. An `unquote` or `unquote-splicing` outside a
`quasiquote` SHALL be reported as an error. The symbols `unquote`, `unquote-splicing`, and
`quasiquote` MAY appear as ordinary list **data** inside a quasiquote (e.g. `` `(quote unquote) ``
or `` `(a unquote b) ``); the rewrite SHALL reproduce them as literal structure rather than
misparsing a datum whose head is one of those symbols but which is not a well-formed `(kw X)`
form.

#### Scenario: Quasiquote leaves no residual form after expansion

- **WHEN** a program compiled with `--dump` uses `` `(a ,x ,@ys) ``
- **THEN** the `expand` stage output contains only core forms (`cons`/`append`/`list`/`quote`
  and the expansion of `x`/`ys`), with no `quasiquote`/`unquote`/`unquote-splicing` remaining

#### Scenario: Unquote splicing lowers to append

- **WHEN** the expander rewrites `` `(0 ,@ys 3) ``
- **THEN** the result constructs the list by `append`ing the value of `ys` between the constant
  segments (equivalent to `(append (list 0) (append ys (list 3)))`)

#### Scenario: Stray unquote is an error

- **WHEN** a program contains `(unquote x)` outside any `quasiquote`
- **THEN** expansion reports an error

#### Scenario: Literal unquote/quasiquote symbols survive as data

- **WHEN** the expander rewrites `` `(list (quote unquote) ,(+ 1 2)) `` (the shape the
  expander's own nested-quasiquote handling emits)
- **THEN** expansion produces code that builds the list `(list unquote 3)` — the literal symbol
  `unquote` is preserved as data — with no crash and no spurious unquote interpretation

### Requirement: syntax-rules can host a runtime pattern matcher
The `syntax-rules` expander SHALL be powerful enough to host a pattern matcher defined as
`syntax-rules` macros — one that expands to runtime destructuring code over lists. In
particular the expander SHALL support recursive macro expansion to bounded depth and the
ellipsis escape `(... <tmpl>)`, which yields `<tmpl>` with its ellipses treated as literal
identifiers (so a matcher macro can generate output containing a literal `...`).

(Detecting ellipsis `...` *within a user pattern* — needed for `(p ...)` matching — requires
a further capability, a custom ellipsis identifier, added in the follow-up change
`port-match-ellipsis`; it is out of scope here.)

#### Scenario: Ellipsis escape yields a literal ellipsis

- **WHEN** a transformer template contains `(... ...)` (the ellipsis escape)
- **THEN** the expansion produces a literal `...` at that position rather than treating it
  as a repetition marker

#### Scenario: Ellipsis escape substitutes pattern variables

- **WHEN** a transformer template `(... (a ...))` is instantiated with pattern variable `a`
- **THEN** `a` is substituted and the `...` is emitted literally (yielding `(<a> ...)`)

#### Scenario: A syntax-rules matcher expands under the expander

- **WHEN** the `,x`-convention matcher (`match`/`match-clauses`/`match-pat`) is loaded and a
  use with binder, literal-head, dotted-rest, guard, and else clauses is expanded
- **THEN** it expands without error into core forms (`let`/`if`/`car`/`cdr`/`eq?`/…) with no
  residual `unquote` or matcher-macro heads

### Requirement: define-record-type is a built-in definition form
The frontend SHALL recognize `define-record-type` as a built-in definition form and lower each
occurrence, before macro expansion sees the folded program, into the bindings it introduces: one
fresh record type descriptor, the constructor, the predicate, and the per-field accessors and
mutators, all expressed over the record runtime primitives. Because `collect-toplevel` (which
understands top-level `define`s) runs before the `expand` stage, the lowering SHALL be performed
where definitions are collected rather than by the syntax-rules expander — but it SHALL leave no
residual `define-record-type` form for later stages, so only core forms plus primitive calls
survive to `parse`. Identifiers the lowering introduces (the descriptor binding) SHALL NOT
capture user identifiers.

#### Scenario: define-record-type lowers to core forms

- **WHEN** the frontend processes a `define-record-type` form
- **THEN** no `define-record-type` form survives to later passes, and the constructor,
  predicate, and accessors/mutators are bound over the record primitives

#### Scenario: No residual form after the frontend

- **WHEN** a program using `define-record-type` is compiled
- **THEN** the collect-toplevel/expand output contains no remaining `define-record-type` form

#### Scenario: REPL lowers define-record-type equivalently

- **WHEN** `define-record-type` is entered at the interactive REPL
- **THEN** its constructor, predicate, and accessors/mutators become persistent globals and
  behave identically to the batch compiler (dev→ship fidelity)

### Requirement: Local syntax bindings have lexical scope

The compiler SHALL support `let-syntax` and `letrec-syntax` with `syntax-rules`
transformers. `let-syntax` transformer specifications SHALL use the enclosing syntax
environment; `letrec-syntax` specifications SHALL use the environment extended with all
keywords of the group. Both SHALL extend only their body scope and leave no runtime syntax
binding or residual local syntax form.

#### Scenario: Nonrecursive syntax captures the outer keyword

- **WHEN** an outer macro `m` yields `outer` and a `let-syntax` binds `m` to a template invoking `m`
- **THEN** invoking the local `m` reaches the outer transformer and yields `outer`

#### Scenario: Recursive syntax captures its own group

- **WHEN** a `letrec-syntax` group contains self-recursive and mutually recursive transformers with terminating rules
- **THEN** their template references resolve to the local group and expansion terminates normally

#### Scenario: Local syntax does not leak

- **WHEN** a local syntax scope ends, or an empty local syntax scope contains a local definition
- **THEN** its bindings do not become available outside the scope, and an outer same-spelled binding is restored

#### Scenario: Nested generated transformers preserve contexts

- **WHEN** a transformer generates a local `syntax-rules` transformer using an ellipsis escape and captured identifiers
- **THEN** the nested transformer retains the correct definition and use contexts and matches at the correct ellipsis depths

### Requirement: Internal syntax definitions participate in body definition groups

A valid body definition prefix SHALL accept internal `define-syntax` alongside variable
definitions, including definitions exposed by macros and splicing `begin`. Internal
transformers SHALL have recursive group scope, and sibling variable definitions SHALL be
mutually visible. Definitions SHALL be discovered during expansion before runtime body
lowering; invalid placement SHALL be diagnosed.

#### Scenario: Internal syntax expands in the enclosing body

- **WHEN** a procedure body defines a local transformer and uses it in its following expression
- **THEN** the transformer expands in that body and is unavailable after the procedure's scope ends

#### Scenario: A macro exposes a definition group

- **WHEN** a body-prefix macro expands into `begin` containing variable and syntax definitions
- **THEN** those definitions participate in the enclosing definition group with the same scope as directly written definitions

#### Scenario: Internal syntax references a later variable definition

- **WHEN** a body defines a transformer whose template refers to a variable defined later in the same prefix
- **THEN** expansion resolves that variable to the shared body binding

#### Scenario: Local syntax behaves consistently across compilation paths

- **WHEN** the same local syntax program is compiled by Chez, `emit run`, a built executable, a saved library artifact, and the REPL
- **THEN** the results and lexical binding behavior agree on every path
