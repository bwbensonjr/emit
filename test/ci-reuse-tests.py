#!/usr/bin/env python3
"""Reuse lookup fixtures (change: reuse-validation-by-tree, design D2).

Responses are replayed, not fetched. Their shapes follow the real 0.11.0 records: merge commit
269b8b9 is associated with pull request #199, whose head 4fdd4d3 ran Source compatibility as run
44898188684 in bwbensonjr/emit.
"""
from importlib.machinery import SourceFileLoader
import contextlib
import io
import json
import os
from pathlib import Path
import sys
import zipfile
sys.dont_write_bytecode = True
import unittest

ROOT = Path(__file__).resolve().parent.parent
os.environ["EMIT_VERBOSITY"] = "verbose"
reuse = SourceFileLoader("ci_reuse_fixture", str(ROOT / "tools/ci-reuse.py")).load_module()
policy = reuse.policy

REPO = "bwbensonjr/emit"
MERGE = "269b8b93cc3f40b372a2b59d55effb15736fb28e"
HEAD = "4fdd4d36f5870277c6ef5640c3ca4e4f7648acdf"
MERGE_REF = "9" * 40
TREE = "a56b233d10028cd5dd8dd431c4d23dae82102711"
RUN = 44898188684
ARTIFACT = 14705000001


def classification(**overrides):
    result = {"docs_only": False, "code": True, "source": False, "units": False, "archive": False,
              "reference": [], "categories": ["host"], "paths": ["src/emit.cpp"], "reason": "fixture",
              "toolchain": False}
    result.update(overrides)
    return result


def executed(event="pull_request", **overrides):
    return policy.plan(classification(**overrides), event, tree=TREE, sha=MERGE_REF)


def artifact_zip(plan):
    buffer = io.BytesIO()
    with zipfile.ZipFile(buffer, "w") as archive:
        archive.writestr("plan.json", json.dumps(plan))
        archive.writestr("classification.json", json.dumps(plan.get("classification", {})))
    return buffer.getvalue()


class Replay:
    """A recorded GitHub: path -> JSON value, bytes, or an exception to raise."""

    def __init__(self, responses):
        self.responses = responses
        self.calls = []

    def lookup(self, path):
        self.calls.append(path)
        if path not in self.responses:
            raise RuntimeError(f"gh api {path}: HTTP 404")
        value = self.responses[path]
        if isinstance(value, Exception):
            raise value
        return value

    def json(self, path):
        return self.lookup(path)

    def bytes(self, path):
        return self.lookup(path)


def world(candidate_plan, head_repo=REPO, run_repo=REPO, conclusion="success", job="success",
          artifacts=None):
    runs_path = (f"repos/{REPO}/actions/workflows/compatibility.yml/runs"
                 f"?event=pull_request&head_sha={HEAD}&per_page=20")
    if artifacts is None:
        artifacts = [{"id": 1, "name": "compatibility-Linux-23", "expired": False},
                     {"id": ARTIFACT, "name": "validation-plan", "expired": False}]
    return {
        f"repos/{REPO}/commits/{MERGE}/pulls": [
            {"number": 199, "head": {"sha": HEAD, "repo": {"full_name": head_repo}}}],
        runs_path: {"workflow_runs": [
            {"id": RUN, "conclusion": conclusion, "head_sha": HEAD,
             "html_url": f"https://github.com/{REPO}/actions/runs/{RUN}",
             "head_repository": {"full_name": run_repo}}]},
        f"repos/{REPO}/actions/runs/{RUN}/jobs?per_page=100": {"jobs": [
            {"name": "policy", "conclusion": "success"},
            {"name": "Required validation", "conclusion": job}]},
        f"repos/{REPO}/actions/runs/{RUN}/artifacts?per_page=100": {"artifacts": artifacts},
        f"repos/{REPO}/actions/artifacts/{ARTIFACT}/zip": artifact_zip(candidate_plan),
    }


class ReuseTests(unittest.TestCase):
    def decide(self, responses, event="push", current=None):
        current = current or executed(event)
        client = Replay(responses)
        self.narration = io.StringIO()
        with contextlib.redirect_stderr(self.narration):
            result, reason = reuse.decide(client, REPO, event, MERGE, current)
        return current, result, reason, client

    def assert_executes(self, responses, expected, event="push", current=None):
        """The plan is unchanged and the reason, or a narrated rejection, names EXPECTED."""
        current, result, reason, _ = self.decide(responses, event, current)
        self.assertEqual(result, current)
        self.assertTrue(result["execute"])
        self.assertIn(expected, reason + "\n" + self.narration.getvalue())

    def test_eligible_same_tree_run_is_reused(self):
        current, result, reason, _ = self.decide(world(executed()))
        self.assertIsNone(reason)
        self.assertFalse(result["execute"])
        self.assertEqual(result["required"], ["policy"])
        self.assertEqual(result["reused"], {"run": f"https://github.com/{REPO}/actions/runs/{RUN}",
                                            "sha": MERGE_REF, "tree": TREE, "mode": "normal"})

    def test_release_tag_reuses_a_full_release_pull_request(self):
        full = executed(categories=["release"], archive=True)
        _, result, reason, _ = self.decide(world(full), "tag")
        self.assertIsNone(reason)
        self.assertEqual(result["required"], ["policy", "prepare", "package", "archive"])
        self.assertEqual(result["reused"]["mode"], "full")

    def test_normal_run_does_not_cover_a_tag(self):
        self.assert_executes(world(executed()), "rejected  [plan omits required", "tag")

    def test_different_tree_executes(self):
        self.assert_executes(world(dict(executed(), tree="b" * 40)), "differs from " + TREE[:12])

    def test_fork_head_and_fork_run_are_rejected(self):
        self.assert_executes(world(executed(), head_repo="someone/emit"), "#199 -> rejected  [head is in a fork]")
        self.assert_executes(world(executed(), run_repo="someone/emit"), "[run is from a fork]")

    def test_failed_run_or_required_job_is_rejected(self):
        self.assert_executes(world(executed(), conclusion="failure"), "[concluded failure]")
        self.assert_executes(world(executed(), job="failure"), "[Required validation did not succeed]")

    def test_missing_or_expired_artifact_is_rejected(self):
        self.assert_executes(world(executed(), artifacts=[]), "[run has no validation-plan artifact]")
        expired = [{"id": ARTIFACT, "name": "validation-plan", "expired": True}]
        self.assert_executes(world(executed(), artifacts=expired), "[validation-plan artifact has expired]")
        corrupt = world(executed())
        corrupt[f"repos/{REPO}/actions/artifacts/{ARTIFACT}/zip"] = b"not a zip"
        self.assert_executes(corrupt, "[File is not a zip file]")

    def test_plan_without_tree_is_rejected(self):
        # Every run recorded before this change, including the real run 44898188684.
        older = executed()
        del older["tree"]
        self.assert_executes(world(older), "[plan has no recorded tree]")

    def test_chained_reuse_is_rejected(self):
        source = {"run": "https://github.com/o/r/actions/runs/1", "sha": "1" * 40, "tree": TREE, "mode": "normal"}
        self.assert_executes(world(policy.apply_reuse(executed(), source)), "[plan itself reused another run]")

    def test_api_error_falls_back_to_execution(self):
        responses = world(executed())
        responses[f"repos/{REPO}/commits/{MERGE}/pulls"] = RuntimeError("gh api: HTTP 502")
        self.assert_executes(responses, "lookup failed")
        self.assert_executes({}, "lookup failed")

    def test_non_reusable_events_and_plans_make_no_calls(self):
        for event in ("pull_request", "schedule", "workflow_dispatch"):
            current, result, reason, client = self.decide(world(executed()), event)
            self.assertEqual((result, client.calls), (current, []))
            self.assertIn("always execute", reason)
        toolchain = dict(executed("push"), toolchain=True)
        self.assert_executes(world(executed()), "toolchain", current=toolchain)
        self.assert_executes(world(executed()), "no recorded tree", current=dict(executed("push"), tree=None))

    def test_rejections_are_narrated_with_run_and_pull_request(self):
        self.decide(world(executed(), job="failure"))
        self.assertIn("reuse: run 44898188684 (#199) -> rejected  [Required validation did not succeed]",
                      self.narration.getvalue())


if __name__ == "__main__":
    unittest.main()
