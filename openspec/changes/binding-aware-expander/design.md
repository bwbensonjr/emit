## Context

`expand` (`src/passes/expand.ss`) is a source→source fixpoint pass. Its traversal, `exp`, carries
exactly two things: the form and a recursion `depth`. Everything it decides about an identifier it
decides from the identifier's **spelling** against three fixed tables — `macro-env` (keyed by
keyword), `*core-keywords*`/`*prims*`/`*integrable*`, and the `known` set `compute-known`
(`src/core.ss:55`) built once per compilation. Nothing in the pass records what is *bound* at the
point it is looking at.

That is the whole of the three defects this change closes (#103, #92, #79). It is not an oversight so
much as an unfinished promise: the hygiene half of the pass already reasons about bindings
(`collect-renames` consults `known` so a template reference to a real binding is not renamed), but the
*resolution* half never did.

Three facts about the current pipeline shape the design, and all three were checked in the tree
rather than assumed:

1. **Every door compiles a program through `compile-program-with-imports` with `(scheme base)`
   auto-imported** (`src/core.ss:293-305`, and the comment at `:1363` says so). The `prelude-forms`
   argument it receives is `(prelude-macro-forms prelude-forms)` — **the prelude's `define-syntax`
   forms only**. The prelude's *procedures* are compiled separately as the baked library unit, in
   their own expansion with their own `macro-env` and `known`. So the prelude's own bodies are not
   exposed to shadowing decisions made in a user program's form list.
2. The older folded path (`compile-source-with-prelude` → `with-prelude` → `compile-forms`,
   `src/core.ss:136`) still exists but is called from nothing outside
   `historical/genesis/assemble-core.ss`. `with-prelude` (`:42`) already implements **user-wins
   top-level shadowing** for procedures: a prelude `define` whose name the user also defines is
   dropped. There is precedent, in the tree, for "a top-level definition displaces the prelude's".
3. `compile-library*` computes `known` from `(splice-record-types runtime)` **before** expansion, with
   a comment (`:1179`) stating that this is what keeps hygiene from renaming a reference to a record's
   binding. The program and REPL paths do not do it. That asymmetry *is* #79.

## Goals / Non-Goals

**Goals:**

- A variable binding shadows a macro keyword of the same name, at every binding site the expander
  descends through and at the top level (#103).
- A `syntax-rules` literal does not match an identifier that is lexically bound at the use site, so
  `(let ((=> #f)) (cond (#t => 'ok)))` answers `ok` (#92).
- A `define-record-type`'s binding names are known identifiers on the program and REPL paths, as they
  already are in a library (#79) — which also unblocks `delay`/`force` as prelude macros over a
  promise record.
- No measurable cost to `make regen`. The expander runs over ~400 KB of assembled Scheme on each of
  five self-compiles, so a per-identifier list scan is a real cost, not a hypothetical one.

**Non-Goals:**

- **Syntax objects, marks, or renames.** Hygiene stays a name-set test. #56 (a typo in an exported
  macro's template is reported at the importer) is untouched and stays open — it needs the binding
  structure of a template, which is a different problem from the binding structure of a *use site*.
- **Referential transparency for literals.** A literal is compared against the use site's bindings.
  R7RS compares the literal's binding in the transformer's definition environment with its binding at
  the use site; modelling the former needs the machinery this change declines to build.
- **Shadowable core keywords.** `parse` recognizes `lambda`/`let`/`if`/`quote` by spelling
  independently of the expander, so making them shadowable is a two-pass change with no issue behind
  it.
- **`let-syntax` / `letrec-syntax`.** A local *macro* binding stays unsupported (#91).
- **Cross-unit shadowing beyond the top level.** An imported variable and an imported macro keyword of
  the same spelling remain resolved as they are today.

## Decisions

### D1 — Thread a lexical `bound` list through `exp`, rather than mutating a global

`exp` becomes `(exp e depth bound)`, where `bound` is a list of symbols. The binding arms extend it:

- `lambda`: the formals — fixed `(x y)`, dotted `(x . rest)`, and a bare symbol rest-formal.
- `let`: the binding names, in the **body** only; the initializer expressions are expanded under the
  *outer* `bound`.
- `letrec` / `letrec*`: the names, in both the initializers and the body.
- named `let`: the loop name, which arrives naturally — `rewrite-named-let` produces a `letrec`, and
  re-expanding that form takes the `letrec` arm. Nothing special is needed beyond expanding the
  rewrite under the current `bound`.
- a body's **internal defines**: scan the body forms for `(define NAME ...)` / `(define (NAME . _) ...)`
  and add those names before expanding any of them. `parse` turns internal defines into a `letrec`, so
  the expander must agree that they bind.

A threaded parameter over a mutated global because `expand` is a pure pass and the traversal is
recursive with sibling scopes; a global would need save/restore at every arm and would be one
`set!` away from a scope leak. A list over a hash table because `known` is already a list, the
expander's other membership tests are `memq`, and the lists this change creates are short — see D5
for why length never lands on the hot path.

`exp1` (the depth-resetting helper the arms currently call) becomes a one-argument-plus-`bound`
helper; that is the only mechanical churn in the pass.

### D2 — `bound` is consulted in exactly two places, and `collect-renames` is not one of them

The two consumers:

- `macro-lookup h` answers `#f` when `h` is in `bound` (#103).
- `match-pat`'s literal arm requires the matched identifier to be absent from `bound` (#92).
  `match-pat` and `match-ellipsis` gain the parameter; `pattern-vars` does **not** — it inspects the
  *pattern*, where use-site bindings are irrelevant.

`collect-renames` must **not** see `bound`. It asks "is this template identifier introduced, and
therefore to be renamed?" If a use-site binding counted as known there, a template temporary that
happened to share a name with a local at the use site would stop being renamed and would start
capturing it — precisely the hygiene failure the pass exists to prevent. The known set stays
use-site-independent; this is the one place where the two halves of the pass must *not* be unified.

### D3 — Top-level shadowing is handled by pruning `macro-env` once, not by seeding `bound`

A top-level `(define (when x) ...)` must shadow the `when` keyword too (verified broken today: it
prints `()`). Two ways to do it:

- **(a) Seed `bound` with the top-level define names.** Correct, but it makes `bound` ~800 entries
  long when the compiler compiles itself, and `bound` is consulted per identifier.
- **(b) Prune `macro-env`: drop any entry whose keyword a top-level define binds.** One pass over a
  ~12-entry alist, at compile start, costing nothing per identifier afterwards.

**(b).** It is also the shape the tree already uses: `with-prelude` drops a prelude `define` the user
redefines, and `compile-program-with-imports` orders the program's own transformers ahead of imported
ones so a top-level `define-syntax` shadows an imported keyword (`src/core.ss:1341-1343`). Pruning
extends user-wins from define-vs-define and syntax-vs-syntax to **define-vs-syntax**, which is the one
combination missing.

**Correction found while implementing: a PROGRAM needs neither (a) nor (b).** `collect-toplevel` runs
*before* `expand` and folds a program's whole top level into one `letrec`, so by the time the
expander sees it, every top-level name is an ordinary lexical binding and the `letrec` arm of D1
already shadows the keyword. Verified: `(define (when x) (* x 2))` + `(when 5)` answers `10` with
only D1 applied. What actually needs the prune is the **per-form** paths — a library body form
(`expand-unit-form`, `src/core.ss:867`) and a REPL form (`repl-expand-form`,
`src/repl-core.ss:56`) are each expanded on their own, with no enclosing `letrec` to put the name in
scope. Those were the paths where a top-level define did *not* shadow, and a library body and a
program therefore disagreed about identical source.

The prune is applied on all three paths anyway. On the program path it is redundant with the fold,
and deliberately so: three paths stating one rule in one way is worth more than eliminating a
redundancy, and the fold is an implementation detail of a *different* pass that could reasonably
change.

The pruning is safe *because* of Context fact 1: the prelude's procedure bodies are expanded in the
baked unit, so dropping `when` from a program's `macro-env` cannot break a prelude body that uses
`when`. On the dormant folded path (`compile-source-with-prelude`) it would, and that is stated as a
known limitation rather than papered over — the path has no live caller.

Verified at `6bcbfd6` that no collision exists today: the macro keywords across the prelude and
`CORE_FLAT` are `and case cond do guard let* match or parameterize unless when` plus the internal
`%do-step %guard-clauses %match-pat %match-clauses`, and none is also a top-level define name. So the
prune is a no-op for the compiler's own build, and a task keeps it that way.

The same prune applies to the REPL, where a `define` entered at the prompt must displace a keyword of
that name in `*repl-macro-env*`.

### D4 — #79 is fixed with a names-only helper, not by splicing records earlier

The obvious fix — compute `known` from `(splice-record-types runtime-forms)`, as the library path does
— has a trap: `record-type-bindings` (`src/parse.ss:578`) calls `fresh-name` twice, so calling it once
for `known` and again inside `collect-toplevel` **bumps the global counter** and shifts every
subsequent generated name. That churns emitted IR for no semantic gain and puts a descriptor name in
`known` that nothing can reference. At the REPL it is worse: the record form is lowered by a separate
path (`src/parse.ss:893`), so there is no single splice to hang the computation on.

So: add a pure `record-type-binding-names` to `src/parse.ss` — the constructor, predicate, accessors,
and modifiers a `define-record-type` binds, derived by the same destructuring, allocating nothing.
`compute-known` maps it over the form list; the REPL's define-name arm (`src/repl-core.ss:152-153`)
uses it for a record form, where `define-name` answers `#f` today. The library path keeps its splice
(it already works, and it needs the spliced forms downstream anyway).

The descriptor binding is deliberately left out: it is a fresh name, unreachable from any template.

### D5 — Order the tests so the common path pays nothing

`macro-lookup` is called for **every pair head** in the program. Testing `memq h bound` first would
put a list scan on the hottest path in the pass. Instead the existing `assq h macro-env` runs first
and `memq h bound` only on a **hit** — i.e. only where the head actually names a macro, which is
rare and where the work is about to be far larger anyway. Same for the literal arm: `bound` is
consulted only after `(memq pat literals)` and `(eq? pat form)` have both succeeded.

**Corrected by the same discovery that corrected D3:** `bound` is *not* short. Because
`collect-toplevel` folds a program's top level into one `letrec` before this pass runs, every
top-level name is in `bound` from inside that fold — ~800 of them when the compiler compiles itself.
So the ordering above is not a micro-optimization, it is the whole reason the threading is free: the
scan runs only where a head really does name a macro, never on the every-pair-head path.

Measured after the fact: `make regen` converged at fixed-point iteration 2 in **16m47s**
(`[2/3]` 587s + `[3/3]` 418s), against a ~22-minute derived expectation for a compiler-source edit,
with IR growing ~1% (`schemec.ll` 3,071,610 → 3,102,752 bytes). No regression, so D5's hash-table
fallback stays unused.

## Risks / Trade-offs

- **The guard grew a second check, because the change itself tripped the hazard it was written to
  prevent.** `test/flat-name-check.sh` (originally `macro-shadow-check.sh`, renamed when its scope
  widened) now also fails on a **duplicate top-level define** — issue #38's requested guard. An edit
  in this change re-added `*macro-depth-limit*` beside the original definition and nothing complained:
  every suite would have stayed green while the compiler paid #38's measured +18% IR. Both checks live
  in one script because they are the same class of defect — a name hazard that a *concatenated* top
  level makes possible and that no compile-time diagnostic reports — and both cost milliseconds
  before the fixed point instead of a silent regression after it. Verified in both directions:
  injecting a collision and injecting a duplicate each fail with the expected message. The tree is
  clean on both today (prelude: 312 defines / 12 keywords; core-flat: 485 / 3).

- **A program that relied on a keyword beating a binding now behaves differently.** → That program is
  incorrect under R7RS and today gets a silent wrong answer, not a diagnostic. The compiler's own
  sources are the population that matters, and they are checked by the suites; `src/core.ss`'s
  `str-search` carries the one comment recording the old workaround and can now drop it.
- **The prune could disable a prelude macro if the prelude ever defines a variable of the same
  name.** → Verified no collision at `6bcbfd6`; a task adds a check so a future collision is a build
  failure rather than a silently missing macro. This is the same class of silent hazard as issue #38.
- **The literal test is use-site-only, so it is an approximation.** → It is the approximation R7RS's
  own illustration needs, and it is strictly closer to the standard than spelling equality. The
  residual gap (a literal rebound in the transformer's own definition environment) is recorded as a
  non-goal in the spec delta itself, so the next reader does not mistake it for conformance.
- **`bound` is consulted on a hit, so a macro-heavy program pays a small scan.** → The scan is over
  enclosing lexical scopes only (D3, D5). If regen shows any regression, the fallback is to carry
  `bound` as a small hash table; nothing else in the design changes.
- **Every file touched is in `CORE_FLAT`, so this is a `make regen` barrier** (~22 min, five
  self-compiles) plus `./run-all-tests.sh` and `./run-dev-tests.sh` (~27 min and ~25 min). → Finish
  every source edit before starting regen; the iteration loop is
  `chez --libdirs src --script src/compile.ss`, which includes the sources directly.
- **The expander's dump output changes for any form that used to expand a shadowed keyword.** → That
  is the point; the affected forms are the ones that were wrong.

## Migration Plan

No user migration. The behaviour change is a narrowing of what the compiler accepts, and the change
lands before the 0.1.0 tag deliberately: after it, tightening the accepted language is a breaking
change under the SemVer contract `homebrew-tap-distribution` establishes.

Rollback is a revert plus `make regen` — the bootstrap IR travels in the tree, so a revert must
restore `bootstrap/` from the reverted commit rather than regenerate against mixed sources.

## Open Questions

- **Should a top-level define that displaces a keyword say so?** The prune is silent by design
  (user-wins, like `with-prelude`). A one-line note at `EMIT_VERBOSITY=verbose` would make an
  accidental collision visible without failing the build. Deferred pending the prelude guard, which
  covers the case that actually costs something.
- ~~**Does `do`'s expansion survive a shadowed step variable?**~~ **Answered, measured, and it cuts
  both ways — filed as issue #106.** `do` expands `(%do-step var step ...)` *inside* its
  `(lambda (var ...)`, so a loop variable literally named `%do-step` shadows the auxiliary keyword
  and the expansion breaks (`call: not a procedure: got a fixnum`, where Chez answers `(2 1 0)`).
  The same rule fixes the more likely shape in the same stroke: `(let ((%do-step f)) (%do-step 4))`
  now calls `f` and answers `44`, where before it expanded the internal helper and **silently**
  answered `4`. Both were broken; one is a silent wrong answer becoming correct, the other a working
  accident becoming a loud failure. Ordinary and nested `do` are unaffected (verified). Not fixed
  here because the fix is prelude surgery on a user-visible derived form — recursing through `do`'s
  own keyword with an accumulator so the step-defaulting happens before the loop's scope exists — and
  it belongs on its own verification schedule rather than inside a change about the expander. The
  spelling is in the `%`-prefixed namespace this project documents as internal.
