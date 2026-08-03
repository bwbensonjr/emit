#!/usr/bin/env bash
# module-scaffold-baseline.sh -- byte-identity guard for Modules v0 Stage 0
# (change: module-resolution-scaffold).
#
# The scaffolding (typed-scope resolver + unit-parameterized symbol naming) MUST
# NOT change the LLVM IR emitted for any library-free program (spec: "Scaffolding
# preserves emitted IR").  This harness compiles every demos/*.scm through the
# shipped Chez-free front half (`emit run --emit`) and checks the emitted
# IR against a recorded reference.
#
# Modes:
#   capture DIR   compile every demo to DIR/<name>.ll (a raw IR snapshot)
#   manifest      print "<sha256>  <name>" for every demo's emitted IR (sorted)
#   check         recompute the manifest and diff it against the committed
#                 reference (test/module-scaffold-baseline.sha256); nonzero on drift
#
# `check` (also the default, so the suite can call it argument-free) is the
# re-checkable regression guard.  The pre/post byte-identity for the change
# itself was proven by capturing a pristine DIR and diffing a post-change
# capture against it (design D3); `check` keeps the guarantee live afterwards.
#
# RE-RECORDING the reference (`manifest > $REF`) is legitimate only when the IR
# change is intended and has been shown to be exactly what was intended -- capture
# a before/after pair and diff them, as the original change did.  Log of intended
# re-records:
#   emit-dump-stages -- +2 lines in every module's runtime declare header
#     (@rt_dump_level, @rt_stderr_write).  Verified: a 69-demo before/after capture
#     differed in exactly those 2 lines per module (138 lines, no deletions).
#   flonum-unboxing (merge of feat/flonum-unboxing into post-dump main) -- +1 declare
#     line (@rt_make_flonum) in every module's header, PLUS real f64-region codegen
#     (flofast/floslow/flomerge blocks + the label renumbering they shift) in exactly
#     the two flonum-using demos.  Verified: a 69-demo before/after capture showed 67
#     demos differing ONLY by the declare line (138 lines, no deletions -- the header
#     appears twice per demo IR), and non-declare drift confined to flonum-arith.ll
#     and mandelbrot.ll; both demos' stdout stayed byte-identical (33 / 2595 bytes),
#     confirming the guarded slow arm preserves semantics.  +1 new entry
#     (flonum-unbox), the change's own demo.
#   unspecified-value -- the unspecified value changed from 1 (#f) to 17 (UNSPEC_V,
#     misc-immediate subtype 2), so every site that yields it emits a different literal.
#     Verified against a 70-demo pre-change capture (a detached HEAD worktree) vs the
#     post-change tree.  Three kinds of drift, all intended, and nothing else:
#       (1) 212 `ret i64 1` -> `ret i64 17`, in bodies that reduce to just the
#           unspecified value.  Every changed literal was 1 before and 17 after; no
#           other constant moved anywhere in the 70 files.
#       (2) 4 two-armed-`if` phis whose ELSE operand went 1 -> 17.  Their THEN operands
#           correctly stayed 1 -- that is the genuine #f from `(if #f #f)`'s then-branch.
#       (3) +8 lines in derived.ll ONLY: `unless` now expands to
#           `(if test (if #f #f) (begin e ...))`, and the nested idiom emits a dead
#           branch diamond.  Confined to the one demo using `unless` in value position,
#           and free in the binary -- `icmp ne i64 1, 1` is constant-folded and clang
#           -O2 collapses the diamond entirely (checked with `opt -O2` on the pattern).
#           `case`/`do` already paid this same cost for the same idiom.
#     +1 new entry (unspecified-value), the change's own demo.  One demo's stdout also
#     changed by design (mandelbrot.expected: `#f` -> `#<unspecified>`, since its
#     `render` ends in a result-less `do` loop) -- which is the point of the change.
#   unspecified-value, follow-up: `global-set!` (a top-level define's lowering) now yields
#     the unspecified value instead of the stored value, so a `define` no longer echoes at
#     the REPL and it agrees with a local `set!`, which already yielded the unspecified
#     value via rt_set_box.  Verified: a 71-demo before/after capture differed in EXACTLY
#     8520 lines, all of the form `ret i64 %tN` -> `ret i64 17`, with no additions, no
#     deletions, and no structural change.  Every one of the 8520 was mechanically checked
#     to sit inside a `@"scheme.base:__init_N"()` per-define initializer -- whose return
#     value is discarded by the library `__init` -- and NOT inside any `code_N` function
#     body, so no procedure's result changed.  The `rt_root` call and the `store` into the
#     global slot are untouched; only the discarded return operand differs.
#   simplify-known-calls -- the new `simplify` pass inlines a known singly-referenced
#     lambda into its one call site, propagates immediate constants, folds primcalls over
#     them, and drops the bindings left unreferenced.  Verified against a 72-demo
#     before/after capture (build/emit relinked from HEAD's committed IR vs the rebuilt
#     tree): 62 demos byte-IDENTICAL, and exactly 10 changed -- counter, derived,
#     error-abort, flonum-unbox, high-arity-nontail, internal-define, macro-user,
#     nary-arith, nary-compare, square.  Every one got SMALLER (-705 to -6435 bytes) and
#     every change is a removal plus the label renumbering it shifts: fewer
#     `define fastcc @code_N` blocks (each with its `rt_alloc_words` closure record and
#     its closure-loaded indirect call), and arithmetic over literals replaced by the
#     literal -- e.g. nary-arith's program module lost 213 lines and gained 16.  The
#     (scheme base) prefix of every demo's IR is byte-identical: the pass runs over all
#     120 of the library's defines and rewrites none of them (its top-level defines are
#     globals, not a binding group, so the inlining rule finds nothing to inline).  All
#     72 demos' stdout is byte-identical before and after -- this pass may not alter a
#     single program's value.  +1 new entry (square), the change's own demo.
#   simplify-known-calls, follow-up (fold-window clamp) -- the fold window went from
#     +/-(2^30 - 1) to +/-(2^28 - 1).  The first value bounded the ARITHMETIC (no + - *
#     escapes the fixnum range) but not the ENCODING: `encode-const` mis-emits any literal
#     at or above 2^57 (issue #7), so a folded result in [2^57, 2^60) came out wrong on the
#     self-hosted door -- `(* 1073741823 1073741823)` printed correctly before the pass and
#     wrongly after.  The clamp puts the largest foldable product (2^56 - 2^29 + 1) below the
#     encoding cliff.  Verified: no demo's IR changed as a result (none folds an operand
#     between 2^28 and 2^30), so the only manifest delta is +1 new entry (fold-boundary),
#     the regression demo -- it evaluates each folded expression alongside the same
#     expression computed at run time and asserts they agree.
#   fix encode-const overflow (issue #7), with the fold window widened back -- the fixnum
#     tagged word d<<3 was computed as `(* d 8)` in the compiler's own arithmetic, which
#     overflows for |d| >= 2^57, so the self-hosted compiler emitted a wrapped literal
#     while the Chez-hosted one (bignums) emitted the right one.  Now multiplied in decimal
#     on the digit string, where nothing can overflow; that in turn let simplify's fold
#     window go back from +/-(2^28 - 1) to its arithmetic ceiling +/-(2^30 - 1).
#     Verified against a 74-demo before/after capture (build/emit relinked from the
#     previously committed IR): EXACTLY TWO demos' IR differs, and both are the regression
#     demos that exist to cover this --
#       fixnum-literals (new): the bug itself.  The old compiler printed
#         (72057594037927936 -144115188075855872 0 -1 0 1); the new one prints all six
#         literals correctly.  The only demo whose STDOUT changed.
#       fold-boundary: its fourth pair now folds rather than being refused (the widened
#         window), producing the literal 1152921502459363329 -- past the old 2^57 cliff,
#         which is precisely the interaction being pinned.  Stdout unchanged (all #t
#         before and after: correct when refused, correct when folded).
#     The other 72 demos are byte-identical in both IR and stdout -- no other demo holds a
#     literal at or above 2^57 or folds an operand above 2^28.  The decimal routine was
#     also checked against exact arithmetic on every fixnum boundary, 2^0..2^60 with
#     neighbours, and 200000 random in-range values: 0 mismatches.  +1 new entry
#     (fixnum-literals); fold-boundary arrived with the preceding commit.
#   fix set! on a letrec-bound name (issue #8) -- convert-assignments assumed letrec
#     binders are never set!, so an assigned one was never boxed while its references
#     were still rewritten to unbox/set-box!, which then ran against the raw closure
#     (word 0 = its code pointer).  Redefining a top-level function crashed.  Assigned
#     bindings now split out of the letrec into an enclosing let of boxes.  Verified
#     against a 75-demo before/after capture: EXACTLY ONE demo differs in IR and stdout,
#     the new regression demo redefine-function, which bus-errored on the old compiler
#     and prints (1 2 (10 20) 100 300 300) on the new one.  The other 74 are byte-identical
#     in both -- no existing demo assigns a letrec-bound name.  +1 new entry.
#   letrec-bind the lambda-initialized top-level defines (docs/PERFORMANCE.md P6, 7.2) --
#     a program with even one non-lambda define used to send EVERY define down the
#     let+set! path, where assignment conversion boxes them all, so `simplify` could
#     inline none of them.  build-program now boxes only the defines that need it and
#     letrec-binds the lambda-initialized ones.  Verified against a 75-demo before/after
#     capture: 9 demos' IR changed -- apply, case-cxr, char-intern, internal-define,
#     mandelbrot, record-print, records, symbol-gc, toplevel -- and every one got SMALLER
#     (up to -22.4% on the program module alone; records 21333 -> 16548, mandelbrot
#     34896 -> 29871).  ZERO grew.  All 75 demos' stdout is byte-identical: this changes
#     which binding form a define lowers to, never what it evaluates to.  The compiler's
#     own IR shrank 10.3% (schemec.ll) and build/emit 4.7%, which more than pays back the
#     4.7% the simplify pass itself cost -- build/emit is now slightly SMALLER than before
#     any of this work began.  No new entries.
#   letrec with a non-lambda initializer (issue #9) -- `lower` only lowers lambdas in a
#     letrec group (the two-phase closure-block protocol), and rejected anything else with
#     an internal `match` failure, so legal R7RS like (letrec ((x (car (list 1 2)))) x)
#     crashed the compiler.  convert-assignments now boxes such a binding and splits it out
#     of the group, reusing the machinery added for issue #8.  Verified against a 76-demo
#     before/after capture: EXACTLY ONE demo differs in IR and stdout -- the new regression
#     demo letrec-init, which did not compile at all before.  The other 75 are byte-identical
#     in both, since no existing demo binds a non-lambda in a letrec.  +1 new entry.
#   add letrec* (R7RS-small 4.2.2) -- a new form, so nothing existing could change.
#     `parse` maps it onto the same `letrec` IL node, since that lowering already has
#     letrec*'s left-to-right initialization (issue #9).  Verified against a 77-demo
#     before/after capture: EXACTLY ONE demo differs, the new letrec-star, which did not
#     compile before.  The other 76 are byte-identical in IR and stdout.  +1 new entry.
#   P7 -- box only what is really mutated (docs/PERFORMANCE.md P7).  build-program used
#     to desugar a non-lambda top-level define to `let` + `set!`, so EVERY define looked
#     assigned and every one was boxed; `(define n 1)` cost a heap box and an unbox per
#     read.  build-program now hands convert-assignments one letrec group and the
#     plain/boxed/closure decision is made there, on alpha-renamed IL where a real set!
#     is distinguishable from a desugaring's.  Verified against a 77-demo before/after
#     capture: 12 demos' IR changed -- apply, case-cxr, char-intern, internal-define,
#     letrec-init, letrec-star, mandelbrot, read-all, record-print, records, symbol-gc,
#     toplevel -- and NONE grew.  Box operations across the whole suite fell 144 -> 58
#     (-60%); toplevel, mandelbrot, records, read-all and internal-define went to ZERO
#     box/unbox/set_box calls, while `counter` -- the demo whose subject is set! on a
#     captured variable -- correctly kept all of its.  All 77 demos' stdout is
#     byte-identical.  No new entries.
#   P6-B -- state the allocator's alignment (docs/PERFORMANCE.md P6-B).  rt_alloc_words
#     now returns a POINTER declared `align 8` instead of an i64, so LLVM knows the low
#     three bits of a fresh object are zero.  Without that it could not prove that masking
#     a tagged closure recovers the pointer it was built from, so it could not forward the
#     code-pointer store to the load, and every call through a just-allocated closure
#     stayed indirect and uninlinable at -O2.  ALL 77 demos' IR changed -- the declare line
#     is in every module and every allocation site swaps inttoptr for ptrtoint -- and NONE
#     grew; the committed IR shrank (embed-repl -2062, schemec -1862, scheme.base -524)
#     because emit-spill no longer needs its conversion at all.  All 77 stdout identical.
#     Ship-door effect, indirect calls surviving -O2 in the program module: derived 4 -> 0,
#     mandelbrot 3 -> 1, counter 2 -> 1, case-cxr 11 -> 10.  No new entries.
#   P5-B-general -- direct calls to statically-known closures.  A call whose operator is a
#     closure-block binding now goes straight to its code label, passing the callee's own
#     closure as `self`, instead of loading a code pointer out of it.  lower allocates a
#     group's labels BEFORE lowering any body so mutually recursive siblings can see each
#     other, which renumbers labels -- so demo IR changes broadly even where the call
#     shapes do not.  Verified against a 77-demo before/after capture: 24 demos' IR changed
#     and NONE grew (case-cxr -2.4%, arity-error -1.1%, ackermann -0.9%); all 77 stdout
#     identical.  In the compiler's own module, emitted calls went to 1020 direct / 710
#     indirect, and after -O2 to 755 direct / 2073 indirect (from 79 / 2786).  No new
#     entries.
#   cross-unit-direct-calls -- library procedure code labels are now derived from the
#     binding name (scheme.base:code:zero?) instead of the gensym counter, so they are
#     identical whether the unit is compiled whole or tree-shaken; the export table
#     carries each fixed-arity procedure's label and arity; and a call to one lowers to
#     a direct call.  ALL 77 demos' IR changed -- as it must, since every library label
#     is respelled -- so the before/after capture was classified mechanically rather
#     than eyeballed, splitting each snapshot at the unit boundary:
#       library half (77/77): differs ONLY in code-label spellings.  With every code
#         label normalized to a single token the two halves are byte-identical, i.e.
#         nothing about the library's structure, temps, blocks or globals moved -- only
#         which text names each code block.  (The counter labels that remain renumber
#         because a top-level lambda no longer draws from the counter.)
#       program half (77/77): differs ONLY by the direct-call rewrite.  Replaying that
#         rewrite on the BEFORE text -- collapse `load global; and; inttoptr; load;
#         inttoptr; call %tN` to `load global; call @"scheme.base:code:<name>"`, at
#         exactly the sites the lowering rule fires (the callee is a fixed-arity export
#         AND the argument count matches) -- makes the two halves identical modulo the
#         `declare` lines and the temp renumbering that dropping 4 temps per site
#         forces.  157 call sites converted across the suite; 40 declares emitted.
#         PROGRAM-unit code labels are untouched: no program module defines a
#         name-derived label, they are all still code_N.
#     All 77 demos' stdout is byte-identical, through `emit run` and through the Chez
#     AOT path.  Total demo IR grew 0.48% -- the declares and the longer label text,
#     against the 4 instructions removed per site.  That is a pre-optimizer number, and
#     what the change exists for is what `-O2 -flto` then does with it: the delivered
#     binary gets both faster and smaller (docs/PERFORMANCE.md P5).  No new entries.
#   call-cc demo -- +1 new entry (call-cc), the demo added alongside the existing
#     test/dynamic-extent-tests.sh coverage.  NO existing hash changed: the manifest
#     diff was exactly one added line, since a new demo file cannot affect any other
#     demo's IR.  Nothing else was re-recorded.
#   fixnum-overflow-trap -- the inline fixnum fast path for + - * now detects overflow
#     and branches to the SAME rt_* slow call the tag test uses, so every arithmetic
#     diamond changes shape.  All 79 demos' IR moved; all 79 demos' stdout stayed
#     byte-identical (the demo suite passes unchanged on both backends).  Verified by
#     capturing before/after and diffing with SSA temps and block labels normalized
#     (raw diffs are dominated by renumbering).  The normalized drift is EXACTLY,
#     with zero unexplained lines in either direction:
#       added   24346 = 5968 `br i1 %ovf, label %fixslow, label %fixmerge`
#                     + 11936 `extractvalue {i64, i1}` (two per site)
#                     +  5968 `call {i64, i1} @llvm.{sadd,ssub,smul}.with.overflow.i64`
#                     +   474 declare lines (3 intrinsics x 158 module headers --
#                             79 demos, header emitted twice per demo IR)
#       deleted 11936 = 5968 `br label %fixmerge` (the old unconditional fast exit)
#                     + 5968 bare `add`/`sub`/`mul i64` (replaced by the intrinsic)
#     i.e. 5968 arithmetic sites each traded one bare op + one unconditional branch
#     for a checked intrinsic + two extracts + a conditional branch.  The comparison
#     diamonds (= <) are untouched, and no slow block was cloned: branch targets
#     outnumber fixslow block definitions, which test/inline-arith-self-call-tests.sh
#     now pins directly.
#     A SECOND re-record followed in the same change, for two reasons: (a) the
#     prelude gained `rd-digits-neg` -- a negative integer literal now accumulates
#     downward instead of being built positive and negated, since the most negative
#     fixnum has no positive counterpart and the old code only worked by wrapping
#     TWICE, which the new trap turned into an unreadable literal.  Verified by
#     diffing the defined-function sets: exactly one new name
#     (scheme.base:code:rd-digits-neg), +2 definitions and +94 lines per demo, all
#     other drift being code_N renumbering.  (b) +1 new entry (exact-range), the
#     change's own demo.
#   numeric-conformance, group 1 (GitHub issue #24) -- a flonum literal's IR text now
#     comes from the emitter's own canonical formatter instead of the host's
#     number->string, so it is valid LLVM in a `double` position and byte-identical on
#     every door.  Verified against an 80-demo before/after capture (build/emit built in
#     a detached-HEAD worktree at 5d38be0 vs the regenerated tree): EXACTLY ONE demo
#     differs, by EXACTLY ONE line --
#       exact-range.ll: @.flo.lit.0 `"1e+18"` -> `"1.0e18"` (6 -> 7 byte array).
#     Nothing else moved in the other 79 demos.  The small drift is expected and is
#     itself evidence for the diagnosis: only a literal whose shortest decimal carries
#     an exponent AND lands in an unboxed region emitted invalid IR, and no demo had
#     one -- exact-range's `1e18` sits on the BOXED path, where the old text was a C
#     string that strtod happened to accept.  Every other flonum literal in the demos
#     (2.0, 2.5, 0.5, 1.0, ...) already printed with a '.', so its canonical form is the
#     text it already had.  All 80 demos' stdout is byte-identical.  No new entries --
#     the regression coverage is test/numeric-conformance-tests.sh (values, all four
#     doors) plus 10 flonum cases in test/self-emit-equiv.sh (IR byte-equality between
#     the Chez-hosted and self-hosted emitters); 8 of those 10 FAIL on the pre-change
#     tree, which is what gives them teeth.
#   numeric-conformance, group 3 (GitHub issue #26) -- `> <= >=` became value-position
#     integrables and `max`/`min` became variadic prelude procedures.  ALL 80 demos'
#     IR changed, because every demo embeds (scheme base) and declares its exports,
#     and the drift is EXACTLY two things with nothing else in either direction:
#       (1) PROGRAM half, all 80 identical in shape: +3 lines, 0 deletions, every one
#           an `external global i64` declare for a new prelude binding
#           (scheme.base:%minmax-fold, scheme.base:%minmax, scheme.base:min).
#           Mechanically checked: 0 of 80 program halves deviate from "+3 declares,
#           0 deletions, 0 non-declare additions".  Same shape as emit-dump-stages'
#           +2 declare lines.
#       (2) LIBRARY half: the NAMED function set went 161 -> 164, the additions being
#           exactly code:%minmax-fold, code:%minmax, code:min and the removals being
#           EMPTY (`max` already existed and kept its name while becoming variadic).
#           __init_N went 338 -> 344, i.e. +3 per header for 3 new top-level defines
#           (the header appears twice per demo IR).  All remaining drift is code_N
#           renumbering, the anonymous lambdas shifting because three defines were
#           inserted -- the same pattern as the rd-digits-neg re-record above.
#     Operator position was separately proven UNCHANGED, which is the property the
#     change promised: `build/schemec` output for a prelude-free program using
#     `> <= >=` at binary AND n-ary arity is byte-identical to the pristine
#     pre-change tree's (valid as a baseline since group 1 touched only flonum
#     literals and group 2 changed no IR at all).  All 80 demos' stdout is
#     byte-identical.  No new entries.
#   numeric-conformance, group 4 (the primitive staging) -- 17 new permanently-internal
#     `%`-ops added in ONE staged bootstrap: classification (%finite? %nan?), the flonum
#     arm of the rounding family (%flo-floor %flo-ceiling %flo-truncate %flo-round), and
#     the libm ops behind (scheme inexact) (%sqrt %exp %log %sin %cos %tan %asin %acos
#     %atan %atan2 %pow).  Stage 1: tables + runtime only, NO call sites, so the current
#     seed compiles all of it.  Verified against an 80-demo before/after capture: every
#     demo differs by EXACTLY +34 lines and 0 deletions, every added line a
#     `declare i64 @rt_*` -- 17 declares x the two headers per demo IR.  0 of 80 demos
#     deviate from that shape and there are no non-declare additions anywhere
#     (2720 added lines total = 80 x 34).  All 80 demos' stdout byte-identical.
#     Size, measured: committed IR +0.44-0.48% (+13.2KB each); build/emit +1200 bytes;
#     build/schemec +17744 (+3.2%) -- the larger figure because schemec links
#     src/runtime/runtime.c directly, so the 17 new C functions land in it whether a
#     program calls them or not (no -ffunction-sections/--gc-sections, and they are
#     exported rt_* symbols).  The declare header is emitted unconditionally for the
#     whole prim table, so this cost is paid by every module regardless of use; noted in
#     docs/PERFORMANCE.md alongside P8.  No new entries.
#   numeric-conformance, group 5 (GitHub issue #27) -- ~40 R7RS 6.2 procedures added to the
#     prelude, so (scheme base) went 172 -> 212 exports.  Drift, verified against an
#     80-demo before/after capture:
#       (1) LIBRARY half: the NAMED function set went 164 -> 204 -- exactly 40 additions
#           (abs ceiling complex? denominator even? exact exact-integer-sqrt
#           exact-integer? expt floor floor-quotient floor-remainder floor/ gcd inexact
#           lcm negative? ns-digits-radix numerator odd? positive? rational? round square
#           string->number truncate truncate-quotient truncate-remainder truncate/ and the
#           %-prefixed helpers) and ZERO removals; the rest is code_N renumbering.
#       (2) PROGRAM half: 79 of 80 demos gained exactly +40 `external global i64` declares
#           with 0 deletions and no non-declare change -- one per new export.
#       (3) exact-range.ll ALONE also changed shape (+109 -66), and the reason is worth
#           recording: it is the only demo that calls `number->string`, which R7RS requires
#           to take an optional radix and which therefore became variadic.  A rest-parameter
#           callee cannot use the cross-unit DIRECT call convention, so its one call site
#           became an indirect call through the closure (load closure -> load code pointer ->
#           call).  Measured at +22% on a number->string-dominated loop; filed as
#           docs/PERFORMANCE.md P9 rather than worked around here, since the right fix
#           covers every variadic callee.
#     All 80 demos' stdout byte-identical.  Size: the shaken Chez AOT door is BYTE-IDENTICAL
#     for a program using none of the new procedures (34,968 B at 5d38be0, at the staging
#     commit, and here), while `emit build` grew +19,808 B (+14.7%) -- the shake removes
#     100% of the growth and the unshaken door pays all of it, which is P8, now quantified
#     in that item.  No new entries.
#   numeric-conformance, groups 6+7 (GitHub issue #25; (scheme inexact)) -- the reader
#     learned the three non-finite tokens (+inf.0/-inf.0/+nan.0), and (scheme inexact)
#     joined the default manifest as Emit's second standard library.  Drift, verified
#     against an 80-demo before/after capture:
#       LIBRARY half: exactly ONE named addition, code:rd-nonfinite (204 -> 205 named,
#         0 removals).  Net +83 lines per demo; the rest of the raw diff (+6743/-6660)
#         is code_N renumbering, since the new define sits mid-reader and shifts every
#         anonymous label after it.
#       PROGRAM half: all 80 demos gained exactly +1 `external global i64` declare, 0
#         deletions, 0 non-declare changes -- one per new export.
#     Each demo's IR still holds exactly TWO units (one boundary marker), which is the
#     part worth recording.  Adding a second library to the default manifest first made
#     it THREE, because the run door preloaded every manifest entry whether the program
#     imported it or not -- which also made `--no-prelude` emit a unit it had promised
#     not to, and broke the run-door/Chez-driver program-IR parity this suite's sibling
#     (test/prelude-base-run-tests.sh) pins.  The preload is now LAZY: the run door walks
#     the transitive closure of the program's imports over the manifest and loads only
#     that (src/emit.cpp preload_user_libraries, compiler modes 9 + 12).  The REPL host
#     stays eager on purpose -- an interactive session is an open world.  So a program
#     that does not import (scheme inexact) is unaffected in IR and in bytes: a delivered
#     executable is byte-identical with and without the manifest entry (154,312 B both).
#     All 80 demos' stdout byte-identical.  No new entries.
#
# Needs an LLVM discoverable via llvm-config + libgc (to link build/emit); no Chez.  Run from anywhere.
set -u
cd "$(dirname "$0")/.."
. tools/log.sh   # say/vsay + EMIT_VERBOSITY (see docs/OUTPUT.md)

RUNNER="build/emit run"
REF=test/module-scaffold-baseline.sha256

# The shipped Chez-free front half emits the exact IR the JIT path would run.
ensure_runner () {
  make emit >/dev/null 2>&1 || { echo "fatal: could not build emit"; exit 1; }
}

demos () { ls demos/*.scm | sort; }

# emit one demo's IR to stdout; abort loudly if the compile fails.
emit_one () {  # <src>
  local src="$1"
  if ! $RUNNER --emit < "$src"; then
    echo "fatal: emit failed for $src" >&2
    return 1
  fi
}

do_capture () {  # <dir>
  local dir="$1"
  [ -n "$dir" ] || { echo "usage: $0 capture DIR" >&2; exit 2; }
  mkdir -p "$dir"
  ensure_runner
  local n=0
  for src in $(demos); do
    local name; name="$(basename "$src" .scm)"
    emit_one "$src" > "$dir/$name.ll" || exit 1
    n=$((n + 1))
  done
  say "captured $n demo IR snapshot(s) -> $dir"
}

do_manifest () {  # -> stdout: "<sha256>  <name>" per demo, sorted by name
  ensure_runner
  for src in $(demos); do
    local name; name="$(basename "$src" .scm)"
    local sum; sum="$(emit_one "$src" | shasum -a 256 | awk '{print $1}')" || exit 1
    printf '%s  %s\n' "$sum" "$name"
  done
}

do_check () {
  if [ ! -f "$REF" ]; then
    echo "fatal: reference manifest $REF is missing (run '$0 manifest > $REF')" >&2
    exit 1
  fi
  local tmp; tmp="$(mktemp)"
  do_manifest > "$tmp"
  if diff -u "$REF" "$tmp"; then
    rm -f "$tmp"
    say "byte-identity OK: $(wc -l < "$REF" | tr -d ' ') demo IR hashes match $REF"
  else
    rm -f "$tmp"
    echo "FAIL: emitted demo IR drifted from $REF (see diff above)" >&2
    exit 1
  fi
}

case "${1:-check}" in
  capture)  do_capture "${2:-}" ;;
  manifest) do_manifest ;;
  check)    do_check ;;
  *) echo "usage: $0 {capture DIR|manifest|check}" >&2; exit 2 ;;
esac
