## Why

`include-ci` case-folds a bar-quoted identifier (**GitHub issue #61**):

```scheme
;; old.scm, included with (include-ci "old.scm")
(define (|MixedCase|) 1)     ; defines  mixedcase
```

R7RS §7.1.1 says the characters between the bars are the symbol's name literally, so `|MixedCase|`
is not subject to folding. The fold runs in `fold-datum-case` (`src/core.ss`) over the forms the
reader **already returned** — `library-include-declarations` design D6 — and by then `|MixedCase|`
and `MixedCase` are the same interned symbol. Adding bar syntax to the reader
(`reader-lexical-conformance` design D7) did not change this and said so. D6 chose the post-read
fold to keep *one* implementation across the two hosts; the cost of that choice is that both hosts
now agree on the wrong answer. Folding has to happen during tokenization, where the bars are still
visible.

**This change was originally scoped to fix `docs/PERFORMANCE.md` P12 at the same time, and the
baseline measurement retired that half.** P12 records the reader as ~20% slower since
`reader-lexical-conformance`. Measured against the pre-regression tree (b102070, built in a
worktree) on one reproducible 200k-token input:

| door | pre-regression | HEAD | delta |
|---|---|---|---|
| `emit run`, total wall clock | 3.72 s | 4.47 s | +20.2% |
| — of which fixed compile + JIT | 0.61 s | 0.83 s | +0.22 s |
| — **the read itself** | 3.11 s | 3.64 s | **+17%** |
| `emit build` binary (AOT `-O2 -flto`) | 2.84 s | 2.84 s | **none** |
| Chez-hosted (min of 20) | 33.0 ms | 36.5 ms | +10.6% |

Medians of five interleaved runs on an idle machine. The fixed row is easy to miss and matters: `emit run` JIT-compiles the baked set first, and `reader-lexical-conformance` grew `(emit internal)` 170,716 → 289,754 B, so 0.22 s of the 0.75 s delta is compiling a larger substrate rather than reading. The regression is real on the **unoptimized dev door** and absent
from the shipped artifact: `emit run` builds a plain `LLJITBuilder().create()` with no IR
optimization pipeline (`src/emit.cpp:839`), while the AOT link passes `-O2 -flto`
(`src/emit.cpp:1337`; `ship-opt`/`ship-lto` at `src/compile.ss:299`). P12 measured `emit run` and
recorded the result as a property of the reader.

That inverts P12's own argument for why it matters — "the reader is on the compiler's own hot path,
it reads its own source" — because the compiler *is* an AOT `-O2` binary, so its own reads are on
the unaffected path. And it makes P12's proposed fix the wrong shape: hand-folding the classifier
chain buys back, by hand, what `-O2` already does, while costing `reader-lexical-conformance` D3 its
by-construction shared-grammar guarantee. So the reader rework is dropped, and the measurement is
redirected at the item it actually found.

## What Changes

- **A fold-aware read entry.** A second whole-source entry point folds symbol case **during
  tokenization**, where the bars are still visible: `rd-atom` folds its token, `rd-bar` does not.
  Reading is unchanged in every other respect, and the fold applies on the symbol arm only, so it
  cannot reach a number's text.

- **`include-ci` folds at read time, on both hosts.** The Emit door (`src/include-reader.ss`) calls
  the fold-aware entry; the Chez driver door (`src/compile.ss`) reads under Chez's `case-sensitive`
  parameter, which already leaves `|MixedCase|` alone. Neither door needs a protocol change — the
  core already passes `who` to the reader, so `include-ci` is distinguishable at the door.

- **`fold-datum-case` and its helpers are deleted from `src/core.ss`.** The post-read fold has no
  remaining caller once both doors fold at read time. This also closes a second defect in passing:
  `fold-datum-case` walks symbols and pairs with `else x`, so a symbol inside a `#(...)` vector
  literal is not folded today.

- **P12 is rewritten, not ticked**: the corrected measurement, the corrected scope (dev door only),
  and a reproducible benchmark generator committed so the next measurement compares against the same
  bytes rather than a similar-sounding file. Its remaining value is re-rated against the door it
  actually affects.

- **A new `docs/PERFORMANCE.md` item** for what the measurement found: the JIT/REPL door runs no IR
  optimization pipeline, so every JITted program pays full per-call overhead. That is a far larger
  lever than one hand-folded classifier chain, and it is what P12's numbers were really measuring.

**Explicitly not changing** (dropped from this change's original scope): the `rd-atom`/`rd-token-end`
classifier dispatch, the set of tokens the reader accepts, the values it produces,
`string->number`'s shared grammar (`reader-lexical-conformance` design D3, which keeps holding by
construction), the reader's no-raise discipline (design D2), or the sentinel encoding.

## Capabilities

### New Capabilities

None. The change modifies behavior already specified.

### Modified Capabilities

- `core-language`: the reader gains a **case-folding whole-source entry point** alongside
  `read-all-from-string`, specified as folding unquoted symbol case while leaving a bar-quoted
  identifier's name literal. It is a published `(scheme base)` export beside its non-folding twin —
  two attempts to hide it ran into `scheme-base-partition` D10, since anything that reports cannot
  live in the substrate (design D2).
- `module-system`: the `include-ci` requirement currently states the opposite of what R7RS §7.1.1
  requires — "a bar-quoted symbol is folded as well, because the distinction is not observable after
  reading." That sentence is replaced: a bar-quoted identifier SHALL NOT be folded, and both hosts
  SHALL agree.

## Impact

**Code.**

- `src/prelude.scm` — a fold argument threaded through the descent to `rd-atom`, and the new entry
  point. This is the reader, homed in `(emit internal)`/`(scheme base)`.
- `src/prelude-surface.scm` — homing and the exported-name classification for the new entry.
- `src/core.ss` — `fold-datum-case`, `fold-string-case`, `fold-char-case` deleted; the `fold?`
  parameter drops out of `included-body-forms`.
- `src/include-reader.ss` — the Emit door dispatches on `who`.
- `src/compile.ss` — the Chez door reads `include-ci` under `case-sensitive`.
- `tools/gen-reader-bench.ss` — new; the benchmark generator P12 lacked.
- `docs/PERFORMANCE.md` (P12 rewritten, one item added), `docs/MODULES.md` (the `include-ci` bullet
  naming the gap).

**Build.** The reader is in a baked library, so **every program's IR moves** and
`test/module-scaffold-baseline.sha256` is re-recorded with the reason — the same handling
`reader-lexical-conformance` used. One `make regen` at the end.

**Risk to watch.** Reader-level folding restores the *two independent implementations* that D6
avoided, and the difference is real: Chez's `case-sensitive` folds Unicode (`ÉCOLE` → `école`) where
Emit's fold is ASCII. The two hosts must be pinned against each other by fixture rather than by
construction — see `design.md`.

**Issues.** Fixes #61. Rewrites `docs/PERFORMANCE.md` P12 and adds one item; does not tick P12.
(Filed separately while measuring: #63, `emit build` segfaults on an absent or empty manifest —
unrelated, not fixed here.)
