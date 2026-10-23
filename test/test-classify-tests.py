#!/usr/bin/env python3
"""Policy fixtures run with no LLVM installation or native build."""

import importlib.util
from pathlib import Path
import subprocess
import tempfile
import unittest


ROOT = Path(__file__).resolve().parent.parent
spec = importlib.util.spec_from_file_location("classifier", ROOT / "tools/test-classify.py")
policy = importlib.util.module_from_spec(spec)
spec.loader.exec_module(policy)


class ClassifierTests(unittest.TestCase):
    def test_category_union(self):
        cases = {"docs/DEVELOPMENT.md": "documentation", "src/emit.cpp": "host",
                 "src/runtime/runtime.c": "runtime", "src/passes/lower.ss": "compiler",
                 "lib/srfi/1.sld": "library", "tools/test-classify.py": "infrastructure",
                 "VERSION": "release", "surprise": "unknown"}
        for path, category in cases.items():
            self.assertEqual(policy.classify_paths([path])["categories"], [category])
        result = policy.classify_paths(list(cases))
        self.assertEqual(set(result["categories"]), set(cases.values()))
        self.assertTrue(result["source"])
        self.assertTrue(result["archive"])
        self.assertFalse(result["docs_only"])

    def test_channel_inputs_rehearse_channels_only(self):
        # change: low-cost-distribution-channels, design D7.
        for path in ("flake.nix", "flake.lock", "packaging/oci/Containerfile",
                     "packaging/homebrew/emit.rb.in", "packaging/release.json"):
            result = policy.classify_paths([path])
            self.assertEqual(result["categories"], ["packaging"], path)
            self.assertTrue(result["channels"], path)
            self.assertFalse(result["source"] or result["units"] or result["archive"], path)
            self.assertFalse(result["docs_only"], path)
        for path in ("tools/channel-accept.sh", "tools/channel-identity.sh", "tools/offline-run.sh",
                     "test/channel-accept/smoke.scm", ".github/workflows/channels.yml"):
            self.assertTrue(policy.classify_paths([path])["channels"], path)
        for path in ("src/passes/lower.ss", "src/emit.cpp", "lib/srfi/1.sld", "docs/INSTALLATION.md",
                     "tools/test-classify.py", "VERSION"):
            self.assertFalse(policy.classify_paths([path])["channels"], path)
        self.assertTrue(policy.classify_paths(["surprise"])["channels"])
        self.assertTrue(policy.classify_paths([], error="missing history")["channels"])

    def test_allowlist_exceptions_and_missing_history(self):
        for path in ("README.md", "docs/DISTRIBUTION.md", "openspec/specs/a/spec.md"):
            self.assertTrue(policy.classify_paths([path])["docs_only"])
        for path in ("lib/srfi/README.md", "test/input.md", "CLAUDE.md", "AGENTS.md",
                     ".github/workflows/test.yml", "tools/readme.md"):
            self.assertFalse(policy.classify_paths([path])["docs_only"], path)
        self.assertTrue(policy.classify_paths([], error="missing history")["code"])
        self.assertTrue(policy.classify_paths([])["source"])
        self.assertFalse(policy.classify_paths(["docs/executable.md"],
                                              executable=["docs/executable.md"])["docs_only"])

    def test_declared_partition_input_selects_source(self):
        self.assertTrue(policy.classify_paths(["lib/new-partition.sld"],
                                             ["lib/new-partition.sld"])["source"])
        self.assertFalse(policy.classify_paths(["src/emit.cpp"])["source"])
        self.assertTrue(policy.classify_paths(["bootstrap/removed.ll"])["source"])
        self.assertTrue(policy.classify_paths(["docs/compiler-input.md"],
                                             ["docs/compiler-input.md"])["source"])

    def test_real_git_local_ci_rename_and_delete(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            def git(*args):
                return subprocess.check_output(["git", "-c", "core.hooksPath=/dev/null", *args],
                                               cwd=root, stderr=subprocess.PIPE).decode().strip()
            git("init", "-q")
            git("config", "user.email", "fixture@invalid")
            git("config", "user.name", "fixture")
            git("config", "commit.gpgsign", "false")
            (root / "tools").mkdir()
            (root / "tools/compiler-inputs.sh").write_text("printf 'src/core.ss\\n'\n")
            (root / "src").mkdir()
            (root / "src/core.ss").write_text("source\n")
            (root / "README.md").write_text("old\n")
            (root / "README.md").chmod(0o755)
            git("add", ".")
            git("commit", "-qm", "fixture")
            base = git("rev-parse", "HEAD")
            git("mv", "src/core.ss", "docs.md")
            (root / "README.md").unlink()
            (root / "untracked").write_text("new\n")
            local = policy.classify(root, base)
            self.assertTrue({"src/core.ss", "docs.md", "README.md", "untracked"} <= set(local["paths"]))
            self.assertTrue(local["source"])
            self.assertNotIn("untracked", policy.classify(root, base, ci=True)["paths"])
            git("add", ".")
            git("commit", "-qm", "move")
            committed = policy.classify(root, base, ci=True, direct=True)
            self.assertTrue({"src/core.ss", "docs.md"} <= set(committed["paths"]))
            self.assertIn("unknown", committed["categories"])
            self.assertTrue(policy.classify(root, "nonexistent", ci=True)["source"])


class AliasClassifierTests(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory(prefix="emit-classifier-alias-")
        self.root = Path(self.temporary.name)
        for name in ("src", "tools", "docs"):
            (self.root / name).mkdir()
        (self.root / "docs/core.md").write_text("compiler source\n")
        (self.root / "src/core.ss").symlink_to("../docs/core.md")
        (self.root / "tools/compiler-inputs.sh").write_text("printf '%s\\n' src/core.ss\n")
        self.git("init", "-q")
        self.git("config", "user.name", "fixture")
        self.git("config", "user.email", "fixture@invalid")
        self.git("config", "commit.gpgsign", "false")
        self.commit()
        self.base = self.git("rev-parse", "HEAD")

    def tearDown(self):
        self.temporary.cleanup()

    def git(self, *arguments):
        return subprocess.check_output(["git", "-c", "core.hooksPath=/dev/null", *arguments],
                                       cwd=self.root, stderr=subprocess.PIPE, text=True).strip()

    def commit(self):
        self.git("add", "--all")
        self.git("commit", "-qm", "fixture")

    def test_current_compiler_target_is_not_prose(self):
        (self.root / "docs/core.md").write_text("edited compiler source\n")
        result = policy.classify(self.root, self.base)
        self.assertTrue(result["source"])
        self.assertFalse(result["docs_only"])
        self.assertIn("src/core.ss", result["dependency_aliases"])
        self.assertIn("docs/core.md", result["paths"])

    def test_ci_compiler_target_is_not_prose(self):
        (self.root / "docs/core.md").write_text("edited compiler source\n")
        self.commit()
        result = policy.classify(self.root, self.base, ci=True, direct=True)
        self.assertTrue(result["source"])
        self.assertIn("src/core.ss", result["dependency_aliases"])

    def test_native_header_target_selects_host_not_prose(self):
        (self.root / "docs/header.md").write_text("host header\n")
        (self.root / "src/native.h").symlink_to("../docs/header.md")
        self.commit()
        base = self.git("rev-parse", "HEAD")
        (self.root / "docs/header.md").write_text("new host header\n")
        result = policy.classify(self.root, base)
        self.assertEqual(result["categories"], ["documentation", "host"])
        self.assertFalse(result["source"])
        self.assertIn("src/native.h", result["dependency_aliases"])

    def test_historical_alias_removal_keeps_target_obligation(self):
        (self.root / "src/core.ss").unlink()
        (self.root / "docs/core.md").write_text("edited old target\n")
        self.commit()
        result = policy.classify(self.root, self.base, ci=True, direct=True)
        self.assertTrue(result["source"])
        self.assertIn("src/core.ss", result["dependency_aliases"])

    def test_renamed_target_and_alias_preserve_both_paths(self):
        self.git("mv", "docs/core.md", "docs/renamed.md")
        (self.root / "src/core.ss").unlink()
        (self.root / "src/core.ss").symlink_to("../docs/renamed.md")
        self.commit()
        result = policy.classify(self.root, self.base, ci=True, direct=True)
        self.assertTrue(result["source"])
        self.assertTrue({"docs/core.md", "docs/renamed.md", "src/core.ss"} <= set(result["paths"]))

    def test_intermediate_alias_retargeting_is_source_change(self):
        (self.root / "docs/other.md").write_text("different compiler source\n")
        (self.root / "docs/intermediate.md").symlink_to("core.md")
        (self.root / "src/core.ss").unlink()
        (self.root / "src/core.ss").symlink_to("../docs/intermediate.md")
        self.commit()
        base = self.git("rev-parse", "HEAD")
        (self.root / "docs/intermediate.md").unlink()
        (self.root / "docs/intermediate.md").symlink_to("other.md")
        result = policy.classify(self.root, base)
        self.assertTrue(result["source"])
        self.assertIn("src/core.ss", result["dependency_aliases"])

    def test_deleted_target_is_conservative_and_visible(self):
        (self.root / "docs/core.md").unlink()
        result = policy.classify(self.root, self.base)
        self.assertTrue(result["source"])
        self.assertFalse(result["docs_only"])
        self.assertIn("docs/core.md", result["paths"])
        self.assertIn("aliases unavailable", result["reason"])

    def test_cycles_and_external_aliases_are_conservative(self):
        path = self.root / "src/core.ss"
        for target in ("core.ss", "/external/source"):
            path.unlink()
            path.symlink_to(target)
            (self.root / "docs/core.md").write_text("edited\n")
            result = policy.classify(self.root, self.base)
            self.assertTrue(result["source"])
            self.assertIn("unknown", result["categories"])

    def test_plain_documentation_alias_stays_documentation_only(self):
        (self.root / "docs/linked.md").symlink_to("plain.md")
        (self.root / "docs/plain.md").write_text("prose\n")
        self.commit()
        base = self.git("rev-parse", "HEAD")
        (self.root / "docs/plain.md").write_text("new prose\n")
        result = policy.classify(self.root, base)
        self.assertTrue(result["docs_only"])

    def test_staged_source_edit_cancelled_in_worktree_is_still_selected(self):
        original = (self.root / "docs/core.md").read_text()
        (self.root / "docs/core.md").write_text("staged compiler source\n")
        self.git("add", "docs/core.md")
        (self.root / "docs/core.md").write_text(original)
        (self.root / "README.md").write_text("new prose\n")
        result = policy.classify(self.root, self.base)
        self.assertIn("docs/core.md", result["paths"])
        self.assertTrue(result["source"])
        self.assertFalse(result["docs_only"])

    def test_staged_executable_mode_cannot_be_hidden_by_worktree_mode(self):
        path = self.root / "README.md"
        path.write_text("executable prose fixture\n")
        path.chmod(0o755)
        self.git("add", "README.md")
        path.chmod(0o644)
        result = policy.classify(self.root, self.base)
        self.assertFalse(result["docs_only"])


if __name__ == "__main__":
    unittest.main()
