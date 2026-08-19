## ADDED Requirements

### Requirement: Datum labels reconstruct shared and cyclic data

Every public reader route SHALL accept R7RS datum labels: `#<n>=<datum>` SHALL bind the
non-negative decimal label `<n>` to the datum it prefixes, and a later `#<n>#` in the same
outermost datum SHALL return the identical object. Labels SHALL reconstruct shared references and
cycles through pairs and vectors, including labels nested in either aggregate.

A label's scope SHALL be the portion of one outermost datum to the right of its definition. Label
bindings SHALL NOT leak into the next datum read from a source or port. A forward reference, a
duplicate definition in one scope, a definition whose value is only its own reference, an
unfinished definition, or malformed label syntax SHALL be reported as a read error rather than
producing a partial datum or trapping outside the reader's error path.

#### Scenario: A circular pair is reconstructed

- **WHEN** a program reads `#0=(1 . #0#)`
- **THEN** the result is a pair whose car is `1` and whose cdr is `eq?` to the pair itself

#### Scenario: A shared reference preserves identity

- **WHEN** a program reads `(#0=(1 2 3) #0#)`
- **THEN** the two elements are `eq?`, not merely structurally equal

#### Scenario: A cycle through a vector is reconstructed

- **WHEN** a program reads `#0=#(a #0#)`
- **THEN** element 1 of the resulting vector is `eq?` to the vector itself

#### Scenario: Label scope ends with the outermost datum

- **WHEN** two successive reads from one port read `#0=(a)` and then `#0#`
- **THEN** the first read succeeds and the second reports an unresolved-label read error

#### Scenario: Invalid label forms are read errors

- **WHEN** a program separately reads a forward reference, a duplicate label definition, the form
  `#0=#0#`, a definition with no following datum, and a label without decimal digits
- **THEN** each is reported as a read error and none returns a partial datum

#### Scenario: Cyclic write output reads back

- **WHEN** a program writes a cyclic pair or vector to a string port and reads the resulting text
- **THEN** the read datum has the same finite content and cycle topology as the original

### Requirement: Reader case directives persist through their source

The reader SHALL recognize `#!fold-case` and `#!no-fold-case` anywhere a comment is permitted,
provided the directive is followed by a delimiter. A directive SHALL act as intertoken space and
change the case-folding state for all subsequent data from the same source or port until another
directive changes it. The initial state SHALL be case-sensitive for ordinary reader entries and
case-folding for `read-all-from-string-ci`; explicit directives SHALL override either initial state.

While folding is enabled, bare identifiers and character names SHALL be case-folded during
tokenization. Numeric text, strings, the contents of bar-quoted identifiers, and single-character
character literals SHALL remain unchanged. The existing implementation limit to ASCII case folding
SHALL continue to apply.

#### Scenario: Folding persists across successive port reads

- **WHEN** a program reads twice from a port containing `#!fold-case ABC DEF`
- **THEN** the results are the symbols `abc` and `def`

#### Scenario: No-fold restores the default

- **WHEN** a program reads `#!fold-case ABC #!no-fold-case DEF`
- **THEN** the subsequent symbols are `abc` and `DEF`

#### Scenario: A directive applies inside an outer datum and afterward

- **WHEN** a source contains `(A #!fold-case B) C`
- **THEN** it reads as `(A b)` followed by `c`

#### Scenario: Literal spellings remain literal while folding

- **WHEN** folding is enabled while reading `|MixedCase|`, a string, a number, and a
  single-character character literal
- **THEN** none of those values is changed by folding

#### Scenario: Named characters follow reader case state

- **WHEN** a program reads `#!fold-case #\SPACE`
- **THEN** it returns the space character

## MODIFIED Requirements

### Requirement: Every datum the reader reads is usable as a quoted constant

A datum that the reader is required to read SHALL be usable as a quoted constant in compiled code.
Specifically, vector (`#(...)`) and bytevector (`#u8(...)`) literals and datum-labelled shared or
cyclic structures SHALL compile as constants — under `quote`, under the `'` abbreviation, and
nested to any depth inside another quoted datum. Their values SHALL have the same content and, for
datum labels, the same shared/cyclic object topology as the datum produced by the runtime reader.

This SHALL hold on every door and in every position a constant may appear: a program's top level, a
procedure body, a library body, and a macro template.

Elements SHALL be lowered by the same constant encoding as any other quoted datum, so a vector may
hold symbols, strings, characters, booleans, numbers, pairs, the empty list, and further vectors or
bytevectors. Recursive aggregates SHALL be allocated before their edges are filled so a back-edge
can refer to the already allocated object rather than recursively encoding forever.

A constant the compiler cannot lower SHALL be reported with the datum named in the diagnostic, not
with a placeholder.

#### Scenario: A quoted vector constant compiles and evaluates

- **WHEN** a program evaluates `(display '#(1 2))`
- **THEN** it prints `#(1 2)`

#### Scenario: A quoted bytevector constant compiles and evaluates

- **WHEN** a program evaluates `(display (quote #u8(1 2)))`
- **THEN** it prints `#u8(1 2)`

#### Scenario: A vector constant nested in a quoted pair

- **WHEN** a program evaluates `(display (car (quote (#(a) b))))`
- **THEN** it prints `#(a)`

#### Scenario: A vector constant holds heterogeneous elements

- **WHEN** a program evaluates `(display '#(a "s" #\c #t 1 2.5 () (p . q) #(n)))`
- **THEN** it prints that vector's external representation, with every element preserved

#### Scenario: A constant vector equals the runtime-built one

- **WHEN** a program evaluates `(equal? '#(1 2 3) (vector 1 2 3))`
- **THEN** the result is `#t`

#### Scenario: A vector constant in a library body

- **WHEN** a library body defines a procedure returning a quoted vector, and a program imports that
  library and calls it
- **THEN** the library compiles and the program prints the vector

#### Scenario: A labelled circular constant compiles

- **WHEN** a program evaluates `(let ((x '#0=(a . #0#))) (eq? x (cdr x)))`
- **THEN** it returns `#t` on the REPL/JIT and in a standalone executable, without the compiler
  recursing forever

#### Scenario: A labelled shared constant retains identity

- **WHEN** a program evaluates `(let ((x '(#0=(a) #0#))) (eq? (car x) (cadr x)))`
- **THEN** it returns `#t`

#### Scenario: An unlowerable constant names itself

- **WHEN** the compiler reaches a constant it has no encoding for
- **THEN** the diagnostic names that datum's external representation rather than printing `?`

### Requirement: Structural equality

The compiler SHALL provide `equal?`, a structural equality predicate. `equal?` SHALL return
`#t` when its two arguments are `eqv?`; when both are pairs whose cars and cdrs are
recursively `equal?`; when both are vectors of the same length whose corresponding elements are
recursively `equal?`; or when both are strings or bytevectors with identical content. Otherwise it
SHALL return `#f`.

`equal?` SHALL terminate for cyclic pair and vector graphs. During one comparison, revisiting the
same ordered pair of aggregate objects SHALL count that subcomparison as equal, so structurally
equivalent cycles compare true while a differing reachable value or aggregate shape still compares
false. Records and other opaque objects SHALL retain their existing identity-only equality.

#### Scenario: Nested list structure by value

- **WHEN** a program evaluates `(equal? (list 1 (list 2 3)) (quote (1 (2 3))))`
- **THEN** the result is `#t`

#### Scenario: Strings compared by content, not identity

- **WHEN** a program evaluates `(equal? (substring "xhello" 1 6) "hello")`
- **THEN** the result is `#t` (the two strings are distinct objects with equal content)

#### Scenario: Unequal structure

- **WHEN** a program evaluates `(equal? (quote (1 2)) (quote (1 2 3)))`
- **THEN** the result is `#f`

#### Scenario: Equivalent pair cycles compare equal

- **WHEN** a program constructs two distinct circular pair graphs with the same reachable values
  and compares them with `equal?`
- **THEN** the result is `#t` and the comparison terminates

#### Scenario: Unequal pair cycles compare false

- **WHEN** two circular pair graphs contain a differing reachable value
- **THEN** `equal?` returns `#f` and terminates

#### Scenario: Cyclic vectors terminate

- **WHEN** a program compares two separately allocated vectors that each refer to themselves, and
  separately compares them after placing a differing value in one vector
- **THEN** the results are `#t` and `#f`, and both comparisons terminate

### Requirement: Additional standard prelude procedures

The standard prelude SHALL provide the following procedures, with their conventional
R7RS/Scheme semantics, defined over the existing primitives and library:

- `andmap` — returns `#t` iff a predicate holds for every element of a list (short-circuits).
- `memp` — returns the first tail of a list whose head satisfies a predicate, else `#f`.
- `for-each` — applies a procedure to each element for effect, returning an unspecified value.
- `cadddr` — the fourth element accessor (`(car (cdddr x))`).
- `list?` — `#t` iff its argument is a proper list; a circular cdr chain is not a proper list and
  SHALL return `#f` rather than failing to terminate.
- `list-ref`, `list-tail`, `list-head` — indexed element, the sublist after `n` elements, and
  the sublist of the first `n` elements.
- `make-list` — a list of `n` copies of a fill value.
- `iota` — the list `(0 1 … n-1)` for a count `n`.
- `max`, `min` — the largest and smallest of their numeric arguments, variadic, per the
  "Variadic max and min with inexactness contagion" requirement.
- `zero?` — `#t` iff its argument is `0`.
- `void` — returns the unspecified value.
- `string` — constructs a string from its character arguments.

These complete the library surface the compiler core depends on. User-wins shadowing applies: a
program that defines any of these names overrides the prelude definition.

#### Scenario: List utilities compute standard results

- **WHEN** a program evaluates `(andmap odd? (list 1 3 5))`, `(memp even? (list 1 2 3))`,
  `(list-ref (list 'a 'b 'c) 1)`, and `(iota 3)`
- **THEN** the results are `#t`, `(2 3)`, `b`, and `(0 1 2)` respectively

#### Scenario: Misc utilities

- **WHEN** a program evaluates `(max 2 5)`, `(zero? 0)`, and `(string #\h #\i)`
- **THEN** the results are `5`, `#t`, and `"hi"` respectively

#### Scenario: Circular cdr chains are not lists

- **WHEN** a program makes a pair's cdr point to itself and applies `list?`
- **THEN** `list?` returns `#f` and terminates
