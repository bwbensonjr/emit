#!/usr/bin/env python3
"""Translate conservative change classification into required CI proof jobs."""
import argparse
import json
import os
import sys


REFERENCE_SUITES = ("self-emission", "dump-parity", "render-datum", "custom-writers-source")
# Categories the native matrix cannot prove; keep equal to LIGHTWEIGHT in tools/test-classify.py.
LIGHTWEIGHT = {"documentation", "packaging", "agent-config"}


def plan(classification, event, force_full=False, rehearsal=False, tree=None, sha=None):
    required = {"docs_only", "code", "source", "units", "reference", "archive", "categories", "paths", "reason"}
    valid = isinstance(classification, dict) and required <= classification.keys()
    if valid:
        valid = all(isinstance(classification[key], bool) for key in ["docs_only", "code", "source", "units", "archive"])
        valid = valid and isinstance(classification["reference"], list)
        valid = valid and isinstance(classification["categories"], list)
    if not valid:
        classification = {"docs_only": False, "code": True, "source": True, "units": True,
                          "archive": True, "reference": list(REFERENCE_SUITES), "categories": ["unknown"]}
    categories = set(classification["categories"])
    # A pull request that changes VERSION is validated as its tag will be, so release-only failures
    # surface before merge and the tag can reuse the result (change: reuse-validation-by-tree, D4).
    release_pr = event == "pull_request" and "release" in categories
    comprehensive = force_full or release_pr or event in {"schedule", "workflow_dispatch", "tag"}
    # Packaging-only diffs are proved by the channel rehearsal, not the native matrix (D7), and
    # agent configuration by the policy job's own checks (issue #187).
    lightweight = classification["docs_only"] or (bool(categories) and categories <= LIGHTWEIGHT)
    code = comprehensive or classification["code"] or not lightweight
    source = comprehensive or classification["source"]
    units = comprehensive or classification["units"]
    reference = classification["reference"]
    if not all(item in REFERENCE_SUITES for item in reference):
        raise ValueError("unknown required reference suite")
    archive = rehearsal or release_pr or event == "tag" or classification["archive"]
    # Channel rehearsal (channels.yml): a missing flag from an older classifier is conservative.
    channels = rehearsal or event in {"tag", "workflow_dispatch"} or classification.get("channels", True) is not False
    verification = source or units or bool(reference) or comprehensive
    return {"code": code, "source": source, "units": units, "verification": verification,
            "reference": reference, "reference_full": comprehensive, "archive": archive,
            "channels": channels,
            # A toolchain-recipe change is never reused; a missing flag is conservative (D6).
            "toolchain": classification.get("toolchain", True) is not False,
            "execute": True, "tree": tree, "sha": sha,
            "mode": "full" if comprehensive else "normal", "classification": classification,
            "required": required_jobs(code, verification, archive)}


def required_jobs(code, verification, archive, execute=True):
    executed = (["prepare", "native"] if code else []) + (["verification"] if verification else [])
    if not execute:
        # A reused result replaces only native and verification; a tag still packages and
        # offline-builds its own archive, which needs the prepared toolchain (D5).
        executed = []
    if archive and "prepare" not in executed:
        executed = ["prepare"] + executed
    return ["policy"] + executed + (["package", "archive"] if archive else [])


COVERED_FLAGS = ("code", "source", "units", "verification", "archive", "reference_full")
REUSE_FIELDS = ("run", "sha", "tree", "mode")


def covers(candidate, current):
    """Return None when an executed candidate plan satisfies the current plan, else the reason it
    does not (change: reuse-validation-by-tree, design D3)."""
    if not isinstance(candidate, dict) or not isinstance(current, dict):
        return "plan is missing or not an object"
    if not candidate.get("tree"):
        return "plan has no recorded tree"
    if not current.get("tree"):
        return "current run has no recorded tree"
    if candidate["tree"] != current["tree"]:
        return f"tree {candidate['tree'][:12]} differs from {current['tree'][:12]}"
    if candidate.get("reused") or candidate.get("execute") is False:
        return "plan itself reused another run"
    if candidate.get("toolchain", True) is not False or current.get("toolchain", True) is not False:
        return "a toolchain-recipe change is never reused"
    for flag in COVERED_FLAGS:
        if current.get(flag) and not candidate.get(flag):
            return f"plan omits required {flag}"
    missing = set(current.get("reference") or []) - set(candidate.get("reference") or [])
    if missing:
        return "plan omits reference suites " + ", ".join(sorted(missing))
    if current.get("mode") == "full" and candidate.get("mode") != "full":
        return "plan is not full mode"
    return None


def apply_reuse(current, source):
    """Return the current plan satisfied by an executed run (D5)."""
    if not all(source.get(field) for field in REUSE_FIELDS):
        raise ValueError("reuse source must name " + ", ".join(REUSE_FIELDS))
    result = dict(current)
    result["reused"] = {field: source[field] for field in REUSE_FIELDS}
    result["execute"] = False
    result["required"] = required_jobs(current["code"], current["verification"], current["archive"], False)
    return result


def reuse_line(policy):
    reused = policy["reused"]
    return (f"ci: required gates satisfied by reuse  [run {reused['run']}; sha {reused['sha'][:12]}; "
            f"tree {reused['tree'][:12]}; mode {reused['mode']}]")


def aggregate(policy, needs):
    failures = []
    for name in policy.get("required", []):
        if name not in needs or needs[name].get("result") != "success":
            failures.append(name + ": " + str(needs.get(name, {}).get("result", "missing")))
    if not policy.get("required") or "policy" not in policy["required"]:
        failures.append("missing policy metadata")
    if "reused" in policy:
        reused = policy["reused"]
        if not isinstance(reused, dict) or not all(reused.get(field) for field in REUSE_FIELDS):
            failures.append("reused result does not name its run, sha, tree, and mode")
    return failures


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("operation", choices=["plan", "aggregate", "group"])
    parser.add_argument("--classification")
    parser.add_argument("--event", default="pull_request")
    parser.add_argument("--full", action="store_true")
    parser.add_argument("--rehearsal", action="store_true")
    parser.add_argument("--plan")
    parser.add_argument("--needs")
    parser.add_argument("--workflow", default="validation")
    parser.add_argument("--ref", default="refs/heads/main")
    parser.add_argument("--pr", default="")
    parser.add_argument("--tree")
    parser.add_argument("--sha")
    args = parser.parse_args()
    try:
        if args.operation == "plan":
            try:
                classified = json.loads(args.classification or "null")
            except ValueError:
                classified = None
            print(json.dumps(plan(classified, args.event, args.full, args.rehearsal, args.tree, args.sha),
                             sort_keys=True))
        elif args.operation == "group":
            print(json.dumps({"group": f"{args.workflow}-pr-{args.pr}" if args.event == "pull_request"
                              else f"{args.workflow}-{args.ref}", "cancel": args.event == "pull_request"}))
        else:
            failures = aggregate(json.loads(args.plan or "null"), json.loads(args.needs or "null"))
            if failures:
                raise ValueError("required CI gates failed: " + ", ".join(failures))
            if os.environ.get("EMIT_VERBOSITY", "default") not in {"quiet", "q", "0"}:
                policy_record = json.loads(args.plan)
                if policy_record.get("reused"):
                    print(reuse_line(policy_record), file=sys.stderr)
                else:
                    print("ci: required proof gates passed", file=sys.stderr)
    except (ValueError, TypeError, AttributeError) as error:
        print("ci: policy failed: " + str(error), file=sys.stderr)
        sys.exit(1)
