## 1. Covered set and configuration

- [ ] 1.1 Write `pitch.scm` at the repo root with the two entries design D4 specifies:
      `(styles common ((match) (_ e . dc*)))` and
      `(styles r7rs ((define-library) (_ d . body)))`, at `(width 88)`.
- [ ] 1.2 Verify both entries take effect, not just parse. For `match`, run
      `pitch --config pitch.scm --stdout src/passes/simplify.ss` and confirm the clauses
      indent by 2 rather than aligning under `match e`. For `define-library`, test at a
      width narrow enough to force a break — at 88 a short library fits on one line and the
      override looks inert, which is how this collision was nearly misdiagnosed as an
      upstream defect.
- [ ] 1.3 Write `tools/format.sh` holding the covered-set policy in one place: resolve
      candidates from `git ls-files` over `src/*.{scm,ss}`, `src/passes/*.ss`,
      `lib/**/*.sld`, `tools/*.ss`, `emit-libs.scm`; drop any file whose first two lines
      carry a `GENERATED` marker (the same signal `test/scheme-base-gen-check.sh` scans
      for). Support `--check`, an explicit file-list mode for the hook, and
      `EMIT_VERBOSITY` per `docs/OUTPUT.md`.
- [ ] 1.4 In `tools/format.sh`, split the resolved set into two dialect groups — the
      hand-authored `lib/**/*.sld` under `--dialect r7rs`, everything else under
      `--dialect common` — and invoke pitch once per group with `--config pitch.scm`.
      Selection is by group membership, never by file extension (design D3).
- [ ] 1.5 Add the pinned pitch version to `tools/format.sh` and compare it against
      `pitch --version`, reporting a mismatch that names both versions (design D6). Pin
      `0.1.0` for now.
- [ ] 1.6 Verify the resolver: assert it yields exactly the 32 files in `design.md`'s table
      and excludes `lib/scheme/base.sld`, `cxr.sld`, `read.sld`, `file.sld`,
      `lib/emit/internal.sld`, and `lib/scheme/char-data.scm`.
- [ ] 1.7 Verify the exclusion is self-maintaining: add a throwaway `GENERATED`-marked file
      under `lib/scheme/`, confirm the resolver skips it, and remove it.

## 2. Doors and narration

- [ ] 2.1 Add `make format` and `make format-check` delegating to `tools/format.sh`, with a
      `pitch` presence check that reports a clear message rather than a shell error.
- [ ] 2.2 Make both doors narrate per `docs/OUTPUT.md`: a `format` verb line naming the
      resolved set, per-group counts, files changed or that would change, and elapsed time
      — on stderr, silent at `quiet`, per-file at `verbose`.
- [ ] 2.3 Give `format-check` distinct exit statuses for "a file would change" and "the
      invocation or environment is wrong", and confirm each is reachable (an unformatted
      file; a bad `--config` path).
- [ ] 2.4 Verify the no-write property: run `make format` twice over a scratch copy of the
      tree and confirm the second run rewrites nothing and changes no modification times.

## 3. Commit gate

- [ ] 3.1 Write the pre-commit hook template: intersect the staged file list with the
      covered set via `tools/format.sh`'s file-list mode, and reject the commit naming each
      offending file and the command that fixes it.
- [ ] 3.2 Make the hook skip and permit the commit when `pitch` is not on `PATH`, reporting
      the skip and what it looked for (design D8).
- [ ] 3.3 Add `make install-hooks` to install it into `.git/hooks/pre-commit`, refusing to
      clobber an existing unrelated hook.
- [ ] 3.4 Verify the gate's four behaviors: a staged unformatted covered file blocks; a
      staged generated/demo/test file is ignored; an unstaged unformatted file does not
      block; an absent `pitch` skips.

## 4. Documentation

- [ ] 4.1 Add the formatting rule to `CLAUDE.md`: the covered set, `make format` before
      committing, the pinned pitch version, and — explicitly — that the formatter is a
      developer tool that neither test runner requires.
- [ ] 4.2 Record in `CLAUDE.md` that a whole-set reformat is a `make regen` barrier
      crossing, so it is never interleaved with a compiler-source edit.
- [ ] 4.3 Document the two things formatting does *not* promise: comment contents are never
      reflowed (529 covered lines already exceed 88 columns), and generated Scheme is out of
      scope because its generator owns its bytes.

## 5. Upstream blockers

- [x] 5.1 File a `bwbensonjr/scheme-pitch` issue for filled layout of overflowing quoted
      data lists, citing `src/prelude-surface.scm` (563 → 784) and `src/emit.ss`
      (1837 → 2176), and showing that a `((quote) (_ . fill))` config entry produces
      byte-identical output so no configuration reaches it. Filed as **#13**.
- [x] 5.2 File an issue for preserving trailing-comment column alignment, citing the 372
      aligned sites against 7 single-space ones, and framing it as an addition to pitch's
      "Preserved formatting" list rather than to its empty normalization list. Filed as
      **#14**.
- [x] 5.3 File a performance report with the measured figures (2,477 lines / 112 s;
      2,397 lines / 191 s; covered set ~7.4 min single-threaded), including the per-1000-line
      cost curve that distinguishes a per-form quadratic from uniform slowness. Filed as
      **#15**, not blocking. Outcome recorded on the issue: five causes found, two of them
      Emit runtime defects (P19, P20 -- fixed; P21 open), covered set 480 s -> 78 s
      sequential and 146 s -> 32 s at `-P4`. The per-form quadratic hypothesis was correct.
- [x] 5.4 Record the issue numbers in `design.md` under D9, marking #13 and #14 as the
      gate on group 6 and #15 as non-blocking.
- [x] 5.5 No `define-library` issue is needed: `((define-library) (_ d . body))` in
      `pitch.scm` resolves that collision (design D4, verified at a break-forcing width).
- [ ] 5.6 File a `bwbensonjr/scheme-pitch` issue asking that any layout-affecting change
      bump `pitch-version`. Evidence: `ebc01cd` changed quoted-data layout and
      `reduce-formatting-cost` changed cost by ~6x, both with the version string still
      `"0.1.0"`, so a downstream pin cannot identify which pitch produced a formatted tree.
      This is what D6 depends on; without it the pin is documentation, not a check.

## 6. The one-time reformat — gated on pitch #13 and #14

- [ ] 6.1 Confirm the blockers are resolved: install the new pitch, update the pin in
      `tools/format.sh`, and re-measure the covered set. The data tables and comment
      columns must survive; if they do not, stop and report rather than proceeding.
      Two adjustments since this was written. **Identify the formatter by commit, not by
      `--version`**, unless 5.6 has landed -- `pitch-version` did not move across the
      `ebc01cd` layout fix, so the version string cannot confirm the pitch being installed
      is the one required (design D6). And **expect the re-measurement to come in well
      below 9,219 changed lines**: that figure predates #13's fix, which returns
      `src/prelude-surface.scm` to 553 lines against 563 before formatting. A result near
      9,219 means the installed pitch does not carry `ebc01cd`.
- [ ] 6.2 Capture the pre-reformat baseline: record the SHA-256 of every `bootstrap/*.ll`
      and confirm the working tree is clean and committed.
- [ ] 6.3 Run `make format` and commit the reformat with nothing else in it, adding
      `.git-blame-ignore-revs` naming that commit.
- [ ] 6.4 Run `make regen` to convergence (expect 5 self-compiles, ~22 min) and commit the
      regenerated `bootstrap/`.
- [ ] 6.5 Check the four IR assertions: `bootstrap/schemec.ll`, `bootstrap/scheme.base.ll`,
      and `bootstrap/emit.internal.ll` byte-identical to the 6.2 baseline; `embed.ll` and
      `embed-repl.ll` differing only inside the `*prelude-source*` string constant. Any
      other difference is a defect — stop and investigate rather than accepting it.
- [ ] 6.6 Run `./run-all-tests.sh` and then `./run-dev-tests.sh` (the latter includes
      `test/trust-check.sh`, which is meaningful only after 6.4 is committed) and report the
      actual output of both.
- [ ] 6.7 Confirm `make format-check` now passes over the whole covered set, and that the
      pre-commit hook permits an ordinary commit.
- [ ] 6.8 Re-run `tools/complexity.sh --write`, since the covered set's line counts moved by
      about +1,000 lines.
