# Tasks

Implement the contracts in `specs/` using the decisions in `design.md`. Keep each task's tests and documentation with that work. Ordinary tests must be self-contained; explicit upstream reference verification declares its optional tools. Use sub-agents for decomposable port/test work per AGENTS.md, with a single owner of compiler inputs and the regeneration barrier.

## 1. Pin references and establish independent fixtures

- [x] 1.1 Record Malt revision `92a3e63` with full commit identity, source-file mapping, copyright/license notices, and adaptation inventory; verify every spec export maps to an upstream definition or a documented Emit addition.
- [x] 1.2 Pin the SRFI 27 integer MRG32k3a reference revision and retain its pristine reference/license; document the initial state, stream-index jump mapping, state representation, and local adaptation strategy, verified against the upstream reference sources.
- [x] 1.3 Produce independently computed integer/state/jump fixtures with arbitrary-precision host arithmetic, including maximum supported stream indices and mixed-draw replay; verify that the fixture generator is independent of the planned Emit implementation and records inputs and digests.
- [x] 1.4 Add a pinned Racket Malt fixture adapter for tensor values, extension, AD, optimizer updates, and scalar quadratic convergence; commit tolerances and expected data, verify reference regeneration, and ensure ordinary fixture consumers run without Racket or the Malt checkout.
- [x] 1.5 Prepare the design's 2-to-8-to-1 XOR fixture and choose a reproducible Emit stream pair using an independent host generator; commit initial tensors/sample schedule and verify the reference converges under the fixed 4000-step settings, each prediction within `0.1` and total squared error below `0.04`, before port outputs are accepted.

## 2. Add the minimal entropy support and validate compiler integration

- [x] 2.1 Implement the private bounded `%random-entropy` runtime operation, compiler recognition/call/declaration plumbing, and required native symbol registration; verify zero public base exports are added and source-driven compilation emits the correct runtime call.
- [x] 2.2 Add controlled provider tests for complete input, interruption/short reads where applicable, failure, and request bounds; verify all-or-failure return behavior and real-provider smoke tests on supported macOS/Linux hosts.
- [x] 2.3 Document the private operation and entropy failure contract beside the random-library implementation notes; verify deterministic source construction/import does not invoke entropy.
- [x] 2.4 Finish and format compiler-source edits, run source units, then explicitly run `make regen` without editing compiler inputs during its validation; verify full native regression, source units, classified targeted reference suites, and `bash tools/test.sh source` pass with retained reports before proceeding to library-only work.

## 3. Implement reusable SRFI 27 random sources

- [x] 3.1 Add `(srfi 27)` source records, MRG32k3a recurrence, and overflow-safe modular jump arithmetic; verify initial-state and indexed-stream known answers, maximum indices, intermediate numeric bounds, and distinct source identity.
- [x] 3.2 Implement bounded integer rejection sampling across `1..2^60-1`; verify controlled rejection cases, small awkward bounds, bounds above the generator modulus, maximum bounds, and deterministic consumption rules including `n=1`.
- [x] 3.3 Implement open-interval real generation and supported unit validation; verify exact mixed integer/real replay, no endpoints, resolution, and rejection of unsupported precision and nonfinite inputs.
- [x] 3.4 Implement default generators, source snapshots, transactional restore, indexed reseeding, and entropy randomization; verify shared-generator state, independent sources, readable state round trips, alias isolation, malformed inputs, and unchanged state on failure.
- [x] 3.5 Add the stable SRFI 27 suite to the test registry/classifier and provenance checks; verify source-driven, run, REPL, explicit library artifact, and standalone checks report expected assertion counts and completion.
- [x] 3.6 Document all SRFI 27 exports, numeric limits, initial/seeded sequence guarantees, state format/version, draw consumption, randomization, and intended uses; verify the documented seed/save/restore example on native paths.

## 4. Port tensors and function extension

- [x] 4.1 Add the internal library skeleton, scalar dual representation, list/vector helpers, and construction/indexing/selection operations with explicit arithmetic imports; verify the mapped upstream basics and shallow-conversion fixtures.
- [x] 4.2 Implement checked shape/rank/build/reshape behavior, scalar shape `()`, positive-dimension policy, and diagnostics; verify rectangular and ragged inputs, nonnumeric leaves, invalid indices, mismatched counts, row-major order, and preserved dual identity.
- [x] 4.3 Port unary/binary base-rank extension and its aliases; verify scalar/vector and differing-rank cases against upstream fixtures and reject singleton/equal-rank mismatches according to Malt rules.
- [x] 4.4 Add a stable tensor suite and user documentation for construction, shape validation, and the positive-dimension adaptation; verify source-driven and native tensor fixtures and runnable prefixed examples.

## 5. Port reverse-mode AD and operations

- [x] 5.1 Port structured traversal, gradient entry points, and backward callbacks using one fresh mutable identity table per calculation; verify shared-node accumulation, equal-valued distinct nodes, unused inputs, multiple output leaves, repeated calls, and nested accumulator isolation.
- [x] 5.2 Port primitive constructors and scalar arithmetic/transcendental/comparison operations with ASCII names; verify analytic and central finite-difference gradients at smooth points and pinned rectification-zero/tie conventions.
- [x] 5.3 Port reductions, matrix-vector multiplication, correlation, flattening, concatenation, and all specified primal/base-rank exports; verify values, shapes, gradients, and upstream fixture coverage for every operation group.
- [x] 5.4 Add a stable AD suite, export-inventory assertions, and documentation for gradient calling conventions, arithmetic namespaces, ASCII mappings, and Emit numeric differences; verify source-driven/run/REPL/build agreement and explicit-artifact macro/runtime imports.

## 6. Implement hyperparameters, distributions, and diagnostics

- [x] 6.1 Define shared hyperparameter objects and syntax-rules declarations/binding macros; verify imported procedures see dynamic overrides, custom explicit exports work, unset required values raise named errors, and nested normal/exception/escape exits restore settings.
- [x] 6.2 Port grid search over parameter objects; verify trial order, first success, exhaustion, and restoration between trials and after predicate/body failures, and document parameter getters/setters instead of generated identifiers.
- [x] 6.3 Implement `current-random-source`, uncached Box-Muller normals, and initialization helpers; verify source switching, exact replay of draw/state sequences, variance versus standard deviation, invalid parameters, and broad deterministic distribution sanity checks.
- [x] 6.4 Implement explicit printable conversion, trace/check helpers, `(record name value)`, and handler scoping; verify rendering limits, unchanged return values/gradients, named callback order, default silence, and restoration when the body or handler raises.
- [x] 6.5 Extend the relevant stable suites and document hyperparameters, seeded initialization, and synchronous recording; verify examples under source-driven compilation and each native execution path without Racket macros, threads, or global printer hooks.

## 7. Port training and expose the public facade

- [x] 7.1 Port layer/model/block composition and accuracy helpers; verify fixed tensor fixtures for every exported family, including correlation/recurrent-style blocks and stacked shape declarations.
- [x] 7.2 Port squared-error, cross-entropy, and KL losses and their gradients; verify pinned finite-input fixtures, declared domain behavior, and named loss-record events.
- [x] 7.3 Port revise/general descent and naked, velocity, RMS, and Adam optimizers with upstream smoothing/epsilon rules; verify independent one-step/multi-step state updates and the 500-step scalar quadratic answer within `1e-9`.
- [x] 7.4 Port minibatch sampling and sampling objectives with explicit draw order; verify replacement semantics, index ordering/ranges, seeded replay across initialization plus sampling, and active-source isolation.
- [x] 7.5 Add `(malt learner)` re-exports exactly matching the spec and a stable training suite; verify no placeholders, no accidental private exports, and full API inventory checks with both prefixed and explicit-exclusion imports.
- [x] 7.6 Add the runnable seeded XOR example and training documentation; verify the precommitted reference settings/thresholds under run, REPL, and standalone execution, and compare common fixed-data computations against the pinned Racket fixtures.

## 8. Package and verify the installed closure

- [x] 8.1 Extend Makefile library/source-data discovery for Malt's facade/internal directories, SRFI 27, includes, and notices; verify repeatable PREFIX/DESTDIR staging contains the complete closure and no test/reference fixtures or compiled library artifacts.
- [x] 8.2 Add stable installed acceptance and changed-input classification for both libraries; verify imports and run/REPL/build checks outside the checkout with empty private caches, offline operation, project-provider precedence, and standalone execution with source lookup unavailable.
- [x] 8.3 Extend provenance/source-release/install checks and module documentation without weakening existing SRFI guards; verify all recorded notices/digests/adaptations, source-release closure, and runnable installed examples.
- [x] 8.4 Measure tensor/AD, scalar training, and XOR duration/memory/binary size and a no-import executable baseline; verify no unwanted retained learner/PRNG/entropy symbols, document host/toolchain/input sizes, and record material performance debt in `docs/PERFORMANCE.md` if found.

## 9. Complete integration validation

- [x] 9.1 Add one next-minor `VERSION` bump and matching nonempty `CHANGELOG.md` section for the implemented feature set; verify consistency with the implementation PR's actual base and release policy.
- [x] 9.2 Run the registered native suites, full regression, source units, classified targeted reference suites, isolated source comparison, and release-required complete independent-host verification; verify all required reports pass for the final source/bootstrap inputs and preserve suite IDs/results.
- [x] 9.3 Validate the final delta specs against the implemented exports/behavior and run `openspec validate add-malt-learner --strict`; verify tasks are supported by passing evidence and document any intentional compatibility differences before finishing.

## Workflow follow-up

- Use `emit-finish-change` to preflight, sync specs, archive this change, commit, and prepare one reviewable pull request when implementation is complete. Keep archive/PR actions outside tracked implementation task progress.
- Do not merge as part of preparation. A reviewed versioned PR merge is release approval; follow the normal release handoff afterward if requested.
