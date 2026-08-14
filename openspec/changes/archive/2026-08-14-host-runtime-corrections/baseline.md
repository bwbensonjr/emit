# Failing baseline, measured before any edit

`build/emit` at `32d9c79`, branch `feat/host-runtime-corrections` with no source changes. `chez` is
the reference where the form is portable. Every row records a **value or an exit status**, because
three of these defects are silent or partial and an "it errored" assertion would pass against them.

## #90 — neither formatter terminates on a cycle

| shape | measured |
|---|---|
| `(write x)` where `x` is a cyclic list | `(1 2 1 2 1 2 1 2 ...` — killed by a 4s timeout |
| `(write v)` where `v` is a cyclic vector | `#(1 #(1 #(1 #(1 ...` — killed by a 4s timeout |
| `(write x p)` to a **string port** | hangs, `exit 124`; worse than stdout, since the output accumulates in the port's `open_memstream` buffer and grows the heap without bound |
| `(error "boom" x)` with a cyclic irritant | hangs, `exit 124`, and emits **zero bytes** |

The last row is the one the issue only predicted. `err_put` respects `rt_trap_msg`'s capacity, so
copying stops — but `err_write`'s pair loop keeps *walking*, so the process spins forever having
printed nothing at all. Two hangs, two different mechanisms, in the two different formatters
(`print_val` and `err_write`).

## #94 — `write` emits raw control bytes

```
(write (integer->char 7))   ->  #\<BEL>      want #\alarm
(write #\tab)               ->  #\<TAB>      want #\tab
(write (integer->char 27))  ->  #\<ESC>      want #\escape
(write (integer->char 0))   ->  #\<NUL>      want #\null
(write #\space)             ->  #\space      already correct
(write #\A)                 ->  #\A          already correct
```

Only `space` and `newline` are named today. The NUL case is more than illegible: it puts a literal
zero byte in the stream, which was enough to make `grep` classify a captured test log as binary and
print nothing at all — that is how this row was first noticed in this session.

## #96 — an arity mismatch is the one data-shaped condition still fatal

```scheme
(define (f a b) (+ a b))
(guard (e (#t 'caught)) (apply f (list 1)))
```

```
arity error: expected 2 argument(s), got 1
emit run: trap: arity error: expected 2 argument(s), got 1
exit 1
```

The `guard` never runs. The contrast, on the same binary: `(guard (e (#t 'caught)) (vector-ref
(vector 1) 9))` answers `caught`. The program aborts at the arity call, so a second `display` after
it never executes.

## #97 — a compiler-internal trap ends the REPL session

The issue calls this latent. It is not.

```console
$ printf '(define-values (x y . z) (values 1 2 3))\n(display 42)\n' | build/emit repl
Emit (embedded compiler, ORC/LLJIT).  ^D to exit.
> car: not a pair: got a symbol        # stderr, no !trap: line
$ echo $?
1                                      # session gone; (display 42) never ran
```

```console
$ printf '(vector-ref (vector 1) 9)\n(display 42)\n' | build/emit repl
> vector-ref: index out of range: 9 (length 1)
!trap: vector-ref: index out of range: 9 (length 1)
> 42
$ echo $?
0                                      # user-code trap: reported, session survives
```

`define-values` is the probe because it is the shortest form that makes the **compiler** trap (#91 —
the frontend destructures unsupported forms with bare `car`). `letrec-syntax` and the non-dotted
`define-values` are *not* probes: they report `unbound variable`, an in-language `error`, which
`src/repl-core.ss`'s `guard` catches and reports as `error: repl: ...`. That contrast is the evidence
that the guards work for everything except a trap.

## #77 — comparison coerces the exact operand

```scheme
(list (= 9007199254740992.0 9007199254740993)
      (< 9007199254740992.0 9007199254740993)
      (= 9007199254740993 9007199254740992.0)
      (max 1 2.0)
      (min 1 2.0))
```

| | emit | chez |
|---|---|---|
| result | `(#t #f #t 2.0 1.0)` | `(#f #t #f 2.0 1.0)` |

Three of the five are wrong; the operands are inside the fixnum range, so no bignum is involved.
`max`/`min` already agree — inexactness contagion applies to them because they return a value, and
this change must not disturb that.
