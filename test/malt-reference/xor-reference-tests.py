#!/usr/bin/env python3
"""Check that XOR fixture portability preserves exact random stream checks."""
import copy
import importlib.util
import math
from pathlib import Path
import unittest

spec = importlib.util.spec_from_file_location("xor_reference", Path(__file__).with_name("xor-reference.py"))
reference = importlib.util.module_from_spec(spec)
spec.loader.exec_module(reference)


class FixtureTests(unittest.TestCase):
    def setUp(self):
        self.expected = {"initial_theta": [[[0.39518603978583877]]],
                         "sample_schedule": [[0, 1, 2, 3]],
                         "final_random_state": [1, 2, 3, 4, 5, 6]}
        self.actual = copy.deepcopy(self.expected)

    def test_accepts_libm_rounding(self):
        value = self.actual["initial_theta"][0][0][0]
        self.actual["initial_theta"][0][0][0] = math.nextafter(value, math.inf)
        reference.check_fixture(self.actual, self.expected)

    def test_rejects_changed_weight(self):
        self.actual["initial_theta"][0][0][0] += 1e-10
        with self.assertRaises(AssertionError):
            reference.check_fixture(self.actual, self.expected)

    def test_rejects_changed_random_stream(self):
        for key in ("sample_schedule", "final_random_state"):
            with self.subTest(key=key), self.assertRaises(AssertionError):
                actual = copy.deepcopy(self.expected)
                actual[key][0] = 3
                reference.check_fixture(actual, self.expected)

    def test_rejects_invalid_weights(self):
        for value in (math.nan, math.inf, [], [0.39518603978583877, 0.0]):
            with self.subTest(value=value), self.assertRaises(AssertionError):
                self.actual["initial_theta"][0][0][0] = value
                reference.check_fixture(self.actual, self.expected)


if __name__ == "__main__":
    unittest.main()
