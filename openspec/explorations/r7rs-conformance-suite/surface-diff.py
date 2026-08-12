#!/usr/bin/env python3
"""Diff Emit's bound names against R7RS-small's own export lists.

Static companion to discover.py: where that one measures what RUNS, this one
measures what is BOUND, by comparing three sources of truth:

  R7RS-small  docs/r7rs/09-standard-libraries.md   (the standard's export lists)
  Emit        lib/**/*.sld  (export lists)  +  src/parse.ss  (*integrable*)
  the suite   r7rs-tests.scm (which names it actually exercises)

Reports per library: names present, names missing, and -- when the suite is
present alongside this script -- which of the missing ones the suite exercises.

Run from anywhere:  python3 surface-diff.py
Needs r7rs-tests.scm beside it only for the "exercised" column; see README.md.
"""
import re, glob, os, sys

SP = os.path.dirname(os.path.abspath(__file__))
REPO = os.path.abspath(os.path.join(SP, "..", "..", ".."))


def r7rs_libraries():
    """Library name -> set of exported names, from the spec in markdown."""
    doc = open(os.path.join(REPO, "docs/r7rs/09-standard-libraries.md")).read()
    libs, cur = {}, None
    for b in re.finditer(r"\*\*([^*]+)\*\*|```scheme\n(.*?)```", doc, re.S):
        if b.group(1):
            cur = b.group(1).strip()
        else:
            libs.setdefault(cur, set()).update(b.group(2).split())
    return libs


def sexp_at(txt, start):
    """Text inside the parenthesized form beginning at `start`, comments skipped."""
    depth, i = 0, start
    while i < len(txt):
        c = txt[i]
        if c == ";":
            while i < len(txt) and txt[i] != "\n":
                i += 1
            continue
        if c == "(":
            depth += 1
        elif c == ")":
            depth -= 1
            if depth == 0:
                return txt[start + 1:i]
        i += 1
    return ""


def emit_bound():
    """Every name a user program can reference: .sld exports + integrables + core."""
    names = set()

    # Library export lists. A paren-matched read, NOT a regex: base.sld puts one
    # name per line but inexact.sld does not, and a line-oriented regex silently
    # reports all 12 of its exports as missing.
    for f in glob.glob(os.path.join(REPO, "lib/**/*.sld"), recursive=True):
        txt = open(f).read()
        i = txt.find("(export")
        if i >= 0:
            body = sexp_at(txt, i)
            names.update(w for w in body.split()[1:] if not w.startswith(";"))

    # Integrable primitives: the (name raw-op arity [fold-kind]) table. The
    # leading \( must be followed by a non-paren character, or the leftmost match
    # on `'((cons %cons 2)` captures "(cons" and `cons` looks unbound.
    src = open(os.path.join(REPO, "src/parse.ss")).read()
    tbl = src[src.index("(define *integrable*"):src.index("(define (integrable-lookup")]
    for m in re.finditer(r"\(([^\s()]+)\s+(%\S+)\s+(#f|\d+)", tbl):
        names.add(m.group(1))

    # Core forms, recognized structurally by the expander rather than bound.
    names.update("""quote if lambda let letrec letrec* begin set! define apply
                    define-syntax syntax-rules quasiquote unquote unquote-splicing
                    define-record-type else => ... _""".split())
    return names


def suite_names():
    """Identifiers the vendored suite mentions, or None if it is not here."""
    p = os.path.join(SP, "r7rs-tests.scm")
    if not os.path.exists(p):
        return None
    txt = re.sub(r";[^\n]*", "", open(p).read())
    return set(re.findall(r"[A-Za-z!$%&*/:<=>?^_~+\-][A-Za-z0-9!$%&*/:<=>?^_~+\-.@]*", txt))


def main():
    libs, bound, used = r7rs_libraries(), emit_bound(), suite_names()
    if used is None:
        print("note: r7rs-tests.scm is not beside this script; omitting the "
              "exercised-by-suite column (see README.md)\n", file=sys.stderr)

    # The CxR entry in the spec markdown picks up a prose code block, so its
    # count is unreliable; the others are clean.
    for name in sorted(libs):
        have = libs[name] & bound
        missing = sorted(libs[name] - bound)
        print(f"\n=== {name}: {len(have)}/{len(libs[name])} present, {len(missing)} missing")
        if missing:
            print("    " + " ".join(missing))
            if used is not None:
                hot = sorted(set(missing) & used)
                if hot:
                    print(f"    exercised by the suite ({len(hot)}): " + " ".join(hot))


if __name__ == "__main__":
    main()
