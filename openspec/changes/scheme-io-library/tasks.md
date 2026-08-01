## 1. Baselines, before anything moves

- [ ] 1.1 Capture the size baseline this change is judged against (design D5): `hello.scm` and one demo built through the AOT ship path, plus `build/lib/scheme.base.ll` — binary size is a first-class criterion here and cannot be reconstructed after `(scheme base)` grows
- [ ] 1.2 Capture the emitted IR for a program using `display`/`write`/`newline`/`write-char` with NO port argument; it must come out byte-identical at the end, which is what "existing programs are unaffected" means concretely

## 2. Runtime: the eof object and the handle table (design D1, D3)

- [ ] 2.1 Add `SUB_EOF` as misc-immediate subtype 3 in `src/runtime/runtime.c`, the slot the existing comment reserves ("further singletons (eof-object) can take new subtypes"), with its constructor/predicate entry points
- [ ] 2.2 Teach `print_val` to render the eof object, so `display`/`write` of it is not a fault or a wrong tag walk
- [ ] 2.3 Add the `FILE *` handle table: open (read/write), close, flush, and write-string against a small integer index. A closed or out-of-range index SHALL be a checked error, which is the whole reason for the table over a raw pointer
- [ ] 2.4 Add `rt_read_file` — `rt_read_all_stdin`'s slurp with `fopen`; report a failed open as an error rather than an empty string, so a missing file is not silently an empty one
- [ ] 2.5 Reach `print_val` through a handle so output can be directed at a port; `rt_display`/`rt_write`/`rt_stderr_write` keep their current fixed-destination behaviour

## 3. Primitive layer

- [ ] 3.1 Register the new primitives in `*prims*` (`src/parse.ss`) and their prim→runtime mapping and externs (`src/emit.ss`); no `primitive-layer` spec change is needed — its requirements are generic over any primitive
- [ ] 3.2 Confirm each new primitive inherits the layer's four properties (universal without importing `(scheme base)`, first-class, shadowable, bare primcall when called directly and unshadowed)

## 4. Ports in `(scheme base)` (design D1, D2)

- [ ] 4.1 Define the port record type in `src/prelude.scm` with the fields both directions need, and `port?` / `input-port?` / `output-port?` / `textual-port?` over `%record-of-type?`
- [ ] 4.2 Input ports: `open-input-string`, and `open-input-file` as the same constructor fed by `rt_read_file` — slurp-on-open is what makes a file port and a string port one object
- [ ] 4.3 `read-char`, `peek-char`, `read-line`, `read-string` over the string-plus-cursor representation, each returning the eof object at end of input
- [ ] 4.4 `read` as `rd-datum` at the port's cursor, storing the returned next-index back — the existing reader already returns `(datum . next-index)`, so this is a cursor discipline, NOT a second reader
- [ ] 4.5 Output ports: `open-output-file` over the handle table, `open-output-string` / `get-output-string` accumulating in the record, `flush-output-port`, and `close-port` for both directions (flush before close; closing twice is permitted)
- [ ] 4.6 `current-output-port` / `current-input-port` / `current-error-port` as procedures returning fixed ports; do NOT define `with-output-to-file` or `with-input-from-file` (design D4 — absent beats silently-not-redirecting)
- [ ] 4.7 Regenerate `lib/scheme/base.sld` via `tools/gen-scheme-base.ss` and confirm `test/scheme-base-gen-check.sh` passes

## 5. Optional port argument on the existing output procedures

- [ ] 5.1 Give `display`, `write`, `newline`, and `write-char` an optional port argument routing to the port's handle; omitted, each keeps its current behaviour exactly
- [ ] 5.2 Check the arity story: these are primitives today, and an optional argument may mean a prelude wrapper over the raw primcall — if so, confirm a direct unshadowed call still reaches bare-primcall codegen, or record what it costs
- [ ] 5.3 The 1.2 IR baseline is unchanged for the no-argument forms

## 6. Verification

- [ ] 6.1 The round trip that motivated the change: open a file for output, write, close, open it for input, read it back — through all three doors (AOT, run, REPL)
- [ ] 6.2 `read` over a port returns successive data and then the eof object, and skips leading whitespace and comments
- [ ] 6.3 `peek-char` does not consume; `read-line` splits correctly including a final unterminated line; `read-string` returns short only at end of input
- [ ] 6.4 A file port and a string port produce identical results for the same text and the same operation sequence — the claim that makes slurp-on-open worth it
- [ ] 6.5 Error paths, each a diagnostic rather than a fault: opening a nonexistent file, reading a closed port, `get-output-string` on a file port
- [ ] 6.6 The eof object is distinct from `#f`, `'()`, and the unspecified value, and prints without faulting
- [ ] 6.7 **Size (design D5):** re-measure 1.1. Report the delta on `hello.scm` explicitly. A material regression is a reason to reconsider putting ports in a separate library, not a footnote — the tree-shake protecting this must be MEASURED, since `(scheme base)` is imported by everything
- [ ] 6.8 New suite registered in `run-all-tests.sh`; `./run-all-tests.sh` and `./run-dev-tests.sh` green
- [ ] 6.9 `make regen` reconverges and `test/trust-check.sh` passes on the commit. Unlike the last two changes `bootstrap/scheme.base.ll` legitimately MOVES here; confirm the compiler's own behaviour is unchanged (`self-emit-equiv`, `self-host-fixpoint`, `dump-parity`)

## 7. Close-out

- [ ] 7.1 `docs/PRIMITIVES.md` for the new primitives; a docs note on the slurp-on-open limitation where a user will meet it, not only in the design
- [ ] 7.2 Record the deliberate R7RS gaps where a reader looks: `current-*-port` are not parameters, `with-output-to-file`/`with-input-from-file` are absent, binary ports and `(scheme file)` operations are out of scope
- [ ] 7.3 Resolve the design's open questions with what the implementation showed: ports in `(scheme base)` or a separate library (6.7 decides), whether `char-ready?` is worth having under slurp-on-open, and whether sharing `rd-datum` between user `read` and the compiler's front end should be relied on
- [ ] 7.4 Note on issue #18 that the file-reading half is now unblocked — the compiler core still stays I/O-free and would take an injected reader
