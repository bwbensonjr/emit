## ADDED Requirements

### Requirement: display writes any datum in display style

The `display` primitive SHALL accept a value of ANY type and write a
human-readable rendering of it to standard output, in *display* style: a string
SHALL be written as its raw contents with NO surrounding double quotes, and a
character SHALL be written as the raw character with NO `#\` prefix. Every other
value type — fixnum, boolean, the empty list, pair, symbol, vector, and any other
representable value — SHALL be written the same as the value printer's *write*
style. Compound values (pairs, vectors) SHALL be rendered by recursing in display
style, so nested strings and characters inside them are also unquoted/unprefixed.
`display` SHALL return the unspecified value so it composes inside `begin`.

The value printer SHALL be memory-safe: it SHALL dispatch on a value's runtime
tag and SHALL NOT interpret a value as a type it is not. Passing a non-string to
`display` SHALL NOT cause a memory fault or crash.

This is distinct from *write* style (used to print a program's final value),
which quotes strings and prefixes characters with `#\`; that behavior is
unchanged.

#### Scenario: display of a fixnum prints its digits

- **WHEN** a program runs `(display 42)`
- **THEN** the program writes `42` to standard output and does not crash

#### Scenario: display of a string omits the quotes

- **WHEN** a program runs `(display "hello")`
- **THEN** the program writes `hello` (no surrounding double quotes) to standard
  output

#### Scenario: display of a non-string never crashes

- **WHEN** a program runs `(display X)` for a non-string `X` — for example a
  fixnum, a pair such as `(cons 1 2)`, a symbol, a character, or the empty list
- **THEN** the program renders `X` and completes normally, with no segmentation
  fault or memory error

#### Scenario: display recurses in display style through structure

- **WHEN** a program runs `(display (list "a" #\b 3))`
- **THEN** the program writes `(a b 3)` — the inner string is unquoted and the
  inner character has no `#\` prefix

#### Scenario: write style is unchanged

- **WHEN** a program's final value is the string `"hello"` (printed by the
  runtime's write-style value printer)
- **THEN** the program writes `"hello"` (with surrounding double quotes), as
  before
