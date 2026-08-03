## 1. Reproduce and pin the current behaviour

- [x] 1.1 Reproduce the defect from outside the repo: from `/tmp`, confirm a plain program runs
      (baked `(scheme base)`) while `(import (scheme inexact))` fails with
      "program imports a library not found in the manifest" — for `emit run` and `emit repl`.
      **Reproduced, and worse than filed:** the run door behaves as the issue describes, but the
      REPL door from `/tmp` has no `(scheme base)` *at all* — it warns
      "auto-import (scheme base): (scheme base) not loaded (missing from manifest?)" and `map` is
      unbound, leaving only primitives. The REPL resolves `(scheme base)` through the manifest
      (eager, mode 5) instead of using the baked prelude, so an installed REPL loses the whole
      standard library, not just `(scheme inexact)`.
- [x] 1.2 Record the pre-change baseline: full `make test` green, and note which suites capture
      stderr (the ones D6's narration could perturb).
      **Baseline:** `./run-all-tests.sh` = 19 suites, 0 failed, 297s. (`make test` is not a target;
      the runners are `run-all-tests.sh` Chez-free and `run-dev-tests.sh` Chez-gated.)
      **stderr audit:** the suites that capture stderr and assert on it — `modules-repl-tests.sh:41,51`,
      `prelude-base-repl-tests.sh:34,46`, `modules-run-tests.sh:28`, `dynamic-extent-tests.sh:41`,
      `io-ports-tests.sh:50`, `numeric-conformance-tests.sh:40,60,80`, `fixnum-overflow-tests.sh:48`,
      `library-body-declarations-tests.sh:45`, `library-toplevel-set-tests.sh:72` — all match with
      `grep -q` on a substring rather than comparing the whole stream, so an added narration line
      is safe. No suite asserts on exact stderr content.

## 2. Host: manifest lookup and path resolution (`src/emit.cpp`)

- [x] 2.1 Add `resolve_manifest(flag)` implementing the ordered lookup (D1, D2): `--manifest`,
      `EMIT_MANIFEST`, `./emit-libs.scm`, `<realpath(argv[0])>/../share/emit/emit-libs.scm`,
      `EMIT_PREFIX/share/emit/emit-libs.scm`. Candidates 1–2 report the named file as missing
      rather than falling through; 3–5 fall through silently. Reuse the `realpath()` approach
      from `repo_root()` (`:180`).
- [x] 2.2 Replace the four duplicated `mp ? … : "emit-libs.scm"` sites — `:409` (run), `:579`
      (build), `:867` (repl), `:956` (lib) — with calls to it, so no door keeps its own copy.
- [x] 2.3 Join relative manifest paths against the manifest's directory (D3) before every read:
      `preload_user_libraries` (the `path_of` table and the closure walk, `:255-270`),
      `preload_libraries` (`:583+`), and `resolve_program`'s `src`/`out` (`:300+`). Absolute
      paths pass through unchanged.
- [x] 2.4 Add `-DEMIT_PREFIX="$(PREFIX)"` to the `build/emit.o` compile (`Makefile:97-98`) with
      `PREFIX ?= /usr/local` (D5); confirm a plain in-repo `make` still resolves `./emit-libs.scm`
      via candidate 3.
- [x] 2.5 Narrate the resolved manifest (D6) on stderr in `docs/OUTPUT.md` form, suppressed at
      `EMIT_VERBOSITY=quiet`; verify stdout is byte-identical with and without narration.

## 3. Chez driver parity (`src/compile.ss`)

- [x] 3.1 Give `*manifest-path*` (`:362`) candidates 1–3 (`EMIT_MANIFEST`, then `./emit-libs.scm`)
      — not 4–5, which are meaningless for a bootstrap-only driver (D4).
- [x] 3.2 Apply D3's relative-path rule in `read-manifest` (`:368-379`), resolving each
      `(source …)`/`(artifacts …)` against the manifest's own directory, and in the program-entry
      path used by the AOT build.
- [x] 3.3 Confirm parity holds with tasks 2.x: `test/self-emit-equiv.sh`,
      `test/dump-parity-tests.sh`, and `test/prelude-base-run-tests.sh` green. Land 2.x and 3.x
      together — a half-applied rule breaks the door-parity guards.

## 4. Migrate the test fixtures (D7)

- [x] 4.1 Rewrite the four committed manifests — `test/modules/emit-libs.scm`,
      `emit-libs-body.scm`, `emit-libs-mut.scm`, `emit-libs-cycle.scm` — to manifest-relative
      paths (`"mylib.sld"`, `"../../lib/scheme/base.sld"`, `(output "../../build/…")`), so they
      exercise the new rule. Update each file's header comment.
- [x] 4.2 Rewrite the `$TMP`-written manifests to absolute source paths:
      `test/emit-build-tests.sh:30,41`, `test/fixnum-overflow-tests.sh:138`,
      `test/dump-stages-tests.sh:117`, `test/library-body-declarations-tests.sh:139`. Correct the
      now-false comment at `test/emit-build-tests.sh:28` ("Sources are repo-relative").
- [x] 4.3 Grep for any remaining manifest written or referenced by a script
      (`grep -rn 'source "' test/ tools/`) and confirm none still relies on CWD-relative sources.
      **The sweep found six more sites than the design enumerated**, all writing a manifest into
      `$TMP` with repo-relative sources: `library-toplevel-set-tests.sh:42` and its `fails_with`
      helper at `:148`, `modules-run-tests.sh:68`, `numeric-conformance-tests.sh:53`,
      `library-body-declarations-tests.sh:71`, and `prelude-base-run-tests.sh:71`. All migrated to
      absolute (`$PWD/...`). Only the repo-root `./emit-libs.scm` keeps bare relative paths, which
      is correct — its directory *is* the repo root.
- [x] 4.4 Full suite green: `./run-all-tests.sh` = 19 suites, 0 failed, 321s — including
      `module-scaffold byte-identity`, and `git status bootstrap/` clean, confirming no IR change.

## 5. `make install` and the installed layout

- [x] 5.1 Add an `install` target staging `build/emit` → `$(DESTDIR)$(PREFIX)/bin/emit`,
      `emit-libs.scm` → `$(DESTDIR)$(PREFIX)/share/emit/emit-libs.scm`, and `lib/**.sld` →
      `$(DESTDIR)$(PREFIX)/share/emit/lib/`. Depends on the `emit` target only (no regen, no
      Chez), so a release tarball can install. Narrates per `docs/OUTPUT.md`; idempotent.
- [x] 5.2 Add a test that installs into a temp prefix and runs the installed binary from an
      unrelated CWD: `(import (scheme inexact))` resolves, and the value matches the in-repo run.
      Cover the symlinked-executable case (candidate 4 via `realpath`) and confirm an in-repo
      invocation still prefers `./emit-libs.scm`.
      **`test/install-layout-tests.sh`, 11 checks, registered in `run-all-tests.sh`.** Also pins
      REPL `(scheme base)` when installed (the worse half of the defect), idempotent install, and
      the explicit-missing-manifest error.
- [x] 5.3 Confirm the scoped-out gap (design Q2): check whether an installed `emit build`/`emit lib`
      fails for want of `tools/llvm-env.sh` and `src/runtime/runtime.c` (both located via
      `repo_root()`, `src/emit.cpp:180`), and open a GitHub issue recording the symptom, the two
      call sites (`:772`, `:925`), and its overlap with `homebrew-tap-distribution` task group 3.
      Do not fix it here.
      **Confirmed and filed as #36.** An installed `emit build` resolves the manifest and emits IR,
      then fails at `emit: toolchain discovery failed (need CC / GC_INC / GC_LIB, or a working
      tools/llvm-env.sh)` — a clear diagnostic, not a crash. `emit run`/`emit repl` are fully
      installable. The issue notes that `homebrew-tap-distribution` task 3.2 is arguably its fix.

## 6. Docs

- [x] 6.1 `docs/MODULES.md`: document the five-candidate lookup, the manifest-relative path rule,
      and correct the resolution-order line (`:171`). Note that `(scheme base)` stays baked and so
      needs no manifest at all.
- [x] 6.2 `README.md`: add `make install` (with `PREFIX`/`DESTDIR`) beside the existing
      from-source instructions.
- [x] 6.3 Update `openspec/explorations/library-sources-and-artifacts.md` — mark step ① as landed
      and note that Finding 2's "way out" was chosen (search path, not bake-more), since #33's
      shape depends on that answer.

## 7. Close out

- [x] 7.1 Verify every scenario in `specs/module-system/spec.md` and `specs/distribution/spec.md`
      has a corresponding check in the suite.
      **All 21 scenarios covered.** The audit found five with no check, all added to
      `test/install-layout-tests.sh` (now 17 checks): DESTDIR staging, install narration +
      quiet-silence, the installed tree not depending on the build tree, manifest-narration
      quiet-suppression with unchanged stdout, and `--manifest` outranking `EMIT_MANIFEST`.
      Scenarios 7–11 and 17–20 are pre-existing module-resolution behaviour already covered by
      `modules-*`/`emit-build-tests.sh`; scenario 14 is exercised by the migrated `test/modules/`
      fixtures, which are now genuinely manifest-relative.
- [x] 7.2 Reference the issue in the commit (`Fixes #35`); confirm
      `test/module-scaffold-baseline.sha256` did **not** need re-recording (no IR change).
      **Confirmed:** `git status bootstrap/ test/module-scaffold-baseline.sha256` is clean after
      both suites, and the Chez-gated trust-check (`make regen` reproduces the committed IR)
      passed. Final verification: Chez-free 20 suites / 0 failed; Chez-gated 20 suites / 0 failed,
      including self-emission equivalence, the self-hosting fixed point, and --dump parity vs chez.
- [ ] 7.3 `openspec validate manifest-search-path`; sync specs and archive.
