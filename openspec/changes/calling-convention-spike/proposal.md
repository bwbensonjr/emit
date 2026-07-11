## Why

Real Scheme — and the compiler's own source (the self-hosting target, which uses
`map`/`for-each`/`append`/`apply`) — needs variadic `lambda`, dotted rest parameters, and
`apply`. The current calling convention **cannot express any of them**: every Scheme
function shares one prototype `tailcc i64 (i64 self, i64 a0 … i64 a{K-1})` where `K` is
the whole-program maximum arity, and calls pad missing arguments with `0`. Padding is
indistinguishable from a real fixnum `0`, there is no argument count, and `apply` of a
list longer than `K` is impossible.

Changing the calling convention **after** more of the compiler is built on it means a
cross-cutting rework, not an additive change. This spike decides the convention now —
with a working experiment and a `musttail` proof — so later rounds build on a settled
foundation. It deliberately mirrors the nanopass spike: the deliverable is an
evidence-backed decision and a design, **not** a production implementation.

## What Changes

- Build throwaway experiments (under `spike/calling-convention/`) for the leading
  candidate conventions, emitting real `.ll` and running it, to confirm each can express
  rest params + `apply` **and** still compile guaranteed tail calls (`musttail`) on the
  x86_64/AArch64 targets.
- Measure the hot-loop overhead of each candidate against the current fixed-arity
  baseline (the 10M-iteration `countdown` pattern).
- Record the chosen convention, the scoring, and the rationale in `LLVM.md`'s "Calling
  convention" / "Tail calls" sections and this change's `design.md`.
- **No production codegen change.** `src/emit.ss` is not modified here; implementing the
  chosen convention is a separate later change.

## Capabilities

### New Capabilities
<!-- None. Research spike; the deliverable is a decision + design, not a runtime capability. -->

### Modified Capabilities
- `aot-codegen`: add a requirement that the calling-convention decision (how variadic
  application, rest parameters, and `apply` are supported while preserving guaranteed
  tail calls) is backed by a direct comparison of candidate conventions and recorded with
  its rationale — analogous to the pass-framework decision requirement produced by the
  nanopass spike.

## Impact

- **New (throwaway/reference):** `spike/calling-convention/` — hand-written `.ll`
  experiments per candidate plus a small runner, kept as a reference like
  `spike/nanopass/`.
- **Docs:** `LLVM.md` "Calling convention" and "Tail calls" sections updated to state the
  decision; this change's `design.md` holds the full comparison.
- **Unaffected:** all production code (`src/**`, `runtime.c`). No behavior change ships
  from this spike.
- **Unblocks (later changes):** variadic `lambda` + rest params + `apply`, a real prelude
  library, and the in-language reader/macro-expander that lean on them.
