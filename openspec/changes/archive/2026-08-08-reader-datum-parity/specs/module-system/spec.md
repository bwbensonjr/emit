## ADDED Requirements

### Requirement: An export table represents every datum faithfully or fails

The export table SHALL record an exported macro's transformer such that every datum in its patterns
and templates reads back as the datum the library author wrote. A datum the table writer has no
external representation for SHALL be a compile-time error naming that datum; it SHALL NOT be written
as a placeholder, and the library SHALL NOT compile successfully with a table that misrepresents it.

Vector literals SHALL be written in the `#(...)` form both readers accept, so a table containing one
round-trips through the Chez-hosted driver's `read` and Emit's own in-language reader identically.

A **bytevector** literal has no such form: R7RS spells it `#u8(...)`, which Emit's reader accepts and
the Chez-hosted driver's `read` rejects, while Chez's `#vu8(...)` is rejected by Emit's reader. A
bytevector literal in an exported macro template SHALL therefore be a compile-time error naming the
reason, under the rule above — not a table written in a spelling one door cannot read back. This
constrains only the table: a bytevector *constant* elsewhere in a library or program is unaffected.

This makes explicit for the table what has always been true of it: the table is a compilation
artifact consumed by other units, so a lossy rendering is a miscompile rather than a cosmetic defect.

#### Scenario: A macro template containing a vector literal round-trips

- **WHEN** `emit lib` compiles a library exporting a macro whose template contains `#(1 2)`
- **THEN** the export table records that template with the vector written as `#(1 2)`, and an
  importer expanding the macro produces that vector

#### Scenario: A macro template containing a bytevector literal fails the library

- **WHEN** `emit lib` compiles a library exporting a macro whose template contains `#u8(1 2)`
- **THEN** it reports a compile-time error naming the bytevector literal as having no external
  representation both readers accept, and exits non-zero without writing a table that
  misrepresents it

#### Scenario: A bytevector constant outside a macro template is unaffected

- **WHEN** a library body defines a procedure returning `'#u8(1 2)` and a program imports it
- **THEN** the library compiles, its export table is written, and the program prints `#u8(1 2)`

#### Scenario: A datum with no external representation fails the library

- **WHEN** a macro template contains a datum for which the table writer has no representation
- **THEN** `emit lib` reports a compile-time error naming that datum and exits non-zero, writing no
  export table that misrepresents it

#### Scenario: A table is never written with a placeholder datum

- **WHEN** any exported macro's patterns or templates are written to an export table
- **THEN** no datum in the written table is a `?` placeholder standing for a datum the writer could
  not represent
