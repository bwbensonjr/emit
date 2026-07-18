## Context

Today primitives are reserved keywords recognized head-only (`parse.ss:106`), which blocks
both first-class use (only `car`/`cdr`/`cons`/`string-append` are eta-patched, `parse.ss:27-53`)
and shadowing. The target model makes primitives ordinary prelude bindings over `%`-raw
primcalls, with an inliner recovering bare-op performance. Exploration established that the
enabling machinery largely exists: the resolver already tracks lexical shadowing and
user-wins top-level shadowing (`parse.ss:385-404`), `set!` targets are known from
`convert-assignments`, the expander already folds n-ary arithmetic (`expand.ss:305-334`), and
tree-shaking exists (`aot-codegen`). This spike tests whether those pieces compose as
predicted, on two primitives.

## Goals / Non-Goals

**Goals:** produce evidence to answer five questions (below) and record a recommendation.

**Non-Goals:** rolling out to all primitives; changing specs; deleting the eta table or the
expander fold for real (only *demonstrating* whether we can). No production merge required.

## The five questions the spike must answer

1. **Bootstrap dual-host.** With `%cons`/`%add` as raw primcalls and plain-name wrappers in
   the prelude, do `make`, `make regen` (Chez-free self-host fixed point), and
   `run-dev-tests.sh` (Chez host + independent re-derivation) all stay green? This is the
   assumption most likely to be fatal.
2. **Inline + shadow correctness.** Does `(cons a b)` still lower to a `%cons` primcall
   (bare op) when unshadowed, and correctly fall back to a closure call when shadowed
   (`(define (cons a b) 'mine)`) or `set!`-ed?
3. **First-class use.** Do `(map cons xs ys)`, bare `cons`, `(map + xs)`, and `(apply + xs)`
   work through the wrapper with the eta special-case removed for these two?
4. **Tree-shake.** Does a program that uses `cons` only in call position retain **zero** bytes
   for the `cons` wrapper (inliner removes the last ref → shaker drops the binding)?
5. **Variadic: unify vs keep.** Can a table-driven lowering of literal `(+ …)` produce IR
   byte-identical (or equivalent + equal perf) to today's `fold-arith`? If yes, unifying
   (deleting the expander special-case) is on the table; if not, keep the expander fold and
   use the wrapper only for value/apply position.

## Method

- Run in a git worktree/branch off `main`; do **not** merge the slice.
- Add an integrable table: `name → (raw, arity, fold, identity)` for `cons` and `+`.
- Minimal inline pass placed after resolve, before `convert-assignments`; fires only when the
  operator resolves to the global integrable binding and is neither shadowed nor assigned.
- Measure perf with an existing tail-loop demo (e.g. `countdown`/`namedloop`, 10M iters) and
  by byte-comparing emitted `.ll` for a small `+`-heavy and `cons`-heavy program against the
  current compiler.

## Findings (spike run, cons + `+`, Phase 1 = wrappers, no inliner)

Method: on branch `spike/primitives-first-class`, renamed the raw ops to `%cons`/`%add`,
made `cons`/`+` ordinary `(scheme base)` wrapper procedures, regenerated, re-derived the
self-host fixed point, ran the probes and `./run-dev-tests.sh`. Baseline captured first
(all suites green).

- **Q1 bootstrap — CONVERGES, but requires a STAGED bootstrap.** A single regen fails:
  `repl: unbound variable %cons` — the committed seed does not recognize the new primcall
  head, so it cannot compile the new prelude. It works only as **two regens**: (1) teach the
  seed `%cons`/`%add` as recognized primcalls (synonyms alongside `cons`/`+`), regen; (2) flip
  the plain names to wrappers, regen. Fixed point then reached (iter 2). This is inherent to
  self-hosting and applies to every primcall-head rename batch.
- **Q2 shadow — YES, essentially free.** `(define (cons a b) …)` / `(define (+ . xs) …)` win
  over the wrappers (`(shadowed 1 2)`, `plus-shadowed`), inheriting the existing user-wins
  mechanism the moment the names become ordinary bindings. No new machinery.
- **Q3 first-class — YES.** `(map cons xs ys)` → `((1 . 3)(2 . 4))`, `(apply + xs)` → `60`,
  through the shipped self-hosted binary. Baseline errors on these (`primitive not available
  as a first-class value`). Notably the **compiler itself** already used `cons` as a value
  (`(map cons …)` in `compile.ss`/`parse.ss`), previously served by the eta hack.
- **Q4 tree-shake — works.** The shaker prunes `(scheme base)` to reached exports
  ("4 exports reached" for the probe); unused wrappers do not bloat the binary.
- **Q5 variadic — functionally correct; perf recovery not yet built.** `+` as an n-ary
  wrapper is correct for literal, `apply`, and value positions. Without an inliner, direct
  calls become closure calls: cons-heavy `rt_cons` 48→3, plus-heavy inline-`add` 56→4; the
  self-host regen slowed 22s→31s (+40%). The inliner (Phase 2) is the perf-recovery step and
  was NOT built once the availability finding below made the design premise the priority.

### The dominant finding — availability model (NOT anticipated in exploration)

Making `cons`/`+` `(scheme base)` **exports** makes them **non-universal**, breaking two
places that assume primitives are always available:

- **User libraries** do not auto-import `(scheme base)` by design (`mylib.sld`: "Primitives/
  core only … libraries do not share the prelude"). A library using `(+ x 100)` now fails to
  build: `unbound variable +`.
- **`--no-prelude`** programs lose them: `(display (+ 1 2)) --no-prelude` → `unbound variable +`.

This is the root cause of most of the 25 dev-test failures (modules, `--no-prelude`, REPL
resolver units). Plus a **dual-host** sub-case: `test/read-all-tests.ss` does
`(load "src/prelude.scm")` **under Chez**, where the wrapper bodies call undefined
`%add`/`%cons` — so a Chez host-shim binding every `%`-prim to its Chez equivalent is required
wherever the prelude is loaded under Chez.

**Implication:** the exploration's "primitives become ordinary `(scheme base)` procedures"
collides with the existing invariant that *primitives/core are universal and `(scheme base)`
is a separate, library-optional layer*. The wrappers cannot live only in `(scheme base)`.

### Simplicity delta

Phase-1 source delta is tiny (a few lines in `parse.ss`/`emit.ss`/`prelude.scm`). The eta
special-case for `cons` was removable; the expander fold was left intact. The real cost is
not LOC — it is the availability redesign the dominant finding forces.

## Decisions to make after the spike

- **D0 (NEW, now the gating decision) — availability model.** Where do the plain wrapper
  names live so they stay universal (libraries + `--no-prelude` + Chez host)? Candidates:
  (a) an always-linked "primitive prelude" of wrappers, separate from the optional
  `(scheme base)` layer, auto-available everywhere the raw prims are today; (b) auto-import
  the wrappers into libraries and `--no-prelude` too (changes module semantics); (c) keep the
  raw `%`-prims universal and only offer plain names inside `(scheme base)` (rejected: users
  writing a library could not use `+` without `%`). **Recommendation: (a)** — it preserves the
  "primitives are universal" invariant while giving them ordinary-binding semantics, and it
  localizes the dual-host shim to that one layer. This must be settled before D1–D3.
- **D1 — variadic:** unify n-ary lowering into the table-driven inliner (delete
  `fold-arith`/`expand-string-append`) vs keep the expander fold for literal calls.
  Spike leaning: keep the expander fold initially (it already produces correct binary
  `%add`); unify later once the inliner exists.
- **D2 — rollout scope:** all primitives at once vs staged. Spike leaning: **staged**, and
  each stage is itself a **2-regen** (teach seed the `%` names, then flip) — Q1 finding.
- **D3 — inliner placement:** dedicated post-resolve pass keyed on the integrable import
  binding (resolution already computes shadowing + `set!`), vs folded into resolve.
- **D4 — spike code:** discard the branch and reimplement cleanly in the rollout. The
  Phase-1 diff is tiny and its premise (wrappers in `(scheme base)`) is wrong per D0, so it
  is a throwaway proof, not a seed. Keep the findings here.

## Risks / Trade-offs

- **[Bootstrap fatal]** a Chez path evaluates a wrapper body where `%add` is undefined →
  Mitigation: this is Q1, tested first and cheapest to run; if red, the whole model needs
  rethinking before any rollout.
- **[Perf regression]** inliner misses common shapes → closure calls on hot paths →
  Mitigation: Q5 byte-compares IR and runs a tail loop.
