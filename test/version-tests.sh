#!/usr/bin/env bash
# version-tests.sh -- release identity and top-level version CLI.
set -u
cd "$(dirname "$0")/.."

REPO="$PWD"
EMIT="$REPO/build/emit"
make emit >/dev/null 2>&1 || { echo "failed to build $EMIT"; exit 1; }

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
VERSION="$(tr -d '\n' < VERSION)"
LLVM_CONFIG="${LLVM_CONFIG:-llvm-config}"
if [ "$LLVM_CONFIG" = llvm-config ]; then
  resolved_llvm_config="$(sed -n 's/^LLVM_CONFIG := //p' "$PWD/build/llvm.mk" | head -1)"
  [ -n "$resolved_llvm_config" ] && LLVM_CONFIG="$resolved_llvm_config"
fi
LLVM_VERSION="$("$LLVM_CONFIG" --version 2>/dev/null)" || {
  echo "failed to identify the LLVM used for the version expectation"
  exit 1
}
EXPECTED="emit $VERSION (LLVM $LLVM_VERSION)"
pass=0
fail=0
ok() { echo "  [OK  ] $1"; pass=$((pass + 1)); }
bad() { echo "  [FAIL] $1"; fail=$((fail + 1)); }

cd "$TMP"
for level in default quiet verbose; do
  case "$level" in
    default) actual="$(env -u EMIT_VERBOSITY "$EMIT" --version 2>"$TMP/err")" ;;
    *) actual="$(EMIT_VERBOSITY="$level" "$EMIT" --version 2>"$TMP/err")" ;;
  esac
  rc=$?
  if [ "$rc" -eq 0 ] && [ "$actual" = "$EXPECTED" ] && [ ! -s "$TMP/err" ]; then
    ok "emit --version exact output at $level verbosity"
  else
    bad "emit --version at $level verbosity (stdout [$actual], stderr [$(cat "$TMP/err")])"
  fi
done

actual="$(PATH="$TMP/no-tools" EMIT_MANIFEST="$TMP/no-manifest" \
  EMIT_LIBRARY_PATH="$TMP/no-libraries" "$EMIT" --version 2>"$TMP/err")"
rc=$?
if [ "$rc" -eq 0 ] && [ "$actual" = "$EXPECTED" ] && [ ! -s "$TMP/err" ]; then
  ok "emit --version works without toolchain discovery from an unrelated directory"
else
  bad "emit --version without PATH tools (stdout [$actual], stderr [$(cat "$TMP/err")])"
fi

# Exercise incremental identity and install propagation in an isolated source fixture so
# changing VERSION cannot disturb the checkout's build/ or installed binary.
FIXTURE="$TMP/project"
mkdir -p "$FIXTURE"
cp -R "$REPO/Makefile" "$REPO/VERSION" "$REPO/emit-libs.scm" \
  "$REPO/bootstrap" "$REPO/lib" "$REPO/src" "$REPO/tools" "$FIXTURE/"
bootstrap_before="$(cksum "$FIXTURE"/bootstrap/*.ll)"
if ! make -C "$FIXTURE" emit >/dev/null 2>&1; then
  bad "isolated fixture initial build"
else
  fixture_llvm="$("$FIXTURE/build/emit" --version | sed -E 's/^emit [^ ]+ \(LLVM (.*)\)$/\1/')"

  printf '01.0.0\n' > "$FIXTURE/VERSION"
  if make -C "$FIXTURE" emit >/dev/null 2>&1; then
    bad "Makefile rejects malformed SemVer"
  else
    ok "Makefile rejects malformed SemVer"
  fi
  printf '0.1.0\nextra\n' > "$FIXTURE/VERSION"
  if make -C "$FIXTURE" emit >/dev/null 2>&1; then
    bad "Makefile rejects multiple VERSION lines"
  else
    ok "Makefile rejects multiple VERSION lines"
  fi

  printf '0.1.1\n' > "$FIXTURE/VERSION"
  if make -C "$FIXTURE" emit >/dev/null 2>&1 \
     && [ "$("$FIXTURE/build/emit" --version)" = "emit 0.1.1 (LLVM $fixture_llvm)" ]; then
    ok "version-only edit rebuilds the binary incrementally"
  else
    bad "version-only edit did not update the incrementally built binary"
  fi
  if [ "$(cksum "$FIXTURE"/bootstrap/*.ll)" = "$bootstrap_before" ]; then
    ok "version-only edit leaves committed bootstrap IR unchanged"
  else
    bad "version-only edit changed bootstrap IR"
  fi

  prefix="$TMP/install"
  if make -C "$FIXTURE" install PREFIX="$prefix" >/dev/null 2>&1 \
     && [ "$("$prefix/bin/emit" --version)" = "emit 0.1.1 (LLVM $fixture_llvm)" ]; then
    ok "make install ships the current version"
  else
    bad "make install did not ship version 0.1.1"
  fi
  printf '0.1.2\n' > "$FIXTURE/VERSION"
  if make -C "$FIXTURE" install PREFIX="$prefix" >/dev/null 2>&1 \
     && [ "$("$prefix/bin/emit" --version)" = "emit 0.1.2 (LLVM $fixture_llvm)" ]; then
    ok "version-only edit updates an existing install incrementally"
  else
    bad "incremental make install did not update to version 0.1.2"
  fi
fi

if "$EMIT" --version extra >"$TMP/out" 2>"$TMP/err"; then
  bad "emit --version rejects an extra argument"
elif [ ! -s "$TMP/out" ] && [ -s "$TMP/err" ]; then
  ok "emit --version rejects an extra argument as a usage error"
else
  bad "emit --version extra diagnostic (stdout [$(cat "$TMP/out")], stderr [$(cat "$TMP/err")])"
fi

echo "version tests: $pass passed, $fail failed"
[ "$fail" -eq 0 ]
