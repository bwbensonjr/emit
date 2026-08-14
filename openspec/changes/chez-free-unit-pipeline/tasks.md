## 1. Baseline measurements (before any edit)

- [x] 1.1 Re-measure issue #101's four-case table on this machine at this commit: `emit repl` and
      `emit repl --no-prelude`, each with a resolving manifest and with none, with the `map` probe.
      Record the numbers; they are the acceptance baseline for group 3.
      *Post-cache: 0.424 / **1.163** / 0.286 / 0.024 s. The waste is now ~1.14 s and a LARGER share
      of the door than the issue recorded, because the cache took the prelude row down and left
      this one untouched. Row 1 vs row 3 (0.138 s) is the eager preload compiling the manifest's
      four non-baked libraries on every session start — task 4.4's target.*
- [x] 1.2 Measure `emit build` on `hello.scm` and on one program importing a user library: wall
      clock (cold and warm cache) and delivered executable bytes. Record the same for the Chez AOT
      path (`chez --libdirs src --script src/compile.ss`) on the same programs — that pair is P8's
      door-parity acceptance criterion.
      *`hello.scm`: 1.902 s cold / 0.732 s warm / 212,232 B, against the Chez door's 93,656 B — a
      118,576 B gap. Floor (`--no-prelude`): 0.23 s / 34,776 B. **`uses-lib.scm` is 212,304 B on the
      CHEZ door too**: the prunability rule keeps `(scheme base)` full whenever another unit imports
      it, so P8 wins nothing on programs importing a user library that imports the standard library.
      That bounds this change's size claim to programs of `hello.scm`'s shape.*
- [x] 1.3 Measure a program importing a user library through `emit run`, twice, to size the
      user-library caching win against the proposal's ~0.4–0.9 s estimate.
      *0.321 s / 0.331 s — the scratch library is too small to show the win; the REPL's 0.138 s for
      four real libraries (task 1.1) is the honest stand-in.*
- [x] 1.4 Record `./run-all-tests.sh` wall clock as the suite-level baseline.
      *29 suites, 0 failed, **329 s** — green before any edit. (P3's outcome recorded 459 s for the
      same commit under heavier desktop load; 329 s is this session's like-for-like figure.)*

## 2. Core edits (all of `CORE_FLAT` — finish every one before group 5)

- [x] 2.1 `src/repl-core.ss`: make `repl-manifest-user-paths` (mode 9) omit every baked member via
      the baked-set membership predicate in `src/core.ss:211-230`, replacing the hard-coded
      `(equal? name '(scheme base))` (design D2). Update the mode's comment, which currently
      explains why the REPL uses mode 5.
- [x] 2.2 `src/repl-core.ss`: delete `repl-manifest-paths` and retire mode 5, leaving the number
      reserved with a comment rather than renumbering 6-15 (design D3).
- [x] 2.3 `src/include-reader.ss`: accumulate the resolved token of every file
      `emit-include-reader` opens, with a reset entry point, mirroring `*includes-read*` /
      `reset-includes-read!` / `includes-read` (`src/compile.ss:196-222`) (design D7).
- [x] 2.4 `src/repl-core.ss`: new mode — reset the tracker at the start of a library registration
      (mode 4 and the baked-set path), and a new mode returning the closure of the most recent
      registration as newline-joined paths. Shape it as a pure query over established state, the way
      mode 15 is.
- [x] 2.5 Move `program-root-internals` and `str-contains?` from `src/compile.ss:700-722` into the
      shared core, and have the Chez driver call the moved definitions (design D8). Behavior must
      not change; `src/compile.ss` is exempt from regen, so this half is verifiable immediately.
- [x] 2.6 `src/repl-core.ss`: new mode — recompile an already-registered library against an explicit
      root set, resolving its imports against the session exactly as its registration did, and
      return the pruned unit. `compile-library*` already takes `keep-roots`; this is the plumbing
      that reaches it from a library named rather than freshly parsed.
- [x] 2.7 Exercise 2.1-2.6 through `chez --libdirs src --script src/compile.ss`, which `include`s
      the sources directly, before spending a self-compile. For the modes the C++ host must drive,
      a single `build/emit-boot --emit < build/embed-repl.scm` (~4 min) relinked into a scratch
      binary is the cheap loop — restore `bootstrap/` with `git checkout -- bootstrap/` afterwards
      so group 5 starts from committed IR, never from a mixed-source tree.
      *A Chez probe that `include`s `CORE_FLAT` + `repl-core.ss` and calls a mode directly
      (scratchpad `shake-probe.ss`) proved far cheaper than the self-compile — seconds vs 4 min —
      and is how modes 16/17 were debugged. It is also the loop that could NOT see design D14's bug,
      because Chez is the host that handles keyword shadowing correctly. Six self-compiles in all;
      `bootstrap/` was never written to.*

## 3. Host: REPL seeding parity (issue #101)

- [x] 3.1 `preload_libraries` (`src/emit.cpp:1288`): use the mode-9 index for the first manifest as
      well as the chain, dropping the mode-5 branch (design D1). The preload stays eager.
- [x] 3.2 Confirm the prelude path is unchanged in observable terms: the baked members a manifest
      names are absorbed as before, no second unit is added to the JIT, and startup narration still
      reports what it registered.
- [x] 3.3 Confirm `emit repl --no-prelude` with a resolving manifest now approaches the 0.05 s
      no-manifest floor from 1.6 s (task 1.1's baseline), and that a manifest library importing
      `(scheme base)` reports an unresolved import rather than loading (design D4).
      ***1.163 s -> 0.050 s** against a 0.025 s no-manifest floor: the waste is gone. The three
      manifest libraries that import `(scheme base)` are reported in ONE line naming them, not an
      error apiece blaming the manifest — the flag removed the dependency, so "dependency missing
      from manifest?" was the wrong story (design D4).*

## 4. Host: cache generalization and the build-door shake

- [x] 4.1 Generalize the cache key to a `(kind, compiler-digest, source-digest[, root-digest])`
      stem, with the kind in the entry name (design D10): `baked-`, `unit-`, `shake-`. Keep the
      existing baked entry shape and format version discipline.
- [x] 4.2 Implement source identity for a disk-sourced unit: an FNV-1a content digest over the
      `.sld` and its recorded include closure, with the closure stored inside the entry so
      validation needs no compile (design D5, D6). Content, not mtime — state the reason in the
      comment.
- [x] 4.3 Make `preload_user_libraries` cache-aware — the task `baked-set-artifact-cache` deferred
      (its 5.2). A hit registers through mode 14; a miss compiles through mode 4, queries the
      closure (2.4), and stores. *Mode 14 also gained a `deferred` status so a cached unit cannot
      register ahead of a unit it reads globals from (design D13).*
- [x] 4.4 Make the REPL's `preload_libraries` cache-aware through the same helper, so the eager
      door benefits identically and the two preloads do not diverge again.
- [x] 4.5 `emit_build` (`src/emit.cpp:1710`): between `compile_program` and the temp-`.ll` write,
      determine the prunable units (design D11, using the imports mode 15 reports) and each one's
      root set from the emitted program IR (the moved `program-root-internals`).
- [x] 4.6 For each prunable unit: look up a `shake-` entry keyed by root-set digest; on a miss,
      drive mode 2.6 and store the result. Link the pruned IR in place of the full unit, preserving
      link order. *Keyed on a digest of the program's emitted IR rather than of the root set — the
      entry must be findable before the roots are computed (design D9, refined).*
- [x] 4.7 Extend cache narration to name the library and the entry kind, per design D12 and
      `docs/OUTPUT.md`.
- [x] 4.8 Confirm the degradation contract still holds on every new path: an unwritable location, a
      corrupt `unit-` or `shake-` entry, and a missing closure file each fall back to compiling and
      succeed. *The corrupt case FAILED first time and is now fixed: a stamp attests that an entry
      was written whole, not that its bytes survived, so a garbage-but-non-empty `.ll` was trusted
      and reached the JIT. Each split module must now contain its own `:__init` definition, checked
      BEFORE mode 14 so a rejected entry leaves the session untouched.*
- [x] 4.9 Confirm `--no-prelude` on the build door still skips the baked set entirely, and that its
      shake path handles a program whose only units are user libraries. *`emit build bare
      --no-prelude` is unchanged at 34,776 B / 0.23 s; with no modules there is nothing to shake.*

## 5. Regen barrier

- [ ] 5.1 Confirm every `CORE_FLAT` edit (group 2) is finished and nothing is pending, per
      `CLAUDE.md`, and that `bootstrap/` is committed-clean before starting.
- [ ] 5.2 Run `make regen`. Expect convergence at fixed-point iteration 2 (5 self-compiles, ~22
      min). Record the `bootstrap/` diff and confirm it is explicable as the mode additions and the
      moved shake helpers, and nothing more.
- [ ] 5.3 Run `make all schemec` and confirm all three backends still agree.

## 6. Tests

- [ ] 6.1 Issue #101 regression: `emit repl --no-prelude` in a directory with a resolving manifest
      compiles no baked member. Assert on observable work (narration or timing floor), not only on
      the binding outcome — the binding outcome was already correct.
- [ ] 6.2 REPL seeding parity: a session against a manifest naming both baked members starts with
      the standard library available, adds no duplicate unit, and reads no library source for them.
- [ ] 6.3 `--no-prelude` door parity: the same manifest and library through `emit repl --no-prelude`
      and `emit run --no-prelude` reach the same unresolved-import outcome.
- [ ] 6.4 User-library cache: cold vs warm byte-identity of emitted IR for a program importing a
      user library; a second invocation does not recompile it.
- [x] 6.5 Include-closure invalidation: editing an included fragment while the `.sld` is untouched
      invalidates; touching a file without changing its content does not.
      *This is the test that earned its keep: it failed, and the cause was that `*includes-read*`
      did not ride the session state vector. The compiler's globals are re-created on every host
      call — which is why `source-home` rides it — so mode 16 always saw an empty record and every
      entry was keyed on its `.sld` alone. Invisible under Chez, whose globals persist, and
      invisible to any test that only edits the `.sld`.*
- [ ] 6.6 Closure isolation: two libraries including the same fragment each record it, and the
      second's closure does not inherit the first's (spec scenario for 2.4).
- [ ] 6.7 Shake correctness: `emit build`'s executable on the demo corpus behaves identically to a
      non-shaken build, and to the Chez driver's AOT output on the same programs.
- [ ] 6.8 Door-parity size: `emit build` and the Chez AOT path retain the same library bindings on
      `hello.scm`, and the two byte sizes are of the same order (task 1.2's baseline, ~134 KB →
      ~34 KB).
- [ ] 6.9 Kind isolation: after a build populates `shake-` entries, `emit repl` and `emit run` seed
      from full units and every binding of that library is still available.
- [ ] 6.10 Shaken-entry reuse: rebuilding the same program reuses the pruned units; building a
      second program that reaches a different subset does not.
- [ ] 6.11 Run `./run-all-tests.sh` and `./run-dev-tests.sh` (individually if a suite outlives the
      command timeout) and confirm both pass, including `test/trust-check.sh` after committing.

## 7. Evidence and bookkeeping

- [ ] 7.1 Re-measure tasks 1.1-1.4 after the change, on the same machine in the same session, and
      record before/after. Acceptance: `emit repl --no-prelude` at the no-manifest floor; a warm
      `emit build` faster than today's on both wall clock and bytes; a cold `emit build` no worse
      than design D9's projected row.
- [ ] 7.2 Tick P8 in `docs/PERFORMANCE.md` (heading and status table) with the measured outcome, and
      cross-reference P3's entry for the cache generalization. If the cold build regressed beyond
      the projection, record that rather than only the warm win.
- [ ] 7.3 If the cache directory grows faster than expected (design's open question), open a
      `docs/PERFORMANCE.md` entry for eviction rather than adding a policy here.
- [ ] 7.4 Open an issue for shaking `emit lib` to a library's own exported interface, which the
      `aot-codegen` root-set requirement already anticipates.
- [ ] 7.5 Close issue #101 from the fixing commit (`Fixes #101`).
- [ ] 7.6 Update `docs/MODULES.md` and `docs/PIPELINE.md` where they describe the doors' seeding or
      the shake as driver-only.
