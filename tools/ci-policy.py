#!/usr/bin/env python3
"""Translate conservative change classification into required CI proof jobs."""
import argparse
import json
import os
import sys


def plan(classification, event, force_full=False, rehearsal=False):
    required = {"docs_only", "code", "source", "units", "reference", "archive", "categories", "paths", "reason"}
    valid = isinstance(classification, dict) and required <= classification.keys()
    if valid:
        valid = all(isinstance(classification[key], bool) for key in ["docs_only", "code", "source", "units", "archive"])
        valid = valid and isinstance(classification["reference"], list)
    if not valid:
        classification = {"docs_only": False, "code": True, "source": True, "units": True,
                          "archive": True, "reference": ["self-emission", "dump-parity", "render-datum"]}
    comprehensive = force_full or event in {"schedule", "workflow_dispatch", "tag"}
    code = comprehensive or classification["code"] or not classification["docs_only"]
    source = comprehensive or classification["source"]
    units = comprehensive or classification["units"]
    reference = classification["reference"]
    if not all(item in {"self-emission", "dump-parity", "render-datum"} for item in reference):
        raise ValueError("unknown required reference suite")
    archive = rehearsal or event == "tag" or classification["archive"]
    verification = source or units or bool(reference) or comprehensive
    return {"code": code, "source": source, "units": units, "verification": verification,
            "reference": reference, "reference_full": comprehensive, "archive": archive,
            "mode": "full" if comprehensive else "normal", "classification": classification,
            "required": ["policy"] + (["prepare", "native"] if code else [])
            + (["verification"] if verification else []) + (["package", "archive"] if archive else [])}


def aggregate(policy, needs):
    failures = []
    for name in policy.get("required", []):
        if name not in needs or needs[name].get("result") != "success":
            failures.append(name + ": " + str(needs.get(name, {}).get("result", "missing")))
    if not policy.get("required") or "policy" not in policy["required"]:
        failures.append("missing policy metadata")
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
    args = parser.parse_args()
    try:
        if args.operation == "plan":
            try:
                classified = json.loads(args.classification or "null")
            except ValueError:
                classified = None
            print(json.dumps(plan(classified, args.event, args.full, args.rehearsal), sort_keys=True))
        elif args.operation == "group":
            print(json.dumps({"group": f"{args.workflow}-pr-{args.pr}" if args.event == "pull_request"
                              else f"{args.workflow}-{args.ref}", "cancel": args.event == "pull_request"}))
        else:
            failures = aggregate(json.loads(args.plan or "null"), json.loads(args.needs or "null"))
            if failures:
                raise ValueError("required CI gates failed: " + ", ".join(failures))
            if os.environ.get("EMIT_VERBOSITY", "default") not in {"quiet", "q", "0"}:
                print("ci: required proof gates passed", file=sys.stderr)
    except (ValueError, TypeError, AttributeError) as error:
        print("ci: policy failed: " + str(error), file=sys.stderr)
        sys.exit(1)
