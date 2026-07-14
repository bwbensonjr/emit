## 1. Gate check (prerequisites)

- [x] 1.1 Confirm all prerequisites are done: [[decompose-core-driver]], [[prelude-cxr-and-case]], [[integer-division-number-format]], [[multiple-values]], [[error-and-guard-conditions]], [[stdin-source-reader]] (plus the completed `match`/syntax-rules and vectors work). — all archived.
- [x] 1.2 Compile the core with scheme-llvm; for any residual unsupported construct, loop back to the relevant prerequisite change and record the gap. — **gaps found (see design.md "Gate-check findings"): G1 internal defines unsupported, G2 emit.ss byte/hex/UTF-8 escaping, G3 path-C I/O shell. Blocks tasks 2–3.**
- [x] 1.3 Audit for output nondeterminism (gensym counter, ordering) that would break the fixed point. — clean: only the reset-per-compile counter; no hashtables/sort/random.

## 2. Stage-1 build (path C)  — BLOCKED on a codegen bug ([[fix-closure-self-compilation]])

G3 ([[self-host-io-strategy]]) is closed and G1/G2/G6–G10 are landed. Building `schemec`
surfaced two self-application miscompilations, both invisible to the demo suite (which only
checks scheme-llvm's *output* for small programs, never scheme-llvm compiling *itself*):

1. **Calling-convention bug — FIXED ([[fix-high-arity-call-convention]], landed).** Calls
   passed `K+3` args (`self`, `argc`, `a0..a{K-1}`, `overflow`); at max-arity `K ≥ 6` that
   exceeds arm64's 8 argument registers and `tailcc` non-tail calls corrupted the caller's
   live args. Fixed by emitting `fastcc`. After this, `schemec` builds and compiles
   closure-free programs byte-identically.
2. **Closure-arity gap — FIXED ([[fix-closure-self-compilation]], landed).** `schemec` failed
   on any closure-producing program (`lambda`/`let`/`letrec`/define-of-procedure) with
   `arity error: expected 2, got 3`. Root cause was **not** codegen: the prelude
   `map`/`for-each`/`append` were fixed-arity, but the core uses multi-list `map`/`for-each` and
   3-arg `append` (Chez's are variadic). Fixed by making them variadic. `schemec` now compiles
   closure/`let`/`letrec`/recursion programs (with `(...)` parens).
3. **Bracket-reader gap — FIXED ([[fix-bracket-reader]], landed).** The prelude reader's
   `rd-datum` had no case for `[` (char 91), so `[...]` syntax mis-read and `schemec` segfaulted
   on the ~529-bracket core. Fixed by accepting `[`/`]` as list syntax. `schemec` now compiles
   bracket programs (incl. `demos/fact.scm`) to correct, runnable IR (fact → 120).
4. **Evaluation-order divergence — FIXED ([[fix-emit-eval-order]], landed).** `schemec`'s IR was
   correct but not byte-identical: temps came out in a different order because the emitter
   sequenced call operands/callee and parallel `let` `fresh-temp` bindings in host
   argument-evaluation order (Chez right-to-left vs scheme-llvm left-to-right). Fixed by
   `let*`-sequencing the call/apply sites and five `emit-*` `let`→`let*` conversions. `schemec`
   and the Chez-hosted compiler now emit **byte-identical IR** (harness `test/self-emit-equiv.sh`;
   `demos/fact.scm` byte-identical).

**All four self-application blockers are closed, and the fixed point is REACHED (2026-07-14).**
Emission is deterministic, so the byte-identical triple test passes: stage-1 `schemec` (Chez-hosted)
compiles the assembled compiler source `T` into stage-2 IR; stage-2 links into `schemec2`, which
recompiles `T` into stage-3 IR; **stage-2 == stage-3 byte-identically (0 diff lines, 2034131 bytes).**
The fixed point is stage-2 == stage-3 (both self-compiled binaries on the same scheme-llvm runtime),
NOT stage-1 == stage-2: Chez and scheme-llvm intern the constant pool in different orders, so
stage-1 legitimately differs (~90k lines) — the compiler converges after one recompile off Chez, not
zero. Committed harness: `test/self-host-fixpoint.sh` (wired into `run-all-tests.sh`). Prelude,
toggle, and REPL-scope decisions are D4/D5 in design.md.

- [x] 2.1 Build the core AOT to a native `schemec` using the Chez-hosted compiler: assemble the
      core with `tools/assemble-core.ss`, append the `(display (compile-source-string
      (read-all-stdin)))` main, AOT-compile with `compile.ss`, and add a `make build/schemec` rule.
      — **Build machinery done** (`make build/schemec`: assemble `--filter-main` → `--emit-ir` →
      link `-DRT_FILTER_MAIN`, all `fastcc`), and `schemec` compiles closure-free programs
      byte-identically (`(+ 1 2)`, `42`, `(if …)`, `(quote …)`). **But NOT functionally complete:**
      `schemec` fails on any program that produces a closure — `arity error: expected 2, got 3`
      for `lambda`/`let`/`letrec`/`define`-of-procedure — and segfaults on recursive `letrec`.
      These are **further self-application miscompilations** (distinct from the fixed `tailcc`
      bug) in `schemec`'s own closure path; scheme-llvm compiles closure programs correctly when
      Chez-hosted (demo `toplevel` etc.), so they surface only under self-compilation. **BLOCKED**
      pending dedicated fixes (see §2 header) — likely a short series, one change each.
      **NB (from [[self-host-io-strategy]] 3.3):** the standard standalone `main` prints the
      program's final value (`rt_write` + newline), which would append `()\n` after the IR. Use a
      **filter-style main that suppresses the final-value print** (or have the driver strip a
      trailing `()\n`) — otherwise stdout carries trailing bytes that break `llvm-as` and the
      byte-identical triple test.
      **Scaffolding done (2026-07-14):** runtime `RT_FILTER_MAIN` (suppresses the value print) and
      `tools/assemble-core.ss --filter-main` (emits `build/schemec.scm` with the filter entry) are
      in place; the build itself is BLOCKED on [[fix-high-arity-call-convention]] (see §2 header).
- [x] 2.2 Wire the **batch** driver to invoke `schemec` (text→IR) instead of the in-process core
      (D4): toggleable `SCHEMEC`/`--via-schemec` path in `compile-file`; driver merges the prelude
      (`with-prelude`) and pipes merged text to `schemec`; `host-target-header` + toolchain
      unchanged; in-process path retained for bootstrapping and fallback.
      — **Wiring code implemented** (`compile.ss`: `--via-schemec`/env `SCHEMEC`,
      `forms->ir-via-schemec` writes merged forms to the `schemec` co-process and reads IR back).
      Cannot be end-to-end verified against real demos until 2.1's closure miscompilations are
      fixed (every demo has closures). NB: chez `process` merges the child's stderr into the
      captured stdout — separate stderr before trusting captured IR (a `2>` redirect, as
      `run-repl` does).
  - [x] 2.2a (REPL) Do **not** wire the REPL to `schemec` (D5). Record that the REPL stays on the
        Chez front-end through path C and moves off Chez via path A (task 4.2), noting the
        entry points path A must drive (`repl-lcode` / `emit-repl-module` / `emit-repl-batch`).
- [x] 2.3 Confirm program results are unchanged under the `schemec` path: `schemec`'s IR is
      byte-identical to the Chez-hosted compiler's for the self-emission probe set
      (`test/self-emit-equiv.sh`: plain/nested call, closure capture, recursion, apply — all
      byte-identical), and the full compiler source `T` recompiles to a fixed point (2.1/§3).

## 3. Fixed-point (triple) test

- [x] 3.1 Compile the compiler source `T` with stage-1 `schemec` to produce stage-2 IR, link
      `schemec2` from stage-2, and recompile `T` to produce stage-3 IR.
- [x] 3.2 Require **stage-2 == stage-3** to be byte-identical (the fixed point across self-compiled
      binaries; stage-1/Chez legitimately differs). Achieved 2026-07-14: 0 diff lines, 2034131 bytes.
      The residual eval-order divergences were chased to their sources and fixed ([[fix-emit-eval-order]]
      plus the final `ev-if`/`et-if` `let`→`let*` completion).
- [x] 3.3 Add the triple test to the suite as the self-hosting regression:
      `test/self-host-fixpoint.sh`, wired into `run-all-tests.sh` ("self-hosting fixed point").

## 4. Policy + follow-up

- [x] 4.1 Decide the stage-0 artifact policy (D3): **(a) always bootstrap from Chez** for now — the
      build re-derives `schemec` from source each time (`make build/schemec`), and no stage-0
      `.ll`/native binary is checked in. Simpler, and Chez stays a build-time dependency only.
      Revisiting with (b) a checked-in stage-0 (Chez-free build) is deferred to a future change now
      that stage-1 is stable.
- [x] 4.2 Path A (in-process embedding of the compiled compiler in the host, the REPL's route off
      Chez per D5) is recorded as a **separate follow-up change** — out of scope here. Concrete entry
      points it must drive (`repl-lcode` / `emit-repl-module` / `emit-repl-batch`) are captured in
      design.md D5.
