#!/usr/bin/env bash
# doctor-tests.sh -- read-only installation diagnostics and shared resolution.
set -eu
cd "$(dirname "$0")/.."
. tools/log.sh
REPO="$PWD"
EMIT="$REPO/build/emit"
make emit >/dev/null
TMP="$(mktemp -d)"
TMP="$(cd "$TMP" && pwd -P)"
trap 'rm -rf "$TMP"' EXIT
started=$SECONDS
say "test doctor -> isolated reports  [installation, providers, failures]"

fail() { printf 'doctor test: %s\n' "$*" >&2; exit 1; }
has() { grep -Fq -- "$2" "$1" || fail "$1 lacks $2"; }
reject() {
  if "$EMIT" doctor "$@" >"$TMP/out" 2>"$TMP/err"; then
    fail "unexpected success: doctor $*"
  fi
  [ ! -s "$TMP/out" ] || fail "usage error wrote a report"
  has "$TMP/err" "emit doctor:"
}
reject --bogus
reject input.scm
reject --manifest
for option in --help -h; do
  "$EMIT" doctor "$option" >"$TMP/help" 2>"$TMP/err"
  [ ! -s "$TMP/err" ] || fail "help wrote stderr"
  "$EMIT" help doctor >"$TMP/routed"
  cmp "$TMP/help" "$TMP/routed"
done
has "$TMP/help" "--library-path"

# Native inputs come from the same configuration that built this binary.
cc="$(sed -n 's/^CC := //p' build/llvm.mk)"
llvm_config="$(sed -n 's/^LLVM_CONFIG := //p' build/llvm.mk)"
gc_inc="$(sed -n 's/^GC_INC := //p' build/llvm.mk)"
gc_lib="$(sed -n 's/^GC_LIB := //p' build/llvm.mk)"
export CC="$cc" GC_INC="$gc_inc" GC_LIB="$gc_lib"
mkdir -p "$TMP/project/lib" "$TMP/first" "$TMP/second" "$TMP/environment"
printf '()\n' >"$TMP/project/emit-libs.scm"
cd "$TMP/project"
for level in quiet default verbose; do
  EMIT_VERBOSITY="$level" EMIT_LIBRARY_PATH="$TMP/environment" \
    "$EMIT" doctor -L "$TMP/first" --library-path "$TMP/second" \
    >"$TMP/$level" 2>"$TMP/$level.err" || fail "healthy doctor at $level"
done
cmp "$TMP/quiet" "$TMP/default"
cmp "$TMP/quiet" "$TMP/verbose"
[ ! -s "$TMP/quiet.err" ] || fail "quiet emitted narration"
has "$TMP/quiet" "result: ok"
has "$TMP/quiet" "override CC"
has "$TMP/quiet" "provider 1: manifest emit-libs.scm [project]"
has "$TMP/quiet" "provider 2: directory $TMP/first [command line; available]"
has "$TMP/quiet" "provider 3: directory $TMP/second [command line; available]"
has "$TMP/quiet" "provider 4: directory $TMP/environment [EMIT_LIBRARY_PATH; available]"
[ ! -e build ] || fail "doctor wrote a project build/cache directory"

"$EMIT" doctor --no-library-paths --no-manifest-chain >"$TMP/disabled" 2>"$TMP/err"
has "$TMP/disabled" "directory providers: disabled"
has "$TMP/disabled" "manifest chain: disabled"
if grep -q '^provider .*: directory ' "$TMP/disabled"; then fail "disabled roots reported as effective"; fi

if EMIT_LIBRARY_PATH=":$TMP/environment" "$EMIT" doctor >"$TMP/out" 2>"$TMP/err"; then
  fail "accepted empty environment root"
fi
has "$TMP/out" "providers: incomplete"
has "$TMP/err" "empty element"
if "$EMIT" doctor --manifest "$TMP/absent" >"$TMP/out" 2>"$TMP/err"; then
  fail "accepted missing explicit manifest"
fi
has "$TMP/out" "providers: incomplete"
has "$TMP/out" "libgc library:"

printf '((library\n' >"$TMP/malformed.scm"
if "$EMIT" doctor --manifest "$TMP/malformed.scm" >"$TMP/out" 2>"$TMP/err"; then
  fail "accepted malformed manifest"
fi
has "$TMP/err" "$TMP/malformed.scm"
has "$TMP/out" "providers: incomplete"
has "$TMP/out" "installed candidate:"
has "$TMP/out" "result: failed"

if CC="$TMP/no-compiler" GC_INC="$TMP/no-headers" GC_LIB="$TMP/no-library" \
   "$EMIT" doctor >"$TMP/out" 2>"$TMP/err"; then fail "accepted absent native inputs"; fi
has "$TMP/out" "cc version: unavailable"
has "$TMP/out" "libgc version: unknown"
has "$TMP/out" "provider 1:"
has "$TMP/err" "libgc header unavailable"
has "$TMP/err" "libgc link library unavailable"

# A filename with shell metacharacters must be treated as one executable path.
old_cc="$TMP/old clang's version"
printf '#!/bin/sh\nprintf "clang version 1.0.0\\n"\n' >"$old_cc"
chmod +x "$old_cc"
if CC="$old_cc" "$EMIT" doctor >"$TMP/out" 2>"$TMP/err"; then fail "accepted older clang"; fi
has "$TMP/err" "older than build-time LLVM"
has "$TMP/out" "cc version: clang version 1.0.0"

printf '#!/bin/sh\nexec sleep 30\n' >"$TMP/stuck-compiler"
chmod +x "$TMP/stuck-compiler"
probe_started=$SECONDS
if CC="$TMP/stuck-compiler" "$EMIT" doctor >"$TMP/out" 2>"$TMP/err"; then fail "accepted stalled compiler"; fi
[ "$((SECONDS - probe_started))" -lt 12 ] || fail "compiler version probe was not bounded"
has "$TMP/out" "provider 1:"

# Explicit invalid toolchain overrides must remain failures rather than being
# silently replaced by the compiled defaults.
if env -u CC -u GC_INC -u GC_LIB -u EMIT_GC_INC -u EMIT_GC_LIB \
  LLVM_CONFIG="$TMP/no-llvm-config" EMIT_LLVM_BIN= \
  "$EMIT" doctor >"$TMP/out" 2>"$TMP/err"; then fail "ignored invalid LLVM_CONFIG"; fi
has "$TMP/err" "LLVM_CONFIG=$TMP/no-llvm-config"

# A copied binary away from both checkout and prefix cannot claim its payload is
# healthy. This also exercises continued reporting after absent support files.
mkdir -p "$TMP/detached/bin"
cp "$EMIT" "$TMP/detached/bin/emit"
mkdir -p "$TMP/detached/src/runtime/runtime.c"
if "$TMP/detached/bin/emit" doctor >"$TMP/out" 2>"$TMP/err"; then fail "accepted missing payload"; fi
has "$TMP/err" "shipped payload missing:"
has "$TMP/out" "support src/runtime/runtime.c: missing"
has "$TMP/err" "required support file missing: src/runtime/runtime.c"
# Without a discovery script or overrides the native values come from the
# compiled-default tier, even while the separate payload checks fail.
if env -u CC -u GC_INC -u GC_LIB -u EMIT_GC_INC -u EMIT_GC_LIB \
  "$TMP/detached/bin/emit" doctor >"$TMP/fallback" 2>"$TMP/err"; then fail "accepted detached payload"; fi
has "$TMP/fallback" "[compiled default]"

# A failed discovery script need not mean that the LLVM override is invalid:
# a later dependency check may fail. Valid LLVM selection still permits native
# compiled fallback, while payload failures remain independent.
mkdir -p "$TMP/detached/tools"
printf '#!/bin/sh\nexit 1\n' >"$TMP/detached/tools/llvm-env.sh"
chmod +x "$TMP/detached/tools/llvm-env.sh"
env -u CC -u GC_INC -u GC_LIB -u EMIT_GC_INC -u EMIT_GC_LIB \
  LLVM_CONFIG="$llvm_config" EMIT_LLVM_BIN= \
  "$TMP/detached/bin/emit" doctor >"$TMP/valid-anchor" 2>"$TMP/err" || true
has "$TMP/valid-anchor" "[compiled default]"
if grep -q 'unusable toolchain override' "$TMP/err"; then fail "misdiagnosed valid LLVM anchor"; fi
say "test doctor -> passed  [$((SECONDS - started))s]"
