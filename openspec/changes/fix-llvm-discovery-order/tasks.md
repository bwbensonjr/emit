# Tasks

## 1. Defect Tracking

- [x] 1.1 Open a GitHub issue describing the coexisting Homebrew LLVM reproduction, the path-sorting cause in `tools/llvm-env.sh`, and the reported-version selection fix; verify `gh issue view <number>` shows the reproduction and implementation direction

## 2. Fallback Selection and Coverage

- [x] 2.1 Add a Chez-free toolchain-discovery regression suite using temporary fake `llvm-config` candidates; verify it fails against the current path-based ordering and covers LLVM 23 versus `llvm@22`, invalid candidates, equal-version determinism, and higher-precedence bypass
- [x] 2.2 Refactor known-prefix fallback selection in `tools/llvm-env.sh` to rank executable candidates by nonempty `llvm-config --version` output with a deterministic path tie-breaker; verify the new regression suite passes and existing override and `PATH` precedence tests remain green
- [x] 2.3 Register the regression suite in `run-all-tests.sh` and document the reported-version fallback rule in `src/TOOLCHAIN.md`; verify the suite appears in the default runner and the documented precedence matches the delta spec

## 3. Integration Verification

- [x] 3.1 Run `make clean && make` on a machine with Homebrew LLVM 23 and `llvm@22` installed; verify narration, `build/llvm.mk`, and `otool -L build/emit` identify LLVM 23
- [x] 3.2 Run `./run-all-tests.sh` and verify every Chez-free suite passes; confirm no `make regen` or bootstrap IR change is produced
- [x] 3.3 Commit the completed change with a brief conventional commit that includes `Fixes #<issue>` and verify `git show --stat --oneline HEAD` contains only the intended discovery, test, documentation, and OpenSpec files
