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
        # New suites extend profiles without changing the historical label pins.
        # Source loading extends the existing 58-suite full profile; historical
        # label ownership above remains unchanged.
        self.assertEqual(len([s for s in suites if "full" in s["profiles"]]), 59)
        additions = {
            "source-load-interaction-host": {"dev", "full", "reference"},
            "stdlib-precompilation": {"full"},
            "program-toplevel-order-native": {"full"},
            "scheme-base-generator-native": {"full"},
            "scheme-base-generator-reference": {"reference"},
            "baked-library-source-chez": {"units", "reference"},
            "bake-libraries-contracts": {"full", "reference"},
        }
        by_id = {suite["id"]: suite for suite in suites}
        for name, profiles in additions.items():
            self.assertEqual(set(by_id[name]["profiles"]), profiles)
            self.assertEqual(by_id[name]["legacy"], [])
        units = {s["id"] for s in suites if "units" in s["profiles"]}
        self.assertEqual(len(units), 16)
        self.assertEqual(units, {s["id"] for s in suites if s["isolation"] == "readonly"})
        for suite in suites:
            self.assertTrue(suite["coverage"], suite["id"])
            self.assertTrue(suite["profiles"], suite["id"])
            self.assertTrue(suite["command"], suite["id"])
            if "full" in suite["profiles"] or "compat" in suite["profiles"] or "dev" in suite["profiles"]:
                self.assertFalse(suite["chez"], suite["id"])
        for name in ("dev", "compat"):
            self.assertLess(len([s for s in suites if name in s["profiles"]]), 15)
        compatibility = {s["id"] for s in suites if "compat" in s["profiles"]}
        self.assertIn("release-version-identity", compatibility)
        self.assertIn("installed-layout-libraries-support-files", compatibility)


if __name__ == "__main__":
    unittest.main()
