## ADDED Requirements

### Requirement: Malformed define-record-type is rejected with a recoverable error

A `define-record-type` form whose shape does not match the grammar

```
(define-record-type <type-name>
  (<constructor> <field-tag> …)
  <predicate>
  (<field-tag> <accessor> [<mutator>]) …)
```

SHALL be rejected at compile time with a diagnostic error, and SHALL NOT cause a
segmentation fault, silent miscompilation, or spurious non-zero exit. The compiler SHALL
validate the form's shape in the frontend, before any field is destructured, and raise a
catchable error (via `error`) naming the offending form. This behavior SHALL be identical
across the interactive host and the batch compilers: the same malformed form yields the
same diagnostic outcome whether compiled by the REPL host, the in-process runner, or the
text→IR filter compiler.

Specifically, the compiler SHALL report an error when any of the following holds:

- the form has no type name, no constructor spec, or no predicate;
- the constructor spec is not a list `(<constructor> <field-tag> …)` whose head is a symbol;
- the predicate is not a symbol;
- a field spec is not a list of the form `(<field-tag> <accessor> [<mutator>])` with symbol
  names;
- a constructor field tag does not name a declared field.

A well-formed `define-record-type` form SHALL continue to compile and behave exactly as
before this requirement (no change to valid-record semantics).

#### Scenario: Malformed record form in the REPL is recoverable

- **WHEN** the interactive host reads `(define-record-type <point> (x y))`
- **THEN** it reports a compile-time error diagnostic and returns to the prompt, and the
  process does not crash (no segmentation fault)

#### Scenario: Missing predicate and field specs

- **WHEN** a program compiles `(define-record-type <point> (x y))`
- **THEN** compilation reports an error naming the malformed form and produces no binary

#### Scenario: Empty record form

- **WHEN** a program compiles `(define-record-type)`
- **THEN** compilation reports an error and does not crash or silently succeed

#### Scenario: Malformed field spec

- **WHEN** a program compiles `(define-record-type point (make-point x) point? (x))`
  (a field spec with no accessor)
- **THEN** compilation reports an error and does not crash or silently miscompile

#### Scenario: Batch and interactive frontends agree

- **WHEN** the same malformed `define-record-type` form is compiled by the in-process
  runner and by the text→IR filter compiler
- **THEN** both report a compile-time error rather than segfaulting, silently emitting no
  output, or exiting with an unrelated status

#### Scenario: Well-formed record still compiles

- **WHEN** a program compiles `(define-record-type point (make-point x y) point? (x point-x) (y point-y))` and evaluates `(point-x (make-point 3 4))`
- **THEN** the result is `3` (unchanged behavior)
