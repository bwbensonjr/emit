# Spec Delta

## MODIFIED Requirements

### Requirement: Record printing and equality

A record instance without a custom writer SHALL print opaquely as `#<record TYPE>` using the record type's name. A type with a writer registered through `(emit write)` SHALL use that writer instead.
Records are not readable. Two records SHALL be `eqv?` and `equal?` iff they are the same
object; `equal?` SHALL NOT recurse into record fields.

#### Scenario: Opaque print

- **WHEN** a `point` record's value is printed
- **THEN** it prints as `#<record point>`

#### Scenario: Records compare by identity

- **WHEN** a program evaluates `(let ((p (make-point 1 2))) (equal? p p))` and `(equal? (make-point 1 2) (make-point 1 2))`
- **THEN** the results are `#t` and `#f`

#### Scenario: Custom output does not change equality

- **WHEN** two distinct records of a type with a custom writer render the same text
- **THEN** `eqv?` and `equal?` still report them as distinct
- **AND** the custom writer is not invoked by either equality procedure
