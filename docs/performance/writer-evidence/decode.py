#!/usr/bin/env python3
"""Expand and verify the lossless writer measurement archive."""

import argparse
import hashlib
import json
import os
from pathlib import Path
import sys


def canonical_sha256(value):
    encoded = json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    ).encode()
    return hashlib.sha256(encoded).hexdigest()


def note(message):
    if os.environ.get("EMIT_VERBOSITY", "default") not in ("quiet", "q", "0"):
        print(message, file=sys.stderr)


def expand(root):
    archive = json.loads((root / "experiments.json").read_text())
    if archive["schema_version"] != 1:
        raise ValueError("unsupported measurement archive schema")
    samples = [
        json.loads(line)
        for line in (root / archive["sample_file"]).read_text().splitlines()
    ]
    if len(samples) != archive["sample_count"]:
        raise ValueError("sample count differs from archive manifest")
    reports = {}
    next_sample = 0
    for name, experiment in archive["experiments"].items():
        if experiment["sample_start"] != next_sample:
            raise ValueError(f"noncontiguous sample range: {name}")
        restored = dict(experiment["report"])
        count = experiment["sample_count"]
        rows = samples[next_sample:next_sample + count]
        if len(rows) != count:
            raise ValueError(f"incomplete sample range: {name}")
        restored_samples = []
        for index, line in enumerate(rows):
            if line["experiment"] != name or line["index"] != index:
                raise ValueError(f"sample identity/order differs: {name}")
            row = dict(line["sample"])
            if "command_id" in row:
                row["command"] = archive["commands"][row.pop("command_id")]
            restored_samples.append(row)
        restored["samples"] = restored_samples
        if experiment["had_provenance"]:
            restored["provenance"] = {}
            for side, key in experiment["provenance_refs"].items():
                value = json.loads(json.dumps(archive["provenance"][key]))
                metadata = value.get("supplied_metadata")
                if metadata and "build_commands" in metadata:
                    metadata["build_commands"] = [
                        archive["commands"][row["command_id"]]
                        for row in metadata["build_commands"]
                    ]
                restored["provenance"][side] = value
        if canonical_sha256(restored) != experiment["canonical_sha256"]:
            raise ValueError(f"reconstructed JSON hash differs: {name}")
        reports[name] = restored
        next_sample += count
    if next_sample != len(samples):
        raise ValueError("unreferenced samples remain")
    return archive, reports


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    verbosity = parser.add_mutually_exclusive_group()
    verbosity.add_argument("-q", "--quiet", action="store_true")
    verbosity.add_argument("-v", "--verbose", action="store_true")
    parser.add_argument("--output", type=Path, help="write restored report JSON files")
    parser.add_argument(
        "--verify-source", type=Path,
        help="also compare objects and original byte hashes against this directory",
    )
    args = parser.parse_args()
    if args.quiet:
        os.environ["EMIT_VERBOSITY"] = "quiet"
    elif args.verbose:
        os.environ["EMIT_VERBOSITY"] = "verbose"
    root = Path(__file__).resolve().parent
    note(f"read {root} -> expanded writer measurements")
    archive, reports = expand(root)
    if args.verify_source:
        for name, report in reports.items():
            source_bytes = (args.verify_source / name).read_bytes()
            if json.loads(source_bytes) != report:
                raise ValueError(f"source JSON object differs: {name}")
            if hashlib.sha256(source_bytes).hexdigest() != archive["experiments"][name]["source_sha256"]:
                raise ValueError(f"source file bytes differ: {name}")
    if args.output:
        args.output.mkdir(parents=True, exist_ok=True)
        for name, report in reports.items():
            (args.output / name).write_text(json.dumps(report, indent=2) + "\n")
        note(f"write writer measurements -> {args.output} [{len(reports)} reports]")
    print(json.dumps({
        "reports": len(reports), "samples": archive["sample_count"],
        "canonical_hashes_verified": True,
        "source_objects_verified": args.verify_source is not None,
    }))


if __name__ == "__main__":
    try:
        main()
    except (KeyError, OSError, ValueError) as exc:
        print(f"writer-evidence: {exc}", file=sys.stderr)
        sys.exit(1)
