#!/usr/bin/env bash
# Generate the declared standard-library partition with the shared portable body.
# Usage: bash tools/gen-scheme-base.sh [OUT-ROOT] [--host emit|chez]
#   [--prelude PATH] [--declaration PATH] [--output-root PATH] [-q|-v]
# EMIT_BINARY and CHEZ select the host executables. No Chez is needed by default.
set -eu
cd "$(dirname "$0")/.."
prelude=src/prelude.scm
declaration=src/prelude-surface.scm
out_root=.
host=emit
while [ "$#" -gt 0 ]; do
  case "$1" in
    --host|--prelude|--declaration|--output-root)
      [ "$#" -ge 2 ] || { echo "gen-scheme-base: missing argument for $1" >&2; exit 2; }
      case "$1" in
        --host) host="$2" ;;
        --prelude) prelude="$2" ;;
        --declaration) declaration="$2" ;;
        --output-root) out_root="$2" ;;
      esac
      shift 2 ;;
    -q) export EMIT_VERBOSITY=quiet; shift ;;
    -v) export EMIT_VERBOSITY=verbose; shift ;;
    --help|-h)
      echo "Usage: bash tools/gen-scheme-base.sh [OUT-ROOT] [--host emit|chez] [--prelude PATH] [--declaration PATH] [--output-root PATH] [-q|-v]"
      exit 0 ;;
    -*) echo "gen-scheme-base: unknown option $1" >&2; exit 2 ;;
    *) out_root="$1"; shift ;;
  esac
done
. tools/log.sh
case "$host" in emit|chez) ;; *) echo "gen-scheme-base: unknown host $host" >&2; exit 2 ;; esac
[ -f "$prelude" ] || { echo "gen-scheme-base: missing prelude $prelude" >&2; exit 1; }
[ -f "$declaration" ] || { echo "gen-scheme-base: missing declaration $declaration" >&2; exit 1; }
gen_tmp=$(mktemp -d)
trap 'rm -rf "$gen_tmp"' EXIT
# The declaration is compiled as source, never interpreted by a separate evaluator.
# Validation/list mode evaluates the selected declaration before shell directory
# preparation, so computed destinations work identically to literal destinations.
case "$host" in
  emit) echo '(import (scheme base) (scheme read) (scheme file) (scheme process-context) (scheme cxr) (emit list))' > "$gen_tmp/generate.scm" ;;
  chez) printf '%s\n' '(import (chezscheme))' '(define get-environment-variable getenv)' > "$gen_tmp/generate.scm" ;;
esac
cat >> "$gen_tmp/generate.scm" <<'SCM'
(define gen-args (cdr (command-line)))
(define prelude-path (car gen-args))
(define out-root (cadr gen-args))
(define gen-plan? (string=? (caddr gen-args) "plan"))
(define gen-verbosity (get-environment-variable "EMIT_VERBOSITY"))
(define gen-quiet? (if (member gen-verbosity '("quiet" "q" "0")) #t #f))
SCM
cat "$declaration" tools/gen-scheme-base-body.ss >> "$gen_tmp/generate.scm"
say "generate partition $prelude + $declaration -> $out_root [$host]"
gen_started=$SECONDS
case "$host" in
  emit)
    generator_run() { EMIT_VERBOSITY=quiet "${EMIT_BINARY:-build/emit}" run "$gen_tmp/generate.scm" "$prelude" "$out_root" "$1"; } ;;
  chez)
    generator_run() { EMIT_VERBOSITY=quiet "${CHEZ:-chez}" --script "$gen_tmp/generate.scm" "$prelude" "$out_root" "$1"; } ;;
esac
generator_run plan > "$gen_tmp/paths"
mkdir -p "$out_root"
while IFS= read -r path; do
  [ -z "$path" ] || mkdir -p "$out_root/$(dirname "$path")"
done < "$gen_tmp/paths"
generator_run generate
gen_count=0
gen_bytes=0
while IFS= read -r path; do
  gen_size=$(bytes "$out_root/$path")
  gen_count=$((gen_count + 1))
  gen_bytes=$((gen_bytes + gen_size))
  vsay "generate $prelude -> $out_root/$path [$gen_size bytes]"
done < "$gen_tmp/paths"
say "generate partition -> $out_root [$gen_count members, $gen_bytes bytes, $((SECONDS - gen_started))s]"
