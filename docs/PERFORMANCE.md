# Performance & Size Backlog

Known performance, memory, and binary-size debt — each item **deferred by design**, not
overlooked. This file is a *design* backlog: each entry is an essay with measurements and
cross-item sequencing rationale, which is why it is a document rather than a ticket queue. Discrete
correctness defects go to GitHub Issues instead. This is the working list the OpenSpec process chips away at: every entry names
its symptom, its cause (with file references), a possible fix, its OpenSpec change (once one
exists), and a check-off when remediation lands.

Binary size/cleanliness is a first-class design concern here (see `CLAUDE.md` — "small,
clean, self-contained native executables" is a defining niche), so size items sit alongside
speed items in this list.

## Status at a glance

| ID | Item | Kind | Value | Cost | OpenSpec change | Done |
|----|------|------|-------|------|-----------------|------|
| [P1](#p1-dead-code-elimination-for-library-units) | Dead-code elimination for library units | size | high | med | `aot-release-profile` | ☑ |
| [P2](#p2-immediate-non-heap-characters) | Immediate (non-heap) characters | speed + cleanup | med | med | `immediate-characters` | ☑ |
| [P3](#p3-precompiled-prelude--library-objects) | Precompiled prelude / library objects | build speed | low | low | — | ☐ |
| [P4](#p4-on-codepoint-string-indexing) | O(n) codepoint string indexing | speed | low–med | med–high | `codepoint-string-indexing` | ☑ |
| [P5](#p5-arithmetic-and-call-overhead-ackermann-benchmark) | Arithmetic & call overhead (Ackermann benchmark) | speed | high | med–high | `inline-fixnum-arith-and-self-calls` (A + B-self) | ☑ |
| [P6](#p6-no-optimizer-pass-known-call-inlining-and-constant-folding) | No optimizer pass: known-call inlining & constant folding | speed + size | med–high | med | `simplify-known-calls` (A) | ☑ |
| [P7](#p7-boxing-driven-by-desugaring-rather-than-by-mutation) | Boxing driven by desugaring rather than by mutation | speed + size | med | low–med | — | ☑ |
| [P8](#p8-the-emit-build-door-does-not-tree-shake) | The `emit build` door does not tree-shake | size | med–high | med | — | ☐ |

Legend — **Value**: benefit if fixed. **Cost**: rough implementation effort/risk. These are
estimates to aid sequencing, not commitments.

**Suggested sequencing:** P2 first (self-contained; deletes code as well as speeding things
up), then P1 (serves the flagship size goal, but carries a design decision — see its note),
with P3 folding into P1's link rework. P4 waits for a workload that actually random-indexes
strings; it is the highest cost and lowest present value. P5 stands alone and has the broadest
speed value (it touches every numeric-heavy and call-heavy program); its two halves — inline
fixnum arithmetic and direct known-calls — are independent and can land separately. P6 follows
P5 and overlaps it: P6-A is the first *optimizing* pass in the Scheme core (it removes work
rather than translating it), while P6-B unblocks LLVM's own inliner and so partly subsumes
P5's deferred B-general. P7 is P6's natural successor and should follow it: P6 taught the
compiler to inline and fold, and P7 removes the boxes that hide bindings from it.

---

## P1 — Dead-code elimination for library units

**Status:** ☑ done (change: `aot-release-profile`)

**Outcome.** The AOT ship path (the "release profile") now tree-shakes unreachable library
bindings under the closed-world assumption, and compiles the linked module at `-O2` instead of
`-O0`. A `car`-only program dropped from **125 KB → 40 KB (−68%)** (0 `(scheme base)` exports
reached); a `map`-using program is similarly small and grows with the reachable set. Two findings
shaped the fix: (1) the shipped binary was linked at clang's default `-O0`, so it was *slower and
larger than the JIT* — turning on `-O2` alone is ~14% smaller and faster; (2) plain
`internalize + globaldce` removes **0 of 249** functions, because the prelude `__init` eagerly
`make-closure`s every binding and `rt_root`s it (so nothing looks dead). The resolution: a
Scheme-level, root-set-driven reachability pass recompiles each prunable unit emitting only the
reachable bindings + a pruned `__init` (`compile-library*` in `src/core.ss`), which the AOT driver
(`build-modular-artifacts*` in `src/compile.ss`) links — keeping the AOT path clang-only. The
dev/REPL/JIT door keeps the full cached units (open world). See `aot-release-profile` and the
original analysis below.

**Symptom (original).** Every AOT binary links the *entire* `(scheme base)` unit — all 196 defined
functions (`bootstrap/scheme.base.ll`) — even a program that calls only `car`. The same is
true for any user library: the whole unit ships whether or not the program references it.
This works directly against the "small, clean, self-contained executables" design goal.

**Cause.**
- The emitter gives every `scheme.base:*` (and every user-library) function **external
  linkage** (`src/emit.ss` — contrast `__apply0` at `src/emit.ss:324`, which the emitter
  *does* mark `internal`). External symbols are globally visible, so the linker must assume
  something outside the module might reference them and cannot drop them.
- The AOT link (`link-modular-aot`, `src/compile.ss:468`) passes no
  `-flto` / `-dead_strip` / `--gc-sections` / `opt -internalize -globaldce`. Nothing prunes
  the graph even if linkage allowed it.

Result: DCE is not merely absent — the linkage choice actively **blocks** the linker from
doing it.

**Possible fix.** LLVM-native and already half-scaffolded:
1. Mark library functions `internal` (the emitter already knows how — see `__apply0`), or
   emit them `external` and internalize at link with a keep-list = program entry + `rt_*`.
2. Run `opt -internalize -globaldce` on the already-merged module. The JIT and bitcode
   backends *already* `llvm-link` the unit set into one module (`src/compile.ss` JIT/bitcode
   paths), so the merge point where globaldce is cheap already exists; AOT would need the
   same merge (or `-flto`).

**Design decision to settle first — DCE vs. dev→ship fidelity.** In the REPL you cannot
strip "unused" prelude functions, because you do not know what the user will type next. So
DCE must be an **AOT ship-time-only transform**, not part of the shared compiler core. That
is consistent with the size-is-a-shipping-concern framing, but it means the "one compiler
core" rule (`CLAUDE.md`) needs an explicit, documented carve-out: identical IR on every
door, plus a link-time pruning pass only on the `--backend aot` path. Decide and record this
in the change's design before implementing.

**OpenSpec change:** `aot-release-profile` (implemented). Chose Scheme-level tree-shaking
(recompile each prunable unit to a reachability keep-set) over LLVM `internalize`/`globaldce`
— the latter removes nothing here because eager `__init` + `rt_root` keep every binding live —
plus `-O2` at the AOT link. AOT stays clang-only; the dev/REPL/JIT door keeps full units.

---

## P2 — Immediate (non-heap) characters

**Status:** ☑ done (change: `immediate-characters`)

**Symptom.** Every character is a heap allocation. `string-ref`, the reader, and
`integer->char` all call `rt_make_char`, which allocates a 2-word object (or interns) per
character. Two permanent, `GC_MALLOC_UNCOLLECTABLE` intern tables sit resident for the whole
process just to make `eq?`/`eqv?` hold on characters.

**Cause.** All 8 primary tags are spent (`src/runtime/runtime.c:37-50`), so characters were
placed under the extended-heap tag (`TAG_EXT`, tag 7) as `{ HDR_CHAR, codepoint }`
(`src/runtime/runtime.c:230`). To preserve `eq?`/`eqv?` by identity, chars are interned via a
Latin-1 array (`char_latin1[256]`) plus a growable linear-scan astral table
(`src/runtime/runtime.c:240-278`) — ~40 lines of machinery whose only job is to fake the
identity that an immediate representation would give for free.

**Possible fix.** Encode the codepoint directly in the tagged word (no heap, no intern
tables). Since the primary tags are full, this needs a **secondary immediate encoding**
carved from the boolean/nil tag space (tag `001`/`010` use only a handful of their 2^61
payload values). One shape:

```
  [ payload : 56 | subtype : 5 | 001 ]
    subtype 0 → boolean (#f / #t)
    subtype 1 → char    (payload = Unicode codepoint)
    subtype 2 → unspecified      ┐ room to grow — future
    subtype 3 → eof-object       ┘ immediates cost nothing
```

Done this way it also future-proofs the immediate space for the unspecified value,
`eof-object`, and similar singletons.

**Follow-through.** Subtype 2 was subsequently spent on the unspecified value (change:
`unspecified-value`; see [`return-values.md`](return-values.md)) — the sketch above is updated to
match what shipped, which swapped the two speculative slots. `eof-object` still has subtype 3.

**Cost / risk.** The tag scheme is "shared verbatim with the LLVM IR emitter", so three
places must agree: `src/runtime/runtime.c` (tag/predicate/`make_char`/`eq` logic),
`src/emit.ss` (inline tag checks + char-literal emission), and the value printer. Bounded and
highly testable; deletes the intern machinery on the way through (cleanup + speed together).

**OpenSpec change:** `immediate-characters` (implemented). The boolean tag `001` became a
misc-immediate family with a 5-bit subtype: subtype 0 = boolean (`#f`=1, `#t`=257), subtype 1
= character (codepoint in bits 8+), subtypes 2/3 reserved for `eof-object`/unspecified. The
Latin-1 + astral intern tables and the `HDR_CHAR` heap layout were removed; character
literals now emit an inline immediate constant instead of an `rt_make_char` call.

---

## P3 — Precompiled prelude / library objects

**Status:** ☐ not started (mostly done — remaining scope is narrow)

**Note — the README's "separate/precompiled prelude" bullet is partly stale.** `(scheme
base)` (and every user library) **already** compiles to a *separate, cached* `.ll` unit with
freshness-based reuse: `build-modular-artifacts` builds each unit once and
`artifacts-fresh?` reuses it when the source has not changed
(`src/compile.ss:391-461`). So "separate prelude" is done.

Freshness now also keys on **compiler identity** (change: `artifact-compiler-stamp`): each unit
carries a `.stamp` sidecar (version + content hash of the compiler sources + host target
header), and a stamp mismatch forces recompilation. Any future precompiled `.bc`/`.o` prelude
units must key on the same stamp so a compiler change never links a stale precompiled unit.

**Symptom (remaining).** Each build still re-assembles the unit `.ll` (text LLVM IR) to
bitcode/object at link time; there is no committed precompiled `.bc`/`.o` for the stable
`(scheme base)`. Minor build-time cost, repeated on every link.

**Possible fix.** Precompile stable library units to `.bc`/`.o` and link the object rather
than re-assembling the `.ll`.

**Interaction with P1 (`aot-release-profile`).** P1 landed via Scheme-level tree-shaking, which
recompiles a *program-specific pruned* unit on the AOT ship path (it does **not** reuse the cached
full `.ll` there). So a precompiled/cached `.bc` for the full `(scheme base)` still helps the
**dev/REPL/JIT** door (which links the full unit), but the AOT door emits a per-program pruned
unit. If AOT build time ever matters, cache the pruned unit keyed by its (root-set → keep-set)
mapping rather than precompiling the full unit for AOT.

**OpenSpec change:** _none yet._

---

## P4 — O(n) codepoint string indexing

**Status:** ☑ done (change: `codepoint-string-indexing`)

**Symptom.** `string-ref` at index _i_ costs O(_i_): a loop nested over `string-ref` is
O(n²). This is inherent to the current storage decision (design D1: UTF-8 bytes,
codepoint-indexed API).

**Cause.** `utf8_offset` walks from byte 0 counting codepoints to reach the requested index
(`src/runtime/runtime.c:321`), used by `rt_string_ref` (`:338`) and `substring` (`:344`).

**Mitigating context.** Sequential iteration (a cursor advancing one codepoint at a time) is
already O(1) per step — only *random* indexing in a loop is pathological, which is rare in
practice. The compiler's own reader/parser iterate sequentially. So the present value of
fixing this is low until a workload appears that random-indexes large strings.

**Possible fixes** (a representation/design decision — revisits D1):
- Leave storage as-is; document and prefer the O(1) forward-iteration idiom.
- Add a codepoint→byte breadcrumb/index cache on large strings (amortize repeated indexing).
- Switch to a fixed-width representation (e.g. Latin-1/UTF-32 hybrid à la CPython/Racket) —
  O(1) index at a memory cost; touches `string-set!`, `substring`, `equal?`, and storage.

**OpenSpec change:** `codepoint-string-indexing` (implemented). Chose the middle path — kept
UTF-8 storage and added, to the string header, a stored codepoint length plus a lazily-built
fixed-stride (32) codepoint→byte breadcrumb index. `string-length` is now O(1); an all-ASCII
string (byte length == codepoint length) indexes in O(1) since codepoint index == byte offset;
a multi-byte string builds the breadcrumb on first random access, turning an indexed traversal
from O(n²) into O(n). `string-set!` drops the stale index. The change is confined to
`src/runtime/runtime.c` — the emitter still lowers a literal to one `rt_make_string(ptr, i64)`
call, so no IR or committed bootstrap regeneration was needed (self-hosting fixed point holds).
The fixed-width rewrite was rejected as too heavy for a rare-in-practice case, against the
small-clean-binary goal.

---

## P5 — Arithmetic and call overhead (Ackermann benchmark)

**Status:** ☑ done — A + B-self (change: `inline-fixnum-arith-and-self-calls`), then B-general,
then the cross-unit half (change: `cross-unit-direct-calls`).

**Result (A + B-self).** Inline fixnum arithmetic + direct self-calls cut Ackermann wall time
under `emit run` by ~35–40%:

| call | before | after |
|------|--------|-------|
| `(ack 3 10)` | 0.74 s | 0.70 s |
| `(ack 3 11)` | 1.51 s | 0.96 s |
| `(ack 3 12)` | 5.15 s | 3.20 s |

Cost: the committed binaries grew ~4% (the runner 772 KB → 805 KB) from the per-op fixnum
guard/diamond; B-self's removal of closure-load chains offsets part of it. The regen fixed point
still converges (iter 2) and all backends stay byte-identical.

**Workload.** Ackermann is a near-pure probe of two costs — non-tail recursion and small-
integer arithmetic — with almost no allocation, so it isolates codegen quality for calls and
fixnum ops:

```scheme
(define (ack m n)
  (cond
   ((= m 0) (+ n 1))
   ((= n 0) (ack (- m 1) 1))
   (else (ack (- m 1) (ack m (- n 1))))))
(ack 3 12)   ; => 32765
```

**Symptom.** Measured under `emit run` (in-process JIT — the shipped runner):

| call | result | wall time |
|------|--------|-----------|
| `(ack 3 10)` | 8189 | ~0.5 s |
| `(ack 3 11)` | 16381 | ~1.5 s |
| `(ack 3 12)` | 32765 | ~5.8 s |

Clean ~4× per increment of `n`, i.e. time is linear in the (very large) call count with no
super-linear cliff. Tail calls are **already** optimized — the two tail self-calls emit
`musttail` and the stack stays bounded — so the entire cost is *per-activation*: the body is
nothing but `= + -` and self-calls, and every one of those is an opaque runtime call. ~5.8 s
for a function this small is far off a native or mature-Scheme baseline; the gap is codegen
quality, not algorithm.

**Cause** (read from the emitted IR of `ack`, `code_11`, via `emit run --emit`):

1. **Integer arithmetic and comparison compile to out-of-line runtime calls.** `+ - * = <`
   … map through `prim-table` (`src/emit.ss:142`) and `emit-primcall` (`src/emit.ss:313`) to a
   `call @rt_add` / `@rt_sub` / `@rt_num_eq`. In `ack`'s body that is **six** runtime calls
   per activation (2× `rt_num_eq`, 3× `rt_sub`, 1× `rt_add`), each performing tag/overflow
   dispatch internally and each **opaque to LLVM** — it cannot fold, hoist, or CSE across
   them. Fixnums are tagged `value << 3` immediates (the literal `1` appears in the IR as the
   operand `8`, `0` as `0`), so the overwhelmingly-common both-operands-fixnum case is really
   just one native `add`/`sub`/`icmp` plus an overflow check — but that fast path is never
   emitted inline.

2. **Self-calls go indirect through the closure.** Each recursive call reloads the code
   pointer from the closure environment — `and self, -8; getelementptr; load; load; inttoptr`
   — and issues an indirect `call fastcc %reg` (`finish-call`, `src/emit.ss:393-402`;
   code-pointer load, `src/emit.ss:384`). The self-reference is a stable captured value (it is
   loaded from `%self`, not a mutable global lookup), so for a self-recursive function a direct
   `call fastcc @code_11` would be semantically identical, cheaper, and — most importantly —
   would let LLVM inline and optimize across activations. The indirect call blocks all
   interprocedural optimization.

3. **Per-call arity guard.** Every entry runs `icmp eq argc, 2` → `rt_arity_error` branch
   before the body. For calls whose arity is statically known (all self-calls here), this guard
   is dead work on the hot path.

**Possible fix** (two independent halves, ordered by value):

- **A — inline fixnum fast-paths for the hot numeric primitives** (`+ - * = < > <= >=`). Emit
  an inline "both operands fixnum?" tag test → native `add`/`sub`/`icmp` (with an overflow
  guard for `+ - *`), falling back to the existing `rt_*` call only on the slow
  (non-fixnum / overflow / bignum) path. `rt_*` stays the slow path, so numeric semantics are
  unchanged; the win is that the common case becomes a handful of native instructions the
  optimizer can see through. Broadest value — every numeric-heavy program benefits.

- **B — direct-call statically-known functions and drop the redundant arity check.** Recognize
  a self / known-top-level callee at a call site and emit `call fastcc @code_N` in place of the
  closure-load + indirect call, skipping the `argc` guard when the arity is statically known.
  The clearly-safe subset is the **self-call** (the captured self-reference cannot change under
  a running activation); general top-level direct-calls must respect REPL redefinition (see the
  dev→ship caveat below). Unlocks LLVM inlining of small self-recursive leaves.

- **C — (follow-on)** once calls are direct, the fixed-arity zero-padding of unused register
  args (`i64 0` for `a2..a7` on every 2-arg call) becomes visible to LLVM and largely
  optimizable; revisit only if it still shows up in profiles.

**Cost / risk.** A and B both live in the **shared emitter** (`src/emit.ss`), so the REPL and
the AOT path get them identically — this is codegen *quality*, not a second compilation path,
so the one-compiler-core / dev→ship-fidelity rule (`CLAUDE.md`) is preserved. Both are
well-contained and highly testable: every existing demo must produce identical values, only
faster, and Ackermann timings give a direct before/after metric. Two correctness hazards to
respect: (A) the inline fixnum path must match `rt_*` exactly; (B) direct-call must fall back to
the indirect path for anything not provably a fixed procedure — in particular a REPL
redefinition of a top-level name must still be observed by *future* calls, so general (non-self)
direct-calls need the same dev→ship carve-out reasoning as P1.

**Decisions taken (in exploration).** Part A uses the **tag-checked seam (A2)**, not
unconditional inline: the inline fast path is guarded by a fixnum-tag test and delegates to
`rt_*` for non-fixnum operands, keeping numeric semantics single-sourced in the runtime so a
future flonum/bignum change (deferred, `core-language` spec line 236) lands only in `rt_*`. The
first change is scoped to **A + B-self** (self-calls only — no dev→ship tension, since the
self-reference is already captured/stable). **B-general** (direct calls to *other* known
top-levels) is **deferred**: it breaks REPL redefinition and needs the P1-style AOT-ship-time
carve-out, so it may ride with P1's link rework.

**OpenSpec change:** `inline-fixnum-arith-and-self-calls` (A + B-self; implemented). B-general
remains unscheduled, and it may compose with `aot-release-profile`'s closed-world AOT door
(direct calls to immutable known top-levels are safe under the same closed-world assumption).

**B-general re-measured after P6-B.** P6-B was expected to have absorbed much of this item. It has
not, and the reason is structural: P6-B lets LLVM devirtualize a call only when the closure was
allocated in the *same function*, because it works by forwarding the code-pointer store to the
load. A call to a captured sibling loads its callee from `%self`'s environment, where there is no
such store, and comes out of `-O2` with the whole chain intact:

```llvm
%t23 = and i64 %self, -8          ; still there after -O2
%t25 = getelementptr i64, ptr %t24, i64 2
%t26 = load i64, ptr %t25         ; the sibling's closure
%t29 = load i64, ptr %t28         ; its code pointer
%t31 = musttail call fastcc i64 %t30(...)
```

Scale, in the compiler's own module (the largest real program here) after `-O2`: **2786 indirect
call sites versus 79 direct**. Classified by how the callee is obtained — 415 from a closure
environment (captured siblings, which B-general can take with no closed-world assumption), 808
from a module-level global (cross-unit, which need the AOT carve-out), 1563 unclassified or
genuinely higher-order.

Value, measured directly rather than inferred: hand-patching one call site from the indirect
sequence to `call fastcc @code_N` — exactly what B-general would emit — on a 60-million-call probe
took it from **0.06s to 0.02s** (best-of-5, identical results). The direct call is what lets LLVM
inline the callee, so most of that is the inlining it unlocks. This is a call-dominated
microbenchmark and an upper bound; code doing real work per call will see less.

The **dev door gets nothing from P6-B** — it runs no IR passes at all — so B-general's value there
is undiminished, and unlike P6-B it would help both doors.

Verdict: still worth scheduling.

**Result (B-general).** Implemented. A call whose operator is a closure-block binding now goes
straight to its code label, passing the callee's own closure as `self` instead of loading a code
pointer out of it — the `and`/`inttoptr`/`load`/`inttoptr` chain disappears, and the constant
argc lets LLVM fold the callee's arity check and inline it.

It needs **no closed-world carve-out**, which is what made it landable at last. The rule keys on a
closure-block binding, and the REPL never produces one: there a top-level name lowers to
`(global-ref …)`, so redefinition keeps working untouched. The dev→ship tension that deferred this
item for so long simply does not arise for this subset.

The one structural cost is in `lower`: a group's code labels must be allocated *before* any body
is lowered, so mutually recursive siblings can see each other's labels. That renumbers labels
globally, so emitted IR changes broadly even where call shapes do not.

Measured against the prediction above, which called for 0.06s → 0.02s on the 60-million-call
probe: **exactly that, 0.06s → 0.02s**, matching the hand-patched bound. Ackermann is unchanged,
as expected — it is self-recursive and already had B-self.

| | before | after |
|---|---|---|
| compiler module, emitted | ~all indirect | 1020 direct / 710 indirect |
| compiler module, after `-O2` | 79 direct / 2786 indirect | **755 direct / 2073 indirect** |
| committed IR | — | `schemec.ll` −3.3%, `embed-repl.ll` −3.5% |

24 of 77 demos' IR changed and **none grew** (`records` −7.4%, `fold-boundary` −4.7%, `toplevel`
−3.3%, `case-cxr` −2.4%); all 77 values identical. `build/emit` is flat (+0.04%).

**The cross-unit half, investigated.** 808 of the surviving sites call a `(scheme base)` global.
Making those direct turns out to be a different and larger problem than the intra-unit half, and
the measurements invert the obvious expectation. On a 30-million-call probe against
`scheme.base:zero?`, hand-patching the call site to `call fastcc @"scheme.base:code_N"`:

| | no LTO | with `-flto` |
|---|--------|--------------|
| indirect (today) | 0.06s | 0.06s |
| direct call | 0.06s | **0.01s** |

**Neither piece is worth anything on its own.** The direct call alone saves only the
code-pointer load, which is L1-resident behind a perfectly-predicted branch — no measurable win.
LTO alone does nothing either, because the callee is a *runtime heap closure*: LLVM cannot
devirtualize a value that `__init` allocated, no matter how much of the program it can see. Only
together — a direct call LLVM can then inline across units — do they pay, and then by 6×.

So this is a three-part change, not one:

1. **Stable code-label naming for library exports.** The blocker. AOT tree-shaking recompiles
   each unit per program, and labels come from the shared gensym counter, so they *renumber*:
   `zero?` is `scheme.base:code_168` in the committed unit and `scheme.base:code_216` in a pruned
   one. A program cannot name a callee whose label depends on a pruning decision driven by that
   same program. Labels for lambda-valued exports would have to be derived from the binding name
   instead of the counter — which renames every emitted label in every unit.
2. **Export interface.** The `.exports` table carries only `(external . mangled-symbol)`; it
   would need the code label and arity. No linkage change is needed — library code labels are
   already external, which is why the hand-patched probe linked; an earlier draft of this note
   claimed otherwise and was wrong.
3. **`-flto` on the AOT link**, without which parts 1 and 2 buy nothing.

Plus the closed-world reasoning this item was always going to need. Worth doing for a 6× on
library-call-heavy code, but it is an artifact-format and link-strategy change, not an emitter
tweak — it wants its own OpenSpec change.

**Result (cross-unit half).** Implemented, as the three parts above, and the probe landed on its
prediction: **0.07s → 0.01s**, a 7× on the 30-million-call probe (the proposal said 6×). The 2×2
was re-measured end to end on the real tree-shaken artifact set rather than a hand-patch, and it
reproduces exactly — neither piece is worth anything alone:

| | `-O2` | `-O2 -flto` |
|---|---|---|
| indirect (before) | 0.07s | 0.07s |
| direct call (after) | 0.07s | **0.01s** |

Delivered through the AOT door — pre-change (indirect, `-O2`) versus post-change (direct,
`-O2 -flto`), both tree-shaken, values byte-identical:

| | before | after |
|---|---|---|
| compiler module, emitted | 1020 direct / 1975 indirect | **1455 direct / 1713 indirect** |
| compiler module, after `-O2` | 755 / 2073 | **1275 / 1723** |
| cross-unit sites converted | — | **401 of 872** |
| delivered binary, 6 demos | 375,632 B | **234,416 B (−37.6%)** |

**What did not convert, and why.** All 471 remaining cross-unit indirect sites call one of eight
**variadic** exports — `map` (193), `list` (84), `append` (78), `error` (68), `for-each` (41),
`string`, `char=?`, `vector`. A variadic export records no label, by design in this increment: the
callee builds a rest list from `argc`, so a direct call would have to reproduce that protocol at
the call site. 104 of `(scheme base)`'s 120 exports are fixed-arity and do carry one. Extending
this to variadic callees is the obvious next increment and is where the other half of the 872
sites is.

**LTO is a large size win and an occasional speed loss.** Enabling `-flto` on the AOT link cuts
the delivered binary by **−38%** across a spread of demos (57,984 → 34,768 on `ackermann`;
−30.8% on the largest, `read-all`) and by −5.0% on the biggest program in the tree, the compiler
itself. Link wall time is flat-to-faster on small programs (0.20s → 0.13s on `ackermann`) and
+15% on the compiler (1.19s → 1.37s). But it is **not** universally a speed win: on a loop
dominated by `assq` over a 200-element list, LTO costs **~9%** (1.96s → 2.13s), and the 2×2
attributes that entirely to LTO — the pre-change and post-change IR regress identically, and it
persists when `runtime.c` is kept out of the LTO set, so it is cross-unit inlining of a large
library procedure into a hot loop, not `rt_*` inlining. Ackermann and a string/number-heavy loop
are flat. The setting is kept: the target workload gains 7×, size (a first-class concern here)
improves by a third, and the one regression is a single-digit percentage on a shape where the
callee body, not the call, is the cost.

**Does LTO pay for itself independently?** (Design open question.) No, on speed: LTO alone leaves
the probe at 0.07s and costs the `assq` loop 9%. It pays independently on **size**, which is why
it is not being split out into its own backlog item — the size win arrives with this change and
would be double-counted.

**The immutability argument, settled.** The lowering assumes a library global is assigned once by
its unit's `__init` and never reassigned, and that turned out to hold on **both** doors, so there
is no AOT-only carve-out and the program module stays byte-identical across doors. Three
independent reasons, all checked: a unit's globals are stored only by its own per-define
`__init_N` thunks; `set!` on a unit's own top-level binding, or on an imported one, is a
*compile error* on every path that produces a `global-set!` into a unit's slot (issue #5 made a
REPL **session** global assignable and deliberately stopped there); and a REPL redefinition
allocates a fresh **program** global `x.gN` rather than touching the library's slot, so
previously-compiled code keeps the binding it captured. A future library-*reload* feature would
invalidate the third reason and must revisit this.

**OpenSpec change:** `cross-unit-direct-calls` (implemented).

---

## P6 — No optimizer pass: known-call inlining and constant folding

**Status:** ☑ done — A (change: `simplify-known-calls`) and B, below

**Result (A).** The `simplify` pass (`src/passes/simplify.ss`, between `convert-assignments` and
`convert-closures`) inlines a singly-referenced lambda binding into its one call site, propagates
immediate constants, folds `%+ %- %* %= %<` over them, and drops the bindings left unreferenced.
`demos/square.scm` now reaches `convert-closures` as `(const 1156)` — the closure record, the
indirect call and the multiply are all gone before the emitter runs, on **every** door rather than
only under the ship path's `-O2`.

Measured over the 72-demo suite (before = `build/emit` relinked from the previous committed IR):
62 demos byte-identical, 10 changed, **every one smaller**, none larger. Program-module IR:

| demo | before | after | |
|------|--------|-------|---|
| `nary-arith` | 15542 | 10007 | −35.6% |
| `nary-compare` | 23876 | 17441 | −27.0% |
| `internal-define` | 18656 | 14648 | −21.5% |
| `derived` | 20950 | 17432 | −16.8% |
| `square` | 10558 | 9517 | −9.9% |
| `counter` | 12430 | 11725 | −5.7% |
| `fact`, `mandelbrot`, … | — | — | 0% (recursive / multi-use; nothing to inline) |

All 72 demos' stdout is byte-identical, the regen fixed point converges (iter 1), and all three
backends stay byte-identical to each other.

**Cost.** The committed compiler IR grew 2451232 → 2690633 bytes and `build/emit` 1112 KB →
1164 KB (+4.7%). That is **the pass's own code**, not a regression: compiling the *same* source
with the new compiler gives 2451232 → 2424494 (−1.1%, 650 → 635 functions). The compiler contains
the pass; user binaries do not, so user programs pay nothing for it and collect the shrink.

**Reach, and the follow-up that widened it.** The inlining rule needs a binding group, and
`build-program` (`src/parse.ss`) originally emitted a `letrec` only when *every* top-level define
had a lambda initializer; one non-lambda define sent the whole program down the `let` + `set!`
path, where the names are boxed and nothing is inlinable. The compiler's own source was in exactly
that shape, so it got no top-level inlining from its own pass.

That was subsequently fixed: `build-program` now boxes only the defines that need a mutable
location and letrec-binds the lambda-initialized rest, nested so that the functions' bodies still
see the boxed names and the boxed initializers still see the functions. Its prerequisite was a
crash — `set!` on a `letrec`-bound name compiled to `unbox`/`set-box!` against a binder that was
never boxed (issue #8) — since the widening moves more names onto that path.

**Result of the widening.** 9 of 75 demos' IR changed, every one smaller (program module: `records`
21333 → 16548, −22.4%; `mandelbrot` 34896 → 29871, −14.4%), none larger, all 75 stdout-identical.
The compiler's own IR shrank 10.3% and `build/emit` 4.7%, which more than repays the 4.7% the pass
itself cost: `build/emit` is now marginally **smaller than before this whole item began**, while
every compiled program gets the optimization.

Still out of reach: library units and the REPL, whose top-level defines are persistent globals
rather than a binding group — `simplify` runs over all 120 of `(scheme base)`'s defines and
rewrites none. Folding and dead-binding removal still apply to local `let`s everywhere.

**Workload.** `demos/square.scm` — the smallest program in which the gap is visible end to end:

```scheme
(define (square n)
  (* n n))
(square 34)
```

**Symptom.** Nothing about this program is computed at compile time. `emit run --dump` shows the
final IL still carrying the whole apparatus:

```
;; ==== after lower ====
(program ((code "code_2" cp.3 (n.1) #f (primcall %* (local n.1) (local n.1))))
  (closure-block ((square.0 "code_2" ())) (app (local square.0) ((const 34)))))
```

and the emitted `scheme_entry` allocates a one-word closure on the heap, stores the code pointer,
tags it, masks it back off, reloads the code pointer, and issues an **indirect** call — to compute
`34 × 34`. The multiply itself then runs the full inline-fixnum guard diamond from P5 at runtime.
A whole-program constant is being recomputed on every execution, through a heap allocation and an
opaque indirect call.

This generalizes well past constant folding: *any* call to a lambda that is bound once, never
assigned, and referenced only in operator position pays for a closure record and an indirect call
that the compiler has enough information to remove.

**Cause — two independent ones, one per door.**

1. **There is no optimizing pass in the Scheme core.** The ladder is `expand` →
   `recognize-let` → `convert-assignments` → `convert-closures` → `lower-program`
   (`src/core.ss:62-67`, and again at `:286-289` / `:441-444`). Every one of those is a
   *translation*: they change representation and none removes work. So no pass is in a position
   to notice that `square.0` has exactly one reference, that the reference is an operator, or
   that its argument is a constant.

   The machinery is half-present. `recognize-let` (`src/passes/recognize-let.ss:23`) already
   performs precisely this beta-reduction —

   ```scheme
   [(call (lambda ,params ,body) . ,args)  =>  (let ([p a] ...) body)]
   ```

   — but only when the lambda is *syntactically* in operator position. The `square` case is one
   hop removed: `collect-toplevel` wraps the file in a `letrec`, so the operator is a name bound
   to a lambda rather than the lambda itself.

2. **LLVM cannot recover it on either door.**
   - The **dev door** (`emit run`, REPL) builds a plain `LLJITBuilder()` with no IR transform
     layer (`src/emit.cpp:404`, `:608`). There are no IR passes at all — no inlining, no
     constant folding, nothing. Whatever the Scheme core emits is what runs.
   - The **ship door** links at `-O2` (`src/compile.ss:232`, `src/emit.cpp:747`), and `-O2`
     still does not fold this. Measured by extracting the program unit from `emit run --emit`
     and running `opt -O2`: the allocation, the store, the masked reload and the indirect call
     all survive verbatim.

     The blocker is a *single instruction*. A closure is allocated by `emit-alloc-closure`
     (`src/emit.ss:669`) via `rt_alloc_words`, which is an opaque external returning `i64`; the
     call path then re-derives the base by masking the tagged word (`emit-load-code`,
     `src/emit.ss:707-714` — `and i64 %fop, -8`). LLVM cannot prove the allocator's result is
     8-aligned, hence cannot prove the masked pointer is the one it just stored through, hence
     cannot forward the store to the load, hence cannot devirtualize, hence cannot inline. One
     unprovable alignment fact blocks the entire chain.

**Possible fix** (two independent halves; A is the one that serves the design goals, B is the
cheap one):

- **A — a `simplify` pass in the shared core.** Three rules, all standard:
  1. *Inline a known, singly-referenced lambda binding.* If a `letrec`/`let` binder's RHS is a
     `lambda`, the bound name occurs exactly once, that occurrence is the operator of a `call`,
     and the arity matches, substitute the lambda in and drop the binding. Self-recursive
     functions exclude themselves automatically — their own body pushes the occurrence count
     above one. The single-use restriction means no code duplication, so this cannot grow the
     binary.
  2. *Constant-propagate and fold.* `(let ((n (const 34))) (primcall %* n n))` →
     `(primcall %* (const 34) (const 34))` → `(const 1156)`. Substituting a `const` is
     unconditionally safe: no duplicated work, no effects, no size growth.
  3. *Drop dead bindings.* Without this the arithmetic folds but the closure is still allocated
     and rooted — worth nothing on the size axis.

  **Placement: after `convert-assignments`, before `convert-closures`.** At that point `set!`
  is gone (assigned variables are already boxed into `primcall box`/`unbox`), so every remaining
  variable is immutable and *both* substitution rules are valid with no assignment analysis at
  all. Earlier in the ladder each rule would have to consult `find-assigned` for itself. The
  pass forms the `let` itself rather than depending on a second `recognize-let` run.

- **B — make the closure representation legible to LLVM.** Emit an alignment fact for the
  allocator's result so the untag mask folds away. An `llvm.assume` on the *integer* (not on the
  `inttoptr` result — an `align` operand bundle on the pointer does **not** propagate to the
  integer's known-bits; measured) is enough:

  ```llvm
  %al1 = and i64 %raw, 7
  %al2 = icmp eq i64 %al1, 0
  call void @llvm.assume(i1 %al2)
  ```

  With that one addition, `opt -O2` on the unmodified `square` unit collapses `scheme_entry` to
  `ret i64 9248` (= `1156 << 3`) — it forwards the store, devirtualizes, inlines `code_2`, folds
  the fixnum tag check, and folds the multiply. Because it is stated at the allocation site it
  applies to every masked untag, not just this call site: `emit-load-code` (`:710`), `load-free`
  (`:353`), `unbox-flonum` (`:499`).

- **B2 — (follow-on, unmeasured)** even after B, the now-dead allocation survives: LLVM will not
  delete `rt_alloc_words` + its store without `noalias`/allocator attributes, and `noalias`
  cannot be applied to an `i64` return (`opt` rejects it outright — verified). Deleting dead
  allocations would mean changing `rt_alloc_words` to return `ptr`, which touches every emitted
  allocation site. Only worth it if allocation removal shows up as a real win.

**Why A is not redundant with B.** B helps only the **ship** door, because the dev door runs no
IR passes at all — so B alone would mean a constant folded in the shipped binary and recomputed
in the REPL, which is exactly the kind of dev→ship divergence `CLAUDE.md` rules out (values stay
identical, but the performance characteristics diverge, and `--dump` stops describing what
actually runs). A lands in the shared core, so both doors get it, and A additionally removes the
allocation that B leaves behind. B remains worth doing on its own merits: it unblocks LLVM's
inliner for *every* known-callee call site on the ship path, which is a large part of what P5's
deferred B-general was after — reached through LLVM instead of through the emitter.

**Cost / risk.** A is a new pass file plus one line in each of the three compile ladders in
`src/core.ss`; it is pure IL→IL and directly unit-testable against dumped IL, and the whole demo
suite must produce identical values. Two hazards to respect:

- **Fold only within the target's fixnum range.** `rt_mul` is `FIX(UNFIX(a) * UNFIX(b))`
  (`src/runtime/runtime.c:190-194`) — silent wraparound, no overflow check and no bignum. The
  compiler is self-hosting, so a compile-time fold runs on the *host's* arithmetic, and the host
  (Chez when bootstrapping, emit itself thereafter) has different overflow behavior. Folding
  must be refused unless the result is representable as a 61-bit target fixnum, or
  `(* 2000000000 2000000000)` will compile to a different answer than it computes. The same
  restriction applies to any primitive folded.
- **Self-hosting fixed point.** A changes emitted IR for the compiler's own sources, so `make
  regen` must be re-run and reconverge, and the committed `bootstrap/*.ll` will change. Expect
  the compiler's own binaries to *shrink* (dead closures removed), which is the size half of this
  item.

**Result (B).** `rt_alloc_words` now returns a **pointer declared `align 8`** rather than an
`i64`. That single fact is what LLVM was missing: tagging needs the low three bits of a fresh
object to be zero, and without it the optimizer could not prove that masking a tagged closure
recovers the pointer it was built from — so it could not forward the code-pointer store to the
load, could not devirtualize, and could not inline. Every call through a just-allocated closure
stayed indirect at `-O2`.

Indirect calls surviving `-O2` in the program module: `derived` 4 → **0**, `mandelbrot` 3 → 1,
`counter` 2 → 1, `case-cxr` 11 → 10. On a two-call probe, the first call is devirtualized,
inlined, and constant-folded outright — `(sq 3)` becomes the literal `72`.

It also costs nothing: instruction count at a closure allocation is unchanged (a `ptrtoint`
replaces an `inttoptr`), and `emit-spill` drops its conversion entirely, so the committed IR
*shrank* (`embed-repl.ll` −2062, `schemec.ll` −1862, `scheme.base.ll` −524). All 77 demos' IR
changed — the declaration is in every module — and none grew; all 77 values are unchanged.

The `llvm.assume` sketched below was measured to work equally well and was **rejected**: at 847
allocation sites it would have added ~2,500 lines of IR and left the dev door, which runs no IR
passes, carrying dead instructions. Stating the fact in the declaration costs nothing anywhere.
`noalias` was also measured and buys nothing here — it does not let LLVM delete a dead
allocation, which would need allocator attributes and is the unmeasured B2 note below.

**OpenSpec change:** `simplify-known-calls` (A; implemented). Two decisions were forced during
implementation and are recorded in its design: folding is confined to a conservative ±(2^30 − 1)
window rather than an exact fixnum-boundary test (the exact version could not survive self-hosting
— `encode-const` cannot represent the boundary literals, so the guard silently disabled all
folding in the shipped compiler; filed as issue #7), and constant propagation is
restricted to immediates so a string or pair literal is never duplicated into two objects.

The window was briefly clamped to ±(2^28 − 1) and is now back at ±(2^30 − 1). The original value
bounded the *arithmetic* correctly but not the *encoding*: `encode-const` mis-emitted any literal
at or above 2^57, so a folded result in [2^57, 2^60) came out wrong on the self-hosted door
(issue #7). That shipped briefly as a value-changing regression — `(* 1073741823 1073741823)`
printed correctly before the pass and wrongly after. Fixing #7 (encode-const now multiplies in
decimal on the digit string, where nothing can overflow) removed the tighter ceiling and let the
window return to the arithmetic one. `demos/fold-boundary.scm` pins fold-equals-runtime at the
window edge and `demos/fixnum-literals.scm` pins literal round-tripping across the top of the
fixnum range, both on every door.

The lesson generalizes past this pass: *what the arithmetic can compute* and *what the emitter can
write down* are two different ceilings, and anything that manufactures a constant at compile time
is bounded by the lower one.

B landed separately (see **Result (B)** above), as an allocator-declaration change rather than the
per-site `llvm.assume` originally sketched.

**Correction.** This entry first claimed B unblocked LLVM for "many known-closure calls" and so
subsumed much of P5's deferred B-general. That was measured afterwards and is **wrong**. B only
helps where the closure is allocated in the *same function* as the call, because the win comes
from forwarding the code-pointer store to the load. A call to a captured sibling — the dominant
shape in real code — loads its callee out of `%self`'s environment, where there is no store to
forward, and survives `-O2` completely untouched. See P5's B-general note for the numbers.

---

## P7 — Boxing driven by desugaring rather than by mutation

**Status:** ☑ done

**Outcome.** `build-program` no longer decides storage. It hands the whole define group over as
one `letrec` — legal since issue #9 made non-lambda initializers work, and already `letrec*`
because such bindings are filled in binding order — and `convert-assignments` splits it three
ways on the alpha-renamed IL, where a `set!` the program wrote is distinguishable from one a
desugaring invented: unassigned lambdas stay a closure block, an unassigned non-lambda whose
initializer needs nothing from the group but an earlier plain binding becomes an ordinary nested
`let`, and only the remainder is boxed. A name defined twice keeps the old `let` + `set!` shape,
because the renamer resolves a duplicated `letrec` binder to the first binding while top-level
redefinition is last-wins.

Across the 77-demo suite, box operations fell **144 → 58 (−60%)**. `toplevel`, `mandelbrot`,
`records`, `read-all` and `internal-define` dropped to **zero** `box`/`unbox`/`set-box!` calls;
`counter`, whose subject is `set!` on a captured variable, correctly kept all of its. 12 demos'
IR changed, **none grew** (`internal-define` −9.6%, `toplevel` −3.3%, `read-all` −3.1%), and all
77 stdout-identical. The headline case now folds outright:

```scheme
(define n 1) (define (f) n) (display (f))
;; ==== after simplify ====      (was: box + set-box! + unbox)
(primcall %display (const 1))
```

The compiler's own binaries grew ~1.6%, which decomposes the same way P6's did: compiling the
*same* source with the new compiler is −9,736 bytes, and the rest is the classifier's own code.
As predicted below, the compiler's top-level state (`counter`, `*code-defs*`, `sym-table`) is
genuinely assigned and rightly stays boxed, so it is not the population this helps — user
programs are.

**Original analysis follows.**

**Symptom.** A binding the program never mutates is still given a heap box, a `set-box!`, and
an `unbox` on every read. The clearest case is a plain top-level constant:

```scheme
(define n 1)
(define (f) n)
(display (f))
```

```
;; ==== after simplify ====
(let ((n.0 (primcall box (const ()))))
  (seq (primcall set-box! n.0 (const 1))
    (primcall %display (primcall unbox n.0))))
```

A heap allocation and two runtime box operations, for a program whose answer is the constant
`1`. Write the same program so no `set!` is synthesized and the whole thing folds:

```scheme
(let ((n 1)) (letrec ((f (lambda () n))) (display (f))))
;; ==== after simplify ====
(primcall %display (const 1))
```

Residual boxes in demos with non-lambda top-level defines — `read-all` 4, `records` 3,
`toplevel` 2, `mandelbrot` 2 — are almost all of this kind, not real mutation.

**Cause.** Boxing is decided by `find-assigned` (`src/passes/convert-assignments.ss`), which
is correct: it reports every `set!` in the term. The imprecision is upstream — **the `set!` is
synthesized by the desugaring, not written by the user.** `build-program` (`src/parse.ss`)
gives a non-lambda top-level define its `letrec*` semantics by binding the name to `'()` and
assigning it:

```
;; ==== after collect-toplevel ====
(let ((n (quote ()))) (letrec ((f (lambda () n))) (set! n 1) (display (f))))
```

So `n` is boxed because the desugaring made it mutable, not because the program did. The same
mechanism appears in `convert-assignments`'s `letrec` clause, which boxes **every** non-lambda
`letrec` binding (change: issue #9) — deliberately conservative, and the identical
over-approximation:

```scheme
(letrec ((sq (lambda (n) (* n n)))) (let ((base 34)) (sq base)))  ; => (const 1156)
(letrec* ((sq (lambda (n) (* n n))) (base 34)) (sq base))         ; => box + unbox survive
```

A box is opaque to everything downstream: `simplify` cannot inline, fold, or drop through one
(P6), and the value is re-read from the heap on every reference. So this costs on both axes,
and it costs most on exactly the small constants a program is most likely to define.

**Possible fix.** A binding needs a location only if something can observe it changing. Neither
desugaring needs to assign when neither condition holds:

1. the program never `set!`s the name itself, **and**
2. its initializer does not reference a name bound *later* in the same group (no forward
   reference), so its value is available when the binding is created.

Bindings meeting both can be emitted as ordinary nested `let` bindings — nested, not parallel,
so a later initializer can still read an earlier one and `letrec*` order is preserved. Only
genuinely assigned or forward-referencing bindings keep the `'()`-box. The two sites are
independent and can land separately:

- `build-program` (`src/parse.ss`) for top-level defines, and
- the `letrec` clause of `convert-assignments` for `letrec` / `letrec*` groups.

The forward-reference test is a small analysis over the group's initializers, on the same
alpha-renamed IL both sites already have.

**Cost / risk.** Contained, but it moves a *semantic* decision, so the hazards are worth naming.
A binding wrongly judged un-forward-referencing would read an uninitialized name — today that
yields `'()`, which is at least defined; a plain `let` would be a scope error caught at compile
time, so the failure mode is loud rather than silent. Mutual recursion through a non-lambda
initializer must stay boxed. The demo suite's values must be unchanged (this may not alter a
single program's result), and the change touches the shape every program compiles to, so it
wants the same before/after IR capture P6's items used. Expect the compiler's own binaries to
shrink again: its top-level state (`counter`, `*code-defs*`, `sym-table`) is exactly the
population this affects, though most of that *is* genuinely assigned and will rightly stay boxed.

**Related.** This is the residue of P6: P6 taught the compiler to inline and fold, and the boxes
left by desugaring are what still hides bindings from it. It also sharpens a rule worth applying
to the rest of the R7RS surface — derived forms are macros here, and an expansion that
introduces `set!` silently opts every binding it touches out of inlining, folding, and direct
calls. The textbook `letrec*` expansion (`(let ((v '())) (set! v i) ...)`) measures ~3.5% larger
IR, twice the `unbox` count, and loses P5's direct self-call entirely, where an expansion onto
`letrec` is byte-identical to the built-in form.

**OpenSpec change:** none — landed directly, as a follow-on to P6 with the same
before/after IR capture discipline.

---

## P8 — The `emit build` door does not tree-shake

**Status:** ☐ open

**Symptom.** P1 gave the AOT ship path a root-set-driven shake, but it lives in the *Chez*
driver (`build-modular-artifacts*` in `src/compile.ss`). The Chez-free `emit build` door links
the whole committed `(scheme base)` instead, so the two ship paths differ by ~3× on the same
program. Measured on `hello.scm` (2026-08-01, during `scheme-io-library`):

| path | hello.scm | shaken? |
|---|---|---|
| `chez compile.ss` (AOT release profile) | **34,720 B** | ☑ 0 exports reached |
| `emit build` | **134,248 B** | ☐ links all of `(scheme base)` |

**Why it matters more now.** `scheme-io-library` was the first change in a while to *grow*
`(scheme base)` — by 82 KB of IR (+25%). The shake absorbed it completely on the AOT path
(**+120 B, +0.35%** on `hello.scm`), while the unshaken door paid the full **+20,352 B
(+17.9%)**. That asymmetry is the whole finding: the size of a standalone binary is currently a
function of *which door built it*, and only one door honours the "small, clean, self-contained
executables" goal. Every future `(scheme base)` addition widens the gap on the wrong door.

**Cause.** The shake is a Scheme-level pass over library units that the Chez driver runs before
linking; the `emit build` verb emits the program IR in-process and forks `clang` over the
committed unit IR without that step. Nothing about the pass is Chez-specific — it is
`compile-library*` in `src/core.ss`, which the embedded compiler already contains — it simply
is not wired into the Chez-free door's build sequence.

**Fix sketch.** Have `emit build` call the same `compile-library*` reachability pass on each
linked unit, driven by the program's root set, and link the pruned IR instead of the committed
`bootstrap/scheme.base.ll`. The dev/REPL/JIT door keeps the full units (open world), exactly as
today. The likely subtlety is that `emit build` links a *committed* artifact rather than one it
compiled, so it needs the unit's export table to compute reachability — which
`build/lib/*.exports` already carries.

**Value:** med–high — it serves the flagship standalone-executable size goal, and it is the
difference between 34 KB and 134 KB on a hello-world. **Cost:** med — the pass exists and is
tested; this is wiring plus a root-set plumbing decision.

**OpenSpec change:** none yet.

---

## Maintaining this file

- When an OpenSpec change is proposed for an item, fill its **OpenSpec change** line and the
  status-table cell with the change name.
- When remediation lands and the change is archived, tick the ☐ → ☑ in both the item heading
  and the status table, and add a one-line note pointing at the archived change.
- New performance/size debt discovered during development goes here first (with cause + fix
  sketch), so the backlog stays the single source of truth the README points to.
