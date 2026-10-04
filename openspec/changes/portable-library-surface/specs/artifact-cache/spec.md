# Spec Delta

## MODIFIED Requirements

### Requirement: A library unit compiled from disk is cached on the identity of its source

A library whose source is read from disk SHALL be cached and reused across processes on the same
terms as the baked set, keyed on the identity of the compiler **and** the identity of its source.
The identity of its source SHALL cover the library's own file and every file the include family read
while loading it, so that a change to an included fragment invalidates the entry as surely as a
change to the library itself.

The set of files an entry was built from SHALL be recorded in the entry, so that validating an entry
requires no compilation and no prediction of what the library would include if it were compiled
again.

The identity of its source SHALL also cover the answer to every `(library ⟨name⟩)` feature
requirement evaluated while loading it, so that a library whose `cond-expand` chose a clause
because a dependency was or was not resolvable is recompiled once that is no longer so. The answers
SHALL be recorded in the entry alongside the file set, and validating them SHALL require only
library resolution, not compilation.

#### Scenario: A user library is not recompiled on every invocation

- **WHEN** a program importing a user library is run twice through `emit run`, with nothing changed
  in between
- **THEN** the second invocation reuses the cached unit rather than recompiling it, and produces the
  same result

#### Scenario: Editing the library invalidates its entry

- **WHEN** a user library's own source is changed and a program importing it is run again
- **THEN** the entry is not reused, the library is recompiled, and the program observes the change

#### Scenario: Editing an included fragment invalidates its entry

- **WHEN** a file that a user library `include`s is changed, while the library's own file is
  untouched, and a program importing it is run again
- **THEN** the entry is not reused, the library is recompiled, and the program observes the change

#### Scenario: A library that includes nothing is still cached

- **WHEN** a user library with no include declarations is compiled and then reused
- **THEN** the entry is valid and reused, its recorded source set naming only the library's own file

#### Scenario: A newly resolvable dependency invalidates the entry

- **WHEN** a user library's `cond-expand` selected its `else` clause because `(library (srfi 8))`
  was unresolvable, the library was cached, and `srfi/8.sld` is then added under a library root
- **THEN** the next run does not reuse the entry, recompiles the library, and the first clause is
  selected

#### Scenario: An unchanged answer keeps the entry

- **WHEN** a cached library asked `(library (scheme base))` and nothing about its resolution has
  changed
- **THEN** the entry is reused
