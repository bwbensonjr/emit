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
| [P3](#p3--the-chez-free-doors-recompile-the-standard-library-at-every-invocation) | The Chez-free doors recompile the standard library at every invocation | build speed | **high** | med | — | ☐ |
| [P4](#p4-on-codepoint-string-indexing) | O(n) codepoint string indexing | speed | low–med | med–high | `codepoint-string-indexing` | ☑ |
| [P5](#p5-arithmetic-and-call-overhead-ackermann-benchmark) | Arithmetic & call overhead (Ackermann benchmark) | speed | high | med–high | `inline-fixnum-arith-and-self-calls` (A + B-self) | ☑ |
| [P6](#p6-no-optimizer-pass-known-call-inlining-and-constant-folding) | No optimizer pass: known-call inlining & constant folding | speed + size | med–high | med | `simplify-known-calls` (A) | ☑ |
| [P7](#p7-boxing-driven-by-desugaring-rather-than-by-mutation) | Boxing driven by desugaring rather than by mutation | speed + size | med | low–med | — | ☑ |
| [P8](#p8-the-emit-build-door-does-not-tree-shake) | The `emit build` door does not tree-shake | size + build speed | med–high | med | — | ☐ |
| [P9](#p9--an-optional-argument-costs-every-call-site-its-cross-unit-direct-call) | An optional argument costs every call site its cross-unit direct call | speed | med | med | — | ☐ |
| [P10](#p10--a-library-another-unit-imports-is-never-tree-shaken-the-substrate-ships-whole) | A library another unit imports is never tree-shaken (the substrate ships whole) | size | high | med | — | ☐ |
| [P11](#p11--every-emit-build-recompiles-the-c-runtime-from-source) | Every `emit build` recompiles the C runtime from source | build speed | **low** (measured: 5%) | low | — | ☐ |
| [P12](#p12--the-reader-classifier-chain-costs-20-on-the-door-that-does-not-optimize) | The reader classifier chain costs 20%, on the door that does not optimize | speed | low | med | — | ☐ |
| [P13](#p13--the-jitrepl-door-runs-no-ir-optimization-pipeline) | The JIT/REPL door runs no IR optimization pipeline | speed | med–high | med | — | ☐ |
| [P14](#p14--an-aggregate-constant-is-rebuilt-at-every-evaluation) | An aggregate constant is rebuilt at every evaluation | speed + size | low–med | med | — | ☐ |
| [P15](#p15--indexed-access-bounds-checks-measured-and-free) | Indexed-access bounds checks: measured, and free | speed | n/a | n/a | `checked-indexed-access` | ☑ |
| [P16](#p16--argument-type-checks-free-in-time-25-in-size-and-the-size-is-where-the-choice-is) | Argument type checks: free in time, +2.5% in size | speed + size | n/a | n/a | `checked-primitive-arguments` | ☑ |

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

**Sequencing correction (2026-08-13).** The paragraph above is historical — P1, P2, P4–P7 have
landed — and its one live claim, "P3 folding into P1's link rework", did not survive: P1 landed as
Scheme-level tree-shaking rather than a link rework, so there is no link rework for P3 to fold
into. More importantly **P3 was re-measured and is now the highest-value open item on cycle time**,
not the lowest: its recorded 0.12s is stale by more than an order of magnitude, and the cost it
names is ~74% of the default test suite's wall clock. See P3 for the measurements.

**Cycle time, as it now decomposes** (all measured 2026-08-13; see each item). For the test suites
and the REPL, P3 is essentially the whole story. For `emit build` specifically:

| | share of a 2.95 s `emit build` |
|---|---|
| **P3** — baked-set recompile | 58% |
| **P8** — unshaken library IR through `-flto` | ~23% |
| **P11** — `runtime.c` recompile | 5% |

So the order is **P3, then P8, then stop**: P8 turns out to be a build-speed item as well as the
size item it was filed as, and P11 is 5% bought with an install-contract change — its own
"revisit once measured" test, now taken, says no. Of the remaining open items P10 is size, and
P9/P12/P13/P14 are the speed of what gets compiled rather than the speed of compiling it.
Separately, the redundant self-compile in `tools/regen.sh`'s fixed point (issue #99) is ~2–3
minutes of every `make regen` and is not an entry here — it is a build-script defect with no
trade-off to weigh.

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

## P3 — The Chez-free doors recompile the standard library at every invocation

**Status:** ☐ not started (**re-measured and re-scoped 2026-08-13**: the remaining scope is not
narrow, and this is the largest open lever on compile/test cycle time — see "Re-measured" below.
The original entry, whose framing was "mostly done", is kept below with a correction appended to
the two claims of its that the re-measurement overturns.)

### Re-measured (2026-08-13) — the recorded 0.12s is stale by ~14x

**Symptom.** Every `emit run`, `emit build`, and `emit lib` process recompiles the whole standard
library from source before it does anything else. On a trivial `(display 1)`, best of five,
arm64 darwin, `HEAD` = 31cec6a:

| invocation | wall |
|---|---|
| `emit run FILE` | **1.80 s** |
| `emit run --emit FILE` (compile to IR only, no JIT) | 1.50 s |
| `emit run --no-prelude FILE` | **0.08 s** |
| `emit run --emit --no-prelude FILE` | 0.07 s |
| `emit repl`, one form, repo cwd | 1.95 s |
| `emit repl --no-prelude`, one form, repo cwd | 1.65 s |

So the fixed overhead is **~1.72 s per process**, and the `--emit` row splits it:

- **~1.43 s** — the *Scheme-level* compile of the baked-in `*prelude-source*` (118,054 B of
  `src/prelude.scm`) to IR text;
- **~0.30 s** — LLVM parse + JIT of the 953,428 B of IR that produces.

That the compile half is 5x the JIT half is the useful part: **caching the IR text alone recovers
83% of the cost**, with no `.bc`/`.o` and no LLVM-side work at all. The `.bc`/`.o` idea the original
entry proposes attacks the 0.30 s and can wait.

**Cause — there is no artifact cache on the Chez-free doors at all.** The cache the original entry
describes (`artifacts-fresh?` + `build/lib/*.{ll,exports,stamp}`) belongs to the *Chez driver*,
`src/compile.ss`. The shipped binary has none:

- `seed_session` → `register_baked_set` (`src/emit.cpp`) drives mode 8, which is
  `run-register-baked-set` (`src/repl-core.ss`) → `compile-baked-set` (`src/core.ss`) — a full
  compile of every baked member, on every process start;
- `preload_user_libraries` (`src/emit.cpp`) recompiles **every user `.sld` in the program's import
  closure** from source too, via mode 4 (`repl-load-library-text`), at every invocation.

**What is actually missing is one mode.** The hard part is already built and is *half*-built in the
right direction: an export table is a plain readable datum —

```
((mylib) ((greet . "mylib:greet")) ((greet "mylib:code:greet" 0)))
```

— and `emit lib` (mode 11) already **writes** it Chez-free (`src/emit.cpp:1602-1636`). Nothing ever
**reads** one back. There is no mode that registers a unit into the session from a prebuilt `.ll` +
`.exports` pair without compiling it. Add that, key it on the stamp `artifact-compiler-stamp`
already defines (for the baked set the key is simpler still — the prelude source is *baked into the
binary*, so the binary's own identity is the key), and all three doors plus user-library preloading
collect the win from one change.

**Cost to the test loop, measured.** `./run-all-tests.sh` at this commit: 28 suites, **1605 s**, 0
failed. Per-suite wall clock against the number of `emit` processes each suite spawns:

| suite | wall | procs | per proc |
|---|---|---|---|
| R7RS numeric conformance | 277 s | 118 | 2.35 s |
| R7RS library partition | 169 s | — | — |
| demo values (`emit run`) | 160 s | 72 | 2.22 s |
| module-scaffold byte-identity | 125 s | 80 | 1.56 s |
| io ports + eof object | 83 s | 41 | 2.02 s |
| indexed access bounds | 79 s | 13 | 6.1 s |
| R7RS-small (sections only) | 62 s | 21 | 2.95 s |
| catchable errors + kinds | 50 s | 24 | 2.08 s |
| module run door | 47 s | 18 | 2.6 s |
| dynamic extent (call/cc) | 43 s | 21 | 2.05 s |
| module vertical-slice (REPL) | 40 s | 14 | 2.9 s |

The per-proc column is the finding: almost every suite sits at **~2.0–2.4 s per process against a
1.80 s fixed cost**, i.e. the suites spend most of their time re-deriving the same standard library
rather than testing anything. Over the 431 processes that can be counted exactly — 1017 s of the
1605 s — the fixed cost is **431 x 1.75 s ≈ 754 s, or 74%**. Extrapolated across the rest, roughly
**19–20 minutes of the 26m45s**.

The two ends of the table bracket it. `module-scaffold byte-identity` is ~96% fixed cost: it
compiles all 80 demos through `emit run --emit` and does essentially no other work.
`indexed access bounds`, at 6.1 s/proc, is one of the few suites where the program under test
actually dominates.

**Why it grew.** Nothing regressed; the standard library got bigger, and this cost is linear in its
source size. It is the same mechanism P8 records for binary size — every `(scheme base)` addition
lands on it — with the clock as the axis instead of bytes. `scheme-io-library`, `numeric-conformance`,
`reader-lexical-conformance` and `catchable-errors-with-kinds` have each added to it since the 0.12 s
figure was taken.

**An anomaly worth its own investigation, not folded into the above.** The REPL door's
`--no-prelude` floor is 1.65 s, where the run door's is 0.08 s — so on that door the prelude is only
~0.30 s of the 1.95 s and something else costs 1.65 s. It appears to be the manifest-driven load of
`lib/scheme/base.sld` (mode 5), which the REPL uses where the run door bakes: with no manifest
resolvable (`EMIT_MANIFEST=/dev/null`) `emit repl` starts in **0.01 s** and still evaluates
`(map (lambda (x) (* x 2)) (list 1 2 3))` correctly. That 0.01 s is *not* a floor to design toward
until it is understood — a door that answers correctly for a `(scheme base)` procedure without
having compiled `(scheme base)` is presumably resolving against the linked-in unit the binary
already carries, which is either the cheap win this item wants or a dev→ship fidelity hazard, and
which of the two it is has not been established. Establish it before building the cache, because the
answer decides whether the REPL needs the cache at all.

**Value:** high — ~74% of the default test suite, ~1.4 s off every `emit run`/`build`/`lib`, and the
most visible latency in the REPL, which `CLAUDE.md` names the primary development loop. **Cost:**
med — one new core mode plus a cache-key decision and a writable cache location for an installed
`emit`; the export-table format and the stamp both already exist.

**OpenSpec change:** _none yet._

### Original entry (framing superseded by the re-measurement above)

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

**Measured, and now paid by every door** (change: `baked-set-on-every-door`). A JIT door does not
even reach the cached-`.ll` path: it compiles the baked set from the baked-in `*prelude-source*` at
every start. That is the whole of `emit repl`'s startup latency —

```
emit repl, one trivial form, best of five:   0.84s   prelude enabled
                                             0.72s   --no-prelude
```

— so ~0.12s is the session and the rest is the standard library being recompiled from source, every
time. Before this change the REPL paid it in a different form (compiling `base.sld` + `internal.sld`
read from the manifest, measured at 0.83s — a wash), *except* in a directory whose manifest did not
name them, where it paid nothing because it silently had no standard library at all. Fixing that made
the cost universal and therefore worth caching: a precompiled baked set would cut a REPL start to
roughly its `--no-prelude` floor, which is the most visible latency in the primary development loop.

**Correction (2026-08-13).** Two things above do not survive re-measurement. First, "~0.12s is the
session and the rest is the standard library" reads the 0.84/0.72 pair backwards: 0.12 s is the
*prelude delta*, and 0.72 s — now 1.65 s — is the `--no-prelude` floor, i.e. whatever the REPL door
does regardless. So on the REPL door the baked set was never "the whole of startup latency"; see the
anomaly note in the re-measurement above, which is the entry that chases where the floor comes from.
Second, "a precompiled baked set would cut a REPL start to roughly its `--no-prelude` floor" is true
and no longer interesting, because that floor is itself ~1.65 s. The measurement that *does* hold,
and that this item now turns on, is the **run** door's: 1.80 s against a 0.08 s `--no-prelude` floor.

**Interaction with P1 (`aot-release-profile`).** P1 landed via Scheme-level tree-shaking, which
recompiles a *program-specific pruned* unit on the AOT ship path (it does **not** reuse the cached
full `.ll` there). So a precompiled/cached `.bc` for the full `(scheme base)` still helps the
**dev/REPL/JIT** door (which links the full unit), but the AOT door emits a per-program pruned
unit. If AOT build time ever matters, cache the pruned unit keyed by its (root-set → keep-set)
mapping rather than precompiling the full unit for AOT.

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

**The overflow guard, completed (change: `fixnum-overflow-trap`).** Option A above specified the
inline path as a tag test → native `add`/`sub`/`icmp` *"with an overflow guard for `+ - *`"*,
falling back to `rt_*` on the *"non-fixnum / overflow / bignum"* path. What shipped was the tag
guard alone, so the A2 seam routed on tag but **not** on overflow: a both-fixnum operation that
overflowed never reached the runtime and silently wrapped past 2^60. That is now closed — the
fast arm runs `@llvm.{sadd,ssub,smul}.with.overflow.i64` on the tagged words (a tagged fixnum is
`value<<3`, so an i64 overflow of the tagged result is *exactly* the fixnum-range condition — no
extra arithmetic) and branches on the overflow bit into the **same** `rt_*` call the tag test
uses. Slow blocks are shared, not cloned.

Measured against `HEAD` in a worktree, same toolchain, arm64:

| | before | after | delta |
|---|---|---|---|
| `build/emit` `__text` | 722 772 B | 726 560 B | **+0.52%** |
| `build/schemec` `__text` | 358 304 B | 360 252 B | **+0.54%** |
| delivered `ackermann` exe | 34 856 B | 34 936 B | **+0.23%** |
| `(ack 3 13)`, AOT, min of 7 | 9.35 s | 9.94 s | **+6.3%** |
| `(ack 3 13)`, AOT, median of 7 | 9.78 s | 10.09 s | **+3.2%** |
| `(ack 3 10)`, `emit run`, min of 3 | 0.61 s | 0.62 s | ~noise |

The size cost is an order of magnitude smaller than the original guard diamond's ~4%, because the
branch merges into a slow block that already existed. The runtime cost is real but is measured on
the deliberate worst case: Ackermann is a near-pure probe of small-integer arithmetic and calls
with almost no allocation, so ~+4–6% there is the ceiling, not the typical figure — the whole demo
suite shows no measurable change. Correctness bought at a few percent on the most arithmetic-bound
program we have is the right trade, and the branch is predicted-not-taken, so the cost is mostly
the extra instruction rather than a misprediction.

Worth revisiting only if a numeric workload becomes size- or speed-critical; the obvious lever is
teaching the emitter to skip the check where a result is provably in range (e.g. both operands
already range-narrowed), which the current `simplify` pass has no type information to do.

**OpenSpec change:** `cross-unit-direct-calls` (implemented); overflow guard completed by
`fixnum-overflow-trap`.

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

**Confirmed again, and quantified, by `numeric-conformance` (2026-08-03).** That change adds
~40 R7RS §6.2 procedures to the prelude and 17 internal `%`-op primitives. Measured on one
program (`fib`, which references *none* of them), same source at three commits, both doors:

| commit | `chez compile.ss` (shaken) | `emit build` (unshaken) |
|---|---|---|
| `5d38be0` (before the change) | 34,968 B | 134,408 B |
| `ed75577` (+17 C primitives, no Scheme yet) | 34,968 B | 134,824 B |
| after the §6.2 inventory (+40 procedures) | **34,968 B** | **154,216 B** |

The shaken door is **byte-identical across all three** — the shake is not merely absorbing the
growth, it is removing 100% of it — while the unshaken door grew **+19,808 B (+14.7%)**. The
middle row isolates a second, smaller effect worth knowing: 17 new `rt_*` C functions cost only
**+416 B** in an `emit build` executable (LTO drops the unreferenced ones) but **+17,744 B
(+3.2%)** in `build/schemec`, which links `runtime.c` without `-ffunction-sections`/
`--gc-sections`. The `declare` header is also emitted unconditionally for the whole prim table
(+34 lines per demo IR here), so prim-table growth is paid by every module regardless of use.

Two consequences for sequencing. First, P8 is now the single largest lever on the flagship
size goal and its cost rises with every prelude addition — this change alone raised the
door gap from ~100 KB to ~119 KB. Second, a future change that curates `(scheme base)`'s export
surface (GitHub issue #29) does **not** substitute for P8: the shake already achieves the ideal
here, so the problem is entirely the door that lacks it, not the size of the library.

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

**It is also the second-largest lever on `emit build` latency, which this entry did not know**
(measured 2026-08-13 while re-measuring P3). `emit build` on a trivial program takes 2.95 s, and
the unshaken library IR is a large share of it — LTO time scales with IR volume, so shipping
~950 KB of unit IR into the link costs time as well as bytes:

| component of `emit build`, trivial program | cost | share |
|---|---|---|
| total | **2.95 s** | |
| baked-set recompile (P3) | ~1.72 s | 58% |
| clang: LTO + link over 953 KB of unit IR | ~1.07 s | 36% |
| — of which the floor at minimal IR | ~0.39 s | |
| — **so attributable to the unshaken `(scheme base)`** | **~0.68 s** | **23%** |
| clang: `runtime.c` → bitcode (P11) | ~0.16 s | 5% |

Derived from `emit build --no-prelude`, which finishes in **0.62 s** and produces a working
34,776 B executable against the full build's 212,192 B. The 0.68 s is inference from that
subtraction rather than a direct measurement of a shaken link on this door — the door cannot
shake yet, which is the item — but the mechanism (less IR through `-flto`) is not in doubt, and
the byte figures bound it.

So P8 is a **size *and* build-speed** item, and after P3 it is the largest remaining one on this
door. That also settles its ordering against P11: P8 is worth ~4x P11 here and carries no install-
contract risk.

**Value:** med–high — it serves the flagship standalone-executable size goal, it is the difference
between 34 KB and 134 KB on a hello-world, and it is ~23% of `emit build`'s wall clock. **Cost:**
med — the pass exists and is tested; this is wiring plus a root-set plumbing decision.

**OpenSpec change:** none yet.

---

## P9 — An optional argument costs every call site its cross-unit direct call

**Status:** ☐ open

**Symptom.** Giving a prelude procedure an optional argument turns *every* call to it, at every
arity, from a direct cross-unit call into an indirect call through the closure. Found while
implementing `numeric-conformance`: R7RS requires `(number->string z [radix])`, so
`number->string` gained a rest parameter, and `demos/exact-range.scm` — the only demo that calls
it — was the single demo whose program-module IR changed shape rather than just gaining declares:

```llvm
;; before: a direct call to the callee's code label (change: cross-unit-direct-calls)
%t3 = call fastcc i64 @"scheme.base:code:number->string"(i64 %t2, i64 1, i64 %a0, ...)

;; after: load the closure, load its code pointer, call through it
%t3 = and i64 %t2, -8
%t4 = inttoptr i64 %t3 to ptr
%t5 = load i64, ptr %t4
%t6 = inttoptr i64 %t5 to ptr
%t7 = call fastcc i64 %t6(i64 %t2, i64 1, i64 %a0, ...)
```

**Measured cost.** A 3,000,000-iteration loop whose body is
`(string-length (number->string i))`, built with `emit build`, same source both sides:

| | best of 3 |
|---|---|
| `number->string` fixed-arity (direct call) | **0.32 s** |
| `number->string` with a rest parameter (indirect) | **0.39 s** |

**+22%** on a call-dominated loop, about 23 ns per call. It applies to `max` as well (also newly
variadic) and to any future prelude procedure that acquires an optional argument. It matters
most for `number->string` specifically because the *compiler itself* calls it for every integer
it emits.

**Cause.** The direct-call rule requires a callee whose arity is fixed, since a rest-parameter
callee needs its rest list built before the body runs; the caller cannot jump straight to the
code label under the fixed convention. So the moment a callee becomes variadic, every call site
— including the ones passing exactly the required arguments — falls back to the indirect path.
The arity is nearly always known at the call site, so the information needed to do better is
present and simply unused.

**Fix sketch.** At a call site whose argument count is statically known and whose callee is a
known rest-parameter procedure, build the rest list at the call site (empty list in the common
no-optional-argument case) and keep the direct call to the code label. Equivalently: emit a
fixed-arity entry point alongside the variadic one for such callees and have known-arity call
sites target it. Either way the win is largest exactly where it is needed, the
one-required-argument call.

**Value:** med — it recovers a regression that R7RS conformance will keep re-introducing as more
procedures gain optional arguments, and `number->string` is on the compiler's own hot path.
**Cost:** med — the direct-call machinery and the arity information both exist; this is a
lowering decision plus rest-list construction at the call site.

**OpenSpec change:** none yet. Deliberately NOT bundled into `numeric-conformance`: that change
is about the accepted language, and this is a codegen improvement whose correct scope is every
variadic callee, not the three procedures that happened to expose it.

---

## P10 — A library another unit imports is never tree-shaken (the substrate ships whole)

P1's dead-code elimination prunes a library unit to the bindings the program actually reaches, and
it works: a program whose whole body is `(display (car (list 1 2)))` links a `(scheme base)` pruned
from **338,670 B / ~200 defines down to 6,847 B / 4 defines**.

But it prunes only a unit that **no other unit imports**. `build-modular-artifacts*`
(`src/compile.ss`) says so in its own comment — *"A unit is prunable only if NO OTHER unit in the
closure imports it (else that importer — kept full — could reference a dropped binding); this keeps
the first cut sound without full backward DAG propagation."* Sound, and until `scheme-base-partition`
it cost nothing, because no shipped library imported another.

Now one does. `(scheme base)` imports `(emit internal)`, so the substrate is unprunable **by
construction** and ships whole:

```
                        committed        linked into `(display (car (list 1 2)))`
scheme.base.ll           338,670 B   ->    6,847 B   pruned to 4 defines
emit.internal.ll         170,716 B   ->  170,716 B   NOT pruned, all 114 defines
```

That same 57,480-byte executable links **32 `emit.internal:rd-*` reader symbols** against **3
`scheme.base:*` symbols** — it carries the entire in-language reader and the port representation to
call `car`. Binary size is a stated design goal (`CLAUDE.md`: "small, clean, self-contained native
executables"), and this is now the single largest unreachable payload in a minimal binary.

**Cause.** The root set is computed from the **program** text only (`program-root-internals`). A
library's exports reached solely by *another library* are invisible to it, so the conservative answer
is to keep any imported-by-a-unit library whole. Note the guard was also latently broken until this
change — it compared library names, which are lists, with `memq` — so the substrate was briefly
pruned and the fixed point failed to link; the fix made the guard fire, which is what surfaces the
size cost.

**Fix sketch.** Propagate roots backward through the import DAG instead of giving up: shake in
reverse topological order, and seed each unit's root set with the program's roots **plus** every one
of its exports that a kept binding in an already-shaken importer still references. `(scheme base)`
pruned to 4 defines references almost nothing in the substrate, so a program calling only `car`
should keep ~0 reader bindings. The machinery all exists — `compile-library*` already takes
`keep-roots`, and the export tables already record what each unit references; what is missing is the
ordering and the per-unit root union.

**Value:** high — it is the difference between ~170 KB of dead IR in every AOT binary and near zero,
on the axis the project treats as a defining goal. **Cost:** med — one pass ordering change plus a
root-union step; no new representation, and the closed-world assumption is unchanged.

**Interaction with P8.** P8 notes the Chez-free `emit build` door does not tree-shake at all. Fixing
P8 without P10 would give that door the same blind spot; fixing P10 first means both doors inherit
the better root computation.

**OpenSpec change:** none yet. Surfaced by `scheme-base-partition` (archived
`2026-08-04-scheme-base-partition`), which introduced the first library-importing-a-library in the
shipped set and so made a dormant limitation load-bearing.

---

## P11 — Every `emit build` recompiles the C runtime from source

**Status:** ☐ not started (deliberately deferred; see "Why it is not scheduled")

**Symptom.** `emit build` hands `src/runtime/runtime.c` — a ~91 KB C file — to clang on the link
line of *every* delivered executable, alongside the unit `.ll` files. Nothing about it varies with
the program being built, so the same translation unit is compiled again for every build, on every
machine, forever. With `-flto` and `-O2` the compile is not free.

**Cause.** The link line is assembled in `link_clang` (`src/emit.cpp`) from `tc.cc`, the unit `.ll`
files, and the runtime **source**. Shipping source rather than an object is a deliberate property of
the install contract, not an oversight — see below.

**Possible fix.** Ship a prebuilt `runtime.o` (or a `libemitrt.a`) beside the binary and link that
instead, falling back to the source when the object is absent or does not match the target. This
would drop one C compile from every delivered build.

**Why it is not scheduled.** The install contract deliberately excludes compiled artifacts. The
`install` target's own note explains it for the library sources — shipping compiled artifacts
"would put artifact staleness on the install surface" — and the same argument holds harder for the
runtime: an installed `runtime.o` is stale relative to a `runtime.c` edit, is target- and
ABI-specific in a way source is not, and would have to be validated against the linking clang's
target before it could be trusted. `installed-emit-completeness` made `emit build` work from an
install by shipping `src/runtime/runtime.c` at its repo-relative subpath under
`<prefix>/share/emit/`, and recorded this speed idea here rather than taking it, because the
correctness question (does the door work at all when installed?) and the speed question (how fast
does it work?) have different answers and different risks.

Worth revisiting once there is a measurement: how much of `emit build`'s wall clock is the runtime
compile, as against the LTO link of the units? If it is a small fraction, the staleness surface buys
nothing.

**Measured (2026-08-13), and the answer is: a small fraction. Do not schedule this.** Compiling
`src/runtime/runtime.c` with the flags `link_clang` uses (`-O2 -flto -c`, `src/emit.cpp:1403-1426`)
takes **0.16 s**, best of three, against `emit build`'s **2.95 s** on a trivial program:

| component of `emit build`, trivial program | cost | share |
|---|---|---|
| baked-set recompile (P3) | ~1.72 s | 58% |
| clang: LTO + link over 953 KB of unit IR (P8) | ~1.07 s | 36% |
| **clang: `runtime.c` → bitcode (this item)** | **~0.16 s** | **5%** |

So this is **5% now, and ~13% once P3 removes the 1.72 s** — against an install-contract change the
`installed-emit-completeness` reasoning above rejects. By this entry's own stated test, the
staleness surface buys nothing.

There is a mechanical reason the ceiling is this low, worth recording so the question is not
re-opened: under `-flto`, `-c` on `runtime.c` only emits **bitcode**. The optimization and codegen
that would dominate a non-LTO build happen at link time instead, over the whole module set, and a
cached `runtime.o` does not avoid any of it. Caching the C compile can therefore never recover more
than the 0.16 s, no matter how large `runtime.c` grows.

**What to do instead.** The link is 36% and P8 is ~23% of it, so **P8 is worth ~4x this item on the
same door** and carries no contract risk. P3 is worth ~11x. Both should land first, and either may
change this denominator enough to make the question moot.

**If it is ever revisited, the framing should change.** This entry proposes *shipping* a prebuilt
object, which is what draws the install-contract objection. P3 is building a derived-artifact cache
(local, keyed on compiler + target identity, regenerable, falling back to source on a miss) — and a
cached `runtime.o` in *that* is not an install-surface change at all: nothing extra is shipped and
nothing can go stale undetected. Framed that way this becomes a small second consumer of P3's cache
rather than a contract change, i.e. much cheaper than the "med contract risk" below — still only
worth 0.16 s, but for nearly nothing.

**Value:** low — 5% of `emit build` (~13% after P3), and hard-capped at 0.16 s by the `-flto`
argument above. **Cost:** low to implement, med in contract risk as framed here — low if it rides
P3's cache instead.

**OpenSpec change:** none, and none warranted. Recorded by `installed-emit-completeness` as an
explicit non-goal; the measurement it asked for was taken 2026-08-13 and confirms the deferral.

---

## P12 — The reader classifier chain costs 20%, on the door that does not optimize

**Status:** ☐ not started (**re-measured and re-scoped** by `reader-token-path`; the fix it once
proposed is no longer the right one — see "What the re-measurement changed")

**Symptom.** On `emit run`, reading a token-dense source is **~17% slower** than before
`reader-lexical-conformance` (+20% of wall clock, but part of that is a bigger substrate to JIT —
see the table). On the delivered `emit build` binary, it is **not slower at all**.
Measured with `read-all-from-string` over `tools/gen-reader-bench.ss`'s output (200k tokens in 25k
forms, 1,939,560 B: 50k symbols, 50k integers, 50k decimals, 50k strings), five interleaved runs per
binary on an otherwise idle machine, the pre-change tree in a detached-HEAD worktree (b102070)
against the post-change one (9a84ca2):

| door | before | after | delta |
|---|---|---|---|
| `emit run`, total wall clock | 3.72 s | 4.47 s | +20.2% |
| — of which fixed compile + JIT | 0.61 s | 0.83 s | +0.22 s |
| — **the read itself** | 3.11 s | 3.64 s | **+17%** |
| `emit build` binary (AOT, `-O2 -flto`) | 2.84 s | 2.84 s | **none** |
| Chez-hosted (min of 20) | 33.0 ms | 36.5 ms | +10.6% |

The fixed row matters and is easy to miss: `emit run` JIT-compiles the baked set before it runs
anything, and `reader-lexical-conformance` grew `(emit internal)` from 170,716 to 289,754 B, so
**0.22 s of the 0.75 s total delta is not reading at all** — it is compiling a larger substrate.
Measured as the wall clock of `emit run` over a one-line program on each binary. Subtracting it is
what turns a headline +20% into the +17% that is actually attributable to the token path.

**Cause.** `rd-atom` used to be one `cond` over three classifiers. It is now a call into
`rd-number`, which calls `rd-body-number`, which calls the same three classifiers plus
`rd-exactness-apply`, and on failure `rd-rational-body?`. The grammar genuinely grew — R7RS 6.2.5
prefixes and 6.2.3 rational syntax have to be *asked about* somewhere — but what the measurement
shows is the per-call overhead that P5 names, multiplied by the number of tokens: each of those
procedures is a real call with a real frame, and the classifiers themselves are character loops
written in Scheme.

**What the re-measurement changed** (`reader-token-path`, which set out to fix this and did not).
The original entry recorded the `emit run` number alone and read it as a property of the reader. It
is a property of the reader *and the door*. `emit run` builds a plain `LLJITBuilder().create()` with
no IR optimization pipeline (`src/emit.cpp:839`); the AOT link passes `-O2 -flto`
(`src/emit.cpp:1337`, `ship-opt`/`ship-lto` at `src/compile.ss:299`). Where an optimizer runs, the
extra calls cost nothing measurable. (That `-O2 -flto` removes it is measured; *which* inlining
decision removes it is inference, and is not claimed as more.)

Three consequences, and they are why this is still ☐ rather than in progress:

1. **The old justification inverted.** This entry used to argue urgency from "the reader is on the
   compiler's own hot path — it reads its own source". But the compiler *is* an AOT `-O2 -flto`
   binary, so its own reads are on the **unaffected** path. The cost lands on `emit run` and the
   REPL: a dev-loop cost, not a ship cost, and not a self-hosting cost.
2. **The fix below would hand-fold what `-O2` already folds** — and would cost
   `reader-lexical-conformance` design D3 its by-construction guarantee that `rd-atom` and
   `string->number` accept the same tokens (they hold it today by being the same call), replacing it
   with a corpus test. Real complexity, for a benefit confined to the door that does not optimize.
3. **P13 is the entry these numbers actually justify.** No IR optimization on the dev door is a cost
   every JITted program pays on every call, not just the reader's. Fixing P13 would recover most of
   this item for free; fixing this item recovers only the reader.

**Possible fixes**, in increasing order of ambition — still the right sketches *if* P13 is never
taken, since they are what a door with no optimizer needs:

- Classify from the token's FIRST character before calling anything: a token starting with a
  character that is not a digit, sign, or dot cannot be any kind of number, which is most tokens in
  real source. One comparison in place of the whole chain.
- Fold the classifier chain into one pass over the token, deciding integer / decimal / non-finite /
  rational / symbol in a single traversal instead of up to four.
- Have `rd-token-end` return what it already learned. It walks every character of the token looking
  for a delimiter; it could report "saw only digits" / "saw a dot" / "saw a slash" for free, and the
  classifiers would become tests on that answer rather than re-traversals.

Note also what is *not* the cause, measured: ordering the rational scan after the classifiers rather
than before is provably redundant work removed, and is worth ~10% under Chez while sitting inside
the noise on the self-hosted door. That null result is the original evidence that the cost is
structural rather than in any one scan.

**Reproducing it.** `tools/gen-reader-bench.ss` writes the input (fixed-seed, byte-identical across
runs and machines); build a program that calls `read-all-from-string` over stdin and time it both
ways. The generator exists because this entry's first numbers cited a "1.6 MB" file that no longer
existed — a described benchmark is not a reproducible one, and re-deriving it from the description
produced the same token count in a different number of bytes, which is why the figures above are not
comparable to the ones this entry carried before.

**Value:** low — a constant factor on the dev door only, with no effect on the delivered binary, on
emitted code, or on binary size. (Was "low–med", on the belief that it touched every compile.)
**Cost:** med — the fixes touch the classifiers `string->number` shares with the reader, so the
shared-grammar property (`reader-lexical-conformance` design D3) has to survive whatever is done,
and every one of them forces a `make regen`.

**OpenSpec change:** none. Measured and recorded by `reader-lexical-conformance` (task 9.4);
re-measured, re-scoped, and given a generator by `reader-token-path`, which dropped it from its own
scope on the strength of the numbers above.

---

## P13 — The JIT/REPL door runs no IR optimization pipeline

**Status:** ☐ not started (found by `reader-token-path`'s baseline measurement)

**Symptom.** `emit run` and `emit repl` compile a program to LLVM IR and hand it straight to ORC
with no optimization passes, so every JITted program pays full per-call, per-allocation overhead.
The same program built with `emit build` is materially faster. On the reader benchmark above, the
identical source runs in **2.84 s** as a delivered binary and **3.64 s** under `emit run` — the dev
door is **~28% slower** on the same work, and that is *after* setting aside the 0.83 s it spends
compiling and JITting the baked set first (4.47 s of wall clock in total).

That gap is why P12 above looked like a 20% reader regression: the reader's added calls are free
once something inlines them, and nothing does on this door.

**Cause.** `src/emit.cpp:839` (the run door) and `:1114` (the REPL host) each build the JIT with a
bare

```cpp
auto jitOr = LLJITBuilder().create();
```

and never construct a pass pipeline over the module. The AOT path, by contrast, hands clang `-O2`
and `-flto` (`src/emit.cpp:1337`; mirrored as `ship-opt`/`ship-lto` in `src/compile.ss:299`). This
is not an oversight so much as an unexamined default: `aot-release-profile` fixed the *ship* side
when it found the delivered binary was linked at clang's `-O0` — "so it was both slower and larger
than the JIT (dev beat ship)" — and explicitly noted that the JIT/REPL door "is not gated by this".
Ship overtook dev, and dev was never revisited.

**Possible fix.** Run a standard optimization pipeline over the merged module before handing it to
ORC — `LLJITBuilder` supports a transform layer, and the module is already fully linked at that
point on both doors. The dial worth having is a `-O` level on the dev door, defaulting to something
above zero: JIT compile time is itself part of the dev loop, so the goal is the knee of the
curve, not `-O2` unconditionally.

**Why it is not scheduled here.** `reader-token-path` found it while measuring something else and
recorded it rather than taking it: the change in flight was a correctness fix for `include-ci`, and
an optimizer on the dev door is a different change with a different risk surface — it can alter
timing-dependent behaviour, it interacts with the REPL's incremental compilation of one form at a
time, and it needs its own before/after across more than one benchmark.

**Sequencing.** This partly **subsumes P12**: recovering the dev door's inlining would recover most
of P12's 20% without touching the reader's shared numeric grammar at all, which is the property P12's
own fixes put at risk. Do this first, then re-measure P12 and decide whether anything is left. It
also interacts with P5 (arithmetic and call overhead) and P6 (known-call inlining) from the other
side: those add optimizations to the *compiler*, while this one turns on the optimizations LLVM
already has.

**Value:** med–high — every `emit run` and every REPL evaluation, on every program, with no change to
the delivered artifact. **Cost:** med — a pipeline over an already-merged module is mechanical, but
picking the level needs measurement across both doors, and the REPL's per-form path needs checking
separately from the run door's whole-program one.

**OpenSpec change:** none.

---

## P14 — An aggregate constant is rebuilt at every evaluation

**Kind:** speed + size · **Value:** low–med · **Cost:** med · **OpenSpec change:** none · ☐

A quoted **pair, vector, or bytevector** is not a constant in the emitted code — it is a
*constructor call sequence* that runs every time control reaches it. `encode-const`
(`src/emit.ss`) materializes each one at run time: a pair via `rt_cons`, and, since change
`reader-datum-parity`, a vector via `rt_make_vector` plus one `rt_vector_set` per element (a
bytevector likewise). So

```scheme
(define (f) '#(1 2 3))
```

allocates a fresh 3-element vector and stores three elements on **every call**, and the same
literal inside a loop allocates once per iteration. The pair case has always behaved this way;
the vector case simply makes it more visible, because an n-element vector costs n+1 calls
rather than the one `rt_cons` a small list needs.

Two independent halves, worth separating:

**A. Hoist to a one-time initializer.** A quoted constant is immutable in R7RS, so it may be
built once into a module-level slot and referenced thereafter. That converts n+1 calls per
evaluation into n+1 calls per *program*, and turns the constant into a single load. The
question it raises is where the slot lives and how it interacts with the per-unit `__init`
ordering the module system already has.

**B. Emit an all-immediate aggregate as a static global.** When every element is an immediate
(fixnum, character, boolean, `()`), the whole vector or bytevector can be a `@.vec.lit.N`
global with a static initializer and no run-time construction at all — the treatment strings
already get through `emit-cstring-global`. This does **not** generalize: a symbol element needs
`rt_intern`, and a nested pair needs `rt_cons`, so the clause would carry two paths, which is
why `reader-datum-parity` (design D1) deliberately took the uniform one first. A bytevector is
the case that gains most, since its elements are *always* immediates.

B is the cheaper and more contained of the two, and it subsumes A for the literals most likely
to be hot (`'#u8(...)` tables, small numeric vectors). A is the general answer and should
follow P6's constant-folding work rather than precede it.

Found while implementing `reader-datum-parity` (issue #64): the vector clause was written to
mirror the existing pair clause, and mirroring it inherited this cost.

---

## P15 — Indexed-access bounds checks: measured, and free

**Status:** ☑ measured, no action needed (change: `checked-indexed-access`)

This entry exists to record a **measurement, not a debt**. Change `checked-indexed-access` made every
indexed accessor bounds-checked (`vector-ref`/`vector-set!`, `bytevector-u8-ref`/`-set!`,
`string-ref`/`string-set!`, `substring`, the internal record accessors, plus a non-negative size test
in `make-vector`/`make-bytevector`/`make-string`). Those accessors are on the compiler's hottest
paths — `src/parse.ss` keeps its environments in vectors and the reader runs on `string-ref` — so
design D7 required the cost to be measured rather than assumed, and required the result to be
recorded *whether or not it showed a cost*. A recorded "no measurable cost" is what stops the
question being re-litigated at every review.

**Result: no measurable cost.** The median difference is **+0.01%** on a 162-second workload, which
is roughly two orders of magnitude smaller than the run-to-run noise.

**Method.** The workload is `emit-boot --emit < build/embed.scm`: the compiler compiling **itself**
(434 KB of Scheme), which is the inner step `make regen` iterates to a fixed point. Two `emit-boot`
binaries were linked from the *same* committed IR, differing only in `runtime-host.o` (guarded vs
unguarded), so nothing but the C runtime varied — and both were confirmed to emit **byte-identical
IR** (3,836,487 bytes), without which the two arms would not be the same compiler. Runs were
interleaved A/B/A/B so thermal drift and background load hit both arms equally.

| arm | n | min | median | mean | max | stdev |
|-----|---|-----|--------|------|-----|-------|
| checks OFF | 5 | 159.083s | 161.926s | 163.648s | 168.700s | 4.151 |
| checks ON  | 5 | 159.317s | 161.945s | 162.520s | 167.448s | 3.072 |

Median delta **+0.020s (+0.01%)**. Paired deltas: −1.252, −2.608, +3.913, −5.389, −0.304 — they
straddle zero, and the mean paired delta is *negative* (−1.128s), which is noise rather than a
speedup. Within-arm spread is 9.617s (OFF) and 8.131s (ON): the noise floor is ~5%, so this method
could not have resolved an effect smaller than that, and the effect is well inside it.

**Why it is free.** Each check is a compare against a word the accessor already loads to find its
data (`vec_len`, `bv_len`, `str_cplen` all live in the object header), and a correctly-predicted
branch that never fires. Preferring the paired inner-loop measurement over two whole-`regen`
wall-clocks was deliberate: regen buries the compile in clang/LLVM link time and yields one sample
per arm, where this yields five paired samples of the code actually affected.

**Consequence for the deferred work.** Design D7 named the remedy order if a cost appeared — elide
where the emitter can prove the index in range, records first (design D6), then constant indices.
None of it was filed, because there is no cost to recover. The record accessors are the one place a
future optimizer *could* elide provably (the frontend derives every field index as a compile-time
constant from the record definition, `src/parse.ss:529`), but at +0.01% it would be optimizing
nothing. Note that records gained a field-count header word in this change — they had no length to
check against — so the record path costs one word per instance, not per access; that is a size note,
not a speed one.

---

## P16 — Argument type checks: free in time, +2.5% in size, and the size is where the choice is

**Status:** ☑ measured (change: `checked-primitive-arguments`)

A **measurement, not a debt**, in the shape P15 set. Change `checked-primitive-arguments` made every
primitive that dereferences an argument tag-check it first (`car`/`cdr`, the vector/string/bytevector
accessors, the string family, the box/record/hash-table/mv/error-object accessors, and the new
`set-car!`/`set-cdr!`), and made the **operator of an indirect call** tag-checked where its code
pointer is loaded. `car` is the hottest primitive in the compiler's own sources, so design D11
required the cost to be measured rather than assumed, and required it recorded either way.

**Result: no measurable time cost, and a real size cost that is not evenly distributed.**

### Time — no measurable cost

Workload: `emit-boot --emit < build/embed.scm`, the compiler compiling **itself** (454 KB of Scheme),
the inner step `make regen` iterates. Both arms were given the **same input** so only the compiler
differs, and runs were interleaved before/after so drift hit both equally.

| arm | n | min | median | mean | max | stdev |
|-----|---|-----|--------|------|-----|-------|
| checks OFF | 5 | 171.858s | 174.241s | 174.198s | 175.743s | 1.450 |
| checks ON  | 5 | 169.734s | 174.887s | 172.977s | 175.398s | 2.946 |

Median delta **+0.646s (+0.37%)**. Paired deltas: −0.655, −4.507, −2.081, +0.458, +0.677 — they
straddle zero and the mean paired delta is **negative** (−1.222s), which is noise, not a speedup.
Within-arm spread is 2.2% and 3.2%, so this method could not resolve an effect below ~3%, and the
effect is well inside it.

**Why it is free.** Each check is a compare on a value already in a register, followed by a
correctly-predicted branch that never fires, and the link is `-flto` (`src/emit.cpp`) so `rt_car` and
friends inline into their callers and repeated tests on the same value fold. The one guard that is
*not* free by that argument is the indirect-call check, which is a real call site per indirect call —
and it too disappears into the noise here.

### Size — +2.5%, concentrated where it is least welcome

| artifact | before | after | delta |
|---|---|---|---|
| `bootstrap/embed.ll` | 3,222,332 | 3,307,527 | +2.64% |
| `bootstrap/scheme.base.ll` | 568,023 | 583,077 | +2.65% |
| `bootstrap/schemec.ll` | 2,974,902 | 3,057,825 | +2.79% |
| IR the compiler emits for itself | 4,096,699 | 4,200,563 | +2.54% |
| `build/emit` | 1,630,104 | 1,663,480 | +2.05% |
| **a delivered hello-world executable** | **194,272** | **210,936** | **+8.58%** |

The last row is the one that matters. Standalone executables are a stated design goal, and a shaken
hello-world is small enough that a fixed overhead weighs disproportionately: +16,664 bytes on a
194 KB binary. Two contributions, and they separate cleanly:

- **the indirect-call guard** — 39,351 `call void @rt_check_callable` across the 80 demos, one per
  indirect call site (measured in the `module-scaffold-baseline` re-record). This is emitted code,
  so it scales with the program;
- **the runtime's own growth** — `rt_type_name`'s dispatch plus one guard per accessor, compiled into
  every executable whether or not a program can reach them, since `runtime.c` is linked whole with no
  `-ffunction-sections`/`--gc-sections` (the same effect P8 and the numeric-conformance group-4 note
  record for the `rt_*` declare header).

**The remedy order, if this is ever worth paying down**, is the one design D11 named, and it is *not*
an unsafe mode — a guarantee that depends on how the program was built is not one:

1. **Emitter-side elision of the indirect-call guard.** `emit-app`/`emit-apply` already know when the
   operator is a statically-known closure (`self-app`/`known-app` skip the guard entirely today). The
   remaining sites are genuinely dynamic, but a simple type/flow pass would prove many of them —
   a variable bound to a `lambda` and never assigned, for instance.
2. **Emitter-side elision of accessor guards** where the argument is provably of the right type: a
   freshly allocated `cons` reaching `car`, the compiler's own `%record-ref` call sites.
3. **`-ffunction-sections`/`--gc-sections` on the runtime link**, which would shrink every delivered
   executable and is independent of this change — it also reclaims the numeric-conformance group-4
   cost. Probably the cheapest of the three and the widest in effect.

Nothing is filed as a follow-on: +8.58% on a hello-world is worth recording and watching, not worth
contorting a memory-safety guarantee for. Item 3 is the one to reach for first if binary size becomes
pressing, since it is not specific to this change at all.

---

## Maintaining this file

- When an OpenSpec change is proposed for an item, fill its **OpenSpec change** line and the
  status-table cell with the change name.
- When remediation lands and the change is archived, tick the ☐ → ☑ in both the item heading
  and the status table, and add a one-line note pointing at the archived change.
- New performance/size debt discovered during development goes here first (with cause + fix
  sketch), so the backlog stays the single source of truth the README points to.
