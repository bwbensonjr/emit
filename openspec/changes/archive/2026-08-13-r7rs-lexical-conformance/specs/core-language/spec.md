## MODIFIED Requirements

### Requirement: Read data from source text

The compiler SHALL provide `read-from-string`, which parses a source string and returns the
first datum it contains. The reader SHALL recognize integers (optionally signed), symbols,
the empty list, proper lists `( … )`, bracketed lists `[ … ]` (accepted interchangeably with
parentheses), and dotted/improper lists `( … . x)`, booleans `#t`/`#f` (and their long forms
`#true`/`#false`), characters `#\x` (single codepoint), named characters, and hexadecimal
character escapes, strings `" … "` with escape sequences, `#(...)`
vectors, and `'`-quote sugar (`'x` reads as `(quote x)`), skipping interleaved whitespace and
comments. Symbols SHALL be interned (a read symbol is `eq?` to the same-named
literal).

**Three comment forms SHALL be recognized**, in every position where whitespace may appear —
between top-level forms, between the elements of a list, and between a quote and its datum:

- `;` to end of line;
- `#| … |#`, a block comment, which SHALL **nest**: `#| a #| b |# c |#` is one comment, and the
  first `|#` closes only the innermost open block;
- `#;`, which SHALL discard the **next datum**. It SHALL be accepted at top level and inside a list,
  including immediately before a closing parenthesis, and SHALL stack (`#;#;a b c` reads `c`).

**Both boolean spellings SHALL be read.** R7RS §7.1.1 gives `#t`/`#true` and `#f`/`#false` as
alternative spellings of the same two values. The reader SHALL consume the whole token in each case,
so that `#true` yields `#t` and leaves nothing behind for the next read.

String literals SHALL support the escape sequences `\a` (alarm, U+0007), `\b` (backspace, U+0008),
`\n` (newline), `\t` (tab), `\r` (return), `\\` (backslash), `\"` (double quote), and `\xHH…;` (a
hexadecimal Unicode codepoint terminated by `;`), decoding each to the intended character.

String literals SHALL also support the R7RS §6.7 **line continuation**: a backslash followed by
optional intraline whitespace, a newline, and further optional intraline whitespace SHALL contribute
**no characters at all** to the string. This is what lets a long literal be broken across source
lines without embedding the break and the following indentation in its value.

Character literals SHALL support named characters in addition to the single-character form. The R7RS
§6.6 names SHALL be recognized — `#\alarm` (U+0007), `#\backspace` (U+0008), `#\delete` (U+007F),
`#\escape` (U+001B), `#\newline`, `#\null`, `#\return`, `#\space`, and `#\tab` — together with the
recorded extensions `#\nul` (U+0000), `#\altmode` and `#\esc` (U+001B), and `#\page` (U+000C).

Character literals SHALL support the hexadecimal form `#\x<hex digits>`, denoting the character with
that Unicode scalar value, so `#\x41` is `A` and `#\x03BB` is λ. A `#\x` token with no following hex
digits SHALL remain the character `x`; the hexadecimal reading applies only when digits follow.

**An unknown character name SHALL be reported, naming the name.** The reader SHALL NOT fall back to
any character — in particular not to the first character of the name — because a fallback makes a
misspelled or unimplemented name indistinguishable from a correct one in the value it produces. The
report SHALL travel the same channel as the reader's other diagnostics, arriving from the entry point
rather than from the lexeme layer.

List syntax SHALL support dotted pairs: a standalone `.` before the final element within
parentheses SHALL produce an improper list whose tail is the datum following the `.`, so
`(a . b)` reads as the pair of `a` and `b`.

Bracketed list syntax `[ … ]` SHALL be accepted as equivalent to `( … )`: a `[` opens a list
and a `]` closes one, and brackets and parentheses are interchangeable (a list opened with `[`
may be closed with `)` and vice-versa). This mirrors the source the compiler consumes (Chez
`pretty-print` emits `[...]` for binding forms). Strict bracket/paren matching is not required.

Malformed input for these extensions (an unrecognized escape, or a misplaced `.`) is undefined for
this subset.

#### Scenario: Read a nested list

- **WHEN** a program evaluates `(read-from-string "(a (b c) 42)")`
- **THEN** the result is the list `(a (b c) 42)` — the symbol `a`, the list `(b c)`, and the
  fixnum `42`

#### Scenario: Read a bracketed list

- **WHEN** a program evaluates `(read-from-string "(let ([x 5]) x)")`
- **THEN** the result is the list `(let ((x 5)) x)` — the `[x 5]` binding reads as the list
  `(x 5)`, identical to the parenthesized form

#### Scenario: Read atoms of each type

- **WHEN** a program reads `"42"`, `"hello"`, `"#t"`, `"#\\z"`, and `"\"hi\""`
- **THEN** the results are the fixnum `42`, the symbol `hello`, the boolean `#t`, the
  character `#\z`, and the string `"hi"`

#### Scenario: The long boolean spellings read as booleans

- **WHEN** a program evaluates `(list #true #false)`
- **THEN** the result is the list `(#t #f)`, and no symbol `rue` or `alse` is produced

#### Scenario: Read symbols are interned

- **WHEN** a program evaluates `(eq? (read-from-string "foo") (quote foo))`
- **THEN** the result is `#t`

#### Scenario: Quote sugar and comments

- **WHEN** a program evaluates `(read-from-string "; a comment\n 'x")`
- **THEN** the comment is skipped and the result is the list `(quote x)`

#### Scenario: A block comment is skipped wherever whitespace is

- **WHEN** a program reads `"#| skip me |# (a #| and me |# b)"`
- **THEN** the result is the list `(a b)`, and neither comment contributes a datum

#### Scenario: Block comments nest

- **WHEN** a program reads `"#| outer #| inner |# still outer |# 42"`
- **THEN** the result is `42` — the first `|#` closes the inner block only

#### Scenario: A datum comment discards the next datum

- **WHEN** a program reads `"(1 #;2 3)"`, `"(1 2 #;3)"`, and `"#;(a b) c"`
- **THEN** the results are `(1 3)`, `(1 2)`, and the symbol `c`

#### Scenario: Datum comments stack

- **WHEN** a program reads `"(list #;#;1 2 3)"`
- **THEN** the result is `(list 3)` — the two `#;` discard the two data that follow them

#### Scenario: String escape sequences

- **WHEN** a program evaluates `(string-length (read-from-string "\"a\\nb\""))`
- **THEN** the result is `3` (the string `a`, newline, `b`)

#### Scenario: The alarm and backspace string escapes

- **WHEN** a program evaluates `(char->integer (string-ref "\a" 0))` and
  `(char->integer (string-ref "\b" 0))`
- **THEN** the results are `7` and `8`, not `97` and `98`

#### Scenario: A backslash-newline continuation contributes nothing

- **WHEN** a program reads a string literal written as `"line 1\` followed by a newline, three
  spaces, and `continued"`
- **THEN** the string is `line 1continued` — neither the newline nor the leading whitespace of the
  next line appears in the value

#### Scenario: Escaped double quote

- **WHEN** a program evaluates `(read-from-string "\"say \\\"hi\\\"\"")`
- **THEN** the result is the string `say "hi"`

#### Scenario: Comment syntax inside a string is not a comment

- **WHEN** a program reads `"\"a #| b ; c #; d\""`
- **THEN** the result is the string `a #| b ; c #; d`, unchanged

#### Scenario: Named character literal

- **WHEN** a program evaluates `(char->integer (read-from-string "#\\newline"))`
- **THEN** the result is `10`

#### Scenario: The R7RS control character names

- **WHEN** a program evaluates `(char->integer c)` for `c` read from `"#\\alarm"`,
  `"#\\backspace"`, `"#\\escape"`, and `"#\\delete"`
- **THEN** the results are `7`, `8`, `27`, and `127` — not the first letter of each name

#### Scenario: Hexadecimal character literal

- **WHEN** a program evaluates `(char->integer #\x41)` and
  `(char->integer (read-from-string "#\\x03BB"))`
- **THEN** the results are `65` and `955`

#### Scenario: A bare #\x is the letter x

- **WHEN** a program evaluates `(char->integer (read-from-string "#\\x"))`
- **THEN** the result is `120`

#### Scenario: An unknown character name is reported

- **WHEN** a program reads `"#\\alarmm"`
- **THEN** the read reports an error naming the unrecognized character name, and does not produce
  the character `#\a`

#### Scenario: Dotted pair

- **WHEN** a program evaluates `(read-from-string "(a . b)")`
- **THEN** the result is the pair `(a . b)` (`car` is the symbol `a`, `cdr` is the symbol `b`)

#### Scenario: Improper list with leading elements

- **WHEN** a program evaluates `(read-from-string "(a b . c)")`
- **THEN** the result is the improper list `(a b . c)`

### Requirement: The reader accepts the non-finite numeric tokens

Both readers — the prelude's `read-from-string`/`read` and the bootstrap reader the compiler
uses on its own source — SHALL recognize the three non-finite numeric tokens `+inf.0`, `-inf.0`,
and `+nan.0` as **numbers**, producing positive infinity, negative infinity, and a NaN
respectively, rather than interning them as symbols.

The tokens SHALL be recognized **case-insensitively**, so `+INF.0`, `+Inf.0`, `-INF.0`, and
`+NaN.0` read as the same numbers as their lowercase spellings. R7RS §7.1.1 makes the whole
numeric syntax case-insensitive, and a reader that accepts only one casing turns an ordinary
capitalization into an identifier. The printer SHALL continue to emit the lowercase spellings, so
the shape of existing output does not move.

This SHALL close the write/read round trip for every value the printer can produce: since
`(/ 1.0 0.0)` prints as `+inf.0`, feeding a program's own output back through the reader SHALL
NOT silently turn a number into an identifier. Both readers SHALL agree, so a datum has the same
meaning on every door.

#### Scenario: The non-finite tokens read as numbers

- **WHEN** a program evaluates `(number? (read-from-string "+inf.0"))`,
  `(number? (read-from-string "-inf.0"))`, and `(number? (read-from-string "+nan.0"))`
- **THEN** all three results are `#t`, and none of the three is a symbol

#### Scenario: The non-finite tokens are case-insensitive

- **WHEN** a program reads `"+INF.0"`, `"-Inf.0"`, and `"+NaN.0"`
- **THEN** the results are positive infinity, negative infinity, and a NaN — each a number, none a
  symbol

#### Scenario: Round trip through write and read

- **WHEN** a program divides `1.0` by `0.0`, prints the result, and reads that text back
- **THEN** the value read is a number equal to the original infinity, not the symbol `+inf.0`

#### Scenario: Both doors agree

- **WHEN** the same source containing `+inf.0` is read by the prelude reader and by the
  bootstrap reader
- **THEN** both produce the same numeric datum

### Requirement: case derived form

The language SHALL support `case` as a derived syntactic form: `(case KEY ((datum ...) body
...) ... (else body ...))` evaluates KEY once and runs the first clause whose datum list
contains KEY (compared with `eqv?`), or the `else` clause if none match.

`case` SHALL additionally support the R7RS §4.2.1 **receiver clause form**, in both an ordinary
clause and the `else` clause: `((datum ...) => EXPR)` and `(else => EXPR)`. When such a clause is
selected, EXPR SHALL be evaluated and the resulting procedure applied to **the key**, and the value
of that application is the value of the `case` expression. The key SHALL be evaluated exactly once
whether or not a receiver clause is selected, so a receiver never re-evaluates the key expression.

#### Scenario: case selects a matching clause

- **WHEN** a program evaluates `(case 2 ((1) 'a) ((2 3) 'b) (else 'c))`
- **THEN** the result is `'b`

#### Scenario: case falls through to else

- **WHEN** a program evaluates `(case 9 ((1) 'a) ((2 3) 'b) (else 'c))`
- **THEN** the result is `'c`

#### Scenario: A receiver clause is applied to the key

- **WHEN** a program evaluates
  `(case (car '(c d)) ((a e i o u) 'vowel) ((w y) 'semivowel) (else => (lambda (x) x)))`
- **THEN** the result is the symbol `c` — the `else` receiver applied to the key

#### Scenario: A receiver on an ordinary clause

- **WHEN** a program evaluates `(case 2 ((1) 'a) ((2 3) => (lambda (x) (* x 10))) (else 'c))`
- **THEN** the result is `20`

#### Scenario: The key is evaluated once with a receiver clause

- **WHEN** a program evaluates a `case` whose key expression increments a counter and whose
  selected clause is a receiver clause
- **THEN** the counter is incremented exactly once

### Requirement: Flonums print in round-trippable inexact form

`display`, `write`, and `number->string` SHALL render a flonum as decimal text
that the reader reads back to an equal flonum and that is visually distinguishable
from an exact integer: the rendering SHALL always contain a decimal point or an
exponent (e.g. `0.0`, `2.5`, `-1.25`, `100.0`). A flonum reaching the final-value
printer SHALL render safely rather than crashing or misprinting. Non-finite
flonums SHALL render as `+inf.0`, `-inf.0`, and `+nan.0`.

**Positional notation SHALL be preferred to exponent notation** wherever the value's decimal
exponent lies within the implementation's stated positional range, so `(display 100.0)` writes
`100.0` and not `1e+02`. Shortest-round-tripping digit selection is unchanged; what changes is that
a value whose shortest rendering *could* use an exponent is written positionally when it fits. A
value outside that range SHALL use exponent notation, and the range SHALL be wide enough to cover
the magnitudes ordinary programs print. The round-trip property SHALL hold for whichever form is
chosen — a positional rendering that does not read back as the same flonum SHALL NOT be emitted.

All three renderings SHALL agree, since a value must not print one way through `write` and another
through `number->string`.

#### Scenario: display and write of a flonum

- **WHEN** a program evaluates `(number->string 2.5)`, and displays `0.0` and
  `-1.25`
- **THEN** the string is `"2.5"`, and the displayed text is `0.0` and `-1.25`
  (each with a decimal point)

#### Scenario: A round flonum prints positionally

- **WHEN** a program evaluates `(number->string 100.0)` and displays `1000.0` and `0.001`
- **THEN** the outputs are `"100.0"`, `1000.0`, and `0.001` — none in exponent form

#### Scenario: Flonum output round-trips through the reader

- **WHEN** a program evaluates `(= x (read-from-string (number->string x)))` for a
  flonum `x` such as `2.5`, `-1.25`, `100.0`, or `1e300`
- **THEN** the result is `#t` in every case

#### Scenario: A magnitude outside the positional range keeps exponent form

- **WHEN** a program displays a flonum such as `1e300`
- **THEN** the output uses exponent notation, and reads back as the same flonum

#### Scenario: write and number->string agree

- **WHEN** a program writes a flonum and also evaluates `number->string` on it
- **THEN** the two texts are identical

#### Scenario: A flonum is distinguishable from an integer in output

- **WHEN** a program displays `(/ 6 3)` and `(/ 7 2)`
- **THEN** the outputs are `2` (an integer) and `3.5` (a flonum, with a decimal
  point)
