## MODIFIED Requirements

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
