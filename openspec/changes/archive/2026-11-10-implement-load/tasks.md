# Tasks

## 1. Reusable host execution

- [x] 1.1 Separate form execution from prompt printing and local error recovery in `src/emit.cpp`; add host regression cases proving existing prompt output, imports, splices, and recovery remain unchanged.
- [x] 1.2 Add stack-safe execution/error results and restoration of trap, raiser, channel, and source contexts; verify nested execution failures restore the outer context without a longjmp across C++ destructors. Document the callback contract beside the implementation; execute loaded guest code only after returning from C++ and verify caller continuation escapes run dynamic-wind cleanup and leave subsequent loads usable.

## 2. Procedure and source semantics (#177)

- [x] 2.1 Add the runtime callback, private primitive declarations/emission, Scheme wrapper, and declared `(scheme load)` partition; add surface/arity tests and a standalone guarded-call fixture proving unsupported-host errors and absence of LLVM/compiler linkage.
- [x] 2.2 Implement one-form-at-a-time reading and loading into the REPL interaction scope; add fixtures for computed filenames, procedure aliases, empty files, macro definitions, imports, repeated loads, prospective redefinition, suppressed result echoes, and unchanged current ports.
- [x] 2.3 Implement nested filename/source contexts and loader cleanup; add fixtures for sibling loads outside cwd, source-relative includes, nested failures, missing files, reader/compile/runtime errors after a completed effect, no execution after failure, subsequent successful calls, and heap survival during nested compilation.
- [x] 2.4 Add lazy incremental scope for `emit run` with collision-free generated symbols and shared library initialization tracking; verify persistence across two loads, nested calls from procedures, no caller lexical/batch capture, and no duplicate library initialization.
- [x] 2.5 Document one-argument support, host restrictions, path rules, partial progress, and static alternatives in `docs/MODULES.md` and user-facing command documentation; check examples against fixtures and retain the existing `define-library` diagnostic.

## 3. Quiet execution and shared regression coverage (#176)

- [x] 3.1 Implement ordinary-run narration policy before manifest resolution, extending it to compilation/cache/loading callbacks; update `docs/OUTPUT.md` and verify other commands, explicit dumps, final-value reporting, and `--emit` output retain their contracts.
- [x] 3.2 Extend `test/emit-cli-tests.sh` with the issue's greeting/shebang reproduction and loaded-file counterpart, checking stdout, stderr, and exit status independently for unset/quiet/verbose verbosity and cold/warm caches; include failing input to prove diagnostics survive.
- [x] 3.3 Register focused loader coverage in `tools/test-registry.json` and its change classification; verify the test plan selects loader, REPL, module import, surface, CLI, runtime, and relevant reference suites for the edited files. Reuse fixtures rather than duplicating full matrices across shells and source units.

## 4. Release and integrated acceptance

- [x] 4.1 Add one minor VERSION bump and matching nonempty CHANGELOG section covering #177's restrictions and #176; verify release metadata consistency. Use 0.6.0 if 0.5.1 remains the base version.
- [x] 4.2 Before regeneration, run source units (`bash tools/test.sh units`) and format the changed covered Scheme sources with the pinned formatter; inspect the diff for unrelated formatting and finish all compiler-input edits before crossing the barrier.
- [x] 4.3 Run `make regen` explicitly to convergence, then `bash tools/test.sh full`, source units, classified targeted reference suites, and `bash tools/test.sh source`; preserve suite reports and poll long commands. Do not accept native feedback alone as current-source proof. If compiler inputs change again, repeat the barrier and required validation.
- [x] 4.4 Verify installed `(scheme load)` availability and the standalone unsupported-host fixture; compare binary dependencies and representative size against the baseline, and verify an ordinary static program still needs no compiler payload.
- [x] 4.5 Run strict OpenSpec validation and review acceptance against every scenario; reference `Fixes #177` and `Fixes #176` in the fixing commit only once their scoped acceptance passes, leaving the other reviewed issues open.

## Validation evidence

- Explicit regeneration converged at iteration 2; the isolated source profile regenerated all five bootstrap modules byte-identically. Source and bootstrap digests remain unchanged after validation.
- All 59 full-profile suites have passing coverage, combining the initial full run with focused reruns for corrected baseline, inventory/narration expectations, and the host query recovery fix. The combined report is `/tmp/emit-load-validation-summary.json`; raw full and follow-up reports remain linked there. The initial full report itself retains its failures rather than being rewritten.
- Final source units: 16/16 suites. Targeted independent-host checks (`self-emission`, `dump-parity`, `render-datum`): 3/3. Loader suite: 13 groups including nested escapes, GC, imports, and initialization ordering. CLI suite: 143 checks. Changed covered Scheme files pass the pinned formatter check.
- Installed loading and standalone unsupported-host behavior passed. The identical plain-program IR linked with the original/current runtime produced 35,040/35,048 byte binaries, both printing `42`; no LLVM dependency was introduced. Evidence: `/private/tmp/emit-load-validation.DGE6jF/evidence.log`.
- The local regeneration hint now reports a toolchain mismatch because the final C++ host-only correction changes `src/emit.cpp` in that digest. The proven Scheme source/bootstrap digests still match; host-only changes use native checks under project policy. No Scheme inputs changed after their regeneration barrier.
- Strict OpenSpec validation and whitespace checks pass. The fixing change references `Fixes #177` and `Fixes #176`. Release-handoff automation is tracked separately in #178.
