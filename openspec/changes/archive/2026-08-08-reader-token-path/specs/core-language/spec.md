## ADDED Requirements

### Requirement: A case-folding whole-source read

The prelude SHALL provide, beside `read-all-from-string`, a **case-folding** whole-source entry
point that returns the same list of top-level data with the symbol case of every **unquoted**
identifier folded. The folding SHALL happen during tokenization, so that an identifier written
between vertical bars is left literal: R7RS §7.1.1 makes the characters between the bars the
symbol's name, and folding after reading cannot honor that because a bar-quoted symbol and a bare
one are the same interned object once read.

Folding SHALL apply to every symbol the read produces, wherever it occurs — at top level, inside a
list, inside quoted structure, and inside a vector literal — and SHALL apply to nothing else: string
and character literals, numbers, and the text between bars are unaffected. In particular, folding
SHALL NOT alter the text from which a number is parsed.

Folding SHALL be ASCII: an ASCII uppercase letter maps to its lowercase counterpart and every other
character is returned unchanged. This is a recorded limit of the substrate, which carries no Unicode
case tables.

In every other respect the folding entry SHALL behave exactly as `read-all-from-string` — same
grammar, same values, same treatment of whitespace and the three comment forms, and the same
reporting of an unterminated construct through the entry point rather than from the lexeme layer.

The folding entry SHALL be exported by the same library that exports `read-all-from-string`, because
it reports the same conditions through the same helper and reporting cannot be homed in the internal
substrate.

#### Scenario: Unquoted identifiers fold

- **WHEN** the folding entry is applied to `"(DEFINE (Greet) 1)"`
- **THEN** it returns `((define (greet) 1))`

#### Scenario: A bar-quoted identifier is left literal

- **WHEN** the folding entry is applied to `"(define (|MixedCase|) 1)"`
- **THEN** the defined name is the symbol `MixedCase`, and it is not `eq?` to `mixedcase`

#### Scenario: Bars and bare names in the same form stay distinguishable

- **WHEN** the folding entry is applied to `"(A |A|)"`
- **THEN** the two elements are the symbols `a` and `A`, and they are not `eq?` to each other

#### Scenario: Folding reaches inside quoted and vector structure

- **WHEN** the folding entry is applied to `"(quote (Alpha #(Beta |Gamma|)))"`
- **THEN** the symbols read are `alpha`, `beta`, and `Gamma`

#### Scenario: Strings, characters, and numbers are untouched

- **WHEN** the folding entry is applied to `"(\"ABC\" #\\A 1E3 X)"`
- **THEN** the string is `ABC`, the character is `#\A`, the number is the flonum `1000.0`, and only
  the identifier folds, to `x`

#### Scenario: The non-folding entry is unchanged

- **WHEN** `read-all-from-string` is applied to `"(DEFINE (Greet) 1)"`
- **THEN** it returns `((DEFINE (Greet) 1))`, with no folding
