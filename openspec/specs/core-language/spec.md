# core-language Specification

## Purpose

Defines the M1 core-lambda subset of Scheme that the compiler accepts and the runtime
guarantees for programs written in it: the supported data types, special forms, and
primitives, and the requirement that tail calls execute in bounded stack space.
## Requirements
### Requirement: Compile and run the M1 core-lambda subset

The compiler SHALL accept a **program consisting of a sequence of one or more top-level
forms** over the M1 core subset — fixnums, booleans, the empty list, and pairs; the
forms `quote`, `if`, `lambda`, application, `let`, `letrec`, `begin`, `set!`, and
top-level `define` (both `(define x e)` and the `(define (f arg ...) body ...)` lambda
shorthand); and the primitives `+ - * = <`, `cons`, `car`, `cdr`, `null?`, `pair?`,
`eq?`, `eqv?`, `not` — and compile it to a native executable that computes the program's value. The
**value of a program is the value of its last top-level expression**; a program of a
single expression (the M1 case) is the one-form instance of this rule.

#### Scenario: Recursive arithmetic

- **WHEN** a tail-recursive `fact`-style program over fixnums, `if`, `letrec`, and
  arithmetic primitives is compiled and run
- **THEN** the executable produces the mathematically correct result

#### Scenario: Allocation and pairs

- **WHEN** a program builds and traverses a list via `cons`, `car`, `cdr`, and `null?`
- **THEN** the executable produces the correct result, with pairs heap-allocated under
  Boehm GC

#### Scenario: Assignment

- **WHEN** a program uses `set!` on a captured variable (exercising assignment
  conversion)
- **THEN** the executable produces the correct result and no `set!` survives into the
  emitted IR

#### Scenario: Multi-form program with top-level define

- **WHEN** a program of several top-level forms — top-level `define`s (including the
  `(define (f arg ...) ...)` procedure shorthand) that refer to one another, followed by
  a trailing expression — is compiled and run
- **THEN** the executable produces the value of the last top-level expression, with the
  definitions mutually visible (as under `letrec`)

#### Scenario: Single-expression program still valid

- **WHEN** a program consisting of exactly one top-level expression (no `define`) is
  compiled and run
- **THEN** the executable produces that expression's value, matching M1 behavior

### Requirement: Proper tail calls run in bounded stack

Calls in tail position SHALL be compiled as guaranteed tail calls (`musttail`), so that
tail-recursive loops execute in constant stack space.

#### Scenario: Deep tail loop does not overflow

- **WHEN** a tail-recursive loop iterating a large number of times (beyond the native
  stack depth) is compiled and run
- **THEN** the executable completes and returns the correct result without stack overflow

### Requirement: Support derived syntactic forms

The compiler SHALL accept the derived forms `cond`, `and`, `or`, `when`, `unless`,
`let*`, and named `let`, and SHALL compile each with the same semantics as its expansion
into the core language — including short-circuit evaluation for `and`/`or`, single
evaluation of each `or` operand, and preservation of tail position for the final form of
a selected branch. `cond`, `and`, `or`, `when`, `unless`, and `let*` SHALL be realized as
`syntax-rules` macros carried by the standard prelude and rewritten by the source→source
`expand` stage prior to core parsing (rather than hardwired into `expand`); `cond` SHALL
additionally support `else`, `=>`, and bare-test clauses. Named `let` SHALL be recognized
structurally by `expand` (it overloads the core `let` keyword and so cannot be a distinct
macro). `define-syntax` and `syntax-rules` are reserved keywords. Because the macro-based
forms are supplied by the prelude, compiling with the prelude disabled does not provide
them.

#### Scenario: Multi-way cond

- **WHEN** a program uses `(cond [test body ...] ... [else body ...])` with several
  clauses
- **THEN** the executable selects the first clause whose test is true (or the `else`
  clause) and produces that clause body's value

#### Scenario: cond => and bare-test clauses

- **WHEN** a program uses a `(cond (test => proc) ...)` clause or a bare-test `(cond
  (test) ...)` clause
- **THEN** the `=>` clause applies `proc` to the test value (evaluated once) when the test
  is true, and the bare-test clause yields the test value when it is true

#### Scenario: Short-circuit and / or

- **WHEN** a program uses `(and a b ...)` and `(or a b ...)`
- **THEN** `and` yields `#f` at the first false operand (otherwise the last operand's
  value) and `or` yields the first true operand's value (otherwise `#f`), with each
  operand evaluated at most once

#### Scenario: when / unless

- **WHEN** a program uses `(when test body ...)` and `(unless test body ...)`
- **THEN** the guarded body runs only when the condition is (respectively) true or false,
  and its value is the body's value

#### Scenario: Sequential let*

- **WHEN** a program uses `(let* ([x e1] [y e2]) body ...)` where `e2` refers to `x`
- **THEN** the bindings take effect left-to-right and the executable produces the correct
  result

#### Scenario: Named let loop

- **WHEN** a tail-recursive loop written with named `let`
  (`(let loop ([i n]) (if ... (loop ...) ...))`) is compiled and run
- **THEN** the executable produces the correct result and the loop runs in bounded stack
  (the expansion to `letrec` preserves the tail call)

### Requirement: N-ary arithmetic operators

The arithmetic operators `+`, `-`, `*`, and `/` SHALL accept any number of
arguments and evaluate to the same result as the left-folded binary application,
with the standard identities: `(+)` = 0, `(*)` = 1, `(- a)` = negation of `a`,
`(/ a)` = `(/ 1 a)`. `(-)` and `(/)` with no arguments are compile-time errors.
The n-ary-to-binary reduction SHALL be a frontend expansion into binary primitive
calls, with no change to the emitted calling convention; the binary operations
themselves follow the numeric tower (fixnum-exact, flonum-contagious — see the
"Numeric tower with fixnum/flonum contagion" and "Real division" requirements).

#### Scenario: N-ary sum and product

- **WHEN** a program evaluates `(+ 1 2 3 4)` and `(* 2 3 4)`
- **THEN** the results are `10` and `24`

#### Scenario: Left-associative subtraction and unary negation

- **WHEN** a program evaluates `(- 10 1 2)` and `(- 5)`
- **THEN** the results are `7` and `-5`

#### Scenario: Left-associative division

- **WHEN** a program evaluates `(/ 24 2 3)` and `(/ 2.0)`
- **THEN** the results are the fixnum `4` and the flonum `0.5`

#### Scenario: Identities

- **WHEN** a program evaluates `(+)` and `(*)`
- **THEN** the results are `0` and `1`

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

### Requirement: N-ary identity predicates

The identity predicates `eq?` and `eqv?` SHALL accept any number of arguments as chained
(pairwise) comparisons: for operands `a b c …` the result is the conjunction
`(op a b) ∧ (op b c) ∧ …`, short-circuiting to `#f` on the first false pair. Each operand
SHALL be evaluated exactly once, left to right. A comparison of fewer than two arguments
(`(op)` or `(op a)`) SHALL evaluate to `#t`. This SHALL be a frontend expansion into
binary `eq?` / `eqv?` primitive calls, reusing the comparison-chaining mechanism, with no
change to the runtime calling convention.

#### Scenario: Chained identity comparison

- **WHEN** a program evaluates `(eq? 'a 'a 'a)` and `(eq? 'a 'a 'b)`
- **THEN** the results are `#t` and `#f`

#### Scenario: Single evaluation of operands

- **WHEN** a program uses a middle operand with a side effect in an n-ary `eq?`,
  such as `(eq? 1 (begin (set! calls (+ calls 1)) 1) 1)` where `calls` starts at `0`
- **THEN** the comparison is `#t` and the operand runs exactly once (`calls` ends at `1`)

#### Scenario: Trivial arity

- **WHEN** a program evaluates `(eqv? 5)` and `(eq?)`
- **THEN** both results are `#t`

### Requirement: Character interning

Characters SHALL be **immediate** tagged values: the Unicode scalar value is encoded
directly in the tagged word, with no heap allocation and no intern table. Because equal
codepoints produce the identical immediate word, two characters with the same codepoint
SHALL be the same value regardless of how each was constructed (a `#\c` literal,
`(integer->char n)`, or `(string-ref s i)`). Consequently `eq?` and `eqv?` SHALL return
`#t` for characters with equal codepoints and `#f` for characters with different codepoints.
As immediates, characters are trivially GC-safe (they are never heap objects) under both the
AOT and JIT backends.

#### Scenario: Equal characters are identical

- **WHEN** a program evaluates `(eqv? #\a #\a)` and `(eq? #\a #\a)`
- **THEN** both results are `#t`

#### Scenario: Identity across construction paths

- **WHEN** a program evaluates `(eq? #\A (integer->char 65))` and
  `(eq? (string-ref "A" 0) #\A)`
- **THEN** both results are `#t`

#### Scenario: Distinct characters differ

- **WHEN** a program evaluates `(eqv? #\a #\b)`
- **THEN** the result is `#f`

### Requirement: eqv? primitive

The compiler SHALL provide `eqv?` as an equivalence operation that returns `#t`
when its two arguments are equivalent, and `#f` otherwise. `eqv?` SHALL hold for
fixnums (immediate), interned symbols, and immediate characters (equal codepoints
are the same immediate word), and SHALL compare flonums **by value** — two flonums
are `eqv?` when they denote the same inexact real, even when they are distinct
heap objects. `eqv?` SHALL return `#f` across the exact/inexact boundary: a fixnum
and a flonum are never `eqv?` (while `=` compares them numerically). `eqv?` SHALL
be exposed as an ordinary, first-class, shadowable binding in the always-present
primitive layer, defined over a reserved raw primcall (`%eqv?`); a direct,
unshadowed call SHALL still compile to the bare primitive operation (see the
`primitive-layer` capability). It SHALL NOT require importing `(scheme base)`.

#### Scenario: eqv? on fixnums, symbols, and characters

- **WHEN** a program evaluates `(eqv? 3 3)`, `(eqv? 3 4)`, `(eqv? 'x 'x)`, and
  `(eqv? #\a #\a)`
- **THEN** the results are `#t`, `#f`, `#t`, and `#t`

#### Scenario: eqv? compares flonums by value

- **WHEN** a program evaluates `(eqv? 2.5 2.5)`, `(eqv? 2.5 (+ 1.0 1.5))`, and
  `(eqv? 2.5 2.75)`
- **THEN** the results are `#t`, `#t`, and `#f`

#### Scenario: eqv? separates exact from inexact

- **WHEN** a program evaluates `(eqv? 2 2.0)`
- **THEN** the result is `#f` (a fixnum and a flonum are never `eqv?`), even though
  `(= 2 2.0)` is `#t`

#### Scenario: eqv? is first-class and shadowable

- **WHEN** a program evaluates `(map eqv? (list 1 2) (list 1 9))`, or defines
  `(define (eqv? a b) 'mine)`
- **THEN** `eqv?` behaves as an ordinary procedure value, and a user definition shadows it
  (user-wins), like any other binding

### Requirement: not primitive

The compiler SHALL provide `not` as a boolean-negation operation that returns `#t` when its
argument is `#f` and `#f` for every other value. `not` SHALL be exposed as an ordinary,
first-class, shadowable binding in the always-present primitive layer, defined over a reserved
raw primcall; a direct, unshadowed call SHALL still compile to the bare primitive operation
(see the `primitive-layer` capability). It SHALL NOT require importing `(scheme base)`.

#### Scenario: Boolean negation

- **WHEN** a program evaluates `(not #f)`, `(not #t)`, and `(not 0)`
- **THEN** the results are `#t`, `#f`, and `#f` (only `#f` is false)

#### Scenario: not is first-class and shadowable

- **WHEN** a program evaluates `(map not (list #f 0 #t))`, or defines `(define (not x) 'mine)`
- **THEN** `not` behaves as an ordinary procedure value, and a user definition shadows it
  (user-wins), like any other binding

### Requirement: Reserved-keyword status is limited to raw primitive operators

Plain primitive names (`cons`, `+`, `car`, `not`, `eqv?`, …) SHALL NOT be reserved keywords;
they SHALL be ordinary, rebindable bindings. Only the raw `%`-prefixed primitive operators
and the genuine syntactic keywords (`lambda`, `if`, `let`, `letrec`, `quote`, `set!`,
`define`, `define-syntax`, `syntax-rules`, and the derived-form macros) SHALL be reserved.
The M1 documentation and any requirement that previously described a plain primitive name as a
"reserved primitive (not rebindable)" is superseded by this requirement together with the
`primitive-layer` capability.

#### Scenario: A plain primitive name can be rebound

- **WHEN** a program or the REPL binds a plain primitive name (`(define (car x) …)`, or a
  lexical `let` over `+`)
- **THEN** the binding is accepted and shadows the primitive in scope, with no
  reserved-keyword error

### Requirement: Variadic procedures, rest parameters, and apply

The compiler SHALL accept variadic `lambda` forms — dotted rest parameters
`(lambda (a b . rest) …)` and an all-arguments rest `(lambda args …)` — binding the rest
parameter to a proper list of the excess arguments. The compiler SHALL support `apply`
(`(apply f a1 … aN lst)`), passing `a1 … aN` followed by the elements of `lst` as the
arguments to `f`, for lists of arbitrary length. Fixed-arity procedures SHALL be
arity-checked at call time: a mismatch SHALL be reported via the runtime trap mechanism, and is
therefore catchable by a handler like any other condition about data.

**`apply`'s final argument SHALL be a proper list**, and one that is not — a non-list, or a list
whose tail is not `()` — SHALL be reported and the computation aborted. It SHALL NOT be treated as
the empty list, and the call SHALL NOT proceed with only the proper prefix of an improper list.

#### Scenario: Dotted rest parameter

- **WHEN** a program calls `((lambda (a b . rest) rest) 1 2 3 4)`
- **THEN** the result is the list `(3 4)` and calling with exactly the fixed args yields
  the empty list

#### Scenario: All-arguments variadic

- **WHEN** a program defines `(define (list* . xs) xs)` and calls `(list* 1 2 3)`
- **THEN** the result is the list `(1 2 3)`

#### Scenario: Apply over a runtime list

- **WHEN** a program evaluates `(apply f 1 2 lst)` where `lst` is a runtime-built list
  longer than the maximum fixed arity
- **THEN** `f` receives `1`, `2`, and every element of `lst` as arguments, and the result
  is correct

#### Scenario: Apply with a non-list final argument is reported

- **WHEN** a program evaluates `(apply + 3)`, and separately `(apply + 3 4)`
- **THEN** each aborts with a diagnostic rather than returning `0` and `3` by treating the final
  argument as the empty list

#### Scenario: Apply with an improper final list is reported

- **WHEN** a program evaluates `(apply + (quote (2 3 . 4)))`
- **THEN** the computation aborts with a diagnostic rather than returning `5` from the list's proper
  prefix

#### Scenario: Arity mismatch is reported

- **WHEN** a fixed-arity procedure is called with the wrong number of arguments and no handler is
  installed
- **THEN** the program reports an arity error and exits non-zero (rather than silently
  computing a wrong result)

#### Scenario: Arity mismatch reaches an installed handler

- **WHEN** the same mismatched call is made inside a `guard`
- **THEN** the handler runs and receives an error object carrying the arity diagnostic

#### Scenario: Tail calls still bounded

- **WHEN** a tail-recursive fixed-arity loop is compiled after this change
- **THEN** it still compiles as `musttail` and runs in bounded stack, and its hot path
  performs no rest-list allocation

### Requirement: Symbols and quoted structure

The compiler SHALL support symbols as a first-class data type: symbols are interned (two
symbols with the same name are `eq?`), and are printed by name. The compiler SHALL support
`quote` of a symbol and `quote` of arbitrary list/atom structure (nested pairs whose
elements are symbols, fixnums, booleans, `()`, or further pairs).

#### Scenario: Quoted symbol and eq?

- **WHEN** a program evaluates `(eq? (quote foo) (quote foo))` and `(eq? (quote foo) (quote bar))`
- **THEN** the results are `#t` and `#f` (symbols with the same name are identical)

#### Scenario: Quoted list structure

- **WHEN** a program evaluates `(quote (a (b c) 1))` and traverses it with `car`/`cdr`
- **THEN** it is a proper list whose elements are the symbol `a`, the list `(b c)`, and the
  fixnum `1`, printing as `(a (b c) 1)`

#### Scenario: Symbol printed by name

- **WHEN** a program's value is a symbol (e.g. `(quote hello)`)
- **THEN** the executable prints `hello`

### Requirement: Quasiquote construction

The compiler SHALL support `quasiquote` with `unquote` and `unquote-splicing` over list
structure. A quasiquoted datum SHALL evaluate to that structure as a constant, except that an
`unquote`d subform SHALL be replaced by the value of its expression and an `unquote-splicing`d
subform SHALL have the elements of its (list) value spliced into the enclosing list. Nesting
SHALL be respected: an `unquote`/`unquote-splicing` takes effect only at the matching
quasiquote level. The reader SHALL accept the sugar `` `x `` for `(quasiquote x)`, `,x` for
`(unquote x)`, and `,@x` for `(unquote-splicing x)`.

#### Scenario: Unquote a value into a list

- **WHEN** a program evaluates `` (let ((x 2)) `(a ,x b)) ``
- **THEN** the result is `(a 2 b)`

#### Scenario: Splice a list into a list

- **WHEN** a program evaluates `` (let ((ys (list 1 2))) `(0 ,@ys 3)) ``
- **THEN** the result is `(0 1 2 3)`

#### Scenario: Quasiquote with no unquotes is constant

- **WHEN** a program evaluates `` `(a b c) ``
- **THEN** the result is `(a b c)`

#### Scenario: Nested quasiquote

- **WHEN** a program evaluates `` (car `(a `(b ,(+ 1 2)))) ``
- **THEN** the result is the symbol `a` and the inner quasiquote is left intact (the `,(+ 1 2)`
  is not evaluated at the outer level)

### Requirement: Strings and characters

The compiler SHALL support strings and characters as first-class data types. String and
character literals SHALL be self-evaluating (`"foo"` evaluates to that string, `#\a` to
that character, with no `quote`). Characters SHALL be Unicode codepoints and strings SHALL
be Unicode text (stored as UTF-8); both SHALL round-trip and print faithfully for non-ASCII
content. Strings and characters SHALL be printable — a string as its contents in double
quotes, a character as `#\` followed by the character — and SHALL be usable as elements of
quoted list structure.

#### Scenario: String literal value

- **WHEN** a program's value is the string literal `"hello"`
- **THEN** the executable prints `"hello"`

#### Scenario: Character literal value

- **WHEN** a program's value is the character literal `#\a`
- **THEN** the executable prints `#\a`

#### Scenario: Strings and characters inside quoted structure

- **WHEN** a program evaluates `(quote (a "b" #\c))` and traverses it with `car`/`cdr`
- **THEN** it is a proper list whose elements are the symbol `a`, the string `"b"`, and the
  character `#\c`, printing as `(a "b" #\c)`

#### Scenario: Non-ASCII string and character

- **WHEN** a program's value is a non-ASCII string literal (e.g. `"héllo 日本語"`) or a
  non-ASCII character literal (e.g. `#\λ`)
- **THEN** the string prints with its UTF-8 contents intact between double quotes and the
  character prints as `#\` followed by its UTF-8 encoding (`#\λ`)

### Requirement: String and character operations

The compiler SHALL provide operations over the string and character data types:
`char->integer` and `integer->char` (between a character and its Unicode codepoint),
`string-length`, `string-ref`, `substring`, and `string->symbol`. String length and
indexing SHALL be measured in **Unicode codepoints** (not bytes), so `string-ref` returns
the requested character and `string-length` equals the character count. `string->symbol`
SHALL return the interned symbol of the string's text, so it is `eq?` to a symbol literal
of the same name.

These operations SHALL meet the following complexity guarantees, without changing any
observable result:

- `string-length` SHALL be O(1) for every string (the codepoint count is stored, not
  recomputed on each call).
- `string-ref` and `substring` SHALL be O(1) for strings whose codepoint count equals their
  UTF-8 byte length (i.e. all-ASCII strings), since codepoint index equals byte offset.
- For strings containing multi-byte codepoints, a full left-to-right indexed traversal
  (`string-ref` at each index 0…n−1) SHALL be O(n) amortized rather than O(n²): the
  implementation MAY build, at most once per string and only on first random access, an
  auxiliary codepoint→byte index so that each subsequent access is sublinear. Sequential
  forward iteration remains O(1) per step.

The auxiliary index (if built) SHALL be internal and unobservable — it changes performance
only, never the value returned by any operation, `eq?`/`equal?` identity, or printed form.

#### Scenario: Character and codepoint conversion

- **WHEN** a program evaluates `(char->integer #\A)` and `(integer->char 97)`
- **THEN** the results are the fixnum `65` and the character `#\a`

#### Scenario: String length and reference

- **WHEN** a program evaluates `(string-length "abc")` and `(string-ref "abc" 1)`
- **THEN** the results are `3` and the character `#\b`

#### Scenario: Substring

- **WHEN** a program evaluates `(substring "hello" 1 4)`
- **THEN** the result is the string `"ell"`

#### Scenario: Codepoint indexing over non-ASCII text

- **WHEN** a program evaluates `(string-length "héllo")` and `(string-ref "héllo" 1)`
- **THEN** the results are `5` and the character `#\é` (indexing counts codepoints, not
  UTF-8 bytes)

#### Scenario: Indexed access is stable across the whole string

- **WHEN** a program indexes every position of a multi-byte string in turn — e.g. it
  collects `(string-ref "héllo 日本語" i)` for `i` from `0` to `(- (string-length "héllo 日本語") 1)`
- **THEN** it obtains exactly the characters `#\h #\é #\l #\l #\o #\space #\日 #\本 #\語`
  in order, with each `string-ref` returning the codepoint at that index regardless of the
  access order or of any internally cached index

#### Scenario: string->symbol interns

- **WHEN** a program evaluates `(eq? (string->symbol "foo") (quote foo))`
- **THEN** the result is `#t`

### Requirement: Standard library prelude procedures

The compiler SHALL provide a set of standard list and boolean procedures, defined in Scheme
in the prelude and available to every program: `not`, `list` (variadic), `length`,
`reverse`, `append` (variadic — zero or more lists), `map` and `for-each` (variadic — a
procedure plus one or more lists, walked in lockstep and stopping at the shortest), `memq`,
and `assq`. Their behavior SHALL match the usual Scheme semantics (`memq`/`assq` compare with
`eq?`). The variadic `map`/`for-each`/`append` are required for the compiler to compile its
own source: the core uses multi-list `map`/`for-each` (e.g. `rename`'s `(map cons names new)`,
`emit`'s `(for-each … slots (iota k))`) and three-argument `append` (e.g. `emit-code-def`'s
argument declarations). Chez's built-ins are variadic, so matching them keeps self-compilation
faithful; the single-list/two-argument forms remain the common fast path.

#### Scenario: List construction and mapping

- **WHEN** a program evaluates `(map (lambda (x) (* x x)) (list 1 2 3))`
- **THEN** the result is the list `(1 4 9)`

#### Scenario: Multi-list map

- **WHEN** a program evaluates `(map (lambda (a b) (+ a b)) (list 10 20 30) (list 1 2 3))`
- **THEN** the result is the list `(11 22 33)` (the procedure is applied to corresponding
  elements of each list, stopping at the shortest)

#### Scenario: Variadic append

- **WHEN** a program evaluates `(append (list 1) (list 2) (list 3))`
- **THEN** the result is the list `(1 2 3)`

#### Scenario: Reverse and length

- **WHEN** a program evaluates `(length (reverse (list 1 2 3)))` and `(reverse (list 1 2 3))`
- **THEN** the results are `3` and the list `(3 2 1)`

#### Scenario: Association and membership

- **WHEN** a program evaluates `(assq (quote b) (list (list (quote a) 1) (list (quote b) 2)))`
  and `(memq 2 (list 1 2 3))`
- **THEN** `assq` returns the pair for `b` and `memq` returns the sublist starting at `2`

### Requirement: Read data from source text

The compiler SHALL provide `read-from-string`, which parses a source string and returns the
first datum it contains. The reader SHALL recognize integers (optionally signed), symbols,
the empty list, proper lists `( … )`, bracketed lists `[ … ]` (accepted interchangeably with
parentheses), and dotted/improper lists `( … . x)`, booleans `#t`/`#f` (and their long forms
`#true`/`#false`), characters `#\x` (single codepoint), named characters, and hexadecimal
character escapes, strings `" … "` with escape sequences, `#(...)`
vectors, and `'`-quote sugar (`'x` reads as `(quote x)`), skipping interleaved whitespace and
comments. Symbols SHALL be interned (a read symbol is `eq?` to the same-named
literal).

**Three comment forms SHALL be recognized**, in every position where whitespace may appear —
between top-level forms, between the elements of a list, and between a quote and its datum:

- `;` to end of line;
- `#| … |#`, a block comment, which SHALL **nest**: `#| a #| b |# c |#` is one comment, and the
  first `|#` closes only the innermost open block;
- `#;`, which SHALL discard the **next datum**. It SHALL be accepted at top level and inside a list,
  including immediately before a closing parenthesis, and SHALL stack (`#;#;a b c` reads `c`).

**Both boolean spellings SHALL be read.** R7RS §7.1.1 gives `#t`/`#true` and `#f`/`#false` as
alternative spellings of the same two values. The reader SHALL consume the whole token in each case,
so that `#true` yields `#t` and leaves nothing behind for the next read.

String literals SHALL support the escape sequences `\a` (alarm, U+0007), `\b` (backspace, U+0008),
`\n` (newline), `\t` (tab), `\r` (return), `\\` (backslash), `\"` (double quote), and `\xHH…;` (a
hexadecimal Unicode codepoint terminated by `;`), decoding each to the intended character.

String literals SHALL also support the R7RS §6.7 **line continuation**: a backslash followed by
optional intraline whitespace, a newline, and further optional intraline whitespace SHALL contribute
**no characters at all** to the string. This is what lets a long literal be broken across source
lines without embedding the break and the following indentation in its value.

Character literals SHALL support named characters in addition to the single-character form. The R7RS
§6.6 names SHALL be recognized — `#\alarm` (U+0007), `#\backspace` (U+0008), `#\delete` (U+007F),
`#\escape` (U+001B), `#\newline`, `#\null`, `#\return`, `#\space`, and `#\tab` — together with the
recorded extensions `#\nul` (U+0000), `#\altmode` and `#\esc` (U+001B), and `#\page` (U+000C).

Character literals SHALL support the hexadecimal form `#\x<hex digits>`, denoting the character with
that Unicode scalar value, so `#\x41` is `A` and `#\x03BB` is λ. A `#\x` token with no following hex
digits SHALL remain the character `x`; the hexadecimal reading applies only when digits follow.

**An unknown character name SHALL be reported, naming the name.** The reader SHALL NOT fall back to
any character — in particular not to the first character of the name — because a fallback makes a
misspelled or unimplemented name indistinguishable from a correct one in the value it produces. The
report SHALL travel the same channel as the reader's other diagnostics, arriving from the entry point
rather than from the lexeme layer.

List syntax SHALL support dotted pairs: a standalone `.` before the final element within
parentheses SHALL produce an improper list whose tail is the datum following the `.`, so
`(a . b)` reads as the pair of `a` and `b`.

Bracketed list syntax `[ … ]` SHALL be accepted as equivalent to `( … )`: a `[` opens a list
and a `]` closes one, and brackets and parentheses are interchangeable (a list opened with `[`
may be closed with `)` and vice-versa). This mirrors the source the compiler consumes (Chez
`pretty-print` emits `[...]` for binding forms). Strict bracket/paren matching is not required.

Malformed input for these extensions (an unrecognized escape, or a misplaced `.`) is undefined for
this subset.

#### Scenario: Read a nested list

- **WHEN** a program evaluates `(read-from-string "(a (b c) 42)")`
- **THEN** the result is the list `(a (b c) 42)` — the symbol `a`, the list `(b c)`, and the
  fixnum `42`

#### Scenario: Read a bracketed list

- **WHEN** a program evaluates `(read-from-string "(let ([x 5]) x)")`
- **THEN** the result is the list `(let ((x 5)) x)` — the `[x 5]` binding reads as the list
  `(x 5)`, identical to the parenthesized form

#### Scenario: Read atoms of each type

- **WHEN** a program reads `"42"`, `"hello"`, `"#t"`, `"#\\z"`, and `"\"hi\""`
- **THEN** the results are the fixnum `42`, the symbol `hello`, the boolean `#t`, the
  character `#\z`, and the string `"hi"`

#### Scenario: The long boolean spellings read as booleans

- **WHEN** a program evaluates `(list #true #false)`
- **THEN** the result is the list `(#t #f)`, and no symbol `rue` or `alse` is produced

#### Scenario: Read symbols are interned

- **WHEN** a program evaluates `(eq? (read-from-string "foo") (quote foo))`
- **THEN** the result is `#t`

#### Scenario: Quote sugar and comments

- **WHEN** a program evaluates `(read-from-string "; a comment\n 'x")`
- **THEN** the comment is skipped and the result is the list `(quote x)`

#### Scenario: A block comment is skipped wherever whitespace is

- **WHEN** a program reads `"#| skip me |# (a #| and me |# b)"`
- **THEN** the result is the list `(a b)`, and neither comment contributes a datum

#### Scenario: Block comments nest

- **WHEN** a program reads `"#| outer #| inner |# still outer |# 42"`
- **THEN** the result is `42` — the first `|#` closes the inner block only

#### Scenario: A datum comment discards the next datum

- **WHEN** a program reads `"(1 #;2 3)"`, `"(1 2 #;3)"`, and `"#;(a b) c"`
- **THEN** the results are `(1 3)`, `(1 2)`, and the symbol `c`

#### Scenario: Datum comments stack

- **WHEN** a program reads `"(list #;#;1 2 3)"`
- **THEN** the result is `(list 3)` — the two `#;` discard the two data that follow them

#### Scenario: String escape sequences

- **WHEN** a program evaluates `(string-length (read-from-string "\"a\\nb\""))`
- **THEN** the result is `3` (the string `a`, newline, `b`)

#### Scenario: The alarm and backspace string escapes

- **WHEN** a program evaluates `(char->integer (string-ref "\a" 0))` and
  `(char->integer (string-ref "\b" 0))`
- **THEN** the results are `7` and `8`, not `97` and `98`

#### Scenario: A backslash-newline continuation contributes nothing

- **WHEN** a program reads a string literal written as `"line 1\` followed by a newline, three
  spaces, and `continued"`
- **THEN** the string is `line 1continued` — neither the newline nor the leading whitespace of the
  next line appears in the value

#### Scenario: Escaped double quote

- **WHEN** a program evaluates `(read-from-string "\"say \\\"hi\\\"\"")`
- **THEN** the result is the string `say "hi"`

#### Scenario: Comment syntax inside a string is not a comment

- **WHEN** a program reads `"\"a #| b ; c #; d\""`
- **THEN** the result is the string `a #| b ; c #; d`, unchanged

#### Scenario: Named character literal

- **WHEN** a program evaluates `(char->integer (read-from-string "#\\newline"))`
- **THEN** the result is `10`

#### Scenario: The R7RS control character names

- **WHEN** a program evaluates `(char->integer c)` for `c` read from `"#\\alarm"`,
  `"#\\backspace"`, `"#\\escape"`, and `"#\\delete"`
- **THEN** the results are `7`, `8`, `27`, and `127` — not the first letter of each name

#### Scenario: Hexadecimal character literal

- **WHEN** a program evaluates `(char->integer #\x41)` and
  `(char->integer (read-from-string "#\\x03BB"))`
- **THEN** the results are `65` and `955`

#### Scenario: A bare #\x is the letter x

- **WHEN** a program evaluates `(char->integer (read-from-string "#\\x"))`
- **THEN** the result is `120`

#### Scenario: An unknown character name is reported

- **WHEN** a program reads `"#\\alarmm"`
- **THEN** the read reports an error naming the unrecognized character name, and does not produce
  the character `#\a`

#### Scenario: Dotted pair

- **WHEN** a program evaluates `(read-from-string "(a . b)")`
- **THEN** the result is the pair `(a . b)` (`car` is the symbol `a`, `cdr` is the symbol `b`)

#### Scenario: Improper list with leading elements

- **WHEN** a program evaluates `(read-from-string "(a b . c)")`
- **THEN** the result is the improper list `(a b . c)`

### Requirement: Structural equality

The compiler SHALL provide `equal?`, a structural equality predicate. `equal?` SHALL return
`#t` when its two arguments are `eqv?`; when both are pairs whose cars and cdrs are
recursively `equal?`; or when both are strings with identical codepoint content. Otherwise it
SHALL return `#f`. `equal?` therefore compares strings by content (not identity) and compares
compound list structure element by element.

#### Scenario: Nested list structure by value

- **WHEN** a program evaluates `(equal? (list 1 (list 2 3)) (quote (1 (2 3))))`
- **THEN** the result is `#t`

#### Scenario: Strings compared by content, not identity

- **WHEN** a program evaluates `(equal? (substring "xhello" 1 6) "hello")`
- **THEN** the result is `#t` (the two strings are distinct objects with equal content)

#### Scenario: Unequal structure

- **WHEN** a program evaluates `(equal? (quote (1 2)) (quote (1 2 3)))`
- **THEN** the result is `#f`

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

### Requirement: List combinators (filter, fold-left, fold-right)

The compiler SHALL provide `filter`, `fold-left`, and `fold-right` over a single list.
`filter` SHALL return a new list of the elements satisfying the predicate, in order.
`fold-left` SHALL apply `(f acc elem)` left-to-right with a tail-recursive accumulator;
`fold-right` SHALL apply `(f elem acc)` right-to-left. Argument order follows R6RS.

#### Scenario: filter

- **WHEN** a program evaluates `(filter (lambda (n) (< 1 n)) (quote (1 2 3 0 4)))`
- **THEN** the result is `(2 3 4)`

#### Scenario: fold-left accumulates left to right

- **WHEN** a program evaluates `(fold-left (lambda (a b) (- a b)) 0 (quote (1 2 3)))`
- **THEN** the result is `-6` (`((0-1)-2)-3`)

#### Scenario: fold-right accumulates right to left

- **WHEN** a program evaluates `(fold-right (lambda (x acc) (cons x acc)) (quote ()) (quote (1 2 3)))`
- **THEN** the result is `(1 2 3)`

Note: `car`, `cons`, and `string-append` may be passed as bare primitives (see "Primitives
usable as first-class values"); any other primitive used in value position must be wrapped in a
lambda (e.g. `(lambda (a b) (- a b))`).

### Requirement: Character comparison procedures

The compiler SHALL provide the character comparison procedures `char=?`, `char<?`, `char>?`,
`char<=?`, and `char>=?`. Each SHALL accept two or more characters and SHALL return `#t` iff
the characters, ordered by Unicode codepoint, satisfy the relation pairwise across the whole
argument list (chained comparison), otherwise `#f`.

#### Scenario: Chained character ordering

- **WHEN** a program evaluates `(char<? #\a #\b #\c)` and `(char<? #\a #\c #\b)`
- **THEN** the results are `#t` and `#f`

#### Scenario: Character equality

- **WHEN** a program evaluates `(char=? #\x #\x)` and `(char=? #\x #\y)`
- **THEN** the results are `#t` and `#f`

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

### Requirement: Vector printing and reader syntax

A vector SHALL print as `#(` followed by its elements separated by spaces and a closing `)`.
`read-from-string` SHALL read `#(...)` syntax as a vector of the parenthesized data.

#### Scenario: Vector prints in #(...) form

- **WHEN** a program's result value is `(vector 1 2 3)`
- **THEN** it prints as `#(1 2 3)`

#### Scenario: Reader reads a vector literal

- **WHEN** a program evaluates `(vector-ref (read-from-string "#(7 8 9)") 2)`
- **THEN** the result is `9`

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

### Requirement: Compositional car/cdr combinators

The language SHALL provide the compositional `car`/`cdr` accessors, each equivalent to the
corresponding composition of `car` and `cdr`, partitioned as R7RS-small partitions them:

- the depth-2 forms `caar`, `cadr`, `cdar`, `cddr` SHALL be exported by `(scheme base)`, so they are
  available to a program with no explicit import;
- **all twenty-four** compositions of three to four `car`/`cdr` operations SHALL be exported by
  `(scheme cxr)`, and none of them SHALL be exported by `(scheme base)`. The library SHALL be
  complete: every three-level form (`caaar` … `cdddr`) and every four-level form
  (`caaaar` … `cddddr`), not merely those the compiler happens to use.

#### Scenario: cadr is available without an import

- **WHEN** a program with no explicit import evaluates `(cadr '(1 2 3))`
- **THEN** the result is `2`

#### Scenario: caddr requires (scheme cxr)

- **WHEN** a program imports `(scheme cxr)` and evaluates `(caddr '(1 2 3))` and
  `(cadddr '(1 2 3 4))`
- **THEN** the results are `3` and `4` respectively

#### Scenario: The library is complete, not only what the compiler used

- **WHEN** a program imports `(scheme cxr)` and calls a four-level accessor Emit did not previously
  define, such as `(caddar '((1 2 3 4)))` or `(cddddr '(1 2 3 4 5))`
- **THEN** it compiles and returns the value of the corresponding `car`/`cdr` composition

#### Scenario: A depth-3 accessor is unbound without its library

- **WHEN** a program that does not import `(scheme cxr)` references `caddr`
- **THEN** compilation fails with an unbound-variable error

#### Scenario: mixed accessor

- **WHEN** a program with no explicit import evaluates `(cdar '((1 2) 3))`
- **THEN** the result is `(2)`

### Requirement: case derived form

The language SHALL support `case` as a derived syntactic form: `(case KEY ((datum ...) body
...) ... (else body ...))` evaluates KEY once and runs the first clause whose datum list
contains KEY (compared with `eqv?`), or the `else` clause if none match.

`case` SHALL additionally support the R7RS §4.2.1 **receiver clause form**, in both an ordinary
clause and the `else` clause: `((datum ...) => EXPR)` and `(else => EXPR)`. When such a clause is
selected, EXPR SHALL be evaluated and the resulting procedure applied to **the key**, and the value
of that application is the value of the `case` expression. The key SHALL be evaluated exactly once
whether or not a receiver clause is selected, so a receiver never re-evaluates the key expression.

#### Scenario: case selects a matching clause

- **WHEN** a program evaluates `(case 2 ((1) 'a) ((2 3) 'b) (else 'c))`
- **THEN** the result is `'b`

#### Scenario: case falls through to else

- **WHEN** a program evaluates `(case 9 ((1) 'a) ((2 3) 'b) (else 'c))`
- **THEN** the result is `'c`

#### Scenario: A receiver clause is applied to the key

- **WHEN** a program evaluates
  `(case (car '(c d)) ((a e i o u) 'vowel) ((w y) 'semivowel) (else => (lambda (x) x)))`
- **THEN** the result is the symbol `c` — the `else` receiver applied to the key

#### Scenario: A receiver on an ordinary clause

- **WHEN** a program evaluates `(case 2 ((1) 'a) ((2 3) => (lambda (x) (* x 10))) (else 'c))`
- **THEN** the result is `20`

#### Scenario: The key is evaluated once with a receiver clause

- **WHEN** a program evaluates a `case` whose key expression increments a counter and whose
  selected clause is a receiver clause
- **THEN** the counter is incremented exactly once

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

### Requirement: Inexact real (flonum) numbers

The language SHALL provide **inexact real numbers** (flonums), each an IEEE
double-precision value, as a first-class number type disjoint from fixnums and
from every other value. A flonum SHALL be a heap-allocated tagged object (it does
not fit an immediate word), and two flonums produced by different computations
with the same value SHALL be indistinguishable by their value even when they are
distinct objects. Flonums SHALL be usable everywhere any other value is — bound,
stored in pairs/vectors, passed, and returned.

The reader (`read-from-string` and the program reader on both backends) SHALL
recognize inexact real literals: an optionally-signed token that contains a
decimal point and/or an exponent — `2.5`, `-1.25`, `0.0`, `100.`, `.5`,
`1e30`, `-2.5e-3` — SHALL read as the corresponding flonum. A token consisting
only of an optional sign and digits SHALL continue to read as an exact integer
(fixnum), a lone `.` SHALL continue to denote dotted-pair syntax, and any token
that is neither a valid integer nor a valid flonum (e.g. `2.5.6`, `1e`, `+`, `-`,
`foo`) SHALL continue to read as a symbol. Both backends SHALL read identical
source text to the identical flonum.

#### Scenario: Inexact literals read as flonums

- **WHEN** a program reads `"2.5"`, `"-1.25"`, `"0.0"`, and `"1e3"`
- **THEN** each result is a flonum (an inexact real), distinct in type from any
  fixnum, and `(inexact? (read-from-string "2.5"))` is `#t`

#### Scenario: Integers stay exact, dot stays dotted-pair

- **WHEN** a program reads `"42"`, `"-7"`, and `"(a . b)"`
- **THEN** `42` and `-7` are fixnums (exact), and `(a . b)` is the pair of `a`
  and `b` — the reader's integer and dotted-pair handling is unchanged

#### Scenario: Non-numeric tokens stay symbols

- **WHEN** a program reads `"2.5.6"`, `"1e"`, `"-"`, and `"foo"`
- **THEN** each result is a symbol — a token that is neither a valid integer nor a
  valid flonum is not a number

#### Scenario: Flonums of equal value compare equal by value

- **WHEN** a program evaluates `(= 2.5 (+ 1.0 1.5))`
- **THEN** the result is `#t`, even though the two flonums are distinct heap
  objects

### Requirement: Numeric tower with fixnum/flonum contagion

The arithmetic operators `+`, `-`, `*`, `/` and the comparisons `=`, `<`, `>`, `<=`, `>=` SHALL operate over a two-type numeric tower of exact integers (fixnums)
and inexact reals (flonums). When every operand of an arithmetic operation is a
fixnum, the result SHALL be exact (a fixnum), with the current semantics
unchanged. When any operand of an ARITHMETIC operation is a flonum, each fixnum operand SHALL be coerced to a
flonum and the operation SHALL be performed in inexact arithmetic, yielding a
flonum (contagion). Applying an
arithmetic or comparison operator to a non-number SHALL raise a runtime trap.

**A COMPARISON SHALL be decided on the operands' mathematical values, not by coercion** (R7RS
§6.2.6, and §6.2's rule that a mixed exact/inexact comparison behaves as if the exact value were used
exactly). Contagion is a rule about arithmetic *results*; a comparison produces a boolean, so there
is no result to make inexact and no reason to lose precision computing it. Coercing the exact operand
to `double` gives the wrong answer once it exceeds 2^53 — while still inside the fixnum range, so no
bignum is involved — and `>`, `<=`, `>=` derive over `<`, so they inherit whichever rule `<` follows.

For a flonum operand that is not finite: a NaN SHALL compare false under `=` and `<` (and under every
comparison derived from them), and an infinity SHALL compare by its sign. `max` and `min` are
unaffected: they return a *value*, so R7RS §6.2.6's inexactness contagion applies to them and already
does.

#### Scenario: Pure-fixnum arithmetic is unchanged and exact

- **WHEN** a program evaluates `(+ 1 2 3)`, `(* 2 3 4)`, and `(- 10 1 2)`
- **THEN** the results are the exact fixnums `6`, `24`, and `7`

#### Scenario: A flonum operand makes the result inexact

- **WHEN** a program evaluates `(+ 1 2.0)`, `(* 2 0.5)`, and `(- 5.0 1)`
- **THEN** the results are the flonums `3.0`, `1.0`, and `4.0` (inexact)

#### Scenario: Mixed comparison compares numerically

- **WHEN** a program evaluates `(= 2 2.0)`, `(< 1 2.5)`, and `(> 3.0 2)`
- **THEN** the results are `#t`, `#t`, and `#t`

#### Scenario: Arithmetic on a non-number traps

- **WHEN** a program evaluates `(+ 1 'a)` with no enclosing guard
- **THEN** the computation aborts via the runtime trap mechanism

#### Scenario: A comparison above 2^53 is exact

- **WHEN** a program evaluates `(= 9007199254740992.0 9007199254740993)` and
  `(< 9007199254740992.0 9007199254740993)`
- **THEN** the results are `#f` and `#t` — the exact operand is not rounded to the flonum's value

#### Scenario: A comparison with NaN or infinity

- **WHEN** a program compares a fixnum against `+nan.0`, and separately against `+inf.0` and `-inf.0`
- **THEN** every comparison with NaN is `#f`, and the infinities compare by sign

#### Scenario: max and min keep inexactness contagion

- **WHEN** a program evaluates `(max 1 2.0)` and `(min 1 2.0)`
- **THEN** the results are `2.0` and `1.0` — inexact, because an argument was inexact

### Requirement: Exact integer overflow is a diagnostic, never a wrapped value

Exact integers are fixnums with a bounded range (`[-2^60, 2^60)` under the current
tagging). When an exact integer operation's mathematically correct result falls
outside that range, the implementation SHALL report the violation of the
implementation restriction and abort the computation via the runtime trap
mechanism. It SHALL NOT produce a value that is not the mathematically correct
result — in particular it SHALL NOT wrap modulo the fixnum range.

This applies to `+`, `-`, and `*` on exact integer operands; to `quotient` and `/`
in the one case where an exact quotient leaves the range (the most negative fixnum
divided by `-1`); and to `inexact->exact` where the argument's value lies outside
the range. It applies identically whether the operation is reached through the
emitter's inline fast path or through the runtime primitive: both SHALL agree, with
the runtime primitive remaining the single definition of the outcome.

An out-of-range exact integer **literal** in source text SHALL likewise be a
diagnostic rather than reading as a different number. The reader computes literal
values with the same arithmetic operators, so it inherits this behaviour.

This requirement records an implementation restriction, not a permanent language
limitation: it is the sanctioned "report a violation of an implementation
restriction" outcome, chosen so that a later change providing exact integers of
unbounded size makes these traps unreachable without altering the result of any
program that produces a value today.

#### Scenario: Addition past the fixnum range traps

- **WHEN** a program evaluates `(+ 1152921504606846975 1)` with no enclosing guard
- **THEN** the computation aborts via the runtime trap mechanism with a diagnostic
  identifying an overflow, rather than yielding `-1152921504606846976`

#### Scenario: Multiplication past the fixnum range traps

- **WHEN** a program evaluates `(* 1000000000000 1000000000)` with no enclosing
  guard
- **THEN** the computation aborts via the runtime trap mechanism, rather than
  yielding `-735865998743175168`

#### Scenario: Subtraction past the negative bound traps

- **WHEN** a program evaluates `(- 0 -1152921504606846976)` — whose correct result
  `2^60` is one past the range — with no enclosing guard
- **THEN** the computation aborts via the runtime trap mechanism, rather than
  yielding `-1152921504606846976`

#### Scenario: In-range arithmetic is completely unaffected

- **WHEN** a program evaluates `(+ 1152921504606846974 1)`, `(* 2 3 4)`, and
  `(- 1152921504606846975 1)`
- **THEN** the results are the exact fixnums `1152921504606846975`, `24`, and
  `1152921504606846974` — every result representable as a fixnum is produced
  exactly as before

#### Scenario: The most negative fixnum divided by -1 traps

- **WHEN** a program evaluates `(quotient -1152921504606846976 -1)` or
  `(/ -1152921504606846976 -1)` with no enclosing guard
- **THEN** the computation aborts via the runtime trap mechanism, rather than
  yielding `-1152921504606846976`

#### Scenario: Flooring and truncating remainders are unaffected

- **WHEN** a program evaluates `(modulo -1152921504606846976 -1)` and
  `(remainder -1152921504606846976 -1)`
- **THEN** the results are `0` and `0` — these are in range for every input and
  are not affected by this requirement

#### Scenario: An out-of-range source literal traps at read time

- **WHEN** a program contains the literal `1152921504606846976`, one past the
  fixnum range
- **THEN** reading it aborts via the runtime trap mechanism, rather than producing
  the wrapped value `-1152921504606846976`

#### Scenario: The inline fast path and the runtime agree

- **WHEN** the same overflowing operation is reached through the emitter's inline
  fixnum fast path and through a call to the runtime primitive
- **THEN** both abort with the same diagnostic — the inline path detects the
  overflow and delegates to the runtime primitive rather than deciding the outcome
  itself

#### Scenario: Both backends agree

- **WHEN** an overflowing program is run under the in-process runner and as an
  AOT-compiled executable
- **THEN** both report the overflow; the in-process runner's host survives the trap
  and the standalone executable exits with a nonzero status, per the existing trap
  discipline

### Requirement: Indexed access out of range is a diagnostic, never an unchecked access

Every indexed accessor SHALL validate its index against the length of the object it is given, and an
index outside `[0, length)` SHALL report the violation of the implementation restriction and abort the
computation via the runtime trap mechanism. It SHALL NOT read the computed address, and it SHALL NOT
write to it.

This applies to `vector-ref` / `vector-set!`, `bytevector-u8-ref` / `bytevector-u8-set!`,
`string-ref` / `string-set!`, and to the internal record accessors that share their representation. It
applies to negative indices as well as to indices at or past the length.

`substring` SHALL likewise validate both bounds: `start` and `end` SHALL each lie within
`[0, string-length]`, and `start` SHALL NOT exceed `end`. A reversed pair currently computes a
negative length and terminates the process on a signal, which no argument makes acceptable.

A **negative size** at construction SHALL be reported the same way: `make-vector`, `make-bytevector`,
and `make-string` SHALL NOT produce an object whose recorded length is negative.

The diagnostic SHALL name the procedure, the offending index or size, and the valid range, so the
report identifies which access failed without a debugger. Reporting SHALL use the same runtime trap
mechanism as the fixnum overflow diagnostic, and therefore behaves the same way at both doors: a
standalone executable exits non-zero, and the in-process runner returns control to its host so a
subsequent form still evaluates.

The check SHALL live in the runtime primitive rather than at call sites, so that every path reaches
it — including a primitive used as a first-class value, which `primitive-layer` requires to be the
same procedure as the directly-called one.

**Scope: this constrains bounds. The type of the object is constrained separately, and first.** The
bound an accessor compares against is read from the object's own header, so it is meaningful only if
the object has already been verified to be of the accessor's type. The wrong-typed-argument
requirement supplies that verification and SHALL be applied before the length is loaded; together the
two leave no path on which an accessor reads or writes an address it has not established to be inside
an object of the expected type. The earlier scoping of this requirement — which assumed type confusion
would remain unchecked and noted that a later change might revisit it — is superseded: that change is
the wrong-typed-argument requirement, and the invitation has been taken up.

The **index** is likewise required to be an exact integer; a non-integer index SHALL be reported as a
type error naming the index, rather than reaching this range check as a nonsensical magnitude.

Like the fixnum overflow requirement, this records an implementation restriction rather than a
permanent limitation, and it is chosen so that no program which produces a value today produces a
different value afterwards: every access it turns into a trap is one that previously returned an
unspecified byte of memory or corrupted an unrelated object.

#### Scenario: An out-of-range vector read traps

- **WHEN** a program evaluates `(vector-ref (vector 1 2 3) 5)` with no enclosing guard
- **THEN** the computation aborts via the runtime trap mechanism with a diagnostic naming
  `vector-ref`, the index, and the length — rather than returning the heap word at that address

#### Scenario: An out-of-range vector write does not reach memory

- **WHEN** a program creates two vectors `a` and `b`, then evaluates `(vector-set! a 5 999)` where
  `a` has length 3
- **THEN** the computation aborts with a diagnostic, and `b` is unmodified — rather than the store
  landing in another object and the program exiting zero

#### Scenario: A far out-of-range write is reported rather than silently landing in mapped memory

- **WHEN** a program evaluates `(vector-set! (vector 1 2 3) 4000000 1)`
- **THEN** the computation aborts with a diagnostic, rather than completing successfully

#### Scenario: A negative index traps

- **WHEN** a program evaluates `(string-ref "abc" -5)`, and separately `(vector-ref (vector 1) -1)`
- **THEN** each aborts via the runtime trap mechanism rather than returning a value

#### Scenario: An out-of-range string read traps

- **WHEN** a program evaluates `(string-ref "abc" 3)`, and separately `(string-ref "abc" 100000)`
- **THEN** each aborts with a diagnostic naming `string-ref`, rather than returning a character

#### Scenario: A bytevector access out of range traps

- **WHEN** a program evaluates `(bytevector-u8-ref (bytevector 1 2) 7)`, and separately
  `(bytevector-u8-set! (bytevector 1 2) 7 0)`
- **THEN** each aborts with a diagnostic rather than reading or writing past the object

#### Scenario: substring with an end past the string traps

- **WHEN** a program evaluates `(substring "abc" 0 10)`
- **THEN** the computation aborts with a diagnostic naming the bound, rather than returning a string
  containing bytes from beyond the source string

#### Scenario: substring with start greater than end traps rather than dying on a signal

- **WHEN** a program evaluates `(substring "abcdef" 4 1)`
- **THEN** the computation aborts via the runtime trap mechanism with a diagnostic, and the process
  does not terminate on a signal and does not attempt an allocation derived from a negative length

#### Scenario: A negative construction size traps

- **WHEN** a program evaluates `(make-vector -1 0)`, and separately `(make-string -1)` and
  `(make-bytevector -1 0)`
- **THEN** each aborts with a diagnostic, rather than producing an object whose length is negative

#### Scenario: A first-class primitive reaches the same check

- **WHEN** a program evaluates `(apply vector-ref (list (vector 1 2 3) 99))`, reaching the primitive
  as a value rather than through a direct call
- **THEN** the same diagnostic is reported, because the check lives in the runtime primitive

#### Scenario: A wrong-typed object is reported as a type error, not a range error

- **WHEN** a program evaluates `(vector-ref (quote ()) 0)`
- **THEN** the diagnostic names the type of the object, not an index range — the length was never
  read from it

#### Scenario: A non-integer index is reported as a type error

- **WHEN** a program evaluates `(vector-ref (vector 1 2 3) "x")`
- **THEN** the diagnostic names the index and the type required, rather than reporting an
  out-of-range index derived from the argument's representation

#### Scenario: Both doors agree, and the in-process host survives

- **WHEN** the same out-of-range program is run under the in-process runner and as a standalone
  executable
- **THEN** both report the same diagnostic; the executable exits non-zero, and the runner's host
  survives the trap and evaluates a subsequent form

#### Scenario: In-range access is unaffected

- **WHEN** a program indexes every element of a vector, string, and bytevector from `0` to
  `length - 1`
- **THEN** every access returns the value it returned before this requirement, with no diagnostic

### Requirement: A wrong-typed argument to a primitive is a diagnostic, never an unchecked access

Every primitive that **dereferences an argument** — reading or writing through the pointer that
argument's tag encodes — SHALL verify that the argument has the type it is about to assume, and an
argument of any other type SHALL report the violation and abort the computation via the runtime trap
mechanism. It SHALL NOT read the computed address, and it SHALL NOT write to it.

This applies to `car` and `cdr`; to `set-car!` and `set-cdr!`; to `vector-ref` / `vector-set!` /
`vector-length`; to `bytevector-u8-ref` / `bytevector-u8-set!` / `bytevector-length`; to the box
operations used for assignment-converted variables; and to the internal record, hash-table and
multiple-values accessors that share their representation.

It applies equally to **every operation that reads a string's or a symbol's bytes** —
`string-ref`, `string-set!`, `string-length`, `substring`, `string=?` (in both arguments),
`string-append` (both), `string-copy`, `string->symbol`, `string->number`, `write-string`, and
`symbol->string` — and to `error-object-message` and `error-object-irritants`. These are not a
lesser tier: they are user-facing `(scheme base)` names, `symbol->string` reaches `strlen` through
the word it reads, and the error-object accessors are reached from inside a `guard` clause, which
is the one construct a program uses to recover from a failure.

`number->string` on the inexact path SHALL likewise verify its argument is a flonum before reading
the boxed double.

**The type check SHALL precede any length load derived from the same argument.** Where an accessor
both checks a bound and dereferences, the bound is read from the object's own header, so a bound
read from an unverified object is itself an unchecked access — and the range check performed against
it is meaningless. Ordering is normative, not incidental.

The type test SHALL be the same test as the corresponding Scheme predicate (`pair?`, `vector?`,
`string?`, `bytevector?`, `procedure?`), so that no value can be accepted by one and rejected by the
other.

**Calling a non-procedure SHALL be reported rather than performed.** A call whose operator is not a
procedure SHALL abort with a diagnostic instead of loading a code pointer out of the value and
transferring to it. The check applies to calls whose operator is not statically known to be a
procedure; a call to a statically-known closure SHALL NOT pay for it.

**`apply`'s final argument SHALL be a proper list.** A final argument that is not a list, or a list
with an improper tail, SHALL be reported rather than silently contributing only its proper prefix.

The diagnostic SHALL name the procedure and the type of argument it required, following the shape of
the existing runtime diagnostics (`+: not a number`). Reporting SHALL use the same runtime trap
mechanism as the fixnum overflow and out-of-range diagnostics, and therefore behaves the same way at
both doors: a standalone executable exits non-zero, and the in-process runner returns control to its
host so a subsequent form still evaluates.

The check SHALL live in the runtime primitive rather than at call sites, so that every path reaches
it — including a primitive used as a first-class value, which `primitive-layer` requires to be the
same procedure as the directly-called one. The non-procedure call is the sole exception, having no
runtime primitive to guard.

**This is a trap, not a raise.** A wrong-typed argument SHALL NOT be catchable by `guard` or
`with-exception-handler`, exactly as an out-of-range index and a fixnum overflow are not. The trap
mechanism transfers to the host, not to the Scheme handler chain; making the runtime's traps
catchable is a separate concern that would change every existing trap at once.

Like the fixnum overflow and indexed-access requirements, this records an implementation restriction
rather than a permanent limitation, and no program that produces a value today produces a different
value afterwards: every access it turns into a trap is one that previously read a wild address.

#### Scenario: car and cdr of a non-pair trap instead of dying on a signal

- **WHEN** a program evaluates `(car (quote ()))`, and separately `(cdr (quote ()))` and `(car 7)`
- **THEN** each aborts via the runtime trap mechanism with a diagnostic naming the procedure and the
  type it required — rather than terminating the process on a signal

#### Scenario: An indexed accessor checks the object before deriving a bound from it

- **WHEN** a program evaluates `(vector-ref (quote ()) 0)`, and separately `(vector-length 7)`,
  `(string-ref 7 0)`, `(string-length (quote ()))` and `(bytevector-u8-ref 7 0)`
- **THEN** each aborts with a type diagnostic naming the procedure — not with a range diagnostic,
  because the length was never read from the wrong-typed object

#### Scenario: Calling a non-procedure is reported

- **WHEN** a program evaluates `((quote not-a-proc) 1)`
- **THEN** the computation aborts with a diagnostic rather than terminating the process on a signal

#### Scenario: apply rejects a non-list final argument

- **WHEN** a program evaluates `(apply + 3)`, and separately `(apply + 3 4)` and
  `(apply + (quote (2 3 . 4)))`
- **THEN** each aborts with a diagnostic — rather than returning `0`, `3`, and `5` respectively by
  dropping the argument that is not a list

#### Scenario: A first-class primitive reaches the same check

- **WHEN** a program evaluates `(apply car (list 7))`, reaching the primitive as a value rather than
  through a direct call
- **THEN** the same diagnostic is reported, because the check lives in the runtime primitive

#### Scenario: The string operations report rather than dereference

- **WHEN** a program evaluates `(string=? 7 "a")`, and separately `(string-append 7 "a")`,
  `(string->symbol 7)`, `(symbol->string 7)`, `(string-copy 7)` and `(write-string 7)`
- **THEN** each aborts with a diagnostic naming the procedure and `a string` (respectively
  `a symbol`) — rather than reading the argument's payload as a byte pointer

#### Scenario: The error-object accessors are safe inside a guard clause

- **WHEN** a `guard` clause evaluates `(error-object-message e)` where `e` is not an error object
- **THEN** the computation aborts with a diagnostic naming `error-object-message`, rather than
  crashing the recovery path itself

#### Scenario: A guard does not catch a type trap

- **WHEN** a program evaluates `(guard (e (#t (quote caught))) (car (quote ())))`
- **THEN** the computation aborts with the type diagnostic and does not evaluate the guard clause —
  the same behaviour an out-of-range index has under a guard

#### Scenario: Both doors agree, and the in-process host survives

- **WHEN** the same wrong-typed program is run under the in-process runner and as a standalone
  executable
- **THEN** both report the same diagnostic; the executable exits non-zero, and the runner's host
  survives the trap and evaluates a subsequent form

#### Scenario: Right-typed access is unaffected

- **WHEN** a program exercises `car`, `cdr`, the vector, string, and bytevector accessors, and calls
  procedures both directly and through values, all with correctly-typed arguments
- **THEN** every operation returns the value it returned before this requirement, with no diagnostic

### Requirement: Real division

The language SHALL provide `/`, real division, as an n-ary operator that
left-folds like the other arithmetic operators: `(/ a b c)` = `(/ (/ a b) c)`,
`(/ a)` = `(/ 1 a)` (reciprocal), and `(/)` with no arguments is a compile-time
error. Division SHALL follow the tower: if any operand is inexact, the result is
a flonum. For exact integer operands, `(/ a b)` SHALL be the exact quotient when
`b` divides `a` evenly, and a flonum otherwise. Division by an exact zero SHALL
raise a runtime trap, consistent with `quotient`/`remainder`.

#### Scenario: Exact division that divides evenly stays exact

- **WHEN** a program evaluates `(/ 6 3)` and `(/ 12 2 3)`
- **THEN** the results are the exact fixnums `2` and `2`

#### Scenario: Exact division that does not divide evenly is inexact

- **WHEN** a program evaluates `(/ 1 2)` and `(/ 7 2)`
- **THEN** the results are the flonums `0.5` and `3.5`

#### Scenario: Division with an inexact operand

- **WHEN** a program evaluates `(/ 5.0 2)` and `(/ (- 1.25 (- 2.5)) 4)`
- **THEN** the results are the flonums `2.5` and `0.9375`

#### Scenario: Division by exact zero traps

- **WHEN** a program evaluates `(/ 1 0)` with no enclosing guard
- **THEN** the computation aborts via the runtime trap mechanism

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

### Requirement: Flonums print in round-trippable inexact form

`display`, `write`, and `number->string` SHALL render a flonum as decimal text
that the reader reads back to an equal flonum and that is visually distinguishable
from an exact integer: the rendering SHALL always contain a decimal point or an
exponent (e.g. `0.0`, `2.5`, `-1.25`, `100.0`). A flonum reaching the final-value
printer SHALL render safely rather than crashing or misprinting. Non-finite
flonums SHALL render as `+inf.0`, `-inf.0`, and `+nan.0`.

**Positional notation SHALL be preferred to exponent notation** wherever the value's decimal
exponent lies within the implementation's stated positional range, so `(display 100.0)` writes
`100.0` and not `1e+02`. Shortest-round-tripping digit selection is unchanged; what changes is that
a value whose shortest rendering *could* use an exponent is written positionally when it fits. A
value outside that range SHALL use exponent notation, and the range SHALL be wide enough to cover
the magnitudes ordinary programs print. The round-trip property SHALL hold for whichever form is
chosen — a positional rendering that does not read back as the same flonum SHALL NOT be emitted.

All three renderings SHALL agree, since a value must not print one way through `write` and another
through `number->string`.

#### Scenario: display and write of a flonum

- **WHEN** a program evaluates `(number->string 2.5)`, and displays `0.0` and
  `-1.25`
- **THEN** the string is `"2.5"`, and the displayed text is `0.0` and `-1.25`
  (each with a decimal point)

#### Scenario: A round flonum prints positionally

- **WHEN** a program evaluates `(number->string 100.0)` and displays `1000.0` and `0.001`
- **THEN** the outputs are `"100.0"`, `1000.0`, and `0.001` — none in exponent form

#### Scenario: Flonum output round-trips through the reader

- **WHEN** a program evaluates `(= x (read-from-string (number->string x)))` for a
  flonum `x` such as `2.5`, `-1.25`, `100.0`, or `1e300`
- **THEN** the result is `#t` in every case

#### Scenario: A magnitude outside the positional range keeps exponent form

- **WHEN** a program displays a flonum such as `1e300`
- **THEN** the output uses exponent notation, and reads back as the same flonum

#### Scenario: write and number->string agree

- **WHEN** a program writes a flonum and also evaluates `number->string` on it
- **THEN** the two texts are identical

#### Scenario: A flonum is distinguishable from an integer in output

- **WHEN** a program displays `(/ 6 3)` and `(/ 7 2)`
- **THEN** the outputs are `2` (an integer) and `3.5` (a flonum, with a decimal
  point)

### Requirement: write-char output primitive

The language SHALL provide `write-char`, a unary primitive that writes the single
character argument to standard output as its UTF-8 encoding and returns the
unspecified value. It SHALL be an ordinary, first-class, shadowable binding in the
always-present primitive layer, defined over a reserved raw primcall
(`%write-char`); a direct, unshadowed call SHALL still compile to the bare
primitive. It SHALL NOT require importing `(scheme base)`.

This procedure SHALL additionally accept an OPTIONAL second argument that is a textual output
port, in which case the output SHALL go to that port instead of standard output. With the argument
omitted the behaviour SHALL be exactly as specified above, so existing programs are unaffected.

#### Scenario: write-char emits a character's bytes

- **WHEN** a program evaluates `(write-char #\A)` then `(write-char #\newline)`
- **THEN** it writes `A` followed by a line feed to standard output

#### Scenario: write-char emits a non-ASCII character as UTF-8

- **WHEN** a program evaluates `(write-char (integer->char 955))` (`λ`)
- **THEN** it writes the UTF-8 bytes of `λ` to standard output

#### Scenario: write-char is first-class and shadowable

- **WHEN** a program evaluates `(for-each write-char (string->list "hi"))`, or
  defines `(define (write-char c) 'mine)`
- **THEN** `write-char` behaves as an ordinary procedure value, and a user
  definition shadows it (user-wins)

#### Scenario: write-char accepts an optional port

- **WHEN** a program opens an output string port `p`, evaluates `(write-char #\A p)`, and calls
  `(get-output-string p)`
- **THEN** the result is `"A"` and nothing was written to standard output

### Requirement: do iteration macro

The standard library `(scheme base)` SHALL provide the `do` iteration macro with
the R7RS form `(do ((var init step) …) (test expr …) command …)`, where a binding
may omit its `step` (defaulting to `var`, i.e. the variable is unchanged each
iteration). Each iteration SHALL evaluate `test`; when `test` is true the loop
SHALL evaluate the result `expr`s in order and return the last (or the unspecified
value if there are none); otherwise it SHALL evaluate the `command`s for effect,
then rebind each `var` to its `step` and iterate. All `step`s SHALL be evaluated
before any rebinding (parallel update). `do` SHALL be an ordinary shadowable macro
(user-wins).

#### Scenario: do accumulates over a range

- **WHEN** a program evaluates
  `(do ((i 0 (+ i 1)) (acc 0 (+ acc i))) ((= i 5) acc))`
- **THEN** the result is `10` (0+1+2+3+4)

#### Scenario: do with a body command for effect

- **WHEN** a program evaluates
  `(do ((i 0 (+ i 1))) ((= i 3)) (display i))`
- **THEN** it displays `012` and returns the unspecified value

#### Scenario: do binding without an explicit step

- **WHEN** a program evaluates
  `(do ((i 0 (+ i 1)) (n 5)) ((= i n) i))`
- **THEN** `n` is unchanged each iteration and the result is `5`

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

### Requirement: error aborts with a diagnostic

The language SHALL provide `error` with the R7RS-small signature `(error message obj ...)`,
where `message` is a string and the `obj`s are irritants. `error` SHALL raise a catchable
**error object** that satisfies `error-object?`, whose message is recoverable with
`error-object-message` and whose irritants are recoverable with `error-object-irritants`.
When not caught by an enclosing `guard`, a raised error object SHALL report its message and
irritants and abort the current computation via the runtime trap mechanism: under a host that
installs the outermost trap (the REPL host, the in-process runner) the abort is reported and
the process survives; in a standalone executable it terminates with a nonzero status.

#### Scenario: error creates a catchable error object

- **WHEN** `(guard (e ((error-object? e) (error-object-message e))) (error "bad expression" 'x))`
  is evaluated
- **THEN** it returns `"bad expression"`, and `(error-object-irritants e)` within the handler
  would be `(x)`

#### Scenario: uncaught error reports and aborts under the host

- **WHEN** a form evaluates `(error "bad expression" 'x)` with no enclosing `guard`, in the
  interactive REPL or the in-process runner
- **THEN** the host reports the message and irritant and remains alive for the next input,
  rather than returning a value

#### Scenario: uncaught error terminates a standalone program

- **WHEN** a standalone (AOT) program evaluates `(error "no")` with no enclosing `guard`
- **THEN** the program terminates with a nonzero exit status after reporting the diagnostic

### Requirement: raise raises an object to the nearest handler

The language SHALL provide `(raise obj)`, which raises `obj` as an exception to the nearest
enclosing `guard`. Any object MAY be raised, not only error objects. If there is no enclosing
`guard`, the raised object SHALL reach the outermost trap and abort exactly as an uncaught
`error` does.

#### Scenario: a raised non-error object is caught by guard

- **WHEN** `(guard (e ((symbol? e) e)) (raise 'boom))` is evaluated
- **THEN** it returns the symbol `boom`

#### Scenario: an uncaught raise aborts

- **WHEN** `(raise 'boom)` is evaluated with no enclosing `guard` in a standalone program
- **THEN** the program terminates with a nonzero exit status

### Requirement: guard catches exceptions and recovers

The language SHALL provide `guard` with the form `(guard (variable clause ...) body ...)`.
The `body` SHALL be evaluated; if it raises (via `raise` or `error`), the raised object SHALL
be bound to `variable` and the `clause`s evaluated as a `cond` in the continuation of the
`guard` expression. If a clause's test succeeds, its result SHALL be the value of the `guard`
expression and control SHALL NOT return to `body`. If no clause matches and there is no
`else`, the object SHALL be re-raised to the next enclosing handler. If `body` completes
without raising, its value SHALL be the value of the `guard` expression. `guard`s SHALL nest.

#### Scenario: guard returns the body value when nothing is raised

- **WHEN** `(guard (e (#t 'caught)) (+ 1 2))` is evaluated
- **THEN** it returns `3`

#### Scenario: guard catches and dispatches on the raised object

- **WHEN** `(guard (e ((eq? e 'a) 1) ((eq? e 'b) 2) (else 3)) (raise 'b))` is evaluated
- **THEN** it returns `2`

#### Scenario: guard re-raises when no clause matches

- **WHEN** `(guard (outer (#t 'outer-caught)) (guard (inner ((eq? inner 'x) 'inner)) (raise 'y)))`
  is evaluated
- **THEN** the inner `guard` re-raises `y` (no clause matched, no `else`) and the outer
  `guard` catches it, returning `outer-caught`

#### Scenario: a bad form recovers under the embedded REPL

- **WHEN** a form raises during compilation or evaluation inside a `guard` that wraps one
  REPL interaction
- **THEN** the raised object is caught, the interaction is abandoned, and the session
  continues with the next form (the in-language basis for REPL recover-and-continue)

### Requirement: The runtime trap mechanism raises a catchable condition

A runtime-detected error arising from **data** SHALL be raised as a condition into the same handler
chain as `raise`, so that an enclosing `guard` can catch it. It SHALL NOT bypass the handler chain to
abort the computation directly.

This SHALL apply to every diagnostic that the requirements above describe as reported "via the
runtime trap mechanism" — a wrong-typed argument to a primitive, an indexed access out of range, a
negative size, exact integer overflow, division by zero — and to `apply` when its last argument is
not a proper list, **and to an arity mismatch**. Those requirements are unchanged in what they detect and in what they report; this
requirement states what the mechanism they name does with it.

The raised object SHALL be an error object: `error-object?` SHALL be true for it, and
`error-object-message` SHALL return the diagnostic text. Its irritants SHALL be the empty list, so
that the text of an **uncaught** diagnostic is exactly what it was before — the message and nothing
else.

**A violation of the runtime's own invariants SHALL remain fatal** and SHALL NOT be raised. This
covers exhaustion of the escape/guard frame stack, an escape to a frame that is no longer live, and
an allocation failure. The distinction is that a condition about data leaves the
runtime's machinery intact and a handler can meaningfully run, whereas these report that the
machinery itself is unsound — and a handler would run on the very structures whose invariant failed.

When no handler is installed, a raised trap SHALL report and abort exactly as an uncaught `error`
does: under a host that installs the outermost trap the abort is reported and the process survives;
in a standalone executable it terminates with a nonzero status.

The mechanism SHALL be re-entrant-safe: a trap raised while a trap is already being delivered SHALL
report and abort rather than recurse.

**An arity mismatch is a condition about data.** It reports that a *caller* passed the wrong number
of arguments; the runtime's own machinery is intact, the heap and the frame stacks are consistent, and
a handler can meaningfully run — which is this requirement's own criterion for the catchable side. It
was on the fatal side by the boundary of the change that introduced this mechanism, not by that
criterion. A `guard` around a *known-arity direct call* still sees nothing, because the compiler
rejects those statically; this governs indirect and `apply` calls.

**A delivered trap SHALL reach the handler chain of the code that trapped.** Where a host process
holds more than one instance of the standard library — a compiler linked with its own, plus one
compiled for the code it is compiling — the raiser in effect SHALL be the one belonging to the code
currently executing, not whichever instance initialized last. A trap raised inside the compiler SHALL
therefore be catchable by the compiler's own handlers, and one raised in user code by the user's.
Consequence, and the observable requirement: a trap inside the compiler SHALL be reported and the
host SHALL survive it — an interactive session SHALL report the trap and accept the next form, rather
than exiting.

#### Scenario: A wrong-typed argument is caught by guard

- **WHEN** a program evaluates `(guard (e (#t (list 'caught (error-object? e)))) (+ 1 'a))`
- **THEN** the result is `(caught #t)` — the trap is delivered to the handler rather than
  terminating the program

#### Scenario: An out-of-range index is caught by guard

- **WHEN** a program evaluates `(guard (e (#t 'caught)) (vector-ref (vector 1 2) 9))`
- **THEN** the result is the symbol `caught`

#### Scenario: apply with an improper last argument is caught

- **WHEN** a program evaluates `(guard (e (#t 'caught)) (apply + '(2 3 . 4)))`
- **THEN** the result is the symbol `caught`

#### Scenario: The caught object carries the diagnostic

- **WHEN** a program catches the trap from `(vector-ref (vector 1 2) 9)` and reads
  `(error-object-message e)` and `(error-object-irritants e)`
- **THEN** the message is the same diagnostic text the uncaught trap reports, and the irritants are
  the empty list

#### Scenario: An uncaught trap reports exactly as before

- **WHEN** a program evaluates `(+ 1 'a)` with no enclosing `guard`
- **THEN** the reported text is unchanged from before this requirement, and the program aborts as it
  did — the host survives, or a standalone executable exits nonzero

#### Scenario: Two traps in sequence are both catchable

- **WHEN** a program catches a trap and then evaluates a second trapping expression inside another
  `guard`
- **THEN** the second is caught as well — delivering a trap does not leave the mechanism disarmed

#### Scenario: A trap raised inside a handler does not recurse

- **WHEN** a `guard` handler itself evaluates a trapping expression while handling a trap
- **THEN** the program reports and aborts rather than recursing without bound

#### Scenario: Exhausting the escape frame stack stays fatal

- **WHEN** a program nests escapes or guards past the runtime's frame limit
- **THEN** it reports and aborts, and the condition is not delivered to any handler

#### Scenario: An arity mismatch is caught by guard

- **WHEN** a program evaluates `(define (f a b) (+ a b))` then
  `(guard (e (#t 'caught)) (apply f (list 1)))`
- **THEN** the result is `caught`, and the object is an error object whose message is the arity
  diagnostic

#### Scenario: An uncaught arity mismatch reports exactly as before

- **WHEN** the same call is made with no handler installed
- **THEN** the diagnostic text is byte-identical to the text before this change, and the process exits
  non-zero

#### Scenario: A trap inside the compiler does not end the session

- **WHEN** a form that makes the compiler itself trap is entered at the REPL, and another form is
  entered after it
- **THEN** the trap is reported the way any other trap is, the session survives, and the following
  form is compiled and run

### Requirement: Error objects carry a source kind, exposed as read-error? and file-error?

An error object SHALL carry a **kind** identifying what raised it, and the language SHALL provide
`read-error?` and `file-error?` over it. Each SHALL be true only for an object raised by its own
source, and false for every other object, including a non-error object.

- An object raised by `error` SHALL satisfy neither predicate.
- An object raised because a **read** failed on malformed input SHALL satisfy `read-error?` and not
  `file-error?`.
- An object raised because a **file operation** could not be performed SHALL satisfy `file-error?`
  and not `read-error?`.
- An object raised by the runtime trap mechanism SHALL satisfy neither, while still satisfying
  `error-object?`.

The kind SHALL NOT be exposed as a public accessor. `read-error?` and `file-error?` are the whole of
the R7RS-small surface over it, so the encoding remains an internal representation detail that a
later change may replace without altering any specified behaviour.

Adding the kind SHALL NOT change the message or irritants of any error object, nor the text that an
uncaught one reports.

#### Scenario: An error object from error is neither kind

- **WHEN** a program evaluates
  `(guard (exn (else (list (read-error? exn) (file-error? exn)))) (error "BOOM!"))`
- **THEN** the result is `(#f #f)`

#### Scenario: A malformed read raises a read error

- **WHEN** a program reads malformed datum text from a port inside a `guard` and applies
  `read-error?` to the caught object
- **THEN** the result is `#t`, and `file-error?` on the same object is `#f`

#### Scenario: Opening a nonexistent file raises a file error

- **WHEN** a program evaluates
  `(file-error? (guard (exn (else exn)) (open-input-file "no such file")))`
- **THEN** the result is `#t`, and `read-error?` on the same object is `#f`

#### Scenario: The predicates are false for a non-error object

- **WHEN** a program evaluates `(guard (e (#t (list (read-error? e) (file-error? e)))) (raise 'boom))`
- **THEN** the result is `(#f #f)`

#### Scenario: A caught trap is an error object of neither kind

- **WHEN** a program catches the trap from `(+ 1 'a)` and applies `error-object?`, `read-error?`, and
  `file-error?` to it
- **THEN** the results are `#t`, `#f`, and `#f`

### Requirement: Read all top-level forms from source text

The standard prelude SHALL provide an in-language reader that, given a source string, returns
the list of all top-level data it contains, in order — skipping inter-form whitespace and
`;` line comments and stopping at end of input — built on the existing single-datum reader.

#### Scenario: Reads a sequence of forms

- **WHEN** the reader is applied to `"(define x 1) (define y 2) (+ x y)"`
- **THEN** it returns `((define x 1) (define y 2) (+ x y))`

#### Scenario: Skips comments and whitespace between and after forms

- **WHEN** the reader is applied to source with `;` comments and blank lines between forms
  and a trailing comment
- **THEN** the returned list contains exactly the forms, with comments and whitespace ignored

#### Scenario: Empty source yields no forms

- **WHEN** the reader is applied to `""` or a string of only whitespace/comments
- **THEN** it returns the empty list

### Requirement: A case-folding whole-source read

The prelude SHALL provide, beside `read-all-from-string`, a **case-folding** whole-source entry
point that returns the same list of top-level data with the symbol case of every **unquoted**
identifier folded. The folding SHALL happen during tokenization, so that an identifier written
between vertical bars is left literal: R7RS §7.1.1 makes the characters between the bars the
symbol's name, and folding after reading cannot honor that because a bar-quoted symbol and a bare
one are the same interned object once read.

Folding SHALL apply to every symbol the read produces, wherever it occurs — at top level, inside a
list, inside quoted structure, and inside a vector literal — and SHALL apply to nothing else: string
and character literals, numbers, and the text between bars are unaffected. In particular, folding
SHALL NOT alter the text from which a number is parsed.

Folding SHALL be ASCII: an ASCII uppercase letter maps to its lowercase counterpart and every other
character is returned unchanged. This is a recorded limit of the substrate, which carries no Unicode
case tables.

In every other respect the folding entry SHALL behave exactly as `read-all-from-string` — same
grammar, same values, same treatment of whitespace and the three comment forms, and the same
reporting of an unterminated construct through the entry point rather than from the lexeme layer.

The folding entry SHALL be exported by the same library that exports `read-all-from-string`, because
it reports the same conditions through the same helper and reporting cannot be homed in the internal
substrate.

#### Scenario: Unquoted identifiers fold

- **WHEN** the folding entry is applied to `"(DEFINE (Greet) 1)"`
- **THEN** it returns `((define (greet) 1))`

#### Scenario: A bar-quoted identifier is left literal

- **WHEN** the folding entry is applied to `"(define (|MixedCase|) 1)"`
- **THEN** the defined name is the symbol `MixedCase`, and it is not `eq?` to `mixedcase`

#### Scenario: Bars and bare names in the same form stay distinguishable

- **WHEN** the folding entry is applied to `"(A |A|)"`
- **THEN** the two elements are the symbols `a` and `A`, and they are not `eq?` to each other

#### Scenario: Folding reaches inside quoted and vector structure

- **WHEN** the folding entry is applied to `"(quote (Alpha #(Beta |Gamma|)))"`
- **THEN** the symbols read are `alpha`, `beta`, and `Gamma`

#### Scenario: Strings, characters, and numbers are untouched

- **WHEN** the folding entry is applied to `"(\"ABC\" #\\A 1E3 X)"`
- **THEN** the string is `ABC`, the character is `#\A`, the number is the flonum `1000.0`, and only
  the identifier folds, to `x`

#### Scenario: The non-folding entry is unchanged

- **WHEN** `read-all-from-string` is applied to `"(DEFINE (Greet) 1)"`
- **THEN** it returns `((DEFINE (Greet) 1))`, with no folding

### Requirement: Internal defines with letrec* semantics

The language SHALL accept a run of `define` forms at the head of a `lambda`, `let`, `letrec`,
or `begin` body, binding those names over the rest of the body with `letrec*` semantics: each
defined name is visible to the body expressions and to the other defines in the run, so mutual
and forward references within the run resolve. The defines SHALL produce the same core-IL as
the equivalent top-level defines. A `define` that does not form part of the leading run (i.e.
appears after a non-define body expression) SHALL remain an error.

#### Scenario: Internal define is bound over the body

- **WHEN** `((lambda (x) (define y (+ x 1)) (* y y)) 4)` is evaluated
- **THEN** the result is `25`

#### Scenario: Mutual reference within a body

- **WHEN** a body defines two procedures that call each other (e.g. even?/odd?) before a
  trailing expression that calls one of them
- **THEN** the mutual references resolve and the expression yields the correct result

#### Scenario: Define after a body expression is rejected

- **WHEN** a body places a `(define …)` after a non-define expression
- **THEN** compilation reports an error (defines must lead the body)

### Requirement: Emitter is expressible in the self-hostable subset

The emitter's LLVM C-string escaping SHALL be expressed using only operations in the language
Emit accepts (string/char access, integer arithmetic), without `string->utf8`,
bytevector operations, a radix argument to `number->string`, or `string-upcase`. The escaped
`c"…"` literal and its byte count (printable ASCII except `"` and `\` verbatim; every other
UTF-8 byte as an uppercase `\XX`; trailing NUL counted) SHALL be identical to the prior
output for all inputs.

#### Scenario: Escaping output is unchanged

- **WHEN** the emitter escapes any symbol or string name (ASCII, control characters, and
  multi-byte UTF-8 scalars) into an LLVM `c"…"` literal
- **THEN** the emitted literal and byte count are byte-for-byte identical to the previous
  implementation

#### Scenario: Emitter compiles in the subset

- **WHEN** the emitter source is compiled by Emit
- **THEN** it uses no operation outside the accepted subset (self-hosting gap G2 is closed)

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

#### Scenario: Assignment yields the unspecified value regardless of scope

- **WHEN** a program evaluates a top-level `(define x 1)` and a local `(let ((y 0)) (set! y 1))`
- **THEN** both forms yield the unspecified value — a definition is not an expression and an
  assignment is a mutation, so neither has an interesting result, and the two SHALL NOT disagree
  merely because one stores into a global slot and the other into a box

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

### Requirement: Type predicate primitives

The language SHALL provide the type predicates `symbol?`, `string?`, `char?`,
`boolean?`, `integer?`, `exact?`, `inexact?`, `number?`, `real?`, and `flonum?`
as primitives, each returning `#t` or `#f` by inspecting the runtime type of its
argument. `symbol?`, `string?`, and `char?` SHALL be true exactly for values of
those types; `boolean?` SHALL be true exactly for `#t` and `#f`. With a two-type
numeric tower (exact fixnums and inexact flonums): `number?` and `real?` SHALL be
true exactly for numbers (fixnums or flonums); `exact?` SHALL be true exactly for
fixnums; `inexact?` and `flonum?` SHALL be true exactly for flonums; and
`integer?` SHALL be true for fixnums and for flonums with an integral value
(`3.0`), and false for non-integral flonums (`2.5`) and non-numbers. Together with
the existing `pair?`, `null?`, and `vector?`, these complete the set of type
predicates the compiler core relies on.

#### Scenario: Predicates classify by type

- **WHEN** a program evaluates `(symbol? 'a)`, `(string? "x")`, `(char? #\z)`,
  `(boolean? #f)`, and `(integer? 7)`
- **THEN** each yields `#t`

#### Scenario: Exact and inexact numbers

- **WHEN** a program evaluates `(exact? 7)`, `(inexact? 7)`, `(exact? 2.5)`,
  `(inexact? 2.5)`, `(number? 2.5)`, and `(flonum? 2.5)`
- **THEN** the results are `#t`, `#f`, `#f`, `#t`, `#t`, and `#t`

#### Scenario: integer? spans exact and integral inexact

- **WHEN** a program evaluates `(integer? 7)`, `(integer? 3.0)`, `(integer? 2.5)`,
  and `(integer? 'a)`
- **THEN** the results are `#t`, `#t`, `#f`, and `#f`

#### Scenario: Predicates reject other types

- **WHEN** a program evaluates `(symbol? 1)`, `(string? 'a)`, `(char? "x")`, and
  `(number? 'a)`
- **THEN** each yields `#f`

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

### Requirement: display writes any datum in display style

The `display` primitive SHALL accept a value of ANY type and write a
human-readable rendering of it to standard output, in *display* style: a string
SHALL be written as its raw contents with NO surrounding double quotes, and a
character SHALL be written as the raw character with NO `#\` prefix. Every other
value type — fixnum, boolean, the empty list, pair, symbol, vector, and any other
representable value — SHALL be written the same as the value printer's *write*
style. Compound values (pairs, vectors) SHALL be rendered by recursing in display
style, so nested strings and characters inside them are also unquoted/unprefixed.
`display` SHALL return the unspecified value so it composes inside `begin`.

The value printer SHALL be memory-safe: it SHALL dispatch on a value's runtime
tag and SHALL NOT interpret a value as a type it is not. Passing a non-string to
`display` SHALL NOT cause a memory fault or crash.

This is distinct from *write* style (used to print a program's final value),
which quotes strings and prefixes characters with `#\`; that behavior is
unchanged.

This procedure SHALL additionally accept an OPTIONAL second argument that is a textual output
port, in which case the output SHALL go to that port instead of standard output. With the argument
omitted the behaviour SHALL be exactly as specified above, so existing programs are unaffected.

**Output SHALL be finite for a datum containing a cycle.** R7RS constrains only `write` here, but a
`display` that does not terminate is no better in practice, and the two share one printer. `display`
SHALL therefore use the same datum labels for a cyclic datum as `write` does, while continuing to
render strings and characters in display style.

#### Scenario: display of a fixnum prints its digits

- **WHEN** a program runs `(display 42)`
- **THEN** the program writes `42` to standard output and does not crash

#### Scenario: display of a string omits the quotes

- **WHEN** a program runs `(display "hello")`
- **THEN** the program writes `hello` (no surrounding double quotes) to standard
  output

#### Scenario: display of a non-string never crashes

- **WHEN** a program runs `(display X)` for a non-string `X` — for example a
  fixnum, a pair such as `(cons 1 2)`, a symbol, a character, or the empty list
- **THEN** the program renders `X` and completes normally, with no segmentation
  fault or memory error

#### Scenario: display recurses in display style through structure

- **WHEN** a program runs `(display (list "a" #\b 3))`
- **THEN** the program writes `(a b 3)` — the inner string is unquoted and the
  inner character has no `#\` prefix

#### Scenario: write style is unchanged

- **WHEN** a program's final value is the string `"hello"` (printed by the
  runtime's write-style value printer)
- **THEN** the program writes `"hello"` (with surrounding double quotes), as
  before

#### Scenario: display accepts an optional port

- **WHEN** a program opens an output string port `p`, evaluates `(display "hi" p)`, and calls
  `(get-output-string p)`
- **THEN** the result is `"hi"` and nothing was written to standard output

#### Scenario: display of a circular structure terminates

- **WHEN** a program evaluates `(let ((x (list 1))) (set-cdr! x x) (display x))`
- **THEN** the output is finite and labels the cycle, rather than emitting elements until the process
  is killed

### Requirement: newline writes a line separator

The `newline` primitive SHALL accept zero arguments and write a single newline
character (U+000A, `\n`) to standard output. It SHALL return the unspecified
value so it composes inside `begin` and after other output primitives.

Calling `newline` with more than the one optional port argument SHALL be an error (arity
mismatch), consistent with how other primitives report arity errors.

This procedure SHALL additionally accept an OPTIONAL first argument that is a textual output
port, in which case the output SHALL go to that port instead of standard output. With the argument
omitted the behaviour SHALL be exactly as specified above, so existing programs are unaffected.

#### Scenario: newline writes a single line feed

- **WHEN** a program runs `(begin (display "a") (newline) (display "b"))`
- **THEN** the program writes the three bytes `a`, `\n`, `b` to standard output
  in that order

#### Scenario: newline returns the unspecified value

- **WHEN** a program runs `(begin (newline) (quote done))`
- **THEN** the program completes normally and its value is the symbol `done`
  (the `newline` call does not contribute a value)

#### Scenario: newline accepts an optional port

- **WHEN** a program opens an output string port `p`, evaluates `(newline p)`, and calls
  `(get-output-string p)`
- **THEN** the result is a single line feed and nothing was written to standard output

### Requirement: write writes any datum in write style

The `write` primitive SHALL accept a value of ANY type and write a machine-
readable rendering of it to standard output, in R7RS *write* style: a string
SHALL be written WITH surrounding double quotes, and a character SHALL be written
WITH its `#\` prefix, **named or hex-escaped as specified below** (e.g. `#\a`,
`#\newline`, `#\alarm`, `#\x7f`). Every other value type — fixnum,
boolean, the empty list, pair, symbol, vector, and any other representable value
— SHALL be written the same as `display`. Compound values (pairs, vectors) SHALL
be rendered by recursing in write style, so nested strings and characters inside
them are also quoted/prefixed. `write` SHALL return the unspecified value so it
composes inside `begin`.

The value printer SHALL be memory-safe: it SHALL dispatch on a value's runtime
tag and SHALL NOT interpret a value as a type it is not. Passing any value to
`write` SHALL NOT cause a memory fault or crash.

This is the write-style companion to the display-style `display` primitive, and
uses the same value printer that renders a program's final top-level value.

This procedure SHALL additionally accept an OPTIONAL second argument that is a textual output
port, in which case the output SHALL go to that port instead of standard output. With the argument
omitted the behaviour SHALL be exactly as specified above, so existing programs are unaffected.

**A character with an R7RS name SHALL be written by name, and any other non-graphic character SHALL
be hex-escaped.** The names are R7RS §6.6's: `alarm` (7), `backspace` (8), `delete` (127), `escape`
(27), `newline` (10), `null` (0), `return` (13), `space` (32), `tab` (9). Where the reader accepts
aliases (`altmode`, `esc`, `nul`, `page`), `write` SHALL emit the R7RS spelling, so its output is
portable. A character with no name that is not graphic SHALL be written as `#\xHH` (hexadecimal
scalar value), which the reader already accepts. Every other character SHALL be written literally.

`write` SHALL NOT emit a raw control byte. Doing so is not merely illegible: a written NUL is a
literal zero byte in the output stream, which is enough to make ordinary text tooling treat a
transcript as binary. `display` is unaffected and SHALL continue to write the raw character in every
case, which is what `write-char` and the port procedures depend on.

**Output SHALL be finite for a datum containing a cycle** (R7RS §6.13.3). Since pairs became
mutable, a cycle is constructible, and the printer SHALL therefore use datum labels: each pair or
vector that is reachable from itself SHALL be written as `#N=` at its first occurrence and `#N#` at
every later occurrence, so the output both terminates and reads back as the same structure. Labels
SHALL be used only where a cycle exists; shared but acyclic structure SHALL be written in full,
which is the distinction `write-shared` exists to change and which this requirement does not
provide.

#### Scenario: write of a string keeps the quotes

- **WHEN** a program runs `(write "hello")`
- **THEN** the program writes `"hello"` (with surrounding double quotes) to
  standard output

#### Scenario: write of a character keeps the prefix

- **WHEN** a program runs `(write #\a)`
- **THEN** the program writes `#\a` to standard output

#### Scenario: write recurses in write style through structure

- **WHEN** a program runs `(write (list "a" #\b 3))`
- **THEN** the program writes `("a" #\b 3)` — the inner string is quoted and the
  inner character has its `#\` prefix

#### Scenario: write of a non-string never crashes

- **WHEN** a program runs `(write X)` for a non-string `X` — for example a
  fixnum, a pair such as `(cons 1 2)`, a symbol, or the empty list
- **THEN** the program renders `X` and completes normally, with no segmentation
  fault or memory error

#### Scenario: write matches the final-value print style

- **WHEN** a program runs `(write (list "a" #\b))` and a second program is just
  the bare expression `(list "a" #\b)` (printed by the runner as the top-level
  value)
- **THEN** both programs write the identical bytes `("a" #\b)` to standard output

#### Scenario: write accepts an optional port

- **WHEN** a program opens an output string port `p`, evaluates `(write "hi" p)`, and calls
  `(get-output-string p)`
- **THEN** the result is the five characters `"hi"` including the quotes, and nothing was written
  to standard output

#### Scenario: A named character is written by name

- **WHEN** a program runs `(write (integer->char 7))`, `(write #\tab)`, and `(write (integer->char 0))`
- **THEN** the output is `#\alarm`, `#\tab`, and `#\null` — not a `#\` followed by a raw control byte

#### Scenario: An unnamed non-graphic character is hex-escaped

- **WHEN** a program runs `(write (integer->char 1))`
- **THEN** the output is `#\x1`, which the reader reads back as the same character

#### Scenario: write of a circular structure terminates with labels

- **WHEN** a program evaluates `(let ((x (list 1 2))) (set-cdr! (cdr x) x) (write x))`
- **THEN** the output is finite and labels the cycle (`#0=(1 2 . #0#)`), rather than emitting
  elements until the process is killed

#### Scenario: An acyclic datum is written exactly as before

- **WHEN** a program writes a nested list, a vector, a string, and a graphic character with no cycle
  and no shared structure
- **THEN** the output is byte-identical to the output before this change

### Requirement: Bytevector data type and operations

The compiler SHALL provide a mutable, fixed-length bytevector data type and the operations
`make-bytevector`, `bytevector`, `bytevector-u8-ref`, `bytevector-u8-set!`,
`bytevector-length`, and `bytevector?`. Each element is an exact integer in the range
0–255 (a byte). `(make-bytevector k fill)` SHALL return a bytevector of `k` bytes each
initialized to `fill`. `(bytevector b …)` SHALL return a bytevector of its byte arguments in
order. `(bytevector-u8-ref bv i)` SHALL return the `i`-th byte (0-based) as a fixnum.
`(bytevector-u8-set! bv i byte)` SHALL replace the `i`-th byte with `byte` in place.
`(bytevector-length bv)` SHALL return the byte count as a fixnum. `(bytevector? x)` SHALL
return `#t` iff `x` is a bytevector. Out-of-range indices and out-of-range byte values are
undefined for this subset (matching `vector-ref` / `string-ref`).

#### Scenario: Construct and index

- **WHEN** a program evaluates `(bytevector-u8-ref (bytevector 10 20 30) 1)`
- **THEN** the result is `20`

#### Scenario: Length

- **WHEN** a program evaluates `(bytevector-length (make-bytevector 4 0))`
- **THEN** the result is `4`

#### Scenario: Mutation

- **WHEN** a program evaluates `(let ((bv (make-bytevector 2 0))) (bytevector-u8-set! bv 0 255) (bytevector-u8-ref bv 0))`
- **THEN** the result is `255`

#### Scenario: Predicate

- **WHEN** a program evaluates `(bytevector? (bytevector 1))` and `(bytevector? (vector 1))`
- **THEN** the results are `#t` and `#f`

### Requirement: Bytevector printing and reader syntax

A bytevector SHALL print as `#u8(` followed by its byte values separated by spaces and a
closing `)`. `read-from-string` SHALL read `#u8(...)` syntax as a bytevector of the
parenthesized byte data.

#### Scenario: Bytevector prints in #u8(...) form

- **WHEN** a program's result value is `(bytevector 1 2 3)`
- **THEN** it prints as `#u8(1 2 3)`

#### Scenario: Reader reads a bytevector literal

- **WHEN** a program evaluates `(bytevector-u8-ref (read-from-string "#u8(7 8 9)") 2)`
- **THEN** the result is `9`

### Requirement: Every datum the reader reads is usable as a quoted constant

A datum that the reader is required to read SHALL be usable as a quoted constant in compiled code.
Specifically, a vector literal (`#(...)`) and a bytevector literal (`#u8(...)`) SHALL each compile as
a constant — under `quote`, under the `'` abbreviation, and nested to any depth inside another
quoted datum — and SHALL evaluate to a value `equal?` to the one the same elements produce when
built at runtime with `vector` or `bytevector`.

This SHALL hold on every door and in every position a constant may appear: a program's top level, a
procedure body, a library body, and a macro template.

Elements SHALL be lowered by the same constant encoding as any other quoted datum, so a vector may
hold symbols, strings, characters, booleans, numbers, pairs, the empty list, and further vectors or
bytevectors.

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

#### Scenario: An unlowerable constant names itself

- **WHEN** the compiler reaches a constant it has no encoding for
- **THEN** the diagnostic names that datum's external representation rather than printing `?`

### Requirement: Structural equality over bytevectors

`equal?` SHALL treat two bytevectors as equal iff they have the same length and equal bytes
at every index.

#### Scenario: Byte-wise equality

- **WHEN** a program evaluates `(equal? (bytevector 1 2 3) (bytevector 1 2 3))`
- **THEN** the result is `#t`

### Requirement: Hash-table data type and operations

The compiler SHALL provide a mutable hash-table data type keyed by `equal?`, and the
operations `make-hash-table`, `hash-table?`, `hash-table-set!`, `hash-table-ref`,
`hash-table-ref/default`, `hash-table-delete!`, `hash-table-contains?`, `hash-table-size`,
`hash-table-keys`, `hash-table-values`, and `hash-table->alist`.

- `(make-hash-table)` SHALL return a new, empty hash table.
- `(hash-table? x)` SHALL return `#t` iff `x` is a hash table.
- `(hash-table-set! ht key val)` SHALL associate `key` with `val`, replacing any existing
  association for an `equal?` key, and return an unspecified value.
- `(hash-table-ref/default ht key default)` SHALL return the value associated with an `equal?`
  `key`, or `default` if none is present.
- `(hash-table-contains? ht key)` SHALL return `#t` iff an `equal?` `key` is present.
- `(hash-table-delete! ht key)` SHALL remove any association for an `equal?` `key`.
- `(hash-table-size ht)` SHALL return the number of associations as a fixnum.
- `(hash-table-keys ht)` / `(hash-table-values ht)` SHALL return a list of the keys / values.
- `(hash-table->alist ht)` SHALL return a list of `(key . value)` pairs.

The table SHALL grow (rehash into a larger bucket store) automatically as associations are
added, keeping lookup amortized O(1).

#### Scenario: Set and retrieve

- **WHEN** a program evaluates `(let ((h (make-hash-table))) (hash-table-set! h "a" 1) (hash-table-ref/default h "a" 0))`
- **THEN** the result is `1`

#### Scenario: Missing key returns default

- **WHEN** a program evaluates `(hash-table-ref/default (make-hash-table) "x" 42)`
- **THEN** the result is `42`

#### Scenario: Overwrite an equal? key

- **WHEN** a program evaluates `(let ((h (make-hash-table))) (hash-table-set! h "k" 1) (hash-table-set! h "k" 2) (hash-table-ref/default h "k" 0))`
- **THEN** the result is `2`

#### Scenario: Delete and contains?

- **WHEN** a program evaluates `(let ((h (make-hash-table))) (hash-table-set! h 'k 9) (hash-table-delete! h 'k) (hash-table-contains? h 'k))`
- **THEN** the result is `#f`

#### Scenario: Size and growth

- **WHEN** a program inserts 100 distinct keys into a fresh hash table and evaluates `(hash-table-size h)`
- **THEN** the result is `100` and every inserted key is still retrievable

#### Scenario: Predicate

- **WHEN** a program evaluates `(hash-table? (make-hash-table))` and `(hash-table? (vector 1))`
- **THEN** the results are `#t` and `#f`

### Requirement: Value-to-hash primitive

The runtime SHALL provide a `%hash` primitive that maps any value to a fixnum hash code such
that `equal?` values produce equal hash codes (identity-based for fixnums, symbols, characters,
and booleans; content-based for strings).

#### Scenario: Equal values hash equally

- **WHEN** a program evaluates `(= (%hash "abc") (%hash (string-append "ab" "c")))`
- **THEN** the result is `#t`

### Requirement: Hash-table printing

A hash table SHALL print in an opaque form `#<hash-table N>` where `N` is its current element
count. Hash tables are not readable.

#### Scenario: Opaque print

- **WHEN** a program's result value is an empty hash table
- **THEN** it prints as `#<hash-table 0>`

### Requirement: Record data type via define-record-type

The compiler SHALL provide the R7RS-small `define-record-type` form, which defines a new,
disjoint record type together with a constructor, a type predicate, and field accessors and
optional mutators. The form is:

```
(define-record-type <type-name>
  (<constructor> <field-tag> …)
  <predicate>
  (<field-tag> <accessor> [<mutator>]) …)
```

- The `<constructor>` SHALL be bound to a procedure of the listed `<field-tag>`s (in order)
  that returns a fresh record whose fields are initialized to those arguments.
- The `<predicate>` SHALL be bound to a one-argument procedure returning `#t` iff its argument
  is a record of this type and `#f` for every other value, including records of other types.
- Each `<accessor>` SHALL be bound to a one-argument procedure returning the named field of a
  record of this type.
- Each optional `<mutator>` SHALL be bound to a two-argument procedure replacing the named
  field of a record of this type in place, returning an unspecified value.

Records of two distinct `define-record-type` definitions SHALL be disjoint (each predicate is
true only for its own type's instances).

#### Scenario: Construct, predicate, and access

- **WHEN** a program defines `(define-record-type point (make-point x y) point? (x point-x) (y point-y))` and evaluates `(point-x (make-point 3 4))`
- **THEN** the result is `3`

#### Scenario: Predicate is type-specific

- **WHEN** the same program evaluates `(point? (make-point 1 2))` and `(point? 5)`
- **THEN** the results are `#t` and `#f`

#### Scenario: Field mutation

- **WHEN** a program defines a record type with a mutator `set-point-x!` and evaluates `(let ((p (make-point 1 2))) (set-point-x! p 9) (point-x p))`
- **THEN** the result is `9`

#### Scenario: Distinct record types are disjoint

- **WHEN** a program defines record types `point` and `pair2` and evaluates `(point? (make-pair2 1 2))`
- **THEN** the result is `#f`

### Requirement: Record printing and equality

A record instance SHALL print opaquely as `#<record TYPE>` using the record type's name.
Records are not readable. Two records SHALL be `eqv?` and `equal?` iff they are the same
object; `equal?` SHALL NOT recurse into record fields.

#### Scenario: Opaque print

- **WHEN** a `point` record's value is printed
- **THEN** it prints as `#<record point>`

#### Scenario: Records compare by identity

- **WHEN** a program evaluates `(let ((p (make-point 1 2))) (equal? p p))` and `(equal? (make-point 1 2) (make-point 1 2))`
- **THEN** the results are `#t` and `#f`

### Requirement: Malformed define-record-type is rejected with a recoverable error

A `define-record-type` form whose shape does not match the grammar

```
(define-record-type <type-name>
  (<constructor> <field-tag> …)
  <predicate>
  (<field-tag> <accessor> [<mutator>]) …)
```

SHALL be rejected at compile time with a diagnostic error, and SHALL NOT cause a
segmentation fault, silent miscompilation, or spurious non-zero exit. The compiler SHALL
validate the form's shape in the frontend, before any field is destructured, and raise a
catchable error (via `error`) naming the offending form. This behavior SHALL be identical
across the interactive host and the batch compilers: the same malformed form yields the
same diagnostic outcome whether compiled by the REPL host, the in-process runner, or the
text→IR filter compiler.

Specifically, the compiler SHALL report an error when any of the following holds:

- the form has no type name, no constructor spec, or no predicate;
- the constructor spec is not a list `(<constructor> <field-tag> …)` whose head is a symbol;
- the predicate is not a symbol;
- a field spec is not a list of the form `(<field-tag> <accessor> [<mutator>])` with symbol
  names;
- a constructor field tag does not name a declared field.

A well-formed `define-record-type` form SHALL continue to compile and behave exactly as
before this requirement (no change to valid-record semantics).

#### Scenario: Malformed record form in the REPL is recoverable

- **WHEN** the interactive host reads `(define-record-type <point> (x y))`
- **THEN** it reports a compile-time error diagnostic and returns to the prompt, and the
  process does not crash (no segmentation fault)

#### Scenario: Missing predicate and field specs

- **WHEN** a program compiles `(define-record-type <point> (x y))`
- **THEN** compilation reports an error naming the malformed form and produces no binary

#### Scenario: Empty record form

- **WHEN** a program compiles `(define-record-type)`
- **THEN** compilation reports an error and does not crash or silently succeed

#### Scenario: Malformed field spec

- **WHEN** a program compiles `(define-record-type point (make-point x) point? (x))`
  (a field spec with no accessor)
- **THEN** compilation reports an error and does not crash or silently miscompile

#### Scenario: Batch and interactive frontends agree

- **WHEN** the same malformed `define-record-type` form is compiled by the in-process
  runner and by the text→IR filter compiler
- **THEN** both report a compile-time error rather than segfaulting, silently emitting no
  output, or exiting with an unrelated status

#### Scenario: Well-formed record still compiles

- **WHEN** a program compiles `(define-record-type point (make-point x y) point? (x point-x) (y point-y))` and evaluates `(point-x (make-point 3 4))`
- **THEN** the result is `3` (unchanged behavior)

### Requirement: values produces multiple values

The `values` procedure SHALL accept any number of arguments and deliver them to
its continuation as that continuation's values. Calling `(values x)` with exactly
one argument SHALL return `x` unchanged — indistinguishable from evaluating `x`
directly — so that ordinary single-value code is unaffected by the presence of
`values`.

Calling `values` with zero arguments, or with two or more, SHALL produce a
distinguished multiple-values bundle that carries those arguments in order. The
bundle SHALL be disjoint from every user-visible value type (fixnum, boolean,
the empty list, pair, symbol, string, character, vector, bytevector, hash table,
record, closure): a legitimate single return value of any of those types SHALL
NOT be misidentified as a bundle.

`values` SHALL be an ordinary, shadowable binding provided by `(scheme base)`
(user-wins), not a reserved keyword.

#### Scenario: single value is the identity

- **WHEN** a program evaluates `(values 42)` in a single-value context, e.g.
  `(+ 1 (values 42))`
- **THEN** the result is `43` — `(values x)` behaves exactly as `x`

#### Scenario: a legitimate list value is not a bundle

- **WHEN** a program returns an ordinary list as a single value, e.g.
  `(call-with-values (lambda () (list 1 2 3)) (lambda (x) x))`
- **THEN** the consumer receives the one argument `(1 2 3)` — the list is a
  single value, not three values

### Requirement: call-with-values consumes produced values

The `call-with-values` procedure SHALL accept a producer thunk and a consumer
procedure. It SHALL call the producer with no arguments and apply the consumer to
the values the producer produced: a multiple-values bundle SHALL be spread so the
consumer receives one argument per produced value, and any other single result
SHALL be passed to the consumer as exactly one argument. The result of
`call-with-values` SHALL be whatever the consumer returns.

`call-with-values` SHALL be an ordinary, shadowable binding provided by
`(scheme base)`.

#### Scenario: multiple values are spread into the consumer

- **WHEN** a program runs
  `(call-with-values (lambda () (values 1 2 3)) (lambda (a b c) (+ a b c)))`
- **THEN** the result is `6` — the three produced values become the consumer's
  three arguments

#### Scenario: zero values

- **WHEN** a program runs
  `(call-with-values (lambda () (values)) (lambda () 'ok))`
- **THEN** the result is the symbol `ok` — the consumer is called with no
  arguments

#### Scenario: a single produced value

- **WHEN** a program runs
  `(call-with-values (lambda () 7) (lambda (x) (* x x)))`
- **THEN** the result is `49` — a producer that returns one ordinary value passes
  it as the consumer's single argument

#### Scenario: consumer receives a variadic list of values

- **WHEN** a program runs
  `(call-with-values (lambda () (values 1 2 3 4)) list)`
- **THEN** the result is `(1 2 3 4)` — the produced values are spread into the
  variadic `list`, reconstructing them as a list

### Requirement: the multiple-values bundle is a disjoint, safely-printable type

The runtime representation of a multiple-values bundle SHALL be a heap type
dispatched on its tag and header, **disjoint** from every user-visible value type,
so that `%mv?` (and thus `call-with-values`) never misidentifies a legitimate
single value — list, vector, record, string, etc. — as a bundle, and never
misroutes one. The final-value printer SHALL render a stray bundle **safely** (a
fixed marker such as `#<values>`) rather than crash or misprint.

Using a zero-or-many bundle where an ordinary single value is expected is "an error" (R7RS
latitude): the runtime applies the SAME semantics it applies to any other type confusion. Under the
wrong-typed-argument requirement that is now a **diagnostic** — a bundle passed to `car` is reported
as a non-pair, exactly as any other wrong-typed value is — rather than the unchecked access it once
was. The disjointness required here is what makes that report correct rather than accidental: a
bundle is never mistaken for the type an accessor expects. This requirement itself is unchanged in
substance; it guarantees only that the bundle is disjoint and that a bundle reaching the printer is
rendered safely.

#### Scenario: a stray top-level bundle prints safely

- **WHEN** a program's top-level value is a zero-or-many bundle, e.g. the whole
  program is `(values 1 2)`
- **THEN** the runner prints a safe fixed rendering (e.g. `#<values>`) and
  completes without a segfault or memory error — the disjoint header lets the
  printer recognize the bundle rather than misread it as another type

#### Scenario: a bundle used as an ordinary value is reported

- **WHEN** a program passes a zero-or-many bundle to `car`
- **THEN** the computation aborts with a type diagnostic naming `car`, rather than dereferencing the
  bundle as a pair

### Requirement: Write style escapes so its output reads back

The value printer's *write* style SHALL produce output that a reader can read back as the
same datum. Within a written string, the double-quote and backslash characters SHALL be
escaped with a backslash, and the newline, tab, and return characters SHALL be written as
their two-character escapes — the escapes this project's own reader (`read-from-string`)
accepts, so written output round-trips through it. *Display* style SHALL be unaffected: it
writes a string's raw contents, unquoted and unescaped.

**A symbol whose name would not read back as that symbol SHALL be written bar-quoted**, as
`|name|`, with `|` and `\` inside the name escaped. A name needs bars when it is empty, contains
whitespace, a delimiter, `|`, or `"`, or begins with a character sequence the reader would take as
a number or another datum. A name that needs none SHALL be written bare, exactly as before, so no
symbol any existing output contains changes shape. *Display* style SHALL write the raw name in
every case.

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

#### Scenario: A symbol that needs bars is written with them

- **WHEN** a program runs `(write (string->symbol "a b"))` and then
  `(display (string->symbol "a b"))`
- **THEN** the first writes `|a b|` and the second writes `a b`

#### Scenario: An ordinary symbol is written bare

- **WHEN** a program runs `(write (quote hello))` and `(write (quote set!))`
- **THEN** it writes `hello` and `set!`, with no bars

#### Scenario: A dumped form containing a string is readable data

- **WHEN** a program containing a string constant with an embedded quote is compiled with
  the stage-dump flag
- **THEN** every dumped stage reads back as data, and the form at each stage is equal to
  the form the Chez driver's dump shows for the same program

### Requirement: write-string writes a string's characters

The language SHALL provide `write-string`, which writes the characters of its string argument to
standard output and returns the unspecified value. It SHALL write the string's contents literally —
no surrounding quotes and no escaping — so it is `display` narrowed to strings, not `write`.

`write-string` SHALL additionally accept an OPTIONAL second argument that is a textual output port,
in which case the output SHALL go to that port instead of standard output.

This is the one output procedure this change adds rather than extends; it exists because writing a
string to a port is the operation port-directed output is overwhelmingly used for, and expressing it
as `(for-each (lambda (c) (write-char c port)) (string->list s))` costs a list per write.

#### Scenario: write-string writes contents without quoting

- **WHEN** a program evaluates `(write-string "a\"b")`
- **THEN** it writes the three characters `a"b` to standard output — unlike `write`, which would
  quote and escape them

#### Scenario: write-string accepts an optional port

- **WHEN** a program opens an output string port `p`, evaluates `(write-string "hi" p)`, and calls
  `(get-output-string p)`
- **THEN** the result is `"hi"` and nothing was written to standard output

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
here identically — **including the radix and exactness prefixes**. A prefix in the text SHALL take
precedence over the `radix` argument. The default radix SHALL be 10; radices 2, 8, 10, and 16 SHALL
be accepted for exact integers. An inexact result SHALL require radix 10; a non-decimal radix applied
to non-integer text SHALL raise an error, which R7RS permits.

Where the **reader** reports an implementation restriction for a number it cannot represent,
`string->number` SHALL instead return `#f`, as R7RS §6.2.6 specifies for a number that cannot be
represented.

#### Scenario: Integers, flonums, and failure

- **WHEN** a program evaluates `(string->number "42")`, `(string->number "-2.5")`,
  `(string->number "abc")`, and `(string->number "")`
- **THEN** the results are `42`, the flonum `-2.5`, `#f`, and `#f`

#### Scenario: Radix parsing

- **WHEN** a program evaluates `(string->number "ff" 16)`, `(string->number "1010" 2)`, and
  `(string->number "ff" 10)`
- **THEN** the results are `255`, `10`, and `#f`

#### Scenario: Prefixed text parses without a radix argument

- **WHEN** a program evaluates `(string->number "#x1f")`, `(string->number "#b1010")`, and
  `(string->number "#i42")`
- **THEN** the results are `31`, `10`, and the flonum `42.0`

#### Scenario: A prefix wins over the radix argument

- **WHEN** a program evaluates `(string->number "#x10" 10)`
- **THEN** the result is `16`

#### Scenario: An unrepresentable number answers #f rather than raising

- **WHEN** a program evaluates `(string->number "1/2")`
- **THEN** the result is `#f`, and no error is raised

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

The tokens SHALL be recognized **case-insensitively**, so `+INF.0`, `+Inf.0`, `-INF.0`, and
`+NaN.0` read as the same numbers as their lowercase spellings. R7RS §7.1.1 makes the whole
numeric syntax case-insensitive, and a reader that accepts only one casing turns an ordinary
capitalization into an identifier. The printer SHALL continue to emit the lowercase spellings, so
the shape of existing output does not move.

This SHALL close the write/read round trip for every value the printer can produce: since
`(/ 1.0 0.0)` prints as `+inf.0`, feeding a program's own output back through the reader SHALL
NOT silently turn a number into an identifier. Both readers SHALL agree, so a datum has the same
meaning on every door.

#### Scenario: The non-finite tokens read as numbers

- **WHEN** a program evaluates `(number? (read-from-string "+inf.0"))`,
  `(number? (read-from-string "-inf.0"))`, and `(number? (read-from-string "+nan.0"))`
- **THEN** all three results are `#t`, and none of the three is a symbol

#### Scenario: The non-finite tokens are case-insensitive

- **WHEN** a program reads `"+INF.0"`, `"-Inf.0"`, and `"+NaN.0"`
- **THEN** the results are positive infinity, negative infinity, and a NaN — each a number, none a
  symbol

#### Scenario: Round trip through write and read

- **WHEN** a program divides `1.0` by `0.0`, prints the result, and reads that text back
- **THEN** the value read is a number equal to the original infinity, not the symbol `+inf.0`

#### Scenario: Both doors agree

- **WHEN** the same source containing `+inf.0` is read by the prelude reader and by the
  bootstrap reader
- **THEN** both produce the same numeric datum

### Requirement: The reader accepts R7RS radix and exactness prefixes

Both readers — the prelude's `read-from-string`/`read` and `string->number` — SHALL accept the R7RS
§6.2.5 number prefixes: the radix prefixes `#b`, `#o`, `#d`, `#x` and the exactness prefixes `#e`,
`#i`. Prefix letters SHALL be accepted in either case, as SHALL hexadecimal digits. At most one
radix prefix and at most one exactness prefix may appear, in either order, so `#x#e1f` and `#e#x1f`
are both valid and denote the same number.

A decimal point or exponent SHALL be accepted only under radix 10 (explicit `#d` or no radix
prefix); combined with another radix it SHALL be reported as invalid number syntax naming the
token. `#i` SHALL yield the inexact value of the number that follows. `#e` SHALL yield the exact
value where this implementation represents it, and otherwise SHALL report an implementation
restriction as below.

A token beginning with `#` that is not a valid prefixed number, a boolean, a character, a vector, a
bytevector, or a comment SHALL be reported as unrecognized syntax naming the token, rather than
interned as a symbol.

#### Scenario: Radix prefixes read as exact integers

- **WHEN** a program reads `"#x1f"`, `"#b1010"`, `"#o17"`, and `"#d99"`
- **THEN** the results are `31`, `10`, `15`, and `99`, and each is an exact integer

#### Scenario: Prefixes are case-insensitive and accept a sign

- **WHEN** a program reads `"#X1F"` and `"#x-1f"`
- **THEN** the results are `31` and `-31`

#### Scenario: Exactness prefixes

- **WHEN** a program reads `"#i42"`, `"#e1.0"`, and `"#x#e1f"`
- **THEN** the results are the flonum `42.0`, the exact integer `1`, and the exact integer `31`

#### Scenario: A decimal point outside radix 10 is reported

- **WHEN** a program reads `"#x1.8"`
- **THEN** compilation or evaluation reports invalid number syntax naming the token, rather than
  producing a symbol

#### Scenario: Round trip through number->string with a radix

- **WHEN** a program evaluates
  `(read-from-string (string-append "#x" (number->string 255 16)))`
- **THEN** the result is `255`

### Requirement: Rational literal syntax is reported, not read

Emit represents exact integers within the fixnum range and has no exact rationals or bignums. R7RS
§6.2.3 permits two responses to an exact literal outside what an implementation represents: report a
violation of an implementation restriction, or represent the number inexactly. The reader SHALL
**report**, naming the literal, and SHALL NOT intern it as a symbol — which is neither response.

The report SHALL be for the **syntax**, not for the particular value: `n/m` SHALL be reported
whatever its value and whatever prefix precedes it, including `4/2` and `#i1/2`, whose values Emit
can represent. Partial acceptance would advertise a notation the implementation does not have.

`#e` applied to a non-integral decimal (`#e0.5`) SHALL be reported on the same grounds, though it is
an exactness conversion rather than rational syntax.

The choice of *report* over *represent inexactly* matches the answer Emit already gives for the
other unrepresentable exact literal: an out-of-range exact integer traps rather than silently
becoming a flonum or a wrapped value.

#### Scenario: A rational literal is reported, not interned

- **WHEN** a program reads `"1/2"`
- **THEN** an error names the literal and says that rational literal syntax is not supported, and
  the result is not the symbol `1/2`

#### Scenario: A representable rational is reported too

- **WHEN** a program reads `"4/2"` and `"#i1/2"`
- **THEN** both are reported, rather than reading as `2` and `0.5` — the refusal is of the syntax

#### Scenario: `#e` on a non-integral decimal is reported

- **WHEN** a program reads `"#e0.5"`
- **THEN** an error names the literal rather than returning a flonum or a symbol

#### Scenario: The division is still available

- **WHEN** a program evaluates `(/ 1 2)`
- **THEN** the result is the flonum `0.5`, unchanged by this requirement

### Requirement: Bar-quoted identifiers read, and write emits them when needed

The reader SHALL accept R7RS §7.1.1 bar-quoted identifier syntax: `|` opens an identifier that runs
to the matching `|`, and the characters between them — including whitespace, delimiters, and
characters that would otherwise start another datum — form the symbol's name. The escapes `\|` and
`\xHH…;` SHALL be recognized inside the bars.

A bar-quoted identifier SHALL produce an ordinary interned symbol: there is no distinct type, so
`(eq? (quote |foo|) (quote foo))` is `#t` and `|foo bar|` is `eq?` to
`(string->symbol "foo bar")`.

An unterminated `|` SHALL be reported the way an unterminated block comment is — as an error at the
reader's entry points, and as *incomplete* to the interactive completeness probe.

#### Scenario: A bar-quoted identifier reads as a symbol

- **WHEN** a program evaluates `(symbol->string (read-from-string "|foo bar|"))`
- **THEN** the result is the string `foo bar`

#### Scenario: Bars do not create a distinct symbol

- **WHEN** a program evaluates `(eq? (read-from-string "|foo|") (quote foo))`
- **THEN** the result is `#t`

#### Scenario: Escapes inside bars

- **WHEN** a program reads `"|a\\|b|"` and `"|a\\x41;b|"`
- **THEN** the resulting symbol names are `a|b` and `aAb`

#### Scenario: A symbol needing bars round-trips through write and read

- **WHEN** a program writes `(string->symbol "a b")` and reads that text back
- **THEN** the text is `|a b|` and the value read is `eq?` to the original symbol

### Requirement: An unterminated construct is reported, not read as end of input

An unterminated construct SHALL be reported by every reader entry point — `read-from-string`,
`read-all-from-string`, and `read` over a port — as an error naming the position where the construct
**opened**. It SHALL NOT be treated as end of input, which would silently discard every form after
the opening delimiter, or silently supply the missing delimiter and yield a datum the source does not
contain.

This SHALL hold for every construct that has a closing delimiter:

- a nested block comment `#|`;
- a list `(` or `[`, and the vector and bytevector forms `#(` and `#u8(`;
- a string `"`, including one whose final character is a backslash beginning an escape the input ends
  before completing — which SHALL be reported rather than read past the end of the input;
- a bar-quoted identifier `|`;
- a datum comment `#;` with no following datum.

Naming the opening position is what makes the report useful: the closing delimiter is missing, so
end of input is not where the mistake is. A truncated source is therefore reported at the construct
the author left open.

Because the reader's lexeme layer performs no raising, the unterminated condition SHALL be carried
outward as a value and turned into an error by the entry point, so that a consumer which needs a
different answer — notably the interactive input-completeness probe, which needs "incomplete" —
can give one from the same signal. A consumer answering "incomplete" for text a batch read reports
as an error is the intended arrangement, not a disagreement: see `compiler-embedding`, "The
input-completeness probe agrees with the reader about comments and quoted identifiers".

#### Scenario: An unterminated block comment is an error

- **WHEN** a program reads `"#| never closed"`
- **THEN** an error names the unterminated comment, rather than returning end-of-file

#### Scenario: Forms after an unterminated comment are not silently dropped

- **WHEN** a source is `"(display 1)\n#| oops\n(display 2)"` and every top-level form is read
- **THEN** the read is reported as an error naming the unterminated comment, rather than returning
  only the first form

#### Scenario: An unterminated list is an error, not a closed list

- **WHEN** a program reads `"(a b"`
- **THEN** an error names the unterminated list and the index the `(` opened at, rather than
  returning the list `(a b)`

#### Scenario: A truncated source does not compile as though complete

- **WHEN** a source file is `"(display (list 1 2 3)"` — missing one closing paren — and is run
- **THEN** the read is reported as an error naming the unterminated list, and the program does not
  run and does not exit zero

#### Scenario: An unterminated string is an error

- **WHEN** a program reads `"\"abc"` — an opening quote with no closing quote
- **THEN** an error names the unterminated string and the index the `"` opened at, rather than
  returning the string `"abc"`

#### Scenario: A string ending in a dangling escape is an error

- **WHEN** a program reads a source whose text ends with `"abc\` — an opening quote, three
  characters, and a trailing backslash
- **THEN** an error names the unterminated string, and no character beyond the end of the input is
  read

#### Scenario: An unterminated vector and bytevector are errors

- **WHEN** a program reads `"#(1 2"`, and separately `"#u8(1 2"`
- **THEN** each is reported as an error naming the unterminated construct and its opening index,
  rather than returning a two-element vector or bytevector

#### Scenario: An unterminated construct nested inside another names the inner one

- **WHEN** a program reads `"(a (b c"`
- **THEN** the error names the position the **inner** `(` opened at, since that is the construct
  whose closing delimiter is missing

#### Scenario: A datum comment awaiting its datum is an error on a batch read

- **WHEN** a program reads `"(display 1)\n#;"` and every top-level form is read
- **THEN** an error is reported rather than returning only the first form

### Requirement: A program's reported final value suppresses the unspecified value

A program SHALL report its final value on completion, using the runtime's write-style value printer.
When that value is **the unspecified value**, the program SHALL print nothing for it — neither the
value's written representation nor a trailing newline. Any other final value, including `#f` and
`()`, SHALL be printed as before.

This is the program-level counterpart of the interactive door's existing echo-suppression rule
(`interactive-repl`, "Read-eval-print loop prints results interactively"). The two SHALL agree: a
form that prints nothing at the prompt SHALL print nothing as a program's last form, so the
development loop and the delivered artifact do not disagree about the same value.

**It is a reporting policy, not a property of the value.** An explicit `(write (if #f #f))` or
`(display (if #f #f))` SHALL still render `#<unspecified>`, as the unspecified value's own
requirement demands; suppression applies only to the automatic report of the program's final value.
Output the program itself produced is unaffected.

The rule SHALL hold identically on every exit — running in process, a delivered native executable,
the batch JIT, and bitcode — so that a program's standard output is byte-identical however it is
run. This is what makes the suppression safe: the doors continue to agree, which is the property the
unsuppressed report existed to protect.

This requirement is why the unspecified value must remain distinct from `#f` and `()`: those are
legitimate final values that must still print.

#### Scenario: A program ending in output prints no trailing value

- **WHEN** a program whose last form is `(newline)` (or any form yielding the unspecified value) is
  run
- **THEN** its standard output is exactly the output the program produced, with no `#<unspecified>`
  line appended

#### Scenario: A delivered executable agrees with the in-process run

- **WHEN** the same program is run in process and as a delivered native executable
- **THEN** the two produce byte-identical standard output

#### Scenario: A legitimate #f or empty-list final value still prints

- **WHEN** a program's final value is `#f`, and separately when it is `()`
- **THEN** each is printed, because suppression applies only to the unspecified value

#### Scenario: An explicit write of the unspecified value is unaffected

- **WHEN** a program evaluates `(write (if #f #f))`
- **THEN** it writes `#<unspecified>`, because the suppression is a policy of the final-value report
  and not of the value printer

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

`list-set!` is provided, under the mutable-pairs requirement: it mutates a pair, and its earlier
absence was solely the absence of `set-car!`/`set-cdr!`.

#### Scenario: assv finds by eqv?

- **WHEN** a program evaluates `(assv 2 (quote ((1 a) (2 b))))`
- **THEN** the result is `(2 b)`

#### Scenario: list-copy allocates fresh pairs

- **WHEN** a program evaluates `(let* ((a (list 1 2)) (b (list-copy a))) (list (equal? a b) (eq? a b)))`
- **THEN** the result is `(#t #f)`

#### Scenario: list-copy of a non-pair

- **WHEN** a program evaluates `(list-copy 7)`
- **THEN** the result is `7`

### Requirement: Pairs are mutable

The compiler SHALL provide `set-car!` and `set-cdr!`, each storing into the corresponding field of
an existing pair and returning an unspecified value, so that pairs are mutable like the other
aggregates the compiler already provides (vectors, strings, bytevectors, records).

Both SHALL verify that their first argument is a pair before storing, under the wrong-typed-argument
requirement — a mutator that stored through an unverified pointer would be an unchecked *write*,
strictly worse than the unchecked reads it accompanies.

`list-set!` SHALL be provided, completing the deferral recorded against `assv`/`list-copy`:
`(list-set! list k obj)` SHALL store `obj` into the `k`-th pair of `list`.

Mutating a **literal** — a pair that came from a quoted constant — is undefined, consistent with the
existing treatment of string and vector literals. It SHALL NOT be checked, and it SHALL NOT be
memory-unsafe: a quoted pair is an ordinary heap pair, so the store is well-defined at the
representation level whatever its meaning at the language level.

#### Scenario: set-car! and set-cdr! mutate in place

- **WHEN** a program evaluates `(let ((x (list 1 2))) (set-car! x 9) x)`, and separately
  `(let ((x (list 1 2))) (set-cdr! x (quote (7))) x)`
- **THEN** the results are `(9 2)` and `(1 7)`

#### Scenario: The mutation is visible through every reference to the pair

- **WHEN** a program binds two names to the same pair, mutates it through one, and reads the other
- **THEN** the read observes the mutation — the store reached the shared pair, not a copy

#### Scenario: A circular structure can be constructed

- **WHEN** a program evaluates `(let ((x (list 1))) (set-cdr! x x) (eq? x (cdr x)))`
- **THEN** the result is `#t`

#### Scenario: A non-pair argument traps

- **WHEN** a program evaluates `(set-car! 7 1)`, and separately `(set-cdr! (quote ()) 1)`
- **THEN** each aborts with a type diagnostic rather than storing through the computed address

#### Scenario: list-set! stores into the k-th pair

- **WHEN** a program evaluates `(let ((xs (list 1 2 3))) (list-set! xs 1 9) xs)`
- **THEN** the result is `(1 9 3)`

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
