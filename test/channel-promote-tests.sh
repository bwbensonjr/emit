#!/usr/bin/env bash
# channel-promote-tests.sh -- promotion is exact, idempotent, and never overwrites a version
# (change: low-cost-distribution-channels, design D7).  Needs skopeo, git, python3, jq, and a
# plain-HTTP registry: CHANNEL_TEST_REGISTRY=host:port, or Docker to start registry:2 locally.
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/log.sh
repo=$PWD
work=$(mktemp -d)
started_registry=""
cleanup() { [ -z "$started_registry" ] || docker rm -f "$started_registry" >/dev/null; rm -rf "$work"; }
trap cleanup EXIT
checks=0
pass() { checks=$((checks + 1)); }
fail() { printf 'channel-promote test: %s\n' "$1" >&2; exit 1; }

registry=${CHANNEL_TEST_REGISTRY:-}
if [ -z "$registry" ]; then
  started_registry=$(docker run -d -p 127.0.0.1::5000 registry:2)
  registry="127.0.0.1:$(docker port "$started_registry" 5000/tcp | head -n1 | sed 's/.*://')"
  for _ in $(seq 1 30); do curl -fs "http://$registry/v2/" >/dev/null && break; sleep 1; done
fi
export CHANNEL_REGISTRY_INSECURE=1
say "test channel promotion -> $registry  [registry fixture]"

# Two distinct single-layer OCI archives, built without Docker.
make_image() {
  python3 -I - "$1" "$2" <<'PY'
import hashlib, io, json, sys, tarfile, time
out, content = sys.argv[1], sys.argv[2].encode()
def blob(data): return "sha256:" + hashlib.sha256(data).hexdigest(), data
layer_buffer = io.BytesIO()
with tarfile.open(fileobj=layer_buffer, mode="w") as layer:
    info = tarfile.TarInfo("payload"); info.size = len(content); info.mtime = 0
    layer.addfile(info, io.BytesIO(content))
layer_digest, layer_data = blob(layer_buffer.getvalue())
config = json.dumps({"architecture": "amd64", "os": "linux",
                     "rootfs": {"type": "layers", "diff_ids": [layer_digest]}}).encode()
config_digest, config_data = blob(config)
manifest = json.dumps({"schemaVersion": 2, "mediaType": "application/vnd.oci.image.manifest.v1+json",
    "config": {"mediaType": "application/vnd.oci.image.config.v1+json", "digest": config_digest, "size": len(config_data)},
    "layers": [{"mediaType": "application/vnd.oci.image.layer.v1.tar", "digest": layer_digest, "size": len(layer_data)}]}).encode()
manifest_digest, manifest_data = blob(manifest)
index = json.dumps({"schemaVersion": 2, "manifests": [{"mediaType": "application/vnd.oci.image.manifest.v1+json",
    "digest": manifest_digest, "size": len(manifest_data)}]}).encode()
with tarfile.open(out, "w") as archive:
    def add(name, data):
        info = tarfile.TarInfo(name); info.size = len(data); info.mtime = 0
        archive.addfile(info, io.BytesIO(data))
    add("oci-layout", b'{"imageLayoutVersion": "1.0.0"}')
    add("index.json", index)
    for digest, data in ((layer_digest, layer_data), (config_digest, config_data), (manifest_digest, manifest_data)):
        add("blobs/sha256/" + digest.split(":")[1], data)
print(manifest_digest)
PY
}
digest_a=$(make_image "$work/a.tar" "first image")
digest_b=$(make_image "$work/b.tar" "second image")
[ "$digest_a" != "$digest_b" ] || fail "fixture images share a digest"
target="$registry/emit/channel"
remote() { skopeo inspect --tls-verify=false --format '{{.Digest}}' "docker://$target:$1"; }

tools/channel-promote.sh oci v1.0.0 "$work/a.tar" "$target"
[ "$(remote 1.0.0)" = "$digest_a" ] && [ "$(remote latest)" = "$digest_a" ] || fail "first promotion"
pass
tools/channel-promote.sh oci v1.0.0 "$work/a.tar" "$target" 2> "$work/retry.err"
grep -q unchanged "$work/retry.err" && [ "$(remote 1.0.0)" = "$digest_a" ] || fail "idempotent retry"
pass
if tools/channel-promote.sh oci v1.0.0 "$work/b.tar" "$target" 2> "$work/conflict.err"; then
  fail "a different digest overwrote an existing version tag"
fi
grep -q "refusing to overwrite" "$work/conflict.err" || fail "conflict message"
[ "$(remote 1.0.0)" = "$digest_a" ] && [ "$(remote latest)" = "$digest_a" ] || fail "conflict changed tags"
pass
tools/channel-promote.sh oci v1.1.0 "$work/b.tar" "$target"
[ "$(remote 1.1.0)" = "$digest_b" ] && [ "$(remote latest)" = "$digest_b" ] && [ "$(remote 1.0.0)" = "$digest_a" ] \
  || fail "second version"
pass
tools/channel-promote.sh oci-latest "$target" "$digest_a"
[ "$(remote latest)" = "$digest_a" ] && [ "$(remote 1.1.0)" = "$digest_b" ] || fail "rollback of latest"
pass
if CHANNEL_REGISTRY_INSECURE=1 tools/channel-promote.sh oci v2.0.0 "$work/a.tar" "127.0.0.1:9/emit/none" 2> "$work/down.err"; then
  fail "an unreachable registry was treated as an absent tag"
fi
grep -q "cannot inspect" "$work/down.err" || fail "unreachable registry message"
pass

# Pull requests: a local bare remote and the gh mock stand in for GitHub.
mkdir -p "$work/bin" "$work/gh"
cp "$repo/test/channel-gh-mock.sh" "$work/bin/gh"
export PATH="$work/bin:$PATH" CHANNEL_TEST_GH="$work/gh"
git init -q --bare -b main "$work/tap.git"
git clone -q "$work/tap.git" "$work/tap-seed" 2>/dev/null
(cd "$work/tap-seed" && printf '# tap\n' > README.md && git add README.md \
  && git -c user.name=t -c user.email=t@invalid commit -qm seed && git push -q origin HEAD:main)
export CHANNEL_TAP_REMOTE="$work/tap.git" CHANNEL_TAP_REPO=fixture/homebrew-emit
printf 'class Emit < Formula\n  url "https://example.invalid/emit-1.0.0.tar.gz"\nend\n' > "$work/emit.rb"
tools/channel-promote.sh tap v1.0.0 "$work/emit.rb"
git --git-dir="$work/tap.git" show emit-v1.0.0:Formula/emit.rb | cmp - "$work/emit.rb" || fail "tap branch content"
[ "$(ls "$work/gh" | wc -l | tr -d ' ')" = 1 ] || fail "tap pull request"
pass
commits=$(git --git-dir="$work/tap.git" rev-list --count emit-v1.0.0)
tools/channel-promote.sh tap v1.0.0 "$work/emit.rb" 2> "$work/tap-retry.err"
[ "$(git --git-dir="$work/tap.git" rev-list --count emit-v1.0.0)" = "$commits" ] || fail "tap retry added a commit"
grep -q "existing pull request" "$work/tap-retry.err" || fail "tap retry did not reuse the pull request"
pass
sed 's#https://#file:///#' "$work/emit.rb" > "$work/local.rb"
if tools/channel-promote.sh tap v1.0.1 "$work/local.rb" 2>/dev/null; then fail "a file:// formula was promoted"; fi
pass

git init -q --bare -b main "$work/emit.git"
git clone -q "$work/emit.git" "$work/emit-seed" 2>/dev/null
(cd "$work/emit-seed" && printf 'x\n' > VERSION && git add VERSION \
  && git -c user.name=t -c user.email=t@invalid commit -qm seed && git push -q origin HEAD:main)
export CHANNEL_REPO_REMOTE="$work/emit.git" CHANNEL_REPO=fixture/emit
printf '{"version": "1.0.0", "tag": "v1.0.0"}\n' > "$work/identity.json"
tools/channel-promote.sh flake v1.0.0 "$work/identity.json"
git --git-dir="$work/emit.git" show channels/release-v1.0.0:packaging/release.json | cmp - "$work/identity.json" \
  || fail "flake branch content"
pass
if tools/channel-promote.sh flake v9.9.9 "$work/identity.json" 2>/dev/null; then fail "a mismatched identity was promoted"; fi
pass
say "test channel promotion -> exact, idempotent, non-overwriting  [$checks checks, ${SECONDS}s]"
