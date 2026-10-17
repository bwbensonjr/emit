# Spec Delta

## MODIFIED Requirements

### Requirement: Portable SRFI sources work through reusable library artifacts

Emit SHALL compile pinned, unmodified SRFI 1 and SRFI 227 sources from a conventional
library root. Uses SHALL agree through Chez, `emit run`, delivered `emit build`
executables, and `emit repl`. Focused/SRFI artifacts and supporting libraries,
including `(scheme base)`, SHALL match Chez's full IR and readable interfaces.
Normal cache reuse SHALL preserve behavior.

#### Scenario: SRFI 1 list procedures work through a prefixed import

- **WHEN** a program imports `(prefix (srfi 1) s1:)` and exercises `s1:fold`, `s1:filter`,
  `s1:append-map`, and a re-exported accessor
- **THEN** every supported compilation path produces the same expected results from the
  unmodified package sources

#### Scenario: SRFI 227 optional arguments exercise imported macro dependencies

- **WHEN** a program uses SRFI 227's `opt-lambda` with omitted and supplied optional arguments,
  and uses a SRFI 1 procedure implemented with it
- **THEN** all paths agree on default and supplied argument behavior without a package-local workaround

#### Scenario: Normal cache reuse preserves package behavior

- **WHEN** the SRFI acceptance program warms a dedicated native cache and is run and imported
  at the REPL again from an unrelated working directory
- **THEN** the existing unit-cache entries are reused and the output is unchanged

#### Scenario: Hosts agree on the full library interface

- **WHEN** the same source closure is compiled whole by the Chez driver and the embedded compiler
- **THEN** each focused fixture, SRFI unit, and supporting library's full unit IR,
  with host-added target headers normalized identically, and readable export
  interface are byte-identical
- **AND** `(scheme base)` has byte-identical full unit IR and readable exports, with
  no exemption for label or hoisted-body ordering

#### Scenario: The delivered executable runs independently

- **WHEN** the built acceptance executable is moved outside the source and artifact directories
  and run without library search configuration
- **THEN** it produces the expected output without Emit, Chez, package sources, or compile-time
  interfaces being required at runtime

## ADDED Requirements

### Requirement: Internal procedure signatures retain definition semantics

Internal procedure definitions in library and program bodies SHALL support
proper, dotted, and rest-only formals. Expansion SHALL treat signatures as
binders and expand initializers with all internal definitions mutually visible.
Formal bindings SHALL shadow macro keywords in their bodies. Malformed
definitions SHALL retain frontend rejection rather than becoming accepted code.

#### Scenario: An internal variadic callback works unchanged

- **WHEN** a library procedure internally defines `(define (callback . args) #f)`
  and returns that callback to an importer
- **THEN** calling it with zero or several arguments returns `#f` on every
  compilation path without a pair-accessor failure during compilation

#### Scenario: Dotted and fixed signatures bind without macro expansion

- **WHEN** internal procedures use fixed or dotted formals whose names also
  identify imported macro keywords
- **THEN** signatures remain unchanged and references in the procedure bodies
  resolve to the formal bindings rather than invoking those macros

#### Scenario: Internal definitions share their body scope

- **WHEN** one internal procedure references another defined later in the same body
- **THEN** both compile in their mutual scope and the call observes the later definition

#### Scenario: Malformed variable definitions remain errors

- **WHEN** a body contains `(define x 1 2)`
- **THEN** compilation rejects the malformed definition through the frontend

### Requirement: An explicitly imported SRFI 64 port supports portable test runners

Emit SHALL provide `(srfi 64)` as an ordinary library supporting assertions,
real-number approximate comparisons, exception tests, groups and cleanup,
selection, skips, expected failures, result counters, and runner callbacks.
Its documented evaluator exception SHALL NOT prevent library initialization or
ordinary assertion execution.

#### Scenario: Real approximate comparisons use the supplied tolerance

- **WHEN** a runner executes real-number `test-approximate` cases inside and outside
  the specified absolute-error margin
- **THEN** it counts the former as passing and the latter as failing, including
  exact boundary values and zero margin

#### Scenario: Assertion expressions run exactly when selected

- **WHEN** a suite contains named assertions, a skipped expression with a side effect,
  expected failures, and an unexpected pass
- **THEN** selected assertion operands are evaluated once, skipped operands are not
  evaluated, and pass/fail/skip/xfail/xpass counters distinguish the outcomes

#### Scenario: Groups unwind and callbacks expose results

- **WHEN** a custom runner observes nested groups, a caught error assertion, and a
  group-with-cleanup that exits through an exception
- **THEN** callbacks observe the appropriate result kinds and group paths, cleanup
  executes, and runner state is restored after leaving the group

#### Scenario: String evaluation reports its documented limitation

- **WHEN** a caller invokes `test-read-eval-string`
- **THEN** it raises a diagnostic naming unsupported string evaluation and the
  missing evaluator, rather than returning a fabricated result
- **AND** importing `(srfi 64)` requires neither `(scheme eval)` nor `(scheme complex)`

### Requirement: Complete pinned package suites execute without source edits

The pinned upstream SRFI 1, 2, 8, and 227 package test programs SHALL execute all
their assertions unchanged through Chez AOT, `emit run`, delivered `emit build`
executables, and `emit repl`. Acceptance SHALL require expected suite completion
and assertion counts, successful process status, zero failures or unexpected
passes, and no unapproved skipped or expected-failure cases.

#### Scenario: The upstream package files are run intact

- **WHEN** each package's pinned test program is executed through every listed path
- **THEN** its imports, expressions, and assertions match the upstream digest and
  all expected assertions and groups complete successfully
- **AND** selecting only the existing smoke cases does not satisfy this requirement

#### Scenario: An unconditional successful exit cannot hide failed assertions

- **WHEN** a control test records a failed assertion and then executes `(exit 0)`
- **THEN** the acceptance harness fails and reports the assertion failure despite
  the successful child exit status

#### Scenario: Missing completion is a failed suite

- **WHEN** a child exits before reporting the expected group completion or count
- **THEN** the harness fails and preserves stdout, stderr, and child status for diagnosis

#### Scenario: A failing child cannot pass on matching stdout

- **WHEN** a REPL test child prints the expected value and then exits nonzero
- **THEN** the harness fails that case and reports its saved status and stderr
