# Tasks

## 1. Baseline and LLVM integration seam

- [x] 1.1 Record empty-portable-cache, warm-IR-cache, and first-import baselines for the baked set,
  a small ordinary library, and `(scheme char)` at `-O0`, `-O1`, and `-O2`; verify the measurement
  file identifies IR parse, transform, materialization, and total wall time rather than reporting
  only an aggregate.
- [x] 1.2 Build a focused ORC probe using the supported LLVM headers that captures the object buffer
  produced by the IR compile layer and later admits it with `addObjectFile`; verify cross-object and
  host `rt_*`-style symbols resolve and document any LLVM 19/current API compatibility wrapper the
  implementation requires.

## 2. Native entry identity and storage

- [x] 2.1 Add a canonical JIT signature covering the native format, Emit executable, LLVM identity,
  target triple/data layout, CPU feature set, relocation/code models, and optimization profile;
  verify focused tests change the native key when each modeled input changes and keep it stable when
  inputs are identical.
- [x] 2.2 Add distinct disk-unit and baked-set native entry layouts derived from validated portable
  identities, with one object per library unit and set-level consistency for baked members; verify
  entries are written only beneath `EMIT_CACHE` or the platform user cache and never beneath the
  checkout artifact directory or install prefix.
- [x] 2.3 Implement atomic object/metadata writes, a last-written completeness stamp, object-content
  digest verification, and LLVM structural parsing before admission; verify missing, truncated,
  mutated, mismatched, and partially written entries are all reported internally as misses before
  entering a JIT.
- [x] 2.4 Extend the cache test fixtures with safe native-entry inspection and mutation helpers;
  verify the helpers can identify one exact compiler/source/profile entry without broad globs or
  deleting unrelated user cache data.

## 3. Object generation and reuse

- [x] 3.1 Isolate LLVM native-object capture and admission behind one host adapter, wire cold IR
  materialization to store the post-transform object under its module's native identity, and verify
  a library that is compiled but never materialized creates no native object.
- [x] 3.2 Add host-level native lookup before library IR parsing and admit a valid hit through ORC's
  object layer; verify instrumentation shows zero library IR parses, transforms, and code-generation
  events on a warm hit while the library initializer and exported procedures execute normally.
- [x] 3.3 Make every native miss or pre-admission failure fall through to the existing portable IR
  path and optionally replace the entry; verify absent, stale, incompatible, corrupt, unreadable,
  and unwritable cases produce the same value and diagnostic bytes as native caching disabled.
- [x] 3.4 Bypass native lookup and capture when `--dump-all` requests library compilation stages;
  verify a warm native cache prints the same tagged library-stage coverage as an empty cache while
  ordinary `--dump` retains its existing behavior.

## 4. Command and REPL semantics

- [x] 4.1 Enable native objects for full library units in `emit run`; verify cold execution creates
  objects, a later process reuses them at each optimization profile, transitive imports resolve, and
  stdout agrees byte-for-byte with the IR-only path.
- [x] 4.2 Enable native objects for baked and manifest libraries in `emit repl` without changing
  registration or initialization control; verify an exact manifest object admitted at startup stays
  unlinked until import, dependencies initialize first, repeated imports initialize once, and later
  forms call its exports.
- [x] 4.3 Exercise conventional-path on-demand registration with a mixed native-hit/IR-miss dependency
  closure; verify transaction failure publishes no imports and the next valid REPL form still runs.
- [x] 4.4 Keep `emit build` and `emit lib` outside native consumption; verify delivered executable
  behavior and size, tree-shaking roots, portable `--emit` bytes, and public `.ll + .exports`
  artifacts are identical with an empty versus populated native cache.
- [x] 4.5 Verify dev-to-ship fidelity across cached and uncached `-O0`, `-O1`, and `-O2` sessions for
  values, effects, diagnostics, macros, cross-unit direct calls, mutable exports, symbol identity,
  and initialization counts, and compare the same program with `emit build`.

## 5. Narration, metrics, and documentation

- [x] 5.1 Narrate native misses, generation, and reuse with the library, profile, bytes, and relevant
  timing on stderr, and add aggregate native counts/timings to the verbose JIT summary; verify default
  output stays concise, `EMIT_VERBOSITY=quiet` is silent, and stdout is byte-identical at every
  verbosity.
- [x] 5.2 Document the portable and native cache tiers, key inputs, local-install behavior, safe
  deletion, REPL materialization timing, and why AOT continues to consume IR in `docs/MODULES.md` and
  `docs/OUTPUT.md`; verify every documented command and representative narration line against the
  built command.
- [x] 5.3 Re-run the baseline protocol with native reuse enabled and record cold generation, warm
  object admission/linking, first-import latency, wall time, and disk growth in
  `docs/PERFORMANCE.md`; verify the measurements explicitly compare the baked set, a small library,
  and `(scheme char)` and update P17's cache-growth accounting.

## 6. Integration gates

- [x] 6.1 Register the focused native-object cache suite in both narrated test workflows and verify
  suite discovery counts, stderr narration, `EMIT_VERBOSITY` behavior, and temporary-cache isolation.
- [x] 6.2 Build and run the focused artifact-cache, unit-pipeline, JIT-optimization, REPL module,
  install-layout, hybrid-resolution, dump-stage, tree-shaking, and backend-equivalence suites; verify
  every suite passes on a cold and warm cache where applicable.
- [x] 6.3 Verify the LLVM compatibility adapter builds and the focused native suite passes against
  LLVM 19 and the current supported LLVM release on macOS and Linux, recording unavailable matrix
  legs explicitly rather than treating them as passing.
- [x] 6.4 Run `make format-check`, `./run-all-tests.sh`, and, after the implementation commit makes
  trust-check meaningful, `./run-dev-tests.sh`; verify both full workflows report zero failures and
  `git diff bootstrap/` remains empty because the change modifies no compiler source.
