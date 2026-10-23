#!/usr/bin/env bash
# channel-render.sh -- render a channel recipe template from a release identity
# (change: low-cost-distribution-channels, design D2/D4).
#
#   tools/channel-render.sh homebrew IDENTITY_JSON OUTPUT
#       packaging/homebrew/emit.rb.in -> OUTPUT, with the identity's archive_url and sha256.
#
# The identity is packaging/release.json for a promotion, or a candidate identity written by
# tools/channel-identity.sh describe (file:// URL) for a rehearsal.  Rendering substitutes only;
# the archive itself is verified by tools/channel-identity.sh and again by the package manager.
set -euo pipefail
root=$(cd "$(dirname "$0")/.." && pwd -P)
. "$root/tools/log.sh"
usage() { printf 'Usage: tools/channel-render.sh homebrew IDENTITY_JSON OUTPUT\n'; }
[ "${1:-}" = --help ] && { usage; exit 0; }
[ "$#" = 3 ] && [ "$1" = homebrew ] || { usage >&2; exit 2; }
identity=$2 output=$3
template="$root/packaging/homebrew/emit.rb.in"
python3 -I - "$identity" "$template" "$output" <<'PY'
import json, re, sys
identity, template, output = sys.argv[1:]
data = json.load(open(identity))
for key in ("archive_url", "sha256", "version"):
    if not isinstance(data.get(key), str) or not data[key]:
        sys.exit("channel-render: identity lacks %s" % key)
if not re.fullmatch(r"[0-9a-f]{64}", data["sha256"]):
    sys.exit("channel-render: sha256 is not 64 lowercase hex digits")
text = open(template).read()
text = text.replace("@ARCHIVE_URL@", data["archive_url"]).replace("@SHA256@", data["sha256"])
left = re.findall(r"@[A-Z_]+@", text)
if left:
    sys.exit("channel-render: unrendered placeholder(s): " + ", ".join(sorted(set(left))))
open(output, "w").write(text)
PY
say "render $template -> $output  [emit $(python3 -I -c 'import json,sys; print(json.load(open(sys.argv[1]))["version"])' "$identity")]"
