## MODIFIED Requirements

### Requirement: Character, line, and datum input

The language SHALL provide the input operations `read-char`, `peek-char`, `read-line`,
`read-string`, and `read`, each taking a port. Each SHALL return the eof object when no input
remains.

- `read-char` SHALL consume and return the next character; `peek-char` SHALL return it WITHOUT
  consuming it, so an immediately following `read-char` returns the same character.
- `read-line` SHALL return the characters up to, but not including, the next line feed, consuming
  the line feed; a final line with no terminator SHALL be returned as-is.
- `read-string` SHALL consume and return up to a requested number of characters, returning fewer
  only at end of input.
- `read` SHALL parse and return the next **datum**, leaving the port positioned after it. It SHALL
  accept the same external representations the implementation's own reader accepts, and SHALL skip
  leading whitespace, comments, and reader directives.

An input port SHALL retain the case-folding state selected by `#!fold-case` or `#!no-fold-case`
between successive calls to `read`. Datum-label bindings SHALL instead be fresh for each call:
labels defined while reading one outermost datum SHALL NOT be visible to the next `read` from the
same port.

#### Scenario: peek-char does not consume

- **WHEN** a program opens an input port on `"ab"` and evaluates
  `(list (peek-char p) (read-char p) (read-char p))`
- **THEN** the result is `(#\a #\a #\b)`

#### Scenario: read-line splits on line feeds

- **WHEN** a program reads two lines from a port on `"one\ntwo"`
- **THEN** the results are `"one"` and `"two"`, neither containing a line feed

#### Scenario: read returns successive data

- **WHEN** a program opens an input port on `"(1 2) foo"` and calls `read` three times
- **THEN** the results are the list `(1 2)`, the symbol `foo`, and the eof object

#### Scenario: read skips whitespace and comments

- **WHEN** a program calls `read` on a port whose text begins with a line comment and blank lines
  before its first datum
- **THEN** the first datum is returned, and the comment is not part of it

#### Scenario: Reader directives persist on a port

- **WHEN** a program calls `read` three times on a port containing
  `#!fold-case ABC #!no-fold-case DEF ghi`
- **THEN** the results are the symbols `abc`, `DEF`, and `ghi`

#### Scenario: Datum-label bindings do not persist on a port

- **WHEN** a program reads `#0=(a)` and then `#0#` from the same port
- **THEN** the first call returns `(a)` and the second reports an unresolved-label read error
