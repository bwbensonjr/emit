#!/usr/bin/env python3
"""Compile the actual provisioner's GC version assertion against isolated fixtures."""
from pathlib import Path
import re
import shutil
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parent.parent


class VersionProbeTests(unittest.TestCase):
    def test_gc_headers_and_linked_version_are_both_exact(self):
        compiler = shutil.which("cc")
        self.assertIsNotNone(compiler, "C compiler prerequisite unavailable")
        recipe = (ROOT / "tools/ci-provision.sh").read_text()
        match = re.search(r"<<< '(#include <gc/gc.h>\n.*?GC_get_version.*?; })'", recipe, re.S)
        self.assertIsNotNone(match, "actual GC probe source missing")
        source = match.group(1)
        for headers, linked, expected in [(8, 8, "pass"), (9, 8, "compile-fail"), (8, 9, "run-fail")]:
            with self.subTest(headers=headers, linked=linked), tempfile.TemporaryDirectory() as temporary:
                directory = Path(temporary)
                (directory / "gc").mkdir()
                (directory / "gc/gc.h").write_text(
                    f"#define GC_VERSION_MAJOR 8\n#define GC_VERSION_MINOR 2\n#define GC_VERSION_MICRO {headers}\n"
                    f"static unsigned GC_get_version(void) {{ return (8u << 16) | (2u << 8) | {linked}u; }}\n")
                executable = directory / "probe"
                result = subprocess.run([compiler, "-std=c11", "-I", str(directory), "-x", "c", "-", "-o", str(executable)],
                                        input=source, text=True, capture_output=True)
                if expected == "compile-fail":
                    self.assertNotEqual(result.returncode, 0)
                else:
                    self.assertEqual(result.returncode, 0, result.stderr)
                    result = subprocess.run([str(executable)])
                    self.assertEqual(result.returncode == 0, expected == "pass")


if __name__ == "__main__":
    unittest.main()
