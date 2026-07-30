## ADDED Requirements

### Requirement: Write style escapes so its output reads back

The value printer's *write* style SHALL produce output that a reader can read back as the
same datum. Within a written string, the double-quote and backslash characters SHALL be
escaped with a backslash, and the newline, tab, and return characters SHALL be written as
their two-character escapes — the escapes this project's own reader (`read-from-string`)
accepts, so written output round-trips through it. *Display* style SHALL be unaffected: it
writes a string's raw contents, unquoted and unescaped.

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

#### Scenario: A dumped form containing a string is readable data

- **WHEN** a program containing a string constant with an embedded quote is compiled with
  the stage-dump flag
- **THEN** every dumped stage reads back as data, and the form at each stage is equal to
  the form the Chez driver's dump shows for the same program
