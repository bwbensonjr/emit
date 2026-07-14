## Context

Self-hosting decomposes into (see the exploration): grow/avoid/downgrade the remaining Chez
dependencies until the core is expressible, then compile the core with itself. The `match`
and vectors steps are done; the other prerequisites are proposed. This change is the join
point that verifies the whole thing.

## Goals / Non-Goals

**Goals:** a stage-1 `schemec` produced by the Chez-hosted compiler; the driver/host using it
instead of Chez (path C); a byte-identical fixed-point proof.

**Non-Goals:** in-process embedding (path A) — end state, likely a follow-up; removing Chez
from the *build* entirely (stage-0 artifact policy is an open question); self-hosting the
driver (it stays Chez/bash by design — [[decompose-core-driver]]).

## Decisions

### D1: Path C before path A

Compile the core AOT to `schemec` and have the driver/REPL host shell out to it per program/
form (replacing `chez … compile.ss`). This removes Chez at compile time with far less
integration than embedding, and is a stepping stone to A. A survives in spirit from
`interactive-repl` D4 (loop logic in Scheme, thin host) — just compiled Scheme, not Chez.

### D2: Fixed-point (triple) test is the acceptance criterion

Stage-1 = core compiled by Chez-hosted compiler. Stage-2 = core compiled by stage-1
`schemec`. Require `diff` of the emitted IR to be empty. Non-identical output means a
self-application bug (name gensym nondeterminism, ordering, etc.) to chase down. This is the
definition of done.

### D3: Bootstrap-artifact policy (open)

Either (a) always bootstrap from Chez until the language is fully self-sufficient, or (b)
check in a stage-0 `.ll`/native `schemec` so the build no longer needs Chez. Decide when
stage-1 is stable; (a) is simpler initially.

### D4: The driver owns the prelude; the `schemec` path is toggleable (task 2.2)

A native `schemec` is a pure text filter with no filesystem and no `argv` (the language has
neither), so it can neither read `src/prelude.scm` itself nor honor `--no-prelude` on its own.
Therefore the **driver keeps ownership of the prelude**: it reads the prelude file, applies the
existing form-level `with-prelude` (user-wins shadowing) in Chez, and pipes the *already-merged*
source text to `schemec`. `schemec` stays the dead-simple `(display (compile-source-string
(read-all-stdin)))` filter that `self-host-io-strategy` task 3.3 hands off — no prelude or flag
logic inside it. (Alternative: bake the prelude into `schemec` at build time; rejected — it
loses `--no-prelude` and adds internal complexity for no gain.)

The forms→IR step in `compile-file` becomes **toggleable** (env `SCHEMEC=<path>` or a
`--via-schemec` flag): when routed through `schemec`, the driver does the prelude merge, `write`s
the merged forms to text, pipes that to `build/schemec` (Chez `process`), and reads the IR back
from stdout; it then prepends `host-target-header` and runs the toolchain exactly as today. The
in-process path is not removed — it is needed to *build* `schemec` (Chez builds stage-1;
`schemec` cannot build itself until the triple test passes) and as a fallback. The default can
stay in-process until task 2.3 proves byte-parity. `schemec` emits only core IR (no target
header), matching today's `--emit-ir` filter; the header and toolchain stay in the driver.

### D5: The REPL defers to path A; no `schemec` REPL protocol (scope of task 2.2)

Task 2.2 wires the **batch driver** to `schemec` (path C). The **REPL is not wired to
`schemec`** and stays on the in-process Chez front-end for now. The REPL does not use the
whole-program `compile-forms` that the `--emit-ir` filter exposes; it uses incremental per-form
entry points (`repl-lcode` / `emit-repl-module` / `emit-repl-batch`) with cross-module
`@__repl_N` linkage and a live session env, and the C++ host never calls Chez (the Chez
front-end computes IR and feeds it over a wire). Two ways off Chez:

- **R1 (rejected): a `schemec` incremental protocol.** Grow `schemec` into a stateful
  co-process that holds the REPL session env and emits per-form modules over a wire protocol.
  This ports `run-repl`'s front-end into compiled Scheme and is thrown away once path A lands.
- **R2 (chosen): defer to path A.** The REPL stays on the Chez front-end until path A embeds the
  *compiled* core directly in the C++ host, which then drives compiled `repl-lcode` /
  `emit-repl-module` / `emit-repl-batch` across the JIT boundary. The design already names path A
  as the REPL's destination and "thin host, loop logic in compiled Scheme" as the end state
  (D1); R1 is effort that R2 subsumes. Path A remains the existing follow-up (task 4.2), now with
  the concrete entry points it must call recorded here.

## Risks / Trade-offs

- **Nondeterministic output breaks the fixed point** → the compiler already uses a
  deterministic gensym counter (`util.ss reset-counter!`); audit for any remaining ordering/
  hash nondeterminism before the triple test.
- **A prerequisite turns out insufficient** → the gate check (task 1) catches "core still
  uses X" before attempting the build; each gap loops back to its step's change.

## Migration Plan

Ordered end-to-end; the first step is a hard prerequisite outside this change.

1. **I/O primitives ([[self-host-io-strategy]], closes G3).** Add `rt_read_all_stdin` /
   `rt_display` and register `read-all-stdin` / `display`. Without these the standalone filter
   is not buildable at all. (Gate check otherwise complete: G1/G2 and G6–G10 are landed; the
   nondeterminism audit is clean.)
2. Build stage-1 `schemec` (task 2.1): assemble the core (`tools/assemble-core.ss`), append the
   `(display (compile-source-string (read-all-stdin)))` main, and AOT-compile it with the
   Chez-hosted `compile.ss`; add a `make build/schemec` rule.
3. Wire the **batch** driver to `schemec` (task 2.2, D4): toggleable `SCHEMEC`/`--via-schemec`
   path in `compile-file`, driver-owned prelude merge, header + toolchain unchanged.
4. Confirm parity (task 2.3): schemec-path IR byte-identical to the in-process path for every
   demo; program results unchanged across all three backends.
5. Run the triple test (task 3); require byte-identical stage-1/stage-2 IR.
6. Decide the stage-0 artifact policy (D3).
7. (Later, separate change) path A: embed the compiled compiler in the host — the REPL's route
   off Chez (D5).

## Gate-check findings (2026-07-14, task 1.1–1.3)

Prerequisites are all archived (1.1 ✓). Nondeterminism audit is clean (1.3 ✓): the only
gensym is `util.ss`'s reset-per-compile monotonic counter; no hashtables, `sort`, `random`,
or symbol-hash anywhere in the core. Output is deterministic, so the fixed point is
attainable on that axis.

But the empirical compile (1.2 — feeding core constructs through `chez … compile.ss`)
found the core is **not yet compilable by scheme-llvm**. Three residual gaps, each loops
back to a (new) prerequisite change; **tasks 2.x–3.x are blocked until they close**:

- **G1 — internal `define` is unsupported (major, unanticipated).** ✅ **CLOSED** by
  [[internal-defines]]: `parse-body` now peels a leading run of body defines and
  builds them via the same `build-program` transform the top level uses (`letrec*` semantics).
  The exact gate probe that failed (`(define (f x) (define (g y) …) …)`) now compiles.
- **G2 — `emit.ss` byte/UTF-8/hex escaping.** ✅ **CLOSED** by [[emit-cstring-in-language]]:
  `hex2`/`llvm-cstring` are rewritten over `string-ref`/`char->integer` + `quotient`/
  `remainder` (hex-digit table + in-language UTF-8 encoder), dropping `string->utf8`,
  `bytevector-*`, radix `number->string`, `string-upcase`, and the `#x` literals. Emitted IR
  is byte-identical (verified new-vs-old, incl. a 4-byte codepoint).
- **G3 — path-C standalone I/O shell.** A native `schemec` filter must read all of stdin
  into a string and write the IR string to stdout, but the language has no stdin-read or
  raw string-write (`display`) primitive — the runtime only has `rt_write` (values, quoted).
  This is an architectural fork: **(a)** grow two I/O primitives so the assembled core + a
  thin `main` compiles to a standalone `schemec`, or **(b)** skip standalone `schemec` and go
  straight to path A (embed the compiled core in the C++ host, which does the I/O and passes
  strings across the JIT boundary — no language I/O primitives). D1 chose path C; G3 is the
  cost of that choice.

Assembly work also remains (independent of the gaps): de-`library` `match.sls`/`util.ss`
into top-level `define-syntax`/`define`s, concatenate the `include`d passes into one program,
and switch `core.ss`'s `read-forms` (Chez `read`/`open-input-string`) to the in-language
`read-all-from-string` ([[stdin-source-reader]], done).

**Additional latent gaps (found while closing G1/G2 — the initial 1.2 probe was shallow, a
static scan + spot compiles; these surface only at a full core compile / the triple test):**

- **G4 — `apply` over the binary `string-append` primitive.** The core uses
  `(apply string-append <list>)` pervasively (esp. `emit.ss`), but scheme-llvm's
  `string-append` is the 2-arg runtime primitive with no variadic/prelude wrapper, so
  `apply`ing it over N args would arity-error. Fix: a prelude variadic `string-append` (fold
  the binary primitive), or a `string-concat`/`string-join` the emitter uses instead.
- **G5 — `#x` hex literals outside the escaping.** The in-language reader (`rd-*`) parses only
  decimal integers, `#t`/`#f`, `#\`, `#(`; it does not read `#x…`. Any remaining `#x` literal
  in the core source (several across the passes) is unreadable by a self-hosted `schemec`.
  Fix: grow the reader to accept `#x`/`#b`/`#o` (small `rd-*` extension), or convert the core's
  `#x` literals to decimal.
- Likely more of the same class (e.g. `andmap` and other R6RS list procs the passes assume) —
  enumerate them with a full assembled-core compile once G3/G4/G5 are in.

A dedicated gap-sweep ([[self-host-gap-sweep]] — assemble the whole core, compile, log each
error, repeat) should precede task 2.1; it produces the complete G3–Gn backlog and the
reusable assembly script, and each recorded gap becomes its own small prerequisite change.

**Recommendation:** this umbrella change is correctly gated and should stay open/blocked.
Land `internal-defines` (G1) and `emit-cstring-in-language` (G2) as new prerequisite changes,
resolve the G3 path-C-vs-A fork, then resume at task 2.1.

## Gap sweep results (2026-07-14, [[self-host-gap-sweep]])

The sweep is done: `tools/assemble-core.ss` produces `build/core-self.scm` (the whole core as
one program; sanity-checked byte-identical to the reference core, task 1.1–1.2), and that file
was compiled with scheme-llvm, applying minimum shims and logging each gap until it **compiled
clean end-to-end** (exit 0, ~1.98 MB of IR that `llvm-as` parses). The backlog below is now
finite and sized. Method note: the shims lived in a throwaway sandbox (`build/sweep/`), never
in `src/`; the assembly script's one real transform beyond de-`library`ing is renaming `match`'s
library-internal helper `match-pat` (it collides with `expand.ss`'s `match-pat` function once
flattened) — done in the script, not the core.

**Status of previously-listed gaps:**

- **G4 (apply over binary `string-append`)** — subsumed by **G8** below; it is one instance of
  the general "primitive used as a first-class value" gap.
- **G5 (reader / `#x` literals)** — ✅ **effectively CLOSED for the core.** No `#x`/`#b`/`#o`
  literals remain in any core source (`emit-cstring-in-language` removed the last ones), and the
  in-language `read-all-from-string` reads **all 149 forms of `core-self.scm` and all of
  `prelude.scm`** exactly as Chez does — `[...]` brackets, dotted pairs, negative numbers,
  `#\name` chars, and `#;` datum comments all work. The only unsupported reader feature is
  `#| ... |#` block comments, and the core uses none. No reader change is needed to self-host.

**Newly enumerated gaps (G6–G10), each sized + fix path:**

| Gap | Construct | Where | Class | Fix path | Size |
|-----|-----------|-------|-------|----------|------|
| **G6** | scheme-llvm's quasiquote expander `qq` crashes (`cadr` on a bare `(unquote)`) when a quasiquote template contains the literal symbols `unquote`/`unquote-splicing`/`quasiquote` as list *data* — e.g. `` `(list (quote unquote) ,x) `` | `src/passes/expand.ss` `qq` (lines ~281–290); the crashing source is the expander's own nested-quasiquote handling | unsupported special form (expander bug) | **grow language**: guard each head check with `(pair? (cdr d))` so a bare `(unquote)` falls through to general-pair building | tiny (3-line guard) |
| **G7** | 2-armed `if` (`(if c t)`, no else) | `parse-expr` accepts only `(if a b c)`. Hit by the `(if #f #f)` void idiom (`core.ss` `no-dump`, one `emit.ss` site) **and pervasively by the `case` macro's no-`else` default** (`prelude.scm` `case` base case `((_ k) (if #f #f))`, used by `expand-arith`/`cmp-pair`) | unsupported special form | **grow parser** (default a missing else to the unspecified value) — cleanest, fixes `case` too. Alt: patch the `case` macro + rewrite the ~2 void-idiom sites | small |
| **G8** | Primitives used as first-class values: `car`, `cons`, `string-append` passed to `map`/`apply` (`(map car …)`, `(map cons …)`, `(apply string-append …)`). Prims are reserved keywords, so a bare reference is unbound. Subsumes **G4**. | `parse.ss`, `emit.ss`, `expand.ss`, `convert-*` (all the `(map car binds)` sites); `apply string-append` throughout `emit.ss` | missing prelude proc / language | **grow prelude**: eta-expanding wrappers named after the prims — `(define (car x) (car x))`, `(define (cons a b) (cons a b))` — plus a **variadic `string-append`** that folds the binary primcall (a 2-arg call in its body stays a primcall). Bare refs then resolve to the wrapper; call sites keep the fast primcall | small–medium |
| **G9** | Missing type-predicate primitives: `symbol?`, `string?`, `char?`, `boolean?`, `integer?`, `exact?` | `parse-expr`'s literal/self-eval dispatch and `param-*`/`rename` use them pervasively | missing primitive (needs runtime tag check) | **grow language + runtime**: add `rt_*_p` primitives and `prim-table`/`*prims*` entries (mirror the existing `pair?`/`null?`/`vector?`) | medium (6 preds + runtime) |
| **G10** | Missing prelude list/utility procedures: `andmap`, `memp`, `for-each`, `cadddr`, `list?`, `list-ref`, `list-tail`, `list-head`, `make-list`, `iota`, `max`, `zero?`, `void`, and the 1-char `string` constructor | used across `parse.ss` (`andmap`), `expand.ss` (`memp`, `for-each`, `iota`), `emit.ss` (`string`, `for-each`, list ops) | missing prelude proc | **grow prelude**: all expressible in pure Scheme over existing prims (straightforward) | small each; ~14 procs |

**No deep gap reshapes the plan.** The core uses **no records** (no `define-record`), **no
hashtables/`sort`/`random`** (confirms the clean nondeterminism audit — the fixed point stays
attainable), and **no `call/cc`/`dynamic-wind`/`values`**. The full pipeline emitted valid IR
without any tail-call-depth or closure-limit complaint at compile time. **Path C stays viable**;
nothing here argues for path A. (Runtime tail-call behavior of the *self-compiled* core is still
unverified — that is the actual stage-1 build + triple test, task 2.x.)

**Suggested ordering for the stage-1 build (task 2.1):** G6 → G7 → G9 (unblock the front end),
then G8 + G10 (grow the prelude), then G3 (path-C I/O shell). None are large; each becomes its
own small prerequisite change, exactly as G1/G2 were. The assembly script
(`tools/assemble-core.ss`, sanity `tools/assemble-sanity.ss`) is reused by task 2.1 to build the
real `schemec`.

## Open Questions

- Stage-0 artifact policy (D3).
- Does any pass rely on Chez evaluation order / non-guaranteed behavior that self-compilation
  would expose?

(Resolved: where the REPL loop lives after self-hosting — decided by D5. The REPL stays on the
Chez front-end through path C and moves off Chez via path A, where the thin host drives the
compiled `repl-lcode` / `emit-repl-module` / `emit-repl-batch` entry points.)
