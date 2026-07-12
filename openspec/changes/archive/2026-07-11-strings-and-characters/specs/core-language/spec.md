## ADDED Requirements

### Requirement: Strings and characters

The compiler SHALL support strings and characters as first-class data types. String and
character literals SHALL be self-evaluating (`"foo"` evaluates to that string, `#\a` to
that character, with no `quote`). Characters SHALL be Unicode codepoints and strings SHALL
be Unicode text (stored as UTF-8); both SHALL round-trip and print faithfully for non-ASCII
content. Strings and characters SHALL be printable — a string as its contents in double
quotes, a character as `#\` followed by the character — and SHALL be usable as elements of
quoted list structure.

#### Scenario: String literal value

- **WHEN** a program's value is the string literal `"hello"`
- **THEN** the executable prints `"hello"`

#### Scenario: Character literal value

- **WHEN** a program's value is the character literal `#\a`
- **THEN** the executable prints `#\a`

#### Scenario: Strings and characters inside quoted structure

- **WHEN** a program evaluates `(quote (a "b" #\c))` and traverses it with `car`/`cdr`
- **THEN** it is a proper list whose elements are the symbol `a`, the string `"b"`, and the
  character `#\c`, printing as `(a "b" #\c)`

#### Scenario: Non-ASCII string and character

- **WHEN** a program's value is a non-ASCII string literal (e.g. `"héllo 日本語"`) or a
  non-ASCII character literal (e.g. `#\λ`)
- **THEN** the string prints with its UTF-8 contents intact between double quotes and the
  character prints as `#\` followed by its UTF-8 encoding (`#\λ`)
