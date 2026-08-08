## MODIFIED Requirements

### Requirement: A library body may be included from other files

The compiler SHALL accept `(include ⟨string⟩ …)` and `(include-ci ⟨string⟩ …)` as library
declarations. Each names a file whose top-level forms SHALL be spliced into the library body at the
position of the declaration, in the order the filenames appear, exactly as if those forms had been
written inside a `begin` declaration there. `include-ci` SHALL additionally fold the symbol case of
the forms it reads, so that source written for a case-insensitive Scheme reads correctly.

**The fold SHALL happen while the file is being read**, not over the forms reading returned, so that
R7RS §7.1.1's distinction survives it: an identifier written **between vertical bars** SHALL NOT be
folded — the characters between the bars are the symbol's name literally — while every unquoted
identifier SHALL be. The fold SHALL reach every symbol the file produces, including symbols inside
vector and bytevector literals and inside quoted structure. (The vector case is verified at the
reader rather than through a library, because a quoted vector cannot currently be lowered as a
constant at all — an unrelated gap, GitHub issue #64.)

Both doors SHALL implement this rule and SHALL agree on it for ASCII source. Case folding outside
ASCII is **not** guaranteed to agree between doors and is a recorded limit, not a promise.

An included form SHALL be subject to every rule a directly written body form is subject to —
definitions, `define-syntax`, `define-record-type`, and commands all behave identically, and source
order across the splice is preserved.

#### Scenario: A library body is included from a file

- **WHEN** a `define-library (mylib)` declares `(export greet)` and `(include "greet.scm")`, and
  `greet.scm` defines `greet`
- **THEN** the library compiles without error and importers see `greet`

#### Scenario: Included forms keep source order relative to the body

- **WHEN** a library body contains a definition, then `(include "more.scm")`, then a command that
  references a name `more.scm` defines
- **THEN** the command observes the included definition, because the splice happens at the position
  of the declaration

#### Scenario: `include-ci` folds case

- **WHEN** an included file names `(DEFINE (Greet) ...)` and the declaration is `(include-ci …)`
- **THEN** the form is read as `(define (greet) …)` and the library defines `greet`

#### Scenario: `include-ci` does not fold a bar-quoted identifier

- **WHEN** an included file contains `(define (|MixedCase|) 1)` and the declaration is
  `(include-ci …)`
- **THEN** the library defines `MixedCase`, not `mixedcase`, and a body form that calls
  `(|MixedCase|)` resolves to it

#### Scenario: A bar-quoted name survives while its body still folds

- **WHEN** an included file contains `(DEFINE (|KeepCase|) (QUOTE KEPT))` and the declaration is
  `(include-ci …)`
- **THEN** the library defines `KeepCase` and calling it yields the symbol `kept` — the name is
  left literal and the unquoted identifiers around it are folded

#### Scenario: Both doors fold an included file identically

- **WHEN** a library whose `include-ci` file mixes unquoted mixed-case and bar-quoted ASCII
  identifiers is compiled by the Chez driver and by the shipped compiler
- **THEN** both produce the same names, and the emitted IR agrees byte for byte where the existing
  cross-door equivalence checks compare it

#### Scenario: The same source includes identically on every door

- **WHEN** a library using `include` is compiled by the Chez driver, by `emit lib`, by `emit run`
  through the manifest, and by the REPL's library loader
- **THEN** all doors produce the same unit, and the emitted IR agrees byte for byte where the
  existing cross-door equivalence checks compare it
