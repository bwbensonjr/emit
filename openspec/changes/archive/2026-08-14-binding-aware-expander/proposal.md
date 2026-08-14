## Why

The expander decides what an identifier *means* by how it is **spelled**. `expand`'s `exp`
(`src/passes/expand.ss:354`) threads a recursion depth and a fixed `known` set, but never the set of
identifiers **bound at the point of use** — so `macro-lookup` consults a table keyed by name with
nothing to consult first, and `match-pat` compares a `syntax-rules` literal with `eq?` on the
spelling. Three open issues are that one defect, seen from three sides:

- **#103** — a lexical binding does not shadow a macro keyword. R7RS 4.2/5.3 make a keyword a binding
  like any other, so an inner binding shadows it. Verified at `6bcbfd6`:
  `(let ((when (lambda (x) x))) (when 5))` prints `()` where Chez prints `5`. It is worse than a
  wrong answer at one site: **it is silent**, because `(when 5)` is a legal use of the macro with an
  empty body, so the program keeps running. The same holds for a top-level `(define (when x) (* x 2))`
  and for an internal define — both print `()`.
- **#92** — `cond` treats a shadowed `=>` as receiver syntax. `(let ((=> #f)) (cond (#t => 'ok)))`
  traps with `call: not a procedure: got a symbol` where R7RS 4.2.1 requires `ok`. That form is the
  standard's own illustration of why an auxiliary keyword must be matched by binding rather than by
  spelling, and the conformance suite carries it verbatim.
- **#79** — a `syntax-rules` template cannot reference a `define-record-type` binding
  (`unbound variable mk.4`), because on the program and REPL paths the record's binding names never
  reach the `known` set that tells hygiene not to rename them. The **library** path already gets this
  right (`src/core.ss:1179-1182` splices record types *before* computing `known`, deliberately), so
  the same source succeeds in a library and fails in a program.

**Why now.** #103 was found while implementing `chez-free-unit-pipeline` — a named `let` called
`match` inside `src/core.ss` expanded the compiler's own `match` macro, and every call failed at run
time. Chez expands the identical source correctly, so **no Chez-gated suite can catch this**: the
divergence is invisible to `src/compile.ss` and surfaces only in the self-hosted compiler, as a
runtime error naming the macro rather than the shadowing. Now that the Chez-free doors are the
primary path, the compiler's own sources carry a standing hazard whose blast radius is every keyword
in scope. Separately, this tightens *the accepted language*, which SemVer 0.1.0 will put a
compatibility contract around — cheap before the tag, breaking after it.

## What Changes

- **`expand` threads a lexically-bound identifier set.** `exp` gains a `bound` parameter alongside
  `depth`, extended by the arms that bind: `lambda` formals (fixed, dotted, and symbol-rest),
  `let` / `letrec` / `letrec*` binding names, the loop name of a named `let`, and the names of
  **internal defines** in a body. The program's **top-level** define names seed it, since
  `collect-toplevel` folds a whole program into one `letrec` and every top-level binding is therefore
  in scope throughout.
- **A bound identifier is not a macro keyword** (#103). `macro-lookup` answers `#f` for a head that
  is in `bound`, so the form is recursed into as an ordinary application and the lexical binding is
  called. **BREAKING** for any program that relies on a macro winning over a binding of the same
  name — which is a program R7RS calls incorrect, and which today gets a silent wrong answer.
- **A `syntax-rules` literal does not match a bound identifier at the use site** (#92). `match-pat`
  takes `bound` and requires a literal to match an identifier that is *free* there, so a shadowed
  `=>` / `else` falls through to the next rule and `(let ((=> #f)) (cond (#t => 'ok)))` answers `ok`.
- **Record-type bindings become known identifiers on every path** (#79). The program and REPL paths
  splice `define-record-type` before computing `known`, as the library path already does, so a
  template reference to a constructor, predicate, accessor, or modifier is not hygiene-renamed away.
  This unblocks `delay`/`force` as prelude macros over a promise record.
- **Non-goals, stated so the boundary is on the record**: no syntax objects, marks, or renames — the
  hygiene model stays a name-set test, so **#56 stays open**; a literal is compared against the use
  site's bindings only, not against the macro definition's environment (full referential
  transparency); `let-syntax`/`letrec-syntax` remain unsupported (#91); and **core keywords**
  (`let`, `if`, `lambda`, `quote`) stay spelling-based, because `parse` decides those forms too and
  making them shadowable is a change to a second pass.

## Capabilities

### New Capabilities

None. This corrects behaviour the `macro-system` spec already claims.

### Modified Capabilities

- `macro-system`: three requirements change. **Define syntactic extensions with define-syntax and
  syntax-rules** gains the rule that a lexical or top-level binding shadows a keyword, so a use of a
  shadowed keyword is an ordinary application. **Pattern matching with literals, wildcard, and
  ellipsis** gains the rule that a literal matches only an identifier that is unbound at the use
  site — a companion to the literals-outrank-`_`-and-`...` priority added for #80. **Hygiene for
  macro-introduced identifiers** gains the rule that a `define-record-type`'s binding names count as
  known bindings on every compilation path, not only in a library.

## Impact

- **`src/passes/expand.ss`** — `exp`, `macro-lookup`, `apply-macro`, `match-pat`, `match-ellipsis`.
  The binding arms of `exp` change shape (they currently recur through a nullary-context `exp1`).
- **`src/core.ss`** — `compute-known`'s two program-path callers (`compile-forms:76`,
  `compile-program-with-imports:1348`) splice record types first; the unit path (`:1182`) is already
  correct and is the model.
- **`src/repl-core.ss`** — `*repl-known*` maintenance for a `define-record-type` typed at the REPL
  (`:54`, `:153`, `:201`, `:235`).
- **`make regen` is required** (every file touched is in `CORE_FLAT`), so this is a
  five-self-compile, ~22-minute barrier plus the two suite runs. The expander runs over ~400 KB of
  assembled Scheme on each of those compiles, which makes the cost of `bound` a measurable thing
  rather than a theoretical one — regen wall clock is the canary.
- **Risk concentrated in the prelude**: treating a top-level define as shadowing means a prelude
  *define* whose name collides with a prelude *macro* would disable that macro everywhere. No such
  collision may exist; verifying that is a task, not an assumption.
- Closes #103, #92, #79. Does not touch #56 (deliberate, design D4 of `library-macro-export`) or
  #91's unsupported-form diagnostics.
- **Spun out during implementation:** #106 — `do`'s expansion calls the auxiliary keyword `%do-step`
  *inside* the scope that binds the user's loop variables, so a loop variable spelled `%do-step`
  shadows it and the expansion breaks. The same rule fixes the more likely shape in the same stroke
  (`(let ((%do-step f)) (%do-step 4))` now calls `f` instead of silently expanding the internal
  helper), so the trade is a silent wrong answer for a loud one on a name in the documented-internal
  `%` namespace. The fix is prelude surgery on a user-visible derived form and belongs on its own
  verification schedule.
- **Also lands, beyond the three issues:** `test/flat-name-check.sh` gains issue #38's
  duplicate-top-level-define guard, because an edit in this change introduced exactly that defect
  (a second `*macro-depth-limit*`) and no suite noticed. The guard is text-level and runs before the
  regen fixed point rather than after it.
