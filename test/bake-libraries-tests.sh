#!/usr/bin/env bash
# Exercise the baker's declaration layout and command-line contracts without LLVM.
set -eu
cd "$(dirname "$0")/.."
exec python3 - <<'PY'
from pathlib import Path
import os
import shutil
import subprocess
import sys
import tempfile

root = Path.cwd()
work = Path(tempfile.mkdtemp(prefix="emit-baker-tests-"))
source = (root / "src/prelude-surface.scm").read_text()
needle = '((scheme base) #t ((emit internal)) "lib/scheme/base.sld")'
wrapped = '((scheme base) #t ((emit internal))\n      "lib/scheme/base.sld")'
if source.count(needle) != 1:
    sys.exit("baker tests: expected exactly one base partition row")
(work / "surface.scm").write_text(source.replace(needle, wrapped))
failures = []

def run(name, arguments):
    result = subprocess.run(
        ["bash", os.environ.get("BAKER", "tools/bake-libraries.sh"), *arguments],
        cwd=root, env=dict(os.environ, EMIT_VERBOSITY="quiet"), capture_output=True,
    )
    (work / f"{name}.stdout").write_bytes(result.stdout)
    (work / f"{name}.stderr").write_bytes(result.stderr)
    (work / f"{name}.status").write_text(str(result.returncode) + "\n")
    return result

baseline = run("ordinary", [str(root), str(work / "ordinary.scm")])
result = run("wrapped", [str(root), str(work / "wrapped.scm"), "--declaration", str(work / "surface.scm")])
if baseline.returncode or result.returncode:
    failures.append("ordinary and wrapped partition rows must both bake successfully")
elif (work / "ordinary.scm").read_bytes() != (work / "wrapped.scm").read_bytes():
    failures.append("wrapping a partition row changed the baked library set or bytes")
result = run("help", ["--help"])
if result.returncode or b"Usage:" not in result.stdout or result.stderr:
    failures.append("--help must write usage to stdout and exit zero without stderr")
result = run("unknown-option", [str(root), str(work / "unknown.scm"), "--guard-unknown-option"])
if result.returncode == 0 or b"--guard-unknown-option" not in result.stderr or result.stdout:
    failures.append("an unknown option must fail, name the option on stderr, and leave stdout empty")
for failure in failures:
    print("FAIL baker: " + failure, file=sys.stderr)
print(f"baker contracts: {3 - len(failures)}/3 passed", file=sys.stderr)
if failures:
    print(f"baker reports -> {work}", file=sys.stderr)
    sys.exit(1)
shutil.rmtree(work)
PY
