> **Regen barrier** (`CLAUDE.md`): groups 1–6 all edit files in `CORE_FLAT` or `src/repl-core.ss`.
> Finish every one of them before starting `make regen` in group 8, and iterate in the meantime with
> `chez --libdirs src --script src/compile.ss`, which includes the sources directly.
> `src/compile.ss` itself is exempt from regen; `src/emit.cpp` reaches the binary through plain
> `make`.

## 1. The declaration-expansion pre-pass, with no I/O yet (design D1)

- [x] 1.1 Add `expand-library-declarations` to `src/core.ss`: a recursive rewrite of a declaration
      list into one containing only `export`, `import`, and `begin`. Call it from
      `parse-define-library` (`src/core.ss:520`) before the existing loop, so `check-import-spec`
      still sees every import from one place.
- [x] 1.2 Handle `cond-expand`: select the first clause whose feature requirement holds, splice its
      declarations, re-expand them. Support a feature identifier, `and`, `or`, `not`, and `else`;
      contribute nothing when nothing matches and there is no `else`.
- [x] 1.3 Declare the advertised feature list in one place, next to the other front-end declarations
      (design D7): `r7rs`, `emit`, `ieee-float`. Write down beside it why `exact-closed`,
      `full-unicode`, `ratios`, and the OS/CPU flags are absent, so the next person adds one on
      purpose rather than by analogy.
- [x] 1.4 Reject a `(library ⟨name⟩)` feature requirement by name (design D8), reusing the
      "recognized R7RS form this stage does not support" wording that the four declarations are
      about to vacate; reject a malformed clause naming the clause.
- [x] 1.5 Retire the recognized-but-unsupported arm: `*unsupported-library-declarations*`
      (`src/core.ss:456`) and the first arm of `reject-library-declaration` (`:463`) go, leaving the
      "not a library declaration" message as the only rejection. Keep the `render-datum`-based
      wording.
- [x] 1.6 Add the `include-ci` case fold (design D6): a portable walk over the read forms folding
      symbol case only — strings, characters, and numbers untouched.
- [x] 1.7 Check with `chez --libdirs src --script src/compile.ss` that `cond-expand` alone works
      end to end before any file reading exists; this is the half that needs no reader.

## 2. The reader side-channel and the Chez driver's reader (design D2, D3, D5)

- [x] 2.1 Add `*include-reader*` and `set-include-reader!` to `src/core.ss`, with a default stub
      raising `include: this door installed no source reader ("f.scm")`. Wire the three `include`
      declarations in the pre-pass to call it with the filename **as written**; keep every path
      operation out of the core.
- [x] 2.2 Add the include stack (design D5/D9) — the resolved path of each file currently being
      expanded — and the cycle diagnostic naming the cycle.
      → The stack lives in the CORE after all, holding the door's opaque tokens. It cannot live in
      the reader: a nested include is expanded *after* the reader returned, so the reader's dynamic
      extent is not the file's. The reader now answers `(TOKEN . FORMS)` and the core threads TOKEN
      back as the next call's BASE, which is also what makes a nested include resolve beside its own
      file. The core still never interprets a token — design D3's rule is intact and D5/D9 are
      revised to say tokens rather than "the door's stack".
- [x] 2.3 Install a Chez reader in `src/compile.ss`: resolve relative to the including file's
      directory, absolute as written, stdin against the current directory; read with the driver's
      existing `read-forms`. Set the home from the source path in `compile-file` (`:237`) and from
      each `.sld` in the library build loop (`:690`).
- [x] 2.4 Report a file that cannot be read as a recoverable error naming the filename as written,
      the resolved path, and the declaration that named it.

## 3. The Chez-free reader (design D2)

- [x] 3.1 Add `src/include-reader.ss` — the `%read-file` + `read-forms-from-string` reader, plus the
      source-home state — with a header explaining, as `src/dump.ss` does, why it rides the
      Chez-free assembly only.
- [x] 3.2 Add it to `CORE_FLAT` in `tools/regen.sh:47` (after `src/dump.ss`), and **not** to the
      `(include …)` block in `src/compile.ss:40-51`. Confirm the driver still loads: an accidental
      inclusion shows up as an unbound `%read-file` at Chez load time.
- [x] 3.3 Handle `%read-file` returning `#f` (missing/unopenable file) as the named error from 2.4,
      never as an empty string — the runtime distinguishes them precisely so this layer can.

## 4. Door plumbing: telling the compiler where the source came from (design D4, D11)

- [x] 4.1 Add the "set source home" mode to `src/repl-core.ss`'s dispatch (`:766`, alongside modes
      0–12), installing the Chez-free reader for the session on first use.
- [x] 4.2 Call it from `src/emit.cpp` before every source submission: the run door's preload
      (mode 4, `preload_user_libraries`, `:502`) with each library's own directory, the program
      compile (mode 7) with the program file's directory or the working directory for stdin,
      `emit lib` (mode 11, `:1467`) with the `.sld`'s directory, and the REPL's eager preload
      (`preload_libraries`, `:951`).
- [x] 4.3 Set it for the imports query too, and make mode 12 (`repl-source-imports`) run the
      pre-pass (design D11), so the run door's lazy closure walk sees an import that arrived through
      `include-library-declarations` or `cond-expand`.
- [x] 4.4 Verify each door from a directory **outside** the repo — the failure mode
      `manifest-search-path` and `baked-set-on-every-door` each had to fix once is a door that
      silently resolves against the working directory.
      → Case 2 of the new suite runs `emit run` from a third directory; the project itself lives
      outside the repo, so every case is that test. All four doors pass.

## 5. Artifact freshness (design D10)

- [x] 5.1 Record the resolved include list in the unit's `.stamp` sidecar (`src/compile.ss:529-539`).
- [x] 5.2 Extend `artifacts-fresh?` (`:552`) and `rebuild-reason` (`:562`) to require the artifact to
      be newer than every recorded include, keeping the existing distinction between a changed
      source and a changed compiler in the reported reason.
- [x] 5.3 Bump `compiler-stamp-version` (`:486`) — the sidecar's shape changes, so one global
      invalidation is deliberate.

## 6. Tests

- [x] 6.1 Replace the negative cases in `test/library-body-declarations-tests.sh` that assert the
      unsupported-declaration message for all four declarations. **They will fail until this is
      done** — that is the point of writing them as message assertions.
      → The four cases and the `include`-not-blamed-on-its-export case are gone; what stays is
      the not-a-declaration half, which this change does not touch. The vacated wording now
      belongs to a `(library ...)` feature requirement, pinned in the new suite.
- [x] 6.2 Add `test/library-include-tests.sh` with fixtures under `test/modules/`: a library whose
      body is included, a shared declarations file included by two libraries, `include-ci` over
      case-folded source, nested includes resolving beside their own file, and `cond-expand`
      selecting each branch.
      → The fixtures are written into a temporary project OUTSIDE the repo rather than under
      `test/modules/`: an include that resolved against the working directory would pass from the
      repo root, which is exactly the bug this suite exists to catch. `test/modules/` gained
      nothing.
- [x] 6.3 Cover every door in that suite — `emit run` through the manifest, `emit build`,
      `emit lib`, the REPL's loader — running from a temporary directory outside the repo the way
      `test/project-door-tests.sh` does.
- [x] 6.4 Cover the negative cases by message: missing file, include cycle, `(library …)` feature
      requirement, malformed clause, and an import set arriving through an included declarations
      file (which must report the ordinary import-set diagnostic).
- [x] 6.5 Add an included file that exercises reader corners — brackets, `#| |#`, quasiquote,
      characters — so the Chez/Emit reader divergence risk is actually under the cross-door
      equivalence checks rather than assumed away.
      → `geom-corners.scm`: a block comment, bracket `let`, quasiquote with unquote, and a
      character literal — read by Chez under the driver and by Emit's reader in the binary,
      with case 15 diffing the units the two hosts emit for it.
- [x] 6.6 Add an artifact-freshness case: compile, touch an included file, rebuild, assert the unit
      was rebuilt and not reused; then rebuild untouched and assert reuse.
      → In the Chez-gated section: the artifact cache is the driver's, and `emit lib` recompiles
      unconditionally, so there is nothing to check on the Chez-free side.
- [x] 6.7 Wire the new suite into `run-all-tests.sh` beside the other module suites (`:60-70`).

## 7. Docs

- [x] 7.1 `docs/MODULES.md`: the four declarations are listed as out of scope (`:560`) and in the
      "When you break a rule" table (`:630`). Replace both with what they now do, the resolution
      rule, and the `include-ci` bar-quoted-symbol limit.
- [x] 7.2 `docs/PROJECTS.md:349`: the same "No `include` …" limitation line.
- [x] 7.3 Note in `docs/MODULES.md` that a baked library resolves `cond-expand` at bake time
      (design D12) — the commitment #31 will inherit.
- [x] 7.4 Follow `docs/OUTPUT.md` for the narration: name the included files at verbose level, since
      "the source" is no longer one file.
      → `include <sld> -> <path>` per included file at verbose (`-v`) only.

## 8. Regen, suites, close-out

- [x] 8.1 `make regen` (~12 min) — `src/core.ss`, `src/repl-core.ss`, and a new `CORE_FLAT` member
      all changed. Watch for the two-pass case (a prelude/bootstrap ordering effect) and let it run
      to convergence.
      → Converged in one iteration [313s]. `bootstrap/emit.internal.ll` and
      `bootstrap/scheme.base.ll` are UNCHANGED — only the three compiler programs moved, which
      is what a compiler-only change should look like.
- [x] 8.2 `./run-all-tests.sh`, then `./run-dev-tests.sh` (individually if a suite outlives the
      command timeout).
      → `./run-all-tests.sh`: 24 suites, 0 failed (406s). `./run-dev-tests.sh`: 20 suites, 0
      failed (717s), with the trust-check `[SKIP]`ing on the dirty `bootstrap/` as designed.
- [x] 8.3 Confirm `test/module-scaffold-baseline.sha256` is **unchanged**. No shipped library uses
      these declarations, so moved IR means the pre-pass perturbed something — most plausibly the
      gensym counter. Explain the delta before re-recording; do not re-record to make it pass.
      → Unchanged: `module-scaffold byte-identity` passes untouched, and the whole Chez-free
      suite is green (24 suites, 0 failed, 406s). Nothing was re-recorded.

- [ ] 8.4 Commit, then run `test/trust-check.sh` (it `[SKIP]`s on a dirty `bootstrap/` by design).
- [x] 8.5 `openspec validate --all`, including the **main** specs, and grep them for stray delta
      headers after syncing.
      → `openspec validate --all`: 21 passed, 0 failed; no stray delta headers in the main specs.
- [x] 8.6 Reference the issue from the commit (`Fixes #18`) and update
      `openspec/explorations/library-sources-and-artifacts.md`: steps ② and ③ of its sequence land
      together, open question 4 is answered by design D12, and Finding 4's precondition for #31 is
      met.
