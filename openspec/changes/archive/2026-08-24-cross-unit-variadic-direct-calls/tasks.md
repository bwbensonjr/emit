## 1. Baseline and Contract Tests

- [x] 1.1 Capture the current program-module IR and at least five timing samples for P9's
  3,000,000-iteration `number->string` workload before editing compiler sources, preserving the
  baseline executable/results until the post-change comparison is complete
- [x] 1.2 Extend `test/cross-unit-direct-call-tests.sh` and its fixtures to verify fixed rows remain
  unchanged, variadic rows record `(minimum-arity rest)`, calls at the minimum, above it, and beyond
  the positional-slot count are direct and value-equivalent, while too-few, `apply`, and
  value-position calls stay indirect
- [x] 1.3 Extend the assigned-export coverage to a variadic top-level lambda and verify its export
  table withholds the call row and importing calls continue to observe reassignment

## 2. Call Interface and Lowering

- [x] 2.1 Extend the lowerer's unit-procedure record with fixed/rest shape for every library
  top-level lambda, retain the existing assignment filter, and verify the source-driver tests expose
  eligible variadic procedures but not assigned ones
- [x] 2.2 Extend export call-row writing and import-table decoding with the optional `rest` marker,
  preserve the exact bytes of existing fixed rows, and verify both three-field and four-field rows
  decode to the intended arity descriptor
- [x] 2.3 Match imported calls by exact fixed arity or variadic minimum arity and lower eligible
  calls through the existing `known-app` path; verify source-driver IR keeps the closure global load,
  removes the code-pointer load, and leaves too-few calls indirect
- [x] 2.4 Run the Chez source driver and focused Scheme-level tests before regeneration, verifying
  fixed and variadic calls compile on the interpreted-source compiler with no host-order divergence

## 3. Documentation and Measurement

- [x] 3.1 Update `docs/MODULES.md`, `docs/PIPELINE.md`, and affected source comments to describe
  exact/minimum call descriptors and the shared variadic direct-call ABI; verify no documentation
  still says every variadic export lacks a call row
- [x] 3.2 Re-run the preserved before executable and regenerated after executable in interleaved
  samples, verify `number->string` now has a direct code-label call, and record raw samples plus the
  observed delta in the change or `docs/PERFORMANCE.md`
- [x] 3.3 Update the P9 status-table cell and entry in `docs/PERFORMANCE.md` with change name,
  corrected cause/fix, and measured outcome, leaving final completion/archive bookkeeping consistent
  with the backlog's maintenance rules

## 4. Regeneration and Verification

- [x] 4.1 After every compiler-source edit is complete, run `make regen` to convergence and verify
  the regenerated bootstrap artifacts represent one fixed point; make no subsequent compiler-source
  edits during the test barrier
- [x] 4.2 Run the direct-call, assigned-library, AOT tree-shaking, module-scaffold, numeric, and
  backend/parity focused suites against the regenerated compiler and verify all pass
- [x] 4.3 Run `./run-all-tests.sh` and verify the complete Chez-free suite passes
- [x] 4.4 Run `./run-dev-tests.sh` and verify all Chez-gated suites pass, recording the expected
  trust-check skip if bootstrap artifacts are still uncommitted
- [x] 4.5 Run `openspec validate cross-unit-variadic-direct-calls --strict`, inspect the final diff
  for unrelated changes, and verify every task and implementation requirement is complete
