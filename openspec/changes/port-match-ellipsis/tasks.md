## 1. Custom ellipsis in the expander

- [ ] 1.1 In `src/passes/expand.ss`, make `parse-define-syntax` accept `(syntax-rules <ellip> (literals) rules ...)` when the form after `syntax-rules` is a symbol; record the per-transformer ellipsis (default `...`).
- [ ] 1.2 Thread the ellipsis identifier through `pattern-vars`, `match-pat`, `match-ellipsis`, `instantiate-seq`, `expand-ellipsis`, and the escape (replace the module-global `*ellipsis*` uses).
- [ ] 1.3 Add expander unit tests (`test/expander-tests.ss`): custom-ellipsis repetition works; default `...` unchanged; escape still works.

## 2. Ellipsis in the matcher

- [ ] 2.1 Extend `src/match.sls` `match-pat` with `(p ...)` and `(p ... . tail)` using a custom ellipsis so it can detect the user's `...`; generate a loop that binds each pattern variable in `p` to its list of matches.
- [ ] 2.2 Add matcher unit tests (`test/match-tests.ss`): `(,x ...)`, `(,x ... ,last)`, `((,k ,v) ...)`, and empty-list ellipsis.

## 3. Verification

- [ ] 3.1 Run `./run-all-tests.sh`; confirm all suites still pass (behavior-preserving — no current pass uses ellipsis).
- [ ] 3.2 Confirm the ellipsis-capable matcher still expands under scheme-llvm's own expander (`expand.ss`), including an ellipsis pattern.
