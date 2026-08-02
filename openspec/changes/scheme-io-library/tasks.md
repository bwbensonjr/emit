## 1. Baselines, before anything moves

- [x] 1.1 Capture the size baseline this change is judged against (design D5): `hello.scm` and one demo built through the AOT ship path, plus `build/lib/scheme.base.ll` — binary size is a first-class criterion here and cannot be reconstructed after `(scheme base)` grows
- [x] 1.2 Capture the emitted IR for a program using `display`/`write`/`newline`/`write-char` with NO port argument; it must come out byte-identical at the end, which is what "existing programs are unaffected" means concretely

## 2. Runtime: the eof object and the handle table (design D1, D3)

- [x] 2.1 Add `SUB_EOF` as misc-immediate subtype 3 in `src/runtime/runtime.c`, the slot the existing comment reserves ("further singletons (eof-object) can take new subtypes"), with its constructor/predicate entry points
- [x] 2.2 Teach `print_val` to render the eof object, so `display`/`write` of it is not a fault or a wrong tag walk
- [x] 2.3 Add the `FILE *` handle table: open (read/write), close, flush, and write-string against a small integer index. A closed or out-of-range index SHALL be a checked error, which is the whole reason for the table over a raw pointer
- [x] 2.4 Add `rt_read_file` — `rt_read_all_stdin`'s slurp with `fopen`; report a failed open as an error rather than an empty string, so a missing file is not silently an empty one
- [x] 2.5 Reach `print_val` through a handle so output can be directed at a port; `rt_display`/`rt_write`/`rt_stderr_write` keep their current fixed-destination behaviour

## 3. Primitive layer

- [x] 3.1 Register the new primitives in `*prims*` (`src/parse.ss`) and their prim→runtime mapping and externs (`src/emit.ss`); no `primitive-layer` spec change is needed — its requirements are generic over any primitive
- [x] 3.2 Confirm each new primitive inherits the layer's four properties (universal without importing `(scheme base)`, first-class, shadowable, bare primcall when called directly and unshadowed)

## 4. Ports in `(scheme base)` (design D1, D2)

- [x] 4.1 Define the port record type in `src/prelude.scm` with the fields both directions need, and `port?` / `input-port?` / `output-port?` / `textual-port?` over `%record-of-type?`
- [x] 4.2 Input ports: `open-input-string`, and `open-input-file` as the same constructor fed by `rt_read_file` — slurp-on-open is what makes a file port and a string port one object
- [x] 4.3 `read-char`, `peek-char`, `read-line`, `read-string` over the string-plus-cursor representation, each returning the eof object at end of input
- [x] 4.4 `read` as `rd-datum` at the port's cursor, storing the returned next-index back — the existing reader already returns `(datum . next-index)`, so this is a cursor discipline, NOT a second reader
- [x] 4.5 Output ports: `open-output-file` over the handle table, `open-output-string` / `get-output-string` accumulating in the record, `flush-output-port`, and `close-port` for both directions (flush before close; closing twice is permitted)
- [x] 4.6 `current-output-port` / `current-input-port` / `current-error-port` as **parameter objects** over `make-parameter` (design D4 is SUPERSEDED — `dynamic-extent` shipped `make-parameter` / `parameterize` / `dynamic-wind`, which is why this change was sequenced after it), initialized to the stdout / stdin / stderr ports. A parameter is callable with zero arguments, so `(current-output-port)` reads identically to the plain accessor it replaces
- [x] 4.7 `with-output-to-file` / `with-input-from-file`, rebinding the corresponding parameter for the dynamic extent of a thunk, and `call-with-port`. Each closes the port and restores the parameter via `dynamic-wind`, so cleanup survives a non-local exit
- [x] 4.8 Regenerate `lib/scheme/base.sld` via `tools/gen-scheme-base.ss` and confirm `test/scheme-base-gen-check.sh` passes

## 5. Port-directed output

- [x] 5.1 Give `display`, `write`, `newline`, and `write-char` an optional port argument routing to the port's handle; omitted, each keeps its current behaviour exactly
- [x] 5.2 Add `write-string` (string, optional port), writing contents literally — no quoting, no escaping — so it is `display` narrowed to strings rather than `write`. The only output procedure this change adds rather than extends
- [x] 5.3 Check the arity story: these are primitives today, and an optional argument may mean a prelude wrapper over the raw primcall — if so, confirm a direct unshadowed call still reaches bare-primcall codegen, or record what it costs
- [x] 5.4 The 1.2 IR baseline is unchanged for the no-argument forms

## 6. Verification

- [x] 6.1 The round trip that motivated the change: open a file for output, write, close, open it for input, read it back — through all three doors (AOT, run, REPL)
- [x] 6.2 `read` over a port returns successive data and then the eof object, and skips leading whitespace and comments
- [x] 6.3 `peek-char` does not consume; `read-line` splits correctly including a final unterminated line; `read-string` returns short only at end of input
- [x] 6.4 A file port and a string port produce identical results for the same text and the same operation sequence — the claim that makes slurp-on-open worth it
- [x] 6.5 Error paths, each a diagnostic rather than a fault: opening a nonexistent file, reading a closed port, `get-output-string` on a file port
- [x] 6.6 `write-string` writes contents literally — `(write-string "a\"b")` emits `a"b`, where `write` would quote and escape — both to stdout and to a port
- [x] 6.7 **Cleanup on a non-local exit (design risk, not the happy path):** `with-output-to-file` redirects for the dynamic extent and restores the parameter afterwards; `call-with-port` closes its port on normal return, on an escape via a continuation, AND on a raise. The escaping cases are the point — a test that only exercises normal return does not test `dynamic-wind`
- [x] 6.8 The eof object is distinct from `#f`, `'()`, and the unspecified value, and prints without faulting
- [x] 6.9 **Size (design D5):** re-measure 1.1. Report the delta on `hello.scm` explicitly. A material regression is a reason to reconsider putting ports in a separate library, not a footnote — the tree-shake protecting this must be MEASURED, since `(scheme base)` is imported by everything. Capture the 1.1 baseline fresh rather than comparing against any number recorded before `simplify-known-calls` (2026-08-01), which moved every binary
- [x] 6.10 New suite registered in `run-all-tests.sh`; `./run-all-tests.sh` and `./run-dev-tests.sh` green
- [x] 6.11 `make regen` reconverges and `test/trust-check.sh` passes on the commit. Unlike the last two changes `bootstrap/scheme.base.ll` legitimately MOVES here; confirm the compiler's own behaviour is unchanged (`self-emit-equiv`, `self-host-fixpoint`, `dump-parity`)

## 7. Close-out

- [x] 7.1 `docs/PRIMITIVES.md` for the new primitives; a docs note on the slurp-on-open limitation where a user will meet it, not only in the design
- [x] 7.2 Record the deliberate R7RS gaps where a reader looks: `char-ready?` is omitted (vacuous under slurp-on-open — see the proposal), binary ports are out of scope, and `(scheme file)` operations (`file-exists?`, `delete-file`) are a separate change
- [x] 7.3 Resolve the design's remaining open questions with what the implementation showed: ports in `(scheme base)` or a separate library (6.9 decides), and whether sharing `rd-datum` between user `read` and the compiler's front end should be relied on. `char-ready?` is already resolved (omitted)
- [x] 7.4 Note on issue #18 that the file-reading half is now unblocked — the compiler core still stays I/O-free and would take an injected reader
