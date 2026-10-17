# Tasks

Use `chez --libdirs src --script src/compile.ss` for the compiler edit/test loop.
Finish all compiler-source work in groups 1-6 before the regeneration barrier in
group 7. Prepare native checks alongside their implementation; run checks needing
the new embedded core after regeneration. Do not treat matching values as proof
of artifact consumption or successful package assertions.

## 1. Restore reliable backend and interactive evidence

- [x] 1.1 Reconfirm #117 and #126 against the current checkout using the
      `bwbensonjr` account. Retain commands, LLVM versions, child status, and stderr;
      distinguish the reported harness defect from an unproven reader defect.
      Active account confirmed. LLVM 23.1.2 exits 255 on the unchanged fact JIT
      reproduction; stdout/stderr retained under `/private/tmp/emit-srfi-workflow.TW4WJU/`.
      The original interactive helper discards stderr and does not test child status;
      this establishes #126 without inferring a reader failure. LLVM 22.1.8 is installed.
- [x] 1.2 Fix both Chez `lli` invocations to use `--dlopen` and update adjacent
      comments. Verify library-free and modular JIT programs plus backend/module
      resolver suites under LLVM 22 and 23 where installed; record missing coverage.
      Both LLVM 22.1.8 and 23.1.2 pass backend equivalence 57/57, modules 39/39,
      and resolver backends 3/3. Flat and modular direct JIT probes also pass.
- [x] 1.3 Capture stdout/stderr/status for every interactive test child and assert
      status as well as values. Add controls for matching stdout with a nonzero
      exit and for a recoverable REPL error followed by a valid form; verify failure
      diagnostics and concise success without retries. Run the complete interactive suite.
      Serial LLVM 23 rerun passes 35/35 (exit 0), including the failing-child
      diagnostic/status control and existing recoverable-error continuation cases.
      The prior concurrent-build failure is retained in observations below.
- [x] 1.4 Update backend/test documentation with the loader behavior and diagnostic
      contract; verify the documented reproduction and run shell syntax checks.
      README documents `--dlopen` and child-status evidence. Both flat/modular fact
      JIT commands return 120 with LLVM 22.1.8 and 23.1.2. LLVM 23 backend/module
      commands pass 57/57 and 39/39. Modified shell scripts pass `bash -n`.

## 2. Make lowering and base artifacts deterministic

- [x] 2.1 Reproduce #125 with independent source-driven and existing native full
      base outputs. Capture complete normalized IR/exports and scaffold hashes;
      confirm differences are in label/hoist order rather than target headers.
      Independent base artifacts under `/private/tmp/emit-srfi-workflow.TW4WJU/`
      reproduce 13 hunks (319 diff lines) with identical exports. Target headers
      were the only normalization. All 82 raw scaffold snapshots were captured;
      the existing 82-hash baseline check passes before any lowerer edit.
- [x] 2.2 Pin effectful lowerer traversal and sibling invocation order, retaining
      pure maps. Add wide, distinct nested-lambda regressions for generic, known,
      self, apply, primitive, and initializer paths; verify source-driven lowered
      label/body associations and unchanged runtime values.
      Ten source-level label/body tests cover generic/known/imported/self/apply,
      primitive, initializer, branch and spine ordering. The wide nested-lambda
      executable fixture preserves all six runtime results; source composition
      now passes 22/22. Pure maps are retained.
- [x] 2.3 Remove the base-IR exception from composition tests and documentation.
      Prepare independent full-unit comparisons for base and the SRFI closure;
      verify source tests now assert all bytes except existing target headers.
      Execute final cross-host comparisons after group 7's regeneration.
      Base full-IR comparison is unconditional. Independent comparison covers
      every SRFI unit and the six supporting standard libraries; only target
      headers are normalized. Native parity execution remains in group 7.

## 3. Land the SRFI 64 port and complete upstream package execution

- [x] 3.00 Extend escape continuations for #129 to accept zero/one/many values
      through the existing values representation. Add source/native dynamic-extent
      cases for delivery, normal returns, nested escapes, cleanup, parameter
      restoration, and expired continuations. Regenerate library sources, verify
      source tests and all 147 SRFI 1 assertions, and document the retained lifetime
      restriction. Native checks run after the final regeneration barrier.
      Source dynamic-extent checks pass 29/29, including zero/many delivery,
      overflow arguments, nested targets, cleanup/restoration and expiration.
      The prelude uses the existing values representation, generated base is
      synchronized, and the permanent upstream runner passes all 147 SRFI 1
      assertions. Native acceptance remains scheduled in group 7.
- [x] 3.0 Fix #128 by normalizing internal definitions before initializer
      expansion. Add rest-only/dotted/fixed-formal, keyword-shadowing,
      mutual-reference, and malformed-definition regressions, including a library
      fixture. Verify source-driven tests and the unchanged SRFI 64 callback;
      prepare native command checks for after regeneration and document the rule.
      The shared expander normalizes internal definitions before expansion.
      Expander tests pass 54/54, including six new cases; source composition
      passes 18/18, including the imported-library/program fixture. The original
      reproduction now returns #f and unchanged SRFI 64 callback code compiles.
      Native run/build/REPL checks are prepared for the final regen barrier;
      scoped pitch formatting/check and whitespace validation pass.
- [x] 3.1 Fetch and pin SRFI 64 0.1.7, including nested includes, package metadata,
      upstream tests, and notices. Record archive/file digests and inspect the
      complete selected dependency closure. Verify pristine bytes and inventory
      evaluator-dependent code before writing the port.
      Pristine archive and all source/metadata/test digests are recorded in
      `test/snow/README.md` and `sources.sha256`. The selected dependency closure,
      initialization-time environment construction, string evaluator, real-only
      approximate stub, and portable source-info branch have been inspected.
- [x] 3.2 Implement the documented ordinary SRFI 64 port with no eval/complex
      import, real approximate comparison, and an explicit string-evaluation
      error. Preserve a reproducible patch against the pristine reference. Verify
      source-driven initialization and assertions, counters, callbacks, exception
      tests, grouping/cleanup, skip selection, and expected/unexpected outcomes.
      The source-driven self-test passes 47 assertions with its two declared
      expected failures; all eight focused port checks pass. The provenance
      guard reproduces the two-file port patch and unchanged nested includes.
- [x] 3.3 Run compatible upstream SRFI 64 tests and focused semantic checks through
      the source-driven compiler. Document every evaluation-dependent SRFI 64
      exclusion and port adaptation; verify no unsupported branch is enabled by
      pretending Emit is another implementation.
      All upstream SRFI 64 assertions execute: there are no eval-dependent
      exclusions. The README identifies the two upstream expected failures,
      adapted imports/comparison/evaluator region and the portable fallback.
- [x] 3.4 Add a runner-factory wrapper that includes each unchanged SRFI 1/2/8/227
      test file and records final results independently of stdout before `(exit 0)`.
      Derive and pin expected groups/assertion counts, require zero fail/xpass and
      zero unapproved skip/xfail, and verify all four complete source-driven suites.
      Permanent source acceptance passes 147/29/2/13 assertions respectively,
      with zero fail/xpass/xfail/skip or group-protocol errors in those suites.
- [x] 3.5 Add failure controls for a failed assertion followed by exit 0 and for
      missing completion/nonzero child status. Verify the harness fails each control
      and reports status, counters, and saved diagnostics without altering upstream files.
      All three permanent source controls pass: failed assertion plus exit 0,
      missing completion plus exit 0, and passing completion plus exit 7.
- [x] 3.6 Register native run/build/REPL and Chez package acceptance in the appropriate
      runners, keeping existing smoke coverage. Update `test/snow/README.md` with
      versions, counts, coverage boundaries, and commands; verify source digests
      and shell syntax now, and execute the native matrix after regeneration.
      Both main runners include the upstream matrix. Shell syntax and pinned
      source/port guards pass; the source matrix is 8/8. Native checks await regen.

## 4. Define and publish a compatible explicit artifact unit

- [x] 4.0 Fix #130's shared string renderer, preserving strict/loose agreement and
      graph labels. Add quote/backslash/named/control-escape round trips, nested
      macro and shared-string tests, and cold/warm imported-macro regressions.
      Verify source-driven acceptance and prepare native artifact/run/build/REPL
      checks for the final regen barrier; retain upstream source bytes.
      Source renderer tests pass 28/28, including all 128 ASCII code points in
      strings, terminated hex escapes, nested macro data and shared identity.
      Source composition passes 21/21 with cold/warm escaped-macro imports and
      an asserted warm interface hit. Native run/build/REPL explicit-artifact
      checks include the same fixture and are registered for after regeneration.
- [x] 4.1 Define the versioned native `.artifact` datum from design D6 using the
      existing running-executable digest, plus runtime ABI and target compatibility.
      Verify reuse with the same executable identity, conservative invalidation
      after a changed executable digest, and rejection when identity is unavailable.
      Document the schema; add no common source fingerprint, bootstrap identity
      file, build-time identity embedding, or Chez interchange requirement.
      The eleven-field version-1 schema is documented. Twelve C++ format/identity
      checks pass, including unavailable/changed executable identity and pruned
      kind rejection. Native acceptance independently verifies emitted metadata
      against executable, source, and payload bytes.
- [x] 4.2 Publish full-unit `.ll`, `.exports`, and metadata from `emit lib`, with
      source/include contents, feature answers, dependency identity/interface
      digests, and payload integrity. Verify independently parsed metadata matches
      emitted bytes, and clarify that only the requested unit is published.
      Native acceptance validates three fixture units and requested-unit-only
      publication; the full shipped SRFI closure also publishes and reuses.
- [x] 4.3 Keep Chez's existing same-host stamp mechanism separate from native
      explicit artifacts. Isolate parity-test output directories, verify a
      Chez-only legacy pair cannot authorize native reuse, and retain independent
      source-driven full IR/export comparisons without cross-host metadata sharing.
      Isolated native/Chez fixture artifacts have full IR/export parity, including
      escaped/shared strings. Chez-only pairs trigger native fallback and never
      acquire a native sidecar from Chez compilation.
- [x] 4.4 Make publication atomic per payload with metadata last. Add interrupted,
      mixed-generation, concurrent-writer, malformed-export, and unwritable-output
      cases; verify readers reject incomplete pairs and emission never falsely
      reports success. Document fallback and read-only-directory behavior.
      The native matrix passes 76/76, including mixed/incomplete generations,
      corrupt exports/IR, concurrent publishers, read-only consumers, and explicit
      publication failure. No rejected unit is registered before safe fallback.

## 5. Consume explicit artifacts on every command

- [x] 5.1 Integrate explicit validation before private full-unit caches/source
      compilation in native run, build, repl, and dependency loading for lib.
      Validate provider/dependency identity before registration; verify a
      minimal facade and imported macro work from saved artifacts with fresh
      private caches and no full-unit compile of reused providers.
      Fresh run/build/repl caches show all three explicit fixture-unit hits;
      emit lib dependency loading also proves an explicit dependency hit.
- [x] 5.2 Add Emit-produced artifacts for the SRFI closure to native run/build/repl
      and lib dependency-loading acceptance. Verify independent Chez/native
      IR/export parity separately from native explicit-path hit
      evidence; distinguish full-unit reuse from permitted source-based AOT pruning.
      Preserve native object identity and root-specific cache separation.
      Native SRFI artifact matrix passes 6/6 across run/build/repl, requiring
      five SRFI 1 closure hits and eight SRFI 64 closure hits per command.
      Independent fixture parity is verified; full base/SRFI parity remains in
      final integration checks. Pruned keys include the full-unit generation.
- [x] 5.3 Add invalidation cases for changed source/include bytes with restored
      mtimes, timestamp-only touches, dependency macros/call rows/runtime targets,
      provider replacement, feature answers, and compiler/runtime/target metadata.
      Verify stale explicit and private entries cannot be reused after invalidation.
      All cases pass in the 76-case native matrix, including a deliberately
      primed stale private importer and changed macro/call/runtime descriptors.
- [x] 5.4 Verify missing/legacy/corrupt/pruned artifacts fall back without partial
      registration, read-only explicit directories work, and an unwritable private
      cache remains nonfatal. Exercise REPL recovery and once-only initialization.
      Include #131's empty-stem capture-group collision: skip capture when cache
      storage is unavailable, bounds-check member lookup, and require all ten
      fresh-process modular fallback regressions to pass without retries.
      Explicit matrix passes 76/76, including REPL recovery, once-only init,
      read-only explicit artifacts and unavailable private storage. Native-object
      cache suite passes 23/23, including all ten blocked-cache processes after
      the #131 repair. Original stochastic failures remain recorded below.
- [x] 5.5 Add explicit-hit and stale-reason narration plus quiet/stdout and
      `--dump-all` checks. Update `docs/MODULES.md` and the library-source exploration
      with reproducible `emit lib`/manifest examples; verify commands and output
      against `docs/OUTPUT.md` and remove the obsolete #123 limitation.
      The 76-case matrix verifies verbose hit/rejection paths, quiet stdout,
      and dump bypass. MODULES and the library-source exploration document native
      publication/consumption, full-unit versus pruning work, separate Chez
      verification, and the complete metadata/fallback contract.

## 6. Ship optional sources and verify installation

- [x] 6.1 Copy pinned SRFI 1/2/8/227 sources/includes into `lib/srfi/` without
      modifying their bytes; place the port there with provenance/notices.
      Add shipped-source digest and port-patch guards and verify checkout imports
      through conventional roots without `-L test/snow/lib` or eager manifest entries.
      Shipped sources match pinned fixture digests; the port patch reconstructs
      all four SRFI 64 implementation files. Provenance/notices are documented
      beside shipped sources. The complete source upstream runner resolves from
      the ordinary repository library root with no test-fixture search root.
- [x] 6.2 Extend the explicit Makefile install inventory for the SRFI `.sld` and
      include closure plus notices. Add staged install checks for exact payload,
      nested includes, repeat installation, and absence of tests/logs/compiled units;
      verify no installed file or symlink depends on the checkout test tree.
      Installed suite passes 25/25: all fourteen SRFI source/include/notice files
      match checkout bytes, exact inventory has no symlinks, repeat installation
      is byte-identical, and DESTDIR retains the complete nested include closure.
- [x] 6.3 Add installed run/build/repl/lib smoke cases from an unrelated directory
      without checkout/search variables, plus project override and no-SRFI-import
      checks. Verify lazy registration, resolver availability answers, unchanged
      global feature identifiers, and delivered executable independence.
      All four installed commands pass from an unrelated directory with search
      variables unset. SRFI 64 initializes from installed nested includes;
      availability/global-feature separation, project override and no-import
      lazy behavior pass. The executable is delivered outside the source tree.
- [x] 6.4 Update the user-facing SRFI example and support matrix in `docs/MODULES.md`
      and README: distinguish installed sources, external `-L` packages, the SRFI 64
      evaluator exception, and test coverage. Verify commands and report representative
      binary size/symbol comparisons without SRFI imports and with SRFI 1 imports.
      README/MODULES document installed optional sources, external roots, upstream
      counts and the evaluator exception. LLVM 23.1.2/macOS arm64 native builds:
      no-SRFI 35152 -> 35152 bytes (58 symbols, zero SRFI symbols); SRFI smoke
      91504 -> 91536 bytes (245 -> 246 symbols, only scheme.base:values added).

## 7. Regenerate and complete integration verification

- [x] 7.1 Finish scoped formatting and every compiler-source edit, then run
      `make format-check`, OpenSpec validation, whitespace checks, and relevant
      script syntax checks. Confirm the compiler-source set is frozen before regen.
      Scoped formatting is complete; whole-set format-check reports 32 files,
      zero changes. Strict OpenSpec, whitespace and modified shell syntax checks
      pass for hand-authored code. Staged vendored sources retain upstream blank
      lines at EOF and HTML whitespace; the reproducible port and its patch retain
      that inherited whitespace. Those provenance-pinned payloads are deliberately
      excluded from whitespace cleanup. Compiler sources are frozen before the
      first regen; native acceptance
      remains unverified and cannot be inferred from source-test results.
- [x] 7.2 Run `make regen` to convergence; make no compiler-source edits until both
      complete suites finish. Run prepared native/cross-host/installed acceptance,
      including full base IR parity, all four upstream package suites, SRFI 64
      semantics, Emit-produced artifacts across native consumers, and invalidation/fallback
      controls. Explain any scaffold/binary-size deltas before accepting baselines.
      Final regen converged and completed all stages (`regen-hex.log`, exit 0).
      Both suites completed without further compiler-source edits. All 82 demo
      scaffolds retain identical substrate, program and ordinary dependency IR;
      only base changes (+5250 bytes), explained by the variadic escape callback
      and its values/minimum-entry path. Binary-size evidence is in task 6.4.
      Cross-host composition passes 75/75, including full base and escaped macro
      IR/interface parity; shipped package closure parity passes 39/39. Explicit,
      installed and upstream native acceptance also passes in both full runs.
- [x] 7.3 Run `./run-all-tests.sh`, then `./run-dev-tests.sh`, retaining logs and
      original exit statuses. Require clean results for the scheduled issue fixes;
      diagnose failures from saved evidence. If another compiler edit is needed,
      finish it and repeat regen and both suites rather than crossing the barrier.
      Native run: exit 0, 50 suites, zero failures, 2271 seconds. Development run:
      exit 0, 34 suites, zero failures, 1302 seconds. Logs are retained as
      `run-all-final.log` and `run-dev-final.log` under
      `/private/tmp/emit-srfi-workflow.TW4WJU/`. Development trust-check correctly
      skips the dirty bootstrap; a real post-commit trust-check remains task 7.4.
- [ ] 7.4 Commit completed implementation and bootstrap with conventional messages
      referencing `Fixes #117`, `Fixes #123`, `Fixes #125`, `Fixes #126`, `Fixes #128`, `Fixes #129`, `Fixes #130`, and `Fixes #131` as
      appropriate. Run post-commit `test/trust-check.sh` and verify committed bootstrap
      bytes reproduce and the intended worktree is clean before marking complete.

## Workflow follow-up

- Review, synchronize the four delta specs, and archive the completed change.
- Reassess the explicitly deferred GitHub issues independently; do not close them
  based on successful selected SRFI package tests.

## Implementation observations

- Final development integration run exits 0: 34 suites, zero failures, 1302
  seconds. This includes expander 54/54, lowering order 10/10, renderer 29/29,
  artifact core 52/52, upstream acceptance 32/32 (native run/build/REPL and Chez,
  including negative controls), independent full-IR/interface parity, self-hosting
  fixed point, interactive REPL 35/35, and batch/REPL equivalence. Original log:
  `/private/tmp/emit-srfi-workflow.TW4WJU/run-dev-final.log`. Its trust-check skips
  the uncommitted bootstrap as designed; task 7.4 requires a separate real check.
- Final native integration run exits 0: 50 suites, zero failures, 2271 seconds.
  This includes explicit artifacts 76/76, SRFI artifacts 6/6, staged SRFI
  installation 25/25, native object cache 23/23, composition 23/23, dynamic
  extent 29/29, and complete upstream suites through run/build/REPL with all
  negative controls rejected. Original output is retained in
  `/private/tmp/emit-srfi-workflow.TW4WJU/run-all-final.log`. The final successful
  regeneration is recorded in `regen-hex.log`; compiler sources remain frozen
  while the development suite runs. Earlier failed attempts below remain as
  historical evidence, not current acceptance results.
- The no-private-cache failure is reproducible (two failures among twenty fresh
  diagnostic processes, in addition to the first acceptance failure). macOS crash
  reports show heap corruption in LLVM materialization/destruction. GitHub #131
  records the identified cause: NativeObjectAdapter indexes disabled capture
  groups under the same empty stem; a one-module group replaces the two-member
  baked group, then its second callback writes out of bounds. This is within
  task 5.4's existing nonfatal-cache requirement. The host now skips empty-stem
  registration and defensively checks member bounds; native verification awaits
  completion of the in-progress hex-spelling regeneration.
- First native explicit-artifact matrix: 70 passed, 6 failed. Three metadata
  inspector failures and its concurrent-publication assertion compared canonical
  recorded source paths against macOS `/var` aliases; canonicalize the test root.
  Escaped-interface parity also exposed uppercase Chez hexadecimal digits versus
  lowercase Emit digits; make the shared renderer choose digits explicitly and
  repeat regeneration and both suites. One no-private-cache run exited 133 with
  no final JIT metrics/diagnostic; a direct reproduction exits 0. Investigate this
  separately without rewriting the original failure as a pass. Full log and
  retained fixture root are recorded in `explicit-native.log` under the work log
  directory. No native artifact acceptance task is marked complete from that run.
- First regeneration converged at fixed-point iteration 2, then failed in stage
  3 with `repl: unbound variable caddar`: a shorthand used in the newly added
  validator was supplied by Chez but absent from the compiler's standalone subset.
  The new compound shorthand accessors were replaced with supported compositions.
  Regenerate to convergence and run both suites; do not use the incomplete
  bootstrap set for native acceptance. Original failure log is retained as
  `/private/tmp/emit-srfi-workflow.TW4WJU/regen-final.log`.
- Native explicit-artifact implementation is in progress: fixed versioned
  string-field wire format, executable/runtime/target identity, payload hashes,
  source/include/feature validation, dependency generation tracking, atomic
  metadata-last publication, manifest artifact-directory lookup, native loader
  integration, and source-core semantic validation hooks are added. These are
  not yet accepted or marked complete: native execution awaits regeneration and
  the remaining failure/installation/parity matrix. Source core tests pass 52/52,
  standalone C++ artifact-format tests pass 8/8, and the C++ host object compiles.
- GitHub #130 blocks reliable exported-macro artifact reuse: unchanged
  `src/core.ss`'s `render-body*` surrounds raw string contents with quotes without
  escaping them. A macro expanding to `"a\"b\\c"` compiles and runs cold, but its
  generated `.exports` is malformed and the next source-driven build exits 255
  with `more than one item found after dot`. Reproduction files and cold/warm
  diagnostics are retained under `/private/tmp/emit-srfi-workflow.TW4WJU/`.
  https://github.com/bwbensonjr/emit/issues/130 records the cause and a proposed
  shared-renderer fix with round-trip and artifact regressions. The user approved
  adding the shared-renderer fix and regressions; task 4.0 records that scope.
  Regeneration remains pending until all compiler-source edits are finished.
- The approved #129 extension and source package acceptance now pass: dynamic
  extent 29/29, full upstream SRFI acceptance 8/8 (five suites, three negative
  controls), and focused package smoke 4/4, including eight SRFI 64 checks.
  Lowering-order source regressions pass 10/10 after pinning effectful maps and
  sibling visits; full native parity still awaits regeneration. The install
  inventory is extended but its staged/native acceptance remains incomplete.
- Artifact identity decision resolved with user approval: only Emit must produce
  reusable artifacts for native Emit commands. Use its existing executable digest
  rather than adding a shared compiler-source fingerprint or regeneration-owned
  bootstrap identity. This accurately identifies the actual embedded compiler,
  including before regen, at the accepted cost of conservative invalidation after
  rebuilding/relinking. Chez remains an independent source/IR/interface verifier
  with a separate same-host stamp mechanism. Group 4 no longer depends on an
  unresolved fingerprint design choice; its implementation remains pending.

- The initial evaluator-free SRFI 64 port fails during expansion of
  `test-runner-null`'s internal `(define (test-null-callback . args) #f)`.
  A four-line non-library reproduction fails under both source-driven Chez
  (exit 255) and the unchanged native compiler (exit 1). GitHub #128 records
  the reproduction, stack evidence, cause in `exp-body`'s raw-definition
  traversal, and a possible fix. The user approved adding this focused compiler
  fix to the change; task 3.0 and the module-system delta record the added scope.
  Task 3.2 remains incomplete until the port's specified acceptance passes.
- First LLVM 23 backend-equivalence run: 57/57, exit 0. Concurrent build-driving
  interactive/module suites collided at the linker; the new REPL harness saved
  exit 255 and `ld: open() failed, errno=17 (File exists) for 'build/emit'`.
  The initial interactive run is 34 passed / 1 failed and module run 37/39.
  Serial reruns are required; those original outcomes are not rewritten as passes.
- Serial LLVM 23 verification: interactive 35/35, module vertical slice 39/39,
  hybrid resolver 3/3, each exit 0. LLVM 22 also passes backend 57/57, module
  39/39, and resolver 3/3, each exit 0. Both versions' flat and modular JIT probes return
  120 with exit 0. Logs remain under `/private/tmp/emit-srfi-workflow.TW4WJU/`.
- After the #128 fix, source-driven full upstream tests report SRFI 2: 29 passes;
  SRFI 8: 2 passes; SRFI 227: 13 passes; SRFI 64: 47 passes and its 2 explicitly
  declared expected failures, with zero unexpected failures in those suites.
  SRFI 1 initially reports 143 passes and 4 failures. Selecting SRFI 1 first in
  the external driver resolves the fold-right collision with base's extension,
  leaving 144 passes and 3 failures. No upstream source was edited or assertion
  skipped. GitHub #129 records the remaining two-value escape-continuation
  restriction, reproduced through source AOT and native run; both exit 1 with
  an arity diagnostic. The user approved adding that semantic extension while
  preserving escape-only extent; task 3.00 and the dynamic-extent delta track it.
  The #128 fix is complete at its source/prepared-native task
  boundary, but SRFI 64/package acceptance remains incomplete.
