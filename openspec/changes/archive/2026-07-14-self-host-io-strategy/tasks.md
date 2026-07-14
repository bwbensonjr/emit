## 1. Resolve the fork

- [x] 1.1 Confirm path C (grow two I/O primitives) over path A (host embedding); record the decision in design.md. Path A stays a deferred follow-up. — recorded in design.md D1.

## 2. I/O primitives

- [x] 2.1 Add `rt_read_all_stdin` to `src/runtime/runtime.c`: read stdin to EOF into a growable buffer, return a scheme string.
- [x] 2.2 Add `rt_display` to `src/runtime/runtime.c`: write a scheme string's bytes to stdout verbatim (no quotes/newline), return an unspecified value.
- [x] 2.3 Register `read-all-stdin` and `display` in `src/parse.ss` (`*prims*`) and `src/emit.ss` (prim table + `rt-declarations`); rebuild the REPL host runtime. — host rebuilt via `make build/repl-host`.

## 3. Verification

- [x] 3.1 Demo/test: a program that `(display "…")` writes exactly those bytes (no quotes/newline) to stdout; a program that echoes `read-all-stdin` round-trips piped input. — `test/io-primitives-tests.sh` (3 cases: raw display, round-trip, empty stdin), wired into `run-all-tests.sh`.
- [x] 3.2 Run `./run-all-tests.sh`; all suites pass. — 10/10 suites pass (incl. the new `process-I/O primitives` suite).
- [x] 3.3 Hand off to [[self-hosting-bootstrap]]: with G1/G2/G3 closed, the assembled core + `(display (compile-source-string (read-all-stdin)))` main can build to a native `schemec` (resume at task 2.1 there). **Caveat surfaced during 3.1:** the standalone `main` unconditionally prints the program's final value (`rt_write` + newline), so a `(display …)` filter emits its bytes followed by `()\n`. The native `schemec` therefore needs a **filter-style main that suppresses the final-value print** (or the driver must strip a trailing `()\n`) — otherwise stdout carries trailing bytes that break `llvm-as` and the byte-identical triple test. Fold this into self-hosting-bootstrap task 2.1.
