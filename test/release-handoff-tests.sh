#!/usr/bin/env bash
# release-handoff-tests.sh -- tools/release-handoff.sh in temporary repositories with a mocked gh
# (change: automate-release-handoff).  Needs bash, git, jq, python3; no network, token, Chez, or
# LLVM.  The compiler-input inventory, source fingerprint, and openspec CLI are stubbed so the
# fixture can choose their answers.
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
repo=$PWD
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
checks=0
pass() { checks=$((checks + 1)); }
fail() { printf 'release-handoff test: %s\n' "$1" >&2; exit 1; }
key() { printf '%s' "$*" | LC_ALL=C tr -c 'A-Za-z0-9._-' '_'; }
git_id=(-c user.name="Handoff Tests" -c user.email=handoff-tests@example.invalid)
# Annotated tags need an identity too, and a CI runner has none to guess from.
export GIT_AUTHOR_NAME="Handoff Tests" GIT_AUTHOR_EMAIL=handoff-tests@example.invalid
export GIT_COMMITTER_NAME="Handoff Tests" GIT_COMMITTER_EMAIL=handoff-tests@example.invalid
mkdir -p "$work/bin" "$work/fx"
cp test/gh-fixture-mock.sh "$work/bin/gh"
# openspec stub: `validate` exits with the status in $OPENSPEC_STUB_STATUS (default 0).
printf '#!/usr/bin/env bash\nprintf "openspec %%s\\n" "$*" >> "%s/openspec.calls"\nexit "${OPENSPEC_STUB_STATUS:-0}"\n' "$work" > "$work/bin/openspec"
chmod +x "$work/bin/openspec"
export PATH="$work/bin:$PATH" GH_FIXTURES="$work/fx" RELEASE_HANDOFF_REPO=fixture/emit CHANNEL_TAP_REPO=fixture/tap
unset GITHUB_STEP_SUMMARY

# --- fixture repository ----------------------------------------------------------------------
git init -q --bare -b main "$work/origin.git"
fixture="$work/emit"
git clone -q "$work/origin.git" "$fixture" 2>/dev/null
mkdir -p "$fixture/tools" "$fixture/src" "$fixture/bootstrap" "$fixture/openspec/specs/cap" "$fixture/docs"
cp tools/release-handoff.sh tools/release-tag.sh tools/changelog-section.awk tools/log.sh \
   tools/test-classify.py tools/spec-delta-check.py "$fixture/tools/"
# The inventory names one compiler input; the fingerprint hashes it and the bootstrap.
printf '#!/usr/bin/env bash\nprintf "src/compiler.ss\\n"\n' > "$fixture/tools/compiler-inputs.sh"
cat > "$fixture/tools/source-fingerprint.py" <<'PY'
#!/usr/bin/env python3
import hashlib, json, pathlib
root = pathlib.Path(__file__).resolve().parent.parent
digest = lambda path: hashlib.sha256((root / path).read_bytes()).hexdigest()
print(json.dumps({"source_digest": digest("src/compiler.ss"), "bootstrap_digest": digest("bootstrap/out.ll")}))
PY
chmod +x "$fixture"/tools/*
printf 'build/\n' > "$fixture/.gitignore"
cat > "$fixture/openspec/specs/cap/spec.md" <<'EOF'
# cap Specification

## Purpose

A fixture capability for handoff tests.

## Requirements

### Requirement: Widgets render

The system SHALL render widgets.

A second paragraph that must survive.

#### Scenario: One widget

- **WHEN** one widget exists
- **THEN** it renders

#### Scenario: Many widgets

- **WHEN** many widgets exist
- **THEN** they all render
EOF
cd "$fixture"
printf '(define x 1)\n' > src/compiler.ss
printf '; ir 1\n' > bootstrap/out.ll
printf '0.1.0\n' > VERSION
printf '# Changelog\n\n## 0.1.0\n\n- First.\n' > CHANGELOG.md
printf 'docs\n' > docs/README.md
commit() { git add -A && git "${git_id[@]}" commit -qm "$1"; }
commit "release 0.1.0"
git tag -a v0.1.0 -m v0.1.0
git push -q origin main v0.1.0
git switch -q -c feature
# A completed change: all tasks checked, one ADDED requirement.
mkdir -p openspec/changes/demo/specs/cap
printf '# Tasks\n\n## 1. Work\n\n- [x] 1.1 Do it\n- [X] 1.2 Check it\n\n## Workflow follow-up\n\n- Archive it.\n' \
  > openspec/changes/demo/tasks.md
cat > openspec/changes/demo/specs/cap/spec.md <<'EOF'
# Spec Delta

## ADDED Requirements

### Requirement: Gadgets render

The system SHALL render gadgets.

#### Scenario: One gadget

- **WHEN** one gadget exists
- **THEN** it renders
EOF
printf '(define x 2)\n' > src/compiler.ss
printf '0.2.0\n' > VERSION
printf '# Changelog\n\n## 0.2.0\n\n- Gadgets.\n\n## 0.1.0\n\n- First.\n' > CHANGELOG.md
commit "feat: gadgets"
mkdir -p build
python3 tools/source-fingerprint.py > build/source-fingerprint.json

preflight() { tools/release-handoff.sh preflight "$@" > "$work/out" 2> "$work/err"; }
line() { grep "^stage=$1 " "$work/out" || true; }
expect() {
  # expect STAGE STATUS PATTERN
  line "$1" | grep -q "status=$2 " || fail "stage $1 is not $2: $(line "$1") $(cat "$work/err" | tail -n 3)"
  [ -z "${3:-}" ] || line "$1" | grep -q -- "$3" || fail "stage $1 reason lacks '$3': $(line "$1")"
}

# --- preflight: a ready change, except for CI evidence --------------------------------------
status=0; preflight demo || status=$?
expect base ok "feature contains origin/main"
expect tasks ok
expect specs ok "valid; deltas match"
expect version ok "VERSION 0.2.0 advances"
expect bootstrap ok "regenerated from the current compiler source"
expect validation owed "no CI evidence yet"
[ "$status" = 3 ] || fail "owed-only preflight exited $status, not 3"
[ "$(grep -c '^stage=' "$work/out")" = 6 ] || fail "preflight did not report six stages"
pass

# No change named: list the active changes and write nothing.
status=0; tools/release-handoff.sh preflight > "$work/out" 2> "$work/err" || status=$?
[ "$status" = 2 ] && grep -qx demo "$work/out" || fail "preflight without a change did not list changes"
[ -z "$(git status --porcelain)" ] || fail "preflight without a change wrote files"
pass

# Unchecked tasks fail at the tasks stage and list them.
printf '# Tasks\n\n- [x] 1.1 Do it\n- [ ] 1.2 Check it\n- [~] 1.3 Partly\n' > openspec/changes/demo/tasks.md
status=0; preflight demo --no-fetch || status=$?
expect tasks fail "2 unchecked: 1.2 1.3"
[ "$status" = 1 ] || fail "a failed stage exited $status, not 1"
git checkout -q -- openspec/changes/demo/tasks.md
pass

# A concurrent version merged first: v0.2.0 now exists on the remote.
git -C "$work/origin.git" tag v0.2.0 "$(git rev-parse main)"
preflight demo || true
expect version fail "v0.2.0 is already tagged"
git tag -d v0.2.0 > /dev/null && git -C "$work/origin.git" tag -d v0.2.0 > /dev/null
pass

# A non-trivial change without a bump fails; a deferral under Unreleased or an override passes.
git switch -q -c nobump main
printf '(define x 3)\n' > src/compiler.ss
git checkout -q feature -- openspec/changes/demo
commit "fix: three"
python3 tools/source-fingerprint.py > build/source-fingerprint.json
preflight demo --no-fetch || true
expect version fail "non-trivial change (compiler.*) without a VERSION bump"
pass
preflight demo --no-fetch --allow-no-bump || true
expect version ok "requester override"
pass
printf '# Changelog\n\n## Unreleased\n\n- Three.\n\n## 0.1.0\n\n- First.\n' > CHANGELOG.md
commit "docs: defer"
preflight demo --no-fetch || true
expect version ok "deferred under ## Unreleased"
pass
# A documentation-only change needs no bump.
git switch -q -c docsonly main
git checkout -q feature -- openspec/changes/demo
printf 'more docs\n' >> docs/README.md
commit "docs: more"
preflight demo --no-fetch || true
expect version ok "trivial change (documentation)"
expect bootstrap ok "no compiler input changed"
expect validation ok "documentation only"
pass
# An agent-skill change is infrastructure, not unknown: no bump and no native suite owed (#183).
git switch -q -c skillonly main
git checkout -q feature -- openspec/changes/demo
mkdir -p .claude/skills/demo
printf -- '---\nname: demo\n---\nA skill.\n' > .claude/skills/demo/SKILL.md
commit "chore: add a skill"
preflight demo --no-fetch || true
expect version ok "trivial change (documentation,infrastructure)"
expect validation owed "CI Required validation"
! line validation | grep -q "tools/test.sh full" || fail "a skill-only change owes the native suite: $(line validation)"
pass
git switch -q feature

# Bootstrap: a stale fingerprint fails, a missing one is owed, uncommitted IR is owed.
printf '(define x 2) ; edited after regen\n' > src/compiler.ss
commit "edit after regen"
preflight demo --no-fetch || true
expect bootstrap fail "run make regen"
pass
rm build/source-fingerprint.json
preflight demo --no-fetch || true
expect bootstrap owed "no regeneration record"
python3 tools/source-fingerprint.py > build/source-fingerprint.json
pass
printf '; ir 2\n' > bootstrap/out.ll
preflight demo --no-fetch || true
expect bootstrap owed "uncommitted compiler-input or bootstrap changes"
git checkout -q -- bootstrap/out.ll
python3 tools/source-fingerprint.py > build/source-fingerprint.json
pass

# Base: behind the remote main, and on main itself.
git switch -q main
printf 'later\n' >> docs/README.md
commit "docs: later on main"
git push -q origin main
git switch -q feature
preflight demo || true
expect base fail "feature is behind origin/main"
git "${git_id[@]}" merge -q --no-edit origin/main
pass
git switch -q main
git checkout -q feature -- openspec/changes/demo
preflight demo --no-fetch || true
expect base fail "on main"
git rm -rqf openspec/changes/demo
git switch -q feature
pass

# Specs: a MODIFIED block that drops a main scenario conflicts (3.2); a rewritten paragraph is
# a review, owed rather than failed; a failing openspec validate fails.
cat > openspec/changes/demo/specs/cap/spec.md <<'EOF'
# Spec Delta

## MODIFIED Requirements

### Requirement: Widgets render

The system SHALL render widgets.

A second paragraph that must survive.

#### Scenario: One widget

- **WHEN** one widget exists
- **THEN** it renders
EOF
preflight demo --no-fetch || true
expect specs fail 'drops main scenario "Many widgets"'
pass
cat > openspec/changes/demo/specs/cap/spec.md <<'EOF'
# Spec Delta

## MODIFIED Requirements

### Requirement: Widgets render

The system SHALL render widgets quickly.

A second paragraph that must survive.

#### Scenario: One widget

- **WHEN** one widget exists
- **THEN** it renders

#### Scenario: Many widgets

- **WHEN** many widgets exist
- **THEN** they all render
EOF
preflight demo --no-fetch || true
expect specs owed "confirm intended rewrites"
pass
OPENSPEC_STUB_STATUS=1 preflight demo --no-fetch || true
expect specs fail "openspec validate demo --strict fails"
git checkout -q -- openspec/changes/demo/specs/cap/spec.md
pass

# Validation evidence from CI: an open pull request and per-commit check runs.
checks_for() {
  # checks_for COMMIT STATUS CONCLUSION
  jq -n --arg status "$2" --arg conclusion "$3" \
    '{check_runs: [{name: "Required validation", status: $status, conclusion: (if $conclusion == "" then null else $conclusion end), started_at: "2026-11-10T00:00:00Z"}]}' \
    > "$GH_FIXTURES/$(key "api repos/fixture/emit/commits/$1/check-runs?check_name=Required%20validation")"
}
printf '[{"number": 4}]\n' > "$GH_FIXTURES/$(key "pr-list fixture/emit feature open")"
validated=$(git rev-parse HEAD)
checks_for "$validated" completed success
preflight demo --no-fetch || true
expect validation ok "passed at HEAD"
pass
# Only the sync-and-archive commit follows the validated one: nothing is rerun.
mkdir -p openspec/changes/archive
git mv openspec/changes/demo openspec/changes/archive/2026-11-10-demo
printf '\n<!-- synced -->\n' >> openspec/specs/cap/spec.md
commit "docs: sync and archive demo"
status=0; preflight demo --no-fetch || status=$?
expect specs ok "archived as 2026-11-10-demo"
expect validation ok "later commits are documentation only, nothing to rerun"
[ "$status" = 0 ] || fail "a validated, archived change exited $status, not 0: $(cat "$work/out")"
pass
# A code commit after validation owes the classified checks again.
printf '(define x 4)\n' > src/compiler.ss
commit "fix: after validation"
python3 tools/source-fingerprint.py > build/source-fingerprint.json
preflight demo --no-fetch || true
expect validation owed "make regen,tools/test.sh full,tools/test.sh units,tools/test.sh source"
pass
checks_for "$(git rev-parse HEAD)" completed failure
preflight demo --no-fetch || true
expect validation fail "Required validation failed at HEAD"
pass

# --- pr: create once, then edit in place; ready only after archive ---------------------------
git switch -q -c handoff main
mkdir -p openspec/changes/demo2
printf '# Tasks\n\n- [x] 1.1 Done\n' > openspec/changes/demo2/tasks.md
commit "feat: demo2"
printf 'Implements demo2.\n\nRefs #12\n' > "$work/body.md"
pr_calls() { grep -c "^pr $1" "$GH_FIXTURES/calls" || true; }
if tools/release-handoff.sh pr demo2 --draft --body-file "$work/body.md" > "$work/out" 2> "$work/err"; then
  fail "creating a pull request without a title succeeded"
fi
grep -q 'needs --title' "$work/err" || fail "missing title message"
pass
tools/release-handoff.sh pr demo2 --draft --title "feat: demo2" --body-file "$work/body.md" > "$work/out" 2> "$work/err" \
  || fail "pr --draft failed: $(cat "$work/err")"
grep -qx 'action=created' "$work/out" && grep -qx 'draft=true' "$work/out" || fail "draft pull request: $(cat "$work/out")"
[ "$(git -C "$work/origin.git" rev-parse handoff)" = "$(git rev-parse HEAD)" ] || fail "pr did not push the branch"
number=$(sed -n 's/^number=//p' "$work/out")
pass
printf 'Implements demo2, revised.\n' > "$work/body.md"
tools/release-handoff.sh pr demo2 --body-file "$work/body.md" > "$work/out" 2> "$work/err" || fail "pr rerun failed"
grep -qx 'action=updated' "$work/out" && [ "$(pr_calls create)" = 1 ] && [ "$(pr_calls edit)" = 1 ] \
  || fail "a rerun did not edit the existing pull request in place"
grep -q "^pr edit $number --repo fixture/emit --body-file" "$GH_FIXTURES/calls" || fail "edit targeted the wrong pull request"
pass
status=0; tools/release-handoff.sh pr demo2 --ready --body-file "$work/body.md" > "$work/out" 2> "$work/err" || status=$?
[ "$status" = 1 ] && grep -q '^stage=archive status=fail' "$work/out" && [ "$(pr_calls ready)" = 0 ] \
  || fail "--ready before archive was not refused"
pass
mkdir -p openspec/changes/archive
git mv openspec/changes/demo2 openspec/changes/archive/2026-11-10-demo2
commit "docs: archive demo2"
tools/release-handoff.sh pr demo2 --ready --body-file "$work/body.md" > "$work/out" 2> "$work/err" \
  || fail "--ready after archive failed: $(cat "$work/err")"
grep -qx 'action=updated,ready' "$work/out" && [ "$(pr_calls ready)" = 1 ] && [ "$(pr_calls create)" = 1 ] \
  || fail "ready after archive: $(cat "$work/out")"
pass

# The skill's pull-request body template renders with no placeholder left and no negated
# closing keyword; a negated one is refused, because GitHub would close the issue anyway.
sed -e 's/{{SUMMARY}}/Adds demo2./' -e 's/{{CHANGE}}/demo2/' -e 's/{{ARCHIVE}}/2026-11-10-demo2/' \
    -e 's/{{CAPABILITIES}}/`cap`/' -e 's/{{VERSION_LINE}}/0.2.0 (minor)/' -e 's/{{VALIDATION}}/Required validation passed./' \
    -e 's/{{ISSUES}}/Fixes #12. The audit remains open on #33 (Refs #33)./' -e 's/{{RELEASE_LINE}}/Merging releases v0.2.0./' \
    "$repo/.claude/skills/emit-finish-change/pr-body.md" > "$work/rendered.md"
! grep -q '{{' "$work/rendered.md" || fail "the template left a placeholder"
! grep -inE "(not|n't)[^.#]*(close|fix|resolve)" "$work/rendered.md" || fail "the rendered template negates a closing keyword"
tools/release-handoff.sh pr demo2 --body-file "$work/rendered.md" > "$work/out" 2> "$work/err" || fail "the rendered template was refused: $(cat "$work/err")"
pass
printf 'Partial work; this does not close #33.\n' > "$work/negated.md"
edits=$(pr_calls edit)
if tools/release-handoff.sh pr demo2 --body-file "$work/negated.md" > "$work/out" 2> "$work/err"; then
  fail "a body negating a closing keyword was accepted"
fi
grep -q 'negates a closing keyword' "$work/err" && [ "$(pr_calls edit)" = "$edits" ] || fail "negated keyword refusal"
pass

# --- status: reports the required check for the current head and never merges --------------
head=$(git rev-parse HEAD)
jq -n --arg head "$head" --arg url "https://github.com/fixture/emit/pull/$number" \
  '{url: $url, headRefOid: $head, isDraft: false, state: "OPEN", mergeCommit: null}' \
  > "$GH_FIXTURES/$(key "pr-view fixture/emit $number")"
status=0; tools/release-handoff.sh status > "$work/out" 2> "$work/err" || status=$?
[ "$status" = 3 ] && grep -qx 'check=none' "$work/out" || fail "status without a check run: $status $(cat "$work/out")"
pass
checks_for "$head" completed failure
jq '.check_runs[0].html_url = "https://github.com/fixture/emit/runs/9"' \
  "$GH_FIXTURES/$(key "api repos/fixture/emit/commits/$head/check-runs?check_name=Required%20validation")" > "$work/c" \
  && mv "$work/c" "$GH_FIXTURES/$(key "api repos/fixture/emit/commits/$head/check-runs?check_name=Required%20validation")"
status=0; tools/release-handoff.sh status "$number" > "$work/out" 2> "$work/err" || status=$?
[ "$status" = 1 ] && grep -qx 'check=failure' "$work/out" && grep -q '^next=fix the failing check: https://github.com/fixture/emit/runs/9' "$work/out" \
  || fail "failed check status: $status $(cat "$work/out")"
pass
checks_for "$head" in_progress ""
status=0; tools/release-handoff.sh status "$number" > "$work/out" 2> "$work/err" || status=$?
[ "$status" = 3 ] && grep -qx 'check=pending' "$work/out" || fail "pending check status"
pass
checks_for "$head" completed success
status=0; tools/release-handoff.sh status "$number" > "$work/out" 2> "$work/err" || status=$?
[ "$status" = 0 ] && grep -qx 'check=success' "$work/out" && grep -q '^next=ready to merge' "$work/out" || fail "passing check status"
[ "$(pr_calls merge)" = 0 ] || fail "status or pr requested a merge"
pass
jq '.state = "MERGED" | .mergeCommit = {oid: "abc123"}' "$GH_FIXTURES/$(key "pr-view fixture/emit $number")" > "$work/v" \
  && mv "$work/v" "$GH_FIXTURES/$(key "pr-view fixture/emit $number")"
tools/release-handoff.sh status "$number" > "$work/out" 2> "$work/err" || fail "merged status"
grep -qx 'next=follow the release: tools/release-handoff.sh follow abc123' "$work/out" || fail "merged next action"
pass

# --- follow: a merged release, stage by stage, by exact commit and tag -----------------------
git switch -q main
git switch -q -c rel
printf '0.3.0\n' > VERSION
printf '# Changelog\n\n## 0.3.0\n\n- Rel.\n\n## 0.1.0\n\n- First.\n' > CHANGELOG.md
mkdir -p openspec/changes/archive/2026-11-10-rel
printf '# Proposal\n' > openspec/changes/archive/2026-11-10-rel/proposal.md
commit "feat: rel"
git switch -q main
git "${git_id[@]}" merge -q --no-ff -m "Merge pull request #20 from fixture/rel" rel
merged=$(git rev-parse HEAD)
git tag -a v0.3.0 -m v0.3.0 "$merged"
git push -q origin main v0.3.0
digest=0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef
b64() { python3 -I -c 'import base64, json, sys; print(json.dumps({"content": base64.b64encode(sys.stdin.buffer.read()).decode()}))'; }
fx() { cat > "$GH_FIXTURES/$(key "$1")"; }
printf '[{"html_url": "https://github.com/fixture/emit/pull/20"}]\n' | fx "api repos/fixture/emit/commits/$merged/pulls"
printf '{"url": "https://github.com/fixture/emit/releases/tag/v0.3.0", "isDraft": false, "assets": [{"name": "emit-0.3.0.tar.gz"}, {"name": "SHA256SUMS"}]}\n' \
  | fx "release-view v0.3.0"
printf '%s  emit-0.3.0.tar.gz\n' "$digest" | fx "release-download v0.3.0 SHA256SUMS"
# The channels run for this commit, plus a newer pull_request run of the same workflow that must
# be ignored.
jq -n '[{databaseId: 77, status: "completed", conclusion: "success", url: "https://github.com/fixture/emit/actions/runs/77",
         event: "workflow_run", headBranch: "v0.3.0", createdAt: "2026-11-10T01:00:00Z"},
        {databaseId: 78, status: "completed", conclusion: "failure", url: "https://github.com/fixture/emit/actions/runs/78",
         event: "pull_request", headBranch: "rel", createdAt: "2026-11-10T02:00:00Z"}]' | fx "run-list channels.yml $merged"
jq -n '{jobs: [{name: "identity"}, {name: "homebrew"}, {name: "nix (ubuntu-24.04, x86_64-linux)"},
               {name: "nix (macos-15, aarch64-darwin)"}, {name: "nix-promote"}, {name: "oci"}]
        | map(. + {status: "completed", conclusion: "success"})}' | fx "run-view 77"
mkdir -p "$GH_FIXTURES/$(key "run-download 77 channel-oci")"
printf 'sha256:feedface\n' > "$GH_FIXTURES/$(key "run-download 77 channel-oci")/oci-digest.txt"
printf 'class Emit < Formula\n  url "https://github.com/fixture/emit/releases/download/v0.3.0/emit-0.3.0.tar.gz"\n  sha256 "%s"\nend\n' "$digest" \
  | b64 | fx "api repos/fixture/tap/contents/Formula/emit.rb"
printf '{"version": "0.3.0", "tag": "v0.3.0"}\n' | b64 | fx "api repos/fixture/emit/contents/packaging/release.json"
printf '[{"url": "https://github.com/fixture/tap/pull/5", "state": "MERGED", "autoMergeRequest": null}]\n' | fx "pr-list fixture/tap emit-v0.3.0 all"
printf '[{"url": "https://github.com/fixture/emit/pull/21", "state": "MERGED", "autoMergeRequest": null}]\n' | fx "pr-list fixture/emit channels/release-v0.3.0 all"
follow() { tools/release-handoff.sh follow "$@" > "$work/out" 2> "$work/err"; }

status=0; follow "$merged" || status=$?
for stage in merged tagged source-published homebrew nix oci; do expect "$stage" ok; done
[ "$status" = 0 ] || fail "a complete release exited $status: $(cat "$work/out")"
expect tagged ok "v0.3.0 at"
expect source-published ok "releases/tag/v0.3.0"
grep -qx "commit=$merged" "$work/out" && grep -qx 'pull_request=https://github.com/fixture/emit/pull/20' "$work/out" \
  && grep -qx 'archive=openspec/changes/archive/2026-11-10-rel' "$work/out" && grep -qx 'tag=v0.3.0' "$work/out" \
  && grep -qx "sha256=$digest" "$work/out" && grep -qx 'tap_pr=https://github.com/fixture/tap/pull/5' "$work/out" \
  && grep -qx 'nix_pr=https://github.com/fixture/emit/pull/21' "$work/out" && grep -qx 'oci_digest=sha256:feedface' "$work/out" \
  || fail "release identity: $(cat "$work/out")"
pass
# Runs are selected by commit, never "the latest run".
! grep '^run list' "$GH_FIXTURES/calls" | grep -v -- "--commit" || fail "follow listed runs without a commit"
pass

# An open tap pull request: source published, Homebrew pending.
printf 'class Emit < Formula\n  url "https://github.com/fixture/emit/releases/download/v0.2.0/emit-0.2.0.tar.gz"\nend\n' \
  | b64 | fx "api repos/fixture/tap/contents/Formula/emit.rb"
printf '[{"url": "https://github.com/fixture/tap/pull/5", "state": "OPEN", "autoMergeRequest": {"mergeMethod": "MERGE"}}]\n' \
  | fx "pr-list fixture/tap emit-v0.3.0 all"
status=0; follow "$merged" || status=$?
expect source-published ok
expect homebrew pending "auto-merge requested"
expect nix ok
[ "$status" = 3 ] || fail "a pending channel exited $status"
pass
# --wait gives up at its timeout and still reports.
status=0; RELEASE_HANDOFF_POLL=0 follow "$merged" --wait --timeout 0 || status=$?
[ "$status" = 3 ] && grep -q '^stage=homebrew status=pending' "$work/out" || fail "--wait timeout"
pass

# A failed source release blocks every channel; an unrelated newer release run is ignored.
rm "$GH_FIXTURES/$(key "release-view v0.3.0")"
jq -n '[{databaseId: 70, status: "completed", conclusion: "failure", url: "https://github.com/fixture/emit/actions/runs/70",
         event: "push", headBranch: "v0.3.0", createdAt: "2026-11-10T00:30:00Z"},
        {databaseId: 71, status: "completed", conclusion: "success", url: "https://github.com/fixture/emit/actions/runs/71",
         event: "push", headBranch: "main", createdAt: "2026-11-10T03:00:00Z"}]' | fx "run-list release.yml $merged"
status=0; follow "$merged" || status=$?
expect source-published failed "runs/70"
for stage in homebrew nix oci; do expect "$stage" blocked; done
[ "$status" = 1 ] && grep -q 'failed at source-published' "$work/err" || fail "a failed source release exited $status"
pass

# Untagged: release-tag.yml not yet run is pending; a failed run names the remedy.
git switch -q -c rel2
printf '0.4.0\n' > VERSION
printf '# Changelog\n\n## 0.4.0\n\n- Rel2.\n\n## 0.3.0\n\n- Rel.\n' > CHANGELOG.md
commit "feat: rel2"
git switch -q main && git "${git_id[@]}" merge -q --no-ff -m "merge rel2" rel2 && git push -q origin main
untagged=$(git rev-parse HEAD)
follow "$untagged" || true
expect tagged pending "has not run"
expect source-published blocked
pass
jq -n '[{databaseId: 60, status: "completed", conclusion: "failure", url: "https://github.com/fixture/emit/actions/runs/60",
         event: "push", headBranch: "main", createdAt: "2026-11-10T04:00:00Z"}]' | fx "run-list release-tag.yml $untagged"
status=0; follow "$untagged" || status=$?
expect tagged failed "RELEASE_TAG_TOKEN"
[ "$status" = 1 ] || fail "a failed tagging run exited $status"
pass
# A merge that does not change VERSION releases nothing.
printf 'docs\n' >> docs/README.md
commit "docs: no release"
git push -q origin main
status=0; follow "$(git rev-parse HEAD)" || status=$?
expect tagged skipped "unchanged"
[ "$status" = 0 ] || fail "a non-release merge exited $status"
pass

if tools/release-handoff.sh preflight demo --bogus 2> "$work/err"; then fail "an unknown option was accepted"; fi
grep -q 'unknown option --bogus' "$work/err" || fail "unknown option message"
tools/release-handoff.sh --help | grep -q '^Usage:' || fail "help on stdout"
pass

say "test release handoff -> preflight, pull request, status, follow  [$checks checks, ${SECONDS}s]"
