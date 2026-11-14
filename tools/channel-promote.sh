#!/usr/bin/env bash
# channel-promote.sh -- promote one tested channel candidate (change: low-cost-distribution-channels,
# design D7).  Every operation is safe to retry and never rewrites a published version.
#
#   oci TAG IMAGE_ARCHIVE REPOSITORY
#       Push the tested image archive (docker exporter tarball, which is also an OCI layout) by
#       digest: it is unpacked to an oci: layout, and skopeo --preserve-digests never re-encodes
#       it.  REPOSITORY:<version> is created only if absent; an existing tag must already
#       resolve to the tested digest, otherwise the promotion fails visibly.  The moving `latest`
#       tag is updated last, and never to an older release than the one it names (change:
#       channel-promotion-retries, design D4).
#   oci-resolve REPOSITORY VERSION
#       Print the digest REPOSITORY:VERSION resolves to, or nothing when that tag is absent, so a
#       published image is re-tested instead of rebuilt (change: channel-promotion-retries,
#       design D3).  Any other inspection failure is fatal.
#   oci-latest REPOSITORY DIGEST
#       Roll back: re-point `latest` to a previously validated digest.  Version tags never move.
#   tap TAG FORMULA
#       Open (or find) a pull request on the Homebrew tap that sets Formula/emit.rb.
#   flake TAG IDENTITY_JSON
#       Open (or find) a pull request in this repository that sets packaging/release.json.
#   Both print head=<sha> on stdout: the pull request head they pushed or reused, or an empty
#   value when the base branch already has the file or a newer release (nothing to merge).
#   preflight REPOSITORY SECRET_NAME
#       Prove GH_TOKEN (the secret named SECRET_NAME) is set, can push to REPOSITORY (an
#       authenticated `git push --dry-run`), and can read its pull requests -- the operations
#       themselves, because the permissions API reports the account's role, not a fine-grained
#       token's scope.  A missing write permission on pull requests cannot be probed without a
#       side effect; it fails visibly at the create or merge step instead.
#   tap-merge TAG FORMULA IDENTITY_JSON HEAD
#   flake-merge TAG IDENTITY_JSON HEAD
#       Request automatic merge of the generated pull request for HEAD, only after verifying it
#       (change: automate-release-handoff, design D4): the target enforces its required check
#       with no bypass and allows auto-merge (tools/repo-policy.sh); the pull request targets
#       the base branch, its head is HEAD, it changes only the generated file, and that file is
#       byte-identical to what was tested.  Any doubt leaves the pull request open for a
#       maintainer and reports [manual merge: <reason>]; the step still succeeds.
#
# Environment: REGISTRY_USER/REGISTRY_TOKEN (registry credentials), CHANNEL_REGISTRY_INSECURE=1
# (plain-HTTP fixture registry), GH_TOKEN (pull requests), CHANNEL_TAP_REMOTE / CHANNEL_REPO_REMOTE
# (git remotes, overridable for fixtures), CHANNEL_TAP_REPO / CHANNEL_REPO (owner/name for gh).
set -euo pipefail
. "$(dirname "$0")/log.sh"
usage() {
  printf '%s\n' 'Usage: tools/channel-promote.sh oci TAG IMAGE_ARCHIVE REPOSITORY' \
                '       tools/channel-promote.sh oci-resolve REPOSITORY VERSION' \
                '       tools/channel-promote.sh oci-latest REPOSITORY DIGEST' \
                '       tools/channel-promote.sh tap TAG FORMULA' \
                '       tools/channel-promote.sh flake TAG IDENTITY_JSON' \
                '       tools/channel-promote.sh preflight REPOSITORY SECRET_NAME' \
                '       tools/channel-promote.sh tap-merge TAG FORMULA IDENTITY_JSON HEAD' \
                '       tools/channel-promote.sh flake-merge TAG IDENTITY_JSON HEAD'
}
tools_dir=$(cd "$(dirname "$0")" && pwd -P)
die() { printf 'channel-promote: %s\n' "$1" >&2; exit 1; }

# Registry options as plain arrays (macOS runners may have bash 3.2: no namerefs), expanded with
# ${array[@]+...} so an empty array is safe under `set -u`.
push_options=() inspect_options=()
[ "${CHANNEL_REGISTRY_INSECURE:-}" = 1 ] && { push_options+=(--dest-tls-verify=false); inspect_options+=(--tls-verify=false); }
if [ -n "${REGISTRY_TOKEN:-}" ]; then
  push_options+=(--dest-creds "${REGISTRY_USER:?}:$REGISTRY_TOKEN")
  inspect_options+=(--creds "${REGISTRY_USER:?}:$REGISTRY_TOKEN")
fi
# The digest a remote tag resolves to, empty when the tag does not exist.  Any other failure
# (authentication, network) is fatal: an unknown state must never be mistaken for "absent".
remote_digest() {
  local reference=$1 output status=0
  output=$(skopeo inspect ${inspect_options[@]+"${inspect_options[@]}"} --format '{{.Digest}}' "docker://$reference" 2>&1) || status=$?
  if [ "$status" = 0 ]; then printf '%s\n' "$output"; return; fi
  case "$output" in
    *"manifest unknown"*|*"not found"*|*"NAME_UNKNOWN"*|*"MANIFEST_UNKNOWN"*) return 0 ;;
  esac
  die "cannot inspect $reference: $output"
}
push_exact() {
  local source=$1 reference=$2 expected=$3 source_options=()
  # A registry source (rollback) needs the source-side twins of the destination options.
  case "$source" in
    docker://*)
      [ "${CHANNEL_REGISTRY_INSECURE:-}" = 1 ] && source_options+=(--src-tls-verify=false)
      if [ -n "${REGISTRY_TOKEN:-}" ]; then source_options+=(--src-creds "${REGISTRY_USER:?}:$REGISTRY_TOKEN"); fi
      ;;
  esac
  skopeo copy --preserve-digests ${push_options[@]+"${push_options[@]}"} \
    ${source_options[@]+"${source_options[@]}"} "$source" "docker://$reference" >&2
  [ "$(remote_digest "$reference")" = "$expected" ] || die "$reference does not resolve to $expected after push"
}

# Release versions are plain MAJOR.MINOR.PATCH, compared numerically field by field.
version_valid() { printf '%s\n' "$1" | grep -Eq '^[0-9]+\.[0-9]+\.[0-9]+$'; }
# Succeeds when version $1 is newer than version $2; both must be valid.
version_newer() {
  local a b i
  version_valid "$1" || die "not a MAJOR.MINOR.PATCH version: $1"
  version_valid "$2" || die "not a MAJOR.MINOR.PATCH version: $2"
  IFS=. read -r -a a <<< "$1"
  IFS=. read -r -a b <<< "$2"
  for i in 0 1 2; do
    [ "$((10#${a[$i]}))" -gt "$((10#${b[$i]}))" ] && return 0
    [ "$((10#${a[$i]}))" -lt "$((10#${b[$i]}))" ] && return 1
  done
  return 1
}
# The release version the image at REFERENCE carries in its version label; empty when the tag is
# absent or unlabelled, which counts as older than any release.
image_version() {
  local reference=$1 label
  [ -n "$(remote_digest "$reference")" ] || return 0
  label=$(skopeo inspect ${inspect_options[@]+"${inspect_options[@]}"} \
            --format '{{index .Labels "org.opencontainers.image.version"}}' "docker://$reference") \
    || die "cannot read the version label of $reference"
  [ "$label" = "<no value>" ] && label=""
  [ -z "$label" ] || version_valid "$label" || die "$reference carries version label '$label', not MAJOR.MINOR.PATCH"
  printf '%s\n' "$label"
}

# The release version a promoted file names: a formula's archive URL (emit-X.Y.Z.tar.gz, as
# tools/channel-render.sh writes it) or a release identity's "version".  Fails on anything else.
file_version() {
  local path=$1 version
  case "$path" in
    *.rb) version=$(sed -n 's#^  url "https://.*/emit-\([0-9][0-9.]*\)\.tar\.gz"$#\1#p' "$path" | head -n1) ;;
    *.json) version=$(python3 -I -c 'import json,sys; print(json.load(open(sys.argv[1])).get("version", ""))' "$path") ;;
  esac
  version_valid "${version:-}" || die "cannot read a MAJOR.MINOR.PATCH release version from $path"
  printf '%s\n' "$version"
}

# Branch, commit, push, and pull request for a single file; reruns find the existing branch/PR.
# The base branch decides first (change: channel-promotion-retries, design D2): a file already
# there is merged, and a base naming a newer release supersedes the candidate.  A leftover
# branch with no open pull request restarts from the base rather than from merged history.
open_pull_request() {
  local remote=$1 repo=$2 branch=$3 path=$4 source=$5 title=$6 body=$7 work base existing current candidate
  work=$(mktemp -d)
  git clone -q "$remote" "$work/checkout"
  cd "$work/checkout"
  base=$(git symbolic-ref --short HEAD)
  if [ -f "$path" ]; then
    if cmp -s "$path" "$source"; then
      say "promote $path -> $base  [already merged]"
      printf 'head=\n'
      return 0
    fi
    current=$(file_version "$path") candidate=$(file_version "$source")
    if version_newer "$current" "$candidate"; then
      say "promote $path -> $base stays at $current  [superseded; $candidate is older]"
      printf 'head=\n'
      return 0
    fi
  fi
  existing=$(gh pr list --repo "$repo" --head "$branch" --state open --json url --jq '.[0].url // empty')
  local lease=()
  if git ls-remote --exit-code --heads origin "$branch" >/dev/null 2>&1; then
    git fetch -q origin "$branch"
    if [ -n "$existing" ]; then
      git checkout -q -B "$branch" FETCH_HEAD
    else
      # Replace only the ref just fetched; a concurrent update makes the push fail instead.
      lease=(--force-with-lease="$branch:$(git rev-parse FETCH_HEAD)")
      git checkout -q -B "$branch" "$base"
      say "promote $branch -> restart from $base  [no open pull request]"
    fi
  else
    git checkout -q -b "$branch"
  fi
  mkdir -p "$(dirname "$path")"
  cp "$source" "$path"
  git add "$path"
  if git diff --cached --quiet; then
    say "promote $path -> $branch already current"
  else
    git -c user.name="emit-channels" -c user.email="emit-channels@users.noreply.github.com" \
      commit -q -m "$title"
    git push -q ${lease[@]+"${lease[@]}"} origin "$branch"
  fi
  if [ -n "$existing" ]; then
    say "promote $path -> existing pull request $existing"
  else
    # gh prints the new pull request's URL; stdout carries only the head= line.
    say "promote $path -> pull request $(gh pr create --repo "$repo" --head "$branch" --title "$title" --body "$body")"
  fi
  printf 'head=%s\n' "$(git rev-parse HEAD)"
}

# Leave a promotion pull request for a maintainer, saying why, without failing the job: a
# divergent or unenforced pull request is a review matter, not a failed release.
manual_merge() {
  local what=$1 reason=$2
  say "promote-merge $what  [manual merge: $reason]"
  if [ -n "${GITHUB_STEP_SUMMARY:-}" ]; then
    printf -- '- **%s** left for a maintainer: %s\n' "$what" "$reason" >> "$GITHUB_STEP_SUMMARY"
  fi
  printf 'merge=manual\n'
}

# Request automatic merge of the generated pull request on BRANCH for HEAD after verifying it
# (change: automate-release-handoff, design D4).  CHECK is the target's required aggregate check.
merge_generated() {
  local remote=$1 repo=$2 branch=$3 path=$4 source=$5 head=$6 check=$7 work base pr number url
  local pr_head pr_base auto changed policy
  work=$(mktemp -d)
  git clone -q "$remote" "$work/checkout"
  cd "$work/checkout"
  base=$(git symbolic-ref --short HEAD)
  if [ -f "$path" ] && cmp -s "$path" "$source"; then
    say "promote-merge $path -> $base  [already merged]"
    printf 'merge=merged\n'
    return 0
  fi
  pr=$(gh pr list --repo "$repo" --head "$branch" --state open \
         --json number,url,headRefOid,baseRefName,autoMergeRequest --jq '.[0] // empty')
  if [ -z "$pr" ]; then
    if [ -z "$head" ]; then
      say "promote-merge $path -> $base  [nothing to merge]"
      printf 'merge=none\n'
    else
      manual_merge "$repo $branch" "no open pull request for $branch"
    fi
    return 0
  fi
  number=$(jq -r .number <<< "$pr") url=$(jq -r .url <<< "$pr")
  pr_head=$(jq -r .headRefOid <<< "$pr") pr_base=$(jq -r .baseRefName <<< "$pr")
  [ -n "$head" ] || { manual_merge "$url" "the promotion reported no head commit"; return 0; }
  if ! policy=$("$tools_dir/repo-policy.sh" check --repo "$repo" --check "$check" 2>/dev/null); then
    manual_merge "$url" "policy: $(printf '%s\n' "$policy" | sed -n 's/.*status=fail reason=//p' | head -n1)"
    return 0
  fi
  [ "$pr_base" = "$base" ] || { manual_merge "$url" "targets $pr_base, not $base"; return 0; }
  [ "$pr_head" = "$head" ] || { manual_merge "$url" "head is $pr_head, not the promoted $head"; return 0; }
  git fetch -q origin "$branch" || { manual_merge "$url" "cannot fetch $branch"; return 0; }
  [ "$(git rev-parse FETCH_HEAD)" = "$head" ] \
    || { manual_merge "$url" "branch $branch is at $(git rev-parse FETCH_HEAD), not $head"; return 0; }
  changed=$(git diff --name-only --no-renames "$(git merge-base "$base" "$head")" "$head")
  [ "$changed" = "$path" ] \
    || { manual_merge "$url" "changes $(printf '%s' "$changed" | tr '\n' ' ' | sed 's/ $//'), not only $path"; return 0; }
  git show "$head:$path" | cmp -s - "$source" \
    || { manual_merge "$url" "$path differs from the tested file"; return 0; }
  auto=$(jq -r '.autoMergeRequest // empty' <<< "$pr")
  if [ -n "$auto" ]; then
    say "promote-merge $url at ${head:0:12} -> waits for \"$check\"  [auto-merge pending]"
    printf 'merge=pending\n'
    return 0
  fi
  gh pr merge "$number" --repo "$repo" --auto --merge --match-head-commit "$head" >&2
  say "promote-merge $url at ${head:0:12} -> waits for \"$check\"  [auto-merge requested]"
  printf 'merge=requested\n'
}

case "${1:-}" in
  oci)
    [ "$#" = 4 ] || { usage >&2; exit 2; }
    tag=$2 archive=$3 repository=$4 version=${2#v}
    version_valid "$version" || die "$tag is not a vMAJOR.MINOR.PATCH release tag"
    [ -f "$archive" ] || die "no image archive $archive"
    # Unpack as the current user and push from the oci: directory transport.  skopeo's
    # oci-archive: transport replays the archive's root ownership, which fails without root.
    layout=$(mktemp -d)
    trap 'rm -rf "$layout"' EXIT
    tar -xf "$archive" -C "$layout"
    digest=$(skopeo inspect --format '{{.Digest}}' "oci:$layout")
    [ -n "$digest" ] || die "cannot read the tested digest from $archive"
    existing=$(remote_digest "$repository:$version")
    if [ "$existing" = "$digest" ]; then
      say "promote $repository:$version -> already $digest  [unchanged]"
    elif [ -n "$existing" ]; then
      die "$repository:$version already resolves to $existing, not the tested $digest; refusing to overwrite (publish a new patch version)"
    else
      push_exact "oci:$layout" "$repository:$version" "$digest"
      say "promote $archive -> $repository:$version  [$digest]"
    fi
    current=$(image_version "$repository:latest")
    if [ -n "$current" ] && version_newer "$current" "$version"; then
      say "promote $repository:latest -> stays at $current  [superseded; $tag is older]"
    else
      push_exact "oci:$layout" "$repository:latest" "$digest"
      say "promote $repository:latest -> $digest  [$tag]"
    fi
    ;;
  oci-resolve)
    [ "$#" = 3 ] || { usage >&2; exit 2; }
    repository=$2 version=$3
    version_valid "$version" || die "not a MAJOR.MINOR.PATCH version: $version"
    digest=$(remote_digest "$repository:$version")
    if [ -n "$digest" ]; then
      say "resolve $repository:$version -> $digest  [published; re-test it]"
      printf '%s\n' "$digest"
    else
      say "resolve $repository:$version -> absent  [build it]"
    fi
    ;;
  oci-latest)
    [ "$#" = 3 ] || { usage >&2; exit 2; }
    repository=$2 digest=$3
    [ -n "$(remote_digest "$repository@$digest")" ] || die "$repository@$digest does not exist"
    push_exact "docker://$repository@$digest" "$repository:latest" "$digest"
    say "rollback $repository:latest -> $digest"
    ;;
  tap)
    [ "$#" = 3 ] || { usage >&2; exit 2; }
    tag=$2 formula=$(cd "$(dirname "$3")" && pwd -P)/$(basename "$3")
    repo=${CHANNEL_TAP_REPO:-bwbensonjr/homebrew-emit}
    remote=${CHANNEL_TAP_REMOTE:-https://x-access-token:${GH_TOKEN:?}@github.com/$repo.git}
    grep -q '^  url "https://' "$formula" || die "$formula does not name a published https archive"
    open_pull_request "$remote" "$repo" "emit-$tag" Formula/emit.rb "$formula" \
      "emit ${tag#v}" "Formula for Emit $tag, rendered from its release identity by tools/channel-render.sh after the channel acceptance passed."
    ;;
  flake)
    [ "$#" = 3 ] || { usage >&2; exit 2; }
    tag=$2 identity=$(cd "$(dirname "$3")" && pwd -P)/$(basename "$3")
    repo=${CHANNEL_REPO:-${GITHUB_REPOSITORY:-bwbensonjr/emit}}
    remote=${CHANNEL_REPO_REMOTE:-https://x-access-token:${GH_TOKEN:?}@github.com/$repo.git}
    [ "$(python3 -I -c 'import json,sys; print(json.load(open(sys.argv[1]))["tag"])' "$identity")" = "$tag" ] \
      || die "$identity does not describe $tag"
    open_pull_request "$remote" "$repo" "channels/release-$tag" packaging/release.json "$identity" \
      "chore: pin Nix flake to Emit $tag" "Sets packaging/release.json to the published $tag archive after both Nix systems accepted it."
    ;;
  preflight)
    [ "$#" = 3 ] || { usage >&2; exit 2; }
    repo=$2 secret=$3
    [ -n "${GH_TOKEN:-}" ] || die "secret $secret is not configured"
    remote=${CHANNEL_PREFLIGHT_REMOTE:-https://x-access-token:${GH_TOKEN}@github.com/$repo.git}
    git push --dry-run --quiet "$remote" "$(git rev-parse HEAD):refs/heads/channel-preflight" 2>/dev/null \
      || die "$secret cannot push to $repo (needs Contents: Read and write)"
    gh pr list --repo "$repo" --state all --limit 1 --json number > /dev/null 2>&1 \
      || die "$secret cannot read pull requests on $repo (needs Pull requests: Read and write)"
    say "preflight $secret -> $repo  [push and pull-request read permitted]"
    ;;
  tap-merge)
    [ "$#" = 5 ] || { usage >&2; exit 2; }
    tag=$2 formula=$(cd "$(dirname "$3")" && pwd -P)/$(basename "$3") identity=$4 head=$5
    repo=${CHANNEL_TAP_REPO:-bwbensonjr/homebrew-emit}
    remote=${CHANNEL_TAP_REMOTE:-https://x-access-token:${GH_TOKEN:?}@github.com/$repo.git}
    expected_url=$(jq -r .archive_url "$identity") expected_sha=$(jq -r .sha256 "$identity")
    [ "$(jq -r .tag "$identity")" = "$tag" ] || die "$identity does not describe $tag"
    if ! grep -qxF "  url \"$expected_url\"" "$formula" || ! grep -qxF "  sha256 \"$expected_sha\"" "$formula"; then
      manual_merge "$repo emit-$tag" "$formula does not name the release URL and SHA-256"
      exit 0
    fi
    merge_generated "$remote" "$repo" "emit-$tag" Formula/emit.rb "$formula" "$head" "Required tap checks"
    ;;
  flake-merge)
    [ "$#" = 4 ] || { usage >&2; exit 2; }
    tag=$2 identity=$(cd "$(dirname "$3")" && pwd -P)/$(basename "$3") head=$4
    repo=${CHANNEL_REPO:-${GITHUB_REPOSITORY:-bwbensonjr/emit}}
    remote=${CHANNEL_REPO_REMOTE:-https://x-access-token:${GH_TOKEN:?}@github.com/$repo.git}
    [ "$(jq -r .tag "$identity")" = "$tag" ] || die "$identity does not describe $tag"
    merge_generated "$remote" "$repo" "channels/release-$tag" packaging/release.json "$identity" "$head" \
      "Required validation"
    ;;
  --help) usage ;;
  *) usage >&2; exit 2 ;;
esac
