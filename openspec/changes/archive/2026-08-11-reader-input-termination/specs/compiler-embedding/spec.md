## MODIFIED Requirements

### Requirement: The input-completeness probe agrees with the reader about comments and quoted identifiers

The embedded compiler's input-completeness probe — the entry a host calls to decide whether the text
typed so far is a whole form — SHALL recognize every comment form the reader recognizes: `;` to end
of line, nested `#| … |#`, and `#;` discarding the next datum. It SHALL likewise treat a bar-quoted
identifier `|…|` as one datum extent, the way it already treats a string. It SHALL continue to share
the reader's lexeme helpers rather than reimplementing them, so the two cannot disagree about where a
datum begins.

Text whose only defect is an **unfinished** lexeme SHALL be reported as **incomplete** — more input
is needed — and not as malformed. This SHALL hold for every construct that has a closing delimiter:
an unterminated `#|`, a `#;` with nothing after it yet, an unterminated `|`, an unterminated string,
and an unterminated list, vector, or bytevector — `(`, `[`, `#(`, `#u8(`. A host therefore keeps
reading lines instead of rejecting the form, which is what lets a list, a string, a block comment, or
a quoted identifier be typed across several lines at a prompt.

The probe and a batch read therefore give **different answers for the same text, by design**: the
probe answers *incomplete* where `read-all-from-string` reports an *error* (`core-language`, "An
unterminated block comment is reported, not read as end of input"). This is a directional
divergence, not a disagreement about the grammar — both identify the same construct as unterminated
at the same position, and they differ only in what an unterminated construct means to their caller.
A host reading from a stream can supply more input, so the useful answer is "keep reading"; a source
file has no more input to supply, so the useful answer is a diagnostic naming what was left open.

The two SHALL NOT be unified into a single answer. Making the probe report an error would destroy
multi-line entry at the prompt; making a batch read return a closed datum is the silent-truncation
defect the reader requirement exists to prevent.

A position the probe reports SHALL be interpreted in the units it is expressed in. The probe measures
the core's strings, which are codepoint-indexed over UTF-8 storage, so a host holding a byte buffer
SHALL convert before slicing it — otherwise every form preceded by multi-byte text is truncated by
the difference, with no diagnostic, because the two units agree on all ASCII input.

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

#### Scenario: An unterminated list is incomplete at the prompt

- **WHEN** the probe is given `"(display (list 1"`
- **THEN** it reports incomplete, so a list may still be typed across several lines — even though a
  batch read of that same text reports an unterminated list

#### Scenario: An unterminated string is incomplete at the prompt

- **WHEN** the probe is given `"(display \"abc"`
- **THEN** it reports incomplete rather than malformed

#### Scenario: A multi-line list entered at the prompt still evaluates

- **WHEN** a session is given `"(display (list 1\n"` followed by `"2))\n"`
- **THEN** the form is assembled across the two lines and evaluated, printing `(1 2)` — the reader's
  unterminated-construct error does not reach a host that is still collecting input

#### Scenario: A form preceded by multi-byte text is not truncated

- **WHEN** a session is given a comment containing a multi-byte character, then a form typed across
  two lines
- **THEN** the whole form is evaluated — the host converts the probe's codepoint answer to a byte
  offset before slicing, rather than dropping the trailing bytes of the form

#### Scenario: The probe and the reader answer for the same text

- **WHEN** any text the reader accepts as one complete datum is given to the probe
- **THEN** the probe reports it complete, and the length it reports is the extent the reader
  consumed
