# Design

## Context

See `proposal.md` for motivation. Review baseline: clean HEAD `733c1dd`, latest
archived change `2026-10-17-srfi-1-library-composition`, and all 15 open GitHub
issues read on 2026-10-17 using the active `bwbensonjr` account. No implementation
or integration test run is claimed by this planning review.

The last change fixed #120/#121/#124 and verified composition, SRFI smoke cases,
normal native-cache hits, and serialized artifacts. Its tasks record a successful
post-commit trust check, but full-run failures remained: LLVM 23's rejection of
`lli -load`, an intermittent blank REPL result whose evidence was discarded, and
an explicit exemption for full base IR. Follow-up reruns are not a clean full-run
baseline. Its main spec is synchronized and no active change preceded this one.

`src/passes/lower.ss` still uses effectful `map` in application, primitive, `apply`,
and binding-initializer traversal. Native `LibrarySource::artifact_dir` is parsed
but not consumed. `emit lib` emits IR/exports without reusable freshness metadata.
Chez uses a source-derived compiler stamp with mtime checks; native caches use the
running executable digest with content checks. Those identities are intentionally
different and cannot simply be copied into each other's sidecars.

`test/snow/` carries pinned SRFI sources and their original test programs. The
tests import SRFI 64 and end in `(exit 0)`, so exit status alone cannot prove their
assertions passed. `Makefile` currently installs only `lib/scheme`, `lib/emit`,
and one explicitly listed include file.

## Goals / Non-Goals

Goals: a user can import selected SRFIs from an installation, execute their
upstream suites, and compile a library with Emit into an explicit artifact set
that native Emit commands can reuse safely. Chez remains an independent
source-compilation and IR/interface verification host, not an artifact-interchange
producer or consumer. Artifact reuse must be measurable independently of
equal program values. Keep language semantics in the shared compiler and I/O in
the hosts; preserve separate compilation and small standalone executables.

Non-goals are in the proposal. In particular, do not use this work to change
first-import-wins, implement universal-name aliases, rewrite hygiene, or implement
an evaluator. SRFI 64 support is a documented port with a bounded exception,
not a claim that the complete snow-fort SRFI 64 package compiles unchanged.

## Decisions

### D1: Schedule the workflow gaps and explicitly defer the rest

| Open issue | Disposition and reason |
|---|---|
| [#123](https://github.com/bwbensonjr/emit/issues/123) | Implement explicit artifact production and consumption; closes the previous plan's artifact reuse gap. |
| [#125](https://github.com/bwbensonjr/emit/issues/125) | Fix effectful lowering order and remove the base-IR exception. |
| [#117](https://github.com/bwbensonjr/emit/issues/117) | Fix both Chez `lli` invocations, restoring trustworthy backend verification. |
| [#126](https://github.com/bwbensonjr/emit/issues/126) | Capture and assert child status/stderr before interpreting another intermittent result. |
| [#128](https://github.com/bwbensonjr/emit/issues/128) | Added with user approval during implementation: expand internal procedure initializers without traversing formal signatures as applications. |
| [#129](https://github.com/bwbensonjr/emit/issues/129) | Added with user approval: live escape continuations deliver zero or multiple values through the existing multiple-value representation. |
| [#130](https://github.com/bwbensonjr/emit/issues/130) | Added with user approval: shared datum rendering escapes string literals so serialized macro interfaces preserve their values. |
| [#131](https://github.com/bwbensonjr/emit/issues/131) | Fix within the already scheduled unwritable-cache fallback: disabled native capture groups must not alias under an empty key. |
| [#118](https://github.com/bwbensonjr/emit/issues/118) | Defer import conflict errors: a separate compatibility change requiring an existing-program audit. Preserve explicit prefix/selection examples. |
| [#119](https://github.com/bwbensonjr/emit/issues/119) | Defer integrated primitive/core-keyword aliasing: a separate binding-model change; selected packages do not require it. |
| [#106](https://github.com/bwbensonjr/emit/issues/106) | Defer derived-form helper capture restructuring; retain as a known hygiene boundary. |
| [#91](https://github.com/bwbensonjr/emit/issues/91), [#56](https://github.com/bwbensonjr/emit/issues/56), [#49](https://github.com/bwbensonjr/emit/issues/49) | Defer general frontend/macro diagnostics and interactive library definitions. Issue #49 already has a main-spec requirement; verify its current reproduction before scheduling a later fix. |
| [#40](https://github.com/bwbensonjr/emit/issues/40) | Defer generator negative-path coverage; independent of SRFI consumption. |
| [#33](https://github.com/bwbensonjr/emit/issues/33) | Defer the remaining surface audit. Its relocation portion is already represented by `scheme-base-partition`; do not repeat it based on the old issue body. |
| [#31](https://github.com/bwbensonjr/emit/issues/31) | Defer baked-source derivation cleanup and generator portability; not required for a reusable ordinary library. |
| [#27](https://github.com/bwbensonjr/emit/issues/27) | Defer the remaining numeric inventory/tower work; retain current numeric limits. |
| [#111](https://github.com/bwbensonjr/emit/issues/111) | Defer procedure disassembly; unrelated enhancement. |

These are planning dispositions, not changes to GitHub state. Newly reproduced
defects must be filed with evidence. Do not silently expand scope or weaken package
tests to accommodate a new compiler defect.

### D2: Restore diagnostic and artifact equivalence gates first

Fix #126's helper to retain stdout, stderr, and status for every child. Expected
recoverable REPL errors still have successful session status; a child that prints
the expected value and then exits nonzero must fail. Keep success concise and
print saved diagnostics on failure. Add no automatic retries.

For #117, replace both `-load` uses with `--dlopen` and verify library-free and
modular execution under installed LLVM 22 and 23. Missing toolchain coverage must
be reported, not marked passed. This changes the Chez driver, not native ORC.

For #125, use order-pinned traversal for lowering callbacks that allocate labels
or hoist code. Audit sibling lowering calls as well as `map`: pin compiler
visitation explicitly wherever Scheme evaluation order is otherwise unspecified.
Keep pure traversals unchanged. Add distinct nested lambdas in sufficiently wide
argument lists to expose host visitation differences, covering generic/known/self
calls, `apply`, primitive operands, and initializer lists. This fixes compiler
artifact determinism, not a new user-language operand evaluation-order promise.

Compare complete independent Chez/native unit outputs for base and the SRFI
closure, normalizing only existing target triple/data-layout header differences.
Do not sort labels, discard bodies, or retain #125's exemption. Explain any
scaffold IR changes caused by deterministic label allocation rather than blindly
updating hashes.

### D3: Ship selected sources through the existing library hierarchy

Place SRFI 1/2/8/227 `.sld` files and their includes under `lib/srfi/`, preserving
the pinned package bytes. Keep upstream metadata/tests and pristine reference
copies in `test/snow/`; digest guards prove shipped files match those pins. Avoid
symlinks that depend on the test tree after installation.

Discover these sources through conventional roots, without adding eager manifest
entries for every SRFI. This preserves lazy REPL registration, project override
precedence, and import-only startup costs. Do not auto-import them or enlarge the
baked set. Keep the current global feature declaration unchanged: users query
`(library (srfi N))` for provider availability. This bounded acceptance does not
justify adding new global SRFI feature identifiers.

Extend the explicit install payload to include SRFI sources, nested SRFI 64
includes, and applicable notices. Do not recursively copy tests, logs, or compiled
artifacts into the prefix. Validate staged installs from an unrelated directory
with no checkout paths or test roots available. A project-provided SRFI must still
override the non-baked installed copy. A program with no SRFI import must not load
these libraries or gain a new runtime dependency.

### D4: Port SRFI 64 openly without introducing eval

Planning inspected the [snow-fort catalogue](https://snow-fort.org/pkg) and the
[SRFI 64 0.1.7 archive](https://snow-fort.org/s/iki.fi/retropikzel/srfi/64/0.1.7/srfi-64-0.1.7.tgz).
Its normal real-only branch imports `(scheme eval)` and SRFI 1. `64.scm` creates an
environment at initialization; ignoring `test-read-eval-string` at call sites
cannot make the unmodified package work. Its real-only `approx=` also raises an
unsupported error. Source-info has a portable `syntax-rules` fallback, so this
inspection does not establish a need for procedural macros.

Vendor that version as an immutable reference, with archive/file digests,
metadata, upstream tests, and all notices. Ship an explicitly identified Emit
port: adapt the declaration/imports and the small evaluator-dependent body region,
provide real-number absolute-error comparison, and retain the portable runner and
macro implementation. Keep a reproducible patch against the pristine source and
document every adaptation. The port must import only implemented libraries and
initialize without an evaluator. Do not advertise another Scheme's feature to
select its branch, or create an empty `(scheme eval)` provider.

Export `test-read-eval-string` as an explicit unsupported operation naming the
missing evaluation capability. Complex comparisons are unsupported consistently
with Emit's numeric tower. Retain assertions, exceptions, grouping/cleanup,
selection/skipping/expected failures, result counters, and runner callbacks.
Test these against the [SRFI 64 specification](https://srfi.schemers.org/srfi-64/srfi-64.html).
Document the API coverage and evaluator exception rather than calling this full
SRFI 64 conformance. Do not replace it with a tiny always-pass test shim.

Alternative: implement `(scheme eval)` to keep 0.1.7 untouched. Rejected here
because an evaluator with environment semantics and standalone behavior is a much
larger feature than enabling existing package assertions.

### D5: Execute upstream tests with a failure-aware external runner

Before package acceptance, fix the shared expander's handling of internal
procedure definitions (#128), as approved by the user. `exp-body` already gathers
the mutually visible internal names, but its generic recursive traversal treats
`(define (callback . args) body)` as applications, eventually mapping over `args`.
Normalize valid internal definitions to `(define name initializer)` using the
existing definition normalization, then expand the initializer in the complete
body scope. A procedure initializer becomes a lambda, so existing formal-binding
logic preserves dotted/rest-only signatures and lexical macro shadowing. Keep
malformed definitions on the existing parser diagnostic path; do not broaden
support for internal syntax definitions or change the hygiene model.

Cover rest-only/dotted/fixed signatures, a formal that shadows a macro keyword,
internal mutual references, and malformed variable definitions. Exercise ordinary
programs and imported library procedures through source-driven tests now and all
native commands after the regeneration barrier. Keep the original SRFI 64
callback unchanged. A package-local lambda rewrite was rejected because the same
valid Scheme form must work for user libraries and programs.

Execute every assertion in the pinned SRFI 1/2/8/227 `test.scm` files without
rewriting their sources, changing imports, dropping assertions, or appending code
after their unconditional exits. In a generated driver, import SRFI 64, install a
custom runner factory, then include the upstream file. The final callback records
pass/fail/xpass/xfail/skip totals and group completion before upstream `(exit 0)`.
Use a dedicated result port/file so program output cannot forge completion.
The shell runner requires successful compile/process status, exactly the expected
groups and pinned assertion counts, zero failures/xpasses, and no unexpected
skips/xfails. Derive and record exact counts during initial source verification.

The external driver selects SRFI 1 before base to exercise its `fold-right`,
which collides with Emit's base extension under the preserved first-import-wins
rule. Install the selected custom runner explicitly as current as well as through
the factory; the pinned SRFI 64 default installer directly creates its simple
runner. Neither adjustment changes upstream test files or import policy.

SRFI 1's shortest-list helpers use `(abort '() '())`. For the user-approved #129
extension, change the captured continuation to accept a rest argument list and
package it through `values` before `%escape-to`. The native escape interface still
carries one machine value, which already represents zero/many Scheme values.
Keep liveness checking before unwinding, preserve inner-first after thunks and
parameter restoration, and retain rejection of calls after capture extent ends.
This does not introduce re-entry, a new ABI, or a separate control mechanism.
Test zero/one/many deliveries, normal multiple-value returns, nested escapes,
cleanup/restoration, and expired continuations invoked at different arities.

Prove failure detection using a separate intentional failing suite that exits 0,
and a child that terminates without a completed result. Keep upstream tests intact.
This adapter is test infrastructure, not a change to SRFI 64 exit semantics.

Run all four suites through Chez AOT, native `emit run`, delivered native build,
and REPL stdin in fresh processes. Keep the existing concise smoke programs for
interactive continuation after import, transitive macros, warm caches, and moved
executables. Validate SRFI 64 independently with focused semantic checks plus the
compatible parts of its upstream test, listing evaluation-dependent exclusions;
there are no exclusions from the four target package suites. Package test success
is evidence about those versions, not all SRFI implementations or all conformance.

### D6: Explicit artifacts are a validated native Emit full-unit handoff

Keep `emit lib SRC -o DIR` and the manifest `(artifacts DIR)` syntax. `emit lib`
publishes the requested full unit's `.ll`, `.exports`, and a versioned readable
`.artifact` metadata sidecar; each dependency is separately compiled or reused
by the existing closure resolver. Users can publish a reusable closure by invoking
`emit lib` for each non-baked provider and mapping each to the directory. This
change does not imply that compiling one unit publishes its dependency closure.
Only native Emit produces and consumes this explicit artifact format. Independent
Chez/native compilation comparisons remain correctness gates; byte-identical IR
and exports do not imply metadata compatibility or an interchange guarantee.

Fix the shared renderer's string arm before accepting interface reuse (#130).
Encode quotes, backslashes, newline/return/tab and remaining ASCII controls with
syntax accepted by both readers; terminate hexadecimal string escapes with `;`.
Keep ordinary non-control characters unchanged and retain graph-label handling
in the existing node renderer, so repeated references to a string remain shared.
Both strict artifact and loose diagnostic rendering use the same string encoder.
Accumulate encoded pieces and join once, avoiding repeated prefix copies. Verify
round trips, nested macro templates, shared strings, and cold/warm imported-macro
execution; run prepared native explicit-artifact checks after regeneration.

The metadata contract covers:

- declared library identity, full-unit kind, and format version;
- producing Emit executable identity, runtime ABI, and IR target compatibility;
- resolved source/include paths and content digests;
- every consulted library-availability answer;
- resolved dependency identities, their semantic export interfaces (including
  macros and call rows), and dependency artifacts used by this unit;
- digests of the exact published IR and export bytes, as one generation.

Use the existing digest of the running Emit executable as the producer/compiler
identity. Reuse requires that digest to match the consuming executable; otherwise
fall back even when both builds happen to have identical compiler semantics.
Rebuilding or relinking Emit can therefore cause conservative invalidation. This
cost is accepted in exchange for avoiding a shared source fingerprint, a new
bootstrap identity record, and build-time identity embedding. An installed native
consumer must not need compiler sources or consult a nearby source tree. If its
executable identity cannot be determined, refuse explicit reuse and fail requested
publication rather than emit unverifiable metadata. Record runtime ABI and target
compatibility separately, including compatibility inputs not already covered by
the executable digest. Keep the private central/native machine-code cache's
existing executable/LLVM/CPU/profile identity and admission checks unchanged.

Resolve source providers and dependencies before validating explicit artifacts.
For an explicitly configured directory, try the validated unit first, then a
compatible private full-unit cache, then source compilation. Provider precedence
still selects the source; artifacts cannot redirect a name to another provider.
Hash the current selected sources/includes, recheck feature answers and effective
dependency interfaces, validate payload digests and parse the full pair before
registering anything. Missing source remains an error under the current resolver;
this is not source-free distribution. Full artifact reuse requires no compilation
of that unit; dependency resolution/validation remains necessary.

Leave the Chez driver's existing same-host `.stamp` mechanism separate. It neither
produces nor admits the native `.artifact` format under this contract. Run Chez
parity tests with isolated output directories so its legacy artifacts cannot
overwrite native explicit payloads. A missing/old/unknown native sidecar, including
a legacy Chez-only pair, never makes an unvalidated pair eligible for native
explicit reuse. An invalid explicit unit
falls back without partial registration; unrelated valid dependencies remain
usable. Validate dependency compatibility in the fallback too so an old private
cache cannot undo explicit-unit invalidation.

Write payload files via temporary files and atomic replacement, publishing the
metadata last. Digest checks prevent an old sidecar from authenticating replaced
payloads during interrupted/concurrent writes. Concurrent producers can cause a
miss but never mixed-generation admission. A successful `emit lib` must publish a
complete verifiable unit; an unwritable requested output directory is an emission
error. Consumers can use read-only artifact directories and write rebuilt entries
only to their private cache; failure to write an accelerator is nonfatal.

When the private native cache has no usable location, register no object-capture
group (#131). An empty cache stem is not a shared identity: otherwise a later
single-module library replaces the baked set's larger capture vector and a baked
callback can write past its end. Guard group/member lookup defensively; retain
ordinary IR compilation and execution without capture. This implements the
existing nonfatal-unwritable-cache contract, not a new cache identity policy.

For AOT, admit a full unit as the authoritative interface/full-IR input. Existing
source-based pruning may still compile a distinct root-specific unit. Do not link
a full JIT object instead of pruned IR or claim that all AOT source compilation is
eliminated. `--dump-all` bypasses artifact reuse when compilation stages are asked
for. Verbose stderr distinguishes explicit reuse, private cache hits, stale
reasons, and source compilation, naming paths and libraries per `docs/OUTPUT.md`.

Alternative: require Chez/native artifact interchange using a common compiler-core
fingerprint. Rejected with user approval: Emit is bootstrapped and standalone,
so native-only publication/reuse meets the workflow without new regeneration-owned
identity machinery. Chez remains valuable for independent verification.

Alternative: copy native cache filenames or Chez stamps into the output directory.
Rejected because a filename or legacy stamp alone does not establish the complete
source/dependency/payload contract needed here. Reusing the native executable
identity does not mean reusing the private cache's file layout.

## Risks / Trade-offs

- [SRFI 64 reveals additional compiler defects] -> Run source-driven tests early;
  file concrete reproducers and revise scope if necessary. Do not suppress target
  package failures or silently start an evaluator/hygiene rewrite.
- [Identity validation admits incompatible code] -> Require the running executable
  digest, validate runtime/target compatibility and changed inputs, and preserve
  existing native-object admission checks. Conservative misses after relinking
  are acceptable; compatibility across distinct executable digests is not promised.
- [Torn metadata admits mixed IR and exports] -> Validate both digests before any
  registration; test interrupted publication and concurrent producers.
- [Equal results conceal recompilation] -> Use fresh private caches, explicit
  artifact narration, and compilation counters; test Emit-produced artifacts
  across native consumers separately from independent Chez parity checks.
- [Artifacts inflate AOT delivery] -> Preserve root-specific pruning and compare
  representative binary sizes and symbols before/after. No universal SRFI prelude.
- [Installed sources drift from test fixtures] -> Verify shipped-file digests,
  the port patch, include closure, notices, and staged install behavior offline.

## Migration Plan

Implement and verify source-driven fixes and the library port first, then the
native Emit artifact contract and install/test integration. Finish every compiler-source
edit and scoped formatting before `make regen`. Run focused native checks, then
`./run-all-tests.sh` and `./run-dev-tests.sh` with no compiler edits in between.
Record original full-run exit statuses; clean reruns do not rewrite earlier results.

Old private cache entries invalidate by existing identities; legacy explicit pairs
without compatible metadata safely recompile. No user source migration is needed.
Rollback restores implementation and regenerated bootstrap together; added source
libraries and disposable metadata introduce no irreversible data migration.

When implementation is requested and complete, fixing commits reference #117,
#123, #125, #126, #128, #129, #130, and #131 as appropriate. Run trust-check after the implementation and
bootstrap are committed, then synchronize/archive this change. This proposal does
not commit, close issues, change main specs, or begin implementation.
