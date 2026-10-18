#!/usr/bin/env python3
"""Native-source labels and invocation-local proof boundaries."""

import importlib.util
import contextlib
import io
import json
import os
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch


sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parent.parent
spec = importlib.util.spec_from_file_location("emit_runner", ROOT / "tools/test-runner.py")
runner = importlib.util.module_from_spec(spec)
spec.loader.exec_module(runner)


def identity(status="matching"):
    return {"status": status, "source_digest": "1" * 64,
            "bootstrap_digest": "2" * 64, "toolchain_digest": "3" * 64}


class NativeLabelTests(unittest.TestCase):
    def test_matching_local_regeneration_is_named_but_not_source_proof(self):
        label = runner.native_feedback(identity())
        self.assertEqual(label["label"], "current-source-regenerated")
        self.assertTrue(label["current_source_regenerated"])
        self.assertIn("not an independent source proof", label["claim"])

    def test_missing_or_mismatched_regeneration_never_claims_edited_source(self):
        for status in ("missing", "mismatch", "unknown"):
            label = runner.native_feedback(identity(status))
            self.assertEqual(label["label"], "committed-bootstrap-only")
            self.assertFalse(label["current_source_regenerated"])
            self.assertIn("make regen", label["next_steps"])

    def test_units_and_source_do_not_claim_native_coverage(self):
        label = runner.native_feedback(identity(), native=False)
        self.assertEqual(label["label"], "not-native-validation")
        self.assertFalse(label["current_source_regenerated"])

    def test_unavailable_fingerprint_is_not_current(self):
        with tempfile.TemporaryDirectory() as directory:
            hint = runner.regeneration_hint(Path(directory))
        self.assertEqual(hint["status"], "missing")
        self.assertEqual(runner.native_feedback(hint)["label"], "committed-bootstrap-only")

    def test_malformed_status_or_hash_cannot_claim_current_source(self):
        import subprocess
        import json
        for value in ({"status": "matching"}, {**identity(), "source_digest": "invalid"},
                      {**identity(), "status": "trusted"}):
            completed = subprocess.CompletedProcess([], 0, json.dumps(value), "")
            with patch.object(runner.subprocess, "run", return_value=completed):
                hint = runner.regeneration_hint(ROOT)
            self.assertEqual(hint["status"], "missing")

    def test_json_run_report_contains_truthful_native_label(self):
        suite = {"id": "fixture", "profiles": ["dev"], "command": ["true"],
                 "needs_build": True}
        for status in ("matching", "missing", "mismatch"):
            with tempfile.TemporaryDirectory() as directory:
                root = Path(directory)
                seed = root / "seed"
                (seed / "build").mkdir(parents=True)
                (seed / "build/native-config").write_text("fixture toolchain\n")
                report = root / "report.json"
                result = {"id": "fixture", "status": "passed", "exit_code": 0}
                with contextlib.ExitStack() as stack:
                    stack.enter_context(patch.object(runner, "ROOT", root))
                    stack.enter_context(patch.object(runner, "registry", return_value={"suites": [suite]}))
                    stack.enter_context(patch.object(runner, "snapshot", return_value=seed))
                    stack.enter_context(patch.object(runner, "initialize_git"))
                    stack.enter_context(patch.object(runner, "regeneration_hint", return_value=identity(status)))
                    stack.enter_context(patch.object(runner.subprocess, "check_output", return_value="fixture"))
                    stack.enter_context(patch.object(runner.platform, "platform", return_value="fixture"))
                    stack.enter_context(patch.object(runner.Executor, "command", return_value=0))
                    stack.enter_context(patch.object(runner.Executor, "suite", return_value=result))
                    stack.enter_context(patch.object(runner.signal, "signal"))
                    stack.enter_context(patch.object(sys, "argv", ["test-runner.py", "--report", str(report)]))
                    stack.enter_context(patch.dict(os.environ, {"EMIT_VERBOSITY": "quiet"}))
                    stack.enter_context(contextlib.redirect_stdout(io.StringIO()))
                    self.assertEqual(runner.main(), 0)
                contents = json.loads(report.read_text())
                label = contents["native_feedback"]
                self.assertEqual(contents["regeneration"]["status"], status)
                self.assertEqual(label["current_source_regenerated"], status == "matching")
                self.assertEqual(label["label"], "current-source-regenerated" if status == "matching"
                                 else "committed-bootstrap-only")


class InvocationProofTests(unittest.TestCase):
    def proof(self):
        return {**identity(), "proof": "source-consistency", "status": "passed"}

    def test_passing_exact_hash_proof_can_be_reused_within_invocation(self):
        proof = self.proof()
        result = runner.verified_invocation_proofs([{"status": "passed", "proof": proof}], identity())
        self.assertEqual(result, {"source-consistency": proof})

    def test_source_bootstrap_or_toolchain_changes_invalidate_reuse(self):
        for key in ("source_digest", "bootstrap_digest", "toolchain_digest"):
            proof = {**self.proof(), key: "4" * 64}
            result = runner.verified_invocation_proofs([{"status": "passed", "proof": proof}], identity())
            self.assertEqual(result, {}, key)

    def test_missing_cancelled_and_failed_proofs_cannot_be_reused(self):
        for status in ("failed", "cancelled", "skipped"):
            self.assertEqual(runner.verified_invocation_proofs(
                [{"status": status, "proof": self.proof()}], identity()), {})
        self.assertEqual(runner.verified_invocation_proofs([{"status": "passed"}], identity()), {})
        self.assertEqual(runner.verified_invocation_proofs(
            [{"status": "passed", "proof": {**self.proof(), "status": "failed"}}], identity()), {})

    def test_no_persistent_or_cross_invocation_proof_cache(self):
        runner.verified_invocation_proofs([{"status": "passed", "proof": self.proof()}], identity())
        self.assertEqual(runner.verified_invocation_proofs([], identity()), {})

    def test_explicit_duplicate_suite_selection_runs_source_proof_once(self):
        data = {"suites": [{"id": "source-consistency", "profiles": ["source"]}]}
        selected = runner.select(data, "source", ["source-consistency", "source-consistency"])
        self.assertEqual(len(selected), 1)


if __name__ == "__main__":
    unittest.main(verbosity=2)
