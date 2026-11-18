#!/usr/bin/env python3
"""Measure paired executables; keep process and optional in-process costs distinct."""

import argparse
import hashlib
import json
import math
import os
from pathlib import Path
import platform
import shlex
import signal
import statistics
import subprocess
import sys
import tempfile
import time


class MeasurementError(Exception):
    pass


def strict_json(value):
    def reject_constant(token):
        raise ValueError(f"non-finite JSON constant: {token}")
    return json.loads(value, parse_constant=reject_constant)


def narrate(message, verbose=False):
    level = os.environ.get("EMIT_VERBOSITY", "default")
    if level not in ("quiet", "q", "0") and (
        not verbose or level in ("verbose", "v", "2")
    ):
        print(message, file=sys.stderr, flush=True)


def file_identity(path):
    path = Path(path).resolve(strict=True)
    return {
        "path": str(path),
        "bytes": path.stat().st_size,
        "sha256": hashlib.sha256(path.read_bytes()).hexdigest(),
    }


def field_value(value, field):
    try:
        for key in field.split("."):
            value = value[key]
    except (KeyError, TypeError) as exc:
        raise MeasurementError(f"missing JSON field: {field}") from exc
    return value


def execute(command, timeout):
    """Use files to avoid pipe deadlocks while wait4 obtains per-child usage."""
    started = time.perf_counter()
    with tempfile.TemporaryFile() as stdout, tempfile.TemporaryFile() as stderr:
        try:
            child = subprocess.Popen(
                command, stdout=stdout, stderr=stderr, start_new_session=True
            )
        except OSError as exc:
            raise MeasurementError(f"cannot execute {command[0]}: {exc}") from exc
        try:
            while True:
                pid, status, usage = os.wait4(child.pid, os.WNOHANG)
                if pid:
                    child.returncode = os.waitstatus_to_exitcode(status)
                    break
                if time.perf_counter() - started >= timeout:
                    raise MeasurementError(f"child exceeded {timeout:g}s: {command[0]}")
                time.sleep(0.005)
        except BaseException:
            try:
                os.killpg(child.pid, signal.SIGKILL)
            except ProcessLookupError:
                pass
            child.wait()
            raise
        wall = time.perf_counter() - started
        stdout.seek(0)
        stderr.seek(0)
        output, diagnostics = stdout.read(), stderr.read()
    if child.returncode:
        raise MeasurementError(
            f"child exited {child.returncode}: {shlex.join(command)}\n"
            + diagnostics.decode("utf-8", errors="replace")[-4000:]
        )
    return {
        "command": command,
        "process_cpu_seconds": usage.ru_utime + usage.ru_stime,
        "process_wall_seconds": wall,
        "peak_resident_bytes": usage.ru_maxrss
        * (1 if sys.platform == "darwin" else 1024),
        "stdout_sha256": hashlib.sha256(output).hexdigest(),
        "stdout_bytes": len(output),
        "stderr": diagnostics.decode("utf-8", errors="replace"),
    }, output


def statistics_for(samples, field):
    values = [sample[field] for sample in samples]
    return {
        "median": statistics.median(values),
        "minimum": min(values),
        "maximum": max(values),
    }


def summarize(samples, pairs):
    measured = [sample for sample in samples if sample["phase"] == "sample"]
    grouped = {
        side: [sample for sample in measured if sample["side"] == side]
        for side in ("before", "after")
    }
    if any(len(rows) != pairs for rows in grouped.values()):
        raise MeasurementError("incomplete sample pairs")
    deltas = []
    for pair in range(pairs):
        rows = [sample for sample in measured if sample["pair"] == pair]
        if len(rows) != 2 or {row["side"] for row in rows} != {"before", "after"}:
            raise MeasurementError(f"incomplete or duplicate pair {pair}")
        by_side = {row["side"]: row for row in rows}
        baseline = by_side["before"]["metric_seconds"]
        deltas.append(
            None if baseline == 0 else
            (by_side["after"]["metric_seconds"] / baseline - 1) * 100
        )
    result = {}
    for side, rows in grouped.items():
        result[side] = {
            field: statistics_for(rows, field)
            for field in (
                "metric_seconds", "process_cpu_seconds", "process_wall_seconds",
                "peak_resident_bytes",
            )
        }
    baseline = result["before"]["metric_seconds"]["median"]
    candidate = result["after"]["metric_seconds"]["median"]
    result["median_change_percent"] = (
        None if baseline == 0 else (candidate / baseline - 1) * 100
    )
    result["paired_change_percent"] = deltas
    return result


def parser():
    p = argparse.ArgumentParser(description=__doc__)
    verbosity = p.add_mutually_exclusive_group()
    verbosity.add_argument("-q", "--quiet", action="store_true")
    verbosity.add_argument("-v", "--verbose", action="store_true")
    p.add_argument("--before", required=True, type=Path)
    p.add_argument("--after", required=True, type=Path)
    p.add_argument("--arg", action="append", default=[], help="shared argument; use --arg=--flag")
    p.add_argument("--before-arg", action="append", default=[])
    p.add_argument("--after-arg", action="append", default=[])
    p.add_argument("--before-metadata", type=Path, help="JSON build/provenance manifest")
    p.add_argument("--after-metadata", type=Path, help="JSON build/provenance manifest")
    p.add_argument("--fixture", action="append", default=[], type=Path)
    p.add_argument("--metric-field", help="JSON field containing in-process seconds; default: process CPU")
    p.add_argument("--oracle-field", action="append", default=[], help="stable JSON field, repeatable; default: stdout hash")
    p.add_argument("--expected-output", type=Path, help="independent expected stdout bytes")
    p.add_argument("--expected-oracle", type=strict_json, help="JSON object of expected --oracle-field values")
    p.add_argument("--iterations", type=int, default=1000, help="initial {iterations} substitution")
    p.add_argument("--min-seconds", type=float, default=0.5, help="baseline calibration target")
    p.add_argument("--pairs", type=int, default=10)
    p.add_argument("--warmups", type=int, default=1, help="untimed processes per side before sampling")
    p.add_argument("--start", choices=("before", "after"), default="before")
    p.add_argument("--timeout", type=float, default=120)
    p.add_argument("--report", type=Path, help="also retain the JSON report at this path")
    return p


def provenance(path, metadata_path):
    metadata = None
    if metadata_path:
        narrate(f"read {metadata_path} -> build provenance")
        metadata = strict_json(metadata_path.read_text())
        if not isinstance(metadata, dict):
            raise MeasurementError("build metadata must be a JSON object")
    required = (
        "source_revision", "dirty_inputs", "build_commands", "toolchain",
        "compiler_options", "linker_options", "execution_path", "cache_state",
    )
    return {
        "executable": file_identity(path),
        "supplied_metadata": metadata,
        "metadata_file": file_identity(metadata_path) if metadata_path else None,
        "unavailable": [key for key in required if metadata is None or key not in metadata],
    }


def measure(args, report):
    if not hasattr(os, "wait4"):
        raise MeasurementError("this platform does not provide per-child wait4 metrics")
    if args.pairs < 1 or args.warmups < 0 or args.iterations < 1:
        raise MeasurementError("pairs and iterations must be positive; warmups must be nonnegative")
    if not math.isfinite(args.min_seconds) or args.min_seconds < 0:
        raise MeasurementError("min-seconds must be finite and nonnegative")
    if not math.isfinite(args.timeout) or args.timeout <= 0:
        raise MeasurementError("timeout must be finite and positive")
    if args.expected_oracle is not None and not args.oracle_field:
        raise MeasurementError("expected-oracle requires oracle-field")
    if args.expected_oracle is not None and (
        not isinstance(args.expected_oracle, dict)
        or set(args.expected_oracle) != set(args.oracle_field)
    ):
        raise MeasurementError("expected-oracle must be an object matching the selected oracle fields")
    sides = {"before": args.before, "after": args.after}
    report["provenance"] = {
        side: provenance(path, getattr(args, f"{side}_metadata"))
        for side, path in sides.items()
    }
    report["fixtures"] = [file_identity(path) for path in args.fixture]
    report["oracle"] = {
        "fields": args.oracle_field or None,
        "expected": args.expected_oracle,
        "expected_output": file_identity(args.expected_output) if args.expected_output else None,
        "independent_expectation_supplied": args.expected_oracle is not None or args.expected_output is not None,
    }
    expected_digest = (
        hashlib.sha256(args.expected_output.read_bytes()).hexdigest()
        if args.expected_output else None
    )
    expected_by_iterations = {}

    def run(side, iterations, phase, pair=None):
        arguments = args.arg + getattr(args, f"{side}_arg")
        command = [str(sides[side].resolve())] + [
            argument.replace("{iterations}", str(iterations)) for argument in arguments
        ]
        narrate(f"run {shlex.join(command)} -> {phase} {side}", verbose=True)
        sample, output = execute(command, args.timeout)
        sample.update(side=side, phase=phase, pair=pair, iterations=iterations)
        parsed = None
        if args.metric_field or args.oracle_field:
            try:
                parsed = strict_json(output)
            except (ValueError, UnicodeDecodeError) as exc:
                raise MeasurementError(f"{side} stdout is not JSON") from exc
            sample["reported"] = parsed
        metric = (
            field_value(parsed, args.metric_field) if args.metric_field
            else sample["process_cpu_seconds"]
        )
        if isinstance(metric, bool) or not isinstance(metric, (int, float)) or not math.isfinite(metric) or metric < 0:
            raise MeasurementError("timing metric must be a finite nonnegative number")
        sample["metric_seconds"] = metric
        oracle = (
            {field: field_value(parsed, field) for field in args.oracle_field}
            if args.oracle_field else sample["stdout_sha256"]
        )
        sample["oracle"] = oracle
        report["samples"].append(sample)
        if expected_digest and sample["stdout_sha256"] != expected_digest:
            raise MeasurementError(f"{side} stdout differs from expected output")
        if args.expected_oracle is not None and oracle != args.expected_oracle:
            raise MeasurementError(f"{side} JSON oracle differs from expected oracle")
        if iterations in expected_by_iterations and oracle != expected_by_iterations[iterations]:
            raise MeasurementError(f"output mismatch for {side} at {iterations} iterations")
        expected_by_iterations[iterations] = oracle
        return sample

    iterations = args.iterations
    can_scale = any("{iterations}" in arg for arg in args.arg + args.before_arg + args.after_arg)
    if can_scale and not (
        any("{iterations}" in arg for arg in args.arg + args.before_arg)
        and any("{iterations}" in arg for arg in args.arg + args.after_arg)
    ):
        raise MeasurementError("both sides must use {iterations} when calibration scales work")
    narrate(f"calibrate {args.before} -> baseline batch [target {args.min_seconds:g}s]")
    for attempt in range(12):
        sample = run("before", iterations, "calibration")
        if sample["metric_seconds"] >= args.min_seconds:
            break
        if not can_scale:
            raise MeasurementError("baseline is below min-seconds and no {iterations} argument can scale it")
        factor = min(100, max(2, math.ceil(args.min_seconds / max(sample["metric_seconds"], 0.000001) * 1.1)))
        iterations *= factor
    else:
        raise MeasurementError("calibration did not reach min-seconds")
    report["iterations"] = iterations
    report["settings"]["calibration_scales_iterations"] = can_scale
    for _ in range(args.warmups):
        for side in (args.start, "after" if args.start == "before" else "before"):
            run(side, iterations, "warmup")
    narrate(f"measure {args.before} + {args.after} -> paired samples [{args.pairs} pairs, {iterations} iterations]")
    for pair in range(args.pairs):
        first = args.start if pair % 2 == 0 else ("after" if args.start == "before" else "before")
        for side in (first, "after" if first == "before" else "before"):
            run(side, iterations, "sample", pair)
    # A comparison must not silently mix rebuilds or changing fixture inputs.
    identities = list(report["fixtures"])
    for provenance_entry in report["provenance"].values():
        identities.append(provenance_entry["executable"])
        if provenance_entry["metadata_file"]:
            identities.append(provenance_entry["metadata_file"])
    for identity in identities:
        if file_identity(identity["path"]) != identity:
            raise MeasurementError("comparison input changed during sampling: " + identity["path"])
    report["summary"] = summarize(report["samples"], args.pairs)
    report["status"] = "complete"


def main(argv=None):
    args = parser().parse_args(argv)
    if args.quiet:
        os.environ["EMIT_VERBOSITY"] = "quiet"
    elif args.verbose:
        os.environ["EMIT_VERBOSITY"] = "verbose"
    report = {
        "schema_version": 1, "status": "incomplete", "samples": [],
        "platform": {"system": platform.platform(), "machine": platform.machine(), "python": platform.python_version()},
        "settings": {
            "pairs": args.pairs, "warmups": args.warmups, "start": args.start,
            "initial_iterations": args.iterations, "min_seconds": args.min_seconds,
            "timeout_seconds": args.timeout, "metric_field": args.metric_field,
            "metric": "in_process_reported" if args.metric_field else "process_cpu_seconds",
        },
        "measurement_limits": [
            "Process timings include startup and setup; reported in-process timings are separate.",
            "Resident memory is a process high-water mark, not allocation volume.",
            "Allocation and collection data are unavailable unless supplied by the executable.",
            "Output agreement alone is not an independent correctness oracle.",
        ],
    }
    exit_code = 0
    try:
        measure(args, report)
    except (MeasurementError, OSError, ValueError, KeyboardInterrupt) as exc:
        report.update(status="failed", error=str(exc) or "interrupted")
        print(f"performance-measure: {report['error']}", file=sys.stderr)
        exit_code = 1
    output = json.dumps(report, indent=2, allow_nan=False) + "\n"
    if args.report:
        try:
            args.report.parent.mkdir(parents=True, exist_ok=True)
            args.report.write_text(output)
            narrate(f"write paired samples -> {args.report} [{len(output.encode())} bytes, {report['status']}]")
        except OSError as exc:
            print(f"performance-measure: cannot write report: {exc}", file=sys.stderr)
            return 1
    sys.stdout.write(output)
    return exit_code


if __name__ == "__main__":
    raise SystemExit(main())
