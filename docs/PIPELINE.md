# Frontend Pipeline

How the compiler lowers Scheme to the point where LLVM takes over. `LLVM.md` covers the
final arrow (`core → LLVM IR → { AOT | JIT | bitcode }`) and everything downstream; this
document covers everything **upstream** of it — the pass ladder, where the ladder stops,
and how the passes are written.

Grounded in a survey of Chez Scheme's own nanopass compiler (`s/cpnanopass.ss`,
`s/np-languages.ss`) and a hands-on nanopass-vs-hand-rolled bake-off (archived OpenSpec
change `spike-nanopass-translation`).

---

## The ladder, and where LLVM cuts it

Chez runs **~50 passes over ~30 intermediate languages** (`L1`..`L16`, with fractional
interpolations — one micro-language delta per pass). A Scheme→LLVM compiler needs only
the **top third**. Everything from ANF (`remove-complex-opera*`) down — calling-convention
imposition, allocation-pointer exposure, basic-block exposure, instruction selection,
register allocation, code generation — is exactly what LLVM does. The two largest single
passes in the Chez backend (`impose-calling-conventions` ~1700 loc; instruction selection
+ `generate-code` ~2700 loc) are entirely subsumed.

```
read → expand → core(Lsrc) → assignment-conv → closure-conv → lambda-lift → emit .ll → clang
                             └─ Chez L3→L4 ──┘ └─ L5→L6 ──┘ └─ L6→L7 ──┘
  └───────────── WE OWN THIS (the top third) ──────────────────────────┘ └── LLVM ──┘
```

Mapping to Chez's passes (owned vs. delegated):

| Chez pass (transition) | who does it |
|------------------------|-------------|
| expander → `Lsrc`; `Lsrc`→`L1` normalize core | **us** |
| `recognize-let` (L1→L2), `discover-names` (L2→L3) | us (bookkeeping / optional) |
| **`convert-assignments`** (L3→L4) — remove `set!` via boxing | **us** ★ |
| `cp0`-style source optimizer (inline, fold, drop) | us (`simplify`, a small subset) |
| `name-anonymous-lambda` (…→L5) | us (bookkeeping) |
| **`convert-closures`** (L5→L6) — `letrec` → explicit-free-var closures | **us** ★ |
| **`lift` + `expand-closures`** (L6→L7) — lambda-lift, lower closures | **us** ★ |
| `recognize-mrvs`, `expand-foreign`, `recognize-loops`, attachments | **defer** (features) |
| `remove-complex-opera*` (ANF), `normalize-context` | LLVM (SSA/mem2reg) |
| `impose-calling-conventions`, `expose-basic-blocks`, reg-alloc, codegen | **LLVM** |

★ = the transferable spine; the three passes the spike actually implements.

## Corollary: the minimal subset needs neither CPS nor ANF

Chez is direct-style (no CPS; `call/cc` via stack copying), and ANF (`remove-complex-opera*`)
is redundant against LLVM's SSA/mem2reg. So the minimal pipeline follows Chez's
**direct-style closure-conversion path** — the simpler of the two. CPS in `LLVM.md` is
correctly tied to `call/cc`, which is a phase-2 concern; it does not belong in the minimal
frontend.

**Confirmed empirically** by the `core-lambda-slice` build (`src/`): emitting directly
from lambda-lifted closures and relying on LLVM's SSA needed no ANF or normalize step —
`if` lowers to branches with a `phi`, everything else to straight-line calls, and
`mem2reg` cleans up. No `remove-complex-opera*` analogue was written.

## Realized pipeline (`core-lambda-slice`)

The first production slice (`src/`) implements the spine as hand-rolled `match` passes,
one observable intermediate language per stage (`--dump`):

```
read (host) → prepend prelude → collect-toplevel → expand → parse+rename → inline-primitives
            → recognize-let → convert-assignments → simplify → convert-closures → lambda-lift+lower
            → emit .ll → clang(+runtime,+libgc)
```

**Prelude.** `src/prelude.scm` is a small standard library (`not`, `list`, `length`, `reverse`,
`append`, `map`, `memq`, `assq`, plus the derived-form macros below). It is no longer *prepended*:
it is re-homed as the library **`(scheme base)`**, auto-imported into every program on all doors —
the Chez driver, the REPL, and the Chez-free embedded runner — and, since
`compiler-bootstrap-rehome`, into the compiler's own build too (its procedures resolve as
`scheme.base:*` externals against a linked `scheme.base.ll`; the derived-form macros are merged
compile-time). **User-wins shadowing** still holds (a user define of the same name beats the
import). `--no-prelude` skips the auto-import and macro merge, so prelude names and derived forms
are unavailable. (The `prepend prelude` box above is the historical model; the current mechanism
is the `(scheme base)` auto-import — see the module-system spec.)

**Simplify.** `simplify` (change: `simplify-known-calls`) is the ladder's only *optimizing*
pass — every other stage is a translation that changes representation and hands on the same
amount of work. It applies three rules to a fixed point: inline a lambda binding that is
referenced exactly once, in operator position, at matching fixed arity; propagate immediate
constants and fold `%+ %- %* %= %<` over them; drop bindings left unreferenced whose
right-hand side is syntactically effect-free. Together those collapse
`(define (square n) (* n n))` / `(square 34)` to the single constant `1156`, with no closure
record, no indirect call, and no multiply.

Its position in the ladder is load-bearing. Running **after `convert-assignments`** means
`set!` is already gone (assigned variables are boxed into `box`/`unbox`/`set-box!` primcalls),
so every variable the pass can see is immutable and both substitution rules are valid with no
assignment analysis of their own. A `set!` reaching the pass would invalidate that reasoning,
so `simplify` has no `set!` clause and fails loudly rather than miscompiling. Two deliberate
restrictions keep it honest:

- **Single-use inlining only.** The body *moves*; it is never copied, so the pass cannot grow
  the output — which matters for a project whose deliverable is small binaries. A
  self-recursive function references its own name and so is never a candidate, with no
  separate recursion test.
- **A conservative folding window.** Folding is confined to operands within ±(2^30 − 1),
  the range in which no `+`, `-`, or `*` can leave the 61-bit fixnum range. The compiler is
  self-hosted and emit's own fixnums wrap silently, so a fold may not compute first and
  range-check afterwards. A folded result must also survive being *emitted*; that was briefly
  the tighter constraint, because `encode-const` overflowed at 2^57 (issue #7, since fixed). Constant *propagation* has no window (copying computes
  nothing) but is restricted to **immediates** — a string or pair constant materializes at run
  time, so duplicating it would allocate a second object and break `eq?` between references
  that used to name one.

**Where it does and does not fire.** The inlining rule needs a binding group. `build-program`
(`src/parse.ss`) gives it one for a program file's top-level `define`s: an all-lambda program
becomes a plain `letrec`, and a mixed one boxes only the defines that need it while
letrec-binding the lambda-initialized rest (see below). It finds nothing in the REPL or in
library units, whose top-level defines are persistent globals rather than a binding group —
`simplify` runs over all 120 of `(scheme base)`'s defines and rewrites none. Folding and
dead-binding removal still apply to local `let`s everywhere. This is a performance asymmetry
only; values are identical on every door.

**Top-level defines and boxing.** `build-program` hands the whole group over as **one
`letrec`**, mixed initializers and all — that is enough on its own, because the `letrec`
lowering accepts a non-lambda initializer and fills such bindings in binding order, which is
exactly `letrec*`. It deliberately decides nothing about storage. The only exception is a name
defined more than once, which keeps a sequential `let` + `set!` shape: the renamer resolves a
duplicated `letrec` binder to the *first* binding, while top-level redefinition is last-wins.

`convert-assignments` then splits the group three ways, in binding order:

| | condition | lowering |
|---|---|---|
| closure block | unassigned lambda | stays in the `letrec` — recursion and inlining unaffected |
| plain | unassigned non-lambda whose initializer needs nothing from the group but an *earlier plain* binding | an ordinary nested `let` binding — no location at all |
| boxed | anything else | `'()`-box filled by `set-box!` in binding order |

The plain test follows from where each part is emitted: plain bindings nest outermost, so their
initializers run before the closures exist and before any box is filled. Nesting rather than
one parallel `let` is what lets a later initializer read an earlier one, preserving `letrec*`
order. A binding that fails the test is boxed, which is always correct — the rule only trades
precision away, never soundness.

This is where `(define n 1)` stopped costing a heap box and an `unbox` per read. The old
desugaring emitted `let` + `set!` here, so *every* define was assigned by construction and
therefore boxed — the storage question was being answered in the wrong place, before the
compiler could tell a `set!` the program wrote from one the desugaring invented
(`docs/PERFORMANCE.md` P7).

**Macros (`expand`).** `expand` is a fixpoint `syntax-rules` macro expander. Before
`collect-toplevel`, the driver lifts every top-level `(define-syntax name (syntax-rules …))`
out of the form sequence into a macro environment (from the prelude and the program, plus the
transformers an imported library exports — change: `library-macro-export`, `docs/MODULES.md`);
`expand` then rewrites each macro use by its first matching rule and re-expands the result
until only core forms and known primitive heads remain. Expansion is **hygienic for
macro-introduced identifiers** — a template identifier that is not a pattern variable and
does not name a known binding is consistently renamed per expansion, so a macro's
temporaries cannot capture (or be captured by) user code; the shared `fresh-name` counter
supplies the names. The branching/binding derived forms (`cond` — with `else`/`=>`/bare
tests — `and`, `or`, `when`, `unless`, `let*`) are ordinary prelude macros; **named `let`**
is still hand-written in `expand.ss` because it overloads the core `let` keyword, as are the
arity-driven n-ary arithmetic (`+ - *`) and comparison (`= < > <= >= eq? eqv?`) desugarings.
A depth guard reports non-terminating macros instead of looping. Deferred: `let-syntax`,
procedural macros, and full referential-transparency hygiene.

**Reader (`read`).** The `read (host)` box above is still Chez's `read`, which turns the
*source file* into forms at compile time. But the pipeline's own `read` now also exists **in
Scheme**: `src/prelude.scm` defines `read-from-string`, a recursive-descent reader (integers,
symbols, lists, `#t`/`#f`, `#\char`, `"strings"`, `'`-quote sugar, `;` comments) that any
compiled program can call to parse text into data. Replacing the host `read` at the front of
the pipeline with this Scheme reader is the concrete self-hosting milestone it sets up; string
escapes, dotted pairs, quasiquote, and the wider number tower are noted follow-ons.

**Inlining primitives (`inline-primitives`).** A universal core→core pass run in every
compile path (`compile-forms`, `compile-program-with-imports`, `repl-lower-form`) right after
`parse+rename` (and, on the module path, `resolve-globals`). It exists because *integrable*
primitives — `cons` today, more per `first-class-primitives` — are **ordinary, shadowable
bindings**, not reserved keywords: their plain names carry no special meaning until this pass
decides, per occurrence, whether to inline. Alpha-renaming has already made this decision
trivially observable: an **unshadowed** integrable survives as its **bare source symbol**,
while any lexical/top-level/`set!` shadow was renamed to a unique gensym — so the pass needs
no scope tracking. It rewrites a direct unshadowed call `(call cons a b)` into the bare
`(primcall %cons a b)` (recovering baseline codegen — the `%`-op lowers to the same `rt_cons`
and never appears in LLVM IR), and a value/`apply`/wrong-arity use of the bare symbol into an
eta lambda `(lambda (p…) (primcall %cons p…))`. A shadowed (renamed) binding is left
untouched, so the user binding wins. Because the pass is shared by all doors, the REPL and the
AOT build make **identical** inlining decisions (dev→ship fidelity). The raw `%`-ops it emits
stay reserved primcall heads, which is why adding an integrable is a staged-bootstrap step
(the committed seed must learn the `%`-name — see the `first-class-primitives` change and the
D3 lesson recorded there).

| stage | IL shape (s-expr) | file |
|-------|-------------------|------|
| core | `(const d)｜x｜(if …)｜(lambda (x…) e)｜(call e e…)｜(primcall op e…)｜(let/letrec …)｜(seq …)｜(set! x e)` — `letrec*` parses to the same `letrec` node, since that lowering already gives letrec*'s left-to-right initialization | `src/parse.ss` |
| inline-primitives | same core IL; direct unshadowed integrable call `(call cons a b)` → `(primcall %cons a b)`, value/apply/wrong-arity use `cons` → `(lambda (p…) (primcall %cons p…))`; a shadowed (alpha-renamed) binding is left untouched | `src/parse.ss` |
| recognize-let | + `(let …)` from `(call (lambda …) …)` | `src/passes/recognize-let.ss` |
| convert-assignments | − `set!`; `+ (primcall box/unbox/set-box! …)`; splits a `letrec` group into closure-block / plain-`let` / boxed bindings (issues #8, #9 and P7), so what reaches `lower` as a closure block is all-lambda and only real mutation gets a box | `src/passes/convert-assignments.ss` |
| simplify | same IL, smaller: inlines a singly-referenced lambda binding into its one call site, propagates immediate constants, folds `%+ %- %* %= %<` over constants, drops unreferenced effect-free bindings | `src/passes/simplify.ss` |
| convert-closures | − `letrec`; `+ (closures ([x (fv…) le]…) body)` — every `le` is a lambda, guaranteed by the split above | `src/passes/convert-closures.ss` |
| lambda-lift + lower | `(program (code …) entry)` with `(local x)｜(free-ref i)｜(make-closure …)｜(closure-block …)｜(app f (a…))`; a call to a statically-known closure becomes `(known-app label f (a…))`, or `(self-app label (a…))` for a self-call, so no code pointer is loaded (P5-B). An operator that resolved to an **imported** procedure with a recorded label and matching arity takes the same `known-app` path across the unit boundary (P5, cross-unit); in a **library** unit a top-level lambda binding is lifted under the stable label `libname:code:<name>` rather than a counter one, so a tree-shaken recompile spells it identically | `src/passes/lower.ss` |
| emit | textual LLVM IR (opaque `ptr`, `fastcc`, `musttail`); the allocator is declared `align 8` so `-O2` can see through a closure's tag mask (P6-B); each cross-unit `known-app` label is `declare`d, as an imported global is | `src/emit.ss` |

**Inspecting the stages (`--dump`).** Every door of the shipped binary prints the IL after
each named pass to stderr — `build/emit run --dump prog.scm`, and likewise `build`, `lib`,
and `repl`; `EMIT_DUMP_LEVEL=2 build/schemec` for the filter, which has no argument parser.
No Chez required (change: `emit-dump-stages`); the Chez driver's `--dump` remains as the
reference the shipped dump is checked against (`test/dump-parity-tests.sh`).

Which stage names you see depends on which front half runs, and there are two:

- **whole-program** (`compile-forms` — the `schemec` filter, and the Chez driver under
  `--no-prelude`): `collect-toplevel`, `expand`, `parse+rename`, then the four above.
- **modular** (`compile-program-with-imports` — what every shipped door takes, since
  `(scheme base)` is auto-imported, and the Chez driver's default): the same ladder with
  `parse+rename+imports`, that stage additionally resolving imported globals.

A library's defines and the REPL's forms are lowered one form at a time (through
`unit-lcode` / `repl-lcode`), so those stages repeat and each header names its form:
`;; ==== after convert-closures [define fact] ====`. Library units other than the one under
inspection are dumped only under `--dump-all`, tagged `[unit (scheme base)]` — otherwise the
auto-imported standard library's ~600 stage dumps would bury the program's seven. See
`docs/OUTPUT.md` for the flags and the level/environment channel.

Two passes beyond the spike's three were new here: **lambda-lift + lowering** (hoist code,
make closures explicit heap objects, calls indirect through `code_ptr`). Codegen upholds
`LLVM.md`'s conventions: tagged-pointer values, heap closures, one uniform calling
convention so tail calls can be `musttail`, Boehm GC. Verified end to end by
`demos/run-tests.sh` (recursion, allocation, captured-mutable boxing, and 10M-iteration
tail recursion in bounded stack).

**Flonum f64 regions (`emit.ss`, change: flonum-unboxing).** The emitter is otherwise
monotyped — every SSA value is an `i64` tagged word — but a *second* machine type, native
`double`, appears inside one local peephole. A "flonum region" is a maximal tree of the binary
numeric primcalls (`%+ %- %* %= %<`) that is statically flonum-**evident**: some operand traces
to an inexact literal, `exact->inexact`, or a flonum-stable variable (a small least-fixpoint
over a code block's `self-app` back-edges marks loop params like `zx`, while excluding the
integer counter `i`). Such a region is emitted as a guarded pair of arms joined by a phi — a
**fast** arm that unboxes each non-literal leaf (`flo_val` load), computes the whole tree in
native `fadd`/`fmul`/`fcmp` with immediate `double` literals, and boxes **once** at the arith
root (`rt_make_flonum`); and a **slow** arm that is exactly the existing per-op boxed lowering,
reached (via an `rt_flonum_p` guard) whenever a leaf is not actually a flonum. So the `rt_*`
runtime stays the single definition of numeric semantics, intra-expression intermediates never
allocate on the hot path (mandelbrot: ~66% fewer GC collections), and — because a region never
fires for flonum-free code — the compiler's own IR is byte-identical (`make regen` stays clean).
This is intra-*expression* only (Option A): the `let`-temps that `expand-compare` introduces and
the `fastcc` back-edge remain escape points that box, so it needs neither ANF nor a
calling-convention change.

---

## How the passes are written: nanopass vs. hand-rolled `match`

`LLVM.md` currently states the pipeline "uses the nanopass framework." A spike tested
that assumption empirically by writing the three spine passes **both** ways — with
nanopass, and hand-rolled over plain s-expressions using the Chez `match` macro — and
running them against shared inputs. All cases agree; full data in the archived OpenSpec
changes `spike-nanopass-translation` and `select-syntax-rules-matcher` (under
`openspec/changes/archive/`).

Summary of the finding at this project's scale (~5–9 frontend passes):

- **Line count** favors **hand-rolled** until ~7–8 passes: nanopass saves ≈ 5.7 logic
  lines/pass but costs ≈ 40 lines of `define-language` IL definitions up front. The
  top-third pipeline sits right at that crossover.
- **Boilerplate**: nanopass wins clearly on *trivial structural* passes (its
  auto-catamorphism removes pass-through plumbing), but the advantage **evaporates** on
  analysis passes (`find-assigned`, `free-vars`) — those fold the IR to a *set*, not an
  IR→IR rewrite, so both sides hand-write the same traversal.
- **Readability** splits along the two `CLAUDE.md` values: nanopass's ILs *are* a
  self-documenting spec of each stage (transparency), while hand-rolled needs no framework
  knowledge to read (simplicity).
- **Safety**: nanopass gives free **exhaustiveness** (unhandled forms error at
  definition time) — its strongest advantage.
- **Self-hosting**: `match` is **325 LOC** and easily vendored; nanopass is **~9,700 LOC**
  of `syntax-case`-heavy code a future self-host must carry. The sharpest differentiator.

### Decision

**Start hand-rolled with the Chez `match` macro.** At the realistic early pass count the
total-line and dependency-weight numbers favor it, and the analysis passes real pipelines
are full of do not benefit from nanopass's catamorphism. The worked comparison of both
approaches is preserved in the archived OpenSpec change `spike-nanopass-translation`.

**Revisit nanopass if the pipeline grows past ~7–10 passes or the IL churns often** — at
that scale its line savings, self-documenting ILs, and free exhaustiveness check begin to
dominate.

Regardless of framework, adopt nanopass's best discipline: a **named, explicit
intermediate language per stage** (documented even if not machine-enforced). That explicit
per-stage IL is the "clear stages / transparency" the project is after — and if we ever
want it machine-checked, that is the moment to reach back for nanopass.

> This softens `LLVM.md`'s nanopass commitment rather than reversing it. See that file's
> pipeline framing for the reconciliation.
