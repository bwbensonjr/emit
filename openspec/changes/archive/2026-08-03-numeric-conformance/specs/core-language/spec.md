## MODIFIED Requirements

### Requirement: N-ary comparison operators

The comparison operators `=`, `<`, `>`, `<=`, and `>=` SHALL accept any number of
arguments as chained (pairwise) comparisons: for operands `a b c …` the result is the
conjunction `(op a b) ∧ (op b c) ∧ …`, short-circuiting to `#f` on the first false pair.
Each operand SHALL be evaluated exactly once, left to right. A comparison of fewer than
two arguments (`(op)` or `(op a)`) SHALL evaluate to `#t`. In **operator position** the
operators `>`, `<=`, and `>=` SHALL be derived in the frontend from the existing `<` and `=`
primitives (`(> x y)` = `(< y x)`, `(<= x y)` = `(or (< x y) (= x y))`,
`(>= x y)` = `(or (< y x) (= x y))`). This SHALL be a frontend expansion into `<` / `=`
primitive calls and `if`/`let` core forms, with no change to the runtime or the emitted
calling convention.

All five operators SHALL ALSO be bound in **value position**, evaluating to a variadic
procedure with the same chained semantics (see "Primitives usable as first-class values"), so
that `>`, `<=`, and `>=` can be passed to a higher-order procedure or applied to a list. A
value-position use SHALL NOT change how a call in operator position is compiled, and SHALL
agree with it on every result for every arity. The two are built in different
representations — the frontend expansion produces surface syntax before parsing, the
value-position procedure produces IL after it — so each SHALL derive its pairwise test from a
single per-operator rule stated in one place, with the correspondence between the two
recorded there, rather than from two independently written derivations.

#### Scenario: Chained less-than and equality

- **WHEN** a program evaluates `(< 1 2 3)`, `(< 1 3 2)`, and `(= 4 4 4)`
- **THEN** the results are `#t`, `#f`, and `#t`

#### Scenario: Derived greater-than and inclusive comparisons

- **WHEN** a program evaluates `(> 3 2 1)`, `(<= 1 1 2)`, and `(>= 3 3 2)`
- **THEN** the results are `#t`, `#t`, and `#t`

#### Scenario: Single evaluation of operands

- **WHEN** a program uses a middle operand with a side effect in an n-ary comparison,
  such as `(< 0 (begin (set! calls (+ calls 1)) 5) 10)` where `calls` starts at `0`
- **THEN** the comparison is `#t` and the operand runs exactly once (`calls` ends at `1`),
  even though the middle operand participates in two adjacent pairwise tests

#### Scenario: Trivial arity

- **WHEN** a program evaluates `(< 5)` and `(=)`
- **THEN** both results are `#t`

#### Scenario: Every comparison is a value

- **WHEN** a program evaluates `(map > (list 3 1) (list 2 4))`, `(apply >= (list 3 3 2))`,
  and `(apply <= (list 1 2 3))`
- **THEN** the results are `(#t #f)`, `#t`, and `#t` — no comparison operator is unbound in
  value position

### Requirement: Integer division primitives

The language SHALL provide `quotient` and `remainder` on integers with truncating-toward-zero
semantics: for integers n and d (d ≠ 0), `(quotient n d)` is n/d truncated toward zero and
`(remainder n d)` satisfies `(+ (* (quotient n d) d) (remainder n d))` = n. Division by zero
SHALL raise a runtime trap (consistent with other runtime errors).

Both procedures SHALL require **integer-valued** arguments and SHALL validate them before use.
An argument that is an integral flonum (for example `7.0`) SHALL be accepted, with inexactness
contagion making the result inexact. An argument that is a non-integral flonum, or that is not a
number at all, SHALL raise a runtime trap naming the operation. Neither procedure SHALL
reinterpret a non-fixnum argument's tagged representation as a fixnum payload, which would
return an unpredictable value derived from a heap address.

#### Scenario: quotient and remainder

- **WHEN** a program evaluates `(quotient 17 5)` and `(remainder 17 5)`
- **THEN** the results are `3` and `2`

#### Scenario: truncation toward zero with negatives

- **WHEN** a program evaluates `(quotient -17 5)` and `(remainder -17 5)`
- **THEN** the results are `-3` and `-2`

#### Scenario: Integral flonum arguments are accepted with contagion

- **WHEN** a program evaluates `(quotient 7.0 2)` and `(remainder 7.0 2)`
- **THEN** the results are the flonums `3.0` and `1.0`

#### Scenario: A non-integral or non-numeric argument traps

- **WHEN** a program evaluates `(quotient 7.5 2)`, `(remainder 7.5 2)`, or `(quotient 'a 2)`
  with no enclosing guard
- **THEN** each aborts via the runtime trap mechanism with a diagnostic naming the operation,
  rather than returning a value derived from the argument's tagged word

### Requirement: Flooring modulo

The language SHALL provide `modulo`, the flooring remainder, distinct from the
existing truncating `remainder`: for integers `n` and `d` (`d ≠ 0`), `(modulo n
d)` SHALL satisfy `(+ (* (floor (/ n d)) d) (modulo n d))` = `n` and SHALL have
the sign of the divisor `d` (or be zero). Division by zero SHALL raise a runtime
trap.

`modulo` SHALL require integer-valued arguments on the same terms as `quotient` and
`remainder`: an integral flonum is accepted with contagion, and a non-integral flonum or a
non-number raises a runtime trap.

#### Scenario: Non-negative operands

- **WHEN** a program evaluates `(modulo 17 5)` and `(modulo 5 5)`
- **THEN** the results are `2` and `0`

#### Scenario: Sign follows the divisor

- **WHEN** a program evaluates `(modulo -7 3)` and `(modulo 7 -3)`
- **THEN** the results are `2` and `-2` (the sign of the divisor), in contrast to
  `(remainder -7 3)` = `-1`

#### Scenario: Modulo by zero traps

- **WHEN** a program evaluates `(modulo 5 0)` with no enclosing guard
- **THEN** the computation aborts via the runtime trap mechanism

#### Scenario: Integral flonum accepted, non-integral trapped

- **WHEN** a program evaluates `(modulo 7.0 2)` and then `(modulo 7.5 2)` with no enclosing
  guard
- **THEN** the first is the flonum `1.0` and the second aborts via the runtime trap
  mechanism, rather than returning the fractional remainder `1.5`

### Requirement: Exact/inexact conversion

The language SHALL provide `exact->inexact`, converting an exact integer to the
flonum of the same value (and returning a flonum argument unchanged), and
`inexact->exact`, converting a flonum with an integer value to the exact fixnum of
that value (and returning a fixnum argument unchanged). `inexact->exact` of a
non-integral flonum SHALL raise a runtime trap (there are no exact rationals).
`inexact->exact` of a flonum whose value lies outside the fixnum range SHALL
likewise raise a runtime trap, rather than producing a truncated or wrapped
result — the conversion SHALL NOT rely on an out-of-range floating-point-to-integer
cast.

The language SHALL ALSO provide the R7RS spellings `inexact` and `exact` as equivalents of
`exact->inexact` and `inexact->exact` respectively, with identical behaviour including the
trap cases. The R5RS spellings SHALL be retained, so both names for each conversion are
available and neither is deprecated in this change.

#### Scenario: exact to inexact

- **WHEN** a program evaluates `(exact->inexact 3)` and `(inexact? (exact->inexact 3))`
- **THEN** the results are the flonum `3.0` and `#t`

#### Scenario: inexact to exact on an integral flonum

- **WHEN** a program evaluates `(inexact->exact 3.0)` and `(exact? (inexact->exact 3.0))`
- **THEN** the results are the fixnum `3` and `#t`

#### Scenario: inexact to exact on a non-integral flonum traps

- **WHEN** a program evaluates `(inexact->exact 2.5)` with no enclosing guard
- **THEN** the computation aborts via the runtime trap mechanism

#### Scenario: inexact to exact outside the fixnum range traps

- **WHEN** a program evaluates `(inexact->exact 1e30)` or
  `(inexact->exact (exact->inexact 1152921504606846975))` with no enclosing guard
- **THEN** the computation aborts via the runtime trap mechanism, rather than
  yielding `-1` or the most negative fixnum

#### Scenario: The R7RS spellings behave identically

- **WHEN** a program evaluates `(inexact 3)`, `(exact 3.0)`, and `(exact 2.5)` (the last with
  no enclosing guard)
- **THEN** the results are the flonum `3.0`, the fixnum `3`, and a runtime trap — matching
  `exact->inexact` and `inexact->exact` exactly

### Requirement: number->string for decimal integers

The standard prelude SHALL provide `(number->string n)` producing the base-10 signed decimal
text of the integer n, such that it round-trips with the reader's integer parsing.

`number->string` SHALL ALSO accept an optional radix argument: `(number->string n radix)` for
an exact integer n and a radix of 2, 8, 10, or 16 SHALL produce that radix's signed
representation, using lowercase digits above 9. A radix other than 10 with an inexact
argument SHALL raise an error, which R7RS permits, rather than producing a misleading
rendering. A radix other than 2, 8, 10, or 16 SHALL raise an error.

#### Scenario: positive and negative

- **WHEN** a program evaluates `(number->string 420)` and `(number->string -7)`
- **THEN** the results are the strings `"420"` and `"-7"`

#### Scenario: zero

- **WHEN** a program evaluates `(number->string 0)`
- **THEN** the result is the string `"0"`

#### Scenario: round-trips with the reader

- **WHEN** a program reads `(read-from-string (number->string n))` for an integer n in range
- **THEN** the result equals n

#### Scenario: Radix rendering of exact integers

- **WHEN** a program evaluates `(number->string 255 16)`, `(number->string 10 2)`, and
  `(number->string -8 8)`
- **THEN** the results are the strings `"ff"`, `"1010"`, and `"-10"`

#### Scenario: A non-decimal radix with an inexact argument is an error

- **WHEN** a program evaluates `(number->string 1.5 16)`
- **THEN** it raises an error rather than returning a string

### Requirement: Primitives usable as first-class values

The language SHALL allow a primitive to be used as a first-class value — at minimum `car`,
`cons`, `string-append`, and every comparison operator (`=`, `<`, `>`, `<=`, `>=`) — so it can
be passed to a higher-order procedure such as `map`, `apply`, or a fold. A primitive name
appearing in value (non-operator) position SHALL evaluate to a procedure with the primitive's
behavior, while a call in operator position SHALL continue to compile directly to the
primitive. `string-append` SHALL accept any number of arguments, whether
called directly (`(string-append a b c …)`) or via `apply`, with zero arguments yielding the
empty string. The comparison operators SHALL likewise accept any number of arguments in value
position, with the chained semantics of the "N-ary comparison operators" requirement.

A name whose value-position procedure is synthesized (rather than being a runtime primitive of
its own) SHALL NOT thereby acquire a direct-call lowering that could reorder or reinterpret its
operands: where the value-position procedure is derived from a different primitive than the name
suggests — as `>` is from `<` — a call in operator position SHALL be compiled only through the
frontend expansion, never by substituting the underlying primitive for the name.

This SHALL be achieved without any construct in the standard prelude that behaves
differently under the bootstrap host than under Emit, so the prelude continues to load and
run directly under the bootstrap host.

#### Scenario: Primitive passed to a higher-order procedure

- **WHEN** a program evaluates `(map car (list (cons 1 2) (cons 3 4)))`
- **THEN** it yields `(1 3)` — `car` resolves as a value — and a direct `(car (cons 1 2))` still
  compiles to the primitive

#### Scenario: string-append for any arity, direct or applied

- **WHEN** a program evaluates `(string-append "a" "b" "c")`, `(apply string-append (list "a" "b"
  "c"))`, and `(string-append)`
- **THEN** the results are `"abc"`, `"abc"`, and `""` respectively

#### Scenario: A derived comparison keeps its operand order as a value

- **WHEN** a program evaluates `(map > (list 3 1) (list 2 4))` and `(> 3 2)`
- **THEN** the results are `(#t #f)` and `#t` — the value-position `>` compares in the same
  direction as the operator-position `>`

### Requirement: Additional standard prelude procedures

The standard prelude SHALL provide the following procedures, with their conventional
R7RS/Scheme semantics, defined over the existing primitives and library:

- `andmap` — returns `#t` iff a predicate holds for every element of a list (short-circuits).
- `memp` — returns the first tail of a list whose head satisfies a predicate, else `#f`.
- `for-each` — applies a procedure to each element for effect, returning an unspecified value.
- `cadddr` — the fourth element accessor (`(car (cdddr x))`).
- `list?` — `#t` iff its argument is a proper list.
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

## ADDED Requirements

### Requirement: Variadic max and min with inexactness contagion

The standard prelude SHALL provide `max` and `min` as **variadic** procedures over one or more
numeric arguments, returning the largest and smallest argument respectively. A call with no
arguments SHALL raise an error. A non-numeric argument SHALL raise a runtime trap.

Both SHALL implement R7RS inexactness contagion: if **any** argument is inexact, the result
SHALL be inexact, even when the winning argument is exact. Comparison SHALL be by numeric value
across the exactness boundary, so an exact and an inexact argument of equal value compare equal
and either may be returned (converted to inexact per the contagion rule).

#### Scenario: Variadic over exact arguments

- **WHEN** a program evaluates `(max 1 2 3)`, `(min 1 2 3)`, `(max 5)`, and `(min -1 -2)`
- **THEN** the results are the exact `3`, `1`, `5`, and `-2`

#### Scenario: Contagion when the winning argument is inexact

- **WHEN** a program evaluates `(max 3 4.0)` and `(min 3.0 4)`
- **THEN** the results are the flonums `4.0` and `3.0`

#### Scenario: Contagion when the winning argument is exact

- **WHEN** a program evaluates `(max 3.0 4)` and `(min 3 4.0)`
- **THEN** the results are the flonums `4.0` and `3.0` — inexact, because an inexact argument
  was present, even though the argument that won the comparison was exact

#### Scenario: Both are first-class and applicable

- **WHEN** a program evaluates `(apply max (list 1 7 3))` and `(map min (list 1 5) (list 4 2))`
- **THEN** the results are `7` and `(1 2)`

### Requirement: Numeric type and parity predicates

The standard prelude SHALL provide the R7RS numeric predicates `complex?`, `rational?`,
`exact-integer?`, `positive?`, `negative?`, `odd?`, and `even?`, alongside the existing
`number?`, `real?`, `integer?`, `exact?`, `inexact?`, and `zero?`.

Given that Emit's numeric tower is real-only with exact integers, these SHALL be defined as:
`complex?` is equivalent to `number?`; `rational?` is true for a finite real and false for an
infinity or a NaN; `exact-integer?` is true for an exact integer only. `positive?` and
`negative?` SHALL accept any real. `odd?` and `even?` SHALL require an integer-valued argument
and SHALL raise a runtime trap for a non-integral one, on the same terms as the integer-division
family. Every one of these predicates SHALL raise a runtime trap for a non-numeric argument.

#### Scenario: Tower predicates over both types

- **WHEN** a program evaluates `(complex? 3)`, `(rational? 3.5)`, `(exact-integer? 3)`, and
  `(exact-integer? 3.0)`
- **THEN** the results are `#t`, `#t`, `#t`, and `#f`

#### Scenario: rational? is false for non-finite values

- **WHEN** a program evaluates `(rational? (/ 1.0 0.0))` and `(rational? (- (/ 1.0 0.0) (/ 1.0 0.0)))`
- **THEN** both results are `#f`

#### Scenario: Sign and parity

- **WHEN** a program evaluates `(positive? 3)`, `(negative? -3.5)`, `(odd? 7)`, `(even? 7)`,
  and `(even? 8.0)`
- **THEN** the results are `#t`, `#t`, `#t`, `#f`, and `#t`

#### Scenario: Parity of a non-integral argument traps

- **WHEN** a program evaluates `(odd? 7.5)` with no enclosing guard
- **THEN** the computation aborts via the runtime trap mechanism

### Requirement: Integer arithmetic procedures

The standard prelude SHALL provide `abs`, `gcd`, `lcm`, `square`, `expt`, and
`exact-integer-sqrt` with R7RS semantics. `gcd` and `lcm` SHALL be variadic, returning `0` and
`1` respectively for no arguments, and SHALL operate on the absolute values of their arguments
so the result is non-negative.

Each SHALL return an **exact** result for exact arguments, per R7RS §6.2.3. `expt` with an
exact base and a non-negative exact integer exponent SHALL be exact; with a negative exponent
it SHALL return an inexact result, since Emit has no exact rationals — the same allowance `/`
uses for a non-integral exact quotient. `(expt 0 0)` SHALL be `1`. A result that leaves the
fixnum range SHALL raise the overflow diagnostic, not a wrapped value — including
`(abs n)` for the most negative fixnum, whose magnitude is one past the range.

`exact-integer-sqrt` SHALL accept a non-negative exact integer and return **two values**: the
largest exact integer `s` with `s² ≤ n`, and the remainder `n − s²`.

#### Scenario: Absolute value, square, and powers

- **WHEN** a program evaluates `(abs -7)`, `(abs -7.5)`, `(square 5)`, `(expt 2 10)`, and
  `(expt 2.0 0.5)`
- **THEN** the results are `7`, `7.5`, `25`, the exact `1024`, and a flonum approximating
  `1.4142135623730951`

#### Scenario: Exactness of gcd and lcm

- **WHEN** a program evaluates `(gcd 32 -36)`, `(gcd)`, `(lcm 32 -36)`, `(lcm)`, and
  `(gcd 12 18 27)`
- **THEN** the results are the exact `4`, `0`, `288`, `1`, and `3`

#### Scenario: A negative exponent yields an inexact result

- **WHEN** a program evaluates `(expt 2 -1)`
- **THEN** the result is the flonum `0.5`, not an error and not an exact rational

#### Scenario: exact-integer-sqrt returns two values

- **WHEN** a program evaluates `(call-with-values (lambda () (exact-integer-sqrt 17)) list)`
- **THEN** the result is the list `(4 1)`

#### Scenario: Overflow in the new procedures traps

- **WHEN** a program evaluates `(abs -1152921504606846976)` or `(expt 2 61)` with no enclosing
  guard
- **THEN** each aborts via the fixnum-overflow diagnostic rather than returning a wrapped value

### Requirement: Rounding procedures

The standard prelude SHALL provide `floor`, `ceiling`, `truncate`, and `round`, each returning
an integer-valued number of the **same exactness** as its argument: an exact argument SHALL
return that exact integer unchanged (an exact integer is already rounded), and an inexact
argument SHALL return an integral flonum. `round` SHALL round to **even** on a tie, per R7RS
§6.2.6 — not away from zero. A non-numeric argument SHALL raise a runtime trap.

Rounding an inexact argument SHALL NOT route through the exact-integer range: a magnitude too
large to be a fixnum SHALL round to itself as a flonum rather than raising an overflow
diagnostic.

#### Scenario: The four roundings of a positive and a negative value

- **WHEN** a program evaluates `(floor 2.7)`, `(ceiling 2.1)`, `(truncate -2.7)`, and
  `(round 2.7)`
- **THEN** the results are the flonums `2.0`, `3.0`, `-2.0`, and `3.0`

#### Scenario: Ties round to even

- **WHEN** a program evaluates `(round 2.5)`, `(round 3.5)`, and `(round -2.5)`
- **THEN** the results are the flonums `2.0`, `4.0`, and `-2.0`

#### Scenario: An exact argument is returned exactly

- **WHEN** a program evaluates `(floor 5)`, `(round 5)`, and `(exact? (round 5))`
- **THEN** the results are `5`, `5`, and `#t`

#### Scenario: A large-magnitude flonum rounds without overflow

- **WHEN** a program evaluates `(floor 1e30)`
- **THEN** the result is the flonum `1e30`, with no overflow diagnostic

### Requirement: R7RS integer division operators

The standard prelude SHALL provide the R7RS §6.2.6 division operators over the existing
truncating and flooring primitives: `truncate/`, `truncate-quotient`, `truncate-remainder`,
`floor/`, `floor-quotient`, and `floor-remainder`.

`truncate-quotient` and `truncate-remainder` SHALL be equivalent to `quotient` and `remainder`;
`floor-remainder` SHALL be equivalent to `modulo`; and `floor-quotient` SHALL be the quotient
rounded toward negative infinity. `truncate/` and `floor/` SHALL each return **two values** —
the corresponding quotient and remainder. All six SHALL inherit the argument-domain rules of
the integer-division family (integral flonums accepted with contagion, other non-integers and
non-numbers trapped) and SHALL trap on division by zero.

#### Scenario: Truncating operators agree with quotient and remainder

- **WHEN** a program evaluates `(truncate-quotient -17 5)` and `(truncate-remainder -17 5)`
- **THEN** the results are `-3` and `-2`, matching `(quotient -17 5)` and `(remainder -17 5)`

#### Scenario: Flooring operators round toward negative infinity

- **WHEN** a program evaluates `(floor-quotient -17 5)` and `(floor-remainder -17 5)`
- **THEN** the results are `-4` and `3`, the latter matching `(modulo -17 5)`

#### Scenario: The two-value forms

- **WHEN** a program evaluates `(call-with-values (lambda () (floor/ -17 5)) list)` and
  `(call-with-values (lambda () (truncate/ -17 5)) list)`
- **THEN** the results are the lists `(-4 3)` and `(-3 -2)`

#### Scenario: Division by zero traps

- **WHEN** a program evaluates `(floor/ 5 0)` with no enclosing guard
- **THEN** the computation aborts via the runtime trap mechanism

### Requirement: Rational parts of an integer-valued number

The standard prelude SHALL provide `numerator` and `denominator`, restricted to
**integer-valued** arguments: for an exact integer n they SHALL return n and the exact `1`; for
an integral flonum they SHALL return that flonum and the flonum `1.0`. A non-integral argument
SHALL raise a runtime trap, since Emit represents no exact rationals and a best-effort rational
reconstruction of a double would be misleading. A non-numeric argument SHALL raise a runtime
trap.

#### Scenario: Exact integer parts

- **WHEN** a program evaluates `(numerator 7)` and `(denominator 7)`
- **THEN** the results are the exact `7` and `1`

#### Scenario: Integral flonum parts stay inexact

- **WHEN** a program evaluates `(numerator 7.0)` and `(denominator 7.0)`
- **THEN** the results are the flonums `7.0` and `1.0`

#### Scenario: A non-integral argument traps

- **WHEN** a program evaluates `(denominator 0.5)` with no enclosing guard
- **THEN** the computation aborts via the runtime trap mechanism

### Requirement: string->number parses numeric text

The standard prelude SHALL provide `(string->number s)` and `(string->number s radix)`,
returning the number `s` denotes, or `#f` — **not** an error — when `s` is not a valid number in
the given radix. It SHALL be the inverse of `number->string` for every value that procedure
produces, so `(string->number (number->string n))` equals `n` for any number n, and likewise
with a matching radix argument.

`string->number` SHALL share the reader's numeric grammar and parsers rather than defining a
second, independently drifting one, so that any token the reader accepts as a number is accepted
here identically. The default radix SHALL be 10; radices 2, 8, 10, and 16 SHALL be accepted for
exact integers. An inexact result SHALL require radix 10; a non-decimal radix applied to
non-integer text SHALL raise an error, which R7RS permits.

#### Scenario: Integers, flonums, and failure

- **WHEN** a program evaluates `(string->number "42")`, `(string->number "-2.5")`,
  `(string->number "abc")`, and `(string->number "")`
- **THEN** the results are `42`, the flonum `-2.5`, `#f`, and `#f`

#### Scenario: Radix parsing

- **WHEN** a program evaluates `(string->number "ff" 16)`, `(string->number "1010" 2)`, and
  `(string->number "ff" 10)`
- **THEN** the results are `255`, `10`, and `#f`

#### Scenario: Round-trips with number->string

- **WHEN** a program evaluates `(string->number (number->string 1234))`,
  `(string->number (number->string -2.5))`, and
  `(string->number (number->string 255 16) 16)`
- **THEN** the results are `1234`, the flonum `-2.5`, and `255`

### Requirement: The reader accepts the non-finite numeric tokens

Both readers — the prelude's `read-from-string`/`read` and the bootstrap reader the compiler
uses on its own source — SHALL recognize the three non-finite numeric tokens `+inf.0`, `-inf.0`,
and `+nan.0` as **numbers**, producing positive infinity, negative infinity, and a NaN
respectively, rather than interning them as symbols.

This SHALL close the write/read round trip for every value the printer can produce: since
`(/ 1.0 0.0)` prints as `+inf.0`, feeding a program's own output back through the reader SHALL
NOT silently turn a number into an identifier. Both readers SHALL agree, so a datum has the same
meaning on every door.

#### Scenario: The non-finite tokens read as numbers

- **WHEN** a program evaluates `(number? (read-from-string "+inf.0"))`,
  `(number? (read-from-string "-inf.0"))`, and `(number? (read-from-string "+nan.0"))`
- **THEN** all three results are `#t`, and none of the three is a symbol

#### Scenario: Round trip through write and read

- **WHEN** a program divides `1.0` by `0.0`, prints the result, and reads that text back
- **THEN** the value read is a number equal to the original infinity, not the symbol `+inf.0`

#### Scenario: Both doors agree

- **WHEN** the same source containing `+inf.0` is read by the prelude reader and by the
  bootstrap reader
- **THEN** both produce the same numeric datum
