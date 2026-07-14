## ADDED Requirements

### Requirement: syntax-rules supports a custom ellipsis identifier

`define-syntax` with `syntax-rules` SHALL accept an optional leading ellipsis identifier —
`(syntax-rules <ellipsis-id> (literal ...) (pattern template) ...)` — in which `<ellipsis-id>`
(a symbol) replaces `...` as the repetition marker for that transformer, so that `...` may be
used as an ordinary literal identifier in its patterns and templates. When the form after
`syntax-rules` is a literals list, the default ellipsis `...` SHALL continue to apply.

#### Scenario: Custom ellipsis drives repetition

- **WHEN** a transformer is defined with `(syntax-rules ::: () ((_ x :::) (list x :::)))` and
  applied to three arguments
- **THEN** it expands as if `:::` were the ellipsis, producing the three-element list, and a
  literal `...` elsewhere in its template is emitted verbatim

#### Scenario: Default ellipsis unaffected

- **WHEN** a transformer is defined the ordinary way `(syntax-rules () ((_ x ...) ...))`
- **THEN** `...` behaves as the repetition marker exactly as before (backward compatible)

### Requirement: The pattern matcher supports ellipsis patterns

The `syntax-rules` `,x` matcher SHALL support ellipsis patterns `(p ...)` and
ellipsis-with-tail `(p ... . tail)`, matching a runtime list by applying `p` to each leading
element and binding each pattern variable in `p` to the list of its matches, with `tail`
matching the remainder.

#### Scenario: Ellipsis binds a list of matches

- **WHEN** the matcher matches `(,x ...)` against `(1 2 3)`
- **THEN** `x` is bound to `(1 2 3)`

#### Scenario: Ellipsis with a fixed tail

- **WHEN** the matcher matches `(,x ... ,last)` against `(1 2 3)`
- **THEN** `x` is bound to `(1 2)` and `last` is bound to `3`

#### Scenario: Ellipsis over structured sub-patterns

- **WHEN** the matcher matches `((,k ,v) ...)` against `((a 1) (b 2))`
- **THEN** `k` is bound to `(a b)` and `v` is bound to `(1 2)`
