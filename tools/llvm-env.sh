#!/usr/bin/env bash
# llvm-env.sh -- shared LLVM + libgc toolchain discovery (change: allow-llvm-install-flexibility).
#
# THE MODEL: the project needs a recent LLVM discoverable via `llvm-config` plus Boehm libgc.
# This is the SINGLE place that decides where those live, so the Makefile and every shell driver
# resolve the same toolchain instead of each hardcoding a Homebrew keg path.  Explicit environment
# overrides win at every step; discovery only supplies defaults.
#
# Two ways to use it:
#   . tools/llvm-env.sh || exit 1    # SOURCE it: exports CC/CXX/LLVM_CONFIG/CXXFLAGS/LDFLAGS/
#                                    #   GC_INC/GC_LIB/GC_DYLIB and the EMIT_LLVM_* mirrors below.
#                                    #   On failure it `return`s non-zero, so pair it with `|| exit 1`
#                                    #   (a sourced script cannot force its caller to stop otherwise).
#   tools/llvm-env.sh --print-make   # EXECUTE it: emit Make-syntax `VAR := value` on stdout
#                                    #   (narration still goes to stderr) for the Makefile to -include.
#
# Overrides (each takes precedence over discovery):
#   LLVM_CONFIG     an explicit llvm-config (name on PATH or absolute path)
#   EMIT_LLVM_BIN   an explicit LLVM tool directory (the Chez driver's override; honored here too)
#   CC / CXX        explicit C / C++ compilers
#   GC_INC / GC_LIB / GC_DYLIB   explicit libgc include dir / lib dir / shared-object path
#   EMIT_LLVM_MIN   minimum tested LLVM major version (default 22; warn-only below it)
#
# Between the overrides and discovery sits an installed package's toolchain pin,
# ../package/toolchain.env (section 0); --print-env reports which one chose LLVM as
# EMIT_TOOLCHAIN_ORIGIN=override|package|discovery.
#
# The EMIT_LLVM_* mirrors (EMIT_LLVM_BIN/EMIT_GC_INC/EMIT_GC_LIB/EMIT_GC_DYLIB) are the override
# interface consumed by the Chez driver src/compile.ss, which cannot source this shell layer.

# Are we being sourced (return works) or executed (return fails -> exit)?
_llvm_env_sourced=0
(return 0 2>/dev/null) && _llvm_env_sourced=1
# Fatal error: print, then abort in the right way for the calling context.  MUST be used as
#   { _llvm_env_die "msg"; return 1 2>/dev/null || exit 1; }
# at the top level (a brace group runs in the current scope, so `return` leaves the sourced
# script; a helper function's own `return` would only leave the helper).
_llvm_env_die() { printf 'llvm-env: %s\n' "$1" >&2; }

# say/vsay/bytes + EMIT_VERBOSITY (see docs/OUTPUT.md); safe to re-source.
_llvm_env_dir=$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]:-$0}")" && pwd)
. "$_llvm_env_dir/log.sh"

# Choose among known-prefix candidates by the versions they report. The path is a
# deterministic tie-breaker only; formula and directory names do not imply versions.
_llvm_select_newest_config() {
  local c version selected
  selected=$(
    for c in "$@"; do
      [ -x "$c" ] || continue
      version=$("$c" --version 2>/dev/null) || continue
      [ -n "$version" ] || continue
      version=${version%%$'\n'*}
      printf '%s\t%s\n' "$version" "$c"
    done \
      | LC_ALL=C sort -t $'\t' -k1,1V -k2,2 \
      | tail -n1 \
      | cut -f2-
  )
  [ -n "$selected" ] || return 1
  printf '%s\n' "$selected"
}

# Discover an llvm-config with no override applied: PATH, then version-suffixed newest-first, then
# known install prefixes (apt, Apple-silicon Homebrew, Intel Homebrew) by reported version. Private
# arguments let the regression suite replace only the final candidate set.
_llvm_discover_config() {
  local c n
  c=$(command -v llvm-config 2>/dev/null || true); [ -n "$c" ] && { printf '%s\n' "$c"; return 0; }
  for n in 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15; do
    c=$(command -v "llvm-config-$n" 2>/dev/null || true); [ -n "$c" ] && { printf '%s\n' "$c"; return 0; }
  done
  if [ "$#" -gt 0 ]; then
    _llvm_select_newest_config "$@"
  else
    _llvm_select_newest_config \
      /usr/lib/llvm-*/bin/llvm-config \
      /opt/homebrew/opt/llvm@*/bin/llvm-config /opt/homebrew/opt/llvm/bin/llvm-config \
      /usr/local/opt/llvm@*/bin/llvm-config /usr/local/opt/llvm/bin/llvm-config
  fi
}

# --- 0. Package toolchain pin (change: low-cost-distribution-channels, design D1) ------------
# `make install TOOLCHAIN_PIN=1` records the toolchain a package was built with in
# share/emit/package/toolchain.env, beside this script's own tools/ directory.  A checkout has no
# package/ directory, so a source build never sees one.  The file is PARSED, never sourced: only
# the known keys below are read.  Precedence is explicit environment > pin > discovery; the pin's
# LLVM directory and CC apply only when no LLVM override is set, its libgc values per value.
_llvm_pin_file="$_llvm_env_dir/../package/toolchain.env"
_llvm_pin=""
_pin_major="" _pin_bin="" _pin_cc="" _pin_gc_inc="" _pin_gc_lib="" _pin_gc_dylib=""
if [ -f "$_llvm_pin_file" ]; then
  _llvm_pin="$(CDPATH= cd -- "$(dirname -- "$_llvm_pin_file")" && pwd -P)/toolchain.env"
  while IFS= read -r _l || [ -n "$_l" ]; do
    case "$_l" in
      EMIT_LLVM_MAJOR=*) _pin_major=${_l#*=} ;;
      EMIT_LLVM_BIN=*)   _pin_bin=${_l#*=} ;;
      CC=*)              _pin_cc=${_l#*=} ;;
      GC_INC=*)          _pin_gc_inc=${_l#*=} ;;
      GC_LIB=*)          _pin_gc_lib=${_l#*=} ;;
      GC_DYLIB=*)        _pin_gc_dylib=${_l#*=} ;;
    esac
  done < "$_llvm_pin_file"
fi

# The major a clang reports ("clang version 22.1.8", "Ubuntu clang version 22.1.2 (...)").
_llvm_clang_major() {
  "$1" --version 2>/dev/null | sed -n '1s/.*clang version \([0-9][0-9]*\).*/\1/p'
}

# --- 1. Resolve the LLVM tool directory (LLVM_BIN) and an llvm-config for flags -------------
_llvm_override=""
EMIT_TOOLCHAIN_ORIGIN=discovery
if [ -n "${EMIT_LLVM_BIN:-}" ] || [ -n "${LLVM_CONFIG:-}" ]; then EMIT_TOOLCHAIN_ORIGIN=override; fi
if [ -n "$_llvm_pin" ] && [ "$EMIT_TOOLCHAIN_ORIGIN" = discovery ]; then
  # A package pin that cannot deliver its recorded LLVM major fails here, naming the file:
  # silently falling through to discovery would link with a toolchain the package never declared.
  [ -n "$_pin_major" ] && [ -n "$_pin_bin" ] && [ -n "$_pin_cc" ] \
    || { _llvm_env_die "toolchain pin $_llvm_pin is incomplete (needs EMIT_LLVM_MAJOR, EMIT_LLVM_BIN, CC)"; return 1 2>/dev/null || exit 1; }
  [ -x "$_pin_cc" ] \
    || { _llvm_env_die "toolchain pin $_llvm_pin names CC=$_pin_cc, which is not executable (reinstall the package, or set EMIT_LLVM_BIN / CC to override)"; return 1 2>/dev/null || exit 1; }
  _pin_cc_major=$(_llvm_clang_major "$_pin_cc")
  [ "$_pin_cc_major" = "$_pin_major" ] \
    || { _llvm_env_die "toolchain pin $_llvm_pin expects LLVM $_pin_major but $_pin_cc reports '${_pin_cc_major:-no clang version}' (reinstall the package, or set EMIT_LLVM_BIN / CC to override)"; return 1 2>/dev/null || exit 1; }
  EMIT_TOOLCHAIN_ORIGIN=package
  LLVM_BIN=${_pin_bin%/}
  [ -x "$LLVM_BIN/llvm-config" ] && LLVM_CONFIG="$LLVM_BIN/llvm-config"
  CC=${CC:-$_pin_cc}
elif [ -n "${EMIT_LLVM_BIN:-}" ]; then
  _llvm_override="EMIT_LLVM_BIN"
  LLVM_BIN=${EMIT_LLVM_BIN%/}
  [ -z "${LLVM_CONFIG:-}" ] && [ -x "$LLVM_BIN/llvm-config" ] && LLVM_CONFIG="$LLVM_BIN/llvm-config"
elif [ -n "${LLVM_CONFIG:-}" ]; then
  _llvm_override="LLVM_CONFIG"
  if [ ! -x "${LLVM_CONFIG}" ]; then LLVM_CONFIG=$(command -v "$LLVM_CONFIG" 2>/dev/null || true); fi
  [ -n "${LLVM_CONFIG:-}" ] && [ -x "${LLVM_CONFIG}" ] \
    || { _llvm_env_die "LLVM_CONFIG override is not an executable llvm-config (unset it to auto-discover)"; return 1 2>/dev/null || exit 1; }
  LLVM_BIN=$("$LLVM_CONFIG" --bindir 2>/dev/null || true)
else
  LLVM_CONFIG=$(_llvm_discover_config || true)
  [ -n "${LLVM_CONFIG:-}" ] \
    || { _llvm_env_die "no llvm-config on PATH or in known prefixes; install LLVM (apt: 'llvm clang', brew: 'llvm') or set LLVM_CONFIG / EMIT_LLVM_BIN"; return 1 2>/dev/null || exit 1; }
  LLVM_BIN=$("$LLVM_CONFIG" --bindir 2>/dev/null || true)
fi

# An explicit override must actually contain a clang -- fail clearly, naming the override.
if [ -n "$_llvm_override" ] && [ ! -x "${LLVM_BIN:-}/clang" ]; then
  _llvm_env_die "$_llvm_override points at '${LLVM_BIN:-}', which has no clang (check the path or unset it to auto-discover)"
  return 1 2>/dev/null || exit 1
fi

# --- 2. libgc: pkg-config bdw-gc, then prefix fallback --------------------------------------
GC_INC=${GC_INC:-${EMIT_GC_INC:-$_pin_gc_inc}}
GC_LIB=${GC_LIB:-${EMIT_GC_LIB:-$_pin_gc_lib}}
if [ -z "$GC_INC" ] || [ -z "$GC_LIB" ]; then
  if command -v pkg-config >/dev/null 2>&1 && pkg-config --exists bdw-gc 2>/dev/null; then
    [ -z "$GC_INC" ] && GC_INC=$(pkg-config --variable=includedir bdw-gc 2>/dev/null || true)
    [ -z "$GC_LIB" ] && GC_LIB=$(pkg-config --variable=libdir bdw-gc 2>/dev/null || true)
  fi
fi
if [ -z "$GC_INC" ] || [ -z "$GC_LIB" ]; then
  for _p in /opt/homebrew /usr/local /usr; do
    if [ -e "$_p/include/gc.h" ]; then
      [ -z "$GC_INC" ] && GC_INC="$_p/include"
      [ -z "$GC_LIB" ] && GC_LIB="$_p/lib"
      break
    fi
  done
fi
[ -n "$GC_INC" ] && [ -n "$GC_LIB" ] \
  || { _llvm_env_die "libgc (bdw-gc) not found; install it (apt: 'libgc-dev', brew: 'bdw-gc') or set GC_INC / GC_LIB"; return 1 2>/dev/null || exit 1; }

# Shared-object extension is platform-dependent: .dylib on macOS, .so elsewhere.
case "$(uname -s)" in Darwin) _gc_ext=dylib ;; *) _gc_ext=so ;; esac
GC_DYLIB=${GC_DYLIB:-${EMIT_GC_DYLIB:-${_pin_gc_dylib:-$GC_LIB/libgc.$_gc_ext}}}

# --- 3. Compilers + flags -------------------------------------------------------------------
# AOT/C compiler (D6): explicit CC wins; else use the override's clang; else prefer a system clang
# on PATH (keeps the current macOS "AOT uses Apple clang" default); else the discovered LLVM clang.
if [ -z "${CC:-}" ]; then
  if [ -n "$_llvm_override" ]; then CC="$LLVM_BIN/clang"
  elif command -v clang >/dev/null 2>&1; then CC="clang"
  else CC="$LLVM_BIN/clang"; fi
fi
# C++ host compiler MUST match the LLVM headers, so it always comes from the LLVM tool dir.
CXX=${CXX:-$LLVM_BIN/clang++}
# llvm-config prints --ldflags and --libs on separate lines; collapse newlines to spaces so the
# values stay single-line (safe both for the sourced shell and the -include'd Make fragment).
if [ -x "${LLVM_CONFIG:-}" ] || command -v "${LLVM_CONFIG:-}" >/dev/null 2>&1; then
  [ -z "${CXXFLAGS:-}" ] && CXXFLAGS="$("$LLVM_CONFIG" --cxxflags 2>/dev/null | tr '\n' ' ')${GC_INC:+ -I$GC_INC}"
  [ -z "${LDFLAGS:-}" ]  && LDFLAGS="$("$LLVM_CONFIG" --ldflags --libs orcjit native --system-libs 2>/dev/null | tr '\n' ' ')"
fi

# --- 4. Version floor (warn only) -----------------------------------------------------------
_llvm_ver=$("${LLVM_CONFIG:-}" --version 2>/dev/null || true)
[ -z "$_llvm_ver" ] && [ "$EMIT_TOOLCHAIN_ORIGIN" = package ] && _llvm_ver="$_pin_major (pinned)"
_llvm_major=${_llvm_ver%%.*}
_llvm_floor=${EMIT_LLVM_MIN:-22}
if [ -n "$_llvm_major" ] && [ "$_llvm_major" -lt "$_llvm_floor" ] 2>/dev/null; then
  say "llvm-env: warning: LLVM $_llvm_ver is below the tested floor $_llvm_floor (set EMIT_LLVM_MIN to change)"
fi

# --- 5. Export for shell consumers + the EMIT_LLVM_* mirrors for the Chez driver ------------
export CC CXX GC_INC GC_LIB GC_DYLIB
[ -n "${LLVM_CONFIG:-}" ] && export LLVM_CONFIG
[ -n "${CXXFLAGS:-}" ] && export CXXFLAGS
[ -n "${LDFLAGS:-}" ] && export LDFLAGS
export EMIT_LLVM_BIN="$LLVM_BIN" EMIT_GC_INC="$GC_INC" EMIT_GC_LIB="$GC_LIB" EMIT_GC_DYLIB="$GC_DYLIB"

# Narrate what was resolved (concise at default; per-var detail when verbose).
say  "llvm-env: $LLVM_BIN  (llvm ${_llvm_ver:-unknown})  libgc $GC_LIB"
[ "$EMIT_TOOLCHAIN_ORIGIN" = package ] && vsay "llvm-env:   toolchain pin $_llvm_pin"
vsay "llvm-env:   CC=$CC  CXX=$CXX"
vsay "llvm-env:   GC_INC=$GC_INC  GC_DYLIB=$GC_DYLIB"

# --- 6. Emit resolved values when executed (never while sourced) ----------------------------
# --print-env: KEY=VALUE lines consumed by the Chez driver (src/compile.ss), which cannot source
# this layer but shells out to it so discovery stays single-sourced.
if [ "$_llvm_env_sourced" = "0" ] && [ "${1:-}" = "--print-env" ]; then
  printf 'EMIT_LLVM_BIN=%s\n' "$LLVM_BIN"
  printf 'EMIT_GC_INC=%s\n'   "$GC_INC"
  printf 'EMIT_GC_LIB=%s\n'   "$GC_LIB"
  printf 'EMIT_GC_DYLIB=%s\n' "$GC_DYLIB"
  printf 'CC=%s\n'            "$CC"
  printf 'EMIT_TOOLCHAIN_ORIGIN=%s\n' "$EMIT_TOOLCHAIN_ORIGIN"
  [ -n "$_llvm_pin" ] && printf 'EMIT_TOOLCHAIN_PIN=%s\n' "$_llvm_pin"
fi
# --print-make: Make-syntax assignments for the Makefile to -include.
if [ "$_llvm_env_sourced" = "0" ] && [ "${1:-}" = "--print-make" ]; then
  printf 'LLVM_CONFIG := %s\n' "${LLVM_CONFIG:-}"
  printf 'LLVM_BIN := %s\n'    "$LLVM_BIN"
  printf 'CC := %s\n'          "$CC"
  printf 'CXX := %s\n'         "$CXX"
  printf 'GC_INC := %s\n'      "$GC_INC"
  printf 'GC_LIB := %s\n'      "$GC_LIB"
  printf 'GC_DYLIB := %s\n'    "$GC_DYLIB"
  printf 'CXXFLAGS := %s\n'    "${CXXFLAGS:-}"
  printf 'LDFLAGS := %s\n'     "${LDFLAGS:-}"
fi

: # keep a zero exit status for the sourcing shell (set -e safe)
