## ADDED Requirements

### Requirement: The input-completeness probe agrees with the reader about comments and quoted identifiers

The embedded compiler's input-completeness probe — the entry a host calls to decide whether the text
typed so far is a whole form — SHALL recognize every comment form the reader recognizes: `;` to end
of line, nested `#| … |#`, and `#;` discarding the next datum. It SHALL likewise treat a bar-quoted
identifier `|…|` as one datum extent, the way it already treats a string. It SHALL continue to share
the reader's lexeme helpers rather than reimplementing them, so the two cannot disagree about where a
datum begins.

Text whose only defect is an **unfinished** lexeme SHALL be reported as **incomplete** — more input
is needed — and not as malformed: an unterminated `#|`, a `#;` with nothing after it yet, or an
unterminated `|`. A host therefore keeps reading lines instead of rejecting the form, which is what
lets a block comment or a quoted identifier be typed across several lines at a prompt.

#### Scenario: An unterminated block comment is incomplete, not malformed

- **WHEN** the probe is given `"#| a comment that continues"`
- **THEN** it reports incomplete, so the host asks for another line

#### Scenario: A completed multi-line block comment yields the following form

- **WHEN** the probe is given `"#| a\nmultiline comment |# (+ 1 2)"`
- **THEN** it reports a complete form, measuring the datum after the comment

#### Scenario: A datum comment awaiting its datum is incomplete

- **WHEN** the probe is given `"(list 1 #;"`
- **THEN** it reports incomplete rather than malformed

#### Scenario: An unterminated bar-quoted identifier is incomplete

- **WHEN** the probe is given `"(list |a b"`
- **THEN** it reports incomplete rather than malformed

#### Scenario: The probe and the reader answer for the same text

- **WHEN** any text the reader accepts as one complete datum is given to the probe
- **THEN** the probe reports it complete, and the length it reports is the extent the reader
  consumed
