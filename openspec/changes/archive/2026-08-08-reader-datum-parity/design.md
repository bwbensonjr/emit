## Context

Three fall-throughs, one shape: a datum the reader is required to produce meets code that has no arm
for it and degrades to `?` or an error. Issues #64 (lowering) and #52 (irritant rendering) are filed
separately, and the third — `render-datum`'s missing vector arm — is named inside #64 as the reason
`bad const ?` cannot say *which* literal it choked on.

**What binds them into one change.** `render-datum` stopped being diagnostics-only when
`library-macro-export` made it the writer of the export table, and its own comment states the
consequence: "This renderer WRITES the export artifact on every door now, not just diagnostics, so a
datum it renders as `?` would corrupt a table rather than merely read poorly in a message — hence
`render-char` errors instead of guessing a spelling." A vector literal is the case where that warning
has already come true. Verified at 562ae62:

```console
$ emit lib veclib.sld        # exported macro template contains #(1 2)
lib veclib.sld -> build/lib/veclib.ll  [5316 bytes]        # exit 0 -- no diagnostic
$ cat build/lib/veclib.exports
((veclib) () () (((vconst () ((_) quote ?))) () ()))       # the vector is now `?`
```

The corruption is currently *masked*: an importer recompiling that library hits `bad const ?` from
`encode-const` and fails before the bad table can matter. So fixing #64 in isolation would convert a
loud compile failure into a silent miscompile. That ordering constraint is the reason these land
together, and it dictates the sequence in D5.

## Goals / Non-Goals

**Goals:**

- A vector or bytevector literal compiles as a constant wherever any other quoted datum may appear.
- `render-datum` represents both, in the `#(...)` / `#u8(...)` spellings both readers accept, so
  export tables round-trip.
- A door's diagnostics never print `?` for a datum they are reporting — fixed once, in the shared
  path, rather than at the one call site #52 names.
- No commit in this change leaves the export-table corruption unmasked.

**Non-Goals:**

- Literal immutability or literal sharing. A quoted vector materializes fresh at its point of use,
  exactly as a quoted pair does today; R7RS makes mutating a literal undefined, and changing the
  pair precedent is a separate question.
- Constant-folding or hoisting vector constants out of loops. Same cost profile as the existing pair
  clause; it belongs to `docs/PERFORMANCE.md`, not here.
- Widening the reader. `reader-lexical-conformance` and `reader-token-path` already read both
  literals; this change is strictly about what happens after.
- `rationalize`, exactness prefixes, or rational literal syntax (#27). Unrelated reader gaps.

## Decisions

### D1: Lower vector and bytevector constants by allocate-then-fill, mirroring the pair clause

`encode-const` (`src/emit.ss:292`) already materializes an aggregate constant at runtime in its
`pair?` clause — encode the parts, emit a constructor call, return the operand. Vectors take the same
shape with an allocate-then-fill body:

- `vector?`: emit `rt_make_vector(FIX(n), fill)`, then one `rt_vector_set` per element, each element
  operand produced by a recursive `encode-const`. Fill with the unspecified value
  (`encode-const-unspec`, `src/emit.ss:117`) since every slot is then assigned.
- `bytevector?`: `rt_make_bytevector(FIX(n), fill)` plus one `rt_bytevector_u8_set` per byte.

All four runtime entry points already exist (`src/runtime/runtime.c:1188`, `:1196`, `:1208`, `:1217`)
and are already declared for the primitive layer, so no new runtime support and no new `declare`.

*Alternative considered:* emitting a static LLVM global for the vector's payload, as strings do with
`emit-cstring-global`. Rejected for now — a vector's elements are tagged `val`s that may themselves
require runtime materialization (a symbol needs `rt_intern`), so a static initializer only works for
the all-immediate case and would mean two code paths for one clause. Worth revisiting as a
size/speed optimization once correctness is in, and it belongs in `docs/PERFORMANCE.md` if so.

### D2: Place the new clauses before the flonum clause, after `pair?`

Clause order in `encode-const` is load-bearing — the comment at the flonum clause records that "an
integral flonum (3.0) reaches here because it fails clause 1's exact? test". `vector?` and
`bytevector?` are disjoint from every existing predicate, so they are order-independent in principle;
placing them immediately after `pair?` keeps the aggregate clauses adjacent and leaves the delicate
numeric ordering untouched.

### D3: `render-datum`'s new arms use the spellings both readers accept

`#(...)` and `#u8(...)` are exactly what `core-language` requires the reader to read (:838, :2021)
and what the printer already emits, and Chez's `read` accepts both — so the export table keeps
round-tripping through the Chez-hosted driver's artifact-reuse path and Emit's own reader alike.
Elements recurse through `render-datum`, so nesting works without special handling. The final
`else "?"` stays for a genuinely unknown type.

### D3a: A bytevector renders in diagnostics but is refused in an artifact

Found while testing D3: **Chez's `read` rejects `#u8(1 2)`.** Chez spells a bytevector
`#vu8(...)`; `#u8(...)` is the R7RS spelling that Emit's own reader uses. Verified directly —
`#(1 2)` reads on both, `#u8(1 2)` reads only on Emit, `#vu8(1 2)` only on Chez.

That matters because `src/compile.ss` reads export tables *back* with Chez's `read` on its
artifact-reuse path (`(car (read-program expf))`). A table containing `#u8(...)` would therefore be
unreadable by the driver — precisely the failure `render-char`'s rule already names: "an error
rather than a rendering the other door cannot read back". Writing `#vu8(` instead only moves the
breakage to Emit's reader.

So the bytevector arm is **mode-dependent**, and it is the only arm besides `render-char` that is:

- **loose** (diagnostics) renders `#u8(...)`, since nothing reads that text back;
- **strict** (artifacts) raises, naming the reason and the fix.

The blast radius is small and worth stating precisely, because it is easy to over-read: a
bytevector *constant* — the actual subject of #64 — is unaffected in a program or a library body,
because that is `encode-const`, not this renderer. Only a bytevector inside an **exported macro
template** is refused, and it is refused loudly instead of silently becoming `?`.

*Alternative considered:* teaching Emit's reader to also accept `#vu8(` so tables could use the
spelling Chez reads. Rejected — it widens this change into the reader and puts a non-R7RS spelling
into a committed artifact, to buy a case (a bytevector literal inside an exported macro template)
that has no known use.

*Spec consequence:* the `module-system` delta's bytevector round-trip scenario becomes a
fails-the-library scenario. Vectors round-trip as originally specified.

### D4: Diagnostics get a total renderer; the artifact path stays strict

`repl-irritant->string` cannot simply call `render-datum`: `render-datum` *raises* for a character
with no portable external representation (`render-char`, `src/core.ss`), and raising while rendering
an error message would replace a diagnostic with a secondary failure. The strictness is correct for
the artifact path — a table must fail rather than guess — and wrong for the diagnostic path, which
must be total.

So: **two entry points over one worker.** `render-datum` keeps today's strict behavior; a loose
entry point spells an otherwise-unrepresentable character as human-readable text (`#\x<hex>`) instead
of raising, and `repl-irritant->string` falls through to *that*. Because the loose renderer's output
is only ever diagnostic text and is never re-read, its spellings carry no round-trip obligation.

Two entry points rather than one with an optional argument, following the precedent the reader set:
`read-all-from-string` / `read-all-from-string-ci` are "TWO entry points over ONE worker, rather than
one entry point with an optional argument (change: `reader-token-path`, design D1/D2)" because an
optional argument costs every call site its cross-unit direct call (`docs/PERFORMANCE.md` P9). The
export-table writer is on the compile path and should not pay for the diagnostic case.

*Alternative considered:* making `render-char` total and dropping the strict variant. Rejected — it
deletes the guard that keeps an unrepresentable datum out of an artifact, which is the invariant the
`module-system` delta here makes explicit.

### D5: Sequence the work so the corruption is never unmasked

Land the renderer before the lowering:

1. `render-datum` arms (D3) and the loose entry point (D4) — the export table becomes faithful while
   `bad const` still blocks the compile, so nothing regresses and nothing is unmasked.
2. `repl-irritant->string` fall-through (#52) — independent of the above two, no ordering constraint.
3. `encode-const` clauses (D1) — the compile now succeeds, into a table that is already correct.

Doing 3 before 1 would ship a window in which a vector literal in an exported macro template
compiles to a silently wrong expansion. Since all three files are in `CORE_FLAT` and share one regen
cycle, this is an ordering constraint on the *edits within the change*, and on which commit is
allowed to be the fix commit — not a reason to split the change.

## Risks / Trade-offs

- **All three files are in `CORE_FLAT`** (`src/emit.ss`, `src/core.ss`, `src/repl-core.ss`) → one
  `make regen` (~12 min) plus both suites, and regen is a barrier: finish every edit first. Iterate
  through `chez --libdirs src --script src/compile.ss` until then.
- **The compiler compiles itself** → adding a vector constant to compiler source would make the
  fixed point depend on the new clauses. No compiler source uses a quoted vector today (that is what
  made #64 survivable this long), so convergence should take one pass; if a second is needed, that is
  the known prelude/bootstrap ordering case, not a defect.
- **`render-datum` output appears in committed artifacts** → an export table for a library with a
  vector-bearing template will change on regeneration. Those tables are currently *corrupt*, so the
  change is a fix; but a diff in `bootstrap/` or `build/lib` that looks like a format change should
  be read as this, and checked rather than assumed.
- **A quoted vector materializes on every evaluation** → a constant in a hot loop allocates each
  time, which is the existing quoted-pair behavior and not a regression. Note it in
  `docs/PERFORMANCE.md` rather than fixing it here.
- **The loose renderer could drift from the strict one** → they share one worker precisely so that a
  new datum type gains an arm in both at once. A test that renders the same datum through both and
  compares (outside the deliberately-divergent char case) keeps them honest.

## Open Questions

- Should `bad const` become a *parse*-time or *expand*-time diagnostic with source position rather
  than an `emit`-stage error? #64 notes the message has "no location and no value"; this change fixes
  the value half. Position is a larger seam (the emitter has no source positions) and is deferred.
- Does any currently committed export table in `bootstrap/` or `lib/` contain a `?` from this defect?
  Worth grepping during implementation — if so, this change fixes a corrupt committed artifact, which
  should be called out in the commit rather than buried in a regen diff.
