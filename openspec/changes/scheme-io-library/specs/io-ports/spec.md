## ADDED Requirements

### Requirement: Port objects and their predicates

The language SHALL provide **port** objects representing a source of or destination for textual
data. A port SHALL be distinguishable from every other value by the predicate `port?`, and SHALL be
further classified by `input-port?`, `output-port?`, and `textual-port?`. An input port SHALL NOT
satisfy `output-port?` and an output port SHALL NOT satisfy `input-port?`.

Ports SHALL be represented over the existing record layer rather than as a new primitive heap type,
so that a port is an ordinary first-class value: it may be passed, stored, and returned.

`close-port` SHALL close a port of either direction and return the unspecified value; `close-port`
on an already-closed port SHALL be permitted and have no further effect. An operation on a closed
port SHALL report an error rather than reading or writing.

#### Scenario: A port is recognized by its predicates

- **WHEN** a program opens an input port on a string and applies `port?`, `input-port?`,
  `output-port?`, and `textual-port?` to it
- **THEN** the results are `#t`, `#t`, `#f`, `#t` respectively

#### Scenario: A port is a first-class value

- **WHEN** a program stores a port in a list, retrieves it, and reads from the retrieved value
- **THEN** the read succeeds, so the port survived being stored and returned

#### Scenario: Reading from a closed port is an error

- **WHEN** a program opens an input port, closes it, and then calls `read-char` on it
- **THEN** the program reports an error rather than returning a character or faulting

### Requirement: The eof object

The language SHALL provide an **end-of-file object**, returned by `eof-object` and recognized by
`eof-object?`. It SHALL be distinct from every other value the language can produce — in particular
from `#f`, the empty list, and the unspecified value — so that a program can distinguish end of input
from a datum that was read.

An input operation that reaches the end of its port's input SHALL return the eof object.

#### Scenario: The eof object is distinct from other values

- **WHEN** a program evaluates `(list (eof-object? (eof-object)) (eof-object? #f)
  (eof-object? (quote ())) (eq? (eof-object) #f))`
- **THEN** the result is `(#t #f #f #f)`

#### Scenario: Reading past the end yields the eof object

- **WHEN** a program opens an input port on the string `"a"`, calls `read-char` twice, and applies
  `eof-object?` to each result
- **THEN** the first result is the character `a` and `eof-object?` of the second is `#t`

### Requirement: Textual input ports over files and strings

The language SHALL provide `open-input-file`, which opens a named file for textual input, and
`open-input-string`, which makes an input port delivering the characters of a string. Both SHALL
return a port satisfying `input-port?`, and both kinds SHALL support every input operation
identically, so that code reading from a port need not know which it was given.

`open-input-file` on a path that cannot be opened SHALL report an error rather than returning a port.

An input port SHALL read the whole of its source when it is opened. A consequence, which SHALL be
documented rather than treated as a defect, is that input written to the source after the port is
opened is not observed, and a source larger than available memory cannot be read.

#### Scenario: A file port and a string port behave identically

- **WHEN** the same text is read once through `open-input-string` and once through
  `open-input-file` on a file containing it, using the same sequence of operations
- **THEN** both produce the same sequence of results

#### Scenario: Opening a nonexistent file is an error

- **WHEN** a program calls `open-input-file` on a path that does not exist
- **THEN** the program reports an error rather than returning a port or faulting

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
  leading whitespace and comments.

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

### Requirement: Textual output ports over files and strings

The language SHALL provide `open-output-file`, which opens a named file for textual output, and
`open-output-string` together with `get-output-string`, which accumulate written characters and
return them as a string. Both SHALL return a port satisfying `output-port?`.

`flush-output-port` SHALL make any buffered output of a port visible to other readers of its
destination; `close-port` SHALL flush before closing. Output written to a file port SHALL be
complete and readable once the port is closed.

#### Scenario: A file written can be read back

- **WHEN** a program opens an output file port, writes text to it, closes it, then opens an input
  port on the same path and reads the contents
- **THEN** the text read back equals the text written

#### Scenario: A string port accumulates what was written

- **WHEN** a program opens an output string port, writes `"ab"` and then the character `c` to it,
  and calls `get-output-string`
- **THEN** the result is `"abc"`

### Requirement: The current ports are procedures, not parameter objects

The language SHALL provide `current-output-port`, `current-input-port`, and `current-error-port` as
procedures of no arguments returning the port for the process's standard output, standard input, and
standard error respectively.

These SHALL NOT be parameter objects: the implementation provides no `make-parameter`,
`parameterize`, or `dynamic-wind`, so they cannot be rebound dynamically. Accordingly the language
SHALL NOT provide `with-output-to-file` or `with-input-from-file`, whose specified behaviour is to
rebind them — a program calling one SHALL get an unbound-variable error rather than a procedure that
appears standard and silently fails to redirect.

#### Scenario: current-output-port is the default output destination

- **WHEN** a program evaluates `(display "x" (current-output-port))` and `(display "x")`
- **THEN** both write the same byte to standard output

#### Scenario: The redirecting forms are absent rather than wrong

- **WHEN** a program calls `with-output-to-file`
- **THEN** compilation reports an unbound variable, rather than the program running with output
  going to standard output
