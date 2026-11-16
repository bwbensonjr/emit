#!/usr/bin/env python3
"""Prepare XOR data using the independent SRFI 27 oracle and scalar derivatives."""
import argparse
import hashlib
import importlib.util
import json
import math
import os
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location("random_reference", ROOT.parent / "random-sources/reference.py")
reference = importlib.util.module_from_spec(spec)
spec.loader.exec_module(reference)
XS = [(0.0, 0.0), (0.0, 1.0), (1.0, 0.0), (1.0, 1.0)]
YS = [0.0, 1.0, 1.0, 0.0]


def normal(source):
    u1, u2 = source.real(), source.real()
    return math.sqrt(-2.0 * math.log(u1)) * math.cos(2.0 * (4.0 * math.atan(1.0)) * u2)


def prepare(i, j):
    source = reference.RandomSource(i, j)
    first = [[normal(source) for _ in range(2)] for _ in range(8)]
    second = [[0.5 * normal(source) for _ in range(8)]]
    theta = [first, [0.0] * 8, second, [0.0]]
    schedule = [list(reversed([source.integer(4) for _ in range(4)])) for _ in range(4000)]
    return {"stream": [i, j], "alpha": 0.01, "revs": 4000, "batch_size": 4,
            "initial_theta": theta, "sample_schedule": schedule,
            "final_random_state": source.snapshot()}


def check_fixture(data, expected):
    # Box-Muller uses platform libm functions, whose final bits can differ.
    # Keep the stream, sampling schedule, and metadata exact; only the initial
    # floating-point weights allow rounding differences.
    def close(actual, reference):
        if isinstance(reference, list):
            return (isinstance(actual, list) and len(actual) == len(reference)
                    and all(close(a, b) for a, b in zip(actual, reference)))
        return (isinstance(actual, (int, float))
                and math.isfinite(actual)
                and math.isclose(actual, reference, rel_tol=1e-14, abs_tol=1e-15))

    assert close(data["initial_theta"], expected["initial_theta"]), "XOR initial weights differ"
    assert ({k: v for k, v in data.items() if k != "initial_theta"}
            == {k: v for k, v in expected.items() if k != "initial_theta"}), "XOR source stream fixture differs"


def train(data):
    first, bias1, second, bias2 = json.loads(json.dumps(data["initial_theta"]))
    weights2 = second[0]
    bias2 = bias2[0]
    for batch in data["sample_schedule"]:
        gw1, gb1, gw2, gb2 = [[0.0, 0.0] for _ in range(8)], [0.0] * 8, [0.0] * 8, 0.0
        for index in batch:
            x = XS[index]
            zs = [sum(w * value for w, value in zip(row, x)) + b for row, b in zip(first, bias1)]
            hidden = [max(z, 0.0) for z in zs]
            z = sum(w * value for w, value in zip(weights2, hidden)) + bias2
            delta = 2.0 * (max(z, 0.0) - YS[index]) if z >= 0.0 else 0.0
            gb2 += delta
            for unit in range(8):
                gw2[unit] += delta * hidden[unit]
                dh = delta * weights2[unit] if zs[unit] >= 0.0 else 0.0
                gb1[unit] += dh
                for axis in range(2):
                    gw1[unit][axis] += dh * x[axis]
        for unit in range(8):
            for axis in range(2):
                first[unit][axis] -= data["alpha"] * gw1[unit][axis]
            bias1[unit] -= data["alpha"] * gb1[unit]
            weights2[unit] -= data["alpha"] * gw2[unit]
        bias2 -= data["alpha"] * gb2
    return [max(sum(weights2[u] * max(sum(first[u][a] * x[a] for a in range(2)) + bias1[u], 0.0)
                    for u in range(8)) + bias2, 0.0) for x in XS]


def narrate(message):
    if os.environ.get("EMIT_VERBOSITY", "").lower() not in {"quiet", "q", "0"}:
        print(message, file=sys.stderr)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    path = ROOT / "xor-data.json"
    if args.check:
        data = json.loads(path.read_text())
        expected = prepare(*data["stream"])
        check_fixture(data, expected)
    else:
        for i in [42, 17, 1, 2, 3, 4, 5]:
            data = prepare(i, 0)
            predictions = train(data)
            if max(abs(a - b) for a, b in zip(predictions, YS)) < 0.1:
                break
        else:
            raise SystemExit("No reference seed met the fixed XOR acceptance threshold")
        path.write_text(json.dumps(data, indent=2) + "\n")
    predictions = train(data)
    assert max(abs(a - b) for a, b in zip(predictions, YS)) < 0.1
    assert sum((a - b) ** 2 for a, b in zip(predictions, YS)) < 0.04
    narrate(f"verify {path} [stream {data['stream']}, predictions {predictions}, sha256 {hashlib.sha256(path.read_bytes()).hexdigest()}]")


if __name__ == "__main__":
    main()
