## MODIFIED Requirements

### Requirement: An unterminated block comment is reported, not read as end of input

An unterminated construct SHALL be reported by every reader entry point — `read-from-string`,
`read-all-from-string`, and `read` over a port — as an error naming the position where the construct
**opened**. It SHALL NOT be treated as end of input, which would silently discard every form after
the opening delimiter, or silently supply the missing delimiter and yield a datum the source does not
contain.

This SHALL hold for every construct that has a closing delimiter:

- a nested block comment `#|`;
- a list `(` or `[`, and the vector and bytevector forms `#(` and `#u8(`;
- a string `"`, including one whose final character is a backslash beginning an escape the input ends
  before completing — which SHALL be reported rather than read past the end of the input;
- a bar-quoted identifier `|`;
- a datum comment `#;` with no following datum.

Naming the opening position is what makes the report useful: the closing delimiter is missing, so
end of input is not where the mistake is. A truncated source is therefore reported at the construct
the author left open.

Because the reader's lexeme layer performs no raising, the unterminated condition SHALL be carried
outward as a value and turned into an error by the entry point, so that a consumer which needs a
different answer — notably the interactive input-completeness probe, which needs "incomplete" —
can give one from the same signal. A consumer answering "incomplete" for text a batch read reports
as an error is the intended arrangement, not a disagreement: see `compiler-embedding`, "The
input-completeness probe agrees with the reader about comments and quoted identifiers".

#### Scenario: An unterminated block comment is an error

- **WHEN** a program reads `"#| never closed"`
- **THEN** an error names the unterminated comment, rather than returning end-of-file

#### Scenario: Forms after an unterminated comment are not silently dropped

- **WHEN** a source is `"(display 1)\n#| oops\n(display 2)"` and every top-level form is read
- **THEN** the read is reported as an error naming the unterminated comment, rather than returning
  only the first form

#### Scenario: An unterminated list is an error, not a closed list

- **WHEN** a program reads `"(a b"`
- **THEN** an error names the unterminated list and the index the `(` opened at, rather than
  returning the list `(a b)`

#### Scenario: A truncated source does not compile as though complete

- **WHEN** a source file is `"(display (list 1 2 3)"` — missing one closing paren — and is run
- **THEN** the read is reported as an error naming the unterminated list, and the program does not
  run and does not exit zero

#### Scenario: An unterminated string is an error

- **WHEN** a program reads `"\"abc"` — an opening quote with no closing quote
- **THEN** an error names the unterminated string and the index the `"` opened at, rather than
  returning the string `"abc"`

#### Scenario: A string ending in a dangling escape is an error

- **WHEN** a program reads a source whose text ends with `"abc\` — an opening quote, three
  characters, and a trailing backslash
- **THEN** an error names the unterminated string, and no character beyond the end of the input is
  read

#### Scenario: An unterminated vector and bytevector are errors

- **WHEN** a program reads `"#(1 2"`, and separately `"#u8(1 2"`
- **THEN** each is reported as an error naming the unterminated construct and its opening index,
  rather than returning a two-element vector or bytevector

#### Scenario: An unterminated construct nested inside another names the inner one

- **WHEN** a program reads `"(a (b c"`
- **THEN** the error names the position the **inner** `(` opened at, since that is the construct
  whose closing delimiter is missing

#### Scenario: A datum comment awaiting its datum is an error on a batch read

- **WHEN** a program reads `"(display 1)\n#;"` and every top-level form is read
- **THEN** an error is reported rather than returning only the first form
