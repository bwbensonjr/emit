#!/usr/bin/env python3
"""Capture a reproducible validation baseline in a disposable source snapshot."""

import argparse
import importlib.util
import json
import statistics
import os
import pathlib
import platform
import shutil
import subprocess
import tempfile
import time


ROOT = pathlib.Path(__file__).resolve().parent.parent
REGISTRY = ROOT / "tools/test-registry.json"
TELEMETRY = ROOT / "tools/test-telemetry.py"


def run(argv, cwd=None, env=None, stdout=None, stderr=None):
    environment = clean_git_environment(os.environ if env is None else env)
    return subprocess.run(argv, cwd=cwd, env=environment, stdout=stdout, stderr=stderr, check=False)


def clean_git_environment(environment):
    return {key: value for key, value in environment.items() if not key.startswith("GIT_")}


def output(argv):
    try:
        result = subprocess.run(argv, cwd=ROOT, env=clean_git_environment(os.environ), text=True,
                                stdout=subprocess.PIPE, stderr=subprocess.STDOUT, check=False)
    except OSError as error:
        return "unavailable: " + str(error)
    return result.stdout.strip().splitlines()[0] if result.stdout.strip() else "unavailable"


def tracked_snapshot(destination, working_tree, revision="HEAD"):
    commit = output(["git", "rev-parse", revision])
    if not working_tree:
        archive = run(["git", "archive", "--format=tar", revision], cwd=ROOT, stdout=subprocess.PIPE)
        if archive.returncode:
            raise RuntimeError("git archive failed")
        import io
        import tarfile

        with tarfile.open(fileobj=io.BytesIO(archive.stdout), mode="r:") as bundle:
            bundle.extractall(destination, filter="data")
        return commit, revision + " archive"

    listing = subprocess.check_output(["git", "ls-files", "-z"], cwd=ROOT,
                                      env=clean_git_environment(os.environ)).decode().split("\0")
    for name in filter(None, listing):
        source = ROOT / name
        target = destination / name
        if source.is_symlink():
            target.parent.mkdir(parents=True, exist_ok=True)
            target.symlink_to(os.readlink(source))
        elif source.is_file():
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(source, target)
    return commit, "tracked working tree"


def initialize_git(snapshot):
    for arguments in (["init", "-q"], ["add", "--all", "--force"],
                      ["-c", "user.name=Emit benchmark", "-c", "user.email=benchmark@invalid",
                       "-c", "commit.gpgsign=false", "commit", "-qm", "benchmark snapshot"]):
        subprocess.run(["git", "-c", "core.hooksPath=/dev/null", "-c", "gc.auto=0",
                        "-c", "maintenance.auto=false", *arguments], cwd=snapshot,
                       env=clean_git_environment(os.environ), check=True,
                       stdout=subprocess.DEVNULL, stderr=subprocess.PIPE)


def load_registry():
    with REGISTRY.open() as source:
        registry = json.load(source)
    return {suite["id"]: suite for suite in registry["suites"]}


def load_telemetry():
    specification = importlib.util.spec_from_file_location("emit_test_telemetry", TELEMETRY)
    module = importlib.util.module_from_spec(specification)
    specification.loader.exec_module(module)
    return module


def traced_run(argv, cwd, stdout_path, trace_path, environment):
    trace_path.touch()
    phase_environment = {**environment, "EMIT_TEST_TRACE_LOG": str(trace_path)}
    with stdout_path.open("w") as stdout_file:
        result = run(argv, cwd=cwd, env=phase_environment, stdout=stdout_file,
                     stderr=subprocess.STDOUT)
    return result


def observed_emit_cpp_compiles(trace_path):
    count = 0
    if trace_path.is_file():
        for line in trace_path.read_text(errors="replace").splitlines():
            try:
                record = json.loads(line)
            except json.JSONDecodeError:
                continue
            arguments = record.get("argv", [])
            if "-c" in arguments and "src/emit.cpp" in arguments:
                count += 1
    return count


def cache_configuration(environment):
    variables = ("EMIT_CACHE", "HOME", "XDG_CACHE_HOME")
    paths = {}
    for name in variables:
        value = environment.get(name)
        try:
            paths[name] = {"path": value, "exists": pathlib.Path(value).exists() if value else None}
        except OSError as error:
            paths[name] = {"path": value, "exists": None, "error": str(error)}
    return {
        "variables": {name: environment.get(name) for name in variables},
        "path_state": paths,
        "contents": "unmeasured; no recursive cache scan",
    }


FIXTURES = {
    "compiler": ("src/passes/lower.ss", "\n; validation timing fixture\n"),
    "runtime": ("src/runtime/runtime.c", "\n/* validation timing fixture */\n"),
    "host": ("src/emit.cpp", "\n/* validation timing fixture */\n"),
    "documentation": ("docs/DISTRIBUTION.md", "\nValidation timing fixture.\n"),
}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--working-tree", action="store_true", help="snapshot tracked working-tree bytes instead of HEAD")
    parser.add_argument("--full-native", action="store_true", help="run make all and all 53 native suites in the snapshot")
    parser.add_argument("--suite", action="append", default=[], metavar="ID",
                        help="run one native registry suite (repeatable, executes serially)")
    parser.add_argument("--trace-compilers", action="store_true",
                        help="trace external CC/CXX/make calls through transparent proxies")
    parser.add_argument("--revision", default="HEAD", help="immutable committed baseline to archive")
    parser.add_argument("--scenario", choices=sorted(FIXTURES), help="apply a harmless, exact representative edit")
    parser.add_argument("--run-scenario", action="store_true", help="measure the selected edit feedback command")
    parser.add_argument("--samples", type=int, default=3)
    parser.add_argument("--output", type=pathlib.Path, help="write JSON report here; default is stdout")
    args = parser.parse_args()
    if args.full_native and args.suite:
        parser.error("--suite cannot be combined with --full-native")
    if args.samples < 1 or (args.run_scenario and not args.scenario):
        parser.error("positive --samples and --scenario are required for scenario execution")
    if args.working_tree and args.revision != "HEAD":
        parser.error("--working-tree cannot select a committed --revision")
    registry = load_registry()
    selected_suites = []
    for suite_id in args.suite:
        suite = registry.get(suite_id)
        if suite is None:
            parser.error("unknown suite ID: " + suite_id)
        if suite.get("chez"):
            parser.error("--suite requires a native suite; " + suite_id + " requires Chez")
        selected_suites.append(suite)

    logs_root = pathlib.Path(tempfile.mkdtemp(prefix="emit-validation-baseline-logs-"))
    report_logs = {"root": str(logs_root)}
    telemetry = load_telemetry() if args.trace_compilers else None
    trace_environment = None
    if telemetry is not None:
        wrapper_directory = logs_root / "wrappers"
        wrapper_directory.mkdir()
        trace_environment = telemetry.setup(wrapper_directory, clean_git_environment(os.environ))
        report_logs["wrappers"] = str(wrapper_directory)

    print("baseline snapshot -> temporary checkout  [tracked files only]", file=__import__("sys").stderr)
    harness_commit = output(["git", "rev-parse", "HEAD"])
    report = {
        "schema": 1,
        "baseline_commit": output(["git", "rev-parse", "HEAD"]),
        "harness_commit": harness_commit,
        "snapshot_kind": "tracked working tree" if args.working_tree else "HEAD archive",
        "platform": platform.platform(),
        "machine": platform.machine(),
        "python": platform.python_version(),
        "toolchain": {
            "llvm_config": output([os.environ.get("LLVM_CONFIG", "llvm-config"), "--version"]),
            "clang": output([os.environ.get("CC", "clang"), "--version"]),
            "clangxx": output([os.environ.get("CXX", "clang++"), "--version"]),
            "chez": output(["chez", "--version"]),
            "libgc": os.environ.get("GC_PREFIX", "not explicitly set"),
            "gc_inc": os.environ.get("GC_INC"),
            "gc_lib": os.environ.get("GC_LIB"),
        },
        "environment": {key: os.environ.get(key) for key in
                         ("LLVM_CONFIG", "CC", "CXX", "GC_PREFIX", "GC_INC", "GC_LIB",
                          "EMIT_VERBOSITY", "EMIT_CACHE", "HOME", "XDG_CACHE_HOME")},
        "cache_state": "caller-supplied locations recorded; contents unmeasured",
        "cache_configuration": cache_configuration(os.environ),
        "queue_seconds": None,
        "provision_seconds": None,
        "build_seconds": None,
        "test_seconds": None,
        "build_invocations": 0,
        "test_runner_invocations": 0,
        "compiler_invocations": None,
        "compiler_invocation_note": "external CC/CXX wrapper counts only; does not count in-process Emit/LLVM compilation",
        "full_native_requested": args.full_native,
        "selected_suites": [suite["id"] for suite in selected_suites],
        "trace_compilers": args.trace_compilers,
        "logs": report_logs,
        "suite_results": [],
        "observed_emit_cpp_compile_commands": None,
    }

    with tempfile.TemporaryDirectory(prefix="emit-validation-baseline-") as temporary:
        snapshot = pathlib.Path(temporary) / "repo"
        snapshot.mkdir()
        commit, kind = tracked_snapshot(snapshot, args.working_tree, args.revision)
        report["baseline_commit"] = commit
        report["snapshot_kind"] = kind
        initialize_git(snapshot)
        if args.scenario:
            filename, addition = FIXTURES[args.scenario]
            fixture = snapshot / filename
            # This writes only the disposable benchmark fixture, never ROOT.
            with fixture.open("a") as output_file:
                output_file.write(addition)
            report["fixture"] = {"category": args.scenario, "path": filename, "addition": addition}
            modern = (snapshot / "tools/test.sh").is_file()
            command = (["bash", "tools/test.sh", "units"] if args.scenario == "compiler" else
                       ["bash", "tools/test.sh", "dev", "--changed", "HEAD"]) if modern else ["bash", "run-all-tests.sh"]
            report["scenario_command"] = command
            report["scenario_samples"] = []
            if args.run_scenario:
                for sample in range(args.samples):
                    log = logs_root / ("scenario-" + str(sample) + ".log")
                    report_logs["scenario_" + str(sample)] = str(log)
                    started = time.monotonic()
                    with log.open("w") as output_file:
                        result = run(command, cwd=snapshot, stdout=output_file, stderr=subprocess.STDOUT)
                    report["scenario_samples"].append({"seconds": round(time.monotonic() - started, 3),
                                                       "exit_code": result.returncode})
                    if result.returncode:
                        report["scenario_log_tail"] = log.read_text(errors="replace").splitlines()[-40:]
                        break
                durations = [entry["seconds"] for entry in report["scenario_samples"]]
                report["scenario_median_seconds"] = statistics.median(durations)
                report["scenario_range_seconds"] = [min(durations), max(durations)]
        if args.full_native or selected_suites:
            build_log = logs_root / "build.log"
            build_trace = logs_root / "build.trace.jsonl"
            test_log = logs_root / "full-native.log"
            start = time.monotonic()
            if args.trace_compilers:
                build = traced_run(["make", "all"], snapshot, build_log,
                                   build_trace, trace_environment)
                build_counts = telemetry.summarize(build_trace)
            else:
                with build_log.open("w") as stdout_file:
                    build = run(["make", "all"], cwd=snapshot, stdout=stdout_file, stderr=subprocess.STDOUT)
                build_counts = None
            report["build_seconds"] = round(time.monotonic() - start, 3)
            report["build_invocations"] = 1
            report_logs["build"] = str(build_log)
            if args.trace_compilers:
                report_logs["build_trace"] = str(build_trace)
                report["build_tool_counts"] = build_counts
                report["observed_emit_cpp_compile_commands"] = observed_emit_cpp_compiles(build_trace)
                report["compiler_invocations"] = build_counts["compiler_invocations"]
            if build.returncode:
                report["build_returncode"] = build.returncode
                report["build_log_tail"] = build_log.read_text(errors="replace").splitlines()[-30:] if build_log.exists() else []
            else:
                if args.full_native:
                    start = time.monotonic()
                    if args.trace_compilers:
                        test_trace = logs_root / "full-native.trace.jsonl"
                        test = traced_run(["bash", "run-all-tests.sh"], snapshot,
                                          test_log, test_trace, trace_environment)
                        test_counts = telemetry.summarize(test_trace)
                        report["test_tool_counts"] = test_counts
                        report["compiler_invocations"] += test_counts["compiler_invocations"]
                        report_logs["full_native_trace"] = str(test_trace)
                    else:
                        with test_log.open("w") as stdout_file:
                            test = run(["bash", "run-all-tests.sh"], cwd=snapshot,
                                       stdout=stdout_file, stderr=subprocess.STDOUT)
                    report["test_seconds"] = round(time.monotonic() - start, 3)
                    report["test_runner_invocations"] = 1
                    report["test_returncode"] = test.returncode
                    report["test_log_tail"] = test_log.read_text(errors="replace").splitlines()[-70:]
                    report_logs["full_native"] = str(test_log)
                for index, suite in enumerate(selected_suites):
                    suite_id = suite["id"]
                    suite_log = logs_root / ("suite-" + suite_id + ".log")
                    suite_trace = logs_root / ("suite-" + suite_id + ".trace.jsonl")
                    start = time.monotonic()
                    if args.trace_compilers:
                        suite_result = traced_run(suite["command"], snapshot, suite_log,
                                                  suite_trace, trace_environment)
                        suite_counts = telemetry.summarize(suite_trace)
                        report_logs["suite_trace_" + suite_id] = str(suite_trace)
                    else:
                        with suite_log.open("w") as stdout_file:
                            suite_result = run(suite["command"], cwd=snapshot,
                                               stdout=stdout_file, stderr=subprocess.STDOUT)
                        suite_counts = None
                    elapsed = round(time.monotonic() - start, 3)
                    report_logs["suite_" + suite_id] = str(suite_log)
                    result_entry = {"id": suite_id, "command": suite["command"],
                                    "seconds": elapsed, "exit_code": suite_result.returncode}
                    if suite_counts is not None:
                        result_entry["tool_counts"] = suite_counts
                        result_entry["observed_emit_cpp_compile_commands"] = observed_emit_cpp_compiles(suite_trace)
                        report["compiler_invocations"] += suite_counts["compiler_invocations"]
                    report["suite_results"].append(result_entry)
                    if suite_result.returncode:
                        break

    encoded = json.dumps(report, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(encoded)
        print("baseline report -> " + str(args.output) + "  [JSON]", file=__import__("sys").stderr)
    else:
        print(encoded, end="")
    return 0 if (report.get("test_returncode", 0) == 0 and report.get("build_returncode", 0) == 0
                 and all(entry["exit_code"] == 0 for entry in report["suite_results"])
                 and all(entry["exit_code"] == 0 for entry in report.get("scenario_samples", []))) else 1


if __name__ == "__main__":
    raise SystemExit(main())
