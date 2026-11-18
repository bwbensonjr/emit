#!/usr/bin/env python3
"""Deterministic checks for performance sampling and failure reporting."""

import hashlib
import importlib.util
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest


ROOT = Path(__file__).resolve().parents[1]
RUNNER = ROOT / "tools/performance-measure.py"
SPEC = importlib.util.spec_from_file_location("performance_measure", RUNNER)
MODULE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(MODULE)


class StatisticsTests(unittest.TestCase):
    def test_paired_summary_and_spread(self):
        rows = []
        for pair, (before, after) in enumerate(((2, 1), (4, 3), (6, 5))):
            for side, value in (("before", before), ("after", after)):
                rows.append({
                    "phase": "sample", "side": side, "pair": pair,
                    "metric_seconds": value, "process_cpu_seconds": value,
                    "process_wall_seconds": value + 1, "peak_resident_bytes": 100,
                })
        result = MODULE.summarize(rows, 3)
        self.assertEqual(result["before"]["metric_seconds"], {
            "median": 4, "minimum": 2, "maximum": 6,
        })
        self.assertEqual(result["median_change_percent"], -25)
        self.assertEqual(result["paired_change_percent"][:2], [-50, -25])

    def test_incomplete_pairs_fail(self):
        with self.assertRaisesRegex(MODULE.MeasurementError, "incomplete"):
            MODULE.summarize([], 1)


class RunnerTests(unittest.TestCase):
    def invoke(self, before_code="print('ok')", after_code=None, extra=None, verbosity="quiet"):
        command = [
            sys.executable, str(RUNNER), "--before", sys.executable,
            "--after", sys.executable, "--pairs", "2", "--warmups", "0",
            "--min-seconds", "0", "--before-arg=-c",
            f"--before-arg={before_code}", "--after-arg=-c",
            f"--after-arg={before_code if after_code is None else after_code}",
        ] + (extra or [])
        env = dict(os.environ, EMIT_VERBOSITY=verbosity)
        result = subprocess.run(command, env=env, capture_output=True, text=True)
        return result, json.loads(result.stdout)

    def test_process_metrics_and_alternating_order(self):
        result, report = self.invoke()
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(result.stderr, "")
        self.assertEqual(report["status"], "complete")
        self.assertEqual(report["settings"]["metric"], "process_cpu_seconds")
        samples = [row for row in report["samples"] if row["phase"] == "sample"]
        self.assertEqual([row["side"] for row in samples], ["before", "after", "after", "before"])
        self.assertGreater(samples[0]["peak_resident_bytes"], 0)
        self.assertIn("source_revision", report["provenance"]["before"]["unavailable"])

    def test_reverse_start_and_warmups(self):
        result, report = self.invoke(extra=["--start", "after", "--warmups", "1"])
        self.assertEqual(result.returncode, 0, result.stderr)
        samples = [row for row in report["samples"] if row["phase"] == "sample"]
        self.assertEqual([row["side"] for row in samples], ["after", "before", "before", "after"])
        self.assertEqual(len([row for row in report["samples"] if row["phase"] == "warmup"]), 2)

    def test_changed_input_invalidates_comparison(self):
        with tempfile.TemporaryDirectory() as directory:
            fixture = Path(directory) / "fixture.txt"
            fixture.write_text("original")
            code = f"from pathlib import Path; Path({str(fixture)!r}).write_text('changed'); print('ok')"
            result, report = self.invoke(code, extra=["--fixture", str(fixture)])
            self.assertNotEqual(result.returncode, 0)
            self.assertEqual(report["status"], "failed")
            self.assertIn("input changed during sampling", report["error"])
            self.assertNotIn("summary", report)

    def test_mismatch_preserves_failed_report(self):
        result, report = self.invoke(after_code="print('wrong')")
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(report["status"], "failed")
        self.assertNotIn("summary", report)
        self.assertIn("output mismatch", report["error"])
        self.assertIn("output mismatch", result.stderr)

    def test_failed_child_preserves_diagnostic(self):
        code = "import sys; print('broken child', file=sys.stderr); sys.exit(7)"
        result, report = self.invoke(after_code=code)
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("child exited 7", report["error"])
        self.assertIn("broken child", result.stderr)

    def test_json_metric_and_independent_oracle(self):
        before = "print('{\"cpu_seconds\":0.8,\"digest\":\"ok\"}')"
        after = "print('{\"cpu_seconds\":0.4,\"digest\":\"ok\"}')"
        result, report = self.invoke(before, after, [
            "--metric-field", "cpu_seconds", "--oracle-field", "digest",
            "--expected-oracle", '{"digest":"ok"}',
        ])
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(report["summary"]["median_change_percent"], -50)
        self.assertTrue(report["oracle"]["independent_expectation_supplied"])
        self.assertIn("reported", report["samples"][0])

    def test_calibration_scales_both_sides_and_freezes_iterations(self):
        code = (
            "import json,sys; n=int(sys.argv[1]); "
            "print(json.dumps({'cpu_seconds':n/100,'digest':'ok'}))"
        )
        result, report = self.invoke(code, extra=[
            "--before-arg={iterations}", "--after-arg={iterations}",
            "--iterations", "1", "--min-seconds", "0.5",
            "--metric-field", "cpu_seconds", "--oracle-field", "digest",
        ])
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertGreaterEqual(report["iterations"], 50)
        samples = [row for row in report["samples"] if row["phase"] == "sample"]
        self.assertEqual({row["iterations"] for row in samples}, {report["iterations"]})

    def test_short_unscalable_work_fails_instead_of_weakening_target(self):
        code = "print('{\"cpu_seconds\":0.01}')"
        result, report = self.invoke(code, extra=[
            "--metric-field", "cpu_seconds", "--min-seconds", "0.5",
        ])
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("no {iterations}", report["error"])

    def test_bad_metric_and_missing_field_fail(self):
        for payload, field in (("-1", "cpu_seconds"), ("true", "cpu_seconds"), ("1", "absent")):
            result, report = self.invoke(
                f"print('{{\"cpu_seconds\":{payload}}}')",
                extra=["--metric-field", field],
            )
            self.assertNotEqual(result.returncode, 0)
            self.assertEqual(report["status"], "failed")

    def test_timeout_and_missing_executable_fail(self):
        result, report = self.invoke("import time; time.sleep(5)", extra=["--timeout", "0.01"])
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("exceeded", report["error"])
        result, report = self.invoke(extra=["--after", "/no/such/performance-executable"])
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(report["status"], "failed")

    def test_provenance_fixture_report_and_verbosity(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            manifest = root / "metadata.json"
            manifest.write_text(json.dumps({"source_revision": "example", "toolchain": "test"}))
            expected = root / "expected.txt"
            expected.write_text("ok\n")
            retained = root / "report.json"
            result, report = self.invoke(extra=[
                "--before-metadata", str(manifest), "--fixture", str(expected),
                "--expected-output", str(expected), "--report", str(retained),
            ], verbosity="verbose")
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertEqual(json.loads(retained.read_text()), report)
            self.assertIn("measure", result.stderr)
            self.assertIn("write paired samples", result.stderr)
            self.assertEqual(report["fixtures"][0]["sha256"], hashlib.sha256(b"ok\n").hexdigest())
            self.assertEqual(report["provenance"]["before"]["supplied_metadata"]["source_revision"], "example")


if __name__ == "__main__":
    unittest.main()
