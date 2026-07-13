## 1. Reader: quasiquote sugar (`rd-datum`)

- [ ] 1.1 `` ` `` (backtick) → `(quasiquote <datum>)` (helper `rd-quasi`, mirroring `rd-quote`)
- [ ] 1.2 `,` → `(unquote <datum>)`; `,@` → `(unquote-splicing <datum>)` (peek for `@`)
- [ ] 1.3 Reuse `rd-skip-ws` + `rd-datum`; emit the long-name forms

## 2. Expander: quasiquote transformer (`expand.ss`)

- [ ] 2.1 Dispatch a `quasiquote` head to a recursive `qq` rewrite (handled directly, like named `let`)
- [ ] 2.2 Level 1: `unquote` → expanded expression; leading `unquote-splicing` → `append`; pair → `cons`; atom → `quote`
- [ ] 2.3 Nesting: nested `quasiquote` increments level; `unquote`/`unquote-splicing` at level > 1 decrement and rewrite structurally
- [ ] 2.4 Add `quasiquote`/`unquote`/`unquote-splicing` to the keyword bookkeeping; report a stray `unquote` outside quasiquote
- [ ] 2.5 Confirm the transformer runs within the fixpoint (unquoted expressions are themselves expanded)

## 3. Demos and tests

- [ ] 3.1 Demo: `` (let ((x 2)) `(a ,x b)) `` → `(a 2 b)`
- [ ] 3.2 Demo: `` (let ((ys (list 1 2))) `(0 ,@ys 3)) `` → `(0 1 2 3)`
- [ ] 3.3 Demo: plain `` `(a b c) `` → `(a b c)` (no unquotes)
- [ ] 3.4 Demo: nested — `` `(a `(b ,(+ 1 2))) `` keeps the inner quasiquote intact
- [ ] 3.5 `--dump`: the `expand` stage output contains no `quasiquote` form
- [ ] 3.6 Add the demos to `demos/run-tests.sh` with expected values

## 4. Verify

- [ ] 4.1 Build and run the demos; confirm quasiquote construction and splicing
- [ ] 4.2 `demos/run-backends.sh`: the new demos agree across AOT/JIT/bitcode
- [ ] 4.3 Confirm existing demos and macro demos unaffected

## 5. Docs and spec sync

- [ ] 5.1 Update the root `README.md` (reader sugar + derived forms) status
- [ ] 5.2 Sync the `core-language` (added) and `macro-system` (added) deltas into `openspec/specs/`
