#!/usr/bin/env bash
# r7rs-suite-tests.sh -- run the vendored R7RS-small conformance suite against `emit run`
# (change: r7rs-conformance-suite).
#
# Chez-FREE: consumes only the vendored suite and the committed manifests
# (test/r7rs/forms.tsv, test/r7rs/exclusions.tsv), both generated/maintained at vendor
# time.  That is what lets this live in run-all-tests.sh -- see tools/r7rs-manifest.ss
# for the generator and test/r7rs-manifest-gen-check.sh for its freshness guard.
#
# WHY A MANIFEST RATHER THAN JUST RUNNING THE FILE
#
# Emit compiles a whole program before running any of it, so ONE unsupported form aborts
# the compilation and every test in the file is lost.  An interpreter loses one test; we
# lose all 1180.  So each section is assembled from the forms forms.tsv names, minus the
# ones exclusions.tsv excludes.
#
# THE EXCLUSION MANIFEST IS A RATCHET, NOT A SNAPSHOT
#
# Checked in both directions, and either direction fails the suite:
#   * a form that is NOT excluded but no longer runs   -> regression
#   * a form that IS excluded but now passes           -> stale exclusion
# The second is what makes closing a conformance gap announce itself instead of waiting
# for someone to remember to re-measure.  Fixing a gap is expected to fail this suite
# once, naming the forms that started passing; the fixing commit deletes their entries.
#
# Usage:
#   test/r7rs-suite-tests.sh                  sections + stale-exclusion check (default)
#   test/r7rs-suite-tests.sh --sections-only   skip the stale-exclusion pass (faster)
#   test/r7rs-suite-tests.sh --discover        re-derive exclusions.tsv (slow; see below)
#   test/r7rs-suite-tests.sh --help
set -u
cd "$(dirname "$0")/.."
. tools/log.sh

SUITE=test/r7rs/r7rs-tests.scm
SUMS=test/r7rs/r7rs-tests.sha256
FORMS=test/r7rs/forms.tsv
EXCL=test/r7rs/exclusions.tsv
HARNESS=test/r7rs/harness.scm
RUN="build/emit run"
JOBS="${EMIT_JOBS:-$(sysctl -n hw.ncpu 2>/dev/null || nproc 2>/dev/null || echo 4)}"

# The staleness pass runs forms that are excluded PRECISELY BECAUSE they misbehave, so
# one of them not terminating is an ordinary outcome, not a surprise -- and an unbounded
# `emit run` there wedges the whole pass.  That is how a circular-structure form behaved
# the moment `set-cdr!` existed (GitHub issue #90: the printer has no cycle detection).
#
# TWO THINGS ABOUT THIS BOUND, both learned the hard way:
#
#   * It must be GENEROUS.  Each probe is a full compile+link (clang + LTO), which takes
#     ~2s alone and many times that with JOBS of them competing for the machine.  A tight
#     bound turns contention into a false "not stale" -- the silent direction, and exactly
#     the blindness the ratchet exists to prevent.  20s produced 389 false negatives here.
#   * A timeout is REPORTED, not swallowed.  A hang is legitimately not a pass, so the
#     exclusion stands -- but "we could not classify this form" is different from "we
#     classified it as still-broken", and the difference has to be visible or the manifest
#     rots exactly where nobody is looking.
#
# `timeout` is absent on a stock macOS, hence the probe -- without it the guard would
# silently do nothing, which is worse than not having it.
TIMEOUT_S="${EMIT_FORM_TIMEOUT:-120}"
if command -v timeout >/dev/null 2>&1;  then RUN_T="timeout $TIMEOUT_S $RUN"
elif command -v gtimeout >/dev/null 2>&1; then RUN_T="gtimeout $TIMEOUT_S $RUN"
else
  RUN_T="$RUN"
  say "r7rs-suite: no timeout(1) -- staleness pass runs unbounded (see issue #90)"
fi

mode=default
case "${1:-}" in
  --help|-h)
    cat <<'USAGE'
usage: test/r7rs-suite-tests.sh [--sections-only | --discover]

Run the vendored R7RS-small suite against `emit run`, one program per section.

  (no flag)        run every section, then check the exclusion manifest for staleness
  --sections-only  run the sections only -- catches regressions, not stale exclusions
  --discover       probe every form and rewrite test/r7rs/exclusions.tsv (slow)

Environment: EMIT_JOBS (parallelism, default = CPU count), EMIT_VERBOSITY,
             EMIT_FORM_TIMEOUT (seconds per form in the staleness pass, default 120).

run-all-tests.sh runs --sections-only; set EMIT_R7RS=1 there for the full pass.
USAGE
    exit 0 ;;
  --sections-only) mode=sections ;;
  --discover)      mode=discover ;;
  "")              ;;
  *) echo "r7rs-suite: unknown option: $1 (try --help)" >&2; exit 2 ;;
esac

for f in "$SUITE" "$SUMS" "$FORMS" "$HARNESS"; do
  [ -f "$f" ] || { echo "  [FAIL] missing $f"; exit 1; }
done
[ -f "$EXCL" ] || : > "$EXCL"          # --discover bootstraps from an empty manifest

if [ ! -x build/emit ]; then
  make emit >/dev/null 2>&1 || { echo "  [FAIL] could not build build/emit"; exit 1; }
fi

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT

# --- the Chez-free half of the staleness guard --------------------------------------
# A refreshed suite with a stale manifest would have the runner slicing the wrong line
# ranges and reporting confidently on the wrong text.  test/r7rs-manifest-gen-check.sh
# catches it by regeneration where Chez exists; this catches it everywhere.
if ! (cd test/r7rs && shasum -a 256 -c r7rs-tests.sha256 >/dev/null 2>&1); then
  echo "  [FAIL] $SUITE does not match $SUMS"
  echo "         the suite is vendored VERBATIM -- see test/r7rs/README.md"
  exit 1
fi
recorded="$(awk '/^# sha256:/ {print $3; exit}' "$FORMS")"
actual="$(awk '{print $1; exit}' "$SUMS")"
if [ "$recorded" != "$actual" ]; then
  echo "  [FAIL] $FORMS was generated against a different suite revision"
  echo "         regenerate with: chez --script tools/r7rs-manifest.ss"
  exit 1
fi

# --- manifest loading ---------------------------------------------------------------
# forms.tsv: key \t section \t start \t end \t excerpt   (# comments ignored)
grep -v '^#' "$FORMS" > "$TMP/forms" || true
# exclusions.tsv: key \t reason [\t note]
grep -v '^#' "$EXCL" 2>/dev/null | awk -F'\t' 'NF>=2 {print $1"\t"$2}' > "$TMP/excl" || true
cut -f1 "$TMP/excl" | sort > "$TMP/excl-keys"

nforms=$(wc -l < "$TMP/forms" | tr -d ' ')
nexcl=$(wc -l < "$TMP/excl-keys" | tr -d ' ')

# An exclusion whose key no longer names a form is dead weight from an earlier revision:
# it silently protects nothing, and hides that the form it referred to is gone.
cut -f1 "$TMP/forms" | sort > "$TMP/form-keys"
comm -23 "$TMP/excl-keys" "$TMP/form-keys" > "$TMP/orphans" || true
norphan=$(wc -l < "$TMP/orphans" | tr -d ' ')

# sections, in file order
awk -F'\t' '!seen[$2]++ {print $2}' "$TMP/forms" > "$TMP/sections"

# emit_program <out> <section> [extra-key]
# The harness first, then the section's forms in file order.  `extra-key` re-includes one
# excluded form (used by the staleness pass); every other exclusion stays excluded.
emit_program () {
  local out="$1" section="$2" extra="${3:-}"
  cat "$HARNESS" > "$out"
  awk -F'\t' -v sec="$section" -v extra="$extra" '
    NR==FNR { excluded[$1]=1; next }
    $2==sec && (!($1 in excluded) || $1==extra) { print $3"\t"$4 }
  ' "$TMP/excl-keys-only" "$TMP/forms" > "$out.ranges"
  while IFS=$'\t' read -r s e; do
    sed -n "${s},${e}p" "$SUITE" >> "$out"
    printf '\n' >> "$out"
  done < "$out.ranges"
  printf '(hx-summary)\n' >> "$out"
}
# A sentinel keeps this file non-empty.  With an empty first file the `NR==FNR` idiom
# below silently inverts: FNR restarts at 1 for the SECOND file, so NR==FNR matches its
# records and every form is treated as excluded -- which produces empty section programs
# that report "0 pass" and look like success.
cut -f1 "$TMP/excl" > "$TMP/excl-keys-only"
[ -s "$TMP/excl-keys-only" ] || echo "__no_exclusions__" > "$TMP/excl-keys-only"

# run_program <file> -> stdout captured to <file>.out; exit status is emit's
run_program () { $RUN "$1" > "$1.out" 2> "$1.err"; }

pass=0; fail=0
ok ()  { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

# --- discovery mode ---------------------------------------------------------------
# Rewrites exclusions.tsv from scratch by growing each section form by form and isolating
# every form that will not compile or run.  This is how the manifest was first populated;
# it is slow (about one `emit run` per form) and is never part of a normal run.
if [ "$mode" = discover ]; then
  say "r7rs-suite: discovery over $nforms forms, $JOBS jobs -- this takes minutes"
  : > "$TMP/discovered"
  while read -r section; do
    ( sfile="$TMP/disc-$(echo "$section" | tr -c 'A-Za-z0-9' '_')"
      : > "$sfile.rejects"
      awk -F'\t' -v sec="$section" '$2==sec {print $1"\t"$3"\t"$4}' "$TMP/forms" > "$sfile.all"
      # The accepted prefix is accumulated IN A FILE and appended to, never rebuilt: the
      # obvious version re-seds every accepted range each iteration, which is O(n^2) sed
      # invocations (about 23k for the 214-form Numbers section) and dominates the run
      # completely -- the compiles are not the slow part.
      cat "$HARNESS" > "$sfile.prog"; nfail=0
      while IFS=$'\t' read -r key s e; do
        cp "$sfile.prog" "$sfile.try"
        sed -n "${s},${e}p" "$SUITE" >> "$sfile.try"; printf '\n' >> "$sfile.try"
        printf '(hx-summary)\n' >> "$sfile.try"
        # A form is excluded for EITHER reason: it does not run, or it runs and gets a
        # wrong answer.  Both are "the suite cannot use this form yet", and treating them
        # alike is what lets the manifest be the single gate -- otherwise every known
        # conformance defect leaves the suite permanently red and it stops being a signal.
        # `nfail` is the running failure count, so the delta attributes a new FAIL to the
        # form just added rather than to something earlier in the prefix.
        $RUN "$sfile.try" > "$sfile.out" 2>"$sfile.err"
        if grep -q '^SUMMARY' "$sfile.out"; then
          now=$(awk -F'\t' '/^SUMMARY/ {sub(/fail=/,"",$3); print $3; exit}' "$sfile.out")
          if [ "${now:-0}" -eq "${nfail:-0}" ]; then
            sed -n "${s},${e}p" "$SUITE" >> "$sfile.prog"; printf '\n' >> "$sfile.prog"
          else
            # nfail deliberately NOT advanced: the form is rejected, so it does not join
            # the prefix and its failure will not recur.  Advancing the baseline here
            # would hide the NEXT failing form.
            # tabs flattened: the note is the third COLUMN of a tab-separated file,
            # and a FAIL line is itself tab-separated
            reason="$(grep '^FAIL' "$sfile.out" | tail -1 | tr '\t' ' ' | cut -c1-160)"
            printf '%s\twrong-answer\t%s\n' "$key" "$reason" >> "$sfile.rejects"
          fi
        else
          reason="$(grep -v 'resolve manifest' "$sfile.err" | tail -1 | tr '\t' ' ' | cut -c1-100)"
          printf '%s\tunimplemented\t%s\n' "$key" "$reason" >> "$sfile.rejects"
        fi
      done < "$sfile.all" ) &
    while [ "$(jobs -rp | wc -l)" -ge "$JOBS" ]; do wait -n 2>/dev/null || break; done
  done < "$TMP/sections"
  wait
  cat "$TMP"/disc-*.rejects 2>/dev/null | sort > "$TMP/discovered"
  {
    echo "# exclusions.tsv -- forms the suite does not run, with the reason."
    echo "# DRAFT from --discover: every reason is 'unimplemented' plus the raw error."
    echo "# Retag by hand (deliberate:<ref> / issue-NN / blocked-by:<key>); the raw error"
    echo "# OVERSTATES gaps -- see openspec/explorations/r7rs-conformance-suite/README.md."
    echo "#"
    echo "# key\treason\tnote"
    sort "$TMP/discovered"
  } > "$EXCL.draft"
  say "r7rs-suite: wrote $EXCL.draft ($(grep -vc '^#' "$EXCL.draft") forms); review and move it into place"
  exit 0
fi

# --- pass 1: every section, with exclusions applied -------------------------------
say "r7rs-suite: $nforms forms, $nexcl excluded, $(wc -l < "$TMP/sections" | tr -d ' ') sections"
tp=0; tf=0
while read -r section; do
  p="$TMP/sec-$(echo "$section" | tr -c 'A-Za-z0-9' '_')"
  emit_program "$p" "$section"
  nsec=$(wc -l < "$p.ranges" | tr -d ' ')
  nx=$(awk -F'\t' -v sec="$section" 'NR==FNR{e[$1]=1;next} $2==sec && ($1 in e)' \
         "$TMP/excl-keys-only" "$TMP/forms" | wc -l | tr -d ' ')
  if ! run_program "$p"; then
    bad "$section -- a non-excluded form failed to compile or run (regression)"
    grep -v 'resolve manifest' "$p.err" | tail -3 | sed 's/^/           /'
    continue
  fi
  sp=$(awk -F'\t' '/^SUMMARY/ {sub(/pass=/,"",$2); print $2; exit}' "$p.out")
  sf=$(awk -F'\t' '/^SUMMARY/ {sub(/fail=/,"",$3); print $3; exit}' "$p.out")
  tp=$((tp + sp)); tf=$((tf + sf))
  if [ "${sf:-0}" -eq 0 ]; then
    ok "$section  ${sp} pass, ${nx} excluded"
  else
    bad "$section  ${sp} pass, ${sf} FAIL, ${nx} excluded"
    grep '^FAIL' "$p.out" | sed 's/^/           /' | head -20
  fi
done < "$TMP/sections"

# --- pass 2: is any exclusion stale? ----------------------------------------------
# Each excluded form is re-included on its own, on top of its section's accepted forms
# (which supply the helpers it may need).  If that program compiles, runs and reports no
# failure, the exclusion is stale.  One `emit run` per excluded form, run JOBS-wide.
stale=0
if [ "$mode" = default ] && [ "$nexcl" -gt 0 ]; then
  say "r7rs-suite: checking $nexcl exclusions for staleness ($JOBS jobs)"
  : > "$TMP/stale"
  : > "$TMP/timedout"
  awk -F'\t' 'NR==FNR{e[$1]=1;next} ($1 in e) {print $1"\t"$2}' \
      "$TMP/excl-keys-only" "$TMP/forms" > "$TMP/excl-forms"
  while IFS=$'\t' read -r key section; do
    ( p="$TMP/st-$key"
      emit_program "$p" "$section" "$key"
      ( $RUN_T "$p" > "$p.out" 2>"$p.err" ) 2>/dev/null; rc=$?
      if [ "$rc" = 0 ]; then
        if grep -q '^SUMMARY' "$p.out" && ! grep -q '^FAIL' "$p.out"; then
          printf '%s\t%s\n' "$key" "$section" >> "$TMP/stale"
        fi
      elif [ "$rc" = 124 ] || [ "$rc" = 137 ]; then
        # timeout(1) exits 124; 137 is a SIGKILL escalation.  UNCLASSIFIED, not "fine".
        printf '%s\t%s\n' "$key" "$section" >> "$TMP/timedout"
      fi
      rm -f "$p" "$p.out" "$p.err" "$p.ranges" ) &
    while [ "$(jobs -rp | wc -l)" -ge "$JOBS" ]; do wait -n 2>/dev/null || break; done
  done < "$TMP/excl-forms"
  wait
  stale=$(wc -l < "$TMP/stale" 2>/dev/null | tr -d ' ')
  if [ "${stale:-0}" -gt 0 ]; then
    bad "$stale exclusion(s) are STALE -- these forms now pass and must be un-excluded"
    while IFS=$'\t' read -r key section; do
      line=$(awk -F'\t' -v k="$key" '$1==k {print $3": "$5}' "$TMP/forms")
      reason=$(awk -F'\t' -v k="$key" '$1==k {print $2}' "$TMP/excl")
      echo "           [$reason] line $line"
    done < "$TMP/stale" | head -30
    echo "           delete their entries from $EXCL"
  else
    ok "no stale exclusions ($nexcl checked)"
  fi
  # Unclassified forms are reported whether or not anything was stale: a probe that did
  # not finish tells us nothing about its exclusion, and that has to be said out loud.
  ntimeout=$(wc -l < "$TMP/timedout" 2>/dev/null | tr -d ' ')
  if [ "${ntimeout:-0}" -gt 0 ]; then
    echo "  [NOTE] $ntimeout form(s) did not finish within ${TIMEOUT_S}s -- exclusion kept, but"
    echo "         UNVERIFIED (a hang is not a pass).  Raise EMIT_FORM_TIMEOUT if the machine"
    echo "         was merely busy; a genuine non-terminating form belongs in the manifest note."
    while IFS=$'\t' read -r key section; do
      echo "           $key  $section"
    done < "$TMP/timedout" | head -10
  fi
fi

if [ "${norphan:-0}" -gt 0 ]; then
  bad "$norphan exclusion key(s) name no form in $FORMS (left over from an older revision)"
  sed 's/^/           /' "$TMP/orphans" | head -10
fi

echo
echo "  assertions: $tp passed, $tf failed;  forms: $((nforms - nexcl)) run, $nexcl excluded"
echo "  $pass section/check groups passed, $fail failed"
[ "$fail" -eq 0 ]
