## MODIFIED Requirements

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

This procedure SHALL additionally accept an OPTIONAL second argument that is a textual output
port, in which case the output SHALL go to that port instead of standard output. With the argument
omitted the behaviour SHALL be exactly as specified above, so existing programs are unaffected.

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

#### Scenario: display accepts an optional port

- **WHEN** a program opens an output string port `p`, evaluates `(display "hi" p)`, and calls
  `(get-output-string p)`
- **THEN** the result is `"hi"` and nothing was written to standard output

### Requirement: write writes any datum in write style


The `write` primitive SHALL accept a value of ANY type and write a machine-
readable rendering of it to standard output, in R7RS *write* style: a string
SHALL be written WITH surrounding double quotes, and a character SHALL be written
WITH its `#\` prefix (e.g. `#\a`, `#\newline`). Every other value type — fixnum,
boolean, the empty list, pair, symbol, vector, and any other representable value
— SHALL be written the same as `display`. Compound values (pairs, vectors) SHALL
be rendered by recursing in write style, so nested strings and characters inside
them are also quoted/prefixed. `write` SHALL return the unspecified value so it
composes inside `begin`.

The value printer SHALL be memory-safe: it SHALL dispatch on a value's runtime
tag and SHALL NOT interpret a value as a type it is not. Passing any value to
`write` SHALL NOT cause a memory fault or crash.

This is the write-style companion to the display-style `display` primitive, and
uses the same value printer that renders a program's final top-level value.

This procedure SHALL additionally accept an OPTIONAL second argument that is a textual output
port, in which case the output SHALL go to that port instead of standard output. With the argument
omitted the behaviour SHALL be exactly as specified above, so existing programs are unaffected.

#### Scenario: write of a string keeps the quotes

- **WHEN** a program runs `(write "hello")`
- **THEN** the program writes `"hello"` (with surrounding double quotes) to
  standard output

#### Scenario: write of a character keeps the prefix

- **WHEN** a program runs `(write #\a)`
- **THEN** the program writes `#\a` to standard output

#### Scenario: write recurses in write style through structure

- **WHEN** a program runs `(write (list "a" #\b 3))`
- **THEN** the program writes `("a" #\b 3)` — the inner string is quoted and the
  inner character has its `#\` prefix

#### Scenario: write of a non-string never crashes

- **WHEN** a program runs `(write X)` for a non-string `X` — for example a
  fixnum, a pair such as `(cons 1 2)`, a symbol, or the empty list
- **THEN** the program renders `X` and completes normally, with no segmentation
  fault or memory error

#### Scenario: write matches the final-value print style

- **WHEN** a program runs `(write (list "a" #\b))` and a second program is just
  the bare expression `(list "a" #\b)` (printed by the runner as the top-level
  value)
- **THEN** both programs write the identical bytes `("a" #\b)` to standard output

#### Scenario: write accepts an optional port

- **WHEN** a program opens an output string port `p`, evaluates `(write "hi" p)`, and calls
  `(get-output-string p)`
- **THEN** the result is the five characters `"hi"` including the quotes, and nothing was written
  to standard output

### Requirement: newline writes a line separator


The `newline` primitive SHALL accept zero arguments and write a single newline
character (U+000A, `\n`) to standard output. It SHALL return the unspecified
value so it composes inside `begin` and after other output primitives.

Calling `newline` with more than the one optional port argument SHALL be an error (arity
mismatch), consistent with how other primitives report arity errors.

This procedure SHALL additionally accept an OPTIONAL first argument that is a textual output
port, in which case the output SHALL go to that port instead of standard output. With the argument
omitted the behaviour SHALL be exactly as specified above, so existing programs are unaffected.

#### Scenario: newline writes a single line feed

- **WHEN** a program runs `(begin (display "a") (newline) (display "b"))`
- **THEN** the program writes the three bytes `a`, `\n`, `b` to standard output
  in that order

#### Scenario: newline returns the unspecified value

- **WHEN** a program runs `(begin (newline) (quote done))`
- **THEN** the program completes normally and its value is the symbol `done`
  (the `newline` call does not contribute a value)

#### Scenario: newline accepts an optional port

- **WHEN** a program opens an output string port `p`, evaluates `(newline p)`, and calls
  `(get-output-string p)`
- **THEN** the result is a single line feed and nothing was written to standard output

### Requirement: write-char output primitive


The language SHALL provide `write-char`, a unary primitive that writes the single
character argument to standard output as its UTF-8 encoding and returns the
unspecified value. It SHALL be an ordinary, first-class, shadowable binding in the
always-present primitive layer, defined over a reserved raw primcall
(`%write-char`); a direct, unshadowed call SHALL still compile to the bare
primitive. It SHALL NOT require importing `(scheme base)`.

This procedure SHALL additionally accept an OPTIONAL second argument that is a textual output
port, in which case the output SHALL go to that port instead of standard output. With the argument
omitted the behaviour SHALL be exactly as specified above, so existing programs are unaffected.

#### Scenario: write-char emits a character's bytes

- **WHEN** a program evaluates `(write-char #\A)` then `(write-char #\newline)`
- **THEN** it writes `A` followed by a line feed to standard output

#### Scenario: write-char emits a non-ASCII character as UTF-8

- **WHEN** a program evaluates `(write-char (integer->char 955))` (`λ`)
- **THEN** it writes the UTF-8 bytes of `λ` to standard output

#### Scenario: write-char is first-class and shadowable

- **WHEN** a program evaluates `(for-each write-char (string->list "hi"))`, or
  defines `(define (write-char c) 'mine)`
- **THEN** `write-char` behaves as an ordinary procedure value, and a user
  definition shadows it (user-wins)

#### Scenario: write-char accepts an optional port

- **WHEN** a program opens an output string port `p`, evaluates `(write-char #\A p)`, and calls
  `(get-output-string p)`
- **THEN** the result is `"A"` and nothing was written to standard output
