#!/usr/bin/env bash
# repo-policy.sh -- verify the merge policy that automatic promotion merging depends on
# (change: automate-release-handoff, design D6).  Read-only: it never changes a setting.
#
#   check [--repo OWNER/NAME [--check NAME]]
#       For each repository (default: Emit and its Homebrew tap), check that
#         auto-merge   the repository allows automatic merge;
#         required-check  an active ruleset on the default branch requires the aggregate check
#                      (Emit: "Required validation", tap: "Required tap checks", or --check);
#         bypass       no ruleset on the default branch lists a bypass actor, and the current
#                      credential cannot bypass one.
#       Prints one line per setting on stdout:
#         policy=<name> repo=<owner/name> status=<ok|fail> reason=<text>
#       Narration goes to stderr.  Exits 1 when any setting fails.  A setting this credential
#       cannot read fails: an unknown state is never treated as compliant.
#
# Environment: GH_TOKEN (gh credential), REPO_POLICY_EMIT / REPO_POLICY_TAP (repository names).
set -euo pipefail
. "$(dirname "$0")/log.sh"
usage() {
  printf '%s\n' 'Usage: tools/repo-policy.sh check [--repo OWNER/NAME [--check NAME]]' \
    '' \
    'Verify auto-merge, the required aggregate check, and the absence of ruleset bypass on' \
    'the default branch.  Prints policy=<name> repo=<repo> status=<ok|fail> reason=<text>.'
}
emit_repo=${REPO_POLICY_EMIT:-bwbensonjr/emit}
tap_repo=${REPO_POLICY_TAP:-bwbensonjr/homebrew-emit}
failures=0
report() {
  local name=$1 repo=$2 status=$3 reason=$4
  printf 'policy=%s repo=%s status=%s reason=%s\n' "$name" "$repo" "$status" "$reason"
  if [ "$status" = ok ]; then vsay "policy $name $repo -> ok  [$reason]"
  else say "policy $name $repo -> FAIL  [$reason]"; failures=$((failures + 1)); fi
}
expected_check() {
  case "$1" in
    "$emit_repo") printf 'Required validation\n' ;;
    "$tap_repo") printf 'Required tap checks\n' ;;
    *) printf '\n' ;;
  esac
}

check_repo() {
  local repo=$1 check=$2 settings rulesets ids id detail applicable=0 required=0 bypass_known=0
  local bypass_problem="" auto
  if ! settings=$(gh api "repos/$repo" 2>/dev/null); then
    report auto-merge "$repo" fail "cannot read repository settings"
    report required-check "$repo" fail "cannot read repository settings"
    report bypass "$repo" fail "cannot read repository settings"
    return
  fi
  # Not `//`: jq treats false as absent there, and false is the answer that matters.
  auto=$(jq -r 'if .allow_auto_merge == null then "unknown" else .allow_auto_merge end' <<< "$settings")
  case "$auto" in
    true) report auto-merge "$repo" ok "allow_auto_merge is enabled" ;;
    false) report auto-merge "$repo" fail "allow_auto_merge is disabled" ;;
    *) report auto-merge "$repo" fail "allow_auto_merge is not readable with this credential" ;;
  esac
  if ! rulesets=$(gh api "repos/$repo/rulesets" 2>/dev/null); then
    report required-check "$repo" fail "cannot list rulesets"
    report bypass "$repo" fail "cannot list rulesets"
    return
  fi
  ids=$(jq -r '.[] | select(.target == "branch" and .enforcement == "active") | .id' <<< "$rulesets")
  for id in $ids; do
    detail=$(gh api "repos/$repo/rulesets/$id" 2>/dev/null) || { bypass_problem="cannot read ruleset $id"; continue; }
    # A ruleset governs the default branch when it includes it and does not exclude it.
    jq -e '(.conditions.ref_name.include // []) as $in | (.conditions.ref_name.exclude // []) as $out
           | ([$in[] | select(. == "~DEFAULT_BRANCH" or . == "~ALL" or . == "refs/heads/main")] | length > 0)
             and ([$out[] | select(. == "~DEFAULT_BRANCH" or . == "refs/heads/main")] | length == 0)' \
      <<< "$detail" > /dev/null || continue
    applicable=$((applicable + 1))
    if jq -e --arg check "$check" '[.rules[]? | select(.type == "required_status_checks")
          | .parameters.required_status_checks[]? | select(.context == $check)] | length > 0' \
        <<< "$detail" > /dev/null; then
      required=1
    fi
    if jq -e 'has("bypass_actors")' <<< "$detail" > /dev/null; then
      bypass_known=1
      if [ "$(jq '.bypass_actors | length' <<< "$detail")" != 0 ]; then
        bypass_problem="ruleset $(jq -r .name <<< "$detail") lists $(jq '.bypass_actors | length' <<< "$detail") bypass actor(s)"
      fi
    fi
    if jq -e 'has("current_user_can_bypass")' <<< "$detail" > /dev/null; then
      bypass_known=1
      if [ "$(jq -r .current_user_can_bypass <<< "$detail")" != never ]; then
        bypass_problem="this credential can bypass ruleset $(jq -r .name <<< "$detail") ($(jq -r .current_user_can_bypass <<< "$detail"))"
      fi
    fi
  done
  if [ "$applicable" = 0 ]; then
    report required-check "$repo" fail "no active ruleset governs the default branch"
    report bypass "$repo" fail "no active ruleset governs the default branch"
    return
  fi
  if [ "$required" = 1 ]; then report required-check "$repo" ok "requires \"$check\""
  else report required-check "$repo" fail "no active default-branch ruleset requires \"$check\""; fi
  if [ -n "$bypass_problem" ]; then report bypass "$repo" fail "$bypass_problem"
  elif [ "$bypass_known" = 0 ]; then report bypass "$repo" fail "bypass actors are not readable with this credential"
  else report bypass "$repo" ok "no bypass actor in $applicable ruleset(s)"; fi
}

case "${1:-}" in
  --help|-h) usage; exit 0 ;;
  check) shift ;;
  *) usage >&2; exit 2 ;;
esac
repos=() check=""
while [ "$#" -gt 0 ]; do
  case "$1" in
    --repo) [ "$#" -ge 2 ] || { usage >&2; exit 2; }; repos+=("$2"); shift 2 ;;
    --check) [ "$#" -ge 2 ] || { usage >&2; exit 2; }; check=$2; shift 2 ;;
    *) printf 'repo-policy: check: unknown option %s\n' "$1" >&2; usage >&2; exit 2 ;;
  esac
done
[ "${#repos[@]}" -gt 0 ] || repos=("$emit_repo" "$tap_repo")
[ -z "$check" ] || [ "${#repos[@]}" = 1 ] || { printf 'repo-policy: --check needs exactly one --repo\n' >&2; exit 2; }
for repo in "${repos[@]}"; do
  name=${check:-$(expected_check "$repo")}
  [ -n "$name" ] || { printf 'repo-policy: no expected check for %s; pass --check\n' "$repo" >&2; exit 2; }
  check_repo "$repo" "$name"
done
if [ "$failures" = 0 ]; then
  say "policy check ${repos[*]} -> ok  [auto-merge, required check, no bypass]"
else
  say "policy check ${repos[*]} -> $failures setting(s) failed"
  exit 1
fi
