#!/usr/bin/env bash
# release-handoff.sh -- the mechanical half of finishing a versioned change and following its
# release (change: automate-release-handoff, design D2, D3, D5).  The judgment half -- whether
# the work is really done, how deltas merge into the main specs, what the pull request says --
# belongs to the emit-finish-change skill, which drives these commands.
#
#   preflight CHANGE [--base REF] [--allow-no-bump] [--no-fetch]
#       Report readiness one stage per line on stdout:
#         stage=<name> status=<ok|owed|fail> reason=<text>
#       Stages: base, tasks, specs, version, bootstrap, validation.  Exit 1 when a stage fails,
#       3 when none fails but something is owed, 0 when ready.  Writes nothing.  Without
#       CHANGE, lists the active changes and exits 2.
#   pr CHANGE --body-file FILE [--title TITLE] [--draft | --ready]
#       Push the current branch and create its pull request, or edit the open one in place;
#       never a second one.  --ready marks it ready for review, refused until the change is
#       archived in the branch's last commit.  Never merges.
#   status [PR]
#       Report the pull request's head and its "Required validation" check, and the next
#       action.  Exit 0 when it passed, 1 when it failed, 3 while pending.  Never merges.
#   follow SHA [--wait] [--timeout SECONDS]
#       Follow a merged commit through tagging, source release, and each channel, by its exact
#       commit and tag, never by "latest run".  One line per lifecycle stage:
#         stage=<name> status=<ok|pending|failed|blocked|skipped> reason=<text>
#       then the release identity as key=value lines.  --wait polls until no stage is pending.
#       Exit 1 when a stage failed, 3 while pending, 0 when every channel is available.
#
# Environment: RELEASE_HANDOFF_REPO (default bwbensonjr/emit), CHANNEL_TAP_REPO (default
# bwbensonjr/homebrew-emit), RELEASE_HANDOFF_REMOTE (git remote, default origin),
# RELEASE_HANDOFF_POLL (first --wait interval in seconds, default 30).
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
repo=${RELEASE_HANDOFF_REPO:-bwbensonjr/emit}
tap_repo=${CHANNEL_TAP_REPO:-bwbensonjr/homebrew-emit}
remote=${RELEASE_HANDOFF_REMOTE:-origin}
required_check="Required validation"

usage() {
  printf '%s\n' 'Usage: tools/release-handoff.sh preflight CHANGE [--base REF] [--allow-no-bump] [--no-fetch]' \
    '       tools/release-handoff.sh pr CHANGE --body-file FILE [--title TITLE] [--draft | --ready]' \
    '       tools/release-handoff.sh status [PR]' \
    '       tools/release-handoff.sh follow SHA [--wait] [--timeout SECONDS]' \
    '' \
    'Prepare a completed versioned OpenSpec change for review and follow its release.' \
    'Results go to stdout as key=value lines; narration goes to stderr.'
}
die() { printf 'release-handoff: %s\n' "$*" >&2; exit 2; }
fail() { printf 'release-handoff: %s\n' "$*" >&2; exit 1; }

active_changes() {
  local dir
  for dir in openspec/changes/*/; do
    dir=${dir%/}
    [ "$(basename "$dir")" = archive ] || [ ! -d "$dir" ] || basename "$dir"
  done
}
# The change's directory: active, else its most recent archive; empty when neither exists.
change_dir() {
  local name=$1 archived
  if [ -d "openspec/changes/$name" ]; then printf 'openspec/changes/%s\n' "$name"; return; fi
  archived=$(ls -d openspec/changes/archive/*-"$name" 2>/dev/null | LC_ALL=C sort | tail -n1 || true)
  printf '%s\n' "$archived"
}
# Committed changes since BASE, or (classify_worktree) the intended state: committed changes
# plus staged, unstaged, and untracked files.
classify() { python3 tools/test-classify.py "$1" --ci --direct; }
classify_worktree() { python3 tools/test-classify.py "$1" --direct; }
# Non-trivial under docs/RELEASES.md: it can change emit's behavior, the installed payload, or
# how a source archive builds.
nontrivial() {
  jq -e '(.categories | map(select(. == "compiler" or . == "runtime" or . == "host" or . == "library" or . == "unknown")) | length > 0)
         or (.paths | index("Makefile") != null)' <<< "$1" > /dev/null
}
obligations() {
  local classification=$1 owed=()
  if jq -e '.docs_only' <<< "$classification" > /dev/null; then printf 'none (documentation only)\n'; return; fi
  if jq -e '.categories | index("compiler")' <<< "$classification" > /dev/null; then
    owed+=("make regen" "tools/test.sh full" "tools/test.sh units" "tools/test.sh source")
  elif jq -e '.categories | map(select(. == "runtime" or . == "host" or . == "library" or . == "unknown")) | length > 0' \
      <<< "$classification" > /dev/null; then
    owed+=("tools/test.sh full")
  fi
  owed+=("CI $required_check")
  local IFS=,
  printf '%s\n' "${owed[*]}"
}
current_branch() { git symbolic-ref -q --short HEAD || true; }
open_pr_number() {
  gh pr list --repo "$repo" --head "$1" --state open --json number --jq '.[0].number // empty' 2>/dev/null
}
# The conclusion of the required check for COMMIT: success, failure, pending, or none.
check_state() {
  local commit=$1 runs
  runs=$(gh api "repos/$repo/commits/$commit/check-runs?check_name=Required%20validation" 2>/dev/null) || { printf 'none\n'; return; }
  jq -r '[.check_runs[]?] | sort_by(.started_at) | last
         | if . == null then "none" elif .status != "completed" then "pending"
           elif .conclusion == "success" then "success" else "failure" end' <<< "$runs"
}

# --- preflight -------------------------------------------------------------------------------
worst=0
stage() {
  local name=$1 status=$2 reason=$3
  printf 'stage=%s status=%s reason=%s\n' "$name" "$status" "$reason"
  case "$status" in
    ok) say "preflight $name -> ok  [$reason]" ;;
    owed) say "preflight $name -> OWED  [$reason]"; [ "$worst" -ge 1 ] || worst=3 ;;
    *) say "preflight $name -> FAIL  [$reason]"; worst=1 ;;
  esac
}

preflight() {
  local name=$1 base=$2 allow_no_bump=$3 fetch=$4 dir branch merge_base classification
  dir=$(change_dir "$name")
  [ -n "$dir" ] || die "no change named $name (active: $(active_changes | tr '\n' ' '))"
  branch=$(current_branch)

  # base: the branch is not main and contains the current base.
  if [ "$fetch" = 1 ]; then
    git fetch -q --tags "$remote" "+refs/heads/main:refs/remotes/$remote/main" 2>/dev/null \
      || stage base fail "cannot fetch $remote main"
  fi
  if ! git rev-parse -q --verify "$base^{commit}" > /dev/null; then
    stage base fail "unknown base $base"
    merge_base=$(git rev-parse HEAD)
  else
    merge_base=$(git merge-base "$base" HEAD)
    if [ -z "$branch" ] || [ "$branch" = main ]; then
      stage base fail "on ${branch:-a detached HEAD}; hand off from a feature branch"
    elif git merge-base --is-ancestor "$base" HEAD; then
      stage base ok "$branch contains $base ($(git rev-parse --short "$base"))"
    else
      stage base fail "$branch is behind $base ($(git rev-parse --short "$base")); merge or rebase it"
    fi
  fi

  # tasks: every checkbox holds only x (OpenSpec's rule); checked boxes are not evidence.
  local unchecked count
  unchecked=$(grep -nE '^[[:space:]]*- \[[^]]*\]' "$dir/tasks.md" 2>/dev/null \
    | grep -vE '^[0-9]+:[[:space:]]*- \[[[:space:]]*[xX][[:space:]]*\]' || true)
  if [ ! -f "$dir/tasks.md" ]; then
    stage tasks fail "$dir has no tasks.md"
  elif [ -n "$unchecked" ]; then
    count=$(printf '%s\n' "$unchecked" | wc -l | tr -d ' ')
    stage tasks fail "$count unchecked: $(printf '%s\n' "$unchecked" | sed -E 's/^[0-9]+:[[:space:]]*- \[[^]]*\] *//' \
      | cut -d' ' -f1 | head -n 8 | tr '\n' ' ' | sed 's/ $//')"
  else
    stage tasks ok "all tasks checked in $dir/tasks.md; evidence is judged by validation"
  fi

  # specs: structural validation, then the deltas against the live main specs.
  local delta_out
  case "$dir" in
    openspec/changes/archive/*) stage specs ok "archived as $(basename "$dir"); specs already synced" ;;
    *)
      if delta_out=$(python3 tools/spec-delta-check.py "$dir" 2>/dev/null); then
        if ! command -v openspec > /dev/null 2>&1; then
          stage specs owed "openspec CLI unavailable; structural validation not run"
        elif ! openspec validate "$name" --strict > /dev/null 2>&1; then
          stage specs fail "openspec validate $name --strict fails; run it for details"
        elif grep -q '^review=' <<< "$delta_out"; then
          stage specs owed "confirm intended rewrites: $(sed -n 's/^review=//p' <<< "$delta_out" | head -n1)"
        else
          stage specs ok "valid; deltas match the live main specs"
        fi
      else
        stage specs fail "$(sed -n 's/^conflict=//p' <<< "$delta_out" | head -n 3 | paste -sd ';' -)"
      fi
      ;;
  esac

  classification=$(classify_worktree "$merge_base")
  local categories
  categories=$(jq -r '.categories | join(",")' <<< "$classification")

  # version: an advancing bump with its changelog section, or a justified absence of one.
  local check_err
  if git diff --quiet "$merge_base" HEAD -- VERSION && ! git diff --quiet "$merge_base" -- VERSION; then
    stage version owed "VERSION changed but not committed; commit VERSION and CHANGELOG.md, then rerun"
  elif ! git diff --quiet "$merge_base" HEAD -- VERSION; then
    if check_err=$(tools/release-tag.sh check HEAD 2>&1); then
      stage version ok "VERSION $(cat VERSION) advances past every release tag; changelog section present"
    else
      stage version fail "$(printf '%s\n' "$check_err" | sed -n 's/^release-tag: //p' | tail -n1); choose a higher version and changelog heading"
    fi
  elif ! nontrivial "$classification"; then
    stage version ok "no bump: trivial change ($categories)"
  elif [ "$allow_no_bump" = 1 ]; then
    stage version ok "no bump: requester override"
  elif ! git diff --quiet "$merge_base" -- CHANGELOG.md \
      && awk -v version=Unreleased -f tools/changelog-section.awk CHANGELOG.md > /dev/null; then
    stage version ok "bump deferred under ## Unreleased"
  else
    stage version fail "non-trivial change ($categories) without a VERSION bump; bump VERSION with its changelog section, or defer under ## Unreleased"
  fi

  # bootstrap: committed IR corresponds to the current compiler source.
  local inputs changed_inputs dirty status_json record current recorded
  inputs=$(bash tools/compiler-inputs.sh --list 2>/dev/null)
  changed_inputs=$(git diff --name-only "$merge_base" HEAD | grep -Fx -f <(printf '%s\n' "$inputs") || true)
  changed_inputs+=$(git diff --name-only "$merge_base" HEAD -- bootstrap/ || true)
  dirty=$( { git diff --name-only HEAD; git ls-files --others --exclude-standard; } | grep -Fx -f <(printf '%s\n' "$inputs") || true)
  dirty+=$(git status --porcelain -- bootstrap/ | head -n1)
  if [ -z "$changed_inputs" ] && [ -z "$dirty" ]; then
    stage bootstrap ok "no compiler input changed"
  elif [ -n "$dirty" ]; then
    stage bootstrap owed "uncommitted compiler-input or bootstrap changes; commit them before handoff"
  elif [ ! -f build/source-fingerprint.json ]; then
    stage bootstrap owed "compiler inputs changed and no regeneration record; run make regen, or rely on the CI source check"
  else
    status_json=$(python3 tools/source-fingerprint.py --status 2>/dev/null | tail -n1)
    current=$(jq -r '.source_digest + " " + .bootstrap_digest' <<< "$status_json")
    recorded=$(jq -r '.source_digest + " " + .bootstrap_digest' build/source-fingerprint.json)
    if [ "$current" = "$recorded" ]; then
      stage bootstrap ok "bootstrap regenerated from the current compiler source"
    else
      stage bootstrap fail "bootstrap does not correspond to the current compiler source; run make regen, then tools/test.sh full, units, and source"
    fi
  fi

  # validation: what the diff obliges, and whether CI evidence covers the current head.
  local owed number commit state validated="" later
  owed=$(obligations "$classification")
  if jq -e '.docs_only' <<< "$classification" > /dev/null; then
    stage validation ok "documentation only; lightweight checks"
  elif [ -z "$branch" ] || ! number=$(open_pr_number "$branch") || [ -z "$number" ]; then
    stage validation owed "$owed; no CI evidence yet (open a draft pull request with: tools/release-handoff.sh pr $name --draft)"
  else
    for commit in $(git rev-list --first-parent --max-count=30 "$merge_base..HEAD"); do
      state=$(check_state "$commit")
      if [ "$commit" = "$(git rev-parse HEAD)" ] && [ "$state" = failure ]; then
        stage validation fail "$required_check failed at HEAD ($(git rev-parse --short HEAD)); see the pull request checks"
        validated=failed
        break
      fi
      if [ "$state" = success ]; then validated=$commit; break; fi
    done
    if [ "$validated" = failed ]; then :
    elif [ -z "$validated" ]; then
      stage validation owed "$owed; $required_check has not passed on this branch yet"
    elif [ "$validated" = "$(git rev-parse HEAD)" ]; then
      stage validation ok "$required_check passed at HEAD ($(git rev-parse --short HEAD))"
    else
      later=$(classify "$validated")
      if jq -e '.docs_only' <<< "$later" > /dev/null; then
        stage validation ok "$required_check passed at $(git rev-parse --short "$validated"); later commits are documentation only, nothing to rerun"
      else
        stage validation owed "$(obligations "$later"); commits after $(git rev-parse --short "$validated") change $(jq -r '.categories | join(",")' <<< "$later")"
      fi
    fi
  fi

  case "$worst" in
    0) say "preflight $name -> ready for handoff" ;;
    3) say "preflight $name -> owed work remains" ;;
    *) say "preflight $name -> blocked" ;;
  esac
  return "$worst"
}

# --- pr and status ---------------------------------------------------------------------------
archived_in_head() {
  local name=$1
  git ls-tree -d --name-only HEAD openspec/changes/archive/ 2>/dev/null | grep -q -- "-$name\$" \
    && ! git cat-file -e "HEAD:openspec/changes/$name" 2>/dev/null
}

pull_request() {
  local name=$1 body=$2 title=$3 mode=$4 branch pr number url draft action
  branch=$(current_branch)
  [ -n "$branch" ] && [ "$branch" != main ] || fail "on ${branch:-a detached HEAD}; open the pull request from the change's branch"
  [ -f "$body" ] || die "no body file $body"
  # GitHub closes an issue named after a closing keyword even in a negated sentence ("does not
  # close #33"), so such a body would close what it means to leave open.
  local negated
  negated=$(grep -inE "((^|[^[:alpha:]])not|n't)[^.#]*(^|[^[:alpha:]])(close[sd]?|fix(e[sd])?|resolve[sd]?)[[:space:]]+#[0-9]+" "$body" || true)
  [ -z "$negated" ] || fail "the body negates a closing keyword, which GitHub still acts on; say \"remains open on #N\" or use Refs #N: $negated"
  if [ "$mode" = ready ] && ! archived_in_head "$name"; then
    printf 'stage=archive status=fail reason=%s\n' "commit the spec sync and archive of $name before marking the pull request ready"
    fail "$name is not archived in HEAD; commit the sync and archive first"
  fi
  git push -q -u "$remote" "HEAD:refs/heads/$branch"
  say "push $branch -> $remote  [$(git rev-parse --short HEAD)]"
  pr=$(gh pr list --repo "$repo" --head "$branch" --state open --json number,url,isDraft --jq '.[0] // empty')
  if [ -z "$pr" ]; then
    [ -n "$title" ] || die "creating a pull request needs --title"
    local options=()
    [ "$mode" != draft ] || options+=(--draft)
    url=$(gh pr create --repo "$repo" --head "$branch" --base main --title "$title" --body-file "$body" ${options[@]+"${options[@]}"})
    pr=$(gh pr list --repo "$repo" --head "$branch" --state open --json number,url,isDraft --jq '.[0] // empty')
    [ -n "$pr" ] || fail "created $url but cannot find it again"
    action=created
  else
    number=$(jq -r .number <<< "$pr")
    if [ -n "$title" ]; then
      gh pr edit "$number" --repo "$repo" --title "$title" --body-file "$body" > /dev/null
    else
      gh pr edit "$number" --repo "$repo" --body-file "$body" > /dev/null
    fi
    action=updated
  fi
  number=$(jq -r .number <<< "$pr") url=$(jq -r .url <<< "$pr") draft=$(jq -r .isDraft <<< "$pr")
  if [ "$mode" = ready ] && [ "$draft" = true ]; then
    gh pr ready "$number" --repo "$repo" > /dev/null
    draft=false
    action="$action,ready"
  elif [ "$mode" = draft ] && [ "$draft" != true ]; then
    say "pr $url is already ready for review; leaving it so"
  fi
  say "pr $name -> $url  [$action; draft=$draft]"
  printf 'pr=%s\nnumber=%s\ndraft=%s\naction=%s\n' "$url" "$number" "$draft" "$action"
}

pr_status() {
  local number=$1 view url head draft state merge_commit check runs link next code
  if [ -z "$number" ]; then
    number=$(open_pr_number "$(current_branch)") || true
    [ -n "$number" ] || fail "no open pull request for branch $(current_branch); name one"
  fi
  view=$(gh pr view "$number" --repo "$repo" --json url,headRefOid,isDraft,state,mergeCommit) \
    || fail "cannot read pull request $number"
  url=$(jq -r .url <<< "$view") head=$(jq -r .headRefOid <<< "$view")
  draft=$(jq -r .isDraft <<< "$view") state=$(jq -r .state <<< "$view")
  merge_commit=$(jq -r '.mergeCommit.oid // empty' <<< "$view")
  printf 'pr=%s\nhead=%s\nstate=%s\ndraft=%s\n' "$url" "$head" "$state" "$draft"
  if [ "$state" = MERGED ]; then
    printf 'merge_commit=%s\nnext=%s\n' "$merge_commit" "follow the release: tools/release-handoff.sh follow $merge_commit"
    say "status $url -> merged at ${merge_commit:0:12}"
    return 0
  fi
  check=$(check_state "$head")
  runs=$(gh api "repos/$repo/commits/$head/check-runs?check_name=Required%20validation" 2>/dev/null || printf '{}')
  link=$(jq -r '[.check_runs[]?] | sort_by(.started_at) | last | .html_url // empty' <<< "$runs")
  case "$check" in
    success)
      code=0
      if [ "$draft" = true ]; then next="mark it ready after the archive is committed: tools/release-handoff.sh pr CHANGE --ready --body-file FILE"
      else next="ready to merge; merging a VERSION change releases it, so merge only as the deliberate release approval (gh pr merge $number --merge)"; fi
      ;;
    failure) code=1; next="fix the failing check${link:+: $link}" ;;
    *) code=3; next="wait for $required_check on ${head:0:12}" ;;
  esac
  printf 'check=%s\nlink=%s\nnext=%s\n' "$check" "$link" "$next"
  say "status $url -> $required_check $check at ${head:0:12}"
  return "$code"
}

# --- follow ----------------------------------------------------------------------------------
# A file's content on a repository's default branch, or nothing.
default_branch_file() {
  gh api "repos/$1/contents/$2" 2>/dev/null \
    | python3 -I -c 'import base64, json, sys; print(base64.b64decode(json.load(sys.stdin)["content"]).decode(), end="")' \
      2>/dev/null || true
}
# The most recent run of WORKFLOW for COMMIT, optionally of one EVENT and head branch, as JSON.
run_for() {
  local workflow=$1 commit=$2 event=${3:-} branch=${4:-}
  gh run list --repo "$repo" --workflow "$workflow" --commit "$commit" --limit 20 \
      --json databaseId,status,conclusion,url,event,headBranch,createdAt 2>/dev/null \
    | jq -c --arg event "$event" --arg branch "$branch" \
        '[.[] | select(($event == "" or .event == $event) and ($branch == "" or .headBranch == $branch))]
         | sort_by(.createdAt) | last // empty' || true
}
run_state() {
  jq -r 'if .status != "completed" then "pending" elif .conclusion == "success" then "success" else "failure" end' <<< "$1"
}
# A promotion pull request's state and auto-merge request, as "<STATE> <url> <auto|manual>".
promotion_pr() {
  gh pr list --repo "$1" --head "$2" --state all --json url,state,autoMergeRequest 2>/dev/null \
    | jq -r '.[0] // empty | "\(.state) \(.url) \(if .autoMergeRequest then "auto" else "manual" end)"' || true
}

follow_once() {
  local sha=$1 out="" failed=0 pending=0 version previous tag tag_commit run state release url
  local digest="" channels="" jobs="" source_ok=0 pr archive tap_pr="" nix_pr="" oci_digest=""
  emit() {
    out+="stage=$1 status=$2 reason=$3"$'\n'
    case "$2" in failed) failed=1 ;; pending) pending=1 ;; esac
  }
  version=$(git show "$sha:VERSION" 2>/dev/null || true)
  previous=$(git show "$sha^1:VERSION" 2>/dev/null || true)
  tag="v$version"
  pr=$(gh api "repos/$repo/commits/$sha/pulls" --jq '.[0].html_url // empty' 2>/dev/null || true)
  archive=$(git diff --name-only --diff-filter=A "$sha^1" "$sha" -- 'openspec/changes/archive/' 2>/dev/null \
    | sed -n 's#^\(openspec/changes/archive/[^/]*\)/.*#\1#p' | LC_ALL=C sort -u | paste -sd ' ' - || true)

  if git merge-base --is-ancestor "$sha" "$remote/main" 2>/dev/null; then
    emit merged ok "$(git rev-parse --short "$sha") is on $remote/main"
  else
    emit merged pending "$(git rev-parse --short "$sha") is not on $remote/main yet"
  fi

  if [ -z "$version" ]; then
    emit tagged failed "no VERSION at $sha"
  elif [ "$version" = "$previous" ]; then
    emit tagged skipped "VERSION $version unchanged by $(git rev-parse --short "$sha"); no release"
    for stage in source-published homebrew nix oci; do emit "$stage" skipped "no release"; done
    printf '%s' "$out"; follow_identity "$sha" "$pr" "$archive" "" "" "" "" "" ""
    return 0
  else
    # The peeled commit of an annotated tag, else a lightweight tag's commit.
    tag_commit=$(git ls-remote "$remote" "refs/tags/$tag^{}" 2>/dev/null | awk '{ print $1 }' | head -n1)
    [ -n "$tag_commit" ] || tag_commit=$(git ls-remote "$remote" "refs/tags/$tag" 2>/dev/null | awk '{ print $1 }' | head -n1)
    if [ "$tag_commit" = "$sha" ]; then
      emit tagged ok "$tag at $(git rev-parse --short "$sha")"
    elif [ -n "$tag_commit" ]; then
      emit tagged ok "$tag at ${tag_commit:0:12}, a later commit than the followed one (tagged by dispatch); following the tag"
    else
      tag_commit=""
      run=$(run_for release-tag.yml "$sha")
      if [ -z "$run" ]; then emit tagged pending "release-tag.yml has not run for $(git rev-parse --short "$sha") yet"
      else
        state=$(run_state "$run")
        case "$state" in
          pending) emit tagged pending "release-tag.yml running: $(jq -r .url <<< "$run")" ;;
          *) emit tagged failed "release-tag.yml $state without $tag: $(jq -r .url <<< "$run"); fix the cause (often RELEASE_TAG_TOKEN), then: gh workflow run release-tag.yml --ref main" ;;
        esac
      fi
    fi
  fi

  if [ -z "${tag_commit:-}" ]; then
    for stage in source-published homebrew nix oci; do emit "$stage" blocked "waits for $tag"; done
  else
    release=$(gh release view "$tag" --repo "$repo" --json url,isDraft,assets 2>/dev/null || true)
    if [ -n "$release" ] && [ "$(jq -r .isDraft <<< "$release")" = false ] \
        && jq -e --arg archive "emit-$version.tar.gz" '[.assets[].name] | index($archive) and index("SHA256SUMS")' <<< "$release" > /dev/null; then
      url=$(jq -r .url <<< "$release")
      digest=$(gh release download "$tag" --repo "$repo" --pattern SHA256SUMS --output - 2>/dev/null \
        | awk -v archive="emit-$version.tar.gz" '$2 == archive || $2 == "*" archive { print $1 }' || true)
      emit source-published ok "$url"
      source_ok=1
    else
      run=$(run_for release.yml "$tag_commit" push "$tag")
      if [ -z "$run" ]; then emit source-published pending "release.yml has not run for $tag yet"
      else
        state=$(run_state "$run")
        case "$state" in
          pending) emit source-published pending "release.yml running: $(jq -r .url <<< "$run")" ;;
          *) emit source-published failed "release.yml $state: $(jq -r .url <<< "$run"); rerun a transient failure (gh run rerun $(jq -r .databaseId <<< "$run") --failed) or fix forward with a later patch version" ;;
        esac
      fi
    fi
    if [ "$source_ok" = 0 ]; then
      for stage in homebrew nix oci; do emit "$stage" blocked "waits for the source release of $tag"; done
    else
      channels=$(run_for channels.yml "$tag_commit" workflow_run)
      if [ -n "$channels" ]; then
        jobs=$(gh run view "$(jq -r .databaseId <<< "$channels")" --repo "$repo" --json jobs 2>/dev/null || printf '{"jobs": []}')
      fi
      follow_channel homebrew "$tap_repo" "emit-$tag" Formula/emit.rb
      follow_channel nix "$repo" "channels/release-$tag" packaging/release.json
      follow_oci
    fi
  fi
  printf '%s' "$out"
  follow_identity "$sha" "$pr" "$archive" "$tag" "$url" "$digest" "$tap_pr" "$nix_pr" "$oci_digest"
  [ "$failed" = 0 ] || return 1
  [ "$pending" = 0 ] || return 3
  return 0
}

# The conclusion of the channels job(s) whose name starts with PREFIX: success, failure, pending,
# or none.
job_state() {
  [ -n "$jobs" ] || { printf 'none\n'; return; }
  jq -r --arg prefix "$1" '[.jobs[] | select(.name == $prefix or (.name | startswith($prefix + " ")))]
    | if length == 0 then "none"
      elif any(.status != "completed") then "pending"
      elif all(.conclusion == "success") then "success" else "failure" end' <<< "$jobs"
}

follow_channel() {
  local name=$1 target=$2 branch=$3 path=$4 content available=0 promotion state url job
  content=$(default_branch_file "$target" "$path")
  case "$name" in
    homebrew)
      # The tap formula names this release's archive (and its digest, when known).
      if printf '%s\n' "$content" | grep -qF "/emit-$version.tar.gz\"" \
          && { [ -z "$digest" ] || printf '%s\n' "$content" | grep -qF "\"$digest\""; }; then
        available=1
      fi
      ;;
    nix)
      if [ -n "$content" ] && [ "$(jq -r '.tag // empty' <<< "$content" 2>/dev/null)" = "$tag" ]; then available=1; fi
      ;;
  esac
  promotion=$(promotion_pr "$target" "$branch")
  state=$(awk '{ print $1 }' <<< "$promotion") url=$(awk '{ print $2 }' <<< "$promotion")
  record_pr "$name" "$url"
  if [ "$available" = 1 ]; then
    emit "$name" ok "$target main names $tag"
    return
  fi
  job=$(job_state "$( [ "$name" = nix ] && printf nix-promote || printf homebrew )")
  if [ "$state" = OPEN ]; then
    if [ "$(awk '{ print $3 }' <<< "$promotion")" = auto ]; then
      emit "$name" pending "$url waits for its required check (auto-merge requested)"
    else
      emit "$name" pending "$url awaits a maintainer merge (the channels run summary says why)"
    fi
  elif [ "$state" = MERGED ]; then
    emit "$name" pending "$url merged, but $target main does not name $tag (superseded by a newer release?)"
  elif [ "$job" = failure ]; then
    emit "$name" failed "channels $name job failed: $(jq -r .url <<< "$channels"); fix it, then dispatch channels.yml with tag=$tag publish=true"
  elif [ -z "$channels" ] || [ "$job" = pending ] || [ "$job" = none ]; then
    emit "$name" pending "channels run for $tag${channels:+ in progress: $(jq -r .url <<< "$channels")}"
  else
    emit "$name" failed "no promotion pull request on $target for $tag"
  fi
}
record_pr() { case "$1" in homebrew) tap_pr=$2 ;; nix) nix_pr=$2 ;; esac; }

follow_oci() {
  local job scratch
  job=$(job_state oci)
  case "$job" in
    success)
      scratch=$(mktemp -d)
      if gh run download "$(jq -r .databaseId <<< "$channels")" --repo "$repo" -n channel-oci -D "$scratch" > /dev/null 2>&1 \
          && [ -f "$scratch/oci-digest.txt" ]; then
        oci_digest=$(head -n1 "$scratch/oci-digest.txt")
      fi
      rm -rf "$scratch"
      emit oci ok "ghcr.io/$(printf '%s' "$repo" | tr '[:upper:]' '[:lower:]'):$version${oci_digest:+ at $oci_digest}"
      ;;
    failure) emit oci failed "channels oci job failed: $(jq -r .url <<< "$channels"); fix it, then dispatch channels.yml with tag=$tag publish=true" ;;
    *) emit oci pending "channels run for $tag${channels:+ in progress: $(jq -r .url <<< "$channels")}" ;;
  esac
}

follow_identity() {
  printf 'commit=%s\npull_request=%s\narchive=%s\ntag=%s\nrelease=%s\nsha256=%s\ntap_pr=%s\nnix_pr=%s\noci_digest=%s\n' \
    "$1" "$2" "$3" "$4" "$5" "$6" "$7" "$8" "$9"
}

follow() {
  local target=$1 wait=$2 timeout=$3 sha interval=${RELEASE_HANDOFF_POLL:-30} started=$SECONDS report code
  git fetch -q --tags "$remote" "+refs/heads/main:refs/remotes/$remote/main" 2>/dev/null || say "follow: cannot fetch $remote; using local refs"
  sha=$(git rev-parse --verify -q "$target^{commit}") || fail "unknown commit $target (fetch it first)"
  while :; do
    code=0
    report=$(follow_once "$sha") || code=$?
    if [ "$wait" = 0 ] || [ "$code" != 3 ] || [ $((SECONDS - started)) -ge "$timeout" ]; then break; fi
    say "follow ${sha:0:12} -> pending  [$(grep -c 'status=pending' <<< "$report") stage(s); next check in ${interval}s]"
    sleep "$interval"
    interval=$((interval * 2)); [ "$interval" -le 300 ] || interval=300
  done
  printf '%s\n' "$report"
  case "$code" in
    0) say "follow ${sha:0:12} -> released and available on every channel" ;;
    3) say "follow ${sha:0:12} -> pending" ;;
    *) say "follow ${sha:0:12} -> failed at $(grep -m1 'status=failed' <<< "$report" | sed 's/^stage=\([^ ]*\).*/\1/')" ;;
  esac
  return "$code"
}

[ "$#" -ge 1 ] || { usage >&2; exit 2; }
command=$1; shift
case "$command" in
  --help|-h) usage ;;
  preflight)
    if [ "$#" = 0 ] || [ "${1#-}" != "$1" ]; then
      say "preflight: name a change; active changes:"
      active_changes
      exit 2
    fi
    name=$1; shift
    base="$remote/main" allow_no_bump=0 fetch=1
    while [ "$#" -gt 0 ]; do
      case "$1" in
        --base) [ "$#" -ge 2 ] || { usage >&2; exit 2; }; base=$2; shift 2 ;;
        --allow-no-bump) allow_no_bump=1; shift ;;
        --no-fetch) fetch=0; shift ;;
        *) printf 'release-handoff: preflight: unknown option %s\n' "$1" >&2; usage >&2; exit 2 ;;
      esac
    done
    status=0
    preflight "$name" "$base" "$allow_no_bump" "$fetch" || status=$?
    exit "$status"
    ;;
  pr)
    [ "$#" -ge 1 ] && [ "${1#-}" = "$1" ] || { usage >&2; exit 2; }
    name=$1; shift
    body="" title="" mode=""
    while [ "$#" -gt 0 ]; do
      case "$1" in
        --body-file) [ "$#" -ge 2 ] || { usage >&2; exit 2; }; body=$2; shift 2 ;;
        --title) [ "$#" -ge 2 ] || { usage >&2; exit 2; }; title=$2; shift 2 ;;
        --draft) [ -z "$mode" ] || die "--draft and --ready are exclusive"; mode=draft; shift ;;
        --ready) [ -z "$mode" ] || die "--draft and --ready are exclusive"; mode=ready; shift ;;
        *) printf 'release-handoff: pr: unknown option %s\n' "$1" >&2; usage >&2; exit 2 ;;
      esac
    done
    [ -n "$body" ] || die "pr needs --body-file"
    pull_request "$name" "$body" "$title" "$mode"
    ;;
  status)
    [ "$#" -le 1 ] || { usage >&2; exit 2; }
    code=0
    pr_status "${1:-}" || code=$?
    exit "$code"
    ;;
  follow)
    [ "$#" -ge 1 ] && [ "${1#-}" = "$1" ] || { usage >&2; exit 2; }
    target=$1; shift
    wait=0 timeout=10800
    while [ "$#" -gt 0 ]; do
      case "$1" in
        --wait) wait=1; shift ;;
        --timeout) [ "$#" -ge 2 ] || { usage >&2; exit 2; }; timeout=$2; shift 2 ;;
        *) printf 'release-handoff: follow: unknown option %s\n' "$1" >&2; usage >&2; exit 2 ;;
      esac
    done
    code=0
    follow "$target" "$wait" "$timeout" || code=$?
    exit "$code"
    ;;
  *) printf 'release-handoff: unknown command %s\n' "$command" >&2; usage >&2; exit 2 ;;
esac
