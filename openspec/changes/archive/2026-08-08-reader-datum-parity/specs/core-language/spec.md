## ADDED Requirements

### Requirement: Every datum the reader reads is usable as a quoted constant

A datum that the reader is required to read SHALL be usable as a quoted constant in compiled code.
Specifically, a vector literal (`#(...)`) and a bytevector literal (`#u8(...)`) SHALL each compile as
a constant — under `quote`, under the `'` abbreviation, and nested to any depth inside another
quoted datum — and SHALL evaluate to a value `equal?` to the one the same elements produce when
built at runtime with `vector` or `bytevector`.

This SHALL hold on every door and in every position a constant may appear: a program's top level, a
procedure body, a library body, and a macro template.

Elements SHALL be lowered by the same constant encoding as any other quoted datum, so a vector may
hold symbols, strings, characters, booleans, numbers, pairs, the empty list, and further vectors or
bytevectors.

A constant the compiler cannot lower SHALL be reported with the datum named in the diagnostic, not
with a placeholder.

#### Scenario: A quoted vector constant compiles and evaluates

- **WHEN** a program evaluates `(display '#(1 2))`
- **THEN** it prints `#(1 2)`

#### Scenario: A quoted bytevector constant compiles and evaluates

- **WHEN** a program evaluates `(display (quote #u8(1 2)))`
- **THEN** it prints `#u8(1 2)`

#### Scenario: A vector constant nested in a quoted pair

- **WHEN** a program evaluates `(display (car (quote (#(a) b))))`
- **THEN** it prints `#(a)`

#### Scenario: A vector constant holds heterogeneous elements

- **WHEN** a program evaluates `(display '#(a "s" #\c #t 1 2.5 () (p . q) #(n)))`
- **THEN** it prints that vector's external representation, with every element preserved

#### Scenario: A constant vector equals the runtime-built one

- **WHEN** a program evaluates `(equal? '#(1 2 3) (vector 1 2 3))`
- **THEN** the result is `#t`

#### Scenario: A vector constant in a library body

- **WHEN** a library body defines a procedure returning a quoted vector, and a program imports that
  library and calls it
- **THEN** the library compiles and the program prints the vector

#### Scenario: An unlowerable constant names itself

- **WHEN** the compiler reaches a constant it has no encoding for
- **THEN** the diagnostic names that datum's external representation rather than printing `?`
