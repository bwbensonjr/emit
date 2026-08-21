## 1. Baseline and Host Test Fixtures

- [x] 1.1 On current `main`, warm the artifact cache and record LLVM version plus O0-equivalent
      total/guest times for a trivial run, a short REPL form sequence, the generated 200,000-token
      reader workload, one existing call/arithmetic-heavy demo, and one existing allocation-heavy
      demo; verify the commands and raw samples are captured in the change notes before code alters
      the baseline.
- [x] 1.2 Add reusable run/REPL test helpers that invoke an explicit optimization profile and
      capture stdout and stderr separately; verify an intentionally failing probe demonstrates that
      output mismatches, option failures, and stderr contamination are reported independently.

## 2. Optimization-Level CLI

- [x] 2.1 Add a shared host representation/parser for exactly one of `-O0`, `-O1`, or `-O2`,
      defaulting to O1, and wire it into `emit run` and `emit repl`; verify each accepted spelling
      reaches the selected level and conflicting or unsupported levels exit non-zero before user
      source is compiled.
- [x] 2.2 Reject a JIT optimization level combined with `emit run --emit` or
      `--resolve-program`, and leave `build`/`lib` rejecting the levels as unknown; verify every
      error names the invoked door/options, writes no data to stdout, and has a non-zero status.
- [x] 2.3 Update the run and REPL usage text to list the three JIT profiles and O1 default; verify
      `emit run --help`, `emit repl --help`, and both `emit help <verb>` spellings remain successful
      stdout-only requests.
- [x] 2.4 Extend `test/emit-cli-tests.sh` with the profile, conflict, unsupported-level,
      non-executing-mode, and non-JIT-door cases; verify the suite passes against the rebuilt host.

## 3. Shared ORC Optimization Transform

- [x] 3.1 Add the LLVM new-pass-manager includes and a shared LLJIT transform installer that
      cross-registers the standard analysis managers for each module; verify `make` compiles and
      links `build/emit` with the repository's discovered LLVM toolchain and no new dependency.
- [x] 3.2 Map O1 and O2 to `PassBuilder`'s standard per-module default pipelines and O0 to an
      identity transform, returning transform failures through LLVM's normal error path; verify a
      small same-module helper call remains unoptimized at O0 and is simplified/inlined at an
      optimized level using a test-only IR inspection or LLVM optimization remark.
- [x] 3.3 Install the shared transform immediately after constructing both the run and REPL
      LLJITs, before adding baked, manifest, program, or form modules; verify instrumented test
      output counts every admitted module under the selected profile and shows no caller-specific
      bypass.
- [x] 3.4 Accumulate transform/materialization timing with a monotonic clock and narrate the
      selected profile plus aggregate metrics only at verbose verbosity on stderr; verify default
      and quiet output are unchanged and verbose mode adds no bytes to program stdout.

## 4. Run and Incremental-Session Correctness

- [x] 4.1 Add run-door cases at O0/O1/O2 for a no-prelude program, baked-library calls, and a
      manifest library import; verify all levels produce byte-identical stdout and initialize each
      unit once.
- [x] 4.2 Extend the interactive tests at O1 and O2 with earlier-definition lookup, prospective
      redefinition, a closure captured before redefinition, persistent pair/vector values, and
      interned-symbol identity; verify the results match the existing O0 semantics across separate
      form modules.
- [x] 4.3 Exercise baked and manifest library loading at O1/O2, including a warm artifact-cache
      hit and a source fallback; verify imported exports resolve and the selected transform applies
      on both cache paths.
- [x] 4.4 Run compile-error and runtime-trap recovery, `guard`/dynamic extent, and subsequent-valid-
      form cases at O1/O2; verify a failure does not terminate or corrupt the session.
- [x] 4.5 Compare `emit run --emit` output before and after the host change and with/without
      `--dump`; verify byte identity, unchanged stage dumps, and an empty `git diff -- bootstrap/`
      demonstrate that backend optimization did not cross the compiler-IR observation boundary.

## 5. Performance Evidence

- [x] 5.1 Run the task 1.1 workload matrix at O0/O1/O2 with a warm cache, interleaved samples, and
      a recorded aggregation method; verify the results separate Scheme compile/cache time, LLVM
      transform time, remaining materialization time, guest execution, and total wall time where
      each component is observable.
- [x] 5.2 Reproduce P12 with `tools/gen-reader-bench.ss` and compare the reader's guest execution
      at all three levels against the delivered AOT executable; verify the recorded result states
      how much of P12/P13 O1 recovers and whether any reader-specific debt remains.
- [x] 5.3 Measure a multi-form interactive sequence at all three levels, including the first form
      and steady-state later forms; verify O1's added per-form latency and execution benefit are
      reported separately rather than hidden in one session total.
- [x] 5.4 Review the evidence against design D6 before enabling O1 as the final default; verify O1
      improves representative execution without disproportionate interactive latency, or revise
      the planning artifacts explicitly before implementing a different default.

## 6. Documentation and Backlog

- [x] 6.1 Update `docs/PERFORMANCE.md` P13 and the status table with the implementation and measured
      outcome, then re-scope or close P12 strictly from task 5.2's evidence; verify each status,
      value claim, and OpenSpec change link agrees between the table and detailed entries.
- [x] 6.2 Update `docs/PIPELINE.md` to distinguish compiler-produced IR from the per-module LLVM
      backend transform and explain the O0/O1/O2 boundary; verify `--dump` and `--emit` descriptions
      still match their unchanged outputs.
- [x] 6.3 Update `docs/PROJECTS.md` with the run/REPL profile options and remove its obsolete claim
      that `emit build` does not tree-shake; verify the walkthrough matches current behavior and
      reference the fixing commit with `Fixes #112`.

## 7. Verification and OpenSpec Completion

- [x] 7.1 Run the focused CLI, run-door, module, artifact-cache, REPL interactive/equivalence,
      dynamic-extent, dump, and trap suites; verify every suite passes at the O1 default and the
      profile-specific O2 cases pass.
- [x] 7.2 Run `./run-all-tests.sh` and then the independent suites in `./run-dev-tests.sh`; verify
      all suites pass, `bootstrap/` remains unchanged, and no `make regen` was run for this
      host-C++-only change.
- [x] 7.3 Run `openspec validate jit-dev-optimization-profile --strict`, review the final diff for
      scope and generated-artifact cleanliness, and verify the change is ready to sync/archive with
      every completed task checked.
