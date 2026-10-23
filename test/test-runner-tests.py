#!/usr/bin/env python3
"""Hermetic runner contract, isolation, failure, and cancellation tests."""

import importlib.util
import json
import os
from pathlib import Path
import signal
import shutil
import subprocess
import sys
import tempfile
import time
import unittest
from unittest import mock


ROOT = Path(__file__).resolve().parent.parent
spec = importlib.util.spec_from_file_location("runner", ROOT / "tools/test-runner.py")
runner = importlib.util.module_from_spec(spec)
spec.loader.exec_module(runner)


def suite(name, script):
    return {"id": name, "command": [sys.executable, "-c", script],
            "profiles": ["dev"], "coverage": [name], "chez": False,
            "needs_build": False, "isolation": "workspace"}


def cancelled_child_stopped(child):
    try:
        os.kill(child, 0)
    except ProcessLookupError:
        return True
    # Only procfs hosts can infer disappearance from a missing status file.
    if sys.platform.startswith("linux") and Path("/proc").is_dir():
        try:
            status = (Path("/proc") / str(child) / "stat").read_text()
        except (FileNotFoundError, ProcessLookupError):
            return True
        return status.split(")", 1)[1].split()[0] == "Z"
    return False


class RunnerTests(unittest.TestCase):
    def test_cancelled_child_status_disappears_during_read(self):
        with mock.patch.object(os, "kill"), mock.patch.object(sys, "platform", "linux"), \
                mock.patch.object(Path, "is_dir", return_value=True):
            for error in (FileNotFoundError, ProcessLookupError):
                with self.subTest(error=error), mock.patch.object(Path, "read_text", side_effect=error):
                    self.assertTrue(cancelled_child_stopped(123))
            for state, stopped in (("S", False), ("Z", True)):
                with mock.patch.object(Path, "read_text", return_value="123 (child) " + state):
                    self.assertEqual(cancelled_child_stopped(123), stopped)
            with mock.patch.object(Path, "read_text", side_effect=PermissionError):
                with self.assertRaises(PermissionError):
                    cancelled_child_stopped(123)
        with mock.patch.object(os, "kill"), mock.patch.object(sys, "platform", "darwin"):
            self.assertFalse(cancelled_child_stopped(123))
        with mock.patch.object(os, "kill", side_effect=ProcessLookupError):
            self.assertTrue(cancelled_child_stopped(123))

    def test_private_git_environment_ignores_ambient_worktree_redirects(self):
        with mock.patch.dict(os.environ, {"GIT_DIR": "/unrelated", "GIT_INDEX_FILE": "/unrelated-index",
                                          "GITHUB_WORKFLOW": "validation"}):
            environment = runner.validation_environment()
            self.assertNotIn("GIT_DIR", environment)
            self.assertNotIn("GIT_INDEX_FILE", environment)
            self.assertEqual(environment["GITHUB_WORKFLOW"], "validation")
        with mock.patch.dict(os.environ, {"DESTDIR": "/unrelated-install"}):
            self.assertNotIn("DESTDIR", runner.validation_environment())
        with mock.patch.dict(os.environ, {"MAKEFLAGS": "DESTDIR=/unrelated-install"}):
            self.assertNotIn("MAKEFLAGS", runner.validation_environment())

    def test_private_home_cache_and_temporary_directories(self):
        with tempfile.TemporaryDirectory() as directory:
            target = Path(directory) / "environment"
            env = runner.workspace_environment({"CC": "/explicit/compiler"}, target)
            for name in ("HOME", "XDG_CACHE_HOME", "XDG_CONFIG_HOME", "XDG_DATA_HOME",
                         "XDG_STATE_HOME", "TMPDIR", "TMP", "TEMP", "EMIT_CACHE"):
                self.assertTrue(Path(env[name]).is_relative_to(target))
            self.assertEqual(env["CC"], "/explicit/compiler")

    def test_inherited_destdir_cannot_redirect_fixture_install(self):
        with tempfile.TemporaryDirectory() as directory:
            outside = Path(directory) / "outside"
            makefile = ("install:\n\t@mkdir -p $(DESTDIR)$(PREFIX)\n"
                        "\t@touch $(DESTDIR)$(PREFIX)/installed-marker\n")
            script = ("from pathlib import Path; import os,subprocess; "
                      "assert not os.environ.get(\"DESTDIR\"); "
                      "Path(\"Makefile\").write_text(" + repr(makefile) + "); "
                      "subprocess.run([\"make\",\"install\",\"PREFIX=\"+"
                      "str(Path.cwd()/\"private-prefix\")],check=True); "
                      "assert Path(\"private-prefix/installed-marker\").exists()")
            with mock.patch.dict(os.environ, {"DESTDIR": str(outside),
                                              "MAKEFLAGS": "DESTDIR=" + str(outside)}):
                result, report = self.run_fixture([suite("install", script)])
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertFalse(outside.exists())

    def test_selection_rejects_unknown_empty_and_duplicates(self):
        data = {"suites": [suite("one", "pass")]}
        with self.assertRaisesRegex(ValueError, "unknown"):
            runner.select(data, "dev", ["missing"])
        with self.assertRaisesRegex(ValueError, "empty"):
            runner.select(data, "source", [])
        self.assertEqual(len(runner.select(data, "source", ["one", "one"])), 1)

    def test_registry_validation(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "registry.json"
            path.write_text(json.dumps({"schema": 1, "suites": []}))
            with self.assertRaises(ValueError):
                runner.registry(path)
            entry = suite("one", "pass")
            path.write_text(json.dumps({"schema": 1, "suites": [entry, entry]}))
            with self.assertRaisesRegex(ValueError, "duplicate"):
                runner.registry(path)

    def run_fixture(self, entries, *args, verbosity="quiet", path=None):
        with tempfile.TemporaryDirectory() as directory:
            registry = Path(directory) / "registry.json"
            report = Path(directory) / "report.json"
            registry.write_text(json.dumps({"schema": 1, "suites": entries}))
            environment = dict(os.environ, EMIT_VERBOSITY=verbosity)
            if path is not None:
                environment["PATH"] = path
            result = subprocess.run([sys.executable, str(ROOT / "tools/test-runner.py"),
                                     "--registry", str(registry), "--report", str(report),
                                     *args], text=True, capture_output=True,
                                    env=environment, timeout=45)
            payload = json.loads(result.stdout) if result.stdout else None
            if report.exists():
                self.assertEqual(payload, json.loads(report.read_text()))
            return result, payload

    def test_missing_chez_fails_with_report_not_success_skip(self):
        entry = suite("source-unit", "pass")
        entry["chez"] = True
        result, report = self.run_fixture([entry], path="/usr/bin:/bin")
        self.assertEqual(result.returncode, 2)
        self.assertEqual(report["status"], "failed")
        self.assertIn("requires chez", report["error"])

    def test_external_snapshot_symlinks_are_rejected(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory) / "root"
            root.mkdir()
            (root / "outside").symlink_to(directory)
            with mock.patch.object(runner.subprocess, "check_output", return_value=b"outside\0"):
                with self.assertRaisesRegex(ValueError, "external symlink"):
                    runner.snapshot(root, Path(directory) / "snapshot")

    def test_readonly_units_share_immutable_inputs(self):
        entry = suite("readonly", "from pathlib import Path; assert Path(\"VERSION\").exists()")
        entry["isolation"] = "readonly"
        result, report = self.run_fixture([entry])
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertTrue(report["seed_unchanged"])
        self.assertEqual(report["results"][0]["isolation"], "shared-readonly-source")

    def test_readonly_mutation_fails_without_touching_checkout(self):
        before = (ROOT / "VERSION").read_bytes()
        entry = suite("bad-readonly", "from pathlib import Path; Path(\"VERSION\").write_text(\"bad\")")
        entry["isolation"] = "readonly"
        result, report = self.run_fixture([entry])
        self.assertEqual(result.returncode, 1)
        self.assertFalse(report["seed_unchanged"])
        self.assertIn("immutable", report["error"])
        self.assertEqual((ROOT / "VERSION").read_bytes(), before)

    def test_report_failure_and_output_discipline(self):
        result, report = self.run_fixture([suite("failed", "print(123); raise SystemExit(7)")])
        self.assertEqual(result.returncode, 1)
        self.assertEqual(report["results"][0]["exit_code"], 7)
        self.assertEqual(report["status"], "failed")
        self.assertIn("123", result.stderr)
        self.assertTrue(Path(report["results"][0]["log"]).exists())

    def test_verbosity_keeps_stdout_json(self):
        for verbosity in ("quiet", "default", "verbose"):
            result, report = self.run_fixture([suite("good", "print(456)")], verbosity=verbosity)
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertEqual(report["status"], "passed")
            self.assertEqual("test:" in result.stderr, verbosity != "quiet")
            self.assertEqual("456" in result.stderr, verbosity == "verbose")

    def test_serial_parallel_agree_and_mutations_are_isolated(self):
        # Each worker deliberately writes the same configuration path.
        entries = [suite(name, "from pathlib import Path; import time; "
                         "p=Path(\"VERSION\"); p.write_text(\"" + name + "\"); "
                         "time.sleep(.1); assert p.read_text()==\"" + name + "\"")
                   for name in ("one", "two")]
        before = (ROOT / "VERSION").read_bytes()
        for jobs in (1, 2):
            result, report = self.run_fixture(entries, "--jobs", str(jobs))
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertEqual([row["status"] for row in report["results"]], ["passed", "passed"])
        self.assertEqual((ROOT / "VERSION").read_bytes(), before)

    def test_cancel_terminates_children_and_retains_report(self):
        with tempfile.TemporaryDirectory() as directory:
            work = Path(directory)
            seed = work / "seed"
            seed.mkdir()
            executor = runner.Executor(work, 1)
            entry = suite("sleep", "import time; time.sleep(30)")
            import concurrent.futures
            with concurrent.futures.ThreadPoolExecutor(1) as pool:
                future = pool.submit(executor.suite, entry, seed)
                deadline = time.monotonic() + 5
                while not executor.processes and time.monotonic() < deadline:
                    time.sleep(.01)
                executor.stop()
                result = future.result(timeout=6)
            self.assertEqual(result["status"], "cancelled")
            self.assertFalse(executor.processes)

    def test_interrupted_invocation_writes_failed_report_with_cancelled_results(self):
        with tempfile.TemporaryDirectory() as directory:
            work = Path(directory)
            marker = work / "started"
            registry = work / "registry.json"
            report = work / "report.json"
            entries = [suite("active", "from pathlib import Path; import time; Path(" +
                             repr(str(marker)) + ").touch(); time.sleep(30)"),
                       suite("queued", "raise SystemExit(0)")]
            registry.write_text(json.dumps({"schema": 1, "suites": entries}))
            process = subprocess.Popen([sys.executable, str(ROOT / "tools/test-runner.py"),
                                        "--registry", str(registry), "--report", str(report),
                                        "--jobs", "1", "-q"], text=True,
                                       stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            try:
                deadline = time.monotonic() + 15
                while not marker.exists() and time.monotonic() < deadline:
                    time.sleep(.01)
                self.assertTrue(marker.exists())
                process.send_signal(signal.SIGINT)
                stdout, stderr = process.communicate(timeout=8)
                self.assertEqual(process.returncode, 130, stderr)
                payload = json.loads(stdout)
                self.assertEqual(payload, json.loads(report.read_text()))
                self.assertEqual(payload["status"], "failed")
                self.assertEqual([row["status"] for row in payload["results"]],
                                 ["cancelled", "cancelled"])
                self.assertTrue(Path(payload["logs"]).is_dir())
            finally:
                if process.poll() is None:
                    process.send_signal(signal.SIGTERM)
                    process.communicate(timeout=8)

    def test_cancel_cleans_timeout_separate_group_and_term_ignoring_child(self):
        timeout = shutil.which("timeout")
        if timeout is None:
            self.skipTest("GNU timeout is not installed")
        with tempfile.TemporaryDirectory() as directory:
            work = Path(directory)
            seed = work / "seed"
            seed.mkdir()
            marker = work / "child.json"
            executor = runner.Executor(work, 1)
            script = ("import json,os,signal,time; from pathlib import Path; "
                      "signal.signal(signal.SIGTERM,signal.SIG_IGN); "
                      "Path(" + repr(str(marker)) + ").write_text(json.dumps("
                      "[os.getpid(),os.getpgrp(),os.getsid(0)])); time.sleep(30)")
            # The trailing echo keeps Bash alive; GNU timeout changes its own
            # process group without changing the suite's private session.
            entry = suite("timeout-child", "")
            import shlex
            entry["command"] = ["bash", "-c", shlex.join(
                [timeout, "30", sys.executable, "-c", script]) + "; echo finished"]
            import concurrent.futures
            with concurrent.futures.ThreadPoolExecutor(1) as pool:
                future = pool.submit(executor.suite, entry, seed)
                deadline = time.monotonic() + 5
                while not marker.exists() and time.monotonic() < deadline:
                    time.sleep(.01)
                self.assertTrue(marker.exists())
                child, group, session = json.loads(marker.read_text())
                self.assertNotEqual(group, session)
                self.assertIn(child, runner.session_members(session))
                executor.stop(signal.SIGINT)
                result = future.result(timeout=6)
            self.assertEqual(result["status"], "cancelled")
            self.assertFalse(executor.processes)
            # Linux containers can leave an orphan zombie awaiting PID 1's
            # reap. It is no longer running or capable of writing fixture data.
            deadline = time.monotonic() + 3
            while time.monotonic() < deadline:
                if cancelled_child_stopped(child):
                    break
                time.sleep(.01)
            else:
                self.fail("cancelled timeout descendant is still running")


if __name__ == "__main__":
    unittest.main()
