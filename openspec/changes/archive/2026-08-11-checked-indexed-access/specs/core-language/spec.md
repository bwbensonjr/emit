## ADDED Requirements

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

**Scope: this constrains bounds, not types.** The index is assumed to be a fixnum and the object is
assumed to be of the accessor's type; supplying either of the wrong type remains "an error" under the
existing unchecked semantics recorded for type confusion (e.g. `(car x)` for a non-pair `x`). That
decision is deliberately left in force: checking a *type* means a tag test on arguments that are
correctly typed in every working program, whereas the bound checked here is a word in the object's own
header that the accessor already loads. A later change MAY revisit type checking independently
without altering this requirement.

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

#### Scenario: Both doors agree, and the in-process host survives

- **WHEN** the same out-of-range program is run under the in-process runner and as a standalone
  executable
- **THEN** both report the same diagnostic; the executable exits non-zero, and the runner's host
  survives the trap and evaluates a subsequent form

#### Scenario: In-range access is unaffected

- **WHEN** a program indexes every element of a vector, string, and bytevector from `0` to
  `length - 1`
- **THEN** every access returns the value it returned before this requirement, with no diagnostic
