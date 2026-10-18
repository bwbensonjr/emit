#!/usr/bin/env python3
"""Hermetic source-proof and content-fingerprint contract checks."""

import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest


ROOT = Path(__file__).resolve().parent.parent
MODULES = ("embed.ll", "embed-repl.ll", "schemec.ll", "emit.internal.ll", "scheme.base.ll")


class SourceProofTests(unittest.TestCase):
    def setUp(self):
        self.workspace = Path(tempfile.mkdtemp(prefix="emit-source-tests-"))
        self.repo = self.workspace / "repo"
        (self.repo / "tools").mkdir(parents=True)
        (self.repo / "src").mkdir()
        (self.repo / "bootstrap").mkdir()
        for name in ("source-fingerprint.py", "test-source.py", "test-source.sh"):
            shutil.copy2(ROOT / "tools" / name, self.repo / "tools" / name)
        (self.repo / "tools/compiler-inputs.sh").write_text(
            "#!/usr/bin/env bash\ncase \"$1\" in\n"
            " --list) printf \"%s\\n\" src/core.ss tools/compiler-inputs.sh tools/regen.sh ;;\n"
            " --bootstrap) printf \"%s\\n\" " + " ".join("bootstrap/" + name for name in MODULES) + " ;;\nesac\n")
        (self.repo / "tools/llvm-env.sh").write_text(
            "export CC=/usr/bin/true CXX=/usr/bin/true LLVM_CONFIG=/usr/bin/true\n"
            "export CXXFLAGS=\"${CXXFLAGS:-}\"\n")
        (self.repo / "tools/regen.sh").write_text(
            "#!/usr/bin/env bash\nset -eu\n"
            "if command -v chez >/dev/null 2>&1; then exit 77; fi\n"
            "cat src/core.ss > bootstrap/embed.ll\n"
            "python3 tools/source-fingerprint.py --record >/dev/null\n")
        (self.repo / "src/core.ss").write_text("ir\n")
        for name in MODULES:
            (self.repo / "bootstrap" / name).write_text("ir\n")
        subprocess.run(["git", "init", "-q"], cwd=self.repo, check=True)
        subprocess.run(["git", "add", "."], cwd=self.repo, check=True)
        subprocess.run(["git", "-c", "user.name=test", "-c", "user.email=test@invalid",
                        "-c", "commit.gpgsign=false", "-c", "core.hooksPath=/dev/null",
                        "commit", "-qm", "fixture"], cwd=self.repo, check=True)
        # Only the commands needed by the hermetic proof, explicitly no Chez.
        path = self.workspace / "bin"
        path.mkdir()
        for command in ("bash", "git", "python3", "cat"):
            (path / command).symlink_to(shutil.which(command))
        self.environment = {**os.environ, "PATH": str(path), "EMIT_VERBOSITY": "quiet"}

    def tearDown(self):
        shutil.rmtree(self.workspace)

    def run_tool(self, name, *arguments):
        return subprocess.run([shutil.which("python3"), str(self.repo / "tools" / name),
                               *arguments], cwd=self.repo, env=self.environment,
                              capture_output=True, text=True)

    def files(self):
        return {str(path.relative_to(self.repo)): hashlib.sha256(path.read_bytes()).hexdigest()
                for path in self.repo.rglob("*") if path.is_file()
                and ".git" not in path.relative_to(self.repo).parts}

    def proof(self):
        report = self.workspace / "proof.json"
        before = self.files()
        result = self.run_tool("test-source.py", "--report", str(report))
        self.assertEqual(before, self.files(), "proof mutated original checkout")
        return result, json.loads(report.read_text()) if report.exists() else None

    def test_matching_source_passes_without_chez(self):
        result, report = self.proof()
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(report["status"], "passed")
        self.assertEqual(report["bootstrap_modules"], sorted(MODULES))
        self.assertEqual(result.stdout, "")
        self.assertEqual(result.stderr, "")

    def test_uncommitted_stale_source_fails_without_mutation(self):
        (self.repo / "src/core.ss").write_text("changed source\n")
        result, report = self.proof()
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(report["changed_modules"], ["embed.ll"])
        self.assertIn("FAIL", result.stderr)

    def test_dirty_bootstrap_is_checked_not_skipped(self):
        (self.repo / "bootstrap/embed.ll").write_text("stale dirty IR\n")
        result, report = self.proof()
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(report["changed_modules"], ["embed.ll"])
        self.assertNotIn("SKIP", result.stderr)

    def test_matching_uncommitted_source_and_bootstrap_pass(self):
        for name in ("src/core.ss", "bootstrap/embed.ll"):
            (self.repo / name).write_text("matching working-tree edits\n")
        result, _ = self.proof()
        self.assertEqual(result.returncode, 0, result.stderr)

    def test_untracked_new_inputs_included(self):
        (self.repo / "src/new.ss").write_text("new input\n")
        with (self.repo / "tools/regen.sh").open("a") as output:
            output.write("test -f src/new.ss\n")
        result, _ = self.proof()
        self.assertEqual(result.returncode, 0, result.stderr)

    def test_missing_bootstrap_fails(self):
        (self.repo / "bootstrap/schemec.ll").unlink()
        result, _ = self.proof()
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("missing", result.stderr)

    def test_undeclared_bootstrap_fails(self):
        (self.repo / "bootstrap/orphan.ll").write_text("orphan\n")
        result, _ = self.proof()
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("undeclared", result.stderr)

    def test_nested_undeclared_bootstrap_is_not_omitted(self):
        (self.repo / "bootstrap/nested").mkdir()
        (self.repo / "bootstrap/nested/orphan.ll").write_text("orphan\n")
        result, _ = self.proof()
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("nested/orphan.ll", result.stderr)

    def test_regeneration_failure_cannot_pass(self):
        (self.repo / "tools/regen.sh").write_text("exit 42\n")
        result, report = self.proof()
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(report["regen_exit_code"], 42)

    def test_external_symlink_is_rejected(self):
        (self.repo / "src/external.ss").symlink_to(ROOT / "src/core.ss")
        result = self.run_tool("test-source.py")
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("external snapshot symlink", result.stderr)

    def test_fingerprint_missing_then_matching(self):
        self.assertEqual(json.loads(self.run_tool("source-fingerprint.py", "--status").stdout)["status"], "missing")
        recorded = self.run_tool("source-fingerprint.py", "--record")
        self.assertEqual(recorded.returncode, 0, recorded.stderr)
        self.assertEqual(json.loads(self.run_tool("source-fingerprint.py", "--status").stdout)["status"], "matching")

    def test_fingerprint_invalidation(self):
        for name in ("src/core.ss", "bootstrap/embed.ll", "tools/regen.sh", "tools/compiler-inputs.sh"):
            self.run_tool("source-fingerprint.py", "--record")
            with (self.repo / name).open("a") as output:
                output.write("\n# invalidation\n")
            result = self.run_tool("source-fingerprint.py", "--status")
            self.assertEqual(json.loads(result.stdout)["status"], "mismatch", name)

    def test_timestamp_only_edits_do_not_invalidate_content_hint(self):
        self.run_tool("source-fingerprint.py", "--record")
        os.utime(self.repo / "src/core.ss", (1, 1))
        os.utime(self.repo / "bootstrap/embed.ll", (1, 1))
        result = self.run_tool("source-fingerprint.py", "--status")
        self.assertEqual(json.loads(result.stdout)["status"], "matching")

    def test_toolchain_options_invalidate(self):
        self.run_tool("source-fingerprint.py", "--record")
        self.environment["CXXFLAGS"] = "-O3"
        result = self.run_tool("source-fingerprint.py", "--status")
        self.assertEqual(json.loads(result.stdout)["status"], "mismatch")

    def test_native_host_and_headers_invalidate_toolchain_proof(self):
        for name in ("src/emit.cpp", "src/native-cache.h", "src/explicit-artifact.h"):
            path = self.repo / name
            path.write_text("original host fixture\n")
            self.run_tool("source-fingerprint.py", "--record")
            before = json.loads(self.run_tool("source-fingerprint.py", "--status").stdout)
            path.write_text("changed host fixture\n")
            after = json.loads(self.run_tool("source-fingerprint.py", "--status").stdout)
            self.assertEqual(after["status"], "mismatch", name)
            self.assertEqual(before["source_digest"], after["source_digest"], name)
            self.assertNotEqual(before["toolchain_digest"], after["toolchain_digest"], name)

    def test_added_and_deleted_native_header_invalidates_toolchain_proof(self):
        self.run_tool("source-fingerprint.py", "--record")
        path = self.repo / "src/new-host.h"
        path.write_text("new header\n")
        self.assertEqual(json.loads(self.run_tool("source-fingerprint.py", "--status").stdout)["status"], "mismatch")
        self.run_tool("source-fingerprint.py", "--record")
        path.unlink()
        self.assertEqual(json.loads(self.run_tool("source-fingerprint.py", "--status").stdout)["status"], "mismatch")

    def test_corrupt_fingerprint_is_missing(self):
        (self.repo / "build").mkdir()
        (self.repo / "build/source-fingerprint.json").write_text("not JSON")
        result = self.run_tool("source-fingerprint.py", "--status")
        self.assertEqual(json.loads(result.stdout)["status"], "missing")


class InventoryTests(unittest.TestCase):
    def test_assembly_partition_and_generator_inputs(self):
        result = subprocess.check_output(["bash", "tools/compiler-inputs.sh", "--list"], cwd=ROOT, text=True)
        paths = result.splitlines()
        for name in ("src/prelude.scm", "src/prelude-surface.scm", "src/include-reader.ss",
                     "src/repl-core.ss", "src/entry-repl.scm", "tools/gen-scheme-base.ss",
                     "tools/regen.sh", "tools/compiler-inputs.sh", "lib/scheme/base.sld"):
            self.assertIn(name, paths)
        self.assertEqual(len(paths), len(set(paths)))
        self.assertTrue(all((ROOT / name).is_file() for name in paths))


if __name__ == "__main__":
    unittest.main(verbosity=2)
