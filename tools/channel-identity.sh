#!/usr/bin/env bash
# channel-identity.sh -- the one release identity every distribution channel consumes
# (change: low-cost-distribution-channels, design D2).
#
#   describe ARCHIVE --tag TAG --commit SHA --url URL
#       Print the identity JSON for a source archive (packaging/release.json's format) on stdout.
#       Promotion writes the published release's identity with it; rehearsals describe a
#       candidate archive with a file:// URL.
#   verify RELEASE_JSON ARCHIVE [--allow-file-url]
#       Check an archive against an identity before any channel builds it: digest, root
#       directory, VERSION, tag/version agreement, and URL.  There is no fallback: a mismatch
#       fails, and nothing substitutes another source.
#
# Identity fields: version, tag (v<version>), commit (40 hex), archive_url (https URL ending in
# emit-<version>.tar.gz), sha256 (64 hex).
set -euo pipefail
. "$(dirname "$0")/log.sh"
usage() {
  printf '%s\n' 'Usage: tools/channel-identity.sh describe ARCHIVE --tag TAG --commit SHA --url URL' \
                '       tools/channel-identity.sh verify RELEASE_JSON ARCHIVE [--allow-file-url]'
}
die() { printf 'channel-identity: %s\n' "$1" >&2; exit 1; }
sha256_of() {
  if command -v sha256sum >/dev/null 2>&1; then sha256sum "$1" | cut -d' ' -f1
  else shasum -a 256 "$1" | cut -d' ' -f1; fi
}
# The archive's single root directory and the VERSION it carries.
archive_root() {
  local roots
  roots=$(tar -tzf "$1" | cut -d/ -f1 | LC_ALL=C sort -u)
  [ "$(printf '%s\n' "$roots" | wc -l | tr -d ' ')" = 1 ] || die "$1 has more than one root directory"
  printf '%s\n' "$roots"
}
archive_version() { tar -xzOf "$1" "$2/VERSION" 2>/dev/null | head -n1; }

case "${1:-}" in
  describe)
    [ "$#" = 8 ] && [ "$3" = --tag ] && [ "$5" = --commit ] && [ "$7" = --url ] || { usage >&2; exit 2; }
    archive=$2 tag=$4 commit=$6 url=$8
    [ -f "$archive" ] || die "no archive $archive"
    root=$(archive_root "$archive")
    version=$(archive_version "$archive" "$root")
    [ -n "$version" ] || die "$archive has no $root/VERSION"
    python3 -I -c 'import json, sys
keys = ["version", "tag", "commit", "archive_url", "sha256"]
print(json.dumps(dict(zip(keys, sys.argv[1:])), indent=2))' \
      "$version" "$tag" "$commit" "$url" "$(sha256_of "$archive")"
    say "describe $archive -> identity  [emit $version, $tag]"
    ;;
  verify)
    [ "$#" = 3 ] || { [ "$#" = 4 ] && [ "$4" = --allow-file-url ]; } || { usage >&2; exit 2; }
    identity=$2 archive=$3 allow_file=${4:-}
    [ -f "$identity" ] || die "no identity file $identity"
    [ -f "$archive" ] || die "no archive $archive"
    fields=$(python3 -I -c 'import json, re, sys
data = json.load(open(sys.argv[1]))
keys = ["version", "tag", "commit", "archive_url", "sha256"]
missing = [k for k in keys if not isinstance(data.get(k), str) or not data[k]]
if missing: sys.exit("missing or empty field(s): " + ", ".join(missing))
extra = sorted(set(data) - set(keys))
if extra: sys.exit("unknown field(s): " + ", ".join(extra))
if data["tag"] != "v" + data["version"]: sys.exit("tag %s does not name version %s" % (data["tag"], data["version"]))
if not re.fullmatch(r"[0-9a-f]{40}", data["commit"]): sys.exit("commit is not a full 40-hex SHA")
if not re.fullmatch(r"[0-9a-f]{64}", data["sha256"]): sys.exit("sha256 is not 64 lowercase hex digits")
if not data["archive_url"].endswith("/emit-%s.tar.gz" % data["version"]): sys.exit("archive_url does not end in emit-%s.tar.gz" % data["version"])
print("\t".join(data[k] for k in keys))' "$identity") || die "$identity is not a valid release identity"
    IFS=$'\t' read -r version tag commit url digest <<< "$fields"
    case "$url" in
      https://*) ;;
      file://*) [ -n "$allow_file" ] || die "file:// archive_url is allowed only in rehearsal (--allow-file-url)" ;;
      *) die "archive_url must be https:// (got $url)" ;;
    esac
    actual=$(sha256_of "$archive")
    [ "$actual" = "$digest" ] || die "$archive digest $actual differs from the identity's $digest"
    root=$(archive_root "$archive")
    [ "$root" = "emit-$version" ] || die "$archive root $root is not emit-$version"
    reported=$(archive_version "$archive" "$root")
    [ "$reported" = "$version" ] || die "$archive reports VERSION '$reported', identity says $version"
    say "verify $archive -> identity $identity  [emit $version, $tag, ${commit:0:12}]"
    ;;
  --help) usage ;;
  *) usage >&2; exit 2 ;;
esac
