# interactive-repl Specification

## Purpose

Defines the interactive read-eval-print loop: a persistent top-level environment in which
top-level `define`s survive across entered forms and may be redefined, incremental
per-form compilation to independent LLVM IR modules, execution in a single long-lived LLVM
ORC/LLJIT process (shared GC heap, symbol table, and runtime), and interactive printing of
each form's value. Whole-program (batch) compilation is unchanged.
## Requirements
### Requirement: Persistent top-level environment across forms

In REPL mode the compiler SHALL treat each entered form independently and SHALL bind
top-level `define`s as persistent global bindings that remain visible to every
subsequently entered form, rather than folding all top-level forms into a single
monolithic `letrec`. Whole-program (batch) compilation SHALL retain its existing
monolithic-`letrec` behavior unchanged.

#### Scenario: A later form sees an earlier definition

- **WHEN** a form `(define x 41)` is entered and then a separate form `(+ x 1)` is entered
- **THEN** the second form evaluates to `42`, resolving `x` to the binding established by
  the first form

#### Scenario: A later definition builds on an earlier one

- **WHEN** `(define (square n) (* n n))` is entered and then `(square 9)` is entered as a
  separate form
- **THEN** the second form evaluates to `81`

#### Scenario: Batch compilation is unaffected

- **WHEN** a program file containing the same sequence of top-level forms is compiled in
  batch mode
- **THEN** it is compiled as a single whole-program module exactly as before this change

### Requirement: Redefinition of top-level bindings

REPL mode SHALL allow a top-level name to be redefined by a later form, after which
references to that name resolve to the most recent definition. Earlier compiled forms
that already captured the previous definition SHALL continue to observe the value they
captured (no retroactive rebinding of already-evaluated code).

#### Scenario: Redefinition takes effect for subsequent forms

- **WHEN** `(define y 1)` is entered, then `(define y 2)`, then `(+ y y)`
- **THEN** the final form evaluates to `4`, using the most recent definition of `y`

#### Scenario: Redefining a procedure

- **WHEN** `(define (f) 10)` is entered, then `(define (f) 20)`, then `(f)`
- **THEN** the final form evaluates to `20`

### Requirement: Incremental per-form compilation to independent modules

REPL mode SHALL compile each entered form into its own LLVM IR module that declares every
previously-defined global binding and every required `rt_*` runtime function as
`external`, defines global slots for any bindings the form introduces, and exposes exactly
one entry thunk that evaluates the form, initializes any new slots, and returns the value
to be printed. A form SHALL be able to reference globals defined by earlier forms and
SHALL NOT be able to reference globals defined by later forms. This compilation SHALL be
performed by the embedded compiler **in-process** — with no Chez Scheme process and no
per-form subprocess — with the compiler's per-form compilation state (the REPL environment,
macro environment, known-names set, and form counter) persisting across forms in the one
host process.

#### Scenario: Prior globals are referenced as external

- **WHEN** a form that uses an earlier-defined binding is compiled
- **THEN** its emitted module declares that binding's global symbol and the `rt_*`
  functions it uses as `external`, and defines only the globals the form itself introduces

#### Scenario: Forward references are rejected

- **WHEN** a form references a name that has not yet been defined by any earlier form
- **THEN** compilation of that form reports an unbound-variable error rather than
  succeeding

#### Scenario: Forms are compiled without Chez

- **WHEN** a sequence of forms is entered in a `--repl` session
- **THEN** each form is compiled by the embedded compiler within the host process (no Chez
  process, no per-form subprocess), and definitions entered earlier remain visible to later
  forms because the compiler's state persists in-process

### Requirement: Persistent JIT host preserves runtime state across forms

REPL mode SHALL execute entered forms in a single long-lived process in which the garbage
collector is initialized exactly once and the GC heap, symbol-intern table, and `rt_*`
runtime persist for the entire session. Each form's module SHALL be added to the running
JIT and its entry thunk resolved and called such that heap values (pairs, closures,
strings, symbols) produced by one form remain valid and usable by later forms.

#### Scenario: Heap values survive across forms

- **WHEN** `(define p (cons 1 2))` is entered and then `(car p)` is entered as a separate
  form
- **THEN** the second form evaluates to `1`, dereferencing the pair allocated during the
  first form without a fresh heap being initialized

#### Scenario: Interned symbols remain eq? across forms

- **WHEN** a symbol is produced in one form and the same symbol is produced in a later
  form and compared with `eq?`
- **THEN** the comparison reports true, because the symbol-intern table persists

### Requirement: Read-eval-print loop prints results interactively

The project SHALL provide an interactive REPL driver that reads a Scheme form from input,
drives the existing reader/expander/codegen to produce the form's IR, executes it in the
persistent JIT host, and prints the resulting value using the runtime value printer, then
awaits the next form. Entering end-of-input SHALL end the session cleanly.

When the form's result is the unspecified value, the REPL SHALL print nothing for that result —
neither the value's written representation nor a trailing newline — and SHALL proceed directly to the
next prompt. Any other value, including `#f` and `()`, SHALL be printed as before. Output the form
itself produced (via `display`, `write`, `newline`, and the like) is unaffected: suppression applies
only to the echo of the result.

This keeps side-effecting forms quiet at the prompt, matching Chez Scheme's waiter and Racket's REPL,
and is the reason the unspecified value must be distinct from `#f` and `()` — those are legitimate
results that must still print.

#### Scenario: A form is read, evaluated, and printed

- **WHEN** the user enters `(+ 1 2)` at the REPL prompt
- **THEN** the REPL prints `3` and prompts for the next form

#### Scenario: End of input ends the session

- **WHEN** the input stream reaches end-of-file
- **THEN** the REPL exits cleanly without error

#### Scenario: A side-effecting form echoes nothing

- **WHEN** the user enters `(display "hi")` at the REPL prompt
- **THEN** the REPL prints `hi` — the form's own output — and then prompts for the next form with no
  echoed result value, rather than printing `hi()`

#### Scenario: An unspecified result from a mutation echoes nothing

- **WHEN** the user enters `(vector-set! v 0 1)` at the REPL prompt
- **THEN** the REPL prints nothing and prompts for the next form

#### Scenario: A top-level define echoes nothing

- **WHEN** the user enters `(define square (lambda (n) (* n n)))` at the REPL prompt
- **THEN** the REPL prints nothing and prompts for the next form, rather than echoing
  `#<procedure>` as though the definition evaluated to the procedure
- **AND** a subsequent `(square 7)` prints `49`, so the definition took effect

#### Scenario: Legitimate #f and empty-list results still print

- **WHEN** the user enters `(null? 1)` and then `(list)` at the REPL prompt
- **THEN** the REPL prints `#f` and then `()` — suppression applies only to the unspecified value, not
  to falsity or emptiness

### Requirement: Persistent JIT host stays in sync with the runtime source

Before the persistent JIT host is used — whether launched by `emit repl` or by a REPL
test harness — the project SHALL ensure the `emit` binary is up to date with respect to
the runtime, host, and embedded-compiler sources it links. The `emit` binary SHALL be
(re)built whenever `src/runtime/runtime.c`, the merged `emit` host source (the run/REPL
dispatch), the assembled/compiled compiler it embeds (and the core sources behind it),
or the build recipe is newer than the existing binary, so that every `rt_*` runtime
function and the embedded compiler entry the host relies on are present and resolvable.
It SHALL NOT be sufficient for the binary to merely exist; an out-of-date binary SHALL
be rebuilt before use.

#### Scenario: A newly added runtime function is available to the prelude

- **WHEN** a new `rt_*` function is added to `src/runtime/runtime.c` and `emit repl` is
  then started (via the driver or a test harness) with an `emit` binary that predates
  the change
- **THEN** the binary is rebuilt before the first form is evaluated, and a prelude
  procedure that uses the new runtime function resolves and evaluates successfully instead
  of failing with `Failed to materialize symbols`

#### Scenario: A compiler-source change rebuilds the host

- **WHEN** a compiler core source (a pass, `emit`, or the assembly step) is changed and
  `emit repl` is then started with an `emit` binary that predates the change
- **THEN** the binary is rebuilt before the first form is evaluated, so the REPL compiles
  forms with the updated compiler rather than a stale embedded copy

#### Scenario: An up-to-date host is not rebuilt

- **WHEN** `emit repl` is started and `build/emit` is newer than `runtime.c`, the merged
  host source, the embedded compiler, and the build recipe
- **THEN** the freshness check performs no compilation and the session starts without
  rebuilding the binary

#### Scenario: A prelude-defined global resolves across forms

- **WHEN** the REPL loads the standard prelude and a later form references a
  prelude-defined global procedure such as `(map (lambda (x) (* x x)) (quote (1 2 3 4)))`
- **THEN** the form evaluates to `(1 4 9 16)`, because the prelude batch module
  materialized successfully and its global slots are resolvable

### Requirement: The session's standard library does not depend on the manifest

A REPL session's standard library SHALL come from the baked library set registered at startup, so
that the availability of `(scheme base)` and the derived-form macros does **not** depend on the
directory the session was started in, on whether a manifest was found, or on what that manifest
names. Starting a session in a project directory SHALL never produce a session in which
standard-library names are unbound.

`--no-prelude` SHALL remain the single way to start a session without the standard library, and SHALL
skip registering the baked set entirely. A session started that way SHALL report an unbound variable
for a standard-library name, as it does today.

#### Scenario: A session in a project directory resolves standard-library names

- **WHEN** `emit repl` starts in a directory whose manifest names only that project's own libraries,
  and the user evaluates a form calling `map`
- **THEN** the form returns its value, and no warning is printed that `(scheme base)` is unloaded

#### Scenario: A session with no manifest at all resolves standard-library names

- **WHEN** `emit repl` starts in a directory with no manifest present and no manifest installed
- **THEN** the session starts with the standard library available, and a form using a derived form
  such as `cond` over a standard-library procedure evaluates correctly

#### Scenario: --no-prelude still yields a bare session

- **WHEN** `emit repl --no-prelude` starts and the user references a standard-library name
- **THEN** the session reports an unbound variable, and the baked set was not registered

### Requirement: Session startup reports what it registered

Session startup SHALL follow the project output convention (`docs/OUTPUT.md`): the baked members it
registered SHALL be reported on standard error at verbose verbosity, absent at default and quiet
verbosity, and SHALL never be written to standard output. A failure to register or initialize a baked
member SHALL be reported at every verbosity as an error rather than leaving the session silently
without a standard library.

#### Scenario: Registration detail is verbose-only

- **WHEN** a session starts at default verbosity and again at `EMIT_VERBOSITY=verbose`
- **THEN** the verbose run names the registered baked members on standard error while the default run
  does not, and the interactive results printed by both are identical

#### Scenario: A failure to initialize the standard library is loud

- **WHEN** a baked member's registration or initialization fails at session startup
- **THEN** the session reports the failure as an error naming the member, rather than continuing into
  a prompt where standard-library names are unbound

