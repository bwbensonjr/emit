## ADDED Requirements

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

## MODIFIED Requirements

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

### Requirement: Variadic procedures, rest parameters, and apply

The compiler SHALL accept variadic `lambda` forms — dotted rest parameters
`(lambda (a b . rest) …)` and an all-arguments rest `(lambda args …)` — binding the rest
parameter to a proper list of the excess arguments. The compiler SHALL support `apply`
(`(apply f a1 … aN lst)`), passing `a1 … aN` followed by the elements of `lst` as the
arguments to `f`, for lists of arbitrary length. Fixed-arity procedures SHALL be
arity-checked at call time: a mismatch reports an error and aborts.

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

- **WHEN** a fixed-arity procedure is called with the wrong number of arguments
- **THEN** the program reports an arity error and exits non-zero (rather than silently
  computing a wrong result)

#### Scenario: Tail calls still bounded

- **WHEN** a tail-recursive fixed-arity loop is compiled after this change
- **THEN** it still compiles as `musttail` and runs in bounded stack, and its hot path
  performs no rest-list allocation

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
