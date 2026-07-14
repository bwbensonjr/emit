## 1. Consume the matcher decision

- [x] 1.1 Read the recorded decision from [[select-syntax-rules-matcher]]: BUILD a `,x`-convention `syntax-rules` matcher (zero pass churn). No Wright-style rewrite.
- [x] 1.2 Read the recorded required expander work: add the ellipsis escape `(... ...)` to `src/passes/expand.ss` (needed for a Shinn-style ellipsis matcher and for scheme-llvm to expand the matcher).

## 2. Implement the required expander support

- [x] 2.1 Implement the ellipsis escape `(... <tmpl>)` in `src/passes/expand.ss` (new `instantiate-escaped`: `...` treated as a literal, pattern vars still substitute). Demo suite 43/43, no regression.
- [x] 2.2 Add expander unit tests (`test/expander-tests.ss`, wired into `run-all-tests.sh`): escape yields literal `...`; escape substitutes pvars; ordinary ellipsis still repeats.

## 3. Author the `,x` matcher (non-ellipsis; ellipsis split to a follow-up)

- [x] 3.1 Author a `,x`-convention `syntax-rules` matcher (`src/match.sls`, `(import (rnrs))` only) supporting the clause grammar match.sls provides (`[pat (guard e ...) body ...]`, `[pat body ...]`, `[else body ...]`) and the pattern subset the passes use: literal symbol (eq?), pair, dotted-rest, `,id`, `()`.
- [~] 3.2 DEFERRED (option B): ellipsis `(p ...)` / `(p ... . tail)` split into a follow-up change. It needs the expander to *detect* `...` in patterns (custom ellipsis identifier), which the `(... ...)` escape alone does not provide; the current passes use no ellipsis, so this is forward-looking.
- [x] 3.3 Replaced `src/match.sls` with the new matcher; dropped the `(chezscheme)`/`syntax-case` imports. `,x` convention preserved + no ellipsis in passes ⇒ zero pass rewrites. Demo suite 43/43.
- [x] 3.4 Grep-confirmed no `syntax-case`/`with-syntax`/`generate-temporaries`/`datum`/quasisyntax/`errorf` in compiler source (only doc-comment mentions remain).

## 4. Verification

- [x] 4.1 Ran `./run-all-tests.sh`; all 8 suites pass (incl. new "expander units"): demo AOT, backend equivalence, expander units, REPL front-end, REPL host, REPL interactive, REPL vs batch equivalence, REPL persistent-globals batch.
- [x] 4.2 Added `test/match-tests.ss` (11 tests: binder, literal head, dotted-rest, literal dispatch, guard pass/fall-through, else, nested, nil, multi-body, no-match error), characterized against the old matcher first, then green on the new one. (Ellipsis tests belong to the follow-up.)
- [x] 4.3 Confirmed the matcher expands under scheme-llvm's own expander (`expand.ss`) into pure core forms with no residual `unquote`/`match` heads — single-matcher / self-hosting-readiness property.
