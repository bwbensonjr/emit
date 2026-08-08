## 1. Pin all three defects first

- [x] 1.1 Add fixtures for the #64 lowering cases: `'#(1 2)`, `(quote #u8(1 2))`,
      `(car (quote (#(a) b)))`, a heterogeneous vector, `(equal? '#(1 2 3) (vector 1 2 3))`, and a
      quoted vector in a library body — all currently failing with `bad const ?`
- [x] 1.2 Add a fixture that compiles a library exporting a macro whose template holds `#(1 2)` and
      asserts the export table records `#(1 2)`; it currently records `?` with exit 0, so this pins
      the silent corruption
- [x] 1.3 Add a fixture for the #52 case: an interactive `(import (bad))` of a manifest library that
      failed to load must name `(bad)`, not `?`
- [x] 1.4 Grep `bootstrap/` and `lib/` for an existing `?` datum in a committed export table (design
      "Open Questions"). Answer: **no committed `.exports` exist outside `build/`**, so no committed
      artifact was corrupt — the corruption was reproducible but not yet checked in
- [x] 1.5 Confirm 1.1-1.3 fail against the current binary in the ways the issues describe

## 2. Renderer arms first, so nothing is unmasked (design D3, D5)

- [x] 2.1 Add `vector?` and `bytevector?` arms to `render-datum` (`src/core.ss:382`), spelled
      `#(...)` and `#u8(...)`, recursing through `render-datum` for elements
- [x] 2.2 Extend `render-datum`'s comment block to record that the aggregate arms exist so the export
      table round-trips, keeping the existing note about `render-char`'s strictness intact
- [x] 2.3 Confirm the fixture from 1.2 now records `#(1 2)` in the export table while the program-side
      compile still fails with `bad const` — the corruption is fixed before the lowering unmasks it
- [x] 2.4 Confirm a table containing `#(...)` reads back through both the Chez driver's `read` and
      Emit's in-language reader

## 3. A total renderer for diagnostics (design D4)

- [x] 3.1 Split `render-datum` into a shared worker with two entry points: the existing strict one,
      and a loose one that spells an unrepresentable character as `#\x<hex>` instead of raising
- [x] 3.2 Comment the split with the reason (artifact path must fail, diagnostic path must be total)
      and the two-entry-points-over-one-worker precedent from `reader-token-path` design D1/D2
- [x] 3.3 Change `repl-irritant->string` (`src/repl-core.ss:63`) to fall through to the loose renderer
      instead of `"?"`, keeping its existing symbol/string/number fast arms
- [x] 3.4 Update the comment at `repl-irritant->string` — its "best-effort irritant rendering is fine"
      rationale is what aged, per #52
- [x] 3.5 Add a test rendering the same datum through both entry points and asserting they agree
      outside the deliberately-divergent character case (design "Risks")

## 4. Lowering (design D1, D2)

- [x] 4.1 Add the `vector?` clause to `encode-const` (`src/emit.ss:292`), after `pair?`: emit
      `rt_make_vector` with the unspecified fill, then one `rt_vector_set` per element with each
      element operand from a recursive `encode-const`
- [x] 4.2 Add the `bytevector?` clause the same way over `rt_make_bytevector` /
      `rt_bytevector_u8_set`
- [x] 4.3 Confirm no new `declare` is needed — all four runtime symbols are already declared for the
      primitive layer
- [x] 4.4 Confirm the `else` clause's `bad const` message now names the datum, since `render-datum`
      has the arms as of group 2
- [x] 4.5 Iterate via `chez --libdirs src --script src/compile.ss` and confirm every fixture from 1.1
      passes

## 5. Verify

- [x] 5.1 Confirm the library-body and exported-macro-template cases both work end to end: `emit lib`
      writes a faithful table, and an importer expands the macro to the real vector
- [x] 5.2 Confirm the run door and the AOT door agree on a program containing a vector constant (the
      byte-identity check `test/prelude-base-run-tests.sh` style, per the existing door-parity suites)
- [x] 5.3 Confirm the REPL survives the improved diagnostic — session snapshot restored, next form
      still evaluates
- [x] 5.4 Finish every source edit, then run `make regen` to convergence (barrier: no further
      compiler-source edits until the suites finish); expect one pass, investigate if it takes two
- [x] 5.5 Review the `bootstrap/` diff for any export-table change and confirm each is a corruption
      fix rather than a format drift
- [x] 5.6 Run `./run-all-tests.sh`, then `./run-dev-tests.sh`; run suites individually if the batch
      outlives the command timeout
- [x] 5.7 Commit, then run `test/trust-check.sh` (it `[SKIP]`s on a dirty `bootstrap/`)

## 6. Close out

- [x] 6.1 Reference both issues from the fixing commit as `Fixes #64` and `Fixes #52`; do not write a
      negated closing keyword anywhere in the PR body
- [x] 6.2 Added `docs/PERFORMANCE.md` **P14** covering both deferred optimizations as halves A
      (hoist to a one-time initializer) and B (static global for an all-immediate aggregate)
- [x] 6.3 Sync delta specs into `openspec/specs/core-language`, `openspec/specs/module-system`, and
      `openspec/specs/emit-cli`, then `openspec validate --all` and grep the main specs for stray
      delta headers
