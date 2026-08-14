## 1. Baseline and guards (before touching the expander)

- [x] 1.1 Record the failing baseline at HEAD in the change folder or the PR body: `(let ((when (lambda (x) x))) (when 5))` → `()`, `(define (when x) (* x 2))` + `(when 5)` → `()`, an internal `define when` → `()`, `(let ((=> #f)) (cond (#t => 'ok)))` → `call: not a procedure: got a symbol`, and the #79 program and REPL forms → `unbound variable mk.N`. These are the six shapes the suites will assert against.
- [x] 1.2 Confirm the prelude/`CORE_FLAT` collision set is still empty: no top-level `define` name is also a `define-syntax` keyword (verified empty at `6bcbfd6` — keywords are `and case cond do guard let* match or parameterize unless when %do-step %guard-clauses %match-pat %match-clauses`). If a collision has appeared, resolve it before D3's prune lands, since the prune would silently disable that macro.
- [x] 1.3 Add that collision check as a permanent guard (a Chez-free entry alongside the other text-level checks, or a case in `test/scheme-base-surface-check.sh`), so a future define/define-syntax collision fails the build instead of losing a macro. Assert on the message, not just the exit status.

## 2. Thread the lexical binding set through `expand` (#103)

- [x] 2.1 In `src/passes/expand.ss`, give `exp` a `bound` parameter alongside `depth` and rework `exp1` to carry it. `expand`'s own signature `(expand e macro-env known)` must not change — `test/expander-tests.ss` and all four call sites in `src/core.ss` / `src/repl-core.ss` depend on it.
- [x] 2.2 Extend `bound` in the `lambda` arm for fixed, dotted, and bare-symbol formals.
- [x] 2.3 Extend `bound` in the `let` arm for the body only (initializers expand under the outer set), and in the `letrec` / `letrec*` arm for both initializers and body.
- [x] 2.4 Expand the named-let rewrite under the current `bound` and confirm the loop name is shadowed via the `letrec` arm — no special case should be needed. Assert this with the `my-or` named-let shape from the spec.
- [x] 2.5 Add a body scan so **internal defines** extend `bound` before any body form is expanded: `(define NAME ...)` and `(define (NAME . formals) ...)` in a `lambda` / `let` / `letrec` body.
- [x] 2.6 Make `macro-lookup` answer `#f` for a head in `bound`, ordering the tests per design D5 — `assq h macro-env` first, `memq h bound` only on a hit, so the per-head cost of the common path is unchanged.
- [x] 2.7 Drop the workaround comment on `str-search` in `src/core.ss` and rename its inner loop back to `match`, so the compiler's own source carries the fix's proof rather than the bug's scar tissue.

## 3. Use-site binding narrows a syntax-rules literal (#92)

- [x] 3.1 Thread `bound` into `match-pat` and `match-ellipsis`; leave `pattern-vars` alone (it inspects the pattern, where use-site bindings are irrelevant).
- [x] 3.2 In the literal arm, require the matched identifier to be absent from `bound`, after `(memq pat literals)` and `(eq? pat form)` both succeed. A non-match must fall through to the following rules, not error.
- [x] 3.3 Verify the three literal shapes by hand before running the suites: `(let ((=> #f)) (cond (#t => 'ok)))` → `ok`; `(let ((else #f)) (cond (else 'wrong) (#t 'right)))` → `right`; and the unshadowed `(cond ((assv 2 '((1 a) (2 b))) => cadr) (else 'none))` → `b`.

## 4. Top-level shadowing by pruning `macro-env` (#103, top level)

- [x] 4.1 Add the prune — drop every `macro-env` entry whose keyword a top-level `define` in the same form list binds — and apply it in `compile-forms` (`src/core.ss:76` area) and `compile-program-with-imports` (`:1348` area), after `collect-define-syntax` and before `expand`. It covers both the program's own transformers and imported ones.
- [x] 4.2 Apply the same prune to the library-unit path (`src/core.ss:1182` area), so a library body's `define` displaces a keyword the same way a program's does.
- [x] 4.3 At the REPL, make a `define` entered at the prompt drop a `*repl-macro-env*` entry of that name (`src/repl-core.ss`, the define arm near `:152` and `repl-load-prelude!` near `:201`), so dev→ship fidelity holds for the top-level case too.
- [x] 4.4 Confirm the dormant folded path (`compile-source-with-prelude`) is left as-is and its limitation is stated where the function is defined: with prelude *procedures* folded into the form list, a top-level shadow there would reach prelude bodies. No live caller, so no fix.

## 5. Record-type bindings are known on every path (#79)

- [x] 5.1 Add a pure `record-type-binding-names` to `src/parse.ss`: the constructor, predicate, accessors, and modifiers a `define-record-type` binds, by the same destructuring `record-type-bindings` uses, **allocating no fresh names** (design D4 — `record-type-bindings` calls `fresh-name` twice, so reusing it would bump the counter and shift every later generated name). Validate the form shape through the existing `check-record-type-form`.
- [x] 5.2 Have `compute-known` (`src/core.ss:55`) include those names for every record-type form in its input, so the program path matches the library path.
- [x] 5.3 At the REPL, add a record form's binding names to `*repl-known*` in the arm where `define-name` currently answers `#f` (`src/repl-core.ss:152-153`).
- [x] 5.4 Verify the three-path result: the record + template program compiles and prints `5`, the same forms entered at the REPL print `5`, and the library-unit case still works.

## 6. Tests

- [x] 6.1 Add expander unit cases to `test/expander-tests.ss` (Chez-gated, so they run under the driver): a `let`/`lambda`/`letrec` binding shadowing a keyword, an internal define shadowing one, a named let whose name is a keyword, and the shadowed/unshadowed literal pair. These are the cheap loop — they run without regen.
- [x] 6.2 Add an end-to-end suite (`test/binding-shadowing-tests.sh`, Chez-free, wired into `run-all-tests.sh`) covering all six baseline shapes from 1.1 through `emit run`, plus a REPL case for the record template and one for a top-level define displacing a keyword.
- [x] 6.3 Un-exclude the #92 row in `test/r7rs/exclusions.tsv` (line ~255, `aeb7183b887873c0`). The suite checks exclusions in both directions, so leaving it in fails the run as a stale exclusion — expect one failing run naming exactly that form before the row is removed.
- [x] 6.4 Re-run `test/r7rs-suite-tests.sh`'s stale-exclusion pass and check whether any other excluded form now passes as a side effect (a shadowed auxiliary keyword or a record-referencing template could be behind more than one row); un-exclude whatever has started passing, and correct the reason on anything that changed its failure mode.
- [x] 6.5 Confirm the `do` question from the design's Open Questions: `do` expands correctly when a loop or step variable is spelled close to `%do-step`, and a variable actually named `%do-step` now shadows the internal macro rather than expanding it.

## 7. Regen, full verification, and the write-up

- [x] 7.1 **Barrier.** Finish every source edit above, then run `make regen` once (expect five self-compiles, ~22 min, converging at fixed-point iteration 2). Do not edit a `CORE_FLAT` file again until the suites finish; a later edit guarantees a `test/trust-check.sh` failure deep into the dev run, and a killed regen leaves `bootstrap/` mixed-source.
- [x] 7.2 Record the regen wall clock against the ~18/22-minute baseline. If the expander's new work shows up there, apply design D5's fallback (carry `bound` as a hash table) rather than reverting the semantics.
- [x] 7.3 Run `./run-all-tests.sh` (~27 min) and `./run-dev-tests.sh` (~25 min; run its suites individually if the command timeout is shorter than a suite). `test/prelude-base-run-tests.sh`'s driver-vs-run-door byte identity and `test/self-host-fixpoint.sh` are the two that would catch a path asymmetry introduced by task 4.
- [x] 7.4 Commit, then run `test/trust-check.sh` — it `[SKIP]`s while `bootstrap/` is dirty by design.
- [x] 7.5 Sync the `macro-system` delta into `openspec/specs/macro-system/spec.md` and archive the change. The delta rewrites three requirements in full; check that no main-spec requirement is truncated by the sync (a known trap).
- [x] 7.6 Close #103, #92, and #79 from the commit (`Fixes #103`, `Fixes #92`, `Fixes #79`), noting in #103 that the top-level case is handled by user-wins pruning and in #92 that the literal test is use-site-only. File a follow-up issue for anything the non-goals leave behind that the work made newly legible.
