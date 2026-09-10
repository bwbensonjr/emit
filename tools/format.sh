#!/usr/bin/env bash
# format.sh -- format, or check, the covered set of hand-authored Scheme sources.
#
# The single place the covered-set policy lives (openspec change
# pitch-source-formatting, decisions D1 and D3): the doors `make format` and
# `make format-check` and the pre-commit gate all resolve membership and
# dialect here, so a file cannot be gated under one policy and formatted under
# another.
#
# Exit status, kept distinct so an automated caller can tell the two apart:
#   0  every input succeeded; under --check, nothing would change
#   1  under --check, at least one covered file would change
#   2  the invocation or the environment is wrong (no pitch, wrong pitch,
#      unreadable path, unknown option)

set -uo pipefail

# The pinned formatter identity (design D6).  The version string is a cheap
# reject and not an identity -- it has not moved across two layout fixes
# (scheme-pitch #19) -- so the layout probe below is what actually pins the
# build.  Move all three together, and regenerate the expectation in the same
# commit.
PITCH_PIN_VERSION="0.1.0"
PITCH_PIN_COMMIT="9f57119"
PITCH_PIN_ORIGIN="bwbensonjr/scheme-pitch"

CONFIG="pitch.scm"
PROBE="tools/pitch-probe.scm"
PROBE_EXPECTED="tools/pitch-probe.expected"

STATUS_WOULD_CHANGE=1
STATUS_BAD_ENVIRONMENT=2

usage() {
  cat <<'USAGE'
usage: tools/format.sh [--check] [-q|-v] [--files PATH...]

Formats the covered set of hand-authored Scheme sources in place, or reports
what would change.

  --check          write nothing; exit 1 if any covered file would change
  --list           print the resolved covered set on stdout and exit
  --files PATH...  restrict to these paths, keeping only covered ones
                   (the commit gate's mode; must come last)
  -q, -v           quiet / verbose narration, as EMIT_VERBOSITY
  --help           show this message

exit status:
  0  nothing would change, or everything was formatted
  1  under --check, a covered file would change
  2  the invocation or the environment is wrong
USAGE
}

die() {
  local status=$1; shift
  printf 'format: %s\n' "$*" >&2
  exit "$status"
}

CHECK_ONLY=0
LIST_ONLY=0
EXPLICIT_FILES=()
HAVE_EXPLICIT=0

while [ $# -gt 0 ]; do
  case "$1" in
    --check) CHECK_ONLY=1; shift ;;
    --list) LIST_ONLY=1; shift ;;
    -q|--quiet) EMIT_VERBOSITY=quiet; shift ;;
    -v|--verbose) EMIT_VERBOSITY=verbose; shift ;;
    --help) usage; exit 0 ;;
    --files) shift; HAVE_EXPLICIT=1; while [ $# -gt 0 ]; do EXPLICIT_FILES+=("$1"); shift; done ;;
    # A flag that is silently ignored reports success for work not done.
    *) usage >&2; die "$STATUS_BAD_ENVIRONMENT" "unknown option: $1" ;;
  esac
done
[ -n "${EMIT_VERBOSITY:-}" ] && export EMIT_VERBOSITY

ROOT=$(git rev-parse --show-toplevel 2>/dev/null) ||
  die "$STATUS_BAD_ENVIRONMENT" "not inside a git working tree"
cd "$ROOT" || die "$STATUS_BAD_ENVIRONMENT" "cannot enter $ROOT"
# shellcheck source=tools/log.sh
. tools/log.sh

sha256_of() {
  if command -v shasum >/dev/null 2>&1; then shasum -a 256 "$@"; else sha256sum "$@"; fi
}

# D1: the covered set is stated as locations plus exclusions.  A file is
# covered when it sits in a covered location and does not announce itself as
# generated, so adding a pass cannot require editing a list of names.
is_covered_location() {
  local f=$1
  case "$f" in emit-libs.scm) return 0 ;; esac
  [[ $f =~ ^src/[^/]+\.(scm|ss)$ ]] && return 0
  [[ $f =~ ^src/passes/[^/]+\.ss$ ]] && return 0
  [[ $f =~ ^lib/.+\.sld$ ]] && return 0
  [[ $f =~ ^tools/[^/]+\.ss$ ]] && return 0
  return 1
}

# The same signal test/scheme-base-gen-check.sh scans for: a generated file
# announces itself in its first two lines.  Its bytes belong to its generator.
is_generated() {
  head -2 "$1" 2>/dev/null | grep -q 'GENERATED'
}

# D3: the dialect follows the declared group a file belongs to, never its
# extension -- .scm and .ss are used by both camps and a suffix is not
# evidence.  The r7rs group is the hand-authored lib/**/*.sld libraries;
# everything else is host-dialect code the bootstrap compiles with Chez.
group_of() {
  case "$1" in
    lib/*) printf 'r7rs\n' ;;
    *)     printf 'common\n' ;;
  esac
}

resolve_covered() {
  local candidates f
  if [ "$HAVE_EXPLICIT" -eq 1 ]; then
    candidates=$(printf '%s\n' ${EXPLICIT_FILES[@]+"${EXPLICIT_FILES[@]}"})
  else
    candidates=$(git ls-files -- src lib tools emit-libs.scm)
  fi
  while IFS= read -r f; do
    [ -n "$f" ] || continue
    is_covered_location "$f" || continue
    [ -f "$f" ] || continue
    is_generated "$f" && continue
    printf '%s\n' "$f"
  done <<<"$candidates"
}

# Layer 1 of the pin: a cheap reject.  Layer 2: the layout probe, which is the
# part that actually distinguishes builds.
check_formatter_identity() {
  command -v pitch >/dev/null 2>&1 ||
    die "$STATUS_BAD_ENVIRONMENT" "pitch not found on PATH (pinned: $PITCH_PIN_ORIGIN $PITCH_PIN_COMMIT, version $PITCH_PIN_VERSION)"

  local found
  found=$(pitch --version 2>/dev/null | awk 'NR==1 {print $NF}')
  if [ "$found" != "$PITCH_PIN_VERSION" ]; then
    die "$STATUS_BAD_ENVIRONMENT" \
      "formatter identity mismatch at layer 1 (version): pinned $PITCH_PIN_VERSION, found ${found:-none}"
  fi
  vsay "  identity layer 1 (version) ok  [$found]"

  [ -f "$CONFIG" ] ||
    die "$STATUS_BAD_ENVIRONMENT" "configuration not found: $CONFIG (expected at the repo root)"
  [ -f "$PROBE" ] && [ -f "$PROBE_EXPECTED" ] ||
    die "$STATUS_BAD_ENVIRONMENT" "layout probe missing: $PROBE, $PROBE_EXPECTED"
  local produced
  produced=$(pitch --config "$CONFIG" --dialect common --stdout "$PROBE" 2>&1) ||
    die "$STATUS_BAD_ENVIRONMENT" "layout probe could not be formatted: $produced"
  if [ "$produced" != "$(cat "$PROBE_EXPECTED")" ]; then
    die "$STATUS_BAD_ENVIRONMENT" \
      "formatter identity mismatch at layer 2 (layout probe): the installed pitch reports $found but lays out differently from the pinned build ($PITCH_PIN_ORIGIN $PITCH_PIN_COMMIT). Compare: pitch --config $CONFIG --dialect common --stdout $PROBE | diff $PROBE_EXPECTED -"
  fi
  vsay "  identity layer 2 (layout probe) ok  [$PITCH_PIN_ORIGIN $PITCH_PIN_COMMIT]"
}

# Runs one dialect group and leaves pitch's own per-file report in REPORT, so
# a --check run that finds work names each file once and costs one pass.
REPORT=""
run_group() {
  local dialect=$1; shift
  [ $# -gt 0 ] || return 0
  vsay "  pitch --dialect $dialect  [$# files]"
  local out rc=0
  if [ "$CHECK_ONLY" -eq 1 ]; then
    out=$(pitch --config "$CONFIG" --dialect "$dialect" --check "$@" 2>&1) || rc=$?
  else
    out=$(pitch --config "$CONFIG" --dialect "$dialect" "$@" 2>&1) || rc=$?
  fi
  [ -n "$out" ] && REPORT+="$out"$'\n'
  return $rc
}

main() {
  local verb; [ "$CHECK_ONLY" -eq 1 ] && verb="format-check" || verb="format"
  local started=$SECONDS

  # --list answers "what is covered?", which is a question about the working
  # tree and not about the formatter, so it needs no pitch.  The list is data:
  # stdout, per docs/OUTPUT.md.
  if [ "$LIST_ONLY" -eq 1 ]; then
    local n=0 g
    while IFS= read -r g; do [ -n "$g" ] && { printf '%s\n' "$g"; n=$((n + 1)); }; done < <(resolve_covered)
    say "format list covered set  [$n files]"
    exit 0
  fi

  check_formatter_identity

  local files=() f
  while IFS= read -r f; do [ -n "$f" ] && files+=("$f"); done < <(resolve_covered)

  if [ "${#files[@]}" -eq 0 ]; then
    say "$verb covered set  [0 files considered; nothing to do]"
    exit 0
  fi

  local common=() r7rs=()
  for f in "${files[@]}"; do
    case "$(group_of "$f")" in
      r7rs) r7rs+=("$f") ;;
      *)    common+=("$f") ;;
    esac
  done

  local scope; [ "$HAVE_EXPLICIT" -eq 1 ] && scope="named files" || scope="covered set"
  if [ "$CHECK_ONLY" -eq 1 ]; then
    say "$verb $scope  [${#files[@]} files: ${#common[@]} common, ${#r7rs[@]} r7rs]"
  else
    say "$verb $scope -> in place  [${#files[@]} files: ${#common[@]} common, ${#r7rs[@]} r7rs]"
  fi
  for f in "${files[@]}"; do vsay "  consider $f  [$(group_of "$f")]"; done

  local rc=0 changed=0
  if [ "$CHECK_ONLY" -eq 1 ]; then
    run_group common ${common[@]+"${common[@]}"} || rc=$?
    local rc2=0
    run_group r7rs ${r7rs[@]+"${r7rs[@]}"} || rc2=$?
    [ "$rc" -eq 0 ] && rc=$rc2
    # pitch names each file it would reformat; count them the same way it
    # decides, by asking it rather than by re-deriving the answer here.
    if [ "$rc" -eq "$STATUS_WOULD_CHANGE" ]; then
      printf '%s' "$REPORT" >&2
      changed=$(printf '%s' "$REPORT" | grep -c 'would reformat')
      say "$verb ${#files[@]} considered, $changed would change  [$((SECONDS - started))s]"
      exit "$STATUS_WOULD_CHANGE"
    elif [ "$rc" -ne 0 ]; then
      printf '%s' "$REPORT" >&2
      die "$STATUS_BAD_ENVIRONMENT" "pitch failed under --check (status $rc)"
    fi
    say "$verb ${#files[@]} considered, 0 would change  [$((SECONDS - started))s]"
    exit 0
  fi

  # In-place: pitch writes a file only when its text actually differs, so
  # count what moved by hashing rather than by trusting a timestamp.
  local before after
  before=$(mktemp) && after=$(mktemp) || die "$STATUS_BAD_ENVIRONMENT" "cannot create a temporary file"
  trap 'rm -f "$before" "$after"' EXIT
  sha256_of "${files[@]}" >"$before" 2>/dev/null

  run_group common ${common[@]+"${common[@]}"} || rc=$?
  local rc2=0
  run_group r7rs ${r7rs[@]+"${r7rs[@]}"} || rc2=$?
  [ "$rc" -eq 0 ] && rc=$rc2
  if [ "$rc" -ne 0 ]; then
    printf '%s' "$REPORT" >&2
    die "$STATUS_BAD_ENVIRONMENT" "pitch refused an input (status $rc)"
  fi
  [ -n "$REPORT" ] && printf '%s' "$REPORT" >&2

  sha256_of "${files[@]}" >"$after" 2>/dev/null
  changed=$(comm -13 <(sort "$before") <(sort "$after") | wc -l | tr -d ' ')
  say "$verb ${#files[@]} considered, $changed changed  [$((SECONDS - started))s]"
  exit 0
}

main
