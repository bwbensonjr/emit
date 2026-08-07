## MODIFIED Requirements

### Requirement: Read data from source text

The compiler SHALL provide `read-from-string`, which parses a source string and returns the
first datum it contains. The reader SHALL recognize integers (optionally signed), symbols,
the empty list, proper lists `( … )`, bracketed lists `[ … ]` (accepted interchangeably with
parentheses), and dotted/improper lists `( … . x)`, booleans `#t`/`#f`, characters `#\x`
(single codepoint) and named characters, strings `" … "` with escape sequences, `#(...)`
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

String literals SHALL support the escape sequences `\n` (newline), `\t` (tab), `\r` (return),
`\\` (backslash), `\"` (double quote), and `\xHH…;` (a hexadecimal Unicode codepoint
terminated by `;`), decoding each to the intended character.

Character literals SHALL support named characters in addition to the single-character form:
`#\space`, `#\newline`, `#\tab`, `#\return`, `#\nul` (and `#\null`), `#\delete`, and
`#\altmode` (and `#\esc`), each denoting its corresponding character.

List syntax SHALL support dotted pairs: a standalone `.` before the final element within
parentheses SHALL produce an improper list whose tail is the datum following the `.`, so
`(a . b)` reads as the pair of `a` and `b`.

Bracketed list syntax `[ … ]` SHALL be accepted as equivalent to `( … )`: a `[` opens a list
and a `]` closes one, and brackets and parentheses are interchangeable (a list opened with `[`
may be closed with `)` and vice-versa). This mirrors the source the compiler consumes (Chez
`pretty-print` emits `[...]` for binding forms). Strict bracket/paren matching is not required.

Malformed input for these extensions (an unrecognized escape, an unknown character name, or a
misplaced `.`) is undefined for this subset.

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

#### Scenario: Escaped double quote

- **WHEN** a program evaluates `(read-from-string "\"say \\\"hi\\\"\"")`
- **THEN** the result is the string `say "hi"`

#### Scenario: Comment syntax inside a string is not a comment

- **WHEN** a program reads `"\"a #| b ; c #; d\""`
- **THEN** the result is the string `a #| b ; c #; d`, unchanged

#### Scenario: Named character literal

- **WHEN** a program evaluates `(char->integer (read-from-string "#\\newline"))`
- **THEN** the result is `10`

#### Scenario: Dotted pair

- **WHEN** a program evaluates `(read-from-string "(a . b)")`
- **THEN** the result is the pair `(a . b)` (`car` is the symbol `a`, `cdr` is the symbol `b`)

#### Scenario: Improper list with leading elements

- **WHEN** a program evaluates `(read-from-string "(a b . c)")`
- **THEN** the result is the improper list `(a b . c)`

### Requirement: string->number parses numeric text

The standard prelude SHALL provide `(string->number s)` and `(string->number s radix)`,
returning the number `s` denotes, or `#f` — **not** an error — when `s` is not a valid number in
the given radix. It SHALL be the inverse of `number->string` for every value that procedure
produces, so `(string->number (number->string n))` equals `n` for any number n, and likewise
with a matching radix argument.

`string->number` SHALL share the reader's numeric grammar and parsers rather than defining a
second, independently drifting one, so that any token the reader accepts as a number is accepted
here identically — **including the radix and exactness prefixes**. A prefix in the text SHALL take
precedence over the `radix` argument. The default radix SHALL be 10; radices 2, 8, 10, and 16 SHALL
be accepted for exact integers. An inexact result SHALL require radix 10; a non-decimal radix applied
to non-integer text SHALL raise an error, which R7RS permits.

Where the **reader** reports an implementation restriction for a number it cannot represent,
`string->number` SHALL instead return `#f`, as R7RS §6.2.6 specifies for a number that cannot be
represented.

#### Scenario: Integers, flonums, and failure

- **WHEN** a program evaluates `(string->number "42")`, `(string->number "-2.5")`,
  `(string->number "abc")`, and `(string->number "")`
- **THEN** the results are `42`, the flonum `-2.5`, `#f`, and `#f`

#### Scenario: Radix parsing

- **WHEN** a program evaluates `(string->number "ff" 16)`, `(string->number "1010" 2)`, and
  `(string->number "ff" 10)`
- **THEN** the results are `255`, `10`, and `#f`

#### Scenario: Prefixed text parses without a radix argument

- **WHEN** a program evaluates `(string->number "#x1f")`, `(string->number "#b1010")`, and
  `(string->number "#i42")`
- **THEN** the results are `31`, `10`, and the flonum `42.0`

#### Scenario: A prefix wins over the radix argument

- **WHEN** a program evaluates `(string->number "#x10" 10)`
- **THEN** the result is `16`

#### Scenario: An unrepresentable number answers #f rather than raising

- **WHEN** a program evaluates `(string->number "1/2")`
- **THEN** the result is `#f`, and no error is raised

#### Scenario: Round-trips with number->string

- **WHEN** a program evaluates `(string->number (number->string 1234))`,
  `(string->number (number->string -2.5))`, and
  `(string->number (number->string 255 16) 16)`
- **THEN** the results are `1234`, the flonum `-2.5`, and `255`

### Requirement: Write style escapes so its output reads back

The value printer's *write* style SHALL produce output that a reader can read back as the
same datum. Within a written string, the double-quote and backslash characters SHALL be
escaped with a backslash, and the newline, tab, and return characters SHALL be written as
their two-character escapes — the escapes this project's own reader (`read-from-string`)
accepts, so written output round-trips through it. *Display* style SHALL be unaffected: it
writes a string's raw contents, unquoted and unescaped.

**A symbol whose name would not read back as that symbol SHALL be written bar-quoted**, as
`|name|`, with `|` and `\` inside the name escaped. A name needs bars when it is empty, contains
whitespace, a delimiter, `|`, or `"`, or begins with a character sequence the reader would take as
a number or another datum. A name that needs none SHALL be written bare, exactly as now, so no
symbol any existing output contains changes shape. *Display* style SHALL write the raw name in
every case.

This applies to every consumer of write style: the `write` primitive, the runtime's
final-value printer, and the compiler's stage dump (which prints intermediate-language
forms in write style, and whose output must therefore be readable data).

#### Scenario: A written string escapes its quotes and backslashes

- **WHEN** a program runs `(write "a\"b\\c")`
- **THEN** it writes `"a\"b\\c"` — the embedded quote and backslash each escaped, so a
  reader reads back the original three-part string

#### Scenario: Display style is unescaped

- **WHEN** a program runs `(display "a\"b")`
- **THEN** it writes `a"b` — raw contents, no quotes and no escapes

#### Scenario: A symbol that needs bars is written with them

- **WHEN** a program runs `(write (string->symbol "a b"))` and then
  `(display (string->symbol "a b"))`
- **THEN** the first writes `|a b|` and the second writes `a b`

#### Scenario: An ordinary symbol is written bare

- **WHEN** a program runs `(write (quote hello))` and `(write (quote set!))`
- **THEN** it writes `hello` and `set!`, with no bars

#### Scenario: A dumped form containing a string is readable data

- **WHEN** a program containing a string constant with an embedded quote is compiled with
  the stage-dump flag
- **THEN** every dumped stage reads back as data, and the form at each stage is equal to
  the form the Chez driver's dump shows for the same program

## ADDED Requirements

### Requirement: The reader accepts R7RS radix and exactness prefixes

Both readers — the prelude's `read-from-string`/`read` and `string->number` — SHALL accept the R7RS
§6.2.5 number prefixes: the radix prefixes `#b`, `#o`, `#d`, `#x` and the exactness prefixes `#e`,
`#i`. Prefix letters SHALL be accepted in either case, as SHALL hexadecimal digits. At most one
radix prefix and at most one exactness prefix may appear, in either order, so `#x#e1f` and `#e#x1f`
are both valid and denote the same number.

A decimal point or exponent SHALL be accepted only under radix 10 (explicit `#d` or no radix
prefix); combined with another radix it SHALL be reported as invalid number syntax naming the
token. `#i` SHALL yield the inexact value of the number that follows. `#e` SHALL yield the exact
value where this implementation represents it, and otherwise SHALL report an implementation
restriction as below.

A token beginning with `#` that is not a valid prefixed number, a boolean, a character, a vector, a
bytevector, or a comment SHALL be reported as unrecognized syntax naming the token, rather than
interned as a symbol.

#### Scenario: Radix prefixes read as exact integers

- **WHEN** a program reads `"#x1f"`, `"#b1010"`, `"#o17"`, and `"#d99"`
- **THEN** the results are `31`, `10`, `15`, and `99`, and each is an exact integer

#### Scenario: Prefixes are case-insensitive and accept a sign

- **WHEN** a program reads `"#X1F"` and `"#x-1f"`
- **THEN** the results are `31` and `-31`

#### Scenario: Exactness prefixes

- **WHEN** a program reads `"#i42"`, `"#e1.0"`, and `"#x#e1f"`
- **THEN** the results are the flonum `42.0`, the exact integer `1`, and the exact integer `31`

#### Scenario: A decimal point outside radix 10 is reported

- **WHEN** a program reads `"#x1.8"`
- **THEN** compilation or evaluation reports invalid number syntax naming the token, rather than
  producing a symbol

#### Scenario: Round trip through number->string with a radix

- **WHEN** a program evaluates
  `(read-from-string (string-append "#x" (number->string 255 16)))`
- **THEN** the result is `255`

### Requirement: Rational literal syntax is reported, not read

Emit represents exact integers within the fixnum range and has no exact rationals or bignums. R7RS
§6.2.3 permits two responses to an exact literal outside what an implementation represents: report a
violation of an implementation restriction, or represent the number inexactly. The reader SHALL
**report**, naming the literal, and SHALL NOT intern it as a symbol — which is neither response.

The report SHALL be for the **syntax**, not for the particular value: `n/m` SHALL be reported
whatever its value and whatever prefix precedes it, including `4/2` and `#i1/2`, whose values Emit
can represent. Partial acceptance would advertise a notation the implementation does not have.

`#e` applied to a non-integral decimal (`#e0.5`) SHALL be reported on the same grounds, though it is
an exactness conversion rather than rational syntax.

The choice of *report* over *represent inexactly* matches the answer Emit already gives for the
other unrepresentable exact literal: an out-of-range exact integer traps rather than silently
becoming a flonum or a wrapped value.

#### Scenario: A rational literal is reported, not interned

- **WHEN** a program reads `"1/2"`
- **THEN** an error names the literal and says that rational literal syntax is not supported, and
  the result is not the symbol `1/2`

#### Scenario: A representable rational is reported too

- **WHEN** a program reads `"4/2"` and `"#i1/2"`
- **THEN** both are reported, rather than reading as `2` and `0.5` — the refusal is of the syntax

#### Scenario: `#e` on a non-integral decimal is reported

- **WHEN** a program reads `"#e0.5"`
- **THEN** an error names the literal rather than returning a flonum or a symbol

#### Scenario: The division is still available

- **WHEN** a program evaluates `(/ 1 2)`
- **THEN** the result is the flonum `0.5`, unchanged by this requirement

### Requirement: Bar-quoted identifiers read, and write emits them when needed

The reader SHALL accept R7RS §7.1.1 bar-quoted identifier syntax: `|` opens an identifier that runs
to the matching `|`, and the characters between them — including whitespace, delimiters, and
characters that would otherwise start another datum — form the symbol's name. The escapes `\|` and
`\xHH…;` SHALL be recognized inside the bars.

A bar-quoted identifier SHALL produce an ordinary interned symbol: there is no distinct type, so
`(eq? (quote |foo|) (quote foo))` is `#t` and `|foo bar|` is `eq?` to
`(string->symbol "foo bar")`.

An unterminated `|` SHALL be reported the way an unterminated block comment is — as an error at the
reader's entry points, and as *incomplete* to the interactive completeness probe.

#### Scenario: A bar-quoted identifier reads as a symbol

- **WHEN** a program evaluates `(symbol->string (read-from-string "|foo bar|"))`
- **THEN** the result is the string `foo bar`

#### Scenario: Bars do not create a distinct symbol

- **WHEN** a program evaluates `(eq? (read-from-string "|foo|") (quote foo))`
- **THEN** the result is `#t`

#### Scenario: Escapes inside bars

- **WHEN** a program reads `"|a\\|b|"` and `"|a\\x41;b|"`
- **THEN** the resulting symbol names are `a|b` and `aAb`

#### Scenario: A symbol needing bars round-trips through write and read

- **WHEN** a program writes `(string->symbol "a b")` and reads that text back
- **THEN** the text is `|a b|` and the value read is `eq?` to the original symbol

### Requirement: An unterminated block comment is reported, not read as end of input

An unterminated `#|` SHALL be reported by every reader entry point — `read-from-string`,
`read-all-from-string`, and `read` over a port — as an error naming the position where the comment
opened. It SHALL NOT be treated as end of input, which would silently discard every form after the
opening delimiter.

Because the reader's lexeme layer performs no raising, the unterminated condition SHALL be carried
outward as a value and turned into an error by the entry point, so that a consumer which needs a
different answer — notably the interactive input-completeness probe, which needs "incomplete" —
can give one from the same signal.

#### Scenario: An unterminated block comment is an error

- **WHEN** a program reads `"#| never closed"`
- **THEN** an error names the unterminated comment, rather than returning end-of-file

#### Scenario: Forms after an unterminated comment are not silently dropped

- **WHEN** a source is `"(display 1)\n#| oops\n(display 2)"` and every top-level form is read
- **THEN** the read is reported as an error naming the unterminated comment, rather than returning
  only the first form
