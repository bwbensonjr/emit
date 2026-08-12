## ADDED Requirements

### Requirement: Vector and bytevector literals are self-evaluating

A vector or bytevector literal SHALL be self-evaluating in expression position, evaluating to
itself with no `quote`, per R7RS 4.1.2 ("vector constants are self-evaluating") and 4.1.1. The
value SHALL be identical to the value the quoted spelling produces, so `#(1 2 3)` and `'#(1 2 3)`
denote the same constant and both compile to the same constant reference.

#### Scenario: Bare vector literal evaluates to itself

- **WHEN** a program evaluates `(vector-ref #(1 2 3) 0)`
- **THEN** the result is `1`, and no `quote` was required

#### Scenario: Bare bytevector literal evaluates to itself

- **WHEN** a program evaluates `(bytevector-u8-ref #u8(1 2 3) 1)`
- **THEN** the result is `2`

#### Scenario: Quoted and bare spellings agree

- **WHEN** a program evaluates `(equal? #(1 2 3) (quote #(1 2 3)))`
- **THEN** the result is `#t`

#### Scenario: Empty literals

- **WHEN** a program evaluates `(vector-length #())` and `(bytevector-length #u8())`
- **THEN** both results are `0`

### Requirement: String ordering comparisons

The compiler SHALL provide `string<?`, `string<=?`, `string>?`, and `string>=?`. Each SHALL accept
two or more strings and SHALL return `#t` iff the strings, ordered lexicographically by codepoint,
satisfy the relation pairwise across the whole argument list (chained comparison), otherwise `#f`.
Ordering SHALL be by codepoint sequence, comparing position by position, with a proper prefix
ordering before any string that extends it.

#### Scenario: Lexicographic ordering

- **WHEN** a program evaluates `(string<? "abc" "abd")` and `(string<? "abd" "abc")`
- **THEN** the results are `#t` and `#f`

#### Scenario: A prefix precedes its extension

- **WHEN** a program evaluates `(string<? "ab" "abc")`
- **THEN** the result is `#t`

#### Scenario: Chained comparison

- **WHEN** a program evaluates `(string<? "a" "b" "c")` and `(string<? "a" "c" "b")`
- **THEN** the results are `#t` and `#f`

#### Scenario: Inclusive relations admit equality

- **WHEN** a program evaluates `(string<=? "abc" "abc")` and `(string>? "abc" "abc")`
- **THEN** the results are `#t` and `#f`

### Requirement: Vector bulk operations

The compiler SHALL provide `vector->list`, `vector-copy`, `vector-append`, `vector-fill!`,
`vector-copy!`, `vector-map`, and `vector-for-each`. `(vector->list v [start [end]])` SHALL return
a list of the elements in `[start, end)`, defaulting to the whole vector. `(vector-copy v [start
[end]])` SHALL return a fresh vector of that range. `(vector-append v …)` SHALL return a fresh
vector concatenating its arguments in order. `(vector-fill! v fill [start [end]])` SHALL store
`fill` into that range in place. `(vector-copy! to at from [start [end]])` SHALL copy that range of
`from` into `to` beginning at index `at`, in place, and SHALL behave correctly when `to` and `from`
are the same vector and the ranges overlap. `(vector-map f v …)` SHALL return a fresh vector of `f`
applied elementwise, stopping at the shortest argument; `(vector-for-each f v …)` SHALL apply `f`
elementwise for effect, in ascending index order, and return an unspecified value.

Every range argument SHALL be bounds-checked on the same terms as `vector-ref`: an out-of-range or
inverted range is a diagnostic, never an unchecked access.

#### Scenario: vector->list with and without a range

- **WHEN** a program evaluates `(vector->list #(1 2 3))` and `(vector->list #(1 2 3) 1)`
- **THEN** the results are `(1 2 3)` and `(2 3)`

#### Scenario: Copy and append are fresh

- **WHEN** a program evaluates `(let ((v #(1 2))) (vector-set! (vector-copy v) 0 9) (vector-ref v 0))`
- **THEN** the result is `1` (the original is untouched)

#### Scenario: vector-append concatenates in order

- **WHEN** a program evaluates `(vector->list (vector-append #(1) #(2 3)))`
- **THEN** the result is `(1 2 3)`

#### Scenario: vector-fill! over a sub-range

- **WHEN** a program evaluates `(let ((v (make-vector 4 0))) (vector-fill! v 7 1 3) (vector->list v))`
- **THEN** the result is `(0 7 7 0)`

#### Scenario: vector-copy! with overlapping ranges in one vector

- **WHEN** a program evaluates `(let ((v (vector 1 2 3 4 5))) (vector-copy! v 0 v 1 4) (vector->list v))`
- **THEN** the result is `(2 3 4 4 5)`

#### Scenario: vector-map and vector-for-each

- **WHEN** a program evaluates `(vector->list (vector-map + #(1 2) #(10 20)))`
- **THEN** the result is `(11 22)`

#### Scenario: A range outside the vector is a diagnostic

- **WHEN** a program evaluates `(vector-copy #(1 2) 0 5)`
- **THEN** the program reports a range diagnostic and does not read out of bounds

### Requirement: String and vector interconversion and bulk string operations

The compiler SHALL provide `string->vector`, `vector->string`, `string-map`, `string-for-each`,
`string-fill!`, and `string-copy!`. `(string->vector s [start [end]])` SHALL return a fresh vector
of the characters in that range; `(vector->string v [start [end]])` SHALL return a fresh string of
the characters in that range of `v`. `(string-map f s …)` SHALL return a fresh string of `f`
applied to corresponding characters, stopping at the shortest argument; `(string-for-each f s …)`
SHALL apply `f` for effect in ascending index order and return an unspecified value.
`(string-fill! s fill [start [end]])` SHALL store the character `fill` into that range in place;
`(string-copy! to at from [start [end]])` SHALL copy that range of `from` into `to` beginning at
`at`, in place, correctly when the ranges overlap in one string.

Indices SHALL be measured in codepoints, consistent with `string-ref`, and SHALL be bounds-checked.

#### Scenario: string->vector and back

- **WHEN** a program evaluates `(vector->string (string->vector "abc"))`
- **THEN** the result is the string `"abc"`

#### Scenario: string-map

- **WHEN** a program evaluates `(string-map (lambda (c) (integer->char (+ 1 (char->integer c)))) "abc")`
- **THEN** the result is the string `"bcd"`

#### Scenario: string-for-each visits in order

- **WHEN** a program applies `string-for-each` over `"abc"` accumulating each character onto a list
- **THEN** the characters were visited in ascending index order

#### Scenario: string-fill! over a sub-range

- **WHEN** a program evaluates `(let ((s (make-string 4 #\a))) (string-fill! s #\b 1 3) s)`
- **THEN** the result is the string `"abba"`

#### Scenario: Non-ASCII content survives conversion

- **WHEN** a program evaluates `(vector->string (string->vector "héllo"))`
- **THEN** the result is the string `"héllo"` (codepoint content preserved)

### Requirement: List operations assv and list-copy

The compiler SHALL provide `assv` and `list-copy`. `assv` SHALL return the first pair
of an association list whose car is `eqv?` to the key, or `#f`, completing the
`assq`/`assv`/`assoc` family. `(list-copy obj)` SHALL return a copy of `obj` with freshly allocated
pairs and the same elements; a non-pair argument SHALL be returned unchanged, and an improper list
SHALL be copied with its tail preserved.

`list-set!` is deliberately NOT included: it mutates a pair, and mutable pairs do not exist yet
(`set-car!`/`set-cdr!` are absent). It SHALL arrive with them.

#### Scenario: assv finds by eqv?

- **WHEN** a program evaluates `(assv 2 (quote ((1 a) (2 b))))`
- **THEN** the result is `(2 b)`

#### Scenario: list-copy allocates fresh pairs

- **WHEN** a program evaluates `(let* ((a (list 1 2)) (b (list-copy a))) (list (equal? a b) (eq? a b)))`
- **THEN** the result is `(#t #f)`

#### Scenario: list-copy of a non-pair

- **WHEN** a program evaluates `(list-copy 7)`
- **THEN** the result is `7`

### Requirement: Type and equivalence predicates procedure?, boolean=?, symbol=?

The compiler SHALL provide `procedure?`, `boolean=?`, and `symbol=?`. `(procedure? x)` SHALL return
`#t` iff `x` can be called as a procedure, which SHALL include a primitive used as a first-class
value. `procedure?` SHALL be answered by a primitive tag test rather than derived, since no
existing primitive distinguishes a closure from another heap object. `(boolean=? b1 b2 b3 …)` and `(symbol=? s1 s2 s3 …)` SHALL each accept two or more arguments
of their type and return `#t` iff all are the same boolean, respectively the same symbol.

#### Scenario: procedure? on a lambda and a primitive value

- **WHEN** a program evaluates `(list (procedure? (lambda (x) x)) (procedure? car) (procedure? 7))`
- **THEN** the result is `(#t #t #f)`

#### Scenario: boolean=? and symbol=? are chained

- **WHEN** a program evaluates `(boolean=? #t #t #t)` and `(symbol=? 'a 'a 'b)`
- **THEN** the results are `#t` and `#f`

### Requirement: Bytevector bulk operations

The compiler SHALL provide `bytevector-copy`, `bytevector-copy!`, and `bytevector-append`, with the
range and aliasing behaviour of their vector counterparts: `(bytevector-copy bv [start [end]])`
returns a fresh bytevector of that range, `(bytevector-copy! to at from [start [end]])` copies in
place and behaves correctly on overlap, and `(bytevector-append bv …)` returns a fresh bytevector
concatenating its arguments in order. Ranges SHALL be bounds-checked.

#### Scenario: Copy a sub-range

- **WHEN** a program evaluates `(bytevector-length (bytevector-copy #u8(1 2 3 4) 1 3))`
- **THEN** the result is `2`

#### Scenario: Append in order

- **WHEN** a program evaluates `(bytevector-u8-ref (bytevector-append #u8(1) #u8(2 3)) 2)`
- **THEN** the result is `3`

#### Scenario: Overlapping copy within one bytevector

- **WHEN** a program copies a range of a bytevector onto an overlapping range of itself
- **THEN** the result is as if the source range had been read in full before any byte was written

### Requirement: rationalize

The compiler SHALL provide `rationalize`. `(rationalize x y)` SHALL return the simplest number
differing from `x` by no more than `y`, where simplest is R7RS 6.2.6's ordering. Since Emit
represents no exact rationals, the exact case SHALL be restricted to arguments for which the
simplest answer is an exact integer, and the inexact case SHALL return a flonum; an exact call
whose simplest answer is not an integer SHALL raise the same diagnostic Emit already raises for a
non-integral exact result, rather than returning a wrong answer.

#### Scenario: Inexact rationalize

- **WHEN** a program evaluates `(rationalize 0.3 0.1)`
- **THEN** the result is the flonum `0.3333333333333333` (R7RS's `#i1/3`)

#### Scenario: Exact rationalize with an integral answer

- **WHEN** a program evaluates `(rationalize 7 3)`
- **THEN** the result is the exact integer `4` (the simplest value in `[4, 10]`, verified against Chez)

#### Scenario: Exact rationalize with no integral answer is a diagnostic

- **WHEN** a program evaluates a `rationalize` call whose simplest exact answer is not an integer
- **THEN** the program reports the no-exact-rationals diagnostic rather than returning a rounded value

## MODIFIED Requirements

### Requirement: Structural list search (member, assoc)

The compiler SHALL provide `member` and `assoc`, the structural analogues of `memq` and
`assq`. `member` SHALL return the first tail of the list whose head is `equal?` to the key,
or `#f`. `assoc` SHALL return the first pair in an association list whose car is `equal?` to
the key, or `#f`.

Each SHALL additionally accept an optional third argument, a `compare` procedure used in place of
`equal?`, per R7RS 6.4. When supplied, `compare` SHALL be called as `(compare key element)` for
`member` and `(compare key (car pair))` for `assoc` — the key first — and the search SHALL stop at
the first element for which `compare` returns a true value.

#### Scenario: member finds by value

- **WHEN** a program evaluates `(member (list 2) (quote ((1) (2) (3))))`
- **THEN** the result is `((2) (3))`

#### Scenario: assoc finds by value

- **WHEN** a program evaluates `(assoc "b" (quote (("a" . 1) ("b" . 2))))`
- **THEN** the result is `("b" . 2)`

#### Scenario: member with a supplied comparison

- **WHEN** a program evaluates `(member 2.0 (quote (1 2 3)) =)`
- **THEN** the result is `(2 3)`

#### Scenario: assoc with a supplied comparison

- **WHEN** a program evaluates `(assoc 2.0 (quote ((1 a) (2 b))) =)`
- **THEN** the result is `(2 b)`

#### Scenario: The key is the first argument to compare

- **WHEN** a program calls `member` with a `compare` that records its argument order
- **THEN** `compare` was called with the key first and the list element second

### Requirement: String content equality

The compiler SHALL provide `string=?`, which compares strings and returns `#t` iff they
have identical codepoint content, otherwise `#f`. Comparison is by content, not object
identity.

`string=?` SHALL accept two or more strings and SHALL return `#t` iff every argument has identical
content, pairwise across the whole argument list (chained comparison), per R7RS 6.7.

#### Scenario: Equal content, distinct objects

- **WHEN** a program evaluates `(string=? (substring "xhello" 1 6) "hello")`
- **THEN** the result is `#t`

#### Scenario: Unequal content

- **WHEN** a program evaluates `(string=? "abc" "abd")`
- **THEN** the result is `#f`

#### Scenario: Chained equality

- **WHEN** a program evaluates `(string=? "a" "a" "a")` and `(string=? "a" "a" "b")`
- **THEN** the results are `#t` and `#f`

### Requirement: String construction procedures

The compiler SHALL provide `string-append`, `symbol->string`, `list->string`, and
`make-string`. `string-append` SHALL return a new string that is the concatenation of its
string arguments. `symbol->string` SHALL return a fresh string of the symbol's name.
`list->string` SHALL return a string built from a list of characters, in order.
`(make-string k [ch])` SHALL return a string of `k` copies of the character `ch`; the fill
character SHALL be optional, and when omitted the contents are unspecified but the string SHALL
have length `k` and SHALL be safe to read and to mutate. The results
are immutable strings; codepoint content round-trips through UTF-8, including non-ASCII.

#### Scenario: Append and symbol->string

- **WHEN** a program evaluates `(string-append "foo" (symbol->string (quote bar)))`
- **THEN** the result is the string `"foobar"`

#### Scenario: make-string

- **WHEN** a program evaluates `(make-string 3 #\x)`
- **THEN** the result is the string `"xxx"`

#### Scenario: make-string without a fill character

- **WHEN** a program evaluates `(string-length (make-string 3))`
- **THEN** the result is `3`

#### Scenario: string->list / list->string round-trip

- **WHEN** a program evaluates `(list->string (string->list "héllo"))`
- **THEN** the result is the string `"héllo"` (codepoint content preserved)

### Requirement: String to character list

The compiler SHALL provide `string->list`, which returns a list of the characters of a
string, in codepoint order.

`(string->list s [start [end]])` SHALL accept an optional codepoint range and return the characters
in `[start, end)`, defaulting `start` to 0 and `end` to the string length. The range SHALL be
bounds-checked on the same terms as `string-ref`.

#### Scenario: Decompose a string

- **WHEN** a program evaluates `(string->list "ab")`
- **THEN** the result is the list `(#\a #\b)`

#### Scenario: Decompose a sub-range

- **WHEN** a program evaluates `(string->list "abcd" 1 3)`
- **THEN** the result is the list `(#\b #\c)`

#### Scenario: An out-of-range end is a diagnostic

- **WHEN** a program evaluates `(string->list "ab" 0 5)`
- **THEN** the program reports a range diagnostic

### Requirement: Vector data type and operations

The compiler SHALL provide a mutable, fixed-length vector data type and the operations
`make-vector`, `vector`, `vector-ref`, `vector-set!`, `vector-length`, `vector?`, and
`list->vector`. `(make-vector k [fill])` SHALL return a vector of `k` elements each initialized
to `fill`; the fill SHALL be optional, and when omitted the elements are unspecified but the
vector SHALL have length `k` and SHALL be safe to read and to mutate. `(vector e …)` SHALL return a
vector of its arguments in order. `(vector-ref v i)`
SHALL return the `i`-th element (0-based). `(vector-set! v i x)` SHALL replace the `i`-th
element with `x` in place. `(vector-length v)` SHALL return the element count as a fixnum.
`(vector? x)` SHALL return `#t` iff `x` is a vector. `(list->vector xs)` SHALL return a vector
of the list's elements in order. Out-of-range indices are a diagnostic, never an unchecked access.

#### Scenario: Construct and index

- **WHEN** a program evaluates `(vector-ref (vector 10 20 30) 1)`
- **THEN** the result is `20`

#### Scenario: Length

- **WHEN** a program evaluates `(vector-length (make-vector 4 0))`
- **THEN** the result is `4`

#### Scenario: make-vector without a fill

- **WHEN** a program evaluates `(vector-length (make-vector 4))`
- **THEN** the result is `4`

#### Scenario: Mutation

- **WHEN** a program evaluates `(let ((v (make-vector 2 0))) (vector-set! v 0 99) (vector-ref v 0))`
- **THEN** the result is `99`

#### Scenario: Predicate

- **WHEN** a program evaluates `(vector? (vector 1))` and `(vector? (quote (1)))`
- **THEN** the results are `#t` and `#f`

### Requirement: In-place string mutation

The compiler SHALL provide `string-set!` and `string-copy`. `(string-set! s i ch)` SHALL
replace the character at codepoint index `i` of string `s` with character `ch`, in place, for
any character — including one whose UTF-8 encoding differs in byte length from the character it
replaces — and SHALL preserve the identity of the string object so that all aliases observe the
change. `(string-copy s [start [end]])` SHALL return a fresh string with the content of the
codepoint range `[start, end)` — defaulting to the whole string — that can be mutated
independently of `s`. Ranges SHALL be bounds-checked on the same terms as `string-ref`, and
mutating a string literal is undefined (use `string-copy` or `make-string` for a mutable target).

#### Scenario: Set a character in place

- **WHEN** a program evaluates `(let ((s (make-string 3 #\a))) (string-set! s 1 #\b) s)`
- **THEN** the result is the string `"aba"`

#### Scenario: Replacement changes byte length (ASCII to multibyte)

- **WHEN** a program evaluates
  `(let ((s (make-string 2 #\a))) (string-set! s 0 #\é) (list (string-length s) (string-ref s 0)))`
- **THEN** the result is `(2 #\é)` (length stays 2 codepoints; index 0 is the multibyte character)

#### Scenario: Mutation is visible through an alias

- **WHEN** a program evaluates
  `(let* ((s (make-string 1 #\x)) (t s)) (string-set! s 0 #\y) (string-ref t 0))`
- **THEN** the result is `#\y` (the alias `t` sees the mutation)

#### Scenario: string-copy is independent

- **WHEN** a program evaluates
  `(let* ((s (make-string 1 #\x)) (c (string-copy s))) (string-set! c 0 #\z) (string-ref s 0))`
- **THEN** the result is `#\x` (mutating the copy leaves the original unchanged)

#### Scenario: Copy a sub-range

- **WHEN** a program evaluates `(string-copy "abcd" 1 3)`
- **THEN** the result is the string `"bc"`

#### Scenario: An out-of-range copy is a diagnostic

- **WHEN** a program evaluates `(string-copy "ab" 0 5)`
- **THEN** the program reports a range diagnostic
