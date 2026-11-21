# Custom record writers

`(emit write)` lets an ordinary library control how its record values print.
The same writer is used for REPL results, `emit run` and standalone program
results, and explicit `write`, `display`, `write-simple`, and `write-shared`,
including values nested in lists and vectors. Ordinary records without a writer
continue to print as `#<record TYPE>`.

```scheme
(import (scheme base) (emit write))

(define-record-type point
  (make-point x y)
  point?
  (x point-x)
  (y point-y))

(set-record-type-writer! (make-point 0 0)
  (lambda (value port mode recur)
    (display "(point " port)
    (recur (point-x value))
    (display " " port)
    (recur (point-y value))
    (display ")" port)))

(list (make-point 2 3) (vector (make-point 4 5)))
;; ((point 2 3) #((point 4 5)))
```

The exemplar instance selects its record type. Registration changes printing of
all instances of that type, including instances that already exist. Pass `#f`
instead of a procedure to restore opaque printing. Invalid exemplar and writer
arguments raise catchable errors and leave the existing registration unchanged.
Registration returns the unspecified value. Record equality remains based on
identity; printing two objects alike does not make them equal.

The callback receives `(value port mode recur)`:

- `value` is the instance being rendered.
- `port` is the actual output destination. Write literal delimiters to this port;
  registration and printing do not change `current-output-port`.
- `mode` is one of the symbols `write`, `display`, `write-simple`, or
  `write-shared`. Automatic result printing uses `write`.
- `(recur child)` renders a child at the same destination using the active mode,
  including that child's custom writer. In display mode, strings and characters
  remain unquoted.

The callback's return values are ignored. The printer does not invoke callbacks
during graph discovery. A callback runs once per rendered occurrence, so it
should avoid unnecessary effects. Writer closures can capture private library
state and work when separately compiled or loaded from a library artifact.

`recur` is valid only for its particular callback invocation. Saving it for later
use raises a catchable expired-context error, even if an enclosing callback is
still executing. An explicit Scheme destination port retains its ordinary
identity and lifetime. Automatic output without an existing Scheme port supplies
a borrowed port: closing it raises an error without closing the underlying
destination, and using it after the callback returns raises an expired-port
error.

Custom records form opaque boundaries in graph discovery. Printing an object
already active in a writer emits `#<cycle TYPE>` instead of calling that writer
again. Nested printing maintains independent traversal state, including when a
writer prints another graph to a different port. Existing pair/vector cycle and
sharing behavior is retained within ordinary graph traversals. Arbitrary custom
text need not be readable, and identity, datum-label scope, and readable
reconstruction are not guaranteed across custom-writer boundaries.

Exceptions and runtime traps propagate through the existing Scheme error
handling for explicit printing. Automatic-print failures use the host diagnostic
channel; the REPL can evaluate the next form. Supported nonlocal exits also
restore printer state. Bytes already emitted before a failure remain in the
destination.

The `(malt learner)` package in [emit-packages](https://github.com/bwbensonjr/emit-packages) uses this facility for
distinct dual and tensor records. Duals show their primal numbers, tensors show
`(tensor ...)`, and ordinary vectors keep `#(...)`.

Run `bash test/custom-writers-tests.sh` for native acceptance, including closure
capture across artifacts, three optimization profiles, automatic-print failure
recovery, and borrowed-port lifetime checks. Run
`bash test/custom-writers-tests.sh --reference` for the same core assertions
compiled by the current Chez source driver. Both require the exact completion
marker `(custom-writers-complete 84)`.

Ordinary outermost printing reuses graph bookkeeping after warm-up, including
when unrelated record writers are registered. The cache retains at most 4,096
graph-table slots (96 KiB on a 64-bit target with 24-byte slots); larger tables
are transient. Idle storage clears references to values and destinations.
A bounded 8 KiB array tracks occupied outer slots to keep cleanup proportional to
the latest traversal rather than retained capacity. Nested traversals remain independent, and saved callback renderers or borrowed
ports never become valid again when internal traversal storage is reused.
See the [performance investigation](performance/writer-report.md) for allocation,
timing, size, and retention evidence.
