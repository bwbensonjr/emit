## 1. syntax-rules matcher and instantiator

- [x] 1.1 In `src/passes/expand.ss`, add a `match-pattern` that matches an input form
  against a `syntax-rules` pattern, honoring `_`, literals, pattern variables, and
  proper/dotted structure; return pattern-variable bindings or a no-match sentinel
- [x] 1.2 Extend `match-pattern` with ellipsis: `(p ... . tail)` matches zero+ repetitions
  of `p`, collecting each pattern variable in `p` at depth+1, then matches `tail`
- [x] 1.3 Add `instantiate-template` that substitutes pattern variables and expands
  `(t ...)` in lockstep over the ellipsis variables occurring in `t`; error on
  depth-mismatched variable use
- [x] 1.4 Support nested ellipsis by recursion on depth in both matcher and instantiator

## 2. Hygiene

- [x] 2.1 Compute the "known bindings" set (core keywords, primitives, prelude/user
  top-level `define` names) available to the expander
- [x] 2.2 In `instantiate-template`, consistently rename each template-introduced
  identifier that is not a pattern variable and not a known binding to a `fresh-name` per
  expansion; leave pattern-substituted syntax and known bindings untouched

## 3. Macro environment and fixpoint driver

- [x] 3.1 Add `collect-define-syntax`: scan the (prelude-first) top-level form sequence,
  lift `(define-syntax name (syntax-rules ...))` forms into a macro environment, and
  return the remaining runtime forms
- [x] 3.2 Rewrite `expand` to a fixpoint driver over the macro environment: apply a
  transformer when the head is a macro keyword and re-expand the result; leave `(quote …)`;
  recurse into core forms; keep the hand-written n-ary arithmetic/comparison desugarings;
  `map expand` for applications
- [x] 3.3 Add a recursion-depth guard that raises a clear "macro expansion did not
  terminate" error
- [x] 3.4 In `src/compile.ss`, run `collect-define-syntax` before `collect-toplevel`,
  thread the macro environment into `expand`, and keep the `--dump "expand"` line
- [x] 3.5 Add `define-syntax`/`syntax-rules` to the reserved keywords

## 4. Move derived forms to the prelude

- [x] 4.1 Add `syntax-rules` definitions in `src/prelude.scm` for `and`, `or`, `when`,
  `unless`, and `let*` (named `let` stays hand-written in `expand.ss` — it overloads the
  core `let` keyword)
- [x] 4.2 Add a `cond` macro supporting `else`, `=>` (single-evaluation of the test), and
  bare-test clauses
- [x] 4.3 Delete the retired per-form cases (`cond`/`and`/`or`/`when`/`unless`/`let*`) from
  `expand.ss`, keeping named `let`, the arithmetic/comparison desugarings, and the macro
  machinery

## 5. Demos and verification

- [x] 5.1 Add a demo defining and using a user macro (e.g. `swap!` and/or `while`) with
  an expected value
- [x] 5.2 Add a demo exercising hygiene (introduced temporary vs. a same-named user
  variable) and one exercising ellipsis
- [x] 5.3 Run `demos/run-tests.sh` — all existing 29 demos plus the new demos produce their
  expected values
- [x] 5.4 Run `demos/run-backends.sh` — AOT = JIT = bitcode for every demo
- [x] 5.5 Update `docs/PIPELINE.md` (and README if needed) to describe `expand` as the
  `syntax-rules` macro expander and note the `--no-prelude` behavior change
