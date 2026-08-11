## 1. Pin the defect before changing anything

- [x] 1.1 Add reader cases to the reader suite for each unterminated construct, on **both** entry
      points (`read-from-string` and `read-all-from-string`): `"(a b"`, `"[a b"`, `"#(1 2"`,
      `"#u8(1 2"`, `"\"abc"`, and a nested `"(a (b c"` asserting the **inner** position is named
- [x] 1.2 Add the dangling-escape case: source text ending `"abc\` , and the `\xHH;` variant ending
      mid-escape. Both currently read past the end of the input and return a value
- [x] 1.3 Add whole-source cases asserting a truncated file does not run: `(display (list 1 2 3)`
      and `(display "abc` each exit non-zero **and below 128** with a diagnostic on stderr —
      currently they print `(1 2 3)` / `abc` and exit 0
- [x] 1.4 Add `test/project-door-tests.sh` fixtures for a **truncated** manifest (one paren short) on
      the `build` and `run` doors, and for a **two-form** manifest where the second form declares the
      library a program imports — asserting the diagnostic names the manifest, not the import
- [x] 1.5 Add a chained-manifest fixture where the *second* manifest in the chain is the malformed
      one, asserting the report identifies which file (design D5)
- [x] 1.6 Add the probe assertions that must **not** change: `form-complete` reports incomplete for
      `"(display (list 1"` and `"(display \"abc"` (design D4)
- [x] 1.7 Add a session-level assertion that a list typed across two lines still evaluates — feed
      `"(display (list 1\n"` then `"2))\n"` to `emit repl` and expect `(1 2)`. This is the regression
      the whole change risks and no existing batch suite covers it
- [x] 1.8 Confirm 1.1-1.5 fail against the current `build/emit` in the way #66 and #67 describe, and
      that 1.6-1.7 **pass** already, so the suite is known to be testing the defect rather than
      passing vacuously

## 2. Reader: thread the opening index (design D1)

- [x] 2.1 Add an `open` parameter to `rd-list` (`src/prelude.scm:1304`) carrying the index of the
      construct's **first** character, and thread it through the self-recursive calls in the element
      loop, the `#;` arm, and the dot-tail arm
- [x] 2.2 Pass `open` from `rd-datum`'s `(` and `[` dispatch arms (:1332-1333) as the index of the
      delimiter itself
- [x] 2.3 Pass `open` from `rd-hash`'s `#(` arm (:1213) and the `#u8(` arm (:1227) as the index of the
      `#`, not of the `(`, so the message can name `#(` / `#u8(`
- [x] 2.4 Add an `open` parameter to `rd-string` (:1188) — the index of the opening `"` — and thread
      it through its loop; update `rd-datum`'s `"` dispatch (:1337)
- [x] 2.5 Verify no other caller of `rd-list` or `rd-string` exists (`grep -n "rd-list\|rd-string"`),
      including in `lib/scheme/read.sld`'s generated copies

## 3. Reader: report instead of closing (design D2, D3)

- [x] 3.1 Replace `rd-list`'s end-of-input arm (`[else (cons (reverse acc) j)]`, :1326) with
      `(rd-fail 'rd-unterminated-list open)`
- [x] 3.2 Replace `rd-string`'s end-of-input arm (`(cons (list->string (reverse acc)) i)`, :1201)
      with `(rd-fail 'rd-unterminated-string open)`
- [x] 3.3 Guard the backslash arm (:1194-1199) with `(< (+ i 1) n)`, failing to
      `rd-unterminated-string`; do the same where `rd-hex` can run past `n` in the `\xHH;` path
- [x] 3.4 Add the two `rd-report` arms (:1357). The list message names the opening delimiter by
      reading the source at the reported position, so `(`, `[`, `#(`, `#u8(` are distinguished by one
      arm; the string message names the `"`. Follow #59's wording: `unterminated NAME opened at
      index P`
- [x] 3.5 Confirm the `rd-dot?` tail arm's `(+ j2 1)` (:1325) cannot now walk past the end — it
      assumes the close paren is present, which is exactly what this change stops guaranteeing
- [x] 3.6 Check `rd-all`'s loop and the `(scheme read)` port path for any place that tests
      `(>= i n)` before consulting `rd-fail?`, since a failure sentinel is negative and must not be
      read as "not yet at end"

## 4. Probe: verify, do not change (design D4)

- [x] 4.1 Read `fc-list` and `fc-string` (`src/repl-core.ss:768-860`) and confirm each already
      answers `fc-incomplete` at end of input — **no edit expected**. If an edit turns out to be
      needed, stop and reconcile with design D4 before proceeding
- [x] 4.2 Add the comment naming the divergence as intentional at both `fc-list` and `rd-list`, each
      pointing at the other, so the duplication reads as load-bearing rather than accidental

## 5. Manifest: exactly one top-level form (design D5)

- [x] 5.1 Make `manifest-entries` (`src/repl-core.ss:446`) report when `read-all-from-string` returns
      more than one form, naming the count; keep the no-datum case returning `()` per
      `manifest-empty-guards`
- [x] 5.1b **Found while verifying**: there are TWO manifest parsers, not one.
      `repl-manifest-programs` (mode 10) kept its own `(car forms)` because it returns an
      `(ok . _)` / `(error . MSG)` pair rather than raising, so fixing `manifest-entries` alone left
      the **build door** resolving the program from form one and narrating a build it then abandoned.
      Factor the rule into `manifest-extra-forms`, apply it at both sites, and `guard`
      `repl-manifest-programs` so a reader raise also returns through its pair — which is what lets
      the host name the manifest path for `emit build` with no host change
- [x] 5.2 Update the comment block above it (:440-445), which currently documents only the
      returned-as-read and no-datum cases
- [x] 5.3 Have the host name the manifest it was parsing when the report arrives, at the mode-5/9/10
      call sites that already hold the path (`src/emit.cpp:530-534`, :1004-1016)
- [x] 5.4 Confirm no repo manifest or test fixture holds a second top-level form
      (`emit-libs.scm`, `test/`), and fix any that do

## 6. Regenerate, then verify (design D6, and the build-workflow barrier)

- [x] 6.1 Iterate steps 2-5 with `chez --libdirs src --script src/compile.ss`, **without** regen
- [x] 6.2 Only when every source edit above is complete, run `make regen` (~12 min). Nothing in
      `CORE_FLAT` may be edited again until the suites finish
- [x] 6.3 Regenerate `lib/scheme/base.sld`, `lib/scheme/read.sld`, `lib/emit/internal.sld` and
      confirm the `rd-report` copy in `read.sld` picked up both new arms
- [x] 6.4 Declare any new prelude helper's home in `src/prelude-surface.scm`, or
      `test/scheme-base-surface-check.sh` fails
- [x] 6.5 Re-record `test/module-scaffold-baseline.sha256`, stating the delta's cause in the commit
      per the baseline protocol: two reader procedures gained a parameter, `rd-report` gained two arms
- [ ] 6.6 `./run-all-tests.sh`, then `./run-dev-tests.sh` (run suites individually if the batch
      outlives the command timeout)
- [ ] 6.7 Commit, then `test/trust-check.sh` — it `[SKIP]`s while `bootstrap/` is dirty by design

## 7. Close out

- [ ] 7.1 Measure regen wall-clock before/after for the extra `rd-list` parameter; record in
      `docs/PERFORMANCE.md` only if it shows above noise (design D1 risk)
- [ ] 7.2 Confirm the four #66 reproductions and both #67 reproductions from the issues now report,
      and paste the actual messages into the issue comments
- [ ] 7.3 Note in #70 that the reader's dangling-escape instance is fixed here, and that the general
      indexed-access question remains open on that issue
