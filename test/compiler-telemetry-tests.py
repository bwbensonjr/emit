#!/usr/bin/env python3
"""External-tool tracing preserves invocation semantics and explicit counts."""

import concurrent.futures
import importlib.util
import json
import os
from pathlib import Path
import signal
import shlex
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch


sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parent.parent
spec = importlib.util.spec_from_file_location("telemetry", ROOT / "tools/test-telemetry.py")
telemetry = importlib.util.module_from_spec(spec)
spec.loader.exec_module(telemetry)


class TelemetryTests(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory(prefix="emit telemetry tests ")
        self.work = Path(self.temporary.name)
        self.tool = self.work / "real compiler 'with spaces'"
        self.tool.write_text("#!" + sys.executable + "\n" +
                             "import json, os, signal, sys\n"
                             "if '--fail' in sys.argv: sys.exit(37)\n"
                             "if '--signal' in sys.argv: os.kill(os.getpid(), signal.SIGTERM)\n"
                             "print(json.dumps({'argv': sys.argv[1:], 'pid': os.getpid(), 'cwd': os.getcwd()}))\n")
        self.tool.chmod(0o700)
        self.log = self.work / "calls with spaces.jsonl"
        self.original = {**os.environ, "CC": str(self.tool), "CXX": str(self.tool),
                         "EMIT_TEST_TRACE_LOG": str(self.log), "EMIT_VERBOSITY": "quiet"}
        self.environment = telemetry.setup(self.work / "wrapper tools", self.original)

    def tearDown(self):
        self.temporary.cleanup()

    def invoke(self, tool="cc", arguments=()):
        wrapper = Path(self.environment["EMIT_TEST_WRAPPER_DIRECTORY"]) / tool
        return subprocess.run([str(wrapper), *arguments], cwd=self.work,
                              env=self.environment, capture_output=True, text=True)

    def records(self):
        return [json.loads(line) for line in self.log.read_text().splitlines()]

    def test_argv_spaces_quotes_newlines_and_empty_are_unchanged(self):
        arguments = ["space separated", "quote'and\"double", "$HOME; $(false)", "", "line\nbreak", "-c"]
        result = self.invoke(arguments=arguments)
        self.assertEqual(result.returncode, 0, result.stderr)
        delegated = json.loads(result.stdout)
        record = self.records()[0]
        self.assertEqual(delegated["argv"], arguments)
        self.assertEqual(record["argv"], arguments)
        self.assertEqual(delegated["pid"], record["pid"])
        self.assertEqual(delegated["cwd"], record["cwd"])
        self.assertEqual(record["kind"], "compile")
        self.assertEqual(result.stderr, "")

    def test_nonzero_exit_is_preserved_and_recorded(self):
        result = self.invoke(arguments=["--fail"])
        self.assertEqual(result.returncode, 37)
        self.assertEqual(len(self.records()), 1)

    def test_signal_termination_is_preserved(self):
        result = self.invoke(arguments=["--signal"])
        self.assertEqual(result.returncode, -signal.SIGTERM)
        self.assertEqual(len(self.records()), 1)

    def test_query_and_compiler_work_counts_are_explicit(self):
        for tool, arguments in [("cc", ["--version"]), ("cxx", ["-print-resource-dir"]),
                                ("cc", ["-v"]), ("cxx", ["-###", "source.cc"]),
                                ("cc", ["-v", "-c", "source.c"]), ("cxx", ["object.o", "-o", "program"])]:
            self.assertEqual(self.invoke(tool, arguments).returncode, 0)
        summary = telemetry.summarize(self.log)
        self.assertEqual(summary["compiler_invocations"], 6)
        self.assertEqual(summary["compiler_query_invocations"], 4)
        self.assertEqual(summary["compiler_work_invocations"], 2)
        self.assertEqual(summary["tools"]["cc"]["invocations"], 3)
        self.assertEqual(summary["tools"]["cxx"]["invocations"], 3)
        self.assertEqual(summary["scope"], "observed-external-tool-invocations-only")

    def test_actual_make_and_recursive_make_are_counted(self):
        (self.work / "Makefile").write_text("all:\n\t@$(MAKE) --no-print-directory nested\nnested:\n\t@true\n")
        result = subprocess.run(["make", "--no-print-directory"], cwd=self.work,
                                env=self.environment, capture_output=True, text=True)
        self.assertEqual(result.returncode, 0, result.stderr)
        summary = telemetry.summarize(self.log)
        self.assertEqual(summary["make_invocations"], 2)
        self.assertEqual(summary["compiler_invocations"], 0)
        self.assertEqual({record["kind"] for record in self.records()}, {"make"})

    def test_parallel_records_are_complete_json_lines(self):
        with concurrent.futures.ThreadPoolExecutor(max_workers=4) as workers:
            results = list(workers.map(lambda number: self.invoke(arguments=[str(number)]), range(20)))
        self.assertTrue(all(result.returncode == 0 for result in results))
        self.assertEqual(len(self.records()), 20)
        self.assertEqual(telemetry.summarize(self.log)["compiler_invocations"], 20)

    def test_setup_does_not_mutate_supplied_environment(self):
        self.assertEqual(self.original["CC"], str(self.tool))
        self.assertNotIn("EMIT_TEST_COMPILER_MAP", self.original)
        mapping = json.loads(self.environment["EMIT_TEST_COMPILER_MAP"])
        self.assertEqual(mapping["cc"], str(self.tool))
        self.assertEqual(mapping["cxx"], str(self.tool))
        self.assertTrue(Path(mapping["make"]).is_absolute())

    def test_missing_compiler_selection_uses_shared_discovery(self):
        fixture = self.work / "discovery"
        (fixture / "tools").mkdir(parents=True)
        (fixture / "tools/llvm-env.sh").write_text(
            "export CC=" + shlex.quote(str(self.tool)) + " CXX=" + shlex.quote(str(self.tool)) + "\n")
        environment = dict(self.original)
        environment.pop("CC")
        environment.pop("CXX")
        with patch.object(telemetry, "ROOT", fixture):
            selected = telemetry.selected_programs(environment)
        self.assertEqual(selected["cc"], str(self.tool))
        self.assertEqual(selected["cxx"], str(self.tool))

    def test_unavailable_selected_tool_is_explicit_failure(self):
        with self.assertRaisesRegex(ValueError, "unavailable"):
            telemetry.setup(self.work / "missing", {**self.original, "CC": str(self.work / "absent")})

    def test_nested_setup_does_not_double_count_or_recurse(self):
        self.environment = telemetry.setup(self.work / "second wrapper", self.environment)
        result = self.invoke(arguments=["-c", "source.c"])
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(len(self.records()), 1)

    def test_missing_log_is_zero_observed_calls(self):
        self.assertEqual(telemetry.summarize(self.log)["total_invocations"], 0)

    def test_invalid_log_is_not_silently_ignored(self):
        self.log.write_text("not JSON\n")
        with self.assertRaisesRegex(ValueError, "invalid telemetry record"):
            telemetry.summarize(self.log)

    def test_wrapper_does_not_resolve_python_from_path(self):
        self.environment["PATH"] = self.environment["EMIT_TEST_WRAPPER_DIRECTORY"]
        result = self.invoke(arguments=["unchanged"])
        self.assertEqual(result.returncode, 0, result.stderr)

    def test_cli_preserves_output_exit_and_quiet(self):
        result = subprocess.run([sys.executable, str(ROOT / "tools/test-telemetry.py"),
                                 "--log", str(self.log), "--", "sh", "-c", '"$CC" "literal argument"; exit 23'],
                                env=self.original, capture_output=True, text=True)
        self.assertEqual(result.returncode, 23, result.stderr)
        self.assertEqual(json.loads(result.stdout)["argv"], ["literal argument"])
        self.assertEqual(result.stderr, "")

    def test_cli_requires_a_command(self):
        result = subprocess.run([sys.executable, str(ROOT / "tools/test-telemetry.py"),
                                 "--log", str(self.log)], env=self.original, capture_output=True, text=True)
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("command is required", result.stderr)

    def test_cli_preserves_child_signal_termination(self):
        result = subprocess.run([sys.executable, str(ROOT / "tools/test-telemetry.py"),
                                 "--log", str(self.log), "--", sys.executable, "-c",
                                 "import os,signal; os.kill(os.getpid(), signal.SIGTERM)"],
                                env=self.original, capture_output=True, text=True)
        self.assertEqual(result.returncode, -signal.SIGTERM)


if __name__ == "__main__":
    unittest.main(verbosity=2)
