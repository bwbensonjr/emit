# character-library Specification

## Purpose

Defines the complete Unicode-aware R7RS-small `(scheme char)` library used for character classification, case conversion, and case-insensitive text operations.

## Requirements

### Requirement: The character standard library

Emit SHALL provide an ordinary importable `(scheme char)` library exporting `char-alphabetic?`, `char-numeric?`, `char-whitespace?`, `char-upper-case?`, `char-lower-case?`, `digit-value`, `char-upcase`, `char-downcase`, `char-foldcase`, the five `char-ci` comparison procedures, `string-upcase`, `string-downcase`, `string-foldcase`, and the five `string-ci` comparison procedures. The library SHALL work identically through the REPL, `emit run`, user-library artifacts, and standalone executables.

#### Scenario: Import exposes the full declared surface

- **WHEN** a program imports `(scheme char)` and references every required export
- **THEN** compilation and execution succeed through both `emit run` and an AOT build

### Requirement: Character properties follow Unicode

For every Unicode scalar value supported by Emit, the character property predicates SHALL follow the Unicode `Alphabetic`, `Numeric_Type=Decimal`, `White_Space`, `Uppercase`, and `Lowercase` properties required by R7RS-small. They SHALL NOT silently reduce non-ASCII characters to ASCII classifications.

#### Scenario: Pitch lexer classifications work beyond ASCII

- **WHEN** `char-alphabetic?` is applied to Greek lambda, `char-whitespace?` to a non-ASCII Unicode white-space character, and `char-numeric?` to an Arabic-Indic decimal digit
- **THEN** all three results are `#t`

#### Scenario: A non-property character is rejected

- **WHEN** each property predicate is applied to a Unicode character that lacks its corresponding property
- **THEN** it returns `#f`

### Requirement: Decimal digit values are Unicode-aware

`digit-value` SHALL return the integer from 0 through 9 for every supported Unicode character with `Numeric_Type=Decimal`, and `#f` for every other character.

#### Scenario: Digits from distinct scripts have values

- **WHEN** `digit-value` is applied to ASCII `3`, Arabic-Indic digit four, and Gujarati digit zero
- **THEN** it returns `3`, `4`, and `0` respectively

### Requirement: Simple character casing follows Unicode

`char-upcase` and `char-downcase` SHALL apply Unicode simple casing pairs, and `char-foldcase` SHALL apply Unicode simple case folding. A character with no applicable mapping SHALL be returned unchanged.

#### Scenario: Non-ASCII case mappings round-trip

- **WHEN** the character casing procedures are applied to a supported non-ASCII upper/lower pair
- **THEN** upcase, downcase, and foldcase produce the corresponding Unicode simple mappings

#### Scenario: An uncased character is unchanged

- **WHEN** any character casing procedure is applied to an uncased symbol character
- **THEN** it returns that same character

### Requirement: Case-insensitive character comparisons are n-ary

The five `char-ci` procedures SHALL behave as if `char-foldcase` were applied to every argument before the corresponding case-sensitive comparison. They SHALL accept two or more characters and apply the relation transitively across adjacent arguments.

#### Scenario: A mixed-case comparison chain succeeds

- **WHEN** `char-ci<?` receives three characters whose folded values are strictly increasing
- **THEN** it returns `#t`

#### Scenario: A broken comparison chain fails

- **WHEN** one adjacent pair in an n-ary `char-ci<=?` call is decreasing after folding
- **THEN** it returns `#f`

### Requirement: Full string casing and folding follow Unicode

`string-upcase`, `string-downcase`, and `string-foldcase` SHALL apply the Unicode full string algorithms without locale-sensitive mappings. The returned string MAY differ in length from the input where Unicode defines a multi-character mapping.

#### Scenario: A full mapping can change length

- **WHEN** string case conversion or folding is applied to text with a Unicode multi-character mapping
- **THEN** the complete mapped sequence is returned rather than a truncated simple-character mapping

#### Scenario: Pitch-style identifier folding is stable

- **WHEN** the same Unicode identifier is folded once and then folded again
- **THEN** the second result is string-equal to the first

### Requirement: Case-insensitive string comparisons use full folding

The five `string-ci` procedures SHALL behave as if `string-foldcase` were applied to every argument before the corresponding case-sensitive string comparison. They SHALL accept two or more strings and apply the relation transitively.

#### Scenario: Different spellings with the same fold compare equal

- **WHEN** two Unicode strings have equal full case-folded forms
- **THEN** `string-ci=?` returns `#t`
