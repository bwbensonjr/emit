## 1. Resolve the fork

- [ ] 1.1 Confirm path C (grow two I/O primitives) over path A (host embedding); record the decision in design.md. Path A stays a deferred follow-up.

## 2. I/O primitives

- [ ] 2.1 Add `rt_read_all_stdin` to `src/runtime/runtime.c`: read stdin to EOF into a growable buffer, return a scheme string.
- [ ] 2.2 Add `rt_display` to `src/runtime/runtime.c`: write a scheme string's bytes to stdout verbatim (no quotes/newline), return an unspecified value.
- [ ] 2.3 Register `read-all-stdin` and `display` in `src/parse.ss` (`*prims*`) and `src/emit.ss` (prim table + `rt-declarations`); rebuild the REPL host runtime.

## 3. Verification

- [ ] 3.1 Demo/test: a program that `(display "…")` writes exactly those bytes (no quotes/newline) to stdout; a program that echoes `read-all-stdin` round-trips piped input.
- [ ] 3.2 Run `./run-all-tests.sh`; all suites pass.
- [ ] 3.3 Hand off to [[self-hosting-bootstrap]]: with G1/G2/G3 closed, the assembled core + `(display (compile-source-string (read-all-stdin)))` main can build to a native `schemec` (resume at task 2.1 there).
