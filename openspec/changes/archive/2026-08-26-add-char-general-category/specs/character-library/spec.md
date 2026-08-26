## MODIFIED Requirements

### Requirement: The character standard library

Emit SHALL provide an ordinary importable `(scheme char)` library exporting
`char-alphabetic?`, `char-numeric?`, `char-whitespace?`, `char-upper-case?`,
`char-lower-case?`, `digit-value`, `char-upcase`, `char-downcase`,
`char-foldcase`, the five `char-ci` comparison procedures, `string-upcase`,
`string-downcase`, `string-foldcase`, and the five `string-ci` comparison
procedures. It SHALL additionally export `char-general-category` as a documented
Emit extension. The library SHALL work identically through the REPL, `emit run`,
user-library artifacts, and standalone executables.

#### Scenario: Import exposes the full declared surface

- **WHEN** a program imports `(scheme char)` and references every required
  standard export plus `char-general-category`
- **THEN** compilation and execution succeed through both `emit run` and an AOT
  build

## ADDED Requirements

### Requirement: General categories follow Unicode

`char-general-category` SHALL accept a character and return the symbol naming
that character's two-letter Unicode `General_Category` value from the Unicode
version declared by `(scheme char)`. Assigned characters SHALL retain their
specific category, including characters represented by compact ranges in the
Unicode Character Database, and supported unassigned scalar values SHALL return
`Cn`.

#### Scenario: Distinct character classes return distinct category symbols

- **WHEN** `char-general-category` is applied to representative uppercase,
  lowercase, titlecase, combining-mark, decimal-digit, space-separator, symbol,
  and private-use characters
- **THEN** it returns their corresponding `Lu`, `Ll`, `Lt`, `Mn`, `Nd`, `Zs`,
  `So`, and `Co` symbols

#### Scenario: A compact UnicodeData range retains its category

- **WHEN** `char-general-category` is applied to the first, an interior, and the
  last scalar value of a UnicodeData `First`/`Last` range
- **THEN** it returns that range's declared category for all three characters

#### Scenario: An unassigned scalar has the unassigned category

- **WHEN** `char-general-category` is applied to a supported scalar value that is
  unassigned in the declared Unicode version
- **THEN** it returns `Cn`

#### Scenario: Pitch lexer category groups are preserved

- **WHEN** Pitch classifies non-ASCII identifier initials, identifier
  continuations, and intraline whitespace by membership in its declared general
  category sets
- **THEN** `char-general-category` supplies the same category symbols as the
  declared Unicode version without reducing the classification to ASCII
