#!/usr/bin/env bash
# Source after tools/log.sh. Keep cold library setup outside hang assertions.
prepare_repl_cache() {
  local setup_log="$1/repl-setup.log" started=$SECONDS status=0
  local limiter=()
  if command -v timeout >/dev/null 2>&1; then
    limiter=(timeout 180)
  elif command -v gtimeout >/dev/null 2>&1; then
    limiter=(gtimeout 180)
  fi
  say "test: prepare build/emit repl -> private library cache"
  "${limiter[@]}" build/emit repl </dev/null >"$setup_log" 2>&1 || status=$?
  if [ "$status" -ne 0 ]; then
    printf 'test: REPL cache setup failed [exit %s, %ss]\n' "$status" "$((SECONDS-started))" >&2
    sed 's/^/  /' "$setup_log" >&2
    return "$status"
  fi
  say "test: prepare build/emit repl -> private library cache [$((SECONDS-started))s]"
}
