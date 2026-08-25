## Context

See [proposal.md](proposal.md) for motivation. Emit already supplies R7RS libraries for base, cxr, file, inexact, and read; textual ports, mutable aggregate data, records, multiple values, cyclic datum reading/writing, and cycle-safe `equal?` are implemented. Non-baked standard libraries are ordinary manifest-resolved units, and the prelude is partitioned from one source declaration.

Pitch is 17 R6RS libraries plus a small implementation-specific entry point. Its formatter core is mostly portable, but a source audit shows a narrow intersection between what Pitch uses and what R7RS-small requires but Emit lacks. The change crosses Scheme library code, compiler/bootstrap source, the C runtime, the `emit run` host, installed manifests, and the conformance gate. Compiler-source edits must obey the repository's one-way edit → regen → test barrier.

### Prerequisite audit

| Classification | Pitch evidence | Emit status | Decision |
|---|---|---|---|
| R7RS gap: `case-lambda` | `cost.sls`, `doc.sls`, `layout.sls`, and `print.sls` use fixed, dotted, and rest-only clauses | `(scheme case-lambda)` is absent; issue #91 records frontend failures on rest/dead clauses | Implement the complete library and fix all exercised clause shapes |
| R7RS gap: Unicode character operations | `reader.sls` classifies whitespace/alphabetics and folds identifiers | `(scheme char)` is absent; the existing include-ci fold is explicitly ASCII-only | Implement the complete Unicode-aware library |
| R7RS gap: continuable exceptions | tolerant `reader-warning` calls `raise-continuable` and resumes | handler stack exists, but `raise-continuable` is explicitly absent | Extend the one existing handler mechanism |
| R7RS gap: process context | `main.sps` uses `command-line` and `exit` | `(scheme process-context)` and runtime argv plumbing are absent | Implement the full library with run/AOT parity |
| R7RS gap: write library | Pitch and its reader/tests use `write`/`display`; formatter output needs textual port interoperability | underlying printer exists, but `(scheme write)`, `write-simple`, and `write-shared` are absent | Complete and partition the writer surface |
| Already in Emit | libraries/import sets, `define-record-type`, multiple values, mutable pairs/vectors/strings, bytevectors, textual/file/string ports, guards, cyclic data and `equal?` | implemented | Exercise in the prerequisite fixture; add no duplicate feature |
| Pitch port work, not R7RS | R6RS condition composition, record inheritance/protocols, R6RS hash tables, list sorting, `for-all`/`exists`, bitwise/fixnum APIs, directory/symlink/rename operations | absent or exposed under a different Emit extension | Refactor or isolate in the later Pitch port; do not add Chez/R6RS compatibility here |
| Deliberate Emit restriction | Pitch's lexer currently asks the host to construct arbitrary R6RS numbers | Emit intentionally has bounded exact integers and no exact rationals/complex numbers | Later port represents unsupported numeric lexemes without requiring an Emit numeric value |
| Other R7RS gaps not used by Pitch | lazy, eval, load, repl, time, binary ports, `char-ready?`, full continuations | absent | Out of scope for this change |

The audit is based on the current sibling checkout at `/Users/bwb/src/github.com/bwbensonjr/scheme-pitch`, especially the import blocks and direct call sites. The focused prerequisite fixture makes the included rows durable without coupling Emit's test suite to that external checkout.

## Goals / Non-Goals

**Goals:**

- Make every included feature a standards-shaped Emit capability usable from libraries, the REPL, `emit run`, and standalone executables.
- Preserve the small-native-binary goal: programs that do not import the Unicode library do not carry its tables.
- Preserve the single compiler core and the single exception-handler mechanism.
- Turn the source audit into focused regression coverage and shrink the checked R7RS exclusion manifest.

**Non-Goals:**

- Modify, vendor, or fully compile Pitch in this change.
- Add R6RS library aliases or compatibility layers.
- Add Pitch's non-standard filesystem host operations; its existing host record remains the later port's isolation boundary.
- Broaden Emit's deliberate numeric tower restrictions.

## Decisions

### D1. Implement the intersection as complete R7RS capabilities

Each included standard library is implemented with its complete R7RS-small export set, even where Pitch calls only part of it. A partial `(scheme char)` or `(scheme process-context)` would compile the immediate call sites while leaving a misleading library boundary and conformance exclusions. The delta specs are the acceptance contract; the prerequisite fixture is an additional integration check, not a substitute for conformance tests.

Alternative considered: add only Pitch's called names to `(scheme base)` or an `(emit pitch)` shim. That hides the compliance gain, makes the later port Emit-specific, and repeats behavior under a second surface.

### D2. Implement `case-lambda` as an exported derived form

`(scheme case-lambda)` is a small ordinary library exporting a `syntax-rules` transformer. The public transformer expands to one variadic procedure plus source-ordered arity dispatch and delegates recursive clause construction to a private auxiliary transformer, following the report's reference expansion without relying on unsupported local `letrec-syntax`.

The expansion distinguishes proper formals, dotted formals, and an identifier formal at expansion time. It computes the supplied argument count once, tests clauses in source order, and uses `apply` only for the selected clause. The no-match branch calls `error`, keeping the failure on the catchable handler path. Tests cover the any-arity, rest-arity, and dead-clause programs behind issue #91; any frontend defect those expose is fixed in the shared compiler rather than worked around in the library.

Alternative considered: teach the compiler a new core `case-lambda` node. The construct has a portable derived-form definition, so a new compiler stage or closure representation would add machinery without improving semantics.

### D3. Keep Unicode data in the imported library unit

Pin one Unicode Character Database release and vendor only the upstream data files needed for R7RS properties, simple mappings, full mappings, and case folding, together with its license and checksums. A deterministic Chez-hosted generator produces a committed, reviewable Scheme data include and announces its input version, output, range/mapping counts, byte size, and duration according to `docs/OUTPUT.md`. A generated-file check fails on drift.

The generator compresses boolean properties into sorted scalar-value intervals and casing data into sorted mapping tables. `(scheme char)` performs binary searches over those tables; case-insensitive comparisons are derived in Scheme from fold operations. Full string conversion builds results linearly and uses unconditional, locale-independent Unicode mappings; the optional context-sensitive final-sigma behavior is not required.

Keeping tables in `lib/scheme/char.sld` (through an included generated file) means they are compiled and linked only when `(scheme char)` is imported. It avoids a new runtime dependency and prevents every small standalone executable from paying for Unicode tables. The implementation records both source size and representative stripped AOT binary deltas in the change evidence.

Alternatives considered:

- C locale APIs are locale-dependent, incomplete for full mappings, and make results host-dependent.
- A third-party Unicode runtime library adds discovery, installation, and dynamic/static-link concerns to every platform.
- Tables compiled unconditionally into `runtime.c` make even programs that never import `(scheme char)` pay the binary-size cost.
- Generating from whichever Unicode support the installed Chez happens to expose is not reproducible across bootstrap hosts.

### D4. Add continuable delivery to the existing handler stack

`raise-continuable` uses `*handlers*`, `with-exception-handler`, and the same dynamic state as `raise`; no second warning or condition channel is introduced. While invoking a handler, the active chain is temporarily the saved outer chain. A dynamic-wind-protected restoration reinstalls the original chain if the handler returns, then all returned values are forwarded with `call-with-values`/`apply values`. Because the handler call does not escape, intervening wind frames remain active.

This also removes the now-false sentence in the existing `with-exception-handler` requirement. Non-continuable `raise`, guard unwinding, runtime-trap delivery, and the documented limited continuations remain otherwise unchanged.

Alternative considered: have Pitch encode warnings as return records. That changes Pitch's tolerant-reader control flow and does not close the R7RS gap.

### D5. Make process context an explicit host-to-runtime channel

The runtime owns a process-context snapshot separate from the compiler's REPL control channel. Standalone `main(int argc, char **argv)` installs the operating-system arguments after `GC_INIT`. Before invoking JITed program code, `emit run` installs a logical command line built from the source name and tokens after `--`. Runtime entry points construct fresh Scheme strings/lists on request and expose environment snapshots without allowing Scheme mutation to alter host storage.

The run grammar becomes `emit run [OPTIONS] [FILE] [-- ARG ...]`. The separator is mandatory for program arguments so tool flags remain strict and unambiguous. `FILE` is the logical command name during development and `-` identifies standard-input source; this lets Pitch locate a development config beside its source while the built program uses its executable path. Non-executing run modes reject forwarded arguments.

`exit` is a Scheme wrapper that unwinds `*winds*` to the empty target before entering a non-returning runtime status primitive. `emergency-exit` enters the non-returning primitive directly. Status mapping is shared by both: success for omitted/unspecified/`#t`, failure for `#f`, host integer status where representable, failure for other values. The same primitives terminate the `emit run` process and an AOT program, giving shell-visible parity.

Alternative considered: read arguments from environment variables. That loses arbitrary byte/string boundaries, creates quoting rules, and diverges between JIT and AOT. Letting JITed `exit` return a sentinel would require every call path to propagate a second control protocol and would not be a non-returning R7RS exit.

### D6. Generalize the existing graph printer by output policy

The runtime keeps one tag walker and one destination abstraction. Its graph prepass gains an explicit policy:

- ordinary `write`/`display`: label back-edge targets only;
- `write-simple`: skip graph labeling entirely;
- `write-shared`: count pair/vector identity occurrences and label every node reached more than once.

The existing generation-stamped identity table is extended with the count/state needed by the shared prepass and remains self-invalidating after traps. Atomic rendering and display-vs-write string/character spelling remain parameters of the same walker. Port and default-current-port entry points select the policy without duplicating the printer.

`(scheme write)` supplies the standard surface over those entry points. Existing direct output behavior remains compatible as an Emit extension, while explicit imports now have the correct standard home.

Alternative considered: implement `write-shared` in Scheme. It would need portable object-identity tables and would duplicate the runtime's cycle scanner, tag walker, symbol escaping, and port routing.

### D7. Ship every new library through the ordinary module path

The four new libraries are non-baked standard libraries listed in the default manifest and install set. They import `(scheme base)` and, only where raw runtime operations are needed, `(emit internal)`. Generated sources participate in artifact stamps, so editing Unicode data invalidates `(scheme char)` without rebuilding unrelated libraries. Library generation/surface checks, installed-layout tests, module tests, and cache tests cover the new members.

Nothing is added to the baked set: the compiler does not need these libraries to compile itself, and keeping them separate preserves both bootstrap size and user-binary selection.

### D8. Verify the gaps at three levels

1. Focused feature tests exercise each delta spec through direct programs and libraries, including run/AOT parity and the exact `case-lambda`, Unicode fold, continuable-warning, command-line, exit-status, and port-writing shapes Pitch needs.
2. A `pitch-prerequisites` integration fixture combines those shapes in one small R7RS program. It contains no copied Pitch implementation and documents which later port adaptations remain outstanding.
3. The vendored R7RS suite is run with stale exclusions removed. The suite remains verbatim; only `exclusions.tsv`, its baseline documentation, and capability-specific tests change.

## Risks / Trade-offs

- **[Unicode tables noticeably enlarge `(scheme char)` and slow its first compilation]** → Keep them in the non-baked imported unit, compress ranges/mappings, cache the artifact, and record source, artifact, compile-time, and stripped-binary deltas.
- **[A Unicode data refresh changes observable classification or folding]** → Pin and document the Unicode version, checksum vendored inputs, regenerate deterministically, and make refreshes explicit reviewed changes.
- **[Full string mappings accidentally become quadratic]** → Build codepoint pieces with accumulators and flatten once; add long mixed-text tests and timing evidence.
- **[Process `exit` can terminate the test driver before it reports]** → Test statuses in child processes through shell-level suites; never call exit tests inside a persistent multi-case Scheme process.
- **[JIT process context leaks into the embedded compiler instance]** → Install the program snapshot immediately before the resolved JIT entry and test sequential compiler/program activity; keep it distinct from REPL mode state.
- **[Shared-writer graph counting regresses the common `write` path]** → Retain the cycle-only policy and its allocation-free small static table for ordinary write; run the broader printer and cyclic-datum suites.
- **[The broad change crosses the regen barrier]** → Complete all compiler-source edits and focused source-driven checks first, run `make regen` once to convergence, then make no compiler-source edits until the full suites finish.

## Migration Plan

1. Add tests and deterministic data generation, then implement the four ordinary libraries and their runtime/compiler seams using the source-driven Chez path for iteration.
2. Update manifests, installation, generated-library checks, documentation, and the R7RS exclusion set.
3. Finish every compiler-source edit, run `make regen` to convergence once, and do not edit compiler sources afterward.
4. Run focused tests, `./run-all-tests.sh`, and `./run-dev-tests.sh`; after a commit, run the trust check against committed bootstrap IR as required by the project workflow.

Rollback is a normal revert of the change and its regenerated bootstrap artifacts. There is no persisted user data or artifact-format migration; cached new-library artifacts can be discarded and rebuilt.

## Implementation evidence

Unicode 17.0.0 generation produces 2,180 compressed property ranges and 9,158
mapping entries in a 144,843-byte include (149,694 bytes with `char.sld`). On the
development arm64 macOS host, the complete cached unit is 3,176,042 bytes of IR plus
a 2,582-byte interface, and a cold source-driven compile/link of the one-export
probe took 1.20 seconds (1.09 user, 0.11 system).

After stripping, otherwise equivalent probes measured 51,400 bytes without
`(scheme char)` and 167,096 bytes with `string-foldcase`, a 115,696-byte linked
cost paid only by the importer. The non-importing program's unit closure contains
no `scheme.char` artifact or Unicode table symbol.
