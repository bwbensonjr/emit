#!/usr/bin/env python3
"""Pin retained legacy assertion ownership, not merely a total suite count."""

import hashlib
import json
from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parent.parent


class CoverageTests(unittest.TestCase):
    def test_legacy_inventory(self):
        data = json.loads((ROOT / "tools/test-registry.json").read_text())
        suites = data["suites"]
        # Baseline a623852: 53 mandatory native groups, one opt-in stale
        # exclusion group, and 41 developer groups. Changing these pins requires
        # an explicit coverage-map explanation, not just deleting registry rows.
        expected = {
            "run-all-tests.sh": (54, "8ab3c22a0d658306f039d2deedfef7c641d2595cbf584d557d8acb28b6256877"),
            "run-dev-tests.sh": (41, "6c03ab816ae02ee5949f10df0986414bb8b1801d26182b8a89caa12b08790bdf"),
        }
        for runner, (count, digest) in expected.items():
            labels = sorted(item["label"] for suite in suites for item in suite["legacy"]
                            if item["runner"] == runner)
            self.assertEqual(len(labels), count)
            self.assertEqual(hashlib.sha256("\n".join(labels).encode()).hexdigest(), digest)
        self.assertEqual(len([s for s in suites if "full" in s["profiles"]]), 53)
        units = {s["id"] for s in suites if "units" in s["profiles"]}
        self.assertEqual(len(units), 15)
        self.assertEqual(units, {s["id"] for s in suites if s["isolation"] == "readonly"})
        for suite in suites:
            self.assertTrue(suite["coverage"], suite["id"])
            self.assertTrue(suite["profiles"], suite["id"])
            self.assertTrue(suite["command"], suite["id"])
            if "full" in suite["profiles"] or "compat" in suite["profiles"] or "dev" in suite["profiles"]:
                self.assertFalse(suite["chez"], suite["id"])
        for name in ("dev", "compat"):
            self.assertLess(len([s for s in suites if name in s["profiles"]]), 15)


if __name__ == "__main__":
    unittest.main()
