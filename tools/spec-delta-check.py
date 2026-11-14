#!/usr/bin/env python3
"""Check an OpenSpec change's delta specs against the live main specs before a sync.

Usage: tools/spec-delta-check.py CHANGE_DIR [--specs DIR]

A MODIFIED requirement replaces the main requirement wholesale when it is synced, so a delta
written against an older copy of the main spec silently drops whatever was added since (change:
automate-release-handoff, design D2). For each delta spec this reports, on stdout:

  conflict=<text>  a MODIFIED or REMOVED requirement absent from the main spec, an ADDED one
                   already present there, or a main-spec scenario a MODIFIED block omits.
                   Each conflict fails the check (exit 1).
  review=<text>    a paragraph of a main requirement's description that the MODIFIED block does
                   not repeat verbatim: an intended rewrite or an accidental drop, which only a
                   reader can tell apart. Reviews do not fail the check.

The main specs are read from the working tree (default: openspec/specs beside CHANGE_DIR's
openspec root), never from an archived change.
"""

import argparse
from pathlib import Path
import re
import sys

OPERATIONS = ("ADDED", "MODIFIED", "REMOVED", "RENAMED")


def requirements(text):
    """Map requirement name -> block text for every `### Requirement:` in TEXT."""
    blocks = {}
    current, lines = None, []
    for line in text.splitlines():
        if line.startswith("### Requirement:") or line.startswith("## "):
            if current is not None:
                blocks[current] = "\n".join(lines)
            current = line[len("### Requirement:"):].strip() if line.startswith("### Requirement:") else None
            lines = []
        elif current is not None:
            lines.append(line)
    if current is not None:
        blocks[current] = "\n".join(lines)
    return blocks


def delta_sections(text):
    """Map operation -> section text for `## <OP> Requirements` headers."""
    sections, current, lines = {}, None, []
    for line in text.splitlines():
        match = re.match(r"^## (\w+) Requirements\s*$", line)
        if match or line.startswith("## "):
            if current is not None:
                sections[current] = "\n".join(lines)
            current = match.group(1) if match and match.group(1) in OPERATIONS else None
            lines = []
        elif current is not None:
            lines.append(line)
    if current is not None:
        sections[current] = "\n".join(lines)
    return sections


def scenarios(block):
    return [line[len("#### Scenario:"):].strip() for line in block.splitlines()
            if line.startswith("#### Scenario:")]


def description(block):
    """Paragraphs of the requirement text before its first scenario, whitespace-normalized."""
    prose = block.split("#### Scenario:", 1)[0]
    return [" ".join(paragraph.split()) for paragraph in re.split(r"\n\s*\n", prose) if paragraph.strip()]


def check(change_dir, specs_dir):
    conflicts, reviews = [], []
    deltas = sorted((change_dir / "specs").glob("**/spec.md"))
    for delta in deltas:
        capability = delta.parent.relative_to(change_dir / "specs").as_posix()
        main_path = specs_dir / capability / "spec.md"
        main = requirements(main_path.read_text()) if main_path.exists() else {}
        sections = delta_sections(delta.read_text())
        for name in requirements(sections.get("ADDED", "")):
            if name in main:
                conflicts.append(f"{capability}: ADDED requirement \"{name}\" already exists in the main spec")
        for name in requirements(sections.get("REMOVED", "")):
            if name not in main:
                conflicts.append(f"{capability}: REMOVED requirement \"{name}\" is not in the main spec")
        for name, block in requirements(sections.get("MODIFIED", "")).items():
            if name not in main:
                conflicts.append(f"{capability}: MODIFIED requirement \"{name}\" is not in the main spec")
                continue
            missing = [title for title in scenarios(main[name]) if title not in scenarios(block)]
            for title in missing:
                conflicts.append(f"{capability}: MODIFIED \"{name}\" drops main scenario \"{title}\"")
            kept = description(block)
            changed = [paragraph for paragraph in description(main[name]) if paragraph not in kept]
            if changed:
                reviews.append(f"{capability}: MODIFIED \"{name}\" rewrites or drops {len(changed)} "
                               f"description paragraph(s), starting \"{changed[0][:60]}\"")
    return deltas, conflicts, reviews


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("change_dir", type=Path)
    parser.add_argument("--specs", type=Path)
    args = parser.parse_args()
    change_dir = args.change_dir.resolve()
    specs_dir = args.specs or change_dir.parent.parent / "specs"
    if change_dir.parent.name == "archive":
        specs_dir = args.specs or change_dir.parent.parent.parent / "specs"
    deltas, conflicts, reviews = check(change_dir, specs_dir)
    for item in conflicts:
        print("conflict=" + item)
    for item in reviews:
        print("review=" + item)
    print(f"check specs {change_dir.name} -> {specs_dir}  [{len(deltas)} delta spec(s), "
          f"{len(conflicts)} conflict(s), {len(reviews)} review(s)]", file=sys.stderr)
    return 1 if conflicts else 0


if __name__ == "__main__":
    sys.exit(main())
