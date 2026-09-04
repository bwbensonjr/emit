#!/usr/bin/env bash
# string-port-scaling-tests.sh -- change: buffer-backed-string-ports, design D7.
#
# THE ONE DEFECT NO CORRECTNESS SUITE CAN SEE.  Every port test in this repo passed
# while docs/PERFORMANCE.md P21 was live: an output string port was a libc `FILE`
# over open_memstream, and libc allocates a `FILE` by WALKING its list of streams
# looking for a free slot.  A stream that is never closed is never a free slot, so a
# program that opened string ports and dropped them paid, per new port, a walk past
# every port it had ever opened.  P21 recorded 80,000 ports at 7.09 s left open
# against 0.52 s closed; the machine this suite was written on reproduced 9.14 s
# against 0.06 s.  Quadratic against flat, on either machine, and invisible to every
# assertion about what a port CONTAINS.
#
# So this suite asserts a shape, not a value:
#
#   * keep/close RATIO -- the same work with the ports left open costs about what it
#     costs with each closed in turn.  Closing a port is hygiene, never a
#     requirement for a program to scale (spec: io-ports), and this is the assertion
#     that says so.
#   * keep/keep GROWTH -- 4x the ports costs on the order of 4x, not 16x.  Left open,
#     the old runtime went 0.50 s -> 9.14 s over that same 4x: 18x, where linear is 4x.
#
# RATIOS AND NOT WALL CLOCKS, deliberately (design D7): an absolute bound becomes a
# machine-speed tripwire the first time it runs on slower hardware, while a ratio
# against a control on the same machine measures only the thing that broke.  Each
# timing is the BEST of three runs, so a scheduling hiccup does not decide the
# verdict.
#
# The two bounds are loose but they are NOT the same number, and the difference
# matters.  keep/close compares like with like -- the healthy value is 1.0, and the
# defect made it 150x here -- so 3x is generous.  keep/keep cannot be that tight: 4x
# the ports IS 4x the work for a correct implementation, and only process startup (a
# fixed cost in both) pulls the observed ratio below 4.  A bound of 3 would therefore
# fail on a machine fast enough to make startup negligible, which is a tripwire and
# not a test.  8x sits above linear-with-no-startup and well below the 18x the
# quadratic produced.
#
# Chez-FREE, but it lives in the Chez-gated developer suite because it is a
# performance shape rather than a correctness gate: it costs six builds and a dozen
# timed runs, and nothing about a delivered binary's behavior depends on it.
#
# Run from the repo root:  test/string-port-scaling-tests.sh
set -u
cd "$(dirname "$0")/.."
. tools/log.sh

make emit >/dev/null 2>&1 || { echo "failed to build build/emit"; exit 1; }

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
pass=0; fail=0
ok ()  { echo "  [OK  ] $1"; pass=$((pass+1)); }
bad () { echo "  [FAIL] $1"; fail=$((fail+1)); }

# N string ports, ten characters written to each and the text taken back from each.
# Each port goes out of scope at the end of its iteration, so the program RETAINS
# nothing -- which is the whole point: the cost P21 measured came from the runtime
# holding the stream, not from the program holding the port.  `keep` decides only
# whether the program closes what it is finished with.
gen () {                        # gen FILE N KEEP
  cat > "$1" <<EOF
(define (churn n keep)
  (let loop ((i 0) (total 0))
    (if (= i n)
        total
        (let ((p (open-output-string)))
          (write-string "0123456789" p)
          (let ((s (get-output-string p)))
            (if (not keep) (close-port p))
            (loop (+ i 1) (+ total (string-length s))))))))
(display (churn $2 $3))
EOF
}

# One manifest for every program below; only the source path differs per build.
manifest () {                   # manifest FILE SOURCE NAME
  cat > "$1" <<EOF
((library (emit internal) (source "$PWD/lib/emit/internal.sld"))
 (library (scheme base) (source "$PWD/lib/scheme/base.sld"))
 (program $3 (source "$2")))
EOF
}

# Build a standalone executable, so what is timed is the PROGRAM and not a compile.
# `emit run` would put its own compile in both columns and dilute the very ratio this
# suite exists to measure.
build () {                      # build NAME N KEEP -> $TMP/NAME
  gen "$TMP/$1.scm" "$2" "$3"
  manifest "$TMP/$1-libs.scm" "$TMP/$1.scm" "$1"
  EMIT_VERBOSITY=quiet build/emit build "$1" --manifest "$TMP/$1-libs.scm" \
      -o "$TMP/$1" >"$TMP/$1.build.log" 2>&1
}

# Seconds as a decimal, best of three runs.  bash's own `time` reports to the
# millisecond (TIMEFORMAT='%R'), which `date` cannot do portably on macOS.
best_of_three () {              # best_of_three EXE -> seconds
  local exe="$1" t best=""
  local TIMEFORMAT='%R'
  for _ in 1 2 3; do
    t="$( { time "$exe" >/dev/null 2>&1; } 2>&1 )"
    if [ -z "$best" ] || awk "BEGIN{exit !($t < $best)}"; then best="$t"; fi
  done
  echo "$best"
}

echo "string-port scaling (P21: an unclosed string port must not cost the next one)"

N_SMALL=20000
N_LARGE=80000
RATIO_BOUND=3      # keep vs close: healthy is 1.0
GROWTH_BOUND=8     # 4x the ports: linear is 4.0, the quadratic was 18

for spec in "keep-large $N_LARGE #t" "close-large $N_LARGE #f" "keep-small $N_SMALL #t"; do
  set -- $spec
  if ! build "$1" "$2" "$3"; then
    bad "build $1 (see log)"; sed 's/^/         /' "$TMP/$1.build.log"
    echo; echo "$pass passed, $((fail+1)) failed"; exit 1
  fi
done

# Every variant must still compute the same total it would have without the timing:
# ten characters per port.  A scaling suite that measured a broken program would be
# measuring nothing.
for v in keep-large close-large; do
  got="$("$TMP/$v" 2>/dev/null)"
  [ "$got" = "$((N_LARGE * 10))" ] \
    && ok "$v accumulated $got characters" \
    || bad "$v accumulated [$got] (expected $((N_LARGE * 10)))"
done

keep_large="$(best_of_three "$TMP/keep-large")"
close_large="$(best_of_three "$TMP/close-large")"
keep_small="$(best_of_three "$TMP/keep-small")"

# 1. Leaving the ports open costs about what closing them costs.
ratio="$(awk "BEGIN{printf \"%.2f\", $keep_large / $close_large}")"
if awk "BEGIN{exit !($keep_large <= $close_large * $RATIO_BOUND)}"; then
  ok "$N_LARGE ports: ${keep_large}s left open vs ${close_large}s closed (${ratio}x, bound ${RATIO_BOUND}x)"
else
  bad "$N_LARGE ports: ${keep_large}s left open vs ${close_large}s closed (${ratio}x, bound ${RATIO_BOUND}x)"
fi

# 2. Four times the ports costs on the order of four times, not sixteen.
growth="$(awk "BEGIN{printf \"%.2f\", $keep_large / $keep_small}")"
if awk "BEGIN{exit !($keep_large <= $keep_small * $GROWTH_BOUND)}"; then
  ok "4x the ports left open costs ${growth}x (${keep_small}s -> ${keep_large}s, bound ${GROWTH_BOUND}x)"
else
  bad "4x the ports left open costs ${growth}x (${keep_small}s -> ${keep_large}s, bound ${GROWTH_BOUND}x)"
fi

echo
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
