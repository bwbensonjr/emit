## ADDED Requirements

### Requirement: Minimal process I/O for a standalone filter

The language SHALL provide two process-I/O primitives sufficient to write a standalone
text-filter program: `read-all-stdin`, which reads all of standard input to end-of-file and
returns it as a string; and `display`, which writes a string's bytes to standard output
verbatim — no surrounding quotes and no added newline — and returns an unspecified value.
These are distinct from the final-value printer (which quotes strings and adds a newline).

#### Scenario: display writes raw bytes

- **WHEN** a program evaluates `(display "hello")`
- **THEN** standard output contains exactly `hello` — no quotes and no trailing newline

#### Scenario: read-all-stdin round-trips input

- **WHEN** a program evaluates `(display (read-all-stdin))` with `abc\n(x y)` piped to stdin
- **THEN** standard output contains exactly `abc\n(x y)`

### Requirement: Standalone schemec filter is expressible

The language SHALL support expressing a standalone compiler filter: with the I/O primitives
above and the other self-hosting gaps closed, the compiler core plus a thin entry
`(display (compile-source-string (read-all-stdin)))` compiles to a native `schemec` that maps
source text on stdin to IR text on stdout, with no filesystem or subprocess surface in the
compiled program.

#### Scenario: Core builds to a stdin→stdout filter

- **WHEN** the assembled core with the stdin/stdout entry is compiled
- **THEN** the result is a native program that reads source from stdin and writes the emitted
  IR to stdout (self-hosting gap G3 is closed)
