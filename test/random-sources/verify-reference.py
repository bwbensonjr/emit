#!/usr/bin/env python3
"""Verify pinned upstream bytes and the independent Python fixture oracle."""
import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parent


def narrate(message):
    if os.environ.get("EMIT_VERBOSITY", "default") not in ("quiet", "q", "0"):
        print(message, file=sys.stderr)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--upstream", action="store_true", help="also run pristine upstream under Chez")
    args = parser.parse_args()
    for line in (ROOT / "upstream.sha256").read_text().splitlines():
        digest, name = line.split("  ", 1)
        if hashlib.sha256((ROOT / name).read_bytes()).hexdigest() != digest:
            raise SystemExit(f"SRFI 27 upstream digest mismatch: {name}")
    subprocess.run([sys.executable, str(ROOT / "reference.py"), "--check"], check=True)
    if args.upstream:
        chez = shutil.which("chez")
        if not chez:
            raise SystemExit("explicit upstream SRFI 27 reference verification requires Chez")
        prelude = """(import (chezscheme))
(define (:random-source-make . args) (list->vector args))
(define (:random-source? x) (and (vector? x) (= (vector-length x) 6)))
(define (:random-source-state-ref x) (vector-ref x 0))
(define (:random-source-state-set! x) (vector-ref x 1))
(define (:random-source-randomize! x) (vector-ref x 2))
(define (:random-source-pseudo-randomize! x) (vector-ref x 3))
(define (:random-source-make-integers x) (vector-ref x 4))
(define (:random-source-make-reals x) (vector-ref x 5))
(define (:random-source-current-time) 0)
"""
        prelude += f'(load "{ROOT / "upstream/mrg32k3a-a.scm"}")\n'
        prelude += f'(load "{ROOT / "upstream/mrg32k3a.scm"}")\n'
        fixtures = json.loads((ROOT / "known-answers.json").read_text())
        for case in fixtures["cases"]:
            i, j = case["seed"]
            expected = " ".join(map(str, case["state"]))
            cores = " ".join(map(str, case["core"]))
            prelude += f"""(let ((state (mrg32k3a-pseudo-randomize-state {i} {j})))
  (unless (equal? (vector->list state) '({expected})) (error 'reference "jump mismatch"))
  (let ((got (let loop ((n 8) (out '()))
               (if (= n 0) (reverse out) (loop (- n 1) (cons (mrg32k3a-random-m1 state) out))))))
    (unless (equal? got '({cores})) (error 'reference "core mismatch"))))
"""
        prelude += '(display "upstream-reference-complete\\n")\n'
        with tempfile.TemporaryDirectory(prefix="emit-srfi-27-reference-") as tmp:
            path = Path(tmp) / "check.ss"
            path.write_text(prelude)
            result = subprocess.run([chez, "--script", str(path)], check=True, capture_output=True, text=True)
            if result.stdout != "upstream-reference-complete\n":
                raise SystemExit("missing upstream reference completion marker")
        narrate("verify pristine SRFI 27 -> independent oracle [5 stream/core fixtures]")


if __name__ == "__main__":
    main()
