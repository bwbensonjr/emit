#!/usr/bin/env bash
# hybrid-library-resolution-chez-tests.sh -- bootstrap-driver resolver parity.
set -u
cd "$(dirname "$0")/.."

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
mkdir -p "$TMP/lib/example/net"
printf '()\n' > "$TMP/manifest.scm"
cat > "$TMP/lib/example/net/2.sld" <<'EOF'
(define-library (example net 2)
  (import (scheme base))
  (export numbered)
  (begin (define numbered 2)))
EOF
cat > "$TMP/main.scm" <<'EOF'
(import (example net 2))
(display numbered)
EOF

pass=0
fail=0
for backend in aot jit bitcode; do
  out="$TMP/app-$backend"
  args=("$TMP/main.scm" -o "$out" --manifest "$TMP/manifest.scm"
        -L "$TMP/lib" -L "$PWD/lib")
  [ "$backend" = "aot" ] || args+=(--backend "$backend")
  if [ "$backend" = "jit" ]; then
    got="$(chez --libdirs src --script src/compile.ss "${args[@]}" 2>"$TMP/$backend.err")"
    rc=$?
  else
    chez --libdirs src --script src/compile.ss "${args[@]}" \
      >"$TMP/$backend.log" 2>"$TMP/$backend.err"
    rc=$?
    got="$("$out" 2>/dev/null)"
  fi
  if [ "$rc" -eq 0 ] && [ "$got" = "2" ]; then
    echo "  [OK  ] Chez $backend resolves (example net 2)"
    pass=$((pass + 1))
  else
    echo "  [FAIL] Chez $backend resolution => [$got] (exit $rc)"
    sed 's/^/         /' "$TMP/$backend.err"
    fail=$((fail + 1))
  fi
done

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ]
