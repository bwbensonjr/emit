#!/usr/bin/env bash
# channel-promote.sh -- promote one tested channel candidate (change: low-cost-distribution-channels,
# design D7).  Every operation is safe to retry and never rewrites a published version.
#
#   oci TAG IMAGE_ARCHIVE REPOSITORY
#       Push the tested image archive (docker exporter tarball, which is also an OCI layout) by
#       digest: skopeo --preserve-digests never re-encodes it.  REPOSITORY:<version> is created
#       only if absent; an existing tag must already resolve to the tested digest, otherwise the
#       promotion fails visibly.  The moving `latest` tag is updated last.
#   oci-latest REPOSITORY DIGEST
#       Roll back: re-point `latest` to a previously validated digest.  Version tags never move.
#   tap TAG FORMULA
#       Open (or find) a pull request on the Homebrew tap that sets Formula/emit.rb.
#   flake TAG IDENTITY_JSON
#       Open (or find) a pull request in this repository that sets packaging/release.json.
#
# Environment: REGISTRY_USER/REGISTRY_TOKEN (registry credentials), CHANNEL_REGISTRY_INSECURE=1
# (plain-HTTP fixture registry), GH_TOKEN (pull requests), CHANNEL_TAP_REMOTE / CHANNEL_REPO_REMOTE
# (git remotes, overridable for fixtures), CHANNEL_TAP_REPO / CHANNEL_REPO (owner/name for gh).
set -euo pipefail
. "$(dirname "$0")/log.sh"
usage() {
  printf '%s\n' 'Usage: tools/channel-promote.sh oci TAG IMAGE_ARCHIVE REPOSITORY' \
                '       tools/channel-promote.sh oci-latest REPOSITORY DIGEST' \
                '       tools/channel-promote.sh tap TAG FORMULA' \
                '       tools/channel-promote.sh flake TAG IDENTITY_JSON'
}
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

# Branch, commit, push, and pull request for a single file; reruns find the existing branch/PR.
open_pull_request() {
  local remote=$1 repo=$2 branch=$3 path=$4 source=$5 title=$6 body=$7 work
  work=$(mktemp -d)
  git clone -q "$remote" "$work/checkout"
  cd "$work/checkout"
  if git ls-remote --exit-code --heads origin "$branch" >/dev/null 2>&1; then
    git fetch -q origin "$branch" && git checkout -q -B "$branch" FETCH_HEAD
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
    git push -q origin "$branch"
  fi
  local existing
  existing=$(gh pr list --repo "$repo" --head "$branch" --state open --json url --jq '.[0].url // empty')
  if [ -n "$existing" ]; then
    say "promote $path -> existing pull request $existing"
  else
    gh pr create --repo "$repo" --head "$branch" --title "$title" --body "$body"
  fi
}

case "${1:-}" in
  oci)
    [ "$#" = 4 ] || { usage >&2; exit 2; }
    tag=$2 archive=$3 repository=$4 version=${2#v}
    [ -f "$archive" ] || die "no image archive $archive"
    digest=$(skopeo inspect --format '{{.Digest}}' "oci-archive:$archive")
    [ -n "$digest" ] || die "cannot read the tested digest from $archive"
    existing=$(remote_digest "$repository:$version")
    if [ "$existing" = "$digest" ]; then
      say "promote $repository:$version -> already $digest  [unchanged]"
    elif [ -n "$existing" ]; then
      die "$repository:$version already resolves to $existing, not the tested $digest; refusing to overwrite (publish a new patch version)"
    else
      push_exact "oci-archive:$archive" "$repository:$version" "$digest"
      say "promote $archive -> $repository:$version  [$digest]"
    fi
    push_exact "oci-archive:$archive" "$repository:latest" "$digest"
    say "promote $repository:latest -> $digest  [$tag]"
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
  --help) usage ;;
  *) usage >&2; exit 2 ;;
esac
