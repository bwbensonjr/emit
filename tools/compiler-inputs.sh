#!/usr/bin/env bash
# Shared assembly order and regeneration-input inventory. Source this file from
# regeneration/reference checks; --list is the classifier/fingerprint interface.
CORE_FLAT="src/match.scm src/util.scm src/parse.ss \
src/passes/expand.ss src/passes/recognize-let.ss \
src/passes/convert-assignments.ss src/passes/simplify.ss \
src/passes/convert-closures.ss src/passes/lower.ss src/emit.ss \
src/prelude-surface.scm src/core.ss src/dump.ss src/include-reader.ss \
src/import-substrate.scm"
BAKED_LL="bootstrap/emit.internal.ll bootstrap/scheme.base.ll"
COMPILER_INPUTS="$CORE_FLAT src/prelude.scm src/repl-core.ss \
src/entry-schemec.scm src/entry-embed.scm src/entry-repl.scm \
tools/compiler-inputs.sh tools/regen.sh tools/gen-scheme-base.ss"

compiler_inputs_list () {
  printf '%s\n' $COMPILER_INPUTS
  # Generated partition members are declared by the compiler, not a second
  # hand-maintained library list. Read complete declaration, including imports.
  awk '
    !grab && /\(define \*prelude-libraries\*/ { grab = 1; depth = 0 }
    grab {
      line = $0; sub(/;.*/, "", line)
      if (match(line, /"[^"]+"/)) print substr(line, RSTART + 1, RLENGTH - 2)
      depth += gsub(/\(/, "(", line) - gsub(/\)/, ")", line)
      if (depth <= 0) grab = 0
    }' src/prelude-surface.scm
}

if [ "${BASH_SOURCE[0]}" = "$0" ]; then
  set -eu
  cd "$(dirname "$0")/.."
  . tools/log.sh
  case "${1:-}" in
    --list)
      [ "$#" = 1 ] || { echo "compiler-inputs: unexpected arguments" >&2; exit 2; }
      say "inspect compiler assembly and generator inputs -> stdout"
      compiler_inputs_list ;;
    --bootstrap)
      [ "$#" = 1 ] || { echo "compiler-inputs: unexpected arguments" >&2; exit 2; }
      printf '%s\n' $BAKED_LL bootstrap/embed.ll bootstrap/embed-repl.ll bootstrap/schemec.ll ;;
    --help|-h)
      [ "$#" = 1 ] || { echo "compiler-inputs: unexpected arguments" >&2; exit 2; }
      printf 'Usage: bash tools/compiler-inputs.sh --list | --bootstrap\n' ;;
    *) echo "compiler-inputs: expected --list (or --help)" >&2; exit 2 ;;
  esac
fi
