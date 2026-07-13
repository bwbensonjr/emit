## MODIFIED Requirements

### Requirement: In-language reader (`read-from-string`)

The compiler SHALL provide `read-from-string`, a reader that parses Scheme source text into a
datum. It SHALL read integers, symbols, lists, `#t`/`#f`, character literals, string literals,
and `'`-quote sugar, skipping whitespace and `;` line comments.

String literals SHALL support the escape sequences `\n` (newline), `\t` (tab), `\r` (return),
`\\` (backslash), `\"` (double quote), and `\xHH…;` (a hexadecimal Unicode codepoint
terminated by `;`), decoding each to the intended character.

Character literals SHALL support named characters in addition to the single-character form:
`#\space`, `#\newline`, `#\tab`, `#\return`, `#\nul` (and `#\null`), `#\delete`, and
`#\altmode` (and `#\esc`), each denoting its corresponding character.

List syntax SHALL support dotted pairs: a standalone `.` before the final element within
parentheses SHALL produce an improper list whose tail is the datum following the `.`, so
`(a . b)` reads as the pair of `a` and `b`.

Malformed input for these extensions (an unrecognized escape, an unknown character name, or a
misplaced `.`) is undefined for this subset.

#### Scenario: String escape sequences

- **WHEN** a program evaluates `(string-length (read-from-string "\"a\\nb\""))`
- **THEN** the result is `3` (the string `a`, newline, `b`)

#### Scenario: Escaped double quote

- **WHEN** a program evaluates `(read-from-string "\"say \\\"hi\\\"\"")`
- **THEN** the result is the string `say "hi"`

#### Scenario: Named character literal

- **WHEN** a program evaluates `(char->integer (read-from-string "#\\newline"))`
- **THEN** the result is `10`

#### Scenario: Dotted pair

- **WHEN** a program evaluates `(read-from-string "(a . b)")`
- **THEN** the result is the pair `(a . b)` (`car` is the symbol `a`, `cdr` is the symbol `b`)

#### Scenario: Improper list with leading elements

- **WHEN** a program evaluates `(read-from-string "(a b . c)")`
- **THEN** the result is the improper list `(a b . c)`
