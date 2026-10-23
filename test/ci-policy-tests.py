#!/usr/bin/env python3
"""CI plan, required-proof failure injection, and concurrency fixtures."""
from importlib.machinery import SourceFileLoader
import json
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
sys.dont_write_bytecode = True
import unittest

ROOT = Path(__file__).resolve().parent.parent
policy = SourceFileLoader("policy_fixture", str(ROOT / "tools/ci-policy.py")).load_module()


def classification(**overrides):
    result = {"docs_only": False, "code": True, "source": False, "units": False,
              "archive": False, "reference": [], "categories": ["host"], "paths": ["src/emit.cpp"], "reason": "fixture"}
    result.update(overrides)
    return result


class PolicyTests(unittest.TestCase):
    def test_channel_library_preparation_hooks(self):
        with tempfile.TemporaryDirectory() as directory:
            rendered = Path(directory) / "emit.rb"
            subprocess.run([str(ROOT / "tools/channel-render.sh"), "homebrew",
                            str(ROOT / "packaging/release.json"), str(rendered)], check=True)
            formula = rendered.read_text()
            self.assertIn('"WARM_STDLIB=0"', formula.split("def post_install", 1)[0])
            hook = formula.split("def post_install", 1)[1].split("\n  test do", 1)[0]
            self.assertIn('system bin/"emit", "build", "--stdlib"', hook)
            self.assertIn("rescue ErrorDuringExecution", hook)
            self.assertIn("opoo", hook)
            self.assertIn("def post_install", formula)
            if shutil.which("ruby"):
                # Exercise the formula hook without installing a tap or dependencies.
                subprocess.run(["ruby", "-e", """
require "pathname"
class ErrorDuringExecution < StandardError; end
class Formula
  def self.method_missing(*); end
  def self.test; end
  attr_reader :calls, :warning
  attr_accessor :fail_prepare
  def bin; Pathname.new("/fixture/bin"); end
  def system(*args)
    @calls = args.map(&:to_s)
    raise ErrorDuringExecution if fail_prepare
  end
  def opoo(message); @warning = message; end
end
load ARGV.fetch(0)
formula = Emit.new
formula.post_install
abort "wrong preparation command" unless formula.calls == ["/fixture/bin/emit", "build", "--stdlib"]
formula.fail_prepare = true
formula.post_install
abort "missing retry instruction" unless formula.warning.include?("retry emit build --stdlib")
""", str(rendered)], check=True)
        self.assertIn('"WARM_STDLIB=0"', (ROOT / "packaging/nix/emit.nix").read_text())
        self.assertIn("TOOLCHAIN_PIN=1 WARM_STDLIB=0",
                      (ROOT / "packaging/oci/Containerfile").read_text())

    def test_documentation_has_no_toolchains(self):
        plan = policy.plan(classification(docs_only=True, code=False), "pull_request")
        self.assertEqual(plan["required"], ["policy"])

    def test_ordinary_code_has_four_native_cells(self):
        for category in ["runtime", "host", "library", "unknown"]:
            plan = policy.plan(classification(categories=[category]), "pull_request")
            self.assertTrue(plan["code"])
            self.assertEqual(plan["mode"], "normal")
            self.assertEqual(plan["required"], ["policy", "prepare", "native"])

    def test_compiler_bootstrap_and_assembly_need_canonical_proofs(self):
        for category in ["compiler", "bootstrap", "assembly"]:
            plan = policy.plan(classification(categories=[category], source=True, units=True,
                                             reference=["self-emission", "dump-parity"]), "pull_request")
            self.assertTrue(plan["verification"])
            self.assertTrue(plan["source"])
            self.assertFalse(plan["reference_full"])

    def test_release_infrastructure_rehearses_archives(self):
        plan = policy.plan(classification(archive=True), "pull_request")
        self.assertIn("package", plan["required"])
        self.assertIn("archive", plan["required"])

    def test_weekly_manual_and_tag_are_comprehensive(self):
        for event in ["schedule", "workflow_dispatch", "tag"]:
            plan = policy.plan(classification(docs_only=True, code=False), event)
            self.assertEqual(plan["mode"], "full")
            self.assertTrue(plan["source"] and plan["units"] and plan["reference_full"])
        self.assertTrue(policy.plan(classification(), "tag")["archive"])

    def test_manual_rehearsal_and_full_override(self):
        plan = policy.plan(classification(), "pull_request", True, True)
        self.assertTrue(plan["archive"] and plan["reference_full"])
        self.assertEqual(plan["mode"], "full")

    def test_missing_classifier_metadata_is_conservative(self):
        for value in [None, {}, {"docs_only": True}, {"code": False}]:
            plan = policy.plan(value, "pull_request")
            self.assertTrue(plan["code"] and plan["source"] and plan["archive"])

    def test_every_required_failure_blocks_publication(self):
        plan = policy.plan(classification(), "tag")
        needs = {name: {"result": "success"} for name in plan["required"]}
        self.assertEqual(policy.aggregate(plan, needs), [])
        for name in plan["required"]:
            for result in ["failure", "skipped", "cancelled", "pending"]:
                changed = dict(needs, **{name: {"result": result}})
                self.assertTrue(policy.aggregate(plan, changed), (name, result))
            changed = dict(needs)
            del changed[name]
            self.assertTrue(policy.aggregate(plan, changed), name)
        self.assertTrue(policy.aggregate({}, {}))

    def test_concurrency_is_pr_and_workflow_scoped(self):
        records = []
        for workflow, event, ref, pr in [("validation", "pull_request", "refs/pull/1/merge", "1"),
                                          ("validation", "pull_request", "refs/pull/2/merge", "2"),
                                          ("release", "pull_request", "refs/pull/1/merge", "1"),
                                          ("validation", "push", "refs/heads/main", ""),
                                          ("release", "tag", "refs/tags/v1", "")]:
            output = subprocess.check_output([sys.executable, str(ROOT / "tools/ci-policy.py"), "group",
                                               "--workflow", workflow, "--event", event, "--ref", ref, "--pr", pr], text=True)
            record = json.loads(output)
            self.assertEqual(record["cancel"], event == "pull_request")
            records.append(record["group"])
        self.assertEqual(len(set(records)), len(records))

    def test_channel_rehearsal_follows_channel_inputs(self):
        self.assertTrue(policy.plan(classification(channels=True), "pull_request")["channels"])
        self.assertFalse(policy.plan(classification(channels=False), "pull_request")["channels"])
        # An older classification without the flag, a dispatch, a tag, or a rehearsal: conservative.
        self.assertTrue(policy.plan(classification(), "pull_request")["channels"])
        for event in ["workflow_dispatch", "tag"]:
            self.assertTrue(policy.plan(classification(channels=False), event)["channels"])
        self.assertTrue(policy.plan(classification(channels=False), "pull_request", rehearsal=True)["channels"])

    def test_workflow_contract(self):
        workflow = (ROOT / ".github/workflows/compatibility.yml").read_text()
        self.assertIn("llvm: [22, 23]", workflow)
        self.assertIn("profile=compat", workflow)
        self.assertIn("if: always()", workflow)
        self.assertIn("needs: [policy, prepare, native, verification, package, archive]", workflow)
        release = (ROOT / ".github/workflows/release.yml").read_text()
        self.assertIn("full: true", release)
        self.assertIn("rehearsal: true", release)
        self.assertIn("needs: validation", release)
        self.assertNotIn("pull_request:", release)

    def test_channel_workflow_contract(self):
        # change: low-cost-distribution-channels, design D7.
        workflow = (ROOT / ".github/workflows/channels.yml").read_text()
        top = workflow.split("\njobs:\n", 1)[0]
        self.assertIn("permissions:\n  contents: read\n", top)
        self.assertNotIn(": write", top)
        # Write permissions appear only on the two promoting jobs, and the tap token only in
        # steps gated on publish.
        self.assertEqual(workflow.count("packages: write"), 1)
        self.assertEqual(workflow.count("contents: write"), 1)
        self.assertEqual(workflow.count("pull-requests: write"), 1)
        for segment in workflow.split("secrets.HOMEBREW_TAP_TOKEN")[:-1]:
            step = segment.rsplit("- name:", 1)[1]
            self.assertIn("if: needs.identity.outputs.publish == 'true'", step)
        for promote in ("channel-promote.sh tap", "channel-promote.sh oci", "channel-promote.sh flake"):
            self.assertIn(promote, workflow)
        self.assertIn("if: needs.identity.outputs.publish == 'true'", workflow.split("nix-promote:", 1)[1])
        self.assertIn("--preserve-digests", (ROOT / "tools/channel-promote.sh").read_text())


if __name__ == "__main__":
    unittest.main()
