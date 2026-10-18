#!/usr/bin/env python3
"""Run explicit validation profiles in bounded, isolated workspaces."""

import argparse
import concurrent.futures
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import platform
import re
import shutil
import signal
import subprocess
import sys
import tempfile
import threading
import time

sys.dont_write_bytecode = True

ROOT = Path(__file__).resolve().parent.parent
PROFILES = ("dev", "full", "compat", "source", "units", "reference", "conformance")
QUIET = {"quiet", "q", "0"}
VERBOSE = {"verbose", "v", "2"}


def load_module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def narrate(message, error=False):
    if error or os.environ.get("EMIT_VERBOSITY", "default") not in QUIET:
        print("test: " + message, file=sys.stderr, flush=True)


def validation_environment():
    # Inherited Git hook/worktree variables must not redirect private fixture
    # Git operations back into the developer's repository or index.
    return {key: value for key, value in os.environ.items() if not key.startswith("GIT_")}


def registry(path):
    data = json.loads(path.read_text())
    if data.get("schema") != 1 or not data.get("suites"):
        raise ValueError("empty or unsupported suite registry")
    ids = [suite["id"] for suite in data["suites"]]
    if len(ids) != len(set(ids)):
        raise ValueError("duplicate suite identifier")
    for suite in data["suites"]:
        if not re.fullmatch(r"[a-z0-9]+(?:-[a-z0-9]+)*", suite["id"]):
            raise ValueError("unsafe suite identifier: " + suite["id"])
        if not suite.get("command") or not isinstance(suite["command"], list):
            raise ValueError("empty command: " + suite["id"])
    return data


def select(data, profile, names):
    by_id = {suite["id"]: suite for suite in data["suites"]}
    if names:
        unknown = sorted(set(names) - by_id.keys())
        if unknown:
            raise ValueError("unknown suite: " + ", ".join(unknown))
        # Named selection is deliberately independent of a profile.
        suites = [by_id[name] for name in dict.fromkeys(names)]
    else:
        suites = [s for s in data["suites"] if profile in s["profiles"]]
    if not suites:
        raise ValueError("selection is empty: " + profile)
    return suites


def regeneration_hint(root):
    """Read local hints without creating one or triggering regeneration."""
    try:
        result = subprocess.run(
            [sys.executable, "tools/source-fingerprint.py", "--status"], cwd=root,
            env={**os.environ, "EMIT_VERBOSITY": "quiet"},
            capture_output=True, text=True, timeout=30, check=True)
        hint = json.loads(result.stdout)
        if hint.get("status") not in {"matching", "missing", "mismatch"}:
            raise ValueError("invalid fingerprint status")
        for key in ("source_digest", "bootstrap_digest", "toolchain_digest"):
            value = hint.get(key, "")
            if len(value) != 64 or any(c not in "0123456789abcdef" for c in value):
                raise ValueError("invalid " + key)
        return hint
    except (OSError, ValueError, TypeError, AttributeError, subprocess.SubprocessError) as error:
        return {"status": "missing", "reason": str(error)}


def native_feedback(hint, native=True):
    """Never imply that native execution exercised unregenerated source edits."""
    matching = native and hint.get("status") == "matching"
    return {
        "label": ("current-source-regenerated" if matching else
                  "committed-bootstrap-only" if native else "not-native-validation"),
        "regeneration_status": hint.get("status", "missing"),
        "current_source_regenerated": bool(matching),
        "claim": ("native behavior of explicitly regenerated compiler inputs; not an independent source proof"
                  if matching else "native behavior of committed bootstrap artifacts only"
                  if native else "source/unit/reference proof, not a native regression claim"),
        "next_steps": ([] if matching or not native else [
            "bash tools/test.sh units", "make regen", "bash tools/test.sh source"]),
    }


def same_proof_inputs(left, right):
    keys = ("source_digest", "bootstrap_digest", "toolchain_digest")
    if not isinstance(left, dict) or not isinstance(right, dict):
        return False
    return all(left.get(key) and left.get(key) == right.get(key) for key in keys)


def verified_invocation_proofs(results, identity):
    """Only expose completed, hash-bound proofs from this invocation for reuse."""
    proofs = {}
    for result in results:
        proof = result.get("proof", {})
        if (isinstance(proof, dict)
                and proof.get("proof") in {"source-consistency", "independent-host-fixed-point"}
                and result.get("status") == "passed" and proof.get("status") == "passed"
                and same_proof_inputs(proof, identity)):
            proofs[proof["proof"]] = proof
    return proofs


def changed_selection(data, profile, names, policy):
    if names or profile != "dev" or not policy or policy["docs_only"]:
        return select(data, profile, names)
    categories = set(policy["categories"])
    if categories & {"unknown", "infrastructure", "release"}:
        return select(data, "full", [])
    suites = select(data, "dev", [])
    extra = {
        "runtime": {"fixnum-overflow-traps", "indexed-access-bounds", "catchable-errors-kinds",
                    "dynamic-extent-call-cc", "io-ports-eof-object", "printer-cycles-char-names-trap-delivery"},
        "host": {"cli-interface-help-final-value", "installation-diagnostics", "llvm-toolchain-discovery",
                 "native-build-configuration", "installed-layout-libraries-support-files"},
        "library": {"import-sets-and-portable-sources", "runtime-and-macro-library-composition",
                    "explicit-artifact-format", "explicit-artifact-reuse", "module-vertical-slice-repl"},
        "compiler": {"binding-contexts-and-local-macros", "reader-datum-parity-vector-consts-rendering"},
    }
    ids = {suite["id"] for suite in suites}
    ids.update(name for category in categories for name in extra.get(category, set()))
    return [suite for suite in data["suites"] if suite["id"] in ids]


def snapshot(root, destination):
    """Copy the current Git input set, not ignored caches or a frozen commit."""
    names = subprocess.check_output(
        ["git", "ls-files", "--cached", "--others", "--exclude-standard", "-z"],
        cwd=root, env=validation_environment()).decode().split("\0")
    destination.mkdir()
    for name in sorted(set(names) - {""}):
        source = root / name
        if not source.exists() and not source.is_symlink():
            continue
        target = destination / name
        target.parent.mkdir(parents=True, exist_ok=True)
        if source.is_symlink():
            if Path(os.readlink(source)).is_absolute() or not source.resolve().is_relative_to(root.resolve()):
                raise ValueError("snapshot refuses external symlink: " + name)
            target.symlink_to(os.readlink(source))
        elif source.is_file():
            shutil.copy2(source, target)
    return destination


def initialize_git(work):
    # Some fixtures intentionally query Git. No user hooks, signing, or identity.
    for args in (["init", "-q"], ["add", "--all"],
                 ["-c", "user.name=Emit validation", "-c", "user.email=validation@invalid",
                  "-c", "commit.gpgsign=false", "commit", "-qm", "validation snapshot"]):
        subprocess.run(["git", "-c", "core.hooksPath=/dev/null", "-c", "gc.auto=0",
                        "-c", "maintenance.auto=false", *args], cwd=work,
                       check=True, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE,
                       env=validation_environment())


def tree_digest(root):
    digest = hashlib.sha256()
    for path in sorted(root.rglob("*")):
        if path.is_symlink():
            content = b"link\0" + os.readlink(path).encode()
        elif path.is_file():
            content = path.read_bytes()
        else:
            continue
        digest.update(str(path.relative_to(root)).encode() + b"\0" + content + b"\0")
    return digest.hexdigest()


class Executor:
    def __init__(self, work, jobs):
        self.work = work
        self.jobs = jobs
        self.cancelled = threading.Event()
        self.lock = threading.Lock()
        self.processes = set()
        self.environment = validation_environment()
        self.telemetry = None
        self.interrupted = False

    def stop(self, *received_signal):
        if received_signal:
            self.interrupted = True
        self.cancelled.set()
        with self.lock:
            processes = list(self.processes)
        for process in processes:
            try:
                os.killpg(process.pid, signal.SIGTERM)
            except ProcessLookupError:
                pass

    def command(self, argv, cwd, log, env):
        if self.cancelled.is_set():
            return 130
        with open(log, "wb") as output:
            process = subprocess.Popen(argv, cwd=cwd, env=env, stdout=output,
                                       stderr=subprocess.STDOUT, start_new_session=True)
            with self.lock:
                self.processes.add(process)
                # Close the spawn/cancel race.
                if self.cancelled.is_set():
                    os.killpg(process.pid, signal.SIGTERM)
            deadline = None
            try:
                while True:
                    try:
                        return process.wait(timeout=0.2)
                    except subprocess.TimeoutExpired:
                        if self.cancelled.is_set():
                            if deadline is None:
                                deadline = time.monotonic() + 2
                            elif time.monotonic() >= deadline:
                                try:
                                    os.killpg(process.pid, signal.SIGKILL)
                                except ProcessLookupError:
                                    pass
            finally:
                # A script may exit while a child ignores SIGTERM. Kill the
                # remaining process group before releasing this worker slot.
                if self.cancelled.is_set():
                    try:
                        os.killpg(process.pid, signal.SIGKILL)
                    except ProcessLookupError:
                        pass
                process.wait()
                with self.lock:
                    self.processes.discard(process)

    def suite(self, suite, seed):
        name = suite["id"]
        start = time.monotonic()
        log = self.work / (name + ".log")
        target = self.work / (name + ".workspace")
        result = {"id": name, "coverage": suite.get("coverage", []),
                  "log": str(log), "isolation": "workspace"}
        log.touch()
        if self.cancelled.is_set():
            return dict(result, status="cancelled", exit_code=130, seconds=0)
        narrate("run " + name + " -> " + str(log))
        try:
            readonly = suite.get("isolation") == "readonly"
            if readonly:
                target.mkdir()
                result["isolation"] = "shared-readonly-source"
            else:
                shutil.copytree(seed, target, symlinks=True, copy_function=shutil.copy2)
            env = self.environment.copy()
            env["EMIT_CACHE"] = str(target / "build" / "validation-cache")
            env.setdefault("EMIT_JOBS", os.environ.get("EMIT_TEST_CHILD_JOBS", "1"))
            env["TMPDIR"] = str(target / "build" / "tmp")
            trace_log = self.work / (name + ".invocations.jsonl")
            if self.telemetry:
                env["EMIT_TEST_TRACE_LOG"] = str(trace_log)
            Path(env["TMPDIR"]).mkdir(parents=True, exist_ok=True)
            command = list(suite["command"])
            proof_report = self.work / (name + ".proof.json")
            if name == "source-consistency":
                command.extend(["--report", str(proof_report)])
            code = self.command(command, seed if readonly else target, log, env)
            if self.telemetry:
                result["external_tool_invocations"] = self.telemetry.summarize(trace_log)
                result["invocation_log"] = str(trace_log)
            result.update(status="passed" if code == 0 else "cancelled" if self.cancelled.is_set()
                          else "failed", exit_code=code)
            if name == "source-consistency" and code == 0:
                # A successful command without its required proof metadata is
                # unavailable verification, not a proof reusable by this run.
                proof = json.loads(proof_report.read_text())
                if proof.get("proof") != "source-consistency" or proof.get("status") != "passed":
                    raise ValueError("source verification did not produce a passing proof")
                result["proof"] = proof
        except Exception as error:
            with log.open("a") as output:
                output.write(str(error) + "\n")
            result.update(status="failed", exit_code=1)
        finally:
            # Keep diagnostic logs/reports, not multi-GB disposable workspaces.
            shutil.rmtree(target, ignore_errors=True)
        result["seconds"] = round(time.monotonic() - start, 3)
        narrate(result["status"] + " " + name + " -> " + str(log) +
                " [" + str(result["seconds"]) + "s]", result["status"] == "failed")
        if result["status"] == "failed" or os.environ.get("EMIT_VERBOSITY") in VERBOSE:
            print(log.read_text(errors="replace"), file=sys.stderr)
        return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("profile", nargs="?", choices=PROFILES, default="dev")
    parser.add_argument("--suite", action="append", default=[])
    parser.add_argument("--list", action="store_true")
    parser.add_argument("--plan", action="store_true")
    parser.add_argument("--jobs", type=int, default=os.environ.get("EMIT_TEST_JOBS", "2"))
    parser.add_argument("--report", type=Path)
    parser.add_argument("--trace-compilers", action="store_true",
                        help="count external CC/CXX/make calls; not in-process compiler work")
    parser.add_argument("--changed")
    parser.add_argument("--classify")
    parser.add_argument("--ci", action="store_true")
    parser.add_argument("--direct", action="store_true")
    parser.add_argument("--registry", type=Path, default=ROOT / "tools/test-registry.json",
                        help=argparse.SUPPRESS)
    parser.add_argument("--legacy-developer", action="store_true", help=argparse.SUPPRESS)
    parser.add_argument("-q", action="store_true")
    parser.add_argument("-v", action="store_true")
    args = parser.parse_args()
    if args.q:
        os.environ["EMIT_VERBOSITY"] = "quiet"
    if args.v:
        os.environ["EMIT_VERBOSITY"] = "verbose"
    if args.jobs < 1 or args.jobs > 32:
        parser.error("--jobs must be between 1 and 32")
    policy = None
    if args.changed or args.classify:
        classifier = load_module("emit_test_classify", ROOT / "tools/test-classify.py")
        policy = classifier.classify(ROOT, args.classify or args.changed, args.ci, args.direct)
        if args.classify:
            if args.report:
                args.report.parent.mkdir(parents=True, exist_ok=True)
                args.report.write_text(json.dumps(policy, indent=2) + "\n")
            print(json.dumps(policy, sort_keys=True))
            return 0
    try:
        data = registry(args.registry)
        suites = changed_selection(data, args.profile, args.suite, policy)
        if args.legacy_developer and not args.suite:
            suites = [s for s in data["suites"] if set(s["profiles"]) &
                      {"units", "source", "reference"}]
        if os.environ.get("EMIT_R7RS") == "1":
            suites = [dict(s, command=["test/r7rs-suite-tests.sh"],
                           coverage=s["coverage"] + ["r7rs-stale-exclusions"])
                      if s["id"] == "r7rs-small-suite-vendored-sections-only" else s
                      for s in suites]
    except (ValueError, KeyError, OSError) as error:
        parser.error(str(error))
    if args.changed and policy["docs_only"] and not args.suite and not args.legacy_developer:
        # This is an intentional policy gate, not an empty suite selection.
        plan = {"profile": args.profile, "policy": policy, "suites": [],
                "status": "documentation-only", "jobs": 0}
        if args.report:
            args.report.parent.mkdir(parents=True, exist_ok=True)
            args.report.write_text(json.dumps(plan, indent=2) + "\n")
        narrate("validate documentation policy -> no compiler work [0 suites]")
        print(json.dumps(plan, sort_keys=True))
        return 0
    plan = {"schema": 1, "profile": args.profile, "policy": policy,
            "jobs": args.jobs, "suites": suites}
    if args.list or args.plan:
        if args.report:
            args.report.parent.mkdir(parents=True, exist_ok=True)
            args.report.write_text(json.dumps(plan, indent=2, sort_keys=True) + "\n")
        print(json.dumps(plan, indent=2, sort_keys=True))
        return 0
    if any(s.get("chez") for s in suites) and not shutil.which("chez"):
        message = "requested units/reference verification requires chez on PATH"
        failed = {"schema": 1, "profile": args.profile, "status": "failed",
                  "error": message, "results": [], "selected": [s["id"] for s in suites]}
        if args.report:
            args.report.parent.mkdir(parents=True, exist_ok=True)
            args.report.write_text(json.dumps(failed, indent=2) + "\n")
        print(json.dumps(failed, sort_keys=True))
        narrate(message, True)
        return 2
    if args.trace_compilers and any(s.get("chez") or s["id"] == "source-consistency" for s in suites):
        parser.error("--trace-compilers is for native-only profiling, not source/reference proofs")
    start = time.monotonic()
    work = Path(tempfile.mkdtemp(prefix="emit-validation-"))
    executor = Executor(work, args.jobs)
    for number in (signal.SIGINT, signal.SIGTERM):
        signal.signal(number, executor.stop)
    report = {"schema": 1, "profile": args.profile, "policy": policy,
              "commit": subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT,
                                                 text=True, env=validation_environment()).strip(),
              "platform": platform.platform(), "architecture": platform.machine(),
              "jobs": args.jobs, "logs": str(work), "cache": "isolated invocation seed",
              "selected": [s["id"] for s in suites],
              "coverage": {s["id"]: s.get("coverage", []) for s in suites},
              "provision_seconds": None, "queue_seconds": None, "results": []}
    hint = regeneration_hint(ROOT)
    report["regeneration"] = hint
    try:
        if args.trace_compilers:
            executor.telemetry = load_module("emit_test_telemetry", ROOT / "tools/test-telemetry.py")
            executor.environment = executor.telemetry.setup(work / "trace-tools", executor.environment)
        narrate("snapshot current Git inputs -> " + str(work) + " [" +
                str(len(suites)) + " suites, " + str(args.jobs) + " workers]")
        seed = snapshot(ROOT, work / "seed")
        report["input_digest"] = tree_digest(seed)
        report["working_tree_dirty"] = bool(subprocess.check_output(
            ["git", "status", "--porcelain", "--untracked-files=normal"], cwd=ROOT,
            env=validation_environment()))
        initialize_git(seed)
        build_start = time.monotonic()
        native = any(s.get("needs_build", s.get("isolation") != "readonly") and
                     s["id"] != "source-consistency" for s in suites)
        report["native_feedback"] = native_feedback(hint, native)
        narrate("feedback " + report["native_feedback"]["label"] +
                " [regeneration " + hint["status"] + "]")
        if native:
            build_log = work / "build.log"
            code = executor.command(["make", "-j2", "all", "schemec"], seed,
                                    build_log, executor.environment)
            if code:
                raise RuntimeError("seed build failed: " + str(build_log) + "\n" +
                                   build_log.read_text(errors="replace"))
            report["toolchain"] = (seed / "build/native-config").read_text()
            if executor.telemetry:
                report["build_external_tool_invocations"] = executor.telemetry.summarize(
                    executor.environment["EMIT_TEST_TRACE_LOG"])
        report["build_seconds"] = round(time.monotonic() - build_start, 3)
        immutable_seed = tree_digest(seed)
        # Every suite gets a fresh copy, including Git and compiled seed files;
        # no mutable library/object cache is shared between workers.
        test_start = time.monotonic()
        with concurrent.futures.ThreadPoolExecutor(max_workers=args.jobs) as pool:
            futures = [pool.submit(executor.suite, suite, seed) for suite in suites]
            for future in concurrent.futures.as_completed(futures):
                report["results"].append(future.result())
        report["test_seconds"] = round(time.monotonic() - test_start, 3)
        report["seed_unchanged"] = tree_digest(seed) == immutable_seed
        if not report["seed_unchanged"]:
            raise RuntimeError("immutable validation seed changed during worker execution")
    except Exception as error:
        executor.stop()
        narrate(str(error), True)
        report["error"] = str(error)
    finally:
        shutil.rmtree(work / "seed", ignore_errors=True)
    order = {s["id"]: i for i, s in enumerate(suites)}
    report["results"].sort(key=lambda s: order[s["id"]])
    current = regeneration_hint(ROOT)
    report["proof_inputs_unchanged"] = same_proof_inputs(hint, current)
    report["invocation_proofs"] = (verified_invocation_proofs(report["results"], hint)
                                    if report["proof_inputs_unchanged"] else {})
    if not report["proof_inputs_unchanged"] and "native_feedback" in report:
        report["native_feedback"] = native_feedback({"status": "mismatch"}, native)
        report["native_feedback"]["reason"] = "inputs changed during invocation; no proof reuse"
    report["seconds"] = round(time.monotonic() - start, 3)
    report["status"] = "passed" if (not report.get("error") and not executor.cancelled.is_set() and
        len(report["results"]) == len(suites) and
        all(r["status"] == "passed" for r in report["results"])) else "failed"
    destination = args.report or work / "report.json"
    destination.parent.mkdir(parents=True, exist_ok=True)
    destination.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    narrate("report " + args.profile + " -> " + str(destination) + " [" +
            str(len(report["results"])) + "/" + str(len(suites)) + " suites, " +
            str(report["seconds"]) + "s, " + report["status"] + "]")
    print(json.dumps(report, sort_keys=True))
    return 0 if report["status"] == "passed" else 130 if executor.interrupted else 1


if __name__ == "__main__":
    sys.exit(main())
