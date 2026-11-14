#!/usr/bin/env bash
# channel-merge-tests.sh -- generated promotion pull requests report their head and merge
# automatically only after verification (change: automate-release-handoff, design D4).
# Needs bash, git, jq; no registry, network, or token, so it also runs in the lightweight policy
# job.  Local bare repositories stand in for the tap and Emit; test/gh-fixture-mock.sh stands in
# for gh.
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
repo=$PWD
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
checks=0
pass() { checks=$((checks + 1)); }
fail() { printf 'channel-merge test: %s\n' "$1" >&2; exit 1; }
mkdir -p "$work/bin" "$work/fx"
cp test/gh-fixture-mock.sh "$work/bin/gh"
export PATH="$work/bin:$PATH" GH_FIXTURES="$work/fx"
unset GITHUB_STEP_SUMMARY GITHUB_REPOSITORY
key() { printf '%s' "$*" | LC_ALL=C tr -c 'A-Za-z0-9._-' '_'; }
git_id=(-c user.name=t -c user.email=t@invalid)

# A bare repository with one seed commit on main.
bare() {
  git init -q --bare -b main "$work/$1.git"
  git clone -q "$work/$1.git" "$work/$1-seed" 2>/dev/null
  (cd "$work/$1-seed" && printf 'seed\n' > README.md && git add README.md \
    && git "${git_id[@]}" commit -qm seed && git push -q origin HEAD:main)
}
# Merge policy fixtures for REPO requiring CHECK: intact unless AUTO is false or BYPASS is set,
# or no ruleset at all when CHECK is empty.
policy() {
  local repo=$1 check=$2 auto=${3:-true} bypass=${4:-[]}
  printf '{"allow_auto_merge": %s}\n' "$auto" > "$GH_FIXTURES/$(key "api repos/$repo")"
  if [ -z "$check" ]; then printf '[]\n' > "$GH_FIXTURES/$(key "api repos/$repo/rulesets")"; return; fi
  printf '[{"id": 3, "name": "main", "target": "branch", "enforcement": "active"}]\n' \
    > "$GH_FIXTURES/$(key "api repos/$repo/rulesets")"
  jq -n --arg check "$check" --argjson bypass "$bypass" \
    '{id: 3, name: "main", target: "branch", enforcement: "active", bypass_actors: $bypass,
      conditions: {ref_name: {include: ["~DEFAULT_BRANCH"], exclude: []}},
      rules: [{type: "required_status_checks", parameters: {required_status_checks: [{context: $check}]}}]}' \
    > "$GH_FIXTURES/$(key "api repos/$repo/rulesets/3")"
}
# Make the open pull request on BRANCH report HEAD (and, with AUTO=1, a pending auto-merge), as
# GitHub would after the push.
pr_reports() {
  local repo=$1 branch=$2 head=$3 auto=${4:-0} file
  file="$GH_FIXTURES/$(key "pr-list $repo $branch open")"
  jq --arg head "$head" --argjson auto "$auto" \
    '.[0].headRefOid = $head | .[0].autoMergeRequest = (if $auto == 1 then {mergeMethod: "MERGE"} else null end)' \
    "$file" > "$file.new" && mv "$file.new" "$file"
}
merges() { grep -c '^pr merge' "$GH_FIXTURES/calls" || true; }
# Push a commit to BRANCH of REMOTE that writes CONTENT to FILE; print the new head.
push_change() {
  local remote=$1 branch=$2 file=$3 content=$4 checkout="$work/push-$RANDOM$RANDOM"
  git clone -q "$remote" "$checkout" 2>/dev/null
  (cd "$checkout" && git fetch -q origin "$branch" && git checkout -q -B "$branch" FETCH_HEAD \
    && mkdir -p "$(dirname "$file")" && printf '%s\n' "$content" > "$file" && git add "$file" \
    && git "${git_id[@]}" commit -qm change && git push -q origin "$branch" && git rev-parse HEAD)
}
# Merge BRANCH into main as a maintainer would, and close its pull request.
merge_branch() {
  local remote=$1 repo=$2 branch=$3 checkout="$work/merge-$RANDOM$RANDOM"
  git clone -q "$remote" "$checkout" 2>/dev/null
  (cd "$checkout" && git fetch -q origin "$branch" \
    && git "${git_id[@]}" merge -q --no-ff -m "merge $branch" FETCH_HEAD && git push -q origin HEAD:main)
  printf '[]\n' > "$GH_FIXTURES/$(key "pr-list $repo $branch open")"
}
value() { sed -n "s/^$1=//p" "$2"; }

# --- Homebrew tap -------------------------------------------------------------------------
bare tap
export CHANNEL_TAP_REMOTE="$work/tap.git" CHANNEL_TAP_REPO=fixture/homebrew-emit
sha=0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef
url=https://example.invalid/emit-1.0.0.tar.gz
jq -n --arg url "$url" --arg sha "$sha" \
  '{version: "1.0.0", tag: "v1.0.0", commit: ("a" * 40), archive_url: $url, sha256: $sha}' > "$work/identity.json"
printf 'class Emit < Formula\n  url "%s"\n  sha256 "%s"\nend\n' "$url" "$sha" > "$work/emit.rb"
policy fixture/homebrew-emit "Required tap checks"

tools/channel-promote.sh tap v1.0.0 "$work/emit.rb" > "$work/tap.out" 2> "$work/tap.err"
head=$(value head "$work/tap.out")
[ "$head" = "$(git --git-dir="$work/tap.git" rev-parse emit-v1.0.0)" ] || fail "tap head for a new branch"
[ "$(wc -l < "$work/tap.out" | tr -d ' ')" = 1 ] || fail "tap stdout carries more than the head line"
pass
tools/channel-promote.sh tap v1.0.0 "$work/emit.rb" > "$work/tap2.out" 2>/dev/null
[ "$(value head "$work/tap2.out")" = "$head" ] || fail "tap head for a reused branch and pull request"
pass
pr_reports fixture/homebrew-emit emit-v1.0.0 "$head"

tools/channel-promote.sh tap-merge v1.0.0 "$work/emit.rb" "$work/identity.json" "$head" > "$work/m.out" 2> "$work/m.err"
[ "$(value merge "$work/m.out")" = requested ] && [ "$(merges)" = 1 ] || fail "a verified tap promotion did not request merge"
grep -q "^pr merge 1 --repo fixture/homebrew-emit --auto --merge --match-head-commit $head\$" "$GH_FIXTURES/calls" \
  || fail "the merge request was not pinned to the verified head"
grep -q 'auto-merge requested' "$work/m.err" || fail "requested narration"
pass
pr_reports fixture/homebrew-emit emit-v1.0.0 "$head" 1
tools/channel-promote.sh tap-merge v1.0.0 "$work/emit.rb" "$work/identity.json" "$head" > "$work/m.out" 2> "$work/m.err"
[ "$(value merge "$work/m.out")" = pending ] && [ "$(merges)" = 1 ] || fail "a retry requested merge again"
grep -q 'auto-merge pending' "$work/m.err" || fail "pending narration"
pass
pr_reports fixture/homebrew-emit emit-v1.0.0 "$head"

# Every doubt leaves the pull request for a maintainer, succeeds, and requests nothing.
expect_manual() {
  local label=$1 pattern=$2; shift 2
  local before
  before=$(merges)
  "$@" > "$work/x.out" 2> "$work/x.err" || fail "$label: the step failed instead of leaving a manual merge"
  [ "$(value merge "$work/x.out")" = manual ] || fail "$label: not a manual merge: $(cat "$work/x.out")"
  grep -q "manual merge: .*$pattern" "$work/x.err" || fail "$label: reason: $(cat "$work/x.err")"
  [ "$(merges)" = "$before" ] || fail "$label: a merge was requested"
  pass
}
tap_merge() { tools/channel-promote.sh tap-merge v1.0.0 "$work/emit.rb" "$work/identity.json" "$1"; }

policy fixture/homebrew-emit "Required tap checks" false
expect_manual "auto-merge disabled" "policy: allow_auto_merge is disabled" tap_merge "$head"
policy fixture/homebrew-emit ""
expect_manual "no ruleset" "policy: no active ruleset" tap_merge "$head"
policy fixture/homebrew-emit "Required tap checks" true '[{"actor_id": 1, "actor_type": "OrganizationAdmin", "bypass_mode": "always"}]'
expect_manual "bypass actor" "policy: ruleset main lists 1 bypass actor" tap_merge "$head"
policy fixture/homebrew-emit "Something else"
expect_manual "different required check" "policy: no active default-branch ruleset requires" tap_merge "$head"
policy fixture/homebrew-emit "Required tap checks"

pr_reports fixture/homebrew-emit emit-v1.0.0 "$(printf 'b%.0s' $(seq 40))"
expect_manual "moved head" "head is bbbb" tap_merge "$head"
pr_reports fixture/homebrew-emit emit-v1.0.0 "$head"

jq '.sha256 = ("f" * 64)' "$work/identity.json" > "$work/other-identity.json"
expect_manual "wrong digest" "does not name the release URL and SHA-256" \
  tools/channel-promote.sh tap-merge v1.0.0 "$work/emit.rb" "$work/other-identity.json" "$head"

extra=$(push_change "$work/tap.git" emit-v1.0.0 Formula/other.rb "# unrelated")
pr_reports fixture/homebrew-emit emit-v1.0.0 "$extra"
expect_manual "extra file" "changes Formula/emit.rb Formula/other.rb, not only Formula/emit.rb" tap_merge "$extra"
git --git-dir="$work/tap.git" update-ref refs/heads/emit-v1.0.0 "$head"
edited=$(push_change "$work/tap.git" emit-v1.0.0 Formula/emit.rb "class Emit < Formula; end")
pr_reports fixture/homebrew-emit emit-v1.0.0 "$edited"
expect_manual "edited formula" "Formula/emit.rb differs from the tested file" tap_merge "$edited"

# Restore a clean generated branch (the leftover branch restarts from main), merge it, and retry.
git --git-dir="$work/tap.git" update-ref refs/heads/emit-v1.0.0 "$head"
pr_reports fixture/homebrew-emit emit-v1.0.0 "$head"
merge_branch "$work/tap.git" fixture/homebrew-emit emit-v1.0.0
tools/channel-promote.sh tap v1.0.0 "$work/emit.rb" > "$work/tap3.out" 2>/dev/null
[ -z "$(value head "$work/tap3.out")" ] && grep -q '^head=$' "$work/tap3.out" || fail "tap head after merge is not empty"
pass
before=$(merges)
tools/channel-promote.sh tap-merge v1.0.0 "$work/emit.rb" "$work/identity.json" "" > "$work/m.out" 2> "$work/m.err"
[ "$(value merge "$work/m.out")" = merged ] && [ "$(merges)" = "$before" ] || fail "merged tap promotion retry"
grep -q 'already merged' "$work/m.err" || fail "merged narration"
pass
tools/channel-promote.sh tap-merge v1.0.0 "$work/emit.rb" "$work/identity.json" "$head" > "$work/m.out" 2>/dev/null
[ "$(value merge "$work/m.out")" = merged ] || fail "a merged promotion with a stale head was not recognized"
pass

# --- Nix pin -----------------------------------------------------------------------------
bare emit
export CHANNEL_REPO_REMOTE="$work/emit.git" CHANNEL_REPO=fixture/emit
policy fixture/emit "Required validation"
tools/channel-promote.sh flake v1.0.0 "$work/identity.json" > "$work/flake.out" 2>/dev/null
pin=$(value head "$work/flake.out")
[ "$pin" = "$(git --git-dir="$work/emit.git" rev-parse channels/release-v1.0.0)" ] || fail "flake head for a new branch"
pass
tools/channel-promote.sh flake v1.0.0 "$work/identity.json" > "$work/flake2.out" 2>/dev/null
[ "$(value head "$work/flake2.out")" = "$pin" ] || fail "flake head for a reused branch"
pass
pr_reports fixture/emit channels/release-v1.0.0 "$pin"
flake_merge() { tools/channel-promote.sh flake-merge v1.0.0 "$work/identity.json" "$1"; }
before=$(merges)
flake_merge "$pin" > "$work/f.out" 2>/dev/null
[ "$(value merge "$work/f.out")" = requested ] && [ "$(merges)" = $((before + 1)) ] || fail "a verified pin did not request merge"
grep -Eq "^pr merge [0-9]+ --repo fixture/emit --auto --merge --match-head-commit $pin\$" "$GH_FIXTURES/calls" || fail "pin merge request"
pass
pr_reports fixture/emit channels/release-v1.0.0 "$pin" 1
flake_merge "$pin" > "$work/f.out" 2>/dev/null
[ "$(value merge "$work/f.out")" = pending ] && [ "$(merges)" = $((before + 1)) ] || fail "a pin retry requested merge again"
pass
pr_reports fixture/emit channels/release-v1.0.0 "$pin"
policy fixture/emit "Required validation" true '[{"actor_id": 5, "actor_type": "RepositoryRole", "bypass_mode": "pull_request"}]'
expect_manual "pin with bypass actor" "bypass actor" flake_merge "$pin"
policy fixture/emit "Required validation"
edited_pin=$(push_change "$work/emit.git" channels/release-v1.0.0 packaging/release.json '{"tag": "v1.0.0"}')
pr_reports fixture/emit channels/release-v1.0.0 "$edited_pin"
expect_manual "edited pin" "packaging/release.json differs from the tested file" flake_merge "$edited_pin"
jq '.tag = "v9.9.9"' "$work/identity.json" > "$work/wrong.json"
if tools/channel-promote.sh flake-merge v1.0.0 "$work/wrong.json" "$pin" 2>/dev/null; then fail "a mismatched identity was accepted"; fi
pass
git --git-dir="$work/emit.git" update-ref refs/heads/channels/release-v1.0.0 "$pin"
merge_branch "$work/emit.git" fixture/emit channels/release-v1.0.0
flake_merge "" > "$work/f.out" 2>/dev/null
[ "$(value merge "$work/f.out")" = merged ] || fail "merged pin retry"
pass
# An older release than the pin on main is superseded: nothing to merge.
jq '.version = "0.9.0" | .tag = "v0.9.0" | .archive_url = "https://example.invalid/emit-0.9.0.tar.gz"' \
  "$work/identity.json" > "$work/older.json"
tools/channel-promote.sh flake v0.9.0 "$work/older.json" > "$work/older.out" 2>/dev/null
grep -q '^head=$' "$work/older.out" || fail "superseded pin head is not empty"
tools/channel-promote.sh flake-merge v0.9.0 "$work/older.json" "" > "$work/f.out" 2>/dev/null
[ "$(value merge "$work/f.out")" = none ] || fail "superseded pin merge"
pass
# --- Credential preflight -----------------------------------------------------------------
if GH_TOKEN="" tools/channel-promote.sh preflight fixture/emit NIX_PIN_TOKEN 2> "$work/p.err"; then
  fail "an unset credential passed preflight"
fi
grep -q 'secret NIX_PIN_TOKEN is not configured' "$work/p.err" || fail "unset credential message"
pass
GH_TOKEN=x CHANNEL_PREFLIGHT_REMOTE="$work/emit.git" tools/channel-promote.sh preflight fixture/emit NIX_PIN_TOKEN 2> "$work/p.err" \
  || fail "a permitted credential failed preflight: $(cat "$work/p.err")"
[ -z "$(git --git-dir="$work/emit.git" for-each-ref refs/heads/channel-preflight)" ] || fail "preflight pushed a branch"
pass
if GH_TOKEN=x CHANNEL_PREFLIGHT_REMOTE="$work/absent.git" tools/channel-promote.sh preflight fixture/emit NIX_PIN_TOKEN 2> "$work/p.err"; then
  fail "a credential that cannot push passed preflight"
fi
grep -q 'NIX_PIN_TOKEN cannot push to fixture/emit' "$work/p.err" || fail "push preflight message"
pass
printf '1\n' > "$GH_FIXTURES/$(key "pr-list fixture/emit  all").exit"
if GH_TOKEN=x CHANNEL_PREFLIGHT_REMOTE="$work/emit.git" tools/channel-promote.sh preflight fixture/emit NIX_PIN_TOKEN 2> "$work/p.err"; then
  fail "a credential that cannot read pull requests passed preflight"
fi
grep -q 'NIX_PIN_TOKEN cannot read pull requests on fixture/emit' "$work/p.err" || fail "pull-request preflight message"
pass
say "test channel merge -> verified auto-merge, manual fallback, idempotent  [$checks checks, ${SECONDS}s]"
