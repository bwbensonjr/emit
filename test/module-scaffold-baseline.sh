#!/usr/bin/env bash
# module-scaffold-baseline.sh -- byte-identity guard for Modules v0 Stage 0
# (change: module-resolution-scaffold).
#
# The scaffolding (typed-scope resolver + unit-parameterized symbol naming) MUST
# NOT change the LLVM IR emitted for any library-free program (spec: "Scaffolding
# preserves emitted IR").  This harness compiles every demos/*.scm through the
# shipped Chez-free front half (`emit run --emit`) and checks the emitted
# IR against a recorded reference.
#   checked-primitive-arguments (GitHub issues #84, #82, #78) -- every primitive that
#     dereferences an argument now tag-checks it first, pairs became mutable, and the
#     operator of an INDIRECT call is tag-checked where its code pointer is loaded.  Only
#     the last of those three touches emitted IR, and it touches a lot of it.  Verified
#     against an 80-demo before/after capture (build/emit built in a detached-HEAD
#     worktree at 523c244 vs the regenerated tree), classified mechanically after
#     normalizing every identifier/label numeric suffix:
#       NET REMOVALS: ZERO.  Every deletion in the raw diff is renumbering -- inserting a
#         line shifts every %tN, code_N, __init_N and fixmergeN after it.
#       NET ADDITIONS: 42,640 lines across 80 demos, of exactly three kinds --
#         (1) 39,351 `call void @rt_check_callable(i64 ...)`, one per indirect call site
#             (emit-app and emit-apply, the only two callers of emit-load-code); a call to
#             a statically-known closure (self-app/known-app) correctly has none;
#         (2) 729 declares = 3 new runtime symbols (rt_check_callable, rt_set_car,
#             rt_set_cdr) x 80 demos x the ~3 headers per demo IR;
#         (3) 2,560 lines = 32 x 80, EXACTLY ONE new function body per demo --
#             scheme.base:code:list-set!, the one prelude definition this change adds.
#       NAMED FUNCTION SET: +58/-57, of which the only non-code_N entry is the addition
#         `scheme.base:code:list-set!`; the 57/57 code_N churn is anonymous-lambda
#         renumbering, balanced in both directions.
#     All 80 demos' stdout is BYTE-IDENTICAL (RUNNER=emit-run demos/run-tests.sh diffed
#     between the two trees).  Size: build/emit 1,630,104 -> 1,663,480 bytes (+2.0%),
#     the cost of the indirect-call guard; recorded in docs/PERFORMANCE.md P16.  No new
#     entries -- the regression coverage is test/typed-argument-tests.sh (59 cases).
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
#   r7rs-conformance-suite -- +4 lines in every module's runtime declare header
#     (@rt_procedure_p, @rt_make_string_1, @rt_make_vector_1, @rt_string_copy_from), the
#     primitives behind `procedure?` and the optional-argument forms of make-string,
#     make-vector and string-copy.  Every one of the 80 demos moved, and the header is
#     why: `emit run --emit` writes the declare block into each module it emits, so a new
#     declare touches all of them without changing a single instruction.  Verified: the
#     new IR carries exactly those four declares per module and nothing else new, and
#     every demo's stdout is byte-identical (the demo suite passes on both doors).  One
#     demo additionally gains expander temps, since n-ary `string=?` now routes through
#     the comparison chain -- the only demo that uses it in operator position.  No new
#     entries and none removed.
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
#   scheme-base-declared-surface (GitHub issue #29) -- (scheme base)'s public surface is now
#     DECLARED (src/prelude-surface.scm) instead of derived from every top-level define, so
#     it went 213 -> 136 exports (77 internal helpers left the export list and stayed in the
#     library BODY).  Drift, verified against an 80-demo before/after capture:
#       PROGRAM half: all 80 demos lost exactly 77 `external global i64` declares -- 6,160
#         deletions, ZERO additions, zero non-declare changes, zero reordering.  The shape is
#         pure deletion because the export list is the prelude's defines in SOURCE ORDER
#         minus a subtracted set, so curating it cannot permute what remains.
#       LIBRARY half: bootstrap/scheme.base.ll BYTE-IDENTICAL.  Library emission and code
#         labels key on binding names, not export status (emit-library-batch; the
#         stable-code-label mangle), so de-exporting a helper is inert for the unit.
#     Sizes, measured: the shaken Chez AOT door is byte-identical (34,664 / 35,640 / 36,280 B
#       for the three tree-shaking programs, unchanged), because an unreferenced `external
#       global` declaration creates no relocation and program-root-internals is
#       reference-driven, not export-driven.  So this is a namespace/API-commitment change,
#       NOT a size change -- it is no substitute for docs/PERFORMANCE.md P8.  The COMPILER
#       binaries do pay for the new declaration table: build/emit +16,512 B (1,375,752 ->
#       1,392,264), build/schemec unchanged at 589,784 B; committed IR embed.ll +10,776,
#       embed-repl.ll +11,015, schemec.ll -3,741 (the declaration's own symbols against 77
#       fewer declares per program module).
#     All 80 demos' stdout byte-identical.  No new entries.
#   scheme-base-declared-surface, the renames (same change, second re-record) -- the two
#     helpers the derived forms expand to were renamed to honest public spellings, since a
#     macro template is instantiated in the IMPORTER's scope and so publishes whatever name
#     it mentions: `%with-handler` -> `with-exception-handler` (R7RS 6.11, a conformance
#     gain) and `%with-parameters` -> `with-parameters` (an extension).  Export COUNT is
#     unchanged at 136.  Drift, verified against an 80-demo before/after capture: every
#     changed line mentions one of the renamed names -- 20 lines per demo (10 occurrences:
#     the global slot, the code label, its definition, the init store, and the loads),
#     1,632 lines across the 80, and ZERO lines that do not.  Unlike the export curation
#     above, this one DOES move the library: bootstrap/scheme.base.ll +32 B (512,562 ->
#     512,594), 16 changed lines, all of them the renamed symbols -- labels are
#     name-derived (stable-code-label), so a rename shows up in the unit.  The fixed point
#     needed 2 iterations rather than 1, which is expected when the prelude source itself
#     changes: the baked *prelude-source* string feeds the next generation's output.
#     All 80 demos' stdout byte-identical.  No new entries.
#   scheme-base-partition -- the baked standard library became a PARTITION: (emit internal),
#     the internal substrate holding the port representation and the in-language reader,
#     plus (scheme base), which now IMPORTS it.  Every demo's snapshot therefore holds TWO
#     unit modules ahead of the program instead of one, which is most of the byte delta and
#     is not itself drift -- the units were checked separately and every one of the 80
#     demos' unit modules is byte-identical to the committed bootstrap/emit.internal.ll and
#     bootstrap/scheme.base.ll.
#     The PROGRAM modules are where drift would hide, and there it is exactly +2/-2 lines
#     per demo -- 160 added, 160 removed across the 80 -- of exactly two kinds and nothing
#     else, verified against an 80-demo before/after capture (a detached HEAD worktree):
#       (1) -2 `@"scheme.base:rd-skip-ws"` / `@"scheme.base:rd-token-end" = external global
#           i64`.  Those two left (scheme base)'s export list with the retired `unstable`
#           tier (issue #32), and an importing program declares one `external global` per
#           export -- the exact mechanism src/prelude-surface.scm's header describes.
#       (2) +2 `declare i64 @"emit.internal:__init"()` and its `call` from @scheme_entry:
#           the new baked member's initializer, declared and invoked in dependency order
#           before (scheme base)'s.
#     ZERO other lines moved in any of the 80 program modules -- no codegen, no label, no
#     constant.  Cross-unit calls into the substrate cost nothing here because the reader
#     is private: no demo calls it directly.  The library itself did move, as expected when
#     definitions are re-homed: scheme.base.ll 512,594 -> 367,451 B (the reader and port
#     representation left) and the new emit.internal.ll is 170,716 B, +25,573 B net for the
#     18 definitions the substrate must define for itself (design D10).  All 80 demos'
#     stdout byte-identical.  No new entries.
#   scheme-base-partition, step 5 (the BREAKING half) -- the sixteen names R7RS-small places
#     outside (scheme base) left its export list for (scheme cxr) / (scheme read) /
#     (scheme file).  An importing program declares one `external global` per export it can
#     see, so dropping sixteen exports drops sixteen declarations from EVERY program module.
#     Verified against an 80-demo before/after capture (a detached worktree at the step-4
#     commit), and the split is exactly two groups with nothing else in either:
#       (1) 78 of the 80 demos differ by EXACTLY -16 lines and +0, and all sixteen are
#           `@"scheme.base:<name>" = external global i64` for precisely the relocated
#           names: caaar caadr cadar caddr cdaar cdadr cddar cdddr cadddr, open-input-file,
#           read, open-output-file, with-output-to-file, with-input-from-file,
#           call-with-output-file, call-with-input-file.  No codegen, label or constant
#           moved in any of them -- a demo that never used a relocated name is otherwise
#           byte-identical.
#       (2) the two demos SWEPT in step 5.5 differ further, and only as their new imports
#           require: demos/case-cxr.scm (-22/+32) gained (scheme cxr) and demos/ports.scm
#           (-29/+24) gained (scheme read) and (scheme file).  Each gains that library's
#           __init declare + call, `external global` rows for the names it uses, and
#           re-pointed direct-call declares -- the same call sites, now resolved against the
#           owning unit instead of scheme.base.  BOTH demos' stdout is byte-identical to
#           before the sweep, which is the point: the procedures did not change, only the
#           library that exports them.
#     Snapshots now hold more units for those two demos (3 and 4 rather than 2), since a
#     relocated library is linked only by a program that imports it -- visible in the byte
#     totals and not itself drift.  scheme.base.ll 367451 -> 338670 B (the sixteen
#     definitions left); emit.internal.ll unchanged at 170716 B, byte-identical, since the
#     cxr nine simply traded their (scheme base) home for a (scheme cxr) one and the
#     substrate's own copy did not move.  No new entries.
#   reader-lexical-conformance (issues #59, #25) -- the READER is part of the baked set, so
#     this change moves EVERY demo's snapshot: all 80 hashes differ.  That was stated in
#     advance (the change's design D6) and is the one re-record in this log where the
#     manifest changes wholesale, so the verification is correspondingly specific.
#     Verified against an 80-demo before/after capture (a detached-HEAD worktree at the
#     pre-change commit vs the regenerated tree), splitting each snapshot at
#     `; ==EMIT-UNIT-BOUNDARY==`:
#       PROGRAM module: byte-IDENTICAL for all 80 demos.  Not one program's code changed;
#         the whole delta is inside the baked libraries the snapshot carries with it.
#       UNIT COUNT: unchanged for all 80 (still 2, or 3/4 for the two demos that import a
#         relocated library) -- no library was added, removed, or re-linked.
#       (emit internal): 170716 -> 289754 B.  The reader is homed here, and it gained
#         nested block comments, datum comments, the prefixed-number grammar, bar-quoted
#         identifiers, and the report sentinel -- plus %digit-in-radix / %radix-digits /
#         %string->int, re-homed down from (scheme base) so the reader and string->number
#         share ONE numeric grammar (design D3).
#       (scheme base): 338670 -> 330361 B -- SMALLER, which is those three re-homed
#         definitions leaving plus string->number collapsing to one call into the shared
#         grammar.  The two moves account for each other.
#     All 80 demos' stdout is byte-identical before and after (the `demo values` suite
#     passes 80/80), and the cross-host suites that compare Emit's emitted IR against the
#     Chez-hosted compiler's -- self-emit-equiv, dump-parity, prelude-base-run -- still
#     pass, which is what says the two readers still agree.  No new entries.
#   reader-token-path (issue #61) -- again the whole manifest, and again because the reader
#     is baked; but the PROGRAM-module delta this time is NOT zero, and the exact shape is
#     the point.  Verified against an 80-demo before/after capture (a detached-HEAD worktree
#     at 9a84ca2 vs the regenerated tree), split at `; ==EMIT-UNIT-BOUNDARY==`:
#       PROGRAM module: exactly ONE added line per demo, the same line in all 80 --
#         `@"scheme.base:read-all-from-string-ci" = external global i64`.  80 additions,
#         ZERO deletions, and no other line moved in any of the 80.  (scheme base) gained
#         one export, so every program declares it in the header whether or not it calls
#         it -- the same mechanism as the `@rt_dump_level` and `@rt_make_flonum` entries
#         above, one declare line rather than two.
#       UNIT COUNT: unchanged for all 80 -- no library added, removed, or re-linked.
#       (emit internal): 289754 -> 297072 B (+7318).  The fold helpers rd-fold-char /
#         rd-fold-token, plus the CI argument threaded through rd-datum / rd-list /
#         rd-hash / rd-atom and the quote sugar arms -- an extra parameter changes every
#         one of those procedures' arity check and call sites.
#       (scheme base): 330361 -> 332807 B (+2446).  read-all-from-string-ci, and
#         read-all-from-string re-expressed as a wrapper over the shared `rd-all` worker.
#         The entry points live here rather than in the substrate because they REPORT, and
#         scheme-base-partition D10 keeps rd-report out of (emit internal).
#     All 80 demos' stdout is byte-identical before and after, and the cross-host suites
#     still pass -- including library-include-tests.sh, whose driver section now compares
#     an include-ci fixture's geom.ll across the two doors byte for byte, which is what
#     replaces the single shared fold this change deleted.  No new entries.
#   r7rs-lexical-conformance (issues #74, #80, #81, #86) -- the whole manifest again, and
#     again because the reader is baked; but the PROGRAM-module delta is EXACTLY ZERO,
#     which is the interesting half.  Verified against an 80-demo before/after capture (a
#     detached-HEAD worktree at ae08eff, `make emit` from committed IR, vs the regenerated
#     tree), split at `; ==EMIT-UNIT-BOUNDARY==`:
#       PROGRAM module: byte-identical in all 80.  Not one line moved, and no declare was
#         added -- unlike reader-token-path above, this change exports no new (scheme base)
#         name, so no program's header grew.  This is also the evidence that the
#         syntax-rules literals-precedence fix (#80) is INERT: every literals list in the
#         compiler's own sources is `()`, `(else =>)`, `(unquote)`, or `(else guard)`, none
#         naming `_` or `...`, so the reordered tests cannot fire.  And it is the evidence
#         that widening `case`'s literals list to `(else =>)` (#81) did not disturb the
#         expansion of any EXISTING `case` -- demos/casecxr.scm uses `case` and its program
#         module is unchanged.
#       UNIT COUNT: unchanged for all 80 -- no library added, removed, or re-linked.
#       (emit internal): 309909 -> 348166 B (+38257).  The reader lives here, and this is
#         where all of #74 landed: the #true/#false token arm, three R7RS character names
#         plus `page`, the #\xHH decoder (rd-char-hex + rd-hex-digit?), the \a/\b escapes,
#         the `\`-newline continuation (rd-intraline + rd-line-continuation), and the
#         allocation-free rd-ci=? the non-finite tokens now compare through.  Six new
#         procedures, each with its arity check and call sites, plus the constants for the
#         new name table -- so everything after them renumbers.
#       (scheme base): 583077 -> 585238 B (+2161).  `case` gained two receiver rules, and
#         rd-report gained two arms (rd-char-name, rd-hash-token).  rd-report is here and
#         not in the substrate because it REPORTS, which scheme-base-partition D10 keeps
#         out of (emit internal).
#       (scheme read): 26469 -> 28544 B (+2075), in the 21 demos that import it.  It
#         carries its own copy of rd-report for exactly the D10 reason above, so the two
#         new arms land twice by design.
#     All 80 demos' stdout is byte-identical before and after (`RUNNER=emit-run
#     demos/run-tests.sh` passes 80/80), and the R7RS suite goes from 386 to 363
#     exclusions with no stale entries.  No new entries.
#   reader-input-termination -- `rd-report` gained two arms (rd-unterminated-list,
#     rd-unterminated-string) and rd-list/rd-string each gained an `open` parameter, so the
#     reader's constant pool gained NINE constants and everything after them renumbered.
#     Verified against an 80-demo pre-change capture (a detached HEAD worktree at cddaf18,
#     `make emit` from committed IR) vs the post-regen tree.  Two kinds of drift, nothing
#     else:
#       (1) 79 demos: +332 lines each, EXACTLY the same delta.  The nine new constants are
#           " opened at index", "unterminated ", "list (", "list [", "vector #(",
#           "bytevector #u8(", "unterminated string \" opened at index", and the two reason
#           symbols; the rest is @.str.* renumbering behind them.  A set-diff of every
#           string CONTENT in a demo before vs after shows those nine added and nothing
#           removed, so no constant changed value.
#       (2) ports.ll ONLY: +515 lines, and it references the new constants 8 times where
#           every other demo references them 4 times -- exactly double, because it is the
#           one demo reaching the port `read`, which carries (scheme read)'s DUPLICATED
#           copy of rd-report (design D2; the same arrangement %check-input-port has).
#           The outlier is therefore the duplication showing up in the IR, not extra
#           codegen.
#     All 80 demos' stdout is byte-identical before and after (the demo-values suite passes
#     unchanged), and the reader's own behaviour change is what the new tests assert rather
#     than anything the demos exercise.  No new entries.
#   catchable-errors-with-kinds (issues #85, #89) -- the whole manifest again, since the
#     prelude is baked; and unlike r7rs-lexical-conformance the PROGRAM modules ARE expected
#     to move, because (scheme base) gains two exports and the runtime gains six symbols.
#     The check is therefore that the delta is ONLY what the new names account for.
#     Verified against an 80-demo before/after capture (a detached-HEAD worktree at a7b46a2,
#     `make emit` from committed IR, vs the regenerated tree), split at
#     `; ==EMIT-UNIT-BOUNDARY==`:
#       PROGRAM module: ZERO removals in all 80, and +8 lines each -- the six new runtime
#         declares (@rt_make_error_object_kind, @rt_error_object_kind, @rt_set_trap_raiser,
#         @rt_trap_object, @rt_file_exists_p, @rt_delete_file) plus
#         `@"scheme.base:read-error?"` and `@"scheme.base:file-error?" = external global`.
#         ports.ll alone gets +2 more (`scheme.file:file-exists?` / `:delete-file`), being
#         the one demo that imports (scheme file).  642 added lines total, 0 removed, and
#         no codegen, label or constant moved in any program.  NO trap site was edited --
#         the ~44 of them funnel through rt_fatal/rt_fatalf, which is exactly why the
#         program modules hold still while traps become catchable.
#       UNIT COUNT: unchanged for all 80 -- no library added, removed, or re-linked.
#       NAMED FUNCTION SET: +10, ZERO removals, and every one is a new definition the
#         partition homes: (scheme base) %raise-kinded / %read-error / read-error? /
#         file-error?; (scheme file) %raise-kinded / %file-error / file-exists? /
#         delete-file; (scheme read) %raise-kinded / %read-error.  The three copies of
#         %raise-kinded are design D10 again -- anything that RAISES lives where `error`
#         does, so it cannot come from the substrate and each reporting member defines its
#         own.  `error` and `rd-report` keep their names; only their bodies changed.
#       (emit internal): 348166 -> 348399 B (+233), and the diff is EXACTLY the six declare
#         lines -- not one other byte.  The substrate raises nothing, so it gains nothing
#         but the header.
#       (scheme base): 585239 -> 592049 B (+6810).  Four new definitions, `error` delegating
#         to the shared fold, rd-report's ten arms re-pointed at %read-error, and the
#         raiser closure in *handlers*' initializer.
#       (scheme file): 20904 -> 27441 B (+6537) and (scheme read): 28545 -> 32692 B (+4147),
#         in the demos that import them -- their own private copies of the fold, plus
#         (scheme file)'s two new procedures.
#     The one genuinely new call site in the whole capture is `@rt_set_trap_raiser(ptr
#     @__apply0, ...)`, appearing EXACTLY ONCE per demo (80 total) -- (scheme base) arming
#     the trap raiser as it creates the handler chain.  All 80 demos' stdout is
#     byte-identical before and after (`RUNNER=emit-run demos/run-tests.sh` passes 80/80 on
#     both trees, and the two transcripts are byte-identical), and the R7RS suite goes from
#     363 to 351 exclusions with no stale entries.  build/emit 1681192 -> 1698264 B (+1.0%).
#     No new entries.
#   r7rs-cyclic-datum-round-trip (issues #75, #108) -- all 80 hashes move because the
#     baked reader substrate and (scheme base) are present in every emitted file.  A capture
#     from HEAD's committed compiler vs the regenerated tree, split at unit boundaries,
#     classified the change:
#       PROGRAM modules: 71/80 are byte-identical.  The other nine differ in only one or
#         two initializer hunks that construct quoted compound constants (case-cxr,
#         equal-list, map-multi-list, quote-list, quote-traverse, string-char, unicode,
#         unspecified-value, vectors).  Their pair-allocation count stays exactly 68;
#         graph-aware lowering adds exactly 67 rt_set_car + 67 rt_set_cdr calls to fill the
#         pairs after allocating and memoizing them.  No procedure body changes.
#       LIBRARIES: (emit internal) adds exactly 17 stable named functions, all the new
#         rd-state/directive/label/fixup helpers, and removes none.  (scheme base)'s stable
#         named-function set is unchanged while list? and its reader-facing implementations
#         move.  The additionally linked (scheme cxr) and (scheme file) units are
#         byte-identical; (scheme read) changes as expected with its reader copy.
#     All 80 demos' stdout is unchanged (the demo-values suite passes 80/80).  No new
#     entries.
#   cross-unit-variadic-direct-calls (docs/PERFORMANCE.md P9) -- immutable variadic
#     library exports now publish their minimum arity and existing code label, so calls
#     with enough statically counted arguments use the same known-app ABI as fixed-arity
#     exports.  Verified against an 80-demo before/after capture: 40 demos are
#     byte-identical; the other 40 all shrink, by 7,772 bytes in aggregate.  Exactly 97
#     call sites lose rt_check_callable plus the closure mask/code-pointer load chain and
#     gain a direct code-label call; 60 external code-label declarations are added.  No
#     other program-unit shape changed.  ports.ll also changes its linked (scheme file)
#     unit, as expected because that library directly calls variadic (scheme base)
#     exports.  All other linked library units are byte-identical.  No new entries.
#   variadic-min-arity-fast-entry (docs/PERFORMANCE.md P9 follow-up) -- every variadic
#     body gains a same-ABI minimum definition, so all 80 hashes move.  A preserved
#     before/after capture showed 80 changed and 0 byte-identical files, with aggregate
#     raw IR 82,577,977 -> 89,326,012 bytes (+6,748,035, +8.17%).  The common delta is
#     +84,585 bytes per demo; the small deviations are program call-label changes, plus
#     ports.ll's additional (scheme file) unit.  Across the capture, 13 direct call sites
#     select the encoded minimum entry and 85 calls to procedures that have one retain the
#     ordinary label.  Every demo's stdout is unchanged.  The P9 source-driver gate
#     improved 7.89% at the median while growing 80 bytes (+0.113%);
#     the converged compiler confirmed 5.00% while growing 88 bytes (+0.125%).  The
#     `min-entry:$...` encoding keeps generated labels disjoint from legal Scheme names such
#     as `foo.min`.  No new entries.
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
