## Context

Groundwork done: `docs/PIPELINE.md` fixes the pass framework (hand-rolled `match`) and
maps the transferable spine and the LLVM-subsumes line; `LLVM.md` fixes the IR
conventions, the AOT backend shape, and the GC plan; `spike/nanopass/` has runnable,
tested versions of three spine passes. This change turns that into the first program
that actually compiles and runs.

The chosen scope is an **M1 core-lambda vertical slice**: minimal language *breadth*,
full pipeline *depth* (`read → run`). The value is a walking skeleton — one small
recursive program taken end to end — that immediately exercises the design's hard,
cross-cutting commitments (tagged values, closures, the calling convention, `musttail`
tail calls, Boehm GC) rather than deferring them.

## Goals / Non-Goals

**Goals:**

- One recursive demo (e.g. `fact`) and one allocating demo (list ops via `cons`) and one
  `set!` demo compile from source to a native executable and produce the right result.
- Stand up the production `src/` skeleton, the `match` pass convention, and a named IL
  per stage that is independently observable.
- Exercise all three cross-cutting hard parts at least once: closures, `musttail` tail
  calls, and heap allocation under Boehm GC.

**Non-Goals:**

- Not a complete Scheme. Language breadth is only as wide as the demos need (D2).
- No optimization passes, no ANF/CPS, no precise GC, no JIT, no macros, no `call/cc`.
- Not writing our own reader yet (host Chez `read` stands in until self-hosting).
- Not re-deciding IR conventions — those are `LLVM.md`'s and are adopted as-is.

## Decisions

### D1 — Walking skeleton: minimal breadth, full depth

Language wide enough for ~3 demo programs, pipeline complete to a native binary. Every
form added must be justified by a demo that needs it. This keeps the first slice small
while still proving the full path.

### D2 — The M1 core subset (the parked "minimal-subset-decision", scoped here)

Accepted (single top-level expression → value):

| category | forms |
|----------|-------|
| data     | fixnums, booleans (`#t`/`#f`), empty list `()`, pairs |
| special  | `quote`, `if`, `lambda`, application, `let`, `letrec`, `begin`, `set!` |
| prims    | `+ - * = <`, `cons car cdr`, `null? pair? eq?` |

`set!` is **in** deliberately, so `convert-assignments` (one of the promoted passes) is
exercised. Excluded (deferred): strings, vectors, chars, flonums, bignums, symbols as
data, top-level `define`, macros, `call/cc`. Assumes alpha-renamed uniqueness is
established by an early rename step (the spike passes assume it).

### D3 — Pipeline and intermediate languages

```
host read → parse to core IL → alpha-rename
  → recognize-let → convert-assignments → convert-closures → lambda-lift
  → closure/allocation lowering → emit .ll → clang(link runtime + libgc) → run
```

Promote the three spike passes as-is (same `match` convention). New work:
`lambda-lift` (L6→L7 analogue: hoist closed code to top level) and lowering closures to
explicit heap allocation + indirect `code_ptr` calls. Each arrow has a named IL,
documented and dumpable (D7).

### D4 — Framework and reuse

Hand-rolled `match` per `docs/PIPELINE.md`. Reuse `spike/nanopass/vendor/match.sls` and
the `util.ss` set helpers; decide whether to copy into `src/` or reference (Open
Questions). The nanopass side of the spike stays as reference only.

### D5 — IR conventions: adopt `LLVM.md` as-is

Tagged-pointer values, heap closures `{ code_ptr, env... }` with indirect calls, a
single internal (non-C) calling convention, `musttail` on tail calls, Boehm GC (phase
1), textual `.ll` with opaque `ptr` (LLVM 22). These are settled in `LLVM.md`; this
change implements them, it does not revisit them.

### D6 — Runtime as linked C, reader as host `read`

A small C runtime provides the primitive set, `cons`/`car`/`cdr`, allocation via
`libgc`, a tag-walking value printer, and `main` (the C-convention entry that calls the
compiled program). C-visible entry points use the C convention and are bridged, per
`LLVM.md`. The reader is host Chez `read` for now; a self-hosting reader is later work.

### D7 — Transparency is a feature, not a nicety

A debug flag dumps the IL after each named pass. This is the concrete form of
`CLAUDE.md`'s "clear stages, logging, transparency" value and the named-IL discipline
`docs/PIPELINE.md` said to keep regardless of framework.

## Risks / Trade-offs

- **`musttail` from day one vs. ordinary calls.** → Emit `musttail` in tail position
  from the start; the recursive demos would blow the stack otherwise, and TCO is a core
  thesis, not an optimization.
- **Vertical slice spans two doc domains (frontend + `LLVM.md`).** → Accept it; the
  point of a walking skeleton is one thin thread through everything. Keep breadth
  minimal so the thread stays thin.
- **Closure lowering + lambda-lift are new (not spike-tested).** → Highest-risk passes;
  build them behind stage dumps and test each in isolation before the full run.
- **Boehm conservative GC hides representation bugs** (a mis-tagged word may still look
  like a root). → Fine for phase 1; note that precise GC later will surface latent tag
  errors.

## Resolved

### R1 — Results observation: tag-walking printer, with exit code split off

The compiled program reports its value via a **tag-walking runtime printer** to stdout;
the **process exit code carries success/failure only** (did it run without error). The
test harness checks the exit code that it ran and asserts the printed value on stdout.

Rationale: exit codes are 8-bit masked (`fact 6 = 720` → `208`) and cannot represent a
pair/bool/`()`, so the `cons` demo could not report `(1 2 3)`. The printer is not extra
work — the runtime must dispatch on tags for every primitive anyway, and a printer is
that same dispatch collected in one place, doubling as a codegen-bring-up debugging
tool. Splitting run-status (exit code) from value (stdout) sidesteps the 8-bit trap.
Chosen over exit-code-only despite the latter's zero-runtime appeal.

### R2 — Box representation: dedicated 1-slot box object

Assignment-converted variables are boxed into a **dedicated 1-slot heap object** with
its own header tag (`box`/`unbox`/`set-box!`), **not** a reused pair.

Rationale: the project's stated value is transparency and simplicity-to-understand
(`CLAUDE.md`). A dedicated box keeps tags honest (`pair?` is false on a box; no
box/pair pun for the printer or a future precise GC to trip on), is the literal
implementation of what the promoted `convert-assignments` already emits (zero
translation), and costs only one tag + one alloc helper + two accessors. Chez reuses
pairs for GC uniformity in a mature system — a reason that does not apply to a walking
skeleton, especially as only `set!`-target variables (a small fraction) are ever boxed.
Reinforces R1: a dedicated box tag lets the printer render/skip boxes correctly.

## Resolved during implementation

- **`match`/`util` placement** → copied into `src/` (`src/match.sls`, `src/util.ss`); the
  production tree does not depend on `spike/`.
- **`src/` layout** → per-pass `.ss` files under `src/passes/`, `include`d into
  `compile.ss` as plain code (not R6RS libraries, avoiding import boilerplate while
  keeping one observable stage per file).
- **Box representation** → R2, dedicated 1-slot box object (confirmed: `rt_box`/`rt_unbox`/
  `rt_set_box`, tag 101).
- **No ANF/normalize step needed** → confirmed empirically. Emitting directly from
  lambda-lifted closures with `if`→branches+`phi` and relying on LLVM SSA/mem2reg worked;
  no `remove-complex-opera*` analogue was written.
- **`musttail` prototype constraint** (discovered) → all Scheme functions share one
  uniform signature `tailcc i64 (i64 self, i64 a0 … a{K-1})`, K = max arity, calls pad
  with 0. Required because LLVM `musttail` demands matching caller/callee prototypes —
  the concrete form of `LLVM.md`'s "single internal calling convention."
- **Toolchain** (deviation) → built on Apple clang 21, not the pinned LLVM 22; functionally
  adequate for M1 (see `src/TOOLCHAIN.md`).
