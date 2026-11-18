#!/usr/bin/env python3
"""Batch a short acceptance executable; report summed child CPU, including startup."""

import argparse
import hashlib
import json
import os
from pathlib import Path
import resource
import subprocess
import sys
import time


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("program", type=Path)
    parser.add_argument("iterations", type=int)
    args = parser.parse_args()
    if args.iterations < 1:
        parser.error("iterations must be positive")
    quiet = os.environ.get("EMIT_VERBOSITY", "default") in ("quiet", "q", "0")
    if not quiet:
        print(f"repeat {args.program} -> batch metrics [{args.iterations} child processes]", file=sys.stderr)
    before = resource.getrusage(resource.RUSAGE_CHILDREN)
    started = time.perf_counter()
    expected = None
    for _ in range(args.iterations):
        result = subprocess.run([str(args.program.resolve())], capture_output=True, check=True)
        if expected is None:
            expected = result.stdout
        if result.stdout != expected:
            raise RuntimeError("child output changed within batch")
    after = resource.getrusage(resource.RUSAGE_CHILDREN)
    cpu = after.ru_utime + after.ru_stime - before.ru_utime - before.ru_stime
    wall = time.perf_counter() - started
    if not quiet:
        print(f"measure {args.program} -> batch metrics [{cpu:.6f}s child CPU, {wall:.6f}s wall]", file=sys.stderr)
    print(json.dumps({
        "cpu_seconds": cpu,
        "wall_seconds": wall,
        "iterations": args.iterations,
        "output_digest": hashlib.sha256(expected).hexdigest(),
        "output_bytes": len(expected),
        "metric_scope": "sum of child process CPU; startup included; parent CPU excluded",
    }))


if __name__ == "__main__":
    try:
        main()
    except (OSError, RuntimeError, subprocess.CalledProcessError) as exc:
        print("process-repeat: " + str(exc), file=sys.stderr)
        sys.exit(1)
