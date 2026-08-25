## 1. Gap Evidence and Unicode Inputs

- [x] 1.1 Add focused failing fixtures for the five audited Pitch/R7RS intersections and a small combined `pitch-prerequisites` program; verify the fixtures name `case-lambda`, Unicode folding/classification, `raise-continuable`, process arguments/status, and standard writer imports without copying Pitch implementation code
- [x] 1.2 Vendor the minimal files from one pinned Unicode Character Database release with upstream license, provenance, and checksums; verify every vendored byte is covered by the checksum check and the repository's third-party license documentation names it
- [x] 1.3 Implement a narrated deterministic Unicode-table generator that emits compressed property intervals plus simple/full casing mappings as a Scheme include; verify two generations are byte-identical and report Unicode version, range/mapping counts, output bytes, and duration on stderr
- [x] 1.4 Add a generated-Unicode drift check to the normal test workflow; verify a clean generated file passes and a deliberately changed temporary copy is diagnosed without modifying the committed source data

## 2. Case-Lambda Library

- [x] 2.1 Implement `(scheme case-lambda)` as an ordinary library with a public `case-lambda` transformer and private recursive dispatch transformer; verify fixed, dotted, rest-only, first-match, multiple-value, lexical-capture, and catchable no-match cases
- [x] 2.2 Diagnose and fix any shared-frontend defects exposed by the suite's any-arity, rest-arity, and dead-clause forms from issue #91 rather than weakening the macro; verify those three forms compile and pass through the source-driven Chez compiler path
- [x] 2.3 Add module, REPL, `emit run`, and AOT coverage for importing and re-exporting the macro/procedure result; verify an importer can call an exported arity-dispatched procedure without importing `(scheme case-lambda)` itself

## 3. Unicode Character Library

- [x] 3.1 Implement the property interval lookup, `char-alphabetic?`, `char-numeric?`, `char-whitespace?`, `char-upper-case?`, `char-lower-case?`, and `digit-value` in `(scheme char)`; verify ASCII plus Greek, Arabic-Indic, Gujarati, combining-mark, non-ASCII whitespace, and negative cases against the pinned Unicode data
- [x] 3.2 Implement Unicode simple `char-upcase`, `char-downcase`, and `char-foldcase`; verify non-ASCII pairs, fold-specific mappings, and unchanged uncased characters
- [x] 3.3 Implement all five n-ary `char-ci` comparisons over simple folding; verify equality and ordered chains of two and three or more arguments, including a failing adjacent relation
- [x] 3.4 Implement locale-independent full `string-upcase`, `string-downcase`, and `string-foldcase` with linear result construction; verify multi-character mappings, non-ASCII text, fold idempotence, and a long mixed-text case
- [x] 3.5 Implement all five n-ary `string-ci` comparisons over full folding; verify equal folded spellings, ordered chains, differing lengths, and a failing adjacent relation
- [x] 3.6 Add library-surface, module, REPL, run, and AOT tests for `(scheme char)`; verify the complete R7RS export list and record source/artifact/compile-time/stripped-binary size metrics showing a program that does not import the library carries no Unicode table payload

## 4. Continuable Exceptions

- [x] 4.1 Implement `raise-continuable` on the existing `*handlers*` stack with outer-handler installation, dynamic restoration, and multiple-value forwarding; verify a returning handler resumes at the call site and a second continuable raise reaches the same installed handler
- [x] 4.2 Add focused handler and `dynamic-wind` tests; verify continuable delivery does not run after thunks early, normal exit runs them once, nested handlers see the correct current chain, and ordinary `raise`/`guard` behavior is unchanged
- [x] 4.3 Exercise the Pitch warning pattern in the combined prerequisite fixture; verify a continuable warning is observed and tokenization-style work resumes with the handler's replacement value

## 5. Process Context and Program Arguments

- [x] 5.1 Add runtime process-context storage plus entry points for fresh command-line snapshots and environment lookup/enumeration, and expose the necessary compiler primitive declarations; verify repeated Scheme results cannot mutate host argv/environment storage and missing variables return `#f`
- [x] 5.2 Change the standalone runtime entry to capture `argc`/`argv` after GC initialization; verify an AOT executable sees its actual `argv[0]` and ordered arguments, including empty and dash-prefixed strings
- [x] 5.3 Implement shared status mapping and non-returning normal/emergency runtime termination primitives, then add the Scheme `exit` wrapper that unwinds all active winds; verify `#t`/omitted, `#f`, and exact integer statuses plus normal-cleanup and emergency-no-cleanup cases in child processes
- [x] 5.4 Implement the complete `(scheme process-context)` library over those primitives; verify all five exports through a user library, `emit run`, and an installed AOT build
- [x] 5.5 Extend `emit run` to parse `[FILE] [-- ARG ...]`, reject multiple source files and arguments in non-executing modes, and install the logical program command line immediately before JIT execution; verify forwarded option-like arguments, stdin's `-` command name, strict pre-separator option errors, and run/AOT exit-status parity
- [x] 5.6 Update `emit run --help` and relevant CLI documentation for the separator grammar; verify requested help remains on stdout with status 0 and error usage remains on stderr with non-zero status

## 6. Standard Write Library

- [x] 6.1 Refactor the existing runtime graph printer to take ordinary, simple, or shared labeling policy while retaining one tag walker and destination path; verify existing ordinary write/display byte output and cyclic-pair/vector termination tests remain unchanged
- [x] 6.2 Extend the generation-stamped identity table/prepass to count repeated pair/vector nodes for shared mode and bypass labels for simple mode; verify `write-shared` labels acyclic sharing and mixed pair/vector sharing while `write-simple` emits no label for acyclic shared data
- [x] 6.3 Add default-current-port and explicit-port runtime entry points for `write-simple` and `write-shared`, then implement the complete `(scheme write)` library; verify all four exports return unspecified and route output to the requested/current textual port
- [x] 6.4 Add reader round-trip, graph-identity, string/character spelling, module, REPL, run, and AOT tests; verify `write` labels cycles only, `write-shared` preserves all observable sharing, and `display` retains unquoted text semantics

## 7. Library Distribution and Conformance Ratchet

- [x] 7.1 Register all four standard libraries and the generated character include in the default manifest, project build, cache stamp inputs, install layout, and generated-library checks; verify each resolves from an installed Emit outside any checkout and untouched artifacts are reused
- [x] 7.2 Update standard-library/module/primitive documentation and the README's remaining-gap inventory; verify every new library is documented as ordinary and non-baked, the Unicode version is named, and the Pitch-port exclusions from the audit remain explicit
- [x] 7.3 Run the focused combined prerequisite fixture through a user library, `emit run`, and a standalone build; verify identical functional output and shell status across development and shipping paths
- [x] 7.4 Run the R7RS suite discovery mode, remove every exclusion made stale by these capabilities (including blocked case-lambda forms), and update its measured baseline documentation; verify the ordinary suite reports no stale exclusion, no new failure, and zero exclusions for the completed library/exception forms
- [x] 7.5 Run library-surface, install-layout, artifact-cache, printer-cycle, dynamic-extent, CLI, and module suites individually; verify all pass before crossing the regeneration barrier

## 8. Bootstrap Barrier and Full Verification

- [x] 8.1 Complete all remaining compiler-source edits and run the source-driven `chez --libdirs src --script src/compile.ss` iteration plus focused suites; verify no compiler-source file covered by `tools/regen.sh` needs another edit before regeneration starts
- [x] 8.2 Run `make regen` once to convergence and make no subsequent compiler-source edits; verify all regenerated bootstrap members come from the same source state and the fixed point is reached
- [x] 8.3 Run `./run-all-tests.sh`; verify every suite, including the R7RS conformance ratchet and generated-file checks, passes
- [x] 8.4 Run `./run-dev-tests.sh` without changing compiler sources; verify every independent development suite passes and note that `test/trust-check.sh` is expected to skip until the regenerated bootstrap diff is committed
- [x] 8.5 Review the final diff, generated Unicode metrics, bootstrap artifacts, and test narration against `docs/OUTPUT.md`; verify no Pitch source, unrelated R6RS compatibility API, unpinned generated input, or unexplained binary-size debt entered the change
