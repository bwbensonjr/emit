## ADDED Requirements

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
