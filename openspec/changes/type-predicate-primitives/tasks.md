## 1. Runtime predicates

- [ ] 1.1 Add `rt_symbol_p`, `rt_string_p`, `rt_char_p`, `rt_boolean_p`, `rt_integer_p`,
  `rt_exact_p` to `src/runtime/runtime.c`, each inspecting the value's type tag and returning
  the scheme `#t`/`#f` encoding (`integer?`/`exact?` = fixnum tag check).

## 2. Register the primitives

- [ ] 2.1 Add `symbol?`, `string?`, `char?`, `boolean?`, `integer?`, `exact?` to `*prims*` in
  `src/parse.ss`.
- [ ] 2.2 Add their `prim-table` entries and `rt-declarations` lines in `src/emit.ss`.
- [ ] 2.3 Rebuild the REPL host runtime (`make build/repl-host`).

## 3. Verification

- [ ] 3.1 Each predicate returns `#t` for its type and `#f` otherwise (e.g. `(symbol? 'a)` →
  `#t`, `(symbol? 1)` → `#f`; `(integer? 3)` → `#t`, `(integer? 'a)` → `#f`).
- [ ] 3.2 Run `./run-all-tests.sh`; all suites pass.
- [ ] 3.3 Hand off to [[self-hosting-bootstrap]]: with G9 closed, the core's type dispatch
  resolves.
