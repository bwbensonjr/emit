## MODIFIED Requirements

### Requirement: Compositional car/cdr combinators

The language SHALL provide the compositional `car`/`cdr` accessors, each equivalent to the
corresponding composition of `car` and `cdr`, partitioned as R7RS-small partitions them:

- the depth-2 forms `caar`, `cadr`, `cdar`, `cddr` SHALL be exported by `(scheme base)`, so they are
  available to a program with no explicit import;
- **all twenty-four** compositions of three to four `car`/`cdr` operations SHALL be exported by
  `(scheme cxr)`, and none of them SHALL be exported by `(scheme base)`. The library SHALL be
  complete: every three-level form (`caaar` … `cdddr`) and every four-level form
  (`caaaar` … `cddddr`), not merely those the compiler happens to use.

#### Scenario: cadr is available without an import

- **WHEN** a program with no explicit import evaluates `(cadr '(1 2 3))`
- **THEN** the result is `2`

#### Scenario: caddr requires (scheme cxr)

- **WHEN** a program imports `(scheme cxr)` and evaluates `(caddr '(1 2 3))` and
  `(cadddr '(1 2 3 4))`
- **THEN** the results are `3` and `4` respectively

#### Scenario: The library is complete, not only what the compiler used

- **WHEN** a program imports `(scheme cxr)` and calls a four-level accessor Emit did not previously
  define, such as `(caddar '((1 2 3 4)))` or `(cddddr '(1 2 3 4 5))`
- **THEN** it compiles and returns the value of the corresponding `car`/`cdr` composition

#### Scenario: A depth-3 accessor is unbound without its library

- **WHEN** a program that does not import `(scheme cxr)` references `caddr`
- **THEN** compilation fails with an unbound-variable error

#### Scenario: mixed accessor

- **WHEN** a program with no explicit import evaluates `(cdar '((1 2) 3))`
- **THEN** the result is `(2)`
