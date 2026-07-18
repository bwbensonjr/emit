## 1. Setup (isolate from main)

- [x] 1.1 Create a git worktree/branch for the spike so `main` stays clean (branch `spike/primitives-first-class`)
- [x] 1.2 Baseline: `make`, `make regen`, `./run-dev-tests.sh` green before changes (all suites passed)
- [x] 1.3 Capture baseline emitted `.ll` for a `cons`-heavy and a `+`-heavy sample program

## 2. Fixed-arity slice: `cons`

- [x] 2.1 Rename the raw op to `%cons` in `parse.ss` `*prims*` and the `emit.ss` op→rt_ table
- [x] 2.2 Add `(define (cons a b) (%cons a b))` to `src/prelude.scm`; regenerate `lib/scheme/base.sld`
- [~] 2.3 Inline pass — NOT built. Deferred once the availability finding (D0) made the design premise the priority; the inliner is a rollout task, not a spike question.
- [x] 2.4 Remove `cons` from the eta special-case so first-class use goes through the wrapper

## 3. Variadic slice: `+`

- [x] 3.1 Raw `%add` (binary) in `parse.ss`/`emit.ss`; inline-arith fast path kept for `%add`
- [x] 3.2 Add the n-ary wrapper `(define (+ . xs) …)` to the prelude (identities handled)
- [~] 3.3 Table-driven n-ary lowering — NOT built (same reason as 2.3). Expander fold left intact; wrapper handles n-ary functionally.

## 4. Run the five questions

- [x] 4.1 **Q1 bootstrap:** converges — but only via a STAGED 2-regen bootstrap (single regen fails: seed lacks `%cons`). Full dev-tests reveal the availability finding (below).
- [x] 4.2 **Q2 shadow:** user redefinition wins over the wrapper — free via existing user-wins.
- [x] 4.3 **Q3 first-class:** `(map cons …)`, `(apply + …)`, bare `cons`/`+` all correct.
- [x] 4.4 **Q4 tree-shake:** shaker prunes `(scheme base)` to reached exports; wrappers do not bloat.
- [~] 4.5 **Q5 variadic:** functionally correct; perf-recovery (inliner) not built. Un-inlined cost measured: `rt_cons` 48→3, inline-`add` 56→4, regen +40%.

## 5. Capture and decide

- [x] 5.1 Findings recorded in `design.md` (incl. the dominant availability finding).
- [x] 5.2 Recommendations recorded for D0 (availability — NEW gating decision), D1–D4.
- [x] 5.3 Decided: discard the throwaway spike branch; open the rollout change with D0 (always-linked primitive layer) as the settled direction. Findings preserved in this (archived) change.
