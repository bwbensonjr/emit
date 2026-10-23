# Design

## Context

See `proposal.md` for the bounded issue inventory and motivation. The working tree has no active OpenSpec changes; the distribution work mentioned in the issue bodies is already represented by current packaging files and main specs. Existing uncommitted skill/command updates are unrelated and must be preserved.

The relevant implementation already provides most of the machinery:

- `src/parse.ss` collects definitions into `binds` and expressions into `pre`. `build-program` evaluates every initializer before `pre`. It also has a separate duplicate-name fallback, while `build-body` uses the same builder with stricter internal-definition rules.
- `test/test-runner-tests.py` probes descendant liveness and then performs an `exists()`/`read_text()` pair on `/proc/<pid>/stat`. Reaping can remove the file between those calls.
- `tools/llvm-env.sh` intentionally prefers PATH clang without overrides. `emit_doctor` in `src/emit.cpp` searches for `clang version ` and compares its major to `LLVM_VERSION_MAJOR`, including Apple banners by accident.
- `src/emit.cpp` has baked-set and disk-unit portable caches, export-registration metadata, full-unit native-object caches, and compiler/source/dependency/environment identities. Native compilation is lazy: merely adding IR does not ensure an object was generated.
- `preload_libraries` already registers manifest libraries without calling their runtime initializers. Its per-descriptor `say` calls, `say_manifest`, and provider narration produce the startup listing.
- `Makefile` installs the binary, source payload, support files, and optional toolchain pin. Homebrew, Nix, and OCI recipes wrap this target. The current install-layout test explicitly assumes installation never creates cache entries, so that assertion must be narrowed to deferred/staged installs.

Existing specs require default per-library provenance and use an undifferentiated clang-major check. The deltas deliberately update these contracts. The cancellation fix satisfies the current development-validation contract and adds no capability.

## Goals / Non-Goals

**Goals:** retain the shared compiler core, make effects agree across execution paths, use one cache implementation for warm and ordinary invocations, and make successful explicit warming verifiable.

**Non-Goals:** introduce a new command verb, change toolchain discovery precedence, make doctor compile a probe, ship native library objects, initialize arbitrary user libraries during installation, precompile every optional SRFI, warm every JIT optimization profile, or promise that cache warming eliminates all startup work.

## Decisions

### 1. Represent top-level effects in one ordered binding stream (#140)

Keep the program's binding group and letrec* lowering. Turn each non-final top-level expression into a binding with a compiler-generated fresh name at its source position. Preserve the final expression as the program's value. Record-type bindings stay at the position of their declaration. Use the existing fresh-name facility so source bindings cannot capture generated ones.

Pass that ordered stream through both the normal letrec path and the duplicate-definition sequential-assignment fallback. Preserve the existing forward procedure scope and internal-body definition-prefix check; `build-body` does not start accepting interleaved definitions. Retain the existing requirement that the program ends in an expression.

Splitting the program into nested independent scopes would complicate mutual references and top-level redefinitions. Rejecting interleaving would discard accepted programs and fail to fix the reported semantics. The ordered stream uses the downstream initialization order already present. Regression cases must include exceptions and discarded values so an intermediate effect is neither dropped nor moved by optimization.

### 2. Observe process disappearance atomically enough for the test (#146)

Remove the `/proc` existence pre-check. Read status inside `try`; disappearance reported by `FileNotFoundError` or `ProcessLookupError` means the descendant is gone. An observed zombie also satisfies the existing Linux tolerance. A live process keeps polling until the existing deadline and still fails the test.

Preserve the `os.kill(pid, 0)` liveness check and its existing platform behavior. On platforms without procfs, an absent `/proc` hierarchy alone must not imply a live process was killed: only use stat-file disappearance as evidence on Linux with procfs available. Do not broaden catches to permission errors or malformed status data. Increasing the timeout would leave the race intact.

### 3. Classify compiler identity before comparing major versions (#139)

Recognize an Apple clang banner before the generic upstream substring. Continue displaying the effective executable, origin, and full version. Label Apple textual-IR compatibility `unverified`; do not fail solely for its vendor major and do not claim a compatibility proof. Upstream clang retains the current age rejection, unavailable or unidentifiable compilers remain errors, and other installation failures still determine the exit status.

Choosing LLVM's clang by default would alter an intentional discovery policy and source-install behavior. A functional probe would conflict with doctor's read-only/no-compilation contract. The issue reproduction already establishes that its Apple toolchain links successfully; planning does not extend that result to every Apple release.

### 4. Add `emit build --stdlib` as a strict cache-producing mode (#148)

Dispatch this mode before ordinary program-name/default/stdin handling. Permit help and verbosity controls; reject program/file/output arguments, resolver-selection flags, JIT profile flags, and stage-dump flags. Ordinary `emit build` remains the closed-world AOT pipeline.

Select the invoked installation's default manifest by real executable-relative payload, with its compiled-prefix fallback. For a checkout executable, use the checkout associated with that executable, rather than the caller's working directory. Use the selected default manifest's complete entry inventory plus the declared baked set; currently that is the two baked members and the ten non-baked `scheme`/`emit` entries in `emit-libs.scm`. This is not a recursive scan of all installed libraries and does not include optional SRFIs. Ignore ambient resolver configuration for this mode and do not modify process-wide resolver policy for other modes.

Initialize the embedded compilation session and resolver, register the baked set, and compile/register disk units in dependency order using the existing full-unit IR and compile-time-interface machinery. Reuse valid portable entries and preserve their source/include/feature-query/dependency provenance. Failure to read, resolve, or compile any requested unit fails the explicit command; do not reuse the REPL preload's report-and-continue semantics as a success result.

Create a default `-O1` JIT with the normal native signature and submit the full library modules through the existing object adapter. Force materialization by looking up each unit's initializer symbol without invoking it. This generates reusable native objects even though ORC is lazy, without running library bodies. Do not call the REPL startup path, which invokes baked initializers and would couple this command to prompts and session behavior.

The current cache writers intentionally return without failing ordinary commands. Add an explicit result/verification path for warming: success requires complete portable entries and native completeness witnesses that a fresh consumer can validate. Reuse the existing keys, atomic writes, validation, and object adapter instead of creating a second cache format. Cache failure remains best-effort for ordinary execution, but explicit warming returns non-zero when its requested output did not persist.

Report the selected payload and destination at the start, then reused/generated counts, output bytes, and duration. Detailed per-library work stays verbose. No executable or library initializer runs, stdout remains empty, and no cache file is written in the prefix.

Calling `emit lib` separately would produce explicit artifacts rather than directly populate both shared cache tiers. Starting a REPL and importing everything would run initialization effects. Preparing portable IR alone would leave native code generation as a first-use cost. Warming all optimization profiles would multiply install work without serving the default startup case.

### 5. Warm after user installation, defer build environments (#148)

Add `WARM_STDLIB` with default enabled to source installation. After all payload files and any toolchain pin are installed, an unprivileged install with empty `DESTDIR` invokes the installed binary. Locate its own payload explicitly, even when make was run from the repository. Repeated installation recopies the same payload and reuses still-valid cache entries.

Skip automatic warming for nonempty `DESTDIR`, root, or `WARM_STDLIB=0`; explain the deferral and the command for the eventual user. Do not infer a user's identity or rewrite HOME. A failed automatic warm warns with the failed destination/library and retry command but leaves a successful source installation available; direct `emit build --stdlib` remains strict.

Set `WARM_STDLIB=0` during Homebrew's build/install stage and invoke the installed command from `post_install`, including bottle installs. Keep that hook best-effort. Nix and OCI builds also explicitly disable warming and document a per-user invocation after installation. They do not put CPU-specific cache entries in their immutable/store/image payload. Privileged and sandboxed installs therefore retain a documented first-user preparation step; automatic preparation is guaranteed only for the applicable user-install workflows.

### 6. Scope aggregation to REPL startup (#149)

Build one summary from the resolver's effective ordered, deduplicated providers, naming manifest paths and conventional roots on a single stderr line. With no filesystem providers, name the baked set. The example shape is `resolve libraries -> MANIFEST, ROOT, ...`; it is a source summary, not a line per library.

During startup, send individual manifest, root, chained-source, and descriptor-resolution details through verbose narration. Scope this behavior to startup: explicit interactive imports and other commands keep their existing provenance reporting. Errors always remain visible. Avoid simply changing every resolver `say` to `vsay`, which would silently remove diagnostics from unrelated commands. Update `docs/OUTPUT.md` and output assertions to match the new exception to its current default per-selection rule.

## Risks / Trade-offs

- Ordered synthetic bindings can interact with duplicate definitions or optimizer effect analysis. Cover both lowering branches and compare native, REPL, and independent source results before regeneration acceptance.
- Native materialization may expose unresolved symbols even without executing initializers. Register the complete dependency closure before forcing lookups and preserve the normal runtime symbol generator.
- Warming increases installation time and storage. Warm only the shipped manifest and default profile; report measured cold and repeated-warm work, with no unsupported numerical target.
- An Apple clang marked unverified can still reject future IR. Keep that status explicit and preserve actual `emit build` compiler errors; doctor's zero exit is not a compatibility proof.
- Privileged, staged, and sandboxed installs cannot identify the eventual user's cache safely. Defer visibly instead of claiming those users are already warm.
- Existing cache identities bind executable/source locations and native environment. Relocation, rebuilds, and other profiles may miss normally; source-based installation remains sufficient.
- Linux reaping is nondeterministic. Exercise the missing-status branch deterministically as well as running the actual cancellation test, without weakening its live-child deadline.

## Migration Plan

Implement the host/test fixes, warming, installer hooks, and narration changes with their focused checks. Update tests that assume every install leaves a cold cache to explicitly request deferred warming, and add warm-install coverage with isolated user cache locations. Validate staging and package templates without relying on a developer's real cache.

Complete the compiler-source edit and run source units during iteration. Format changed covered Scheme sources with the pinned formatter without mixing an unrelated whole-set reformat into the change. Then cross the explicit `make regen` barrier and finish full compiler acceptance without editing compiler inputs again. Native feedback before this barrier is not acceptance for the edited compiler.

No cache migration is required: existing identities invalidate entries when the executable changes. Reverting the change removes the build mode and hooks; source installs remain usable, and stale user cache entries can be left to existing invalidation. Each issue's fixing commit should reference `Fixes #N`; issue closure follows implementation and its acceptance evidence, not proposal creation.
