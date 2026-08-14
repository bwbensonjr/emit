## MODIFIED Requirements

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

