## MODIFIED Requirements

### Requirement: Overlapping imports resolve deterministically

In programs and library declarations, distinct explicit bindings exposed under one visible name SHALL be an error before local-definition precedence, regardless of order or kind. Within one REPL import declaration the same rule SHALL apply; across successive declarations newer imports SHALL replace earlier imported bindings for subsequent forms. Repeated imports of the same original binding SHALL be legal. Explicit imports SHALL take precedence over implicit base defaults.

#### Scenario: Two libraries export one name

- **WHEN** a program imports `(liba)` and `(libb)`, both export `f` with different definitions, and
  the program calls `f`
- **THEN** compilation fails with an import-conflict diagnostic naming `f`, `(liba)`, and `(libb)`, including when the unit also defines its own `f`

#### Scenario: A diamond imports one original binding twice

- **WHEN** two facades re-export the same owner's runtime binding or transformer, including through renames, and both expose it under one final name
- **THEN** the imports are accepted and initialization remains once-only

#### Scenario: Equal transformer text does not imply the same binding

- **WHEN** two libraries independently define identical `syntax-rules` transformers and expose them under the same imported keyword
- **THEN** the imports conflict, even though their transformer data is structurally equal

#### Scenario: Cross-kind and within-set conflicts are rejected

- **WHEN** a procedure and macro, or primitive and core syntax, receive the same visible name, or a rename maps an export onto a different retained binding's name
- **THEN** the compiler reports an import conflict before expansion or execution

#### Scenario: A rejected REPL import preserves session state

- **WHEN** a REPL import declaration contains conflicting bindings within its requested import sets
- **THEN** the REPL rejects the complete import transaction before initializing the requested closure or publishing names
- **AND** earlier bindings, transformers, call metadata, and initialization state remain usable

#### Scenario: Successive REPL declarations replace imported bindings

- **WHEN** a session imports `(liba)` exporting `f`, defines `(define (old) (f))`, and later imports `(libb)` exporting a different `f`
- **THEN** subsequent references to `f` resolve to `(libb)` while `old` retains `(liba)`'s binding
- **AND** unrelated imports and session definitions remain visible

#### Scenario: One REPL declaration is internally conflicting

- **WHEN** one prompt imports `(scheme base)` and a different arithmetic library exporting `*` under that name in the same import declaration
- **THEN** the entire declaration is rejected without changing the session's binding view

#### Scenario: Replacement respects binding kind and definition context

- **WHEN** a later REPL import replaces a procedure with a macro, or a macro with a procedure, under the same visible name
- **THEN** subsequent forms use the new kind without stale expansion or call metadata
- **AND** previously compiled code and imported macro definition contexts retain their original bindings

#### Scenario: Reimport restores a previously replaced binding

- **WHEN** a session imports `(liba)`, imports `(libb)` replacing `f`, and imports `(liba)` again
- **THEN** subsequent uses of `f` resolve to `(liba)` and neither initializer runs twice

#### Scenario: Explicit session definitions retain precedence

- **WHEN** a session defines its own `f` and later imports a library exporting `f`
- **THEN** its own definition retains precedence over the imported binding

### Requirement: Implicit import of (scheme base)

Unless `--no-prelude` is given, the compiler SHALL make the prelude available to a user
program (and REPL session) without an explicit import, as an implicit default binding view: the prelude procedures resolve to `(scheme base)` and the derived-form macro
set is merged into the compile's `macro-env`. This SHALL hold identically on all three paths -
the Chez batch driver, the REPL, and the Chez-free embedded runner (`scheme-run` /
`scheme-compile`): on each, the procedures resolve as imported bindings referencing `scheme.base`
external globals and `scheme.base.ll` is linked/loaded/concatenated into the result. On the
Chez-free embedded runner, `(scheme base)` is compiled from its embedded generated library
form with no filesystem access, so the runner imports rather than prepends. A name the
program defines itself SHALL take precedence over the auto-imported one (user-wins shadowing, per
the Stage 0 resolution order).

When a program's own imports include explicit views of `(scheme base)`, their union SHALL be
the program's whole view of `(scheme base)`: the implicit import SHALL NOT also make the
library's other exports visible. `(scheme base)` is still linked or loaded and
initialized exactly as for the implicit import. A bare explicit `(import (scheme base))` supplies the full explicit base view and participates in explicit conflict validation.

#### Scenario: A program uses prelude procedures with no explicit import

- **WHEN** a program that references only prelude procedures (e.g. `(map (lambda (x) (+ x 1))
  '(1 2 3))`) is compiled without `--no-prelude` and without any `import`
- **THEN** it builds and runs; on every path the prelude procedures resolve to
  `(scheme base)` exports and `scheme.base.ll` is linked/loaded/concatenated into the result

#### Scenario: A derived-form macro works without a prepended prelude

- **WHEN** a program uses `cond`/`case`/`when` without `--no-prelude` on any path
- **THEN** the derived-form macro expands correctly (its expansion's procedure calls resolve
  to `(scheme base)` exports) and the program produces the expected value

#### Scenario: A user definition shadows an auto-imported prelude name

- **WHEN** a program defines its own top-level `map` while the prelude is enabled
- **THEN** references to `map` resolve to the program's own definition, not the `(scheme base)`
  export

#### Scenario: --no-prelude skips both halves

- **WHEN** a program is compiled `--no-prelude` (on any path, including the embedded runner)
- **THEN** `(scheme base)` is not auto-imported, the derived-form macros are not merged, and a
  reference to a runtime prelude procedure or derived macro is an unbound/undefined error
- **AND** the explicit compiler environment retains core syntax and integrated primitives

#### Scenario: The embedded runner re-homes the prelude like the Chez driver

- **WHEN** a prelude-using program is compiled by the Chez-free embedded runner
  (`scheme-run --emit`) and by the Chez batch driver, both with the prelude enabled
- **THEN** both resolve prelude procedures through `(scheme base)` and emit byte-identical
  program IR - the embedded runner consumes the generated `(scheme base)` form from its
  embedded copy instead of reading `lib/scheme/base.sld` from disk

#### Scenario: An explicit import set narrows the implicit import

- **WHEN** a program contains `(import (except (scheme base) map))` and references `map` without
  defining it
- **THEN** compilation reports `map` as unbound, on every path

#### Scenario: A prefixed (scheme base) is the program's only spelling

- **WHEN** a program contains `(import (prefix (scheme base) b:))` and evaluates
  `(b:map (b:lambda (x) (b:+ x 1)) (b:quote (1 2)))`
- **THEN** the program produces `(2 3)`, and an unprefixed reference to `map` is reported as unbound
- **AND** integrated primitives and core syntax are available under their prefixed names only, unless another import or local binding supplies a bare name

#### Scenario: Explicit base views replace the implicit view together

- **WHEN** a program explicitly imports multiple sets over `(scheme base)`
- **THEN** the union of those explicit views replaces the implicit binding view, with duplicate and conflicting names checked normally

#### Scenario: A REPL replaces its implicit base view

- **WHEN** a session's first explicit base import uses a prefix or selection set
- **THEN** its complete explicit view replaces the implicit view for subsequent forms while existing compiled procedures retain their resolved bindings
- **AND** subsequent REPL declarations replace overlapping imported names under the interactive replacement rule, while conflicts within one declaration remain errors

#### Scenario: A program selects alternative arithmetic over defaults

- **WHEN** a program imports an alternative `*` without explicitly importing `(scheme base)`
- **THEN** that explicit binding replaces only the overlapping implicit default on Chez, `emit run`, and standalone compilation paths
- **AND** unrelated base procedures and syntax remain available

#### Scenario: Import transforms determine which defaults are replaced

- **WHEN** a program imports an alternative `*` using `only`, `except`, `prefix`, or `rename`
- **THEN** replacement considers final visible names after import transforms
- **AND** a prefixed `m:*` leaves the implicit `*` available

#### Scenario: Explicit base imports retain strict program conflicts

- **WHEN** a program explicitly imports both `(scheme base)` and a library exporting a distinct `*`
- **THEN** compilation reports a conflict, even if those imports occur in separate declarations
- **AND** an explicit exclusion of `*` from base permits the alternative import

#### Scenario: Libraries receive no implicit override privilege

- **WHEN** a library declaration imports base and another library exporting a different binding under the same name
- **THEN** compilation reports a conflict unless its import sets resolve the overlap explicitly
