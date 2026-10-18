#!/usr/bin/env python3
"""Exercise baseline suite selection, retained logs, and compiler tracing."""

import contextlib
import importlib.util
import io
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch


ROOT = Path(__file__).resolve().parent.parent
SPEC = importlib.util.spec_from_file_location("baseline", ROOT / "tools/test-baseline.py")
baseline = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(baseline)


class BaselineHarnessTests(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory(prefix="emit baseline harness ")
        self.work = Path(self.temporary.name)
        self.repo = self.work / "repo"
        self.repo.mkdir()
        self._write_fixture()
        subprocess.run(["git", "init", "-q"], cwd=self.repo, check=True)
        subprocess.run(["git", "add", "--all"], cwd=self.repo, check=True)
        subprocess.run(["git", "-c", "user.name=Fixture", "-c", "user.email=fixture@invalid",
                        "-c", "commit.gpgsign=false", "commit", "-qm", "fixture"],
                       cwd=self.repo, check=True)
        self.registry = self.repo / "tools/test-registry.json"
        self.registry.write_text(json.dumps({"schema": 1, "suites": [
            {"id": "native-ok", "chez": False, "command": ["bash", "test/ok.sh"]},
            {"id": "native-fail", "chez": False, "command": ["bash", "test/fail.sh"]},
            {"id": "native-missing", "chez": False, "command": ["bash", "test/missing.sh"]},
            {"id": "config-one", "chez": False, "command": ["bash", "test/config.sh", "one"]},
            {"id": "config-two", "chez": False, "command": ["bash", "test/config.sh", "two"]},
            {"id": "chez-only", "chez": True, "command": ["chez", "test/unit.ss"]},
        ]}))
        subprocess.run(["git", "add", "--all"], cwd=self.repo, check=True)
        subprocess.run(["git", "-c", "user.name=Fixture", "-c", "user.email=fixture@invalid",
                        "-c", "commit.gpgsign=false", "commit", "-qm", "registry"],
                       cwd=self.repo, check=True)
        self.original_root = baseline.ROOT
        self.original_registry = baseline.REGISTRY
        baseline.ROOT = self.repo
        baseline.REGISTRY = self.registry
        self.original_cwd = Path.cwd()

    def tearDown(self):
        baseline.ROOT = self.original_root
        baseline.REGISTRY = self.original_registry
        os.chdir(self.original_cwd)
        self.temporary.cleanup()

    def _write_fixture(self):
        (self.repo / "tools").mkdir()
        (self.repo / "test").mkdir()
        (self.repo / "docs").mkdir()
        (self.repo / "src/passes").mkdir(parents=True)
        (self.repo / "src/runtime").mkdir(parents=True)
        (self.repo / "src/emit.cpp").write_text("int main() { return 0; }\n")
        (self.repo / "src/passes/lower.ss").write_text("fixture\n")
        (self.repo / "src/runtime/runtime.c").write_text("fixture\n")
        (self.repo / "docs/DISTRIBUTION.md").write_text("fixture\n")
        (self.repo / "Makefile").write_text(
            "all:\n"
            "\t@if [ -n \"$$CONFIG_RECORD_DIR\" ]; then printf '%s\\n%s\\n' \"$$CC\" \"$$CXX\" > \"$$CONFIG_RECORD_DIR/build\"; fi\n"
            "\t$(CXX) -c src/emit.cpp\n")
        (self.repo / "test/ok.sh").write_text("#!/bin/sh\nexit 0\n")
        (self.repo / "test/fail.sh").write_text("#!/bin/sh\nexit 23\n")
        (self.repo / "test/config.sh").write_text(
            "#!/bin/sh\n"
            "printf '%s\\n%s\\n' \"$CC\" \"$CXX\" > \"$CONFIG_RECORD_DIR/$1\"\n"
            "test -x \"$CC\" && test -x \"$CXX\"\n")

    def invoke(self, arguments, environment=None):
        stdout = io.StringIO()
        stderr = io.StringIO()
        old_environment = os.environ.copy()
        try:
            if environment:
                for key, value in environment.items():
                    if value is None:
                        os.environ.pop(key, None)
                    else:
                        os.environ[key] = value
            with patch.object(sys, "argv", ["test-baseline.py", *arguments]), \
                    contextlib.redirect_stdout(stdout), contextlib.redirect_stderr(stderr):
                status = baseline.main()
        finally:
            os.environ.clear()
            os.environ.update(old_environment)
        report = json.loads(stdout.getvalue()) if stdout.getvalue().strip().startswith("{") else None
        return status, report, stderr.getvalue()

    def test_rejects_unknown_chez_and_ambiguous_selection(self):
        for arguments in (["--suite", "missing"], ["--suite", "chez-only"],
                          ["--suite", "native-ok", "--full-native"]):
            with self.subTest(arguments=arguments), self.assertRaises(SystemExit) as failure:
                self.invoke(list(arguments))
            self.assertEqual(failure.exception.code, 2)

    def test_metadata_records_explicit_cache_and_gc_paths_without_claiming_warmth(self):
        cache = self.work / "cache"
        home = self.work / "home"
        xdg_cache = self.work / "xdg-cache"
        for path in (cache, home, xdg_cache):
            path.mkdir()
        status, report, _ = self.invoke([], {
            "EMIT_CACHE": str(cache), "HOME": str(home),
            "XDG_CACHE_HOME": str(xdg_cache), "GC_INC": "/toolchain/include",
            "GC_LIB": "/toolchain/lib",
        })
        self.assertEqual(status, 0)
        self.assertEqual(report["cache_state"], "caller-supplied locations recorded; contents unmeasured")
        for name, path in (("EMIT_CACHE", cache), ("HOME", home), ("XDG_CACHE_HOME", xdg_cache)):
            self.assertEqual(report["cache_configuration"]["variables"][name], str(path))
            self.assertTrue(report["cache_configuration"]["path_state"][name]["exists"])
        self.assertEqual(report["toolchain"]["gc_inc"], "/toolchain/include")
        self.assertEqual(report["toolchain"]["gc_lib"], "/toolchain/lib")
        self.assertEqual(report["environment"]["GC_INC"], "/toolchain/include")
        self.assertEqual(report["environment"]["GC_LIB"], "/toolchain/lib")
        self.assertEqual(report["harness_commit"], report["baseline_commit"])

    def test_metadata_marks_unset_cache_paths_unknown_and_keeps_harness_commit(self):
        status, report, _ = self.invoke([], {
            "EMIT_CACHE": None, "HOME": None, "XDG_CACHE_HOME": None,
            "GC_INC": None, "GC_LIB": None,
        })
        self.assertEqual(status, 0)
        self.assertEqual(report["cache_state"], "caller-supplied locations recorded; contents unmeasured")
        for name in ("EMIT_CACHE", "HOME", "XDG_CACHE_HOME"):
            self.assertIsNone(report["cache_configuration"]["variables"][name])
            self.assertIsNone(report["cache_configuration"]["path_state"][name]["exists"])
        self.assertIsNone(report["toolchain"]["gc_inc"])
        self.assertIsNone(report["toolchain"]["gc_lib"])
        self.assertRegex(report["harness_commit"], r"^[0-9a-f]{40}$")

    def test_inaccessible_cache_metadata_is_unknown_not_a_failed_benchmark(self):
        with patch.object(Path, "exists", side_effect=PermissionError("cache denied")):
            configuration = baseline.cache_configuration({"EMIT_CACHE": "/inaccessible"})
        self.assertIsNone(configuration["path_state"]["EMIT_CACHE"]["exists"])
        self.assertIn("cache denied", configuration["path_state"]["EMIT_CACHE"]["error"])

    def test_selected_suite_failure_is_reported_and_logs_are_retained(self):
        before = {path.relative_to(self.repo): path.read_bytes()
                  for path in self.repo.rglob("*") if path.is_file()}
        status, report, _ = self.invoke(["--suite", "native-fail"])
        self.assertEqual(status, 1)
        self.assertEqual(report["suite_results"][0]["exit_code"], 23)
        for key in ("build", "suite_native-fail"):
            self.assertTrue(Path(report["logs"][key]).is_file())
        after = {path.relative_to(self.repo): path.read_bytes()
                 for path in self.repo.rglob("*") if path.is_file()}
        self.assertEqual(before, after)

    def test_missing_snapshot_command_is_nonzero_and_reported(self):
        status, report, _ = self.invoke(["--suite", "native-missing"])
        self.assertNotEqual(status, 0)
        self.assertNotEqual(report["suite_results"][0]["exit_code"], 0)
        self.assertTrue(Path(report["logs"]["suite_native-missing"]).is_file())

    def test_trace_counts_build_and_selected_suite_and_retains_raw_logs(self):
        compiler = self.work / "fake-compiler"
        compiler.write_text("#!/bin/sh\nexit 0\n")
        compiler.chmod(0o700)
        status, report, _ = self.invoke(
            ["--suite", "native-ok", "--trace-compilers"],
            {"CC": str(compiler), "CXX": str(compiler), "PATH": os.environ["PATH"]})
        self.assertEqual(status, 0)
        self.assertEqual(report["observed_emit_cpp_compile_commands"], 1)
        self.assertEqual(report["suite_results"][0]["exit_code"], 0)
        self.assertEqual(report["suite_results"][0]["tool_counts"]["total_invocations"], 0)
        self.assertTrue((Path(report["logs"]["wrappers"]) / "cxx").is_file())
        for key in ("build", "build_trace", "suite_native-ok", "suite_trace_native-ok"):
            self.assertTrue(Path(report["logs"][key]).is_file())

    def test_trace_keeps_compiler_identity_stable_across_build_and_two_suites(self):
        compiler = self.work / "fake-compiler"
        compiler.write_text("#!/bin/sh\nexit 0\n")
        compiler.chmod(0o700)
        records = self.work / "configuration-records"
        records.mkdir()
        status, report, _ = self.invoke(
            ["--suite", "config-one", "--suite", "config-two", "--trace-compilers"],
            {"CC": str(compiler), "CXX": str(compiler), "CONFIG_RECORD_DIR": str(records),
             "PATH": os.environ["PATH"]})
        self.assertEqual(status, 0)
        expected = [str(Path(report["logs"]["wrappers"]) / "cc"),
                    str(Path(report["logs"]["wrappers"]) / "cxx")]
        for name in ("build", "one", "two"):
            record = (records / name).read_text().splitlines()
            self.assertEqual(record, expected)
        self.assertTrue(Path(expected[0]).is_file())
        self.assertTrue(Path(expected[1]).is_file())

    def test_scenario_command_selection_for_old_and_new_snapshots(self):
        (self.repo / "tools/test.sh").write_text("#!/bin/sh\nexit 0\n")
        subprocess.run(["git", "add", "--all"], cwd=self.repo, check=True)
        subprocess.run(["git", "-c", "user.name=Fixture", "-c", "user.email=fixture@invalid",
                        "-c", "commit.gpgsign=false", "commit", "-qm", "modern runner"],
                       cwd=self.repo, check=True)
        status, report, _ = self.invoke(["--scenario", "runtime"])
        self.assertEqual(status, 0)
        self.assertEqual(report["scenario_command"], ["bash", "tools/test.sh", "dev", "--changed", "HEAD"])
        (self.repo / "tools/test.sh").unlink()
        subprocess.run(["git", "add", "-A"], cwd=self.repo, check=True)
        subprocess.run(["git", "-c", "user.name=Fixture", "-c", "user.email=fixture@invalid",
                        "-c", "commit.gpgsign=false", "commit", "-qm", "old runner"],
                       cwd=self.repo, check=True)
        status, report, _ = self.invoke(["--scenario", "runtime"])
        self.assertEqual(status, 0)
        self.assertEqual(report["scenario_command"], ["bash", "run-all-tests.sh"])


if __name__ == "__main__":
    unittest.main()
