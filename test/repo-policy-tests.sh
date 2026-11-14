#!/usr/bin/env bash
# repo-policy-tests.sh -- tools/repo-policy.sh reports each merge-policy setting and fails closed
# (change: automate-release-handoff, design D6).  Needs bash, jq; no network or token.
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
checks=0
pass() { checks=$((checks + 1)); }
fail() { printf 'repo-policy test: %s\n' "$1" >&2; exit 1; }
mkdir -p "$work/bin"
cp test/gh-fixture-mock.sh "$work/bin/gh"
export PATH="$work/bin:$PATH" REPO_POLICY_EMIT=fixture/emit REPO_POLICY_TAP=fixture/tap

# A fresh fixture directory holding one repository's settings and a single ruleset.
#   setup REPO AUTO_MERGE CHECK BYPASS_JSON [EXTRA_RULESET_FIELDS]
setup() {
  local repo=$1 auto=$2 check=$3 bypass=$4 extra=${5:-}
  export GH_FIXTURES="$work/fx-$RANDOM$RANDOM"
  mkdir -p "$GH_FIXTURES"
  local key
  key() { printf '%s' "$*" | LC_ALL=C tr -c 'A-Za-z0-9._-' '_'; }
  printf '{"full_name": "%s", "allow_auto_merge": %s}\n' "$repo" "$auto" > "$GH_FIXTURES/$(key "api repos/$repo")"
  printf '[{"id": 11, "name": "main", "target": "branch", "enforcement": "active"}]\n' \
    > "$GH_FIXTURES/$(key "api repos/$repo/rulesets")"
  jq -n --arg check "$check" --argjson bypass "$bypass" --argjson extra "{${extra}}" \
    '{id: 11, name: "main", target: "branch", enforcement: "active",
      conditions: {ref_name: {include: ["~DEFAULT_BRANCH"], exclude: []}},
      rules: [{type: "required_status_checks",
               parameters: {required_status_checks: [{context: $check}]}}],
      bypass_actors: $bypass} + $extra' > "$GH_FIXTURES/$(key "api repos/$repo/rulesets/11")"
}
run_check() { tools/repo-policy.sh check "$@" > "$work/out" 2> "$work/err"; }
line() { grep "^policy=$1 " "$work/out"; }

setup fixture/emit true "Required validation" '[]' '"current_user_can_bypass": "never"'
run_check --repo fixture/emit || fail "intact policy failed: $(cat "$work/out")"
[ "$(grep -c 'status=ok' "$work/out")" = 3 ] || fail "intact policy did not report three settings"
pass

setup fixture/emit false "Required validation" '[]'
if run_check --repo fixture/emit; then fail "disabled auto-merge passed"; fi
line auto-merge | grep -q 'status=fail reason=allow_auto_merge is disabled' || fail "auto-merge message"
line required-check | grep -q 'status=ok' || fail "an unrelated failure hid the required check"
pass

setup fixture/emit null "Required validation" '[]'
if run_check --repo fixture/emit; then fail "an unreadable auto-merge setting passed"; fi
line auto-merge | grep -q 'not readable' || fail "unreadable auto-merge message"
pass

setup fixture/emit true "Some other check" '[]'
if run_check --repo fixture/emit; then fail "a ruleset requiring a different check passed"; fi
line required-check | grep -q 'status=fail' && line required-check | grep -q 'Required validation' \
  || fail "different check message"
pass

setup fixture/emit true "Required validation" '[{"actor_id": 5, "actor_type": "RepositoryRole", "bypass_mode": "always"}]'
if run_check --repo fixture/emit; then fail "a bypass actor passed"; fi
line bypass | grep -q 'status=fail reason=ruleset main lists 1 bypass actor' || fail "bypass actor message"
pass

# A credential that cannot see bypass_actors is judged by current_user_can_bypass.
setup fixture/emit true "Required validation" 'null' '"current_user_can_bypass": "always"'
jq 'del(.bypass_actors)' "$GH_FIXTURES/api_repos_fixture_emit_rulesets_11" > "$work/r" \
  && mv "$work/r" "$GH_FIXTURES/api_repos_fixture_emit_rulesets_11"
if run_check --repo fixture/emit; then fail "a credential able to bypass passed"; fi
line bypass | grep -q 'can bypass' || fail "current-user bypass message"
pass
setup fixture/emit true "Required validation" 'null'
jq 'del(.bypass_actors)' "$GH_FIXTURES/api_repos_fixture_emit_rulesets_11" > "$work/r" \
  && mv "$work/r" "$GH_FIXTURES/api_repos_fixture_emit_rulesets_11"
if run_check --repo fixture/emit; then fail "unreadable bypass state passed"; fi
line bypass | grep -q 'not readable' || fail "unreadable bypass message"
pass

setup fixture/emit true "Required validation" '[]'
printf '[]\n' > "$GH_FIXTURES/api_repos_fixture_emit_rulesets"
if run_check --repo fixture/emit; then fail "a missing ruleset passed"; fi
line required-check | grep -q 'no active ruleset' || fail "missing ruleset message"
pass

# An evaluate-mode (inactive) ruleset does not count.
setup fixture/emit true "Required validation" '[]'
printf '[{"id": 11, "name": "main", "target": "branch", "enforcement": "evaluate"}]\n' \
  > "$GH_FIXTURES/api_repos_fixture_emit_rulesets"
if run_check --repo fixture/emit; then fail "an evaluate-mode ruleset passed"; fi
pass

# The tap's default expected check, and both repositories by default.
setup fixture/tap true "Required tap checks" '[]'
run_check --repo fixture/tap || fail "tap default check name"
if run_check; then fail "the absent Emit fixture passed"; fi
grep -q 'repo=fixture/emit status=fail reason=cannot read repository settings' "$work/out" \
  && grep -q 'policy=required-check repo=fixture/tap status=ok' "$work/out" || fail "default repositories"
pass

if tools/repo-policy.sh check --bogus 2> "$work/err"; then fail "an unknown option was accepted"; fi
grep -q 'unknown option --bogus' "$work/err" || fail "unknown option message"
tools/repo-policy.sh --help | grep -q '^Usage:' || fail "help on stdout"
pass
say "test repo policy -> fail-closed policy report  [$checks checks, ${SECONDS}s]"
