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
      return 0
    fi
    current=$(file_version "$path") candidate=$(file_version "$source")
    if version_newer "$current" "$candidate"; then
      say "promote $path -> $base stays at $current  [superseded; $candidate is older]"
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
    gh pr create --repo "$repo" --head "$branch" --title "$title" --body "$body"
  fi
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
  --help) usage ;;
  *) usage >&2; exit 2 ;;
esac
