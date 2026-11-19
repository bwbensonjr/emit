# Verification

## Focused acceptance

The change adds 28 aliases while preserving the 156 existing public exports.
The notation fixture contains 48 assertions covering procedure and syntax
binding identity, lambda formal arguments and lexical scope, import modifiers,
library re-exports, numerical results, and quoted notation. The focused runner
also rejects the two upstream unimplemented extension-gradient exports.

Commands:

```sh
bash tools/test.sh --suite malt-core --suite malt-core-source \
  --suite malt-training --suite malt-training-source --suite malt-installed \
  --jobs 2 --report /tmp/emit-malt-notation-validation.json
python3 test/malt-reference/check.py
bash tools/format.sh --check --files lib/malt/learner.sld
git diff --check
```

All five selected suites passed: native and source Malt core, native and source
Malt training, and installed-library acceptance. The installed checks also pass
the 48-assertion notation fixture under run, REPL, and standalone execution.
The export provenance check, formatter gate, and whitespace check passed.

The source compiler and native compiler both exercise the ordinary facade;
no assembled compiler inputs changed and no regeneration was required.
The native runner labels bootstrap feedback as committed-bootstrap-only because
the existing local regeneration fingerprint does not match; the independent
source-driven Malt suites additionally test the current Scheme compiler source.

## Little-learning integration

From the Emit repository root:

```sh
UV_CACHE_DIR=/tmp/emit-notation-uv-cache \
LL_EMIT_BIN="$PWD/build/emit" LL_EMIT_LIBRARY_PATH="$PWD/lib" \
uv run --no-sync --directory ../little-learning python - <<'PY'
from app.runtimes.emit import run_emit
result = run_emit("", "(∇ (λ (x) (* x x)) 3.0)", ["(malt learner)"], timeout=120)
print(result)
assert result[0] and result[1].strip() == "6.0", result
PY
```

Observed result: `(True, '6.0\n', '')`. No little-learning files were changed.
Use an Emit installation containing the updated facade, or point
`LL_EMIT_LIBRARY_PATH` at this checkout's `lib`, to use these spellings in the
application.

## Ubuntu LLVM 23 CI follow-up

The initial PR run failed `module-scaffold-byte-identity`: only the `malt-xor`
demo's raw IR hash changed, from
`c582d2a124b3f25b3d6fd57878abfda46d7821d14e163cae571af7567d82f36c` to
`79e9eb759e412eb75c5cd63ef47d3ac04516036744aa463c45ea491fba8c1602`.
All Malt behavior suites passed in that job.

A before/after capture using the same native compiler and the old/new facade
showed that the only difference was the ordering of existing external-global
declarations; their multiset and every other IR line were unchanged. Exporting
the aliases after the existing ASCII inventory restores the original raw IR
byte-for-byte. The committed baseline remains unchanged.

Follow-up validation:

```sh
bash tools/test.sh --suite module-scaffold-byte-identity \
  --suite malt-core --suite malt-core-source --jobs 2 \
  --report /tmp/emit-pr197-fix-validation.json
```

All three follow-up suites passed. The complete demo guard verifies all 83
recorded hashes, and the native/source Malt suites retain all notation checks.
The export provenance and formatter checks passed again.
