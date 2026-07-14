## ADDED Requirements

### Requirement: Closure code is correct under self-compilation

The code generator SHALL emit correct code for closures (`lambda`, and the `let`/`letrec`/
define-of-procedure forms that lower to them) at any program scale, including when the
compiler compiles its own source. In particular, the native `schemec` (the compiler compiled
by scheme-llvm) SHALL compile closure-bearing programs to the same IR the Chez-hosted compiler
emits, without raising a spurious arity error or crashing. Argument counts passed at calls
emitted for closure bodies SHALL equal the actual number of arguments.

#### Scenario: schemec compiles a lambda application

- **WHEN** the self-built `schemec` is given a program that produces a closure — e.g.
  `((lambda (x) x) 5)`, `(let ((x 5)) (+ x 1))`, `(define (f n) n) (f 5)`, or
  `(letrec ((f (lambda (n) n))) (f 3))`
- **THEN** it emits IR (no `arity error`, no crash) that is byte-identical to the IR the
  Chez-hosted compiler emits for the same program

#### Scenario: closure programs remain correct through the Chez-hosted compiler

- **WHEN** the existing demo programs that build closures (`toplevel`, `counter`,
  `named-let-loop`, and the new closure regression case) are compiled by the Chez-hosted
  compiler across all three backends
- **THEN** each produces its expected value, and the AOT, JIT, and bitcode results agree
