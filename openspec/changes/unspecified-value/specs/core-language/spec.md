## ADDED Requirements

### Requirement: The unspecified value is one distinguished immediate

The language SHALL have exactly one **unspecified value**: a single, unique value returned wherever
this specification says a form or procedure "returns the unspecified value," and wherever R7RS leaves
a return value unspecified.

The unspecified value SHALL be:

- **Distinct.** It SHALL NOT be `eqv?` to `#f`, `#t`, `()`, `0`, the empty string, any character, any
  symbol, or any other value in the language. `(eqv? UNSPEC UNSPEC)` SHALL be `#t`.
- **Truthy.** Being distinct from `#f`, it SHALL count as true in every conditional test position.
- **Exactly one value.** Every site that yields it SHALL yield precisely one value, never zero and
  never several. R7RS §7.3 requires this; the R⁶RS latitude to return zero values SHALL NOT be taken.
- **An immediate.** It SHALL be represented as a tagged immediate word requiring no heap allocation
  and no header word, so it is trivially GC-safe under both the AOT and JIT paths.
- **Reader-inaccessible.** There SHALL be no reader syntax for it. It is not a datum, so no program
  text can denote it directly; it is obtained only by evaluating a form that yields it.
- **Written non-readably.** `write` and `display` SHALL both render it as `#<unspecified>`.

The language SHALL NOT provide a predicate that tests for the unspecified value. No `unspecified?`,
`void?`, or equivalent SHALL be added to the primitive layer or the prelude. Programs SHALL NOT rely on
which value is returned by any construct whose result this specification calls unspecified; the value
is an implementation choice that may change, and the absence of a predicate is deliberate.

`void` SHALL remain the generator: a nullary prelude procedure returning the unspecified value, so a
program can explicitly declare that a procedure has no interesting result.

#### Scenario: The unspecified value is distinct from every other value

- **WHEN** a program evaluates `(list (eqv? (if #f #f) #f) (eqv? (if #f #f) (quote ())) (eqv? (if #f #f) (if #f #f)))`
- **THEN** it yields `(#f #f #t)` — the unspecified value is neither `#f` nor the empty list, and is
  `eqv?` to itself

#### Scenario: The unspecified value is truthy

- **WHEN** a program evaluates `(if (if #f #f) (quote a) (quote b))`
- **THEN** it yields `a`, because the unspecified value is not `#f`

#### Scenario: Every unspecified-result site yields the same value

- **WHEN** a program evaluates `(list (eqv? (void) (if #f #f)) (eqv? (void) (when #f 1)) (eqv? (void) (newline)) (eqv? (void) (vector-set! (make-vector 1 0) 0 1)))`
- **THEN** it yields `(#t #t #t #t)` — the syntactic forms, the prelude, and the side-effecting
  primitives all return the one unspecified value, with no `#f`/`()` split between the Scheme and C
  sides

#### Scenario: The unspecified value prints non-readably

- **WHEN** a program evaluates `(begin (write (if #f #f)) (newline) (display (if #f #f)))`
- **THEN** it prints `#<unspecified>` twice, once per line

#### Scenario: There is no reader syntax for the unspecified value

- **WHEN** a program contains the literal text `#<unspecified>`, `#!unspecified`, or `#void`
- **THEN** the reader SHALL NOT produce the unspecified value from it

#### Scenario: No predicate for the unspecified value is provided

- **WHEN** a program references `unspecified?` or `void?` without defining it
- **THEN** the name is unbound — the language provides no such predicate

## MODIFIED Requirements

### Requirement: Two-armed if

The language SHALL accept a two-armed conditional `(if test then)` as equivalent to
`(if test then UNSPEC)`, where `UNSPEC` is the unspecified value as fixed by the requirement **The
unspecified value is one distinguished immediate** — a single distinguished immediate, distinct from
`#f`. When `test` is false and no alternative is given, the expression SHALL evaluate
to that unspecified value rather than being treated as a procedure call to `if`. Three-armed
`(if test then else)` SHALL be unaffected. This makes the `case` derived form's no-match
default and the `(if #f #f)` unspecified-value idiom valid throughout the language, including
in the compiler core itself.

Note that `(if #f #f)` remains the idiomatic way to *write* the unspecified value, but it no longer
*denotes* `#f`: the two-armed form and the `(if #f #f)` idiom both yield the distinguished immediate.

#### Scenario: False test with no alternative yields the unspecified value

- **WHEN** a program evaluates `(if #f 1)`
- **THEN** it yields the unspecified value — identical to `(if #f #f)` — and does not error as
  an unbound `if` reference

#### Scenario: case with no matching key and no else

- **WHEN** a program evaluates `(case 9 ((1 2) 'a) ((3 4) 'b))` (no match, no `else` clause)
- **THEN** it compiles and yields the unspecified value (the macro's `(if #f #f)` default now
  parses)

#### Scenario: The two-armed default is not #f

- **WHEN** a program evaluates `(eqv? (if #f 1) #f)`
- **THEN** it yields `#f`, because the two-armed default is the distinguished unspecified value
  rather than the boolean `#f`
