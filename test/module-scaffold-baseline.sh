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
