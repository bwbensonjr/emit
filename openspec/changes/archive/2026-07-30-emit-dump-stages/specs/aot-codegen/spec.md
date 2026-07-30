## MODIFIED Requirements

### Requirement: Each pipeline stage is independently observable

The compiler SHALL expose a debug mode that prints the intermediate language after each
named pass, so every stage of the lowering can be inspected in isolation. This includes
the top-level pass that collects the program's sequence of top-level forms and desugars
top-level `define`s into the core IL, and the `expand` pass — now a fixpoint
`syntax-rules` macro expander that rewrites user and prelude macro uses (including the
derived forms `cond`, `and`, `or`, `when`, `unless`, `let*`, and named `let`, which are
supplied as prelude macros) into core forms.

The debug mode SHALL be reachable from the **shipped compiler binary** without Chez
Scheme, and SHALL cover every compilation path the compiler takes — the whole-program
path, the modular path used when libraries are imported (including the auto-imported
`(scheme base)`), and the per-form path the REPL uses — not only the whole-program path.
Where a path runs a pass once per top-level form, each dumped stage SHALL identify the
form it belongs to.

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

#### Scenario: The stage dump needs no Chez Scheme

- **WHEN** a developer compiles a program with the stage-dump flag through the shipped
  binary on a machine with no `chez` on `PATH`
- **THEN** the IL after each named pass is printed, with the same stage names and the same
  order the Chez driver's dump produces for the same program

#### Scenario: The modular path dumps its mid-pipeline stages

- **WHEN** a program that imports a library (or is compiled with the auto-imported
  `(scheme base)`) is compiled with the stage-dump flag enabled
- **THEN** the dump includes `recognize-let`, `convert-assignments`, and
  `convert-closures` in addition to the top-level, `expand`, `parse+rename`, and lowering
  stages

#### Scenario: Per-form stages name their form

- **WHEN** the per-form path (the REPL, or a modular program's per-form lowering) dumps a
  stage that runs once per top-level form
- **THEN** each stage header identifies which top-level form it belongs to, so repeated
  stage names are unambiguous
