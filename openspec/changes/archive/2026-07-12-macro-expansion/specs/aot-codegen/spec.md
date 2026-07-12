## MODIFIED Requirements

### Requirement: Each pipeline stage is independently observable

The compiler SHALL expose a debug mode that prints the intermediate language after each
named pass, so every stage of the lowering can be inspected in isolation. This includes
the top-level pass that collects the program's sequence of top-level forms and desugars
top-level `define`s into the core IL, and the `expand` pass — now a fixpoint
`syntax-rules` macro expander that rewrites user and prelude macro uses (including the
derived forms `cond`, `and`, `or`, `when`, `unless`, `let*`, and named `let`, which are
supplied as prelude macros) into core forms.

#### Scenario: Stage dump

- **WHEN** a program is compiled with the stage-dump flag enabled
- **THEN** the compiler prints the IL after each pass — the top-level
  collection/`define`-desugaring pass, then `expand`, then `recognize-let`,
  `convert-assignments`, `convert-closures`, `lambda-lift`, and lowering — in order

#### Scenario: Expand stage shows fully macro-expanded core

- **WHEN** a program that uses macros (user-defined or prelude derived forms) is compiled
  with the stage-dump flag enabled
- **THEN** the `expand` stage output contains only core forms and known primitive heads,
  with every macro use rewritten and no `define-syntax`/`syntax-rules` form remaining
