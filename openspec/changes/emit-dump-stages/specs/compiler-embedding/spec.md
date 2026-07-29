## ADDED Requirements

### Requirement: The embedded compiler has a standard-error narration channel

The embedded compiler SHALL be able to write informational output to standard error. The
runtime SHALL provide a primitive that prints a value to standard error in either
display or write style, sharing the runtime's existing tag-walking value printer so there
is only one printer to keep in sync. Standard output SHALL remain reserved for the
embedded compiler's data payload (emitted IR), so narration SHALL NOT be written there.

#### Scenario: Narration reaches stderr, not stdout

- **WHEN** the embedded compiler narrates while a door compiles a program
- **THEN** the narration appears on standard error and the door's standard output is
  unchanged

#### Scenario: Write style matches the runtime's printer

- **WHEN** the embedded compiler prints an IL form to standard error in write style
- **THEN** the bytes are those the runtime's existing write-style printer produces for that
  value (strings quoted, characters `#\`-prefixed)

### Requirement: The embedded compiler supports stage-dump parity

The embedded compiler SHALL accept a stage-dump level forwarded by its host through the
smallest viable channel (an environment variable the entry reads via a nullary runtime
primitive), matching the channel used for `--no-prelude`. The level SHALL distinguish
**off**, **stage names only** (the concise trace the Chez driver emits at verbose
verbosity), and **full per-pass IL dump**. The entry — not the pure compiler core — SHALL
read the level and construct the dumper, which is then passed through the core's existing
`dump` parameter; the core SHALL remain free of ports and of environment access.

#### Scenario: The host forwards the dump level

- **WHEN** a door is invoked with `--dump` and sets the dump-level variable before the
  first entry call
- **THEN** the embedded compiler dumps each pass, and with the variable unset it dumps
  nothing

#### Scenario: Stage names only at the intermediate level

- **WHEN** a door runs at the stage-names level rather than the full-dump level
- **THEN** the embedded compiler announces each pass by name in the order it runs, without
  printing the IL

#### Scenario: The pure core stays port-free

- **WHEN** the compiler core is inspected after this change
- **THEN** it still receives its dumper as a parameter and contains no standard-error
  write and no environment probe of its own

### Requirement: Stage dumping cannot alter emitted IR

Enabling any stage-dump level SHALL NOT change the IR the embedded compiler emits. The
dumper SHALL only read the intermediate language, and in particular SHALL NOT consume
gensym counter values, so the self-hosting fixed point and the anti-stale trust-check are
unaffected by dumping.

#### Scenario: Regen is unaffected by dumping

- **WHEN** the committed IR is regenerated with dumping enabled and with it disabled
- **THEN** the resulting `bootstrap/*.ll` are byte-identical in both cases
