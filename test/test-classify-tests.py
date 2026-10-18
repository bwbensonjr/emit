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


if __name__ == "__main__":
    unittest.main()
