## 1. Pin the current behaviour

- [x] 1.1 Record the pre-change baseline: `./run-all-tests.sh` and `./run-dev-tests.sh` both green,
      with timings; note that `bootstrap/` and `test/module-scaffold-baseline.sha256` are clean.
      **Baseline:** `run-all-tests.sh` 20 suites / 0 failed / 331s; `bootstrap/` and the baseline
      sha are clean. `run-dev-tests.sh` recorded separately (long-running).
- [x] 1.2 Inventory every in-tree use of the sixteen relocated names outside `src/prelude.scm`
      (`demos/`, `test/`, `docs/`, `lib/`) so step 5's sweep has a checklist. Expect the compiler's
      48 `caddr`/`cadddr`/`cdddr` sites (nine `CORE_FLAT` files) and `src/repl-core.ss`'s nine
      `rd-skip-ws`/`rd-token-end` sites — both are handled by the substrate import, not by edits.
      **Inventory.** The users split cleanly in two:
      *Chez-hosted, UNAFFECTED* (they run under Chez and bind Chez's own `read`/`open-*-file`, not
      the prelude's): `src/compile.ss`, `tools/gen-scheme-base.ss`, `test/repl.ss`,
      `test/repl-batch.ss`, `test/repl-frames.ss`, `test/repl-frontend.ss`, `test/dump-parity.ss`,
      `historical/genesis/*.ss`.
      *Emit-compiled, NEED IMPORTS in 5.5*: `demos/case-cxr.scm` (cxr), `demos/ports.scm`
      (`open-input-file`, `open-output-file`, `read`), and `test/io-ports-tests.sh` — the largest
      item, ~20 embedded programs using the file procedures and `read`.
      *Compiler core, handled by the substrate import, no edits*: `src/emit.ss` (10),
      `src/parse.ss` (9), `src/core.ss` (8), `src/passes/lower.ss` (5), `src/repl-core.ss` (3),
      `src/passes/expand.ss` (2), `simplify.ss`/`convert-closures.ss`/`convert-assignments.ss` (1
      each) for cxr; `src/repl-core.ss` for the two reader helpers.
- [x] 1.3 Confirm against `docs/r7rs/` whether `(scheme cxr)` is specified to export *only* the
      depth-3+ forms or also re-offer the depth-2 four (design open question 2), and record the
      answer in the design.
      **Answered** (`docs/r7rs/09-standard-libraries.md:190-215`): `(scheme cxr)` exports
      **twenty-four** procedures, the compositions of three to four `car`/`cdr` operations, and
      "the procedures `car` and `cdr` themselves and the four two-level compositions are included
      in the base library" — so the depth-2 four stay in `(scheme base)` and are NOT re-offered.
      Design open question 2 is closed. This also surfaced that Emit defines only 9 of the 24 →
      new decision **D9** (complete the library; task 5.1b).

## 2. Partition map (behaviour-preserving)

- [x] 2.1 Rewrite `src/prelude-surface.scm` from a subtraction set into a partition map: each
      prelude definition assigned to the library that exports it, or marked as belonging to no
      export list. Support assigning one definition to **two** libraries (needed in 4.2/4.3).
- [x] 2.2 Rewrite that file's header: it documents that list ordering is free "because this is a set
      to SUBTRACT", an invariant this change replaces. State the new one — order comes from the
      prelude, assignment comes from here.
- [x] 2.3 Assign every name to `(scheme base)` for now, so the surface is unchanged. Both guards
      (`test/scheme-base-surface-check.sh`, `test/scheme-base-gen-check.sh`) must pass untouched,
      and `git diff lib/scheme/base.sld` must be empty.

## 3. N-library baked form (behaviour-preserving)

- [x] 3.1 Generalize `scheme-base-library-form` (`src/core.ss:153`) from one hardcoded
      import-free `(scheme base)` to emitting the declared partition in dependency order, each
      member with its own exports, body, and imports. Make `scheme-base-export-names` per-library.
- [x] 3.2 Teach `tools/gen-scheme-base.ss` to emit one `.sld` per partition member instead of one
      file, and `test/scheme-base-gen-check.sh` to diff all of them.
- [x] 3.3 With the partition still one member, verify nothing moved: full `./run-all-tests.sh` and
      `./run-dev-tests.sh` green, `git diff bootstrap/ lib/scheme/base.sld` empty, no baseline
      re-record. **Do not proceed until this holds** — it is what proves the generalization is
      behaviour-preserving before anything relocates.
      **Gate now holds; the anomaly is resolved.**
      (a) *The task's own wording was wrong:* `git diff bootstrap/` can never be empty, because
      `src/prelude-surface.scm` and `src/core.ss` are compiler source in `CORE_FLAT` — adding a
      function to the compiler necessarily changes the compiler's IR. The real gate is:
      `scheme.base.ll`, `base.sld` (content) and `module-scaffold-baseline.sha256` unmoved, both
      suites green.
      (b) *The +186-function anomaly was my own bug, found by bisection.* I had added
      `(define (define-syntax-form? f) (and (pair? f) (eq? (car f) 'define-syntax)))` to
      `src/core.ss` — but that function **already exists**, byte-identical, at
      `src/passes/expand.ss:34`, and `expand.ss` precedes `core.ss` in `CORE_FLAT`. It was a
      redefinition of a compiler-internal function.
      Emit supports top-level redefinition, so a redefined name loses its direct-call
      optimization: every call site goes indirect through a mutable global and materializes
      closures that were previously direct calls. `define-syntax-form?` is called from the
      expander, so the de-optimization fanned out across the whole compiler — **+186 LLVM
      functions (679 -> 865), +18% IR, from one duplicated four-line definition.**
      *Chez-gated confirmation (2026-08-04, after the fix + regen):* `./run-dev-tests.sh` 20
      suites / 0 failed / 1158s, including the self-hosting fixed point (243s), `--dump` parity,
      and the anti-stale trust-check (535s). Working tree clean afterwards. The handoff note's
      "run this first" item is discharged.
      Bisected with seven variant compiles of the flat source against one fixed compiler:
      A (export derivation) 679, E (+partition-library-form/assoc) 679, F (+library-body-forms)
      679, G (+`define-syntax-form?`, *uncalled*) **857**, H (same body renamed `macro-form?`)
      **679**. Same body, different name, 178-function difference — which located it exactly.
      Fix: delete the duplicate and use the existing one. The flat source then emits 679
      functions, identical to baseline.

## Notes carried forward (from the 2026-08-04 handoff, now discharged)

The handoff's "run `./run-dev-tests.sh` before task 4.1" item is **done** — result recorded in 3.3.

**Two corrections to this plan, learned by implementing it:**
- Task 3.3's "`git diff bootstrap/` empty" is unsatisfiable and should be read as: `scheme.base.ll`,
  `base.sld` content, and `module-scaffold-baseline.sha256` unmoved, both suites green.
- Step 4's body partitioning needs the model already built in step 2: home (`prelude-homes-of`) and
  visibility (`prelude-exports?`) are separate axes, and each member's body carries **every** macro
  (they are lifted before lowering, so they cost no emitted code, and the reader's procedures use
  `cond` internally).

**Watch for:** a duplicate top-level name in `CORE_FLAT` costs ~18% compiler IR with no diagnostic
(issue #38). Before adding a helper to `src/core.ss` or `src/prelude-surface.scm`, grep the other
`CORE_FLAT` files for the name — `expand.ss`, `parse.ss`, and `util.scm` already carry many small
predicates.

## 4. The substrate (behaviour-preserving for user programs)

**Design amended before this step (2026-08-04, new decision D10).** Sizing `(emit internal)` showed
the design's "move the port group and the reader down" does not close: the substrate is the *lower*
layer (D2), so it cannot import `(scheme base)` back, and its body reaches 22 base-exported names —
two of them `error`/`raise`, which reach `*handlers*`. `*handlers*` can neither come along (base's
`with-exception-handler`/`raise` `set!` it, and `assign-global` at `src/parse.ss:754` rejects
assigning an imported binding, by design, with a test) nor be duplicated (that splits the handler
chain, so `(guard (e (#t 'caught)) (read-char 5))` would stop being caught). D10's fix: the two
stateless port guards `%check-input-port`/`%check-output-port` stay with their consumers instead of
moving down, and the substrate then closes with **zero** references to the exception machinery. Sizes
and the rejected alternative are in D10; D1 and D7 are amended.

- [x] 4.0 Add the **per-library visibility axis** to the partition map (design D7 as amended): an
      assignment records, for each library, whether that library exports the name or merely defines
      it. Needed because the substrate defines nine names `(scheme base)` also exports, and anything
      importing both would otherwise get one name from two imports — silent shadowing in
      `import-tables->env-alist` (`src/core.ss:420`), not an error. Thread it through
      `prelude-exports?` and both derivations.
- [x] 4.1 Add `(emit internal)` as a partition member, ordered **before** `(scheme base)`, which
      imports it. Its body is **54** definitions: the 36 names hidden in `(scheme base)` today (31
      `rd-*`, `%port-buf`, `%make-port`, `%port-rtd`, `%port-rtd-cell`, …) plus 4.2's 18. Verify a
      user program still cannot see any of them.
      **Do NOT move `%check-input-port`/`%check-output-port`** — D10; they stay homed in
      `(scheme base)` and gain a second home in `(scheme read)` at 5.2.
      **`%port-rtd-cell` and `%port-rtd` must be single-homed here**, together: record types are
      compared by object identity (`rt_make_record_type`, `src/runtime/runtime.c:1299`), so two cells
      would be two disjoint port types, and the cell is written only by `%port-rtd`, which must
      therefore sit in the same unit.
- [x] 4.2 Give `(emit internal)` the 18 base-exported definitions its body needs. Nine are
      **exported** by it — the `cxr` forms `caaar caadr cadar caddr cdaar cdadr cddar cdddr cadddr`,
      dual-assigned so the compiler's 48 call sites keep resolving while `(scheme base)` still
      exports them at this step (D6). Nine are **defined but not exported** (4.0's axis): `length`
      `list` `reverse` `list->vector` `list->bytevector` and the depth-2 `caar cadr cdar cddr`.
- [x] 4.3 Move `rd-skip-ws`/`rd-token-end` into the substrate and delete
      `*scheme-base-unstable*` and its prose (design D8 — the consumer is `src/repl-core.ss`, not a
      macro template, per `src/prelude-surface.scm:51-52`). Retire the tier's guard assertion at
      `test/prelude-base-run-tests.sh:63`.
- [x] 4.3b Finish task 3.2's second half: `test/scheme-base-gen-check.sh` still regenerates to one
      temp file and diffs `lib/scheme/base.sld` only. With N>1 the generator writes each member to
      the path its partition entry declares, so the guard must diff **every** generated `.sld`.
- [x] 4.4 Add `(import (emit internal))` to the compiler's flat source (`tools/regen.sh`'s
      `CORE_FLAT` assembly) and confirm the bootstrap orders the substrate before `(scheme base)`.
      Note `compile-source-rehomed` (`src/core.ss:206`) hands the program a fixed
      `(list '(scheme base))`, ignoring the program's own `import` forms — so the emit-boot path must
      learn to resolve a program's import against the baked set for this to take effect.
- [x] 4.5 `(emit internal)` **is** listed in `emit-libs.scm`, with a generated on-disk
      `lib/emit/internal.sld` beside its baked twin (open question 1, now answered in the design):
      the REPL door resolves `(scheme base)` from the manifest (`src/emit.cpp:811`, mode 5 → mode 4),
      so `base.sld`'s new import must resolve there or the REPL has no standard library. Also extend
      `make install`: `SLDS` globs `lib/scheme/*.sld` only (`Makefile:164`), which does not reach
      `lib/emit/`.
- [x] 4.6 Re-record `test/module-scaffold-baseline.sha256` **here**, with the delta explained per
      that script's header protocol — unit boundaries and `__init` order moved. This is the one
      re-record; keep it to this step so it has a single explanation.
- [x] 4.7 Both suites green, including the self-hosting fixed point and the anti-stale trust-check.
      Add a check that an error signalled from substrate-backed machinery is still catchable by
      `guard` (D10's regression case), and that a `(scheme file)` port is accepted by `(scheme base)`
      procedures once 5.2 lands.
      **Found and fixed a latent correctness bug here**, `src/compile.ss`'s AOT tree-shake. It
      guards "prune only a unit no OTHER unit imports", but tested library names -- which are
      *lists* of symbols -- with `memq`. `order`/`direct-imports` come from the toposort and the
      program's source; `imported-by-unit` is built from each `.sld`'s parsed import clause, so the
      lists are `equal?` and never `eq?`. The guard therefore never fired. That was unreachable
      while no shipped library imported another; `(scheme base)` importing the substrate reached it,
      and the substrate was pruned of the reader bindings `(scheme base)` calls -> undefined symbols
      at link time, surfacing as the Chez stage-1 of the fixed point failing to link. Fixed to
      `member`. Note only the *Chez driver* tree-shakes -- the Chez-free `emit build` passes no
      `keep-roots` -- so the fix is one line plus its comment, and `src/compile.ss` is not in
      `CORE_FLAT`, so it needed no regen.
      **Result:** `./run-all-tests.sh` 20 suites / 0 failed / 310s; `./run-dev-tests.sh` 20 suites /
      0 failed / 1137s, including the self-hosting fixed point (249s -- stage-2 == stage-3 and both
      baked modules independently re-derived) and the anti-stale trust-check (503s). The two
      substrate-specific checks 4.7 asks for were verified by hand and are 6.x's to make permanent:
      `(guard (e (#t 'caught)) (read-char 5))` and a closed-port `read` are both still caught, and a
      program importing nothing runs from a directory with no manifest.

### What step 4 actually cost, beyond the plan

The task list treated 4.4 as "add one `import`". It is that plus a **second baked module everywhere
one was assumed**, which the plan did not enumerate. For the record, and because step 5 adds no new
baked members and therefore needs none of it again:

- **The lone-`define-library` path cannot compile a baked member any more.** `compile-library-form`
  (`src/core.ss:88`) passes `'()` import tables — "import-free libraries only", as its own comment
  says — so `emit-boot --emit < lib/scheme/base.sld`, which is how `tools/regen.sh` used to produce
  `scheme.base.ll`, stopped working the moment `base.sld` gained an import. The set now comes out of
  the compiler's own whole-program `--emit` stream, split on the boundary marker. That is strictly
  better: the members and the program that references them are consistent by construction.
- **"Everything after the marker" is no longer the program.** Six places sliced a stream on the
  FIRST boundary: `tools/regen.sh`, `test/self-host-fixpoint.sh`, `src/run-boot.cpp`,
  `test/prelude-base-run-tests.sh`, `test/cross-unit-direct-call-tests.sh`,
  `test/library-toplevel-set-tests.sh`. With N members the program is the LAST part. `src/emit.cpp`
  needed the mirror change: mode 8 returns N modules joined by the marker, and the host splits them
  into separate entries before adding them to the JIT or handing them to clang.
- **A partition change needs two regen iterations, and the loop must tolerate that.** The seed
  compiler carries the OLD declaration, so iteration 1 emits the old set while compiling a source
  that declares the new one. `split_units` therefore counts members from the stream, not from
  `BAKED_LL`; `BAKED_LL` is checked against the CONVERGED count. Converged in 2 iterations, 501s.
- **Every manifest that lists `(scheme base)` must now also list `(emit internal)`** — eleven
  fixtures across `test/`. This is the one genuinely unsatisfying consequence: an internal library
  became something a hand-written manifest has to name. See the follow-up note below.
- `scheme-base-export-names` and `scheme-base-library-form` fell dead and were deleted (an unused
  top-level name still costs IR, issue #38).

**Measured result.** Fixed point in 2 iterations. `scheme.base.ll` 512,594 -> 367,451 B, new
`emit.internal.ll` 170,716 B (+25,573 B net, the 18 definitions D10 sizes). Program modules moved by
exactly +2/-2 lines each across all 80 demos — the two dropped `external global` declarations for the
retired tier, and the substrate's `__init` declare + call — and nothing else. Verified: substrate
names unbound in a bare program; a program importing nothing still runs with **no manifest present**;
`(guard (e (#t 'caught)) (read-char 5))` and a closed-port `read` are both still caught (D10's
regression case, checked by hand — 6.x should make it a test).

**Follow-up, filed as issue #39, not this change.** The REPL door resolves `(scheme base)` from the
manifest (`src/emit.cpp:811`, mode 5 -> mode 4) while the run/build doors bake it (mode 8). That
inconsistency is why a user manifest must name the substrate at all. If the REPL door registered the
baked set the way the run door does, no manifest would need to mention `(scheme base)` **or**
`(emit internal)` — only genuinely user-supplied libraries. That is a door-architecture change with
its own protocol work (mode 8 would return N init symbols so the REPL can run them in dependency
order), so it does not belong here.

## 5. Relocate (the breaking step)

- [x] 5.1 Reassign the nine `cxr` forms so `(scheme base)` no longer exports them: the dual
      assignment becomes `(emit internal)` + `(scheme cxr)`, and `(scheme cxr)` is emitted as a
      generated on-disk `.sld`.
- [x] 5.1b Add the fifteen missing four-level accessors (`caaaar` `caaadr` `caadar` `caaddr`
      `cadaar` `cadadr` `caddar` `cdaaar` `cdaadr` `cdadar` `cdaddr` `cddaar` `cddadr` `cdddar`
      `cddddr`) to the prelude, assigned to `(scheme cxr)` ONLY (design D9 — the compiler does not
      use them, so they do not go to the substrate). `(scheme cxr)` then exports all twenty-four.
- [x] 5.2 Reassign `read` to `(scheme read)` and the six file procedures to `(scheme file)`, each
      importing **both** `(scheme base)` and `(emit internal)`. Generated on-disk `.sld` files.
      `(scheme read)` also needs a second home for `%check-input-port` (design D10): `read` calls it,
      it is stateless, and its copy resolves `error`/`input-port?` through `(scheme base)`. The six
      file procedures need no such copy — they reach `%make-port` in the substrate and everything else
      (`error`, `current-*-port`, `dynamic-wind`, `close-port`, `call-with-port`) in `(scheme base)`.
- [x] 5.3 Add the three libraries to `emit-libs.scm` with manifest-relative `(source …)` paths.
      `make install` already globs `lib/scheme/*.sld`, so confirm rather than edit.
- [x] 5.4 Update `test/scheme-base-surface-check.sh` for the partition, and confirm the sixteen
      names are gone from `lib/scheme/base.sld`.
- [x] 5.5 Sweep the in-tree users found in 1.2 — `demos/`, `test/`, any `.sld` — adding imports
      where a relocated name is used.
- [x] 5.6 Both suites green. `./run-all-tests.sh` **21** suites / 0 failed / 354s (the new
      "R7RS library partition" suite included); `./run-dev-tests.sh` 20 suites / 0 failed / 1202s,
      including the self-hosting fixed point (278s) and the anti-stale trust-check (535s).
      One guard bug found and fixed along the way: `test/scheme-base-gen-check.sh` read the
      partition's member paths by scanning for `))` as the end of the form, which an entry that
      names its imports contains mid-list -- so it stopped after two members and reported the other
      three as orphans, having never staleness-checked them. Now depth-counted, and all five are
      checked.

### Step 5 notes

- **`(scheme cxr)` / `(scheme read)` / `(scheme file)` import `(scheme base)`** -- a new shape (a
  manifest-resolved library importing a BAKED one), and not avoidable: `(scheme file)`'s procedures
  need `error`, which reaches `raise` reaches `*handlers*`, and D10 is exactly the argument that
  those cannot be duplicated into a library. `(scheme read)` and `(scheme file)` also import
  `(emit internal)` for `%make-port` / the reader. `(scheme cxr)` needs only `(scheme base)`, for the
  depth-2 accessors its own bodies are built on.
- **`%check-input-port` is dual-assigned into `(scheme read)`** (design D10) as a second *private*
  copy, resolving `error`/`input-port?` through that library's `(scheme base)` import.
  `(scheme file)` needs no such copy.
- **The Chez-free surface guard needed a list it can read.** It cannot parse home specs, so
  `src/prelude-surface.scm` gained `*scheme-base-elsewhere*` -- the prelude defines `(scheme base)`
  does not export because another member does (the 16 relocated + the 15 new depth-4 forms).
  `tools/gen-scheme-base.ss` recomputes that exact set from the authoritative assignments and fails
  on any disagreement, so it is a checked derivation rather than a second source of truth. Writing it
  caught its own naming error: the first version omitted the 15 additions, and the cross-check said so.
- **The guard gained direct assertions** rather than only the subtraction: each relocated name is
  absent from `base.sld` AND present in its new library; `(scheme cxr)` exports exactly 24; the
  depth-2 four are still in `(scheme base)`. Two of those had a name-form bug (`$TMP/exports` holds
  bare names, the `.sld`s indented ones) that made the "still exported" test pass vacuously -- worth
  noting because a guard that passes for the wrong reason is worse than no guard.
- **5.3 needed no Makefile change**, as the task predicted: the three new libraries are in
  `lib/scheme/`, which `install` already globs. `make install` now ships 6 library sources, and an
  installed `emit` resolves each new library from an unrelated directory with no manifest of its own
  -- which is most of 6.4 already demonstrated.
- **5.5's sweep matched task 1.2's inventory exactly**: `demos/case-cxr.scm`, `demos/ports.scm`,
  `test/io-ports-tests.sh`. For the last, the import preamble goes in the `check` runner rather than
  into each of ~20 programs -- the suite's subject IS those libraries.
- **Regen converged in 2 iterations** (532s). `scheme.base.ll` 367451 -> 338670 B;
  `emit.internal.ll` byte-identical at 170716, since the cxr nine only traded their `(scheme base)`
  home for a `(scheme cxr)` one and the substrate's own copy did not move.

## 6. Tests

- [x] 6.1 New suite (or extend `test/prelude-base-run-tests.sh`): each of the sixteen names is
      **unbound** in a bare program and **bound and correct** after importing its library, on the
      run door, the AOT door, and the REPL door.
- [x] 6.2 Assert `(cadr '(1 2 3))` still works with no import (the depth-2 four stay in
      `(scheme base)`), so the partition is not over-applied.
- [x] 6.3 Assert substrate names (`rd-atom`, `rd-skip-ws`, `%make-port`) are unbound in a bare
      program — #29's privacy guarantee, preserved through the move.
- [x] 6.4 Extend `test/install-layout-tests.sh`: an installed `emit` imports each of the three new
      libraries from an unrelated directory.
- [x] 6.5 Assert a program importing nothing still runs with **no manifest present** — the
      guarantee the baked substrate exists to protect.

**How step 6 landed.** 6.1–6.3 and 6.5 are a new suite, `test/library-partition-tests.sh`
(78 checks, registered in `run-all-tests.sh` as "R7RS library partition"); 6.4 extended
`test/install-layout-tests.sh` (now 21 checks). Each of the sixteen names is checked in *both*
directions — unbound bare, then correct with its import on the run, AOT and REPL doors — because a
name that is merely still reachable proves nothing and a name unbound everywhere is a regression.
Beyond the task list it also pins the three things D10 argued about: one port type across libraries,
one handler chain (`guard` catching an error raised by relocated machinery), and `(scheme cxr)`
completeness *by value* — all 24 compared against the `car`/`cdr` composition spelled out by hand,
so a depth-4 accessor wired to the wrong composition cannot pass.

Writing it caught four bugs, all in the tests rather than the implementation, and two are worth
recording because they are the kind that make a suite pass for the wrong reason:
- the sibling REPL suites' `tr -d ' >'` prompt-strip **deletes the spaces inside a value**; the
  prompts are on stderr, so stdout needs no stripping at all;
- the completeness data was a proper list, and `(caddar T)` walks off the end of one and traps — a
  fully nested pair tree of depth 4 is required for all 24 paths to be valid;
- `with-input-from-file` calls its thunk with no arguments while Emit's `read-line` requires an
  explicit port, so the thunk has to name `(current-input-port)`;
- a `for` loop in `install-layout-tests.sh` shadowed the outer `want`, making the later
  symlinked-launcher check compare against the wrong expectation.

## 7. Docs

- [x] 7.1 `docs/MODULES.md`: the shipped-library inventory, the baked-vs-manifest table (now two
      baked members), the substrate and why it is not API, and the partition map's role.
- [x] 7.2 `README.md`: note the three new libraries and the breaking relocation.
- [x] 7.3 Update `openspec/explorations/library-sources-and-artifacts.md` — mark step ④ landed,
      record that open question 2 is answered (no deprecation window, mechanically) and that
      question 6 was resolved by generating N `.sld` files from one partition map without `include`.

## 8. Close out

- [x] 8.1 Verify every scenario in the two delta specs has a corresponding check.
      **27 scenarios; 26 covered.** Walking them found three with no direct check, all now added:
      - *The baked set initializes in dependency order* -> `test/prelude-base-run-tests.sh` reads the
        `__init` call order out of the emitted program module and asserts `emit.internal` precedes
        `scheme.base`. Worth having: getting it backwards leaves `(scheme base)` calling into an
        uninitialized unit, which fails at run time and nowhere earlier.
      - *The substrate does not depend on the library that imports it* -> `scheme-base-surface-check.sh`
        asserts `lib/emit/internal.sld` has no `import` clause at all.
      - *A definition assigned to two libraries is emitted into both* -> the same guard asserts each of
        the nine dual-assigned accessors is both DEFINED and exported by the substrate **and** by
        `(scheme cxr)`.
      **One gap left open, and it predates this change:** *A rotted declaration is an error, not a
      silent surface change* has no automated check. `tools/gen-scheme-base.ss` does `die` on each rot
      condition — and this change added three more (a home naming an unknown library, a library named
      twice for one name, `*scheme-base-elsewhere*` disagreeing with the assignments) — but nothing
      exercises those paths, so a broken guard would be invisible. It came in with #29's spec and is
      not made worse here. Filed as **issue #40** rather than smuggling a negative-path harness into
      this change.
- [x] 8.2 Reference the issues in the commit: `Fixes #32` (the unstable tier is retired by 4.3) and
      the relocation half of #33. **#33 is NOT auto-closed**: its §6 absence audit ("what is
      `(scheme base)` *missing*") is explicitly out of this change's scope, so `Fixes #33` would
      close unfinished work. The commit says `Refs #33` and the audit stays on that issue.
      Two issues filed along the way, both pre-existing gaps this change surfaced rather than caused:
      **#39** (a hand-written manifest must name `(emit internal)`, because the REPL door resolves
      `(scheme base)` from the manifest while run/build bake it) and **#40** (the surface
      declaration's seven rot checks are never exercised).
- [x] 8.3 `openspec validate scheme-base-partition`; sync specs and archive.
      Specs synced by hand (the delta's intent, not a wholesale copy), then archived with
      `--skip-specs` so archive would not re-apply them. `openspec validate --all`: 21/21.
      All 27 delta scenarios landed — 22 in `module-system` (3 new requirements: the baked
      partition, the relocated names, the substrate; 2 modified: the declared surface and library
      zero) and 5 in `core-language` (the accessors, now partitioned). One snag worth noting: my
      first pass copied the delta's `## MODIFIED Requirements` header into the main spec, which
      **truncates** the parsed `## Requirements` section and made every requirement after it
      invisible to validate/list/archive. `openspec validate` caught it; the main specs now carry no
      delta headers at all.
