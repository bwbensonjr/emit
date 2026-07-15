## 1. Runtime: one shared, memory-safe printer (design D1/D2)

- [x] 1.1 In `src/runtime/runtime.c`, extract the `rt_write` tag-walk into a
  shared `static void print_val(val v, int display)`, threading `display` through
  the pair and vector recursion. Keep every non-string/non-char arm identical to
  today (fixnum, bool, nil, pair, symbol, vector, closure, box, error, and the
  `default` `#<ext:…>`/`#<unknown:…>` arms).
- [x] 1.2 Gate ONLY the string and char arms on `display`: in display mode write a
  string's raw bytes (no `"`) and a character as its raw UTF-8 (no `#\`); in write
  mode keep the quoted/`#\`-prefixed form.
- [x] 1.3 Reimplement `rt_write(v)` as `print_val(v, 0)` and `rt_display(v)` as
  `print_val(v, 1); return NIL_V;` (display still returns the unspecified value so
  it composes in `begin`). Remove the old string-only `rt_display` body.

## 2. Build and verify no regression

- [x] 2.1 `make` (relink only; confirm no `bootstrap/*.ll` change and no Chez):
  `git diff --quiet bootstrap/` stays clean.
- [x] 2.2 Verify the fix: `(display 42)`, `(begin (display 42) 99)`,
  `(display (cons 1 2))`, `(display (list "a" #\b 3))` all run without segfault and
  print the display-style output; `(display "hi")` still prints `hi`.
- [x] 2.3 Confirm strings are byte-identical: the self-hosted `schemec` filter
  output is unchanged (`self-host-fixpoint.sh` / trust-check stay green), since
  display of a string is unchanged.

## 3. Tests / demos

- [x] 3.1 Add a demo (e.g. `demos/display.scm`) exercising `display` over a
  fixnum, a pair, a symbol, a char, and a nested list (inner string unquoted),
  ending in a bare final value; wire it into `demos/run-tests.sh` with the
  expected stdout so it runs under both `RUNNER=scheme-run` and `RUNNER=aot`.
- [x] 3.2 Run `./run-all-tests.sh` (Chez-free) and `./run-dev-tests.sh` (backends,
  self-host, trust-check) — both green.

## 4. Documentation

- [x] 4.1 Update `README.md`: move `display` (general, any-datum) out of the
  "Not yet done — I/O: … display/write as procedures" note into the supported
  primitives/reader list, noting display style vs the write-style value printer.
