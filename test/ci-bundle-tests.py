#!/usr/bin/env python3
"""Transport and trusted-run rejection fixtures; never build LLVM."""
import copy
from importlib.machinery import SourceFileLoader
import io
import json
import os
from pathlib import Path
import sys
sys.dont_write_bytecode = True
import tarfile
import tempfile
import shutil
import unittest
from unittest.mock import patch

ROOT = Path(__file__).resolve().parent.parent
SOURCE = "23.1.0-" + "a" * 40 + "-" + "b" * 40 + "-recipe-5"
STAMP = "23.1.0 " + "a" * 40 + " " + "b" * 40 + " recipe-5\n"
bundle = SourceFileLoader("bundle_fixture", str(ROOT / "tools/ci-bundle.py")).load_module()
resolver = SourceFileLoader("resolver_fixture", str(ROOT / "tools/ci-resolve.py")).load_module()


class BundleTests(unittest.TestCase):
    def setUp(self):
        self.identity = {"schema": 1, "os": "Darwin", "arch": "arm64", "sdk": "26.0:sha",
                         "deployment": "native", "major": "23", "source": SOURCE,
                         "recipe_sha256": "recipe", "prefix": "/private/dependencies", "runner": "macos15"}
        self.producer = {"repository": "owner/repo", "run_id": "42", "commit": "a" * 40,
                         "ref": "refs/heads/main", "workflow": "owner/repo/.github/workflows/dependency-preparation.yml@refs/heads/main"}
        self.manifest = {"identity": self.identity, "producer": self.producer}

    def test_exact_identity_and_producer(self):
        bundle.validate_manifest(self.manifest, self.identity, self.producer)

    def test_each_identity_component_is_required(self):
        for key in self.identity:
            with self.subTest(key=key):
                changed = copy.deepcopy(self.manifest)
                changed["identity"][key] = "wrong"
                with self.assertRaises(ValueError):
                    bundle.validate_manifest(changed, self.identity, self.producer)

    def test_each_producer_component_is_required(self):
        for key in self.producer:
            with self.subTest(key=key):
                changed = copy.deepcopy(self.manifest)
                changed["producer"][key] = "wrong"
                with self.assertRaises(ValueError):
                    bundle.validate_manifest(changed, self.identity, self.producer)

    def archive(self, members):
        stream = io.BytesIO()
        with tarfile.open(fileobj=stream, mode="w") as archive:
            for name, kind, target in members:
                item = tarfile.TarInfo(name)
                if kind == "link":
                    item.type = tarfile.SYMTYPE
                    item.linkname = target
                elif kind == "hardlink":
                    item.type = tarfile.LNKTYPE
                    item.linkname = target
                elif kind == "device":
                    item.type = tarfile.CHRTYPE
                archive.addfile(item)
        stream.seek(0)
        return tarfile.open(fileobj=stream)

    def test_safe_relative_layout(self):
        with self.archive([("llvm/bin/clang", "file", ""), ("llvm/bin/clang++", "link", "clang"),
                           ("gc/include/gc.h", "file", ""), ("complete", "file", "")]) as archive:
            self.assertEqual(len(bundle.safe_members(archive)), 4)

    def test_unsafe_members(self):
        cases = [[("/llvm/escape", "file", "")], [("llvm/../../escape", "file", "")],
                 [("other/file", "file", "")], [("gc/link", "link", "/etc/passwd")],
                 [("gc/link", "link", "../../escape")], [("llvm/device", "device", "")],
                 [("llvm/link", "link", "inside"), ("llvm/link/overwrite", "file", "")],
                 [("llvm/link", "hardlink", "../../escape")],
                 [("llvm/file", "file", ""), ("llvm/file", "file", "")]]
        for members in cases:
            with self.subTest(members=members), self.archive(members) as archive:
                with self.assertRaises(ValueError):
                    bundle.safe_members(archive)

    def test_pack_restore_and_corruption(self):
        with tempfile.TemporaryDirectory() as temporary:
            prefix = Path(temporary) / "deps"
            for name in ["llvm/bin", "gc/include"]:
                (prefix / name).mkdir(parents=True)
            (prefix / "llvm/bin/clang").write_text("fixture")
            (prefix / "llvm/bin/clang++").symlink_to("clang")
            (prefix / "gc/include/gc.h").write_text("fixture")
            (prefix / "complete").write_text(STAMP)
            directory = Path(temporary) / "bundle"
            with patch.object(bundle, "identity", return_value=self.identity), patch.object(bundle, "producer", return_value=self.producer):
                with patch.object(sys, "argv", ["ci-bundle.py", "pack", "23", str(prefix), str(directory)]):
                    bundle.main()
                moved = Path(temporary) / "original"
                prefix.rename(moved)
                with patch.object(sys, "argv", ["ci-bundle.py", "restore", "23", str(prefix), str(directory)]):
                    bundle.main()
                self.assertEqual((prefix / "llvm/bin/clang++").read_text(), "fixture")
                with (directory / "dependencies.tar.gz").open("ab") as output:
                    output.write(b"corrupt")
                with patch.object(sys, "argv", ["ci-bundle.py", "restore", "23", str(prefix), str(directory)]):
                    with self.assertRaisesRegex(ValueError, "checksum"):
                        bundle.main()

    def test_wrong_completion_stamp_never_gets_current_manifest_or_activation(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            prefix = root / "deps"
            for name in ["llvm", "gc"]:
                (prefix / name).mkdir(parents=True)
            (prefix / "complete").write_text(STAMP.replace("recipe-5", "recipe-4"))
            directory = root / "bundle"
            with patch.object(bundle, "identity", return_value=self.identity), patch.object(bundle, "producer", return_value=self.producer):
                with patch.object(sys, "argv", ["ci-bundle.py", "pack", "23", str(prefix), str(directory)]):
                    with self.assertRaisesRegex(ValueError, "completion stamp differs"):
                        bundle.main()
                self.assertFalse(directory.exists())
                directory.mkdir()
                with tarfile.open(directory / "dependencies.tar.gz", "w:gz") as archive:
                    for name in ["llvm", "gc", "complete"]:
                        archive.add(prefix / name, arcname=name)
                manifest = {"identity": self.identity, "producer": self.producer,
                            "sha256": bundle.digest(directory / "dependencies.tar.gz")}
                (directory / "manifest.json").write_text(json.dumps(manifest))
                destination = root / "restored"
                with patch.object(sys, "argv", ["ci-bundle.py", "restore", "23", str(destination), str(directory)]):
                    with self.assertRaisesRegex(ValueError, "completion stamp differs"):
                        bundle.main()
                self.assertFalse(destination.exists())

    def test_symlink_expansion_cannot_escape_or_cycle(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary) / "prefix"
            (root / "llvm").mkdir(parents=True)
            (Path(temporary) / "outside").write_text("external executable fixture")
            (root / "llvm/a").symlink_to(".")
            (root / "llvm/b").symlink_to("a/a/../../outside")
            # Lexical depth appears safe; resolving a to '.' removes that depth.
            with self.archive([("llvm/a", "link", "."),
                               ("llvm/b", "link", "a/a/../../outside")]) as archive:
                bundle.safe_members(archive)
            with self.assertRaisesRegex(ValueError, "escapes prefix"):
                bundle.validate_staged_links(root)
            (root / "llvm/b").unlink()
            (root / "llvm/b").symlink_to("b")
            with self.assertRaises(ValueError):
                bundle.validate_staged_links(root)


class ResolverTests(unittest.TestCase):
    def setUp(self):
        self.run = {"conclusion": "success", "status": "completed", "head_branch": "main",
                    "event": "workflow_dispatch", "path": resolver.WORKFLOW, "id": 42,
                    "head_sha": "a" * 40, "repository": {"full_name": "owner/repo"},
                    "head_repository": {"full_name": "owner/repo"}}

    def test_approved_main_events(self):
        for event in ["push", "schedule", "workflow_dispatch"]:
            self.run["event"] = event
            self.assertTrue(resolver.approved_run(self.run, "owner/repo"))

    def test_untrusted_or_failed_producer(self):
        for key, value in [("conclusion", "failure"), ("status", "in_progress"), ("head_branch", "feature"),
                           ("event", "pull_request"), ("path", ".github/workflows/other.yml"),
                           ("repository", {"full_name": "attacker/repo"}),
                           ("head_repository", {"full_name": "attacker/repo"}), ("head_sha", "x" * 40)]:
            changed = copy.deepcopy(self.run)
            changed[key] = value
            self.assertFalse(resolver.approved_run(changed, "owner/repo"), key)
        self.assertFalse(resolver.approved_run({}, "owner/repo"))

    def test_missing_expired_and_duplicate_artifacts(self):
        artifacts = [{"name": "toolchain-Linux-X64-23", "expired": True}]
        with patch.dict(os.environ, {"GITHUB_REPOSITORY": "owner/repo", "RUNNER_OS": "Linux", "RUNNER_ARCH": "X64"}), \
             patch.object(resolver.bundle, "identity", return_value={}), \
             patch.object(resolver.subprocess, "run") as download:
            for items in [[], artifacts, artifacts * 2]:
                with patch.object(resolver, "api", side_effect=[{"workflow_runs": [self.run]}, {"artifacts": items}]):
                    self.assertFalse(resolver.resolve("23", "/unused"))
            download.assert_not_called()

    def test_cold_consumer_restores_approved_artifact_without_source_build(self):
        with tempfile.TemporaryDirectory() as temporary:
            prefix = Path(temporary) / "deps"
            saved = Path(temporary) / "artifact"
            saved.mkdir()
            for name in ["llvm/bin", "gc/include"]:
                (prefix / name).mkdir(parents=True)
            (prefix / "llvm/bin/clang").write_text("trusted compiler fixture")
            (prefix / "complete").write_text(STAMP)
            expected = {"fixture": "exact", "prefix": str(prefix), "source": SOURCE}
            approved = {"repository": "owner/repo", "run_id": "42", "commit": "a" * 40,
                        "ref": "refs/heads/main", "workflow": "owner/repo/" + resolver.WORKFLOW + "@refs/heads/main"}
            with tarfile.open(saved / "dependencies.tar.gz", "w:gz") as archive:
                for name in ["llvm", "gc", "complete"]:
                    archive.add(prefix / name, arcname=name)
            manifest = {"identity": expected, "producer": approved,
                        "sha256": bundle.digest(saved / "dependencies.tar.gz")}
            (saved / "manifest.json").write_text(json.dumps(manifest))
            shutil.rmtree(prefix)
            invoked = []

            def transfer(argv, check):
                invoked.append(argv)
                if argv[:3] == ["gh", "run", "download"]:
                    destination = Path(argv[argv.index("--dir") + 1])
                    for name in ["manifest.json", "dependencies.tar.gz"]:
                        shutil.copyfile(saved / name, destination / name)
                else:
                    self.assertEqual(argv[2], "restore")
                    with patch.object(bundle, "identity", return_value=expected), patch.object(sys, "argv", argv[1:]):
                        bundle.main()

            artifacts = {"artifacts": [{"name": "toolchain-Linux-X64-23", "expired": False}]}
            with patch.dict(os.environ, {"GITHUB_REPOSITORY": "owner/repo", "RUNNER_OS": "Linux", "RUNNER_ARCH": "X64"}), \
                 patch.object(resolver.bundle, "identity", return_value=expected), \
                 patch.object(resolver, "api", side_effect=[{"workflow_runs": [self.run]}, artifacts]), \
                 patch.object(resolver.subprocess, "run", side_effect=transfer):
                self.assertTrue(resolver.resolve("23", str(prefix)))
            self.assertEqual((prefix / "llvm/bin/clang").read_text(), "trusted compiler fixture")
            self.assertEqual(len(invoked), 2)
            self.assertFalse(any("ci-provision.sh" in str(argv) for argv in invoked))

    def test_workflows_reprobe_every_restored_installation(self):
        workflow = (ROOT / ".github/workflows/compatibility.yml").read_text()
        self.assertEqual(workflow.count("python3 tools/ci-bundle.py restore"), 3)
        self.assertEqual(workflow.count("tools/ci-provision.sh"), 3)
        preparation = (ROOT / ".github/workflows/prepare-toolchains.yml").read_text()
        self.assertEqual(preparation.count("tools/ci-prepare.sh"), 1)
        self.assertIn("llvm: [22, 23]", preparation)
        self.assertNotIn("contents: write", preparation)
        trusted = (ROOT / ".github/workflows/dependency-preparation.yml").read_text()
        self.assertIn("github.ref == 'refs/heads/main'", trusted)
        self.assertIn("github.event_name != 'pull_request'", trusted)


if __name__ == "__main__":
    unittest.main()
