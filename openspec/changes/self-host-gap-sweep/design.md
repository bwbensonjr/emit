## Context

The core is deliberately I/O-free and `include`-assembled under Chez (`core.ss` includes the
passes; `compile.ss` is the driver). To compile the core *with scheme-llvm*, it must first
become one program in the accepted subset: no `(library …)`/`(import …)`/`(include …)`, macros
as top-level `define-syntax`, and the string-port reader swapped for `read-all-from-string`.
That assembly is a prerequisite for the sweep and is reused by [[self-hosting-bootstrap]]
task 2.1 to build the actual `schemec`, so it is worth doing as a script, not by hand.

## Goals / Non-Goals

**Goals:** a repeatable core-assembly script; a real end-to-end compile of the assembled core
with scheme-llvm; a complete, sized inventory of every remaining unsupported construct.

**Non-Goals:** fixing the gaps (each is its own change), building/running the `schemec` (that
is [[self-hosting-bootstrap]] task 2.x, and needs G3 I/O), the fixed-point/triple test.

## Decisions

### D1: Assemble via a script, not by hand

A script emits `build/core-self.scm` = `match` `define-syntax` forms ++ `util` defines ++ each
pass file (verbatim, they are already bare top-level defines) ++ `core.ss` pure helpers (with
`read-forms`/`read-forms-from-string` redefined over `read-all-from-string`). Keeping it
scripted means every gap fix downstream re-assembles cleanly and the same script feeds the
real build. De-`library`ing `match.sls`/`util.ss` is the only non-trivial transform (strip the
`(library … (export …) (import …)` wrapper and its closing paren).

### D2: Sweep = compile, log, advance

Compile `build/core-self.scm` with `chez … compile.ss` (the language front end). On the first
unsupported-construct error, record: the construct, where it occurs, the class (missing
primitive / missing prelude proc / unsupported special form / reader gap), and the cheapest
fix path. To reach the *next* error, apply the **minimum** unblock — prefer a throwaway shim in
the assembly script over editing the real core — unless the fix is a trivial, obviously-correct
prelude addition already destined to land (then do it and note it). Repeat until the core
compiles or the remaining work is clearly enumerated.

### D3: Inventory lands in self-hosting-bootstrap

The deliverable is the updated gap table in `self-hosting-bootstrap/design.md` (G3–Gn, each
sized + fix path), plus the checked-in assembly script. That converts "unknown unknowns" into a
finite backlog and lets us decide ordering (and whether any gap argues for path A over path C).

## Risks / Trade-offs

- **The sweep uncovers a deep gap (records, tail calls in passes, closure depth)** → better to
  know now; it may reshape the plan (e.g. favor path A). That discovery is the point.
- **Assembly drift vs the real build** → the same script is reused by
  [[self-hosting-bootstrap]] 2.1, so it cannot silently diverge.
- **"Minimum unblock" shims masking a real gap** → every shim is logged as a gap; shims live in
  the assembly script, never silently in the core.
