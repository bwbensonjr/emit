#!/usr/bin/env bash
# gh-fixture-mock.sh -- a fixture-driven stand-in for the `gh` subcommands the release tooling
# uses (change: automate-release-handoff).  Tests install it as `gh` on PATH and set GH_FIXTURES
# to a directory.  Every invocation is appended to $GH_FIXTURES/calls, one line per call, so a
# test can assert that an operation (for example `pr merge`) was or was not made.
#
# A call is reduced to a key and answered from the file $GH_FIXTURES/<key>, where the key's
# characters outside [A-Za-z0-9._-] become `_`:
#
#   api PATH                                   api <PATH without leading />
#   pr list --repo R --head B [--state S]      pr-list <R> <B> <S, default open>   (default [])
#   pr view N --repo R                         pr-view <R> <N>
#   pr checks N --repo R                       pr-checks <R> <N>                    (default [])
#   run list --workflow W --commit C           run-list <W> <C>                     (default [])
#   run view ID                                run-view <ID>
#   run download ID -n NAME -D DIR             run-download <ID> <NAME>             (a directory)
#   release view TAG                           release-view <TAG>
#   release download TAG -p P -O -             release-download <TAG> <P>           (raw bytes)
#
# A missing api, view, or download fixture fails like GitHub's 404.  `--jq EXPR` (or `-q`) is
# applied with `jq -r`, as gh does.  `--repo` defaults to $GH_REPO, then "default".
#
# Writes are recorded and simulated:
#   pr create  prints https://github.com/<R>/pull/<N> and adds the pull request to the open list
#              for its head branch, so a following `pr list` finds it.
#   pr edit / pr ready / pr merge   exit with the number in <key>.exit when present, else 0.
# A pr-list fixture with a sibling <key>.exit fails with that status, like a 403.
set -euo pipefail
fixtures=${GH_FIXTURES:?GH_FIXTURES is not set}
printf '%s\n' "$*" >> "$fixtures/calls"
encode() { printf '%s' "$*" | LC_ALL=C tr -c 'A-Za-z0-9._-' '_'; }
name="" dir="" draft=false jq_filter="" repo=${GH_REPO:-default} head="" state=open workflow="" commit="" pattern="" title=""
positional=()
command=$1; shift
if [ "$command" = pr ] || [ "$command" = run ] || [ "$command" = release ]; then
  command="$command-$1"; shift
fi
while [ "$#" -gt 0 ]; do
  case "$1" in
    --jq|-q) jq_filter=$2; shift 2 ;;
    --repo|-R) repo=$2; shift 2 ;;
    --head) head=$2; shift 2 ;;
    --state) state=$2; shift 2 ;;
    --workflow|-w) workflow=$2; shift 2 ;;
    --commit) commit=$2; shift 2 ;;
    --title|-t) title=$2; shift 2 ;;
    --pattern|-p) pattern=$2; shift 2 ;;
    --name|-n) name=$2; shift 2 ;;
    --dir|-D) dir=$2; shift 2 ;;
    --json|--body|--body-file|--base|--event|--limit|-L|--match-head-commit|--method|-X|-O|--output|-f|-F)
      shift 2 ;;
    --draft) draft=true; shift ;;
    --auto|--merge|--squash|--rebase|--paginate|--undo|--fill) shift ;;
    -) shift ;;
    *) positional+=("$1"); shift ;;
  esac
done
answer() {
  local file=$1 fallback=$2
  if [ -f "$file" ]; then
    if [ -n "$jq_filter" ]; then jq -r "$jq_filter" < "$file"; else cat "$file"; fi
  elif [ -n "$fallback" ]; then
    if [ -n "$jq_filter" ]; then printf '%s\n' "$fallback" | jq -r "$jq_filter"; else printf '%s\n' "$fallback"; fi
  else
    printf 'gh: Not Found (HTTP 404)\n' >&2
    exit 1
  fi
}
exit_code() { if [ -f "$1.exit" ]; then exit "$(cat "$1.exit")"; fi; exit 0; }
case "$command" in
  api) answer "$fixtures/$(encode "api ${positional[0]#/}")" "" ;;
  pr-list)
    file="$fixtures/$(encode "pr-list $repo $head $state")"
    if [ -f "$file.exit" ]; then printf 'gh: Resource not accessible by personal access token (HTTP 403)\n' >&2; exit "$(cat "$file.exit")"; fi
    answer "$file" "[]"
    ;;
  pr-view) answer "$fixtures/$(encode "pr-view $repo ${positional[0]:-}")" "" ;;
  pr-checks) answer "$fixtures/$(encode "pr-checks $repo ${positional[0]:-}")" "[]" ;;
  run-list) answer "$fixtures/$(encode "run-list $workflow $commit")" "[]" ;;
  run-view) answer "$fixtures/$(encode "run-view ${positional[0]:-}")" "" ;;
  run-download)
    source="$fixtures/$(encode "run-download ${positional[0]:-} $name")"
    [ -d "$source" ] || { printf 'gh: no artifact matches %s\n' "$name" >&2; exit 1; }
    mkdir -p "${dir:-.}" && cp -R "$source/." "${dir:-.}/"
    ;;
  release-view) answer "$fixtures/$(encode "release-view ${positional[0]:-}")" "" ;;
  release-download)
    file="$fixtures/$(encode "release-download ${positional[0]:-} $pattern")"
    [ -f "$file" ] || { printf 'gh: release asset not found (HTTP 404)\n' >&2; exit 1; }
    cat "$file"
    ;;
  pr-create)
    list="$fixtures/$(encode "pr-list $repo $head open")"
    [ ! -s "$list" ] || [ "$(jq length < "$list")" = 0 ] \
      || { printf 'gh: a pull request for branch "%s" already exists\n' "$head" >&2; exit 1; }
    number=$(( $(cat "$fixtures/next-pr" 2>/dev/null || printf 1) ))
    printf '%s\n' "$((number + 1))" > "$fixtures/next-pr"
    url="https://github.com/$repo/pull/$number"
    jq -n --arg url "$url" --argjson number "$number" --arg head "$head" --arg title "$title" \
      --argjson draft "$draft" \
      '[{number: $number, url: $url, headRefName: $head, baseRefName: "main", title: $title, isDraft: $draft}]' > "$list"
    printf '%s\n' "$url"
    ;;
  pr-edit|pr-ready|pr-merge) exit_code "$fixtures/$(encode "$command $repo ${positional[0]:-}")" ;;
  *) printf 'gh-fixture-mock: unsupported command: %s\n' "$command" >&2; exit 2 ;;
esac
