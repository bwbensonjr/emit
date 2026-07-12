## ADDED Requirements

### Requirement: String and character operations

The compiler SHALL provide operations over the string and character data types:
`char->integer` and `integer->char` (between a character and its Unicode codepoint),
`string-length`, `string-ref`, `substring`, and `string->symbol`. String length and
indexing SHALL be measured in **Unicode codepoints** (not bytes), so `string-ref` returns
the requested character and `string-length` equals the character count. `string->symbol`
SHALL return the interned symbol of the string's text, so it is `eq?` to a symbol literal
of the same name.

#### Scenario: Character and codepoint conversion

- **WHEN** a program evaluates `(char->integer #\A)` and `(integer->char 97)`
- **THEN** the results are the fixnum `65` and the character `#\a`

#### Scenario: String length and reference

- **WHEN** a program evaluates `(string-length "abc")` and `(string-ref "abc" 1)`
- **THEN** the results are `3` and the character `#\b`

#### Scenario: Substring

- **WHEN** a program evaluates `(substring "hello" 1 4)`
- **THEN** the result is the string `"ell"`

#### Scenario: Codepoint indexing over non-ASCII text

- **WHEN** a program evaluates `(string-length "héllo")` and `(string-ref "héllo" 1)`
- **THEN** the results are `5` and the character `#\é` (indexing counts codepoints, not
  UTF-8 bytes)

#### Scenario: string->symbol interns

- **WHEN** a program evaluates `(eq? (string->symbol "foo") (quote foo))`
- **THEN** the result is `#t`
