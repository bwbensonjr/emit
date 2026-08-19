## 1. Cycle-safe predicates

- [x] 1.1 Replace the recursive `list?` cdr walk in `src/prelude.scm` with the
      tortoise-and-hare traversal from D5; pin proper, improper, self-circular, and multi-pair
      circular inputs.
- [x] 1.2 Refactor `rt_equal` in `src/runtime/runtime.c` into the public wrapper plus a recursive
      worker with a lazily allocated, growable visited table keyed by ordered object pairs.
- [x] 1.3 Preserve every existing scalar, string, bytevector, flonum, record, pair, and vector
      equality rule, and add timeout-guarded tests for equal and unequal pair cycles, vector cycles,
      mixed pair/vector cycles, and large acyclic structures.
- [x] 1.4 Verify `%hash` still terminates and produces equal codes for representative cyclic values
      that the new `equal?` considers equal, preserving the equal-keyed hash-table contract.

## 2. Persistent reader directives

- [x] 2.1 Introduce the reader-state value in `src/prelude.scm`; make `rd-skip-ws` recognize only
      delimiter-terminated `#!fold-case` and `#!no-fold-case`, update the state, and continue as
      intertoken space.
- [x] 2.2 Thread reader state through atoms, lists, vectors, bytevectors, quote forms, datum comments,
      and all string/whole-source entry points; preserve the separate initial folding mode of
      `read-all-from-string-ci` while allowing either directive to override it.
- [x] 2.3 Apply folding to bare identifiers and named character tokens only, retaining literal
      behavior for bar-quoted identifiers, strings, numeric tokens, and single-character character
      literals.
- [x] 2.4 Add a case-mode field to input-port records and make successive `read` calls copy the
      updated mode back to the port without disturbing the runtime-visible output-handle field.
- [x] 2.5 Update the REPL input-completeness path, `src/import-substrate.scm`, and
      `src/prelude-surface.scm` helper inventories/signatures so directive scanning stays shared and
      library partition checks remain exact.
- [x] 2.6 Extend the Chez reader tests and target-side port/REPL tests with directives before,
      within, and between data; successive port reads; no-fold restoration; delimiter validation;
      named characters; and literal non-folding cases.

## 3. Datum-label reader

- [x] 3.1 Add decimal `#N=` / `#N#` dispatch ahead of prefixed-number handling, with a fresh label
      environment for each outermost datum and `rd-fail` reasons for malformed, duplicate,
      unresolved/forward, direct-self, and incomplete definitions.
- [x] 3.2 Represent references to pending definitions with per-read unforgeable placeholders, record
      completed definitions directly for ordinary sharing, and resolve placeholders through every
      pair field and vector slot with a cycle-safe fixup traversal.
- [x] 3.3 Isolate label environments while discarding `#;` data, reset bindings between top-level
      forms and successive port reads, and route every failure through `rd-report` as a catchable
      read error.
- [x] 3.4 Add direct identity/topology tests for self and multi-node pair cycles, vector and mixed
      cycles, shared acyclic values, multiple labels, label-scope boundaries, and every malformed
      class across `read-from-string`, whole-source reads, `(scheme read)`, compiler, and REPL doors.
- [x] 3.5 Add write-to-string/read-back tests that inspect both finite content and `eq?` back-edges,
      while retaining the existing printer tests as the exact-output authority.
- [x] 3.6 Make `encode-const` in `src/emit.ss` memoize source-object identity, allocate pairs/vectors
      before filling their edges, and reuse operands for labelled shared references; test cyclic and
      shared quoted constants through JIT, libraries, macro templates, and standalone executables.
- [x] 3.7 Measure large ordinary quoted constants and a source-driver compiler run with graph-aware
      lowering; if linear identity associations are material, replace them with a private bucketed
      identity map or record any residual measured debt in `docs/PERFORMANCE.md`.

## 4. Targeted pre-regeneration verification and documentation

- [x] 4.1 Run the Chez/source-reader suites and compile targeted programs through
      `chez --libdirs src --script src/compile.ss` so reader, predicate, compiler, and REPL paths are
      exercised against edited source before regeneration.
- [x] 4.2 Run the runtime, port, reader-parity, printer-cycle, library-partition, surface, and REPL
      targeted suites; fix all failures before crossing the regeneration barrier.
- [x] 4.3 Remove exactly the six resolved exclusions from `test/r7rs/exclusions.tsv`:
      `00dfc2d5f8bd4d56`, `4dea3fc446ec34ba`, `41f521b91af79d68`, `f20805f1081dbd66`,
      `5748bde1e6b4af72`, and `6e5ebf1010bad620`.
- [x] 4.4 Update `test/r7rs/README.md` with a newly measured baseline/reason inventory and remove the
      stale datum-label/directive limitation from `docs/PROJECTS.md`; do not predict counts from the
      number of exclusion rows because one excluded form contains several assertions.
- [x] 4.5 Audit compiler-side renderers/dumpers reached by labelled constants for recursive walks;
      either make a reached path cycle-safe or prove with a targeted test that constant lowering
      bypasses it.
- [x] 4.6 Confirm the diff contains no implementations of `length`, `append`, `list-copy`,
      `write-shared`, or `write-simple` unless a discovered hard dependency is documented in this
      change before proceeding.

## 5. Regeneration barrier and final verification

- [x] 5.1 Confirm every edit to `CORE_FLAT`, `src/prelude.scm`, `src/repl-core.ss`, reader partition
      metadata, and entry sources is complete, then run `make regen` once to convergence and make no
      further compiler-source edits while it or the suites are running.
- [x] 5.2 Re-run the targeted cyclic-datum, reader, port, REPL, partition, and printer suites against
      the regenerated compiler, with timeout guards proving the former hangs terminate.
- [x] 5.3 Run `test/r7rs-suite-tests.sh` with its stale-exclusion pass; verify all six removed forms
      run, the remaining long-running timeout count is zero, and the recorded baseline matches the
      output.
- [x] 5.4 Run `./run-all-tests.sh` and then `./run-dev-tests.sh` in the prescribed order, running
      independent suites individually if command timeouts require it.
- [x] 5.5 After the implementation and regenerated bootstrap IR are committed, run
      `test/trust-check.sh` and verify `bootstrap/` is at the committed fixed point.
