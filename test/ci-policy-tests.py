#!/usr/bin/env python3
"""CI plan, required-proof failure injection, and concurrency fixtures."""
from importlib.machinery import SourceFileLoader
import json
import re
from pathlib import Path
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
            # make install prepares the shared library cache in the keg; Homebrew's post-install
            # step runs sandboxed with a temporary HOME, and its style cop rejects one.
            self.assertNotIn("WARM_STDLIB", formula)
            self.assertNotIn("post_install", formula)
            self.assertNotIn("caveats", formula)
            self.assertIn("matches this executable", formula.split("\n  test do", 1)[1])
        # Nix fixup strips and wraps bin/emit, so preparation must follow it, not make install.
        nix = (ROOT / "packaging/nix/emit.nix").read_text()
        self.assertIn('"WARM_STDLIB=0"', nix)
        fixup = nix.split("postFixup = ''", 1)[1].split("'';", 1)[0]
        self.assertIn("build --stdlib --shared", fixup)
        self.assertLess(fixup.index("wrapProgram"), fixup.index("build --stdlib --shared"))
        # The OCI builder installs at the final /opt/emit, so make install prepares it there.
        containerfile = (ROOT / "packaging/oci/Containerfile").read_text()
        self.assertNotIn("WARM_STDLIB", containerfile)
        self.assertIn("PREFIX=/opt/emit TOOLCHAIN_PIN=1", containerfile)

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

    def test_classifier_reference_suites_are_accepted(self):
        classifier = SourceFileLoader("classifier_policy_fixture",
                                      str(ROOT / "tools/test-classify.py")).load_module()
        for path in ["src/emit.ss", "lib/emit/write.sld", "tools/test-classify.py"]:
            with self.subTest(path=path):
                classified = classifier.classify_paths([path])
                planned = policy.plan(classified, "pull_request")
                self.assertEqual(planned["reference"], classified["reference"])
                self.assertIn("custom-writers-source", planned["reference"])
                self.assertTrue(planned["verification"])

    def test_unknown_reference_suite_is_rejected(self):
        with self.assertRaisesRegex(ValueError, "unknown required reference suite"):
            policy.plan(classification(reference=["unknown-suite"]), "pull_request")

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
            self.assertIn("custom-writers-source", plan["reference"])

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

    # change: reuse-validation-by-tree.
    def test_version_pull_request_is_validated_like_its_tag(self):
        # D4: four full cells, complete reference, and archive rehearsal before merge.
        plan = policy.plan(classification(categories=["release"], archive=True), "pull_request")
        self.assertEqual(plan["mode"], "full")
        self.assertTrue(plan["code"] and plan["source"] and plan["units"] and plan["reference_full"])
        self.assertEqual(plan["required"], ["policy", "prepare", "native", "verification", "package", "archive"])
        tag = policy.plan(classification(categories=["release"], archive=True), "tag")
        self.assertIsNone(policy.covers(dict(plan, tree="t", toolchain=False), dict(tag, tree="t", toolchain=False)))
        ordinary = policy.plan(classification(categories=["host"]), "pull_request")
        self.assertEqual(ordinary["mode"], "normal")
        self.assertEqual(ordinary["required"], ["policy", "prepare", "native"])
        # The release category reaches a push or a tag plan unchanged; only pull requests gain it.
        self.assertEqual(policy.plan(classification(categories=["release"]), "push")["mode"], "normal")

    def test_packaging_only_rehearses_channels_without_the_matrix(self):
        # D7: a channel recipe (for example the Nix pin) provisions no toolchain.
        for categories in (["packaging"], ["documentation", "packaging"]):
            plan = policy.plan(classification(categories=categories, code=False, channels=True), "pull_request")
            self.assertFalse(plan["code"], categories)
            self.assertEqual(plan["required"], ["policy"], categories)
            self.assertTrue(plan["channels"], categories)
        # issue #187: agent configuration, alone or with the other lightweight categories.
        for categories in (["agent-config"], ["agent-config", "documentation", "packaging"]):
            plan = policy.plan(classification(categories=categories, code=False), "pull_request")
            self.assertEqual(plan["required"], ["policy"], categories)
        mixed = policy.plan(classification(categories=["host", "packaging"], code=True), "pull_request")
        self.assertEqual(mixed["required"], ["policy", "prepare", "native"])
        # An inconsistent record (code false, but a code category) keeps the matrix.
        self.assertTrue(policy.plan(classification(categories=["runtime"], code=False), "pull_request")["code"])
        for event in ["schedule", "workflow_dispatch", "tag"]:
            self.assertTrue(policy.plan(classification(categories=["packaging"], code=False), event)["code"])

    def reusable(self, event="pull_request", **overrides):
        plan = policy.plan(classification(toolchain=False, **overrides), event, tree="a" * 40, sha="b" * 40)
        self.assertTrue(plan["execute"])
        return plan

    def test_coverage_is_monotone(self):
        # D3: equal or stronger executed plans of the same tree cover; anything else names why.
        normal = self.reusable()
        full = self.reusable(categories=["release"], archive=True)
        push = self.reusable("push")
        tag = self.reusable("tag")
        self.assertIsNone(policy.covers(normal, push))
        self.assertIsNone(policy.covers(full, push))
        self.assertIsNone(policy.covers(full, tag))
        self.assertIn("full mode", policy.covers(dict(normal, reference_full=True, archive=True, source=True,
                                                  units=True, verification=True), tag))
        self.assertIn("omits required", policy.covers(normal, tag))
        source = self.reusable("push", source=True, units=True, reference=["self-emission"])
        self.assertIn("omits required source", policy.covers(normal, source))
        self.assertIn("reference suites self-emission",
                      policy.covers(dict(normal, source=True, units=True, verification=True), source))
        self.assertIn("no recorded tree", policy.covers(dict(full, tree=None), tag))
        self.assertIn("current run has no recorded tree", policy.covers(full, dict(tag, tree=None)))
        self.assertIn("differs", policy.covers(dict(full, tree="c" * 40), tag))
        reused = policy.apply_reuse(full, {"run": "u", "sha": "s", "tree": "a" * 40, "mode": "full"})
        self.assertIn("reused another run", policy.covers(reused, tag))
        self.assertIn("toolchain", policy.covers(dict(full, toolchain=True), tag))
        self.assertIn("toolchain", policy.covers(full, dict(tag, toolchain=True)))
        older = policy.plan(classification(), "pull_request", tree="a" * 40)
        self.assertIn("toolchain", policy.covers(older, push))
        self.assertIn("not an object", policy.covers(None, tag))

    def test_reuse_keeps_the_tag_archive_and_reports_its_source(self):
        # D5 and D8.
        source = {"run": "https://github.com/o/r/actions/runs/1", "sha": "b" * 40, "tree": "a" * 40, "mode": "full"}
        tag = policy.apply_reuse(self.reusable("tag"), source)
        self.assertFalse(tag["execute"])
        self.assertEqual(tag["required"], ["policy", "prepare", "package", "archive"])
        push = policy.apply_reuse(self.reusable("push"), source)
        self.assertEqual(push["required"], ["policy"])
        for plan in (tag, push):
            needs = {name: {"result": "success"} for name in plan["required"]}
            needs.update({"native": {"result": "skipped"}, "verification": {"result": "skipped"}})
            self.assertEqual(policy.aggregate(plan, needs), [])
        line = policy.reuse_line(tag)
        self.assertIn("run https://github.com/o/r/actions/runs/1", line)
        self.assertIn("tree " + "a" * 12, line)
        self.assertIn("mode full", line)
        broken = dict(tag, reused={"run": "u"})
        self.assertTrue(policy.aggregate(broken, {name: {"result": "success"} for name in tag["required"]}))
        with self.assertRaises(ValueError):
            policy.apply_reuse(self.reusable("push"), {"run": "u"})
        needs = {name: {"result": "success"} for name in tag["required"]}
        output = subprocess.run([sys.executable, str(ROOT / "tools/ci-policy.py"), "aggregate",
                                 "--plan", json.dumps(tag), "--needs", json.dumps(needs)],
                                capture_output=True, text=True, check=True)
        self.assertIn("satisfied by reuse", output.stderr)

    def test_plan_records_tree_and_sha(self):
        output = subprocess.check_output([sys.executable, str(ROOT / "tools/ci-policy.py"), "plan",
                                          "--classification", json.dumps(classification()),
                                          "--event", "push", "--tree", "t" * 40, "--sha", "s" * 40], text=True)
        record = json.loads(output)
        self.assertEqual((record["tree"], record["sha"], record["execute"]), ("t" * 40, "s" * 40, True))

    def test_workflow_contract(self):
        workflow = (ROOT / ".github/workflows/compatibility.yml").read_text()
        self.assertIn("llvm: [22, 23]", workflow)
        self.assertIn("profile=compat", workflow)
        self.assertIn("if: always()", workflow)
        self.assertIn("needs: [policy, prepare, native, verification, package, archive]", workflow)
        # change: reuse-validation-by-tree, D1, D2, and D5.
        self.assertIn("--tree \"$(git rev-parse 'HEAD^{tree}')\" --sha \"$(git rev-parse HEAD)\"", workflow)
        self.assertIn('tools/ci-reuse.py --event "$EVENT"', workflow)
        self.assertLess(workflow.index("tools/ci-reuse.py --event"), workflow.index('tee "$RUNNER_TEMP/plan.json"'))
        self.assertIn("GH_TOKEN: ${{ github.token }}", workflow.split("\n  prepare:\n", 1)[0])
        self.assertIn("execute: ${{ steps.policy.outputs.execute }}", workflow)
        execute = "needs.policy.outputs.execute == 'true'"
        self.assertIn(f"if: needs.policy.outputs.code == 'true' && {execute}\n", workflow.split("\n  native:\n", 1)[1])
        self.assertIn(f"if: needs.policy.outputs.verification == 'true' && {execute}\n",
                      workflow.split("\n  verification:\n", 1)[1])
        self.assertIn(f"if: (needs.policy.outputs.code == 'true' && {execute}) || needs.policy.outputs.archive == 'true'\n",
                      workflow.split("\n  prepare:\n", 1)[1])
        self.assertIn("python3 test/ci-reuse-tests.py", workflow)
        release = (ROOT / ".github/workflows/release.yml").read_text()
        # A called workflow cannot hold a permission its caller does not grant.
        for text in (workflow, release):
            self.assertIn("  pull-requests: read\n", text.split("\njobs:\n", 1)[0])
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
        # Only the OCI job holds a write permission; the tap and Nix pull requests are opened
        # with their own fine-grained tokens (change: automate-release-handoff, design D7).
        self.assertEqual(workflow.count("packages: write"), 1)
        self.assertNotIn("contents: write", workflow)
        self.assertNotIn("pull-requests: write", workflow)
        # Each promotion token reaches only steps gated on publish: a step-level gate, or any
        # step of a job gated as a whole (nix-promote).
        jobs = workflow.split("\njobs:\n", 1)[1]
        blocks = {}
        for block in re.split(r"\n(?=  [a-z][a-z-]*:\n)", "\n" + jobs):
            if block.strip():
                blocks[block.strip().split(":", 1)[0]] = block
        gate = "if: needs.identity.outputs.publish == 'true'"
        nix_promote = blocks["nix-promote"]
        self.assertIn("\n    " + gate + "\n", nix_promote)
        for secret in ("secrets.HOMEBREW_TAP_TOKEN", "secrets.NIX_PIN_TOKEN"):
            holders = [name for name, block in blocks.items() if secret in block]
            self.assertTrue(holders, secret)
            for name in holders:
                job_gated = ("\n    " + gate + "\n") in blocks[name]
                for step in blocks[name].split("\n      - ")[1:]:
                    if secret in step:
                        self.assertTrue(job_gated or gate in step, f"{secret} in an ungated {name} step")
        for promote in ("channel-promote.sh tap ", "channel-promote.sh oci ", "channel-promote.sh flake ",
                        "channel-promote.sh tap-merge ", "channel-promote.sh flake-merge ",
                        "channel-promote.sh preflight bwbensonjr/homebrew-emit HOMEBREW_TAP_TOKEN",
                        'channel-promote.sh preflight "$GITHUB_REPOSITORY" NIX_PIN_TOKEN'):
            self.assertIn(promote, workflow)
        # Merges are requested only on publish, for the head the promotion step reported.
        homebrew = blocks["homebrew"]
        merge_step = homebrew.split("channel-promote.sh tap-merge", 1)[0].rsplit("- name:", 1)[1]
        self.assertIn("if: needs.identity.outputs.publish == 'true'", merge_step)
        self.assertIn("HEAD: ${{ steps.tap.outputs.head }}", merge_step)
        self.assertIn("HEAD: ${{ steps.flake.outputs.head }}", nix_promote)
        # A failing promotion is not masked by the tee that records its head.
        for job in (homebrew, nix_promote):
            self.assertIn("set -o pipefail\n", job)
        self.assertIn("--preserve-digests", (ROOT / "tools/channel-promote.sh").read_text())

    def test_homebrew_rehearsal_updates_before_linting(self):
        # change: channel-promotion-retries, design D1 (#153).
        workflow = (ROOT / ".github/workflows/channels.yml").read_text()
        job = workflow.split("\n  homebrew:\n", 1)[1].split("\n  nix:\n", 1)[0]
        self.assertIn("HOMEBREW_NO_AUTO_UPDATE: 1", job)
        # Positions of command lines only, so narration that mentions a command cannot match.
        commands = [line.strip() for line in job.splitlines()]
        def first(command):
            return next(i for i, line in enumerate(commands) if line.startswith(command))
        update = first("brew update")
        for later in ("brew install", "brew style", "brew audit --strict"):
            self.assertLess(update, first(later), later)

    def test_oci_retests_a_published_version_instead_of_rebuilding(self):
        # change: channel-promotion-retries, design D3 (#156).
        workflow = (ROOT / ".github/workflows/channels.yml").read_text()
        job = workflow.split("\n  oci:\n", 1)[1]
        steps = job.split("      - ")[1:]
        def step(name):
            return next(s for s in steps if s.startswith(f"name: {name}"))
        names = [s.split("\n", 1)[0] for s in steps]
        resolve = names.index("name: Resolve the published image for this release")
        copy = names.index("name: Copy the published image to an archive")
        build = names.index("name: Build the image once, to an archive")
        accept = names.index("name: Installed acceptance inside the image, offline, as an arbitrary user")
        self.assertLess(resolve, copy)
        self.assertLess(copy, build)
        self.assertLess(build, accept)
        # Only a published release (an https archive URL) resolves; a candidate always builds.
        self.assertIn("https://*) digest=$(tools/channel-promote.sh oci-resolve", step("Resolve the published"))
        self.assertIn("if: steps.resolve.outputs.digest != ''", step("Copy the published"))
        self.assertIn("if: steps.resolve.outputs.digest == ''", step("Build the image once"))
        self.assertIn("skopeo copy --preserve-digests", step("Copy the published"))
        # The new steps read with the job's existing token and add no secret or write grant.
        for name in ("Resolve the published", "Copy the published"):
            self.assertNotIn("secrets.", step(name))
            self.assertIn("REGISTRY_TOKEN: ${{ github.token }}", step(name))
        self.assertEqual(workflow.count("packages: write"), 1)

    def test_release_tag_workflow_contract(self):
        # change: version-discipline-and-auto-release, design D3.
        workflow = (ROOT / ".github/workflows/release-tag.yml").read_text()
        top, jobs = workflow.split("\njobs:\n", 1)
        self.assertIn("on:\n  push:\n    branches: [main]\n    paths: [VERSION]\n  workflow_dispatch:\n", top)
        self.assertNotIn("pull_request", top)
        # GITHUB_TOKEN stays read-only; only the repository-scoped secret can push.
        self.assertIn("permissions:\n  contents: read\n", top)
        self.assertNotIn(": write", workflow)
        self.assertNotIn("github.token", workflow)
        self.assertIn("cancel-in-progress: false", top)
        self.assertIn("if: github.ref == 'refs/heads/main'", jobs)
        self.assertIn("persist-credentials: false", jobs)
        steps = jobs.split("      - ")[1:]
        holders = [step.split("\n", 1)[0] for step in steps if "secrets.RELEASE_TAG_TOKEN" in step]
        self.assertEqual(holders, ["name: Preflight the tagging credential", "name: Push the release tag"])
        preflight, push = [step for step in steps if "secrets.RELEASE_TAG_TOKEN" in step]
        self.assertIn("git push --dry-run", preflight)
        self.assertIn("is not configured", preflight)
        # The push step is gated on the shared decision tool and pushes one tag ref, unforced.
        self.assertIn("tools/release-tag.sh plan", workflow)
        self.assertIn("if: steps.plan.outputs.tag != ''", push)
        self.assertEqual(push.count("git push"), 1)
        self.assertIn('"refs/tags/${TAG}:refs/tags/${TAG}"', push)
        for flag in ("--force", "-f ", "--tags", "--mirror", "--all", "--delete", "+refs"):
            self.assertNotIn(flag, push, flag)
        self.assertEqual(workflow.count("git push"), 2)
        for line in workflow.splitlines():
            if "uses:" in line:
                self.assertRegex(line, r"uses: [\w./-]+@[0-9a-f]{40} # v", line)

    def test_release_tag_leaves_release_and_channels_unchanged(self):
        # The automatic tag reaches publication only through the existing tag-push conditions.
        release = (ROOT / ".github/workflows/release.yml").read_text()
        self.assertIn("on:\n  push:\n    tags: ['v*']\n  workflow_dispatch:\n", release)
        self.assertIn("if: github.event_name == 'push' && github.ref_type == 'tag'", release)
        channels = (ROOT / ".github/workflows/channels.yml").read_text()
        self.assertIn("  workflow_run:\n    workflows: [Source release]\n    types: [completed]\n", channels)
        self.assertIn("(github.event.workflow_run.conclusion == 'success' && github.event.workflow_run.event == 'push')",
                      channels)
        self.assertIn("RELEASE_TAG_TOKEN", (ROOT / "docs/RELEASE-PIPELINE.md").read_text())
        # The pull-request check uses the same tool, only for VERSION changes.
        compatibility = (ROOT / ".github/workflows/compatibility.yml").read_text()
        check = compatibility.split("- name: Check a changed VERSION advances past every release tag", 1)[1]
        check = check.split("      - name:", 1)[0]
        self.assertIn("if: github.event_name == 'pull_request'", check)
        self.assertIn("index(\"release\")", check)
        self.assertIn("tools/release-tag.sh check HEAD", check)
        self.assertNotIn("secrets.", check)


if __name__ == "__main__":
    unittest.main()
