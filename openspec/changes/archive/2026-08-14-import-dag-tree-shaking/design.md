## Context

Two ship doors tree-shake, and both compute a unit's root set the same way, through one shared
rule in `src/core.ss`:

```scheme
(define (program-root-internals prog-text unit-name candidates)
  (fold-left
    (lambda (acc n)
      (if (and (not (memq n acc))
               (str-contains? prog-text (string-append "ptr @\"" (mangle unit-name n) "\"")))
          (cons n acc) acc))
    '() candidates))
```

The root set is derived by **searching emitted IR text** for the mangled symbol of each candidate.
That is the fact this whole design turns on: roots are a property of *text*, so "seed a unit's roots
with what its importers still reference" needs no new representation — it is the same search over a
longer string.

Both doors then refuse to shake a unit that another unit imports. The Chez driver
(`build-modular-artifacts*`, `src/compile.ss`) says so in its own comment — *"A unit is prunable
only if NO OTHER unit in the closure imports it (else that importer — kept full — could reference a
dropped binding); this keeps the first cut sound without full backward DAG propagation."* Mode 17
(`repl-shake-library`, `src/repl-core.ss`) answers `(keep . NAME)` for the same reason, and
`shake_units` (`src/emit.cpp`) narrates it as "kept whole (another unit imports it)".

The parenthetical is the entire justification, and it is conditional on **order**. An importer kept
full can reference a dropped binding only because the importer was finalized *before* its dependency
was shaken. Reverse that order and the hazard cannot arise.

Until `scheme-base-partition` the gate cost nothing, because no shipped library imported another.
Now `(scheme base)` imports `(emit internal)`, so the substrate is unprunable by construction and
every AOT binary carries all 170,716 B of it.

**Measured, on the committed artifacts.** The *unshaken* `(scheme base)` unit references exactly
**9** distinct `(emit internal)` bindings out of 114 (`%make-port`, `%port-buf`, `%port-rtd`,
`rd-datum`, `rd-fail-pos`, `rd-fail?`, `rd-number`, `rd-skip-ws`, `rd-token-at`). A `(scheme base)`
shaken to 4 defines will reference some subset of those nine, and the substrate's own reachability
closure over that subset is what a minimal binary would keep. That is the size of the prize, before
any of it is built.

## Goals / Non-Goals

**Goals:**

- A library another unit imports is shaken against its importers' **retained** set, not kept whole.
- Any unit in the import closure is shakeable, not only a direct import of the program.
- Both ship doors keep one root rule and produce the same retained set for the same program, which
  is already a spec requirement (`aot-codegen`: "A delivered executable's size SHALL NOT depend on
  which door produced it").
- A delivered library (`emit lib`) can be shaken to its own exported interface — the second root set
  the `aot-codegen` requirement was written to anticipate.
- An under-approximated root set must fail **loudly and in CI**, not silently ship a broken binary.

**Non-Goals:**

- Changing what reachability *means* inside a unit. `compile-library*`'s `keep-roots` walk is
  untouched; only the roots handed to it change.
- Shaking on the open-world doors (`emit run`, `emit repl`). They keep full units, unchanged.
- A symbol-table- or bitcode-level reachability analysis to replace the IR text search. The text
  rule is the shared, tested one; replacing it is a separate change with its own risk (see D3).
- LLVM `internalize`/`globaldce`. `aot-release-profile` already measured this: it removes 0 of 249
  functions, because the eager `__init` + `rt_root` keeps every binding live.
- P9 (variadic callees lose direct calls), which touches the same emitted call forms but is an
  independent codegen decision.

## Decisions

### D1 — Reverse topological order, with the root text accumulated as units are finalized

Shake the closure in reverse link order: the program is final on arrival, then each unit in reverse
of `order`, so every unit that could import `N` is already final when `N` is shaken. `N`'s root text
is the concatenation of the program IR and every already-finalized unit's IR.

**Why concatenate everything finalized rather than only `N`'s importers.** It is simpler, and it is
not even an over-approximation: a unit emits `ptr @"X:name"` only for a library it imports, so a
non-importer's IR contains none of `N`'s mangled symbols and contributes nothing to the search. The
importer set is therefore an optimization of the search string, not a correctness condition. Doing
it the simple way also means neither door needs the reverse-import map — the Chez driver has
`dl-cache` and could build one, but `emit build` reaches mode 17 one unit at a time and would have
to ship the map through the door protocol to get the same answer.

*Alternative considered:* keep the forward order and iterate to a fixed point (shake, re-shake
anything whose importer shrank, repeat). Correct, but it pays repeated recompiles of the same unit
for an answer one ordered pass gets exactly, and this project already has one fixed point costing
minutes per iteration (`tools/regen.sh`) and no appetite for a second.

### D2 — Retire both prunability gates rather than weaken them

The two gates go together: `(member nm direct-imports)` and `(not (member nm imported-by-unit))` in
the Chez driver, `imported-by-another?` in mode 17. Under D1 the first is wrong (it excludes exactly
the transitively-imported units this change exists to shake) and the second is unnecessary (its
hazard is ordered away).

Removing the second gate deletes the guard that was **latently broken** through
`scheme-base-partition` — it compared library names, which are lists, with `memq`, so it silently
never fired until someone noticed the substrate being pruned and the link failing. That history is
the argument for D5: the replacement needs a test that fails when propagation is *wrong*, not merely
one that passes when it is absent.

### D3 — The root rule stays a text search, and the `ptr`/`code:` pairing becomes an asserted invariant

A cross-unit reference appears in two textual forms: the closure load `ptr @"emit.internal:rd-datum"`
and, since `cross-unit-direct-calls`, the direct call `call fastcc @"emit.internal:code:rd-datum"`.
The root rule searches for the `ptr` form only. On the committed artifacts the two are paired
exactly — 9 `ptr` forms, 9 `code:` labels, 18 distinct symbols total, no `code:`-only reference — so
searching one form finds every reference today.

Today is doing real work in that sentence. A codegen change that emits a direct call **without**
loading the closure would make a `code:`-only reference, which the root rule would miss, which would
drop a live binding, which would fail at link. P9's sketch (a fixed-arity entry point beside the
variadic one, targeted by known-arity call sites) is exactly such a change.

So: keep the one-form search, and add a test that asserts the pairing across the shipped units — for
every `@"U:code:n"` in a unit's IR there is a `ptr @"U:n"`. If a later change breaks the pairing the
test names the invariant, instead of a build failing with an undefined symbol and no explanation.

*Alternative considered:* search for both forms. Cheap, and it would survive P9 — but it hides the
coupling instead of recording it, and a third reference form invented later would be missed just as
silently. The assertion is what keeps the rule honest.

### D4 — The shaken cache entry keys on the root text, not the program IR

`shake_units` currently keys an entry on `fnv1a_hex(prog_ir)`, with a comment justifying it: *"the
program's emitted IR is what determines them: same IR, same roots, necessarily."* D1 falsifies that
sentence. A unit's roots now depend on its importers' shaken IR as well, and an importer can change
without the program changing — a different compiler shakes it differently, and the entry's compiler
identity covers that, but the general claim no longer holds.

Key each entry on the digest of the **full root text** handed to mode 17 for that unit. It is
computed in order, before the mode-17 call, so it is available exactly where the current digest is,
and it degrades the same way: a miss costs one recompile.

This satisfies the `artifact-cache` requirement as written — an entry keyed on "the root set it was
pruned to" — which the program digest only approximated.

### D5 — Prove propagation with a size assertion, not only a link

Every test that merely *links* passes when propagation is absent, because keeping too much is
sound. The test that matters asserts the substrate **shrinks**: build a minimal program, and assert
the linked `(emit internal)` unit is a small fraction of its full 170,716 B and that named reader
symbols (`rd-datum`, `rd-token-at`) are absent from the delivered binary. Pair it with a program
that *does* read, asserting they are present — so the test fails if propagation over-prunes as well
as if it under-prunes.

The existing cross-door requirement gives the second assertion for free: build the same program both
ways and compare retained sets.

### D6 — `emit lib --shake` is opt-in, and the default stays byte-identical — **WITHDRAWN by D7's gate**

> **Outcome (task 1.3/1.4).** Not built. The measurement below said the win is 0–0.45%. Kept here
> because one of its findings survives the withdrawal: the pruned path is **not** byte-identical to
> the unpruned path even when it prunes nothing — `(emit internal)` shaken to all 79 of its exports
> keeps all 174 defines and comes out **15 bytes larger**. So had `emit lib` shaken by default, the
> `emit-cli` byte-identity guarantee would have broken for every library, including the ones with
> nothing to lose. The opt-in design was right for a stronger reason than the one it was argued
> from, and the guarantee now stays in the spec unqualified.


`emit-cli` requires the `emit lib` unit IR to be "byte-for-byte identical to the unit the AOT and
REPL doors produce for the same source (one compile-unit core)", and tests pin it. An
interface-shaken artifact is by definition not that unit. Rather than weaken the guarantee, add the
shake behind an explicit flag: the default artifact is unchanged and the guarantee holds verbatim
for it; the flag delivers a different, deliberately-asked-for artifact.

The root set is the library's own exports plus what its exported macros' templates reach — the same
`candidates` list `program-root-internals` filters, used **unfiltered**. So this is one call site
passing the candidate set directly as `keep-roots`, not new machinery. The `.exports` table is
identical either way: shaking removes internals nothing exported reaches, so the interface it
describes does not change.

Safety of the artifact on disk: a shaken delivered unit is safe for any *importer*, because every
export is a root. It is not safe as an open-world REPL unit — but a REPL importing a library sees
only its exports, which are all present. The hazard the `artifact-cache` spec guards against
(serving a shaken unit where a full one is required) stays a cache concern, and this artifact does
not enter that cache.

### D7 — Measure the `emit lib` half before building it, and be willing to not build it — **GATE FIRED**

> **Outcome (task 1.3/1.4).** The gate fired and the half is dropped. Measured: `(emit internal)`
> **0%** (174/174 defines kept, 15 bytes *larger*), `(scheme read)` **0%** (12/12), `(scheme base)`
> **0.45%** (487/491, 2,679 B of 592,185 B). All three are far under the pre-stated 10% threshold.
> Issue #104's own prediction — *"a well-kept library may lose nothing at all"* — is what happened.
> The `emit-cli` delta is withdrawn, the `aot-codegen` delivered-library requirement is withdrawn,
> group 6 is struck, and the numbers are the deliverable. Writing the threshold down in advance is
> what made this a two-hour measurement instead of an argument.


Issue #104 sets this condition itself: shake `lib/scheme/read.sld` and `lib/scheme/base.sld` to
their own exports, compare byte counts, and *"if the answer is 'a few percent', the honest outcome is
to record it in `docs/PERFORMANCE.md` and not do the work."* A well-kept library may lose nothing —
its internals exist because its exports use them.

The measurement is cheap and comes first (tasks 1.x), because it is the same `compile-library*` call
with a different `keep-roots`, runnable before any of D6's door work exists. The threshold is stated
in advance so the decision is not made by whoever is already invested: **under 10%** on both
libraries and the `emit lib` half is dropped, the number is recorded, and #104 closes with the
measurement as its answer.

## Risks / Trade-offs

**An under-approximated root set drops a live binding.** → It fails at **link time** with an
undefined symbol, not at run time with a wrong answer. Loud, and caught by every build in every
suite. This is the same failure the `memq` bug produced, and it is why removing the gate is
recoverable in a way that a silent-wrong-answer class of bug would not be.

**The `ptr`-only search is a standing hazard, now load-bearing on more units.** → D3's asserted
pairing test. The risk existed before this change; it applies to more units after it, which is why
the invariant gets a test now rather than when P9 breaks it.

**Every shaken unit becomes program-specific, so cache pressure rises.** → It already did with P8;
this widens it from the program's direct imports to the whole closure. `shake-` entries are the
small ones (5–8 KB; 48 of them total under 400 KB per P17's measurement), and P17 remains the place
where eviction is decided — this change adds entries, not a new kind of unboundedness.

**Both ship doors must stay in agreement.** → They share `program-root-internals` by design (D8 of
`chez-free-unit-pipeline`, which moved it into `src/core.ss` for exactly this reason). The new
parameter goes into that shared function; the per-door work is only *assembling* the root text. The
cross-door size comparison in D5 is what detects a drift.

**`emit build`'s per-unit door protocol carries more text.** → Mode 17's third section grows from the
program IR to the program IR plus finalized units — for a full closure that is the whole shaken
program's IR, tens to low hundreds of KB, handed across the door once per unit. Measure it; if it
costs, the importer-only search string from D1 is the available optimization, and it is a pure
narrowing with the same answer.

**A regen barrier.** → `src/core.ss` and `src/repl-core.ss` are in `CORE_FLAT`. All compiler edits
finish before `make regen` starts (~22 min, 5 self-compiles); `src/compile.ss` and `src/emit.cpp`
are exempt and can be iterated freely via `chez --libdirs src --script src/compile.ss` and plain
`make`.

## Open Questions

- ~~**Does a shaken `(scheme base)` still reference `%make-port`/`%port-rtd`?**~~ **Answered (task
  1.2): no — it references nothing at all.** The full `(scheme base)` unit reaches 9 of the
  substrate's bindings; shaken to `list` for a minimal program it reaches **0**, and the program's
  own IR reaches 0. The substrate's 88 top-level body forms contain no command, so `cmd-roots` is
  empty from source as well. The correct root set for `(emit internal)` in a minimal program is
  therefore empty, and the expected result is the whole 348,536-byte unit pruned away. What remains
  to confirm at 3.5 is only the post-expansion floor: `define-record-type` may expand to a command
  that pins the type cell (`%port-rtd-cell`).
- **Should the root text be narrowed to actual importers (D1's optimization) in this change or a
  later one?** Deferred to the measurement in the risk above; the correctness argument is the same
  either way.
