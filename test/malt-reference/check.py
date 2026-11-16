#!/usr/bin/env python3
"""Verify Malt reference provenance and optionally compare the pinned Racket host."""
import argparse
import hashlib
import json
import io
import os
from pathlib import Path
import re
import subprocess
import sys
import tarfile
import tempfile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent.parent


def datum(text):
    tokens = iter(re.findall(r"[()]|[^\s()]+", re.sub(r";[^\n]*", "", text)))
    def read(token):
        if token != "(":
            return token
        result = []
        for item in tokens:
            if item == ")":
                return result
            result.append(read(item))
        raise ValueError("unclosed datum")
    return read(next(tokens))


def narrate(message):
    if os.environ.get("EMIT_VERBOSITY", "").lower() not in {"quiet", "q", "0"}:
        print(message, file=sys.stderr)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--upstream", type=Path, help="explicitly verify pinned checkout and regenerate Racket fixtures")
    args = parser.parse_args()
    manifest = json.loads((HERE / "upstream.json").read_text())
    exports = json.loads((HERE / "export-map.json").read_text())
    facade = datum((ROOT / "lib/malt/learner.sld").read_text())
    declaration = next(form for form in facade if isinstance(form, list) and form[0] == "export")
    names = [entry[2] if isinstance(entry, list) else entry for entry in declaration[1:]]
    assert len(names) == len(set(names)), "duplicate facade exports"
    assert set(names) == set(exports), "facade export inventory differs from pinned mapping"
    assert (ROOT / "lib/malt/LICENSE").read_text().startswith("MIT License\n")
    suite = (ROOT / "test/malt-training.scm").read_text()
    inline = suite.split("(define reference\n", 1)[1].split("\n(define (expected", 1)[0]
    assert inline == "  '" + (HERE / "expected.scm").read_text().strip() + ")", "training suite fixtures differ from independent reference"
    subprocess.run([sys.executable, str(HERE / "xor-reference.py"), "--check"], check=True)
    if args.upstream:
        upstream = args.upstream.resolve()
        revision = subprocess.check_output(["git", "-C", str(upstream), "rev-parse", "HEAD"], text=True).strip()
        assert revision == manifest["revision"], "unexpected Malt revision"
        for name, digest in manifest["files"].items():
            assert hashlib.sha256((upstream / name).read_bytes()).hexdigest() == digest, name
        archive = subprocess.check_output(["git", "-C", str(upstream), "archive", revision])
        with tempfile.TemporaryDirectory(prefix="emit-malt-reference-") as temporary:
            clean = Path(temporary) / "malt"
            clean.mkdir()
            with tarfile.open(fileobj=io.BytesIO(archive)) as packaged:
                packaged.extractall(clean, filter="data")
            environment = dict(os.environ, MALT_SOURCE=str(clean), MALT_PREFERENCES=str(HERE / "learner.cfg"))
            for script, expected in [("fixtures.rkt", "expected.scm"), ("xor.rkt", "xor-expected.scm")]:
                result = subprocess.run(["racket", str(HERE / script)], env=environment, capture_output=True)
                if result.returncode:
                    sys.stderr.buffer.write(result.stderr)
                    raise SystemExit(f"{script} failed in clean pinned git archive")
                assert result.stdout == (HERE / expected).read_bytes(), f"{script} output differs"
        narrate(f"verify Malt reference host [{revision}, {len(manifest['files'])} upstream hashes, 2 fixture adapters]")
    narrate(f"verify Malt reference artifacts [{len(exports)} exports, independent XOR input schedule]")


if __name__ == "__main__":
    main()
