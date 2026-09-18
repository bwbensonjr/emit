# Tasks

## 1. Terminology Baseline and Contributor Rule

- [x] 1.1 Inventory every case-insensitive whole-word and identifier occurrence of `door` in tracked first-party files, classify each as command, compilation path, execution path, host, workflow, precise component, or allowed exact historical identifier/quotation, and verify the inventory covers documentation, OpenSpec, source, tools, tests, and filenames.
- [x] 1.2 Add the short preferred-terminology section to `CLAUDE.md`, confirm `AGENTS.md` remains a symlink to it, and verify the section defines command/verb, compilation path, execution path, host, and workflow while reserving `door` for exact historical identifiers or quotations.

## 2. User and Developer Documentation

- [x] 2.1 Rewrite terminology in `README.md`, `LLVM.md`, `docs/`, and source/toolchain README files using concrete commands or components where possible, and verify no ambiguous “three” versus “four” count remains and every residual `door` match is an allowed exact reference or quotation.
- [x] 2.2 Rewrite terminology in design-backlog and historical narrative documents, including `docs/PERFORMANCE.md`, without changing measurements, conclusions, sequencing, or historical facts, and verify all item numbers and quantitative data remain intact.

## 3. OpenSpec Documentation

- [x] 3.1 Rewrite `door` terminology in every main spec under `openspec/specs/`, preserving each SHALL/SHALL NOT condition and scenario outcome, and verify `openspec validate --specs` succeeds.
- [x] 3.2 Rewrite terminology in `openspec/explorations/` and ordinary prose in archived OpenSpec changes, preserve exact change identifiers such as `run-door-user-libraries`, `baked-set-on-every-door`, and `emit-cli-front-door`, and verify archived decisions, task completion states, and identifier references are unchanged.

## 4. Implementation, Build, and Test Vocabulary

- [x] 4.1 Update compiler and runtime comments plus descriptive strings to name the responsible command, compilation path, execution path, or host; rename internal `door` parameters/helpers such as command-name parameters and message normalization without changing control flow, and verify the project builds before regeneration.
- [x] 4.2 Update `Makefile`, tools, manifests, demos, and non-generated support files with the contextual vocabulary, retain exact historical change-name references, and verify all referenced paths and build targets still resolve.
- [x] 4.3 Rename test helpers and test narration to describe their actual actions, rename `test/project-door-tests.sh` to a command- or workflow-oriented filename, update every caller/reference atomically, and verify the renamed focused test and other directly affected test scripts pass.

## 5. Formatting, Regeneration, and Verification

- [x] 5.1 Run `make format` after all Scheme edits, inspect its diff for unrelated whole-set reformatting, and verify `make format-check` passes before crossing the regen barrier.
- [x] 5.2 With all compiler-source edits complete, run `make regen` to convergence and verify the committed bootstrap artifacts consistently derive from the revised source; make no further compiler-source edits until both suites complete.
- [x] 5.3 Run `./run-all-tests.sh` and `./run-dev-tests.sh`, verifying CLI behavior, diagnostics, artifact bytes, test discovery, self-hosting, and the trust check all pass.
- [x] 5.4 Repeat the repository-wide whole-word, compound-identifier, and filename audit; verify every remaining `door` occurrence is an exact historical identifier, an accurate quotation, or the migration discussion in this OpenSpec change, and review the diff to confirm no runtime semantics or normative requirement changed.
