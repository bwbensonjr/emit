#!/usr/bin/env python3
"""Verify the intentional internal interface used by the learner facade."""
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
EXPECTED = {
    "tensors": """dual dual? dual* primal backprop scalar? end-of-chain len ref refr
        tref tlen tmap list->tensor tensor build-tensor tensor? rank shape reshape
        trefs ext1 ext2 ext1-primal ext2-primal build-vector size-of""",
    "autodiff": """dual dual? primal backprop scalar? gradient gradient1 gradient-of
        map* prim1 prim2""",
    "operations": """+ - * / exp log expt sqrt sqr sum abs *-2-1 argmax max sum-cols
        correlate rectify flatten concat concat-n +-primal --primal *-primal /-primal
        rectify-primal exp-primal log-primal expt-primal sqrt-primal sqr-primal
        zeroes-primal sum-primal abs-primal *-2-1-primal argmax-primal max-primal
        sum-cols-primal correlate-primal flatten-primal concat-primal +-0-0 --0-0
        *-0-0 /-0-0 expt-0-0 exp-0 log-0 abs-0 rectify-0 sqrt-0 sum-1 argmax-1
        max-1 flatten-2 concat-1-1 =-0-0 <-0-0 <=-0-0 >-0-0 >=-0-0 =-1 <-1
        >-1 <=-1 >=-1 !=-1""",
    "diagnostics": """tolerance trace-print check-dual-equal? check-primal-gradient
        max-tensor-print-length make-printable""",
}


def exports(source):
    """Read the simple export declaration, including R7RS rename pairs."""
    text = re.sub(r";[^\n]*", "", source)
    text = text[text.index("(export") :]
    tokens = re.findall(r"[()]|[^\s()]+", text)
    offset = 0

    def datum():
        nonlocal offset
        value = tokens[offset]
        offset += 1
        if value != "(":
            return value
        result = []
        while tokens[offset] != ")":
            result.append(datum())
        offset += 1
        return result

    return [entry[2] if isinstance(entry, list) else entry for entry in datum()[1:]]


def main():
    total = 0
    for library, words in EXPECTED.items():
        path = ROOT / "lib/malt/learner" / (library + ".sld")
        actual = exports(path.read_text())
        want = set(words.split())
        if set(actual) != want or len(actual) != len(want):
            print(f"malt exports: {library}: missing={want - set(actual)}, "
                  f"unexpected={set(actual) - want}", file=sys.stderr)
            return 1
        total += len(actual)
    print(f"malt core exports: 4 libraries, {total} bindings verified")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
