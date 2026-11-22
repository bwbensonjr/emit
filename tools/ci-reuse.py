#!/usr/bin/env python3
"""Satisfy a CI plan with an executed pull-request run of the identical tree, or leave it to execute.

Change: reuse-validation-by-tree (design D2). On a push to main or a release tag, find the pull
requests associated with the commit, their successful same-repository Source compatibility runs,
and each run's validation-plan artifact. The first recorded plan for the same tree that executed
its own jobs and covers the current plan (tools/ci-policy.py covers) is reused. Every other
outcome, including any lookup error, leaves the plan to execute as before.

The resulting plan goes to stdout; narration goes to stderr (docs/OUTPUT.md).
"""
import argparse
import io
from importlib.machinery import SourceFileLoader
import json
import os
from pathlib import Path
import subprocess
import sys
import zipfile

sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parent.parent
policy = SourceFileLoader("ci_policy", str(ROOT / "tools/ci-policy.py")).load_module()

WORKFLOW = "compatibility.yml"
REQUIRED_JOB = "Required validation"
PLAN_ARTIFACT = "validation-plan"
REUSABLE_EVENTS = {"push", "tag"}


def level():
    value = os.environ.get("EMIT_VERBOSITY", "default")
    if value in {"quiet", "q", "0"}:
        return 0
    return 2 if value in {"verbose", "v", "2"} else 1


def say(message, detail=False):
    if level() >= (2 if detail else 1):
        print(message, file=sys.stderr)


class GitHub:
    """The only GitHub access: `gh api`, which reads GH_TOKEN. Tests replace it."""

    def call(self, path):
        result = subprocess.run(["gh", "api", "-H", "Accept: application/vnd.github+json", path],
                                capture_output=True)
        if result.returncode != 0:
            raise RuntimeError(f"gh api {path}: " + result.stderr.decode(errors="replace").strip())
        return result.stdout

    def json(self, path):
        return json.loads(self.call(path))

    def bytes(self, path):
        return self.call(path)


def required_job_succeeded(client, repo, run_id):
    jobs = client.json(f"repos/{repo}/actions/runs/{run_id}/jobs?per_page=100")["jobs"]
    return any(job.get("name") == REQUIRED_JOB and job.get("conclusion") == "success" for job in jobs)


def recorded_plan(client, repo, run_id):
    artifacts = client.json(f"repos/{repo}/actions/runs/{run_id}/artifacts?per_page=100")["artifacts"]
    found = [item for item in artifacts if item.get("name") == PLAN_ARTIFACT]
    if not found:
        raise LookupError("run has no validation-plan artifact")
    if found[0].get("expired"):
        raise LookupError("validation-plan artifact has expired")
    archive = zipfile.ZipFile(io.BytesIO(client.bytes(f"repos/{repo}/actions/artifacts/{found[0]['id']}/zip")))
    return json.loads(archive.read("plan.json"))


def candidates(client, repo, sha):
    """Yield (pull request, run) pairs, newest run first, with rejected ones narrated."""
    for pull in client.json(f"repos/{repo}/commits/{sha}/pulls"):
        number = pull.get("number")
        head = pull.get("head") or {}
        if (head.get("repo") or {}).get("full_name") != repo:
            say(f"reuse: pull request #{number} -> rejected  [head is in a fork]")
            continue
        runs = client.json(f"repos/{repo}/actions/workflows/{WORKFLOW}/runs"
                           f"?event=pull_request&head_sha={head.get('sha')}&per_page=20")["workflow_runs"]
        say(f"reuse: pull request #{number} head {str(head.get('sha'))[:12]} -> {len(runs)} run(s)", detail=True)
        for run in runs:
            yield number, run


def decide(client, repo, event, sha, current):
    """Return (plan, reason): the plan with reuse applied and None, or the unchanged plan and why."""
    if event not in REUSABLE_EVENTS:
        return current, f"{event} runs always execute"
    if current.get("toolchain", True) is not False:
        return current, "a toolchain-recipe change is never reused"
    if not current.get("tree"):
        return current, "current run has no recorded tree"
    try:
        for number, run in candidates(client, repo, sha):
            label = f"reuse: run {run.get('id')} (#{number})"
            if run.get("conclusion") != "success":
                say(f"{label} -> rejected  [concluded {run.get('conclusion')}]", detail=True)
                continue
            if (run.get("head_repository") or {}).get("full_name") != repo:
                say(f"{label} -> rejected  [run is from a fork]")
                continue
            try:
                if not required_job_succeeded(client, repo, run["id"]):
                    say(f"{label} -> rejected  [{REQUIRED_JOB} did not succeed]")
                    continue
                candidate = recorded_plan(client, repo, run["id"])
            except (LookupError, KeyError, ValueError, zipfile.BadZipFile) as error:
                say(f"{label} -> rejected  [{error}]")
                continue
            reason = policy.covers(candidate, current)
            if reason:
                say(f"{label} -> rejected  [{reason}]")
                continue
            source = {"run": run.get("html_url"), "sha": candidate.get("sha") or run.get("head_sha"),
                      "tree": candidate["tree"], "mode": candidate.get("mode")}
            return policy.apply_reuse(current, source), None
    except (RuntimeError, OSError, LookupError, KeyError, ValueError, TypeError) as error:
        return current, f"lookup failed: {error}"
    return current, "no executed run of this tree covers the plan"


def repository():
    if os.environ.get("GITHUB_REPOSITORY"):
        return os.environ["GITHUB_REPOSITORY"]
    url = subprocess.check_output(["git", "remote", "get-url", "origin"], cwd=ROOT, text=True).strip()
    return url.removesuffix(".git").replace("git@github.com:", "").split("github.com/")[-1]


def dry_run_plan(sha, event):
    """Approximate the CI plan for SHA from its first-parent diff, for local inspection."""
    classifier = SourceFileLoader("ci_classifier", str(ROOT / "tools/test-classify.py")).load_module()
    paths = subprocess.check_output(["git", "diff", "--name-only", "--no-renames", f"{sha}^1", sha],
                                    cwd=ROOT, text=True).split()
    tree = subprocess.check_output(["git", "rev-parse", f"{sha}^{{tree}}"], cwd=ROOT, text=True).strip()
    return policy.plan(classifier.classify_paths(paths), event, tree=tree, sha=sha)


def main():
    parser = argparse.ArgumentParser(
        description="Satisfy a CI plan with an executed pull-request run of the identical tree, or leave it to execute.")
    parser.add_argument("--event", required=True, help="push, tag, pull_request, schedule, or workflow_dispatch")
    parser.add_argument("--sha", required=True, help="the commit this run validates")
    parser.add_argument("--plan", help="the current plan JSON (from tools/ci-policy.py plan)")
    parser.add_argument("--repo", help="owner/name; default GITHUB_REPOSITORY or the origin remote")
    parser.add_argument("--dry-run", action="store_true",
                        help="derive an approximate plan from the commit's first-parent diff when --plan is absent")
    args = parser.parse_args()
    if args.plan is None and not args.dry_run:
        parser.error("--plan is required unless --dry-run is given")
    current = json.loads(args.plan) if args.plan else dry_run_plan(args.sha, args.event)
    repo = args.repo or repository()
    result, reason = decide(GitHub(), repo, args.event, args.sha, current)
    if reason:
        say(f"reuse {args.sha[:12]} -> execute  [{reason}]")
    else:
        reused = result["reused"]
        say(f"reuse {args.sha[:12]} -> {reused['run']}  [tree {reused['tree'][:12]}; mode {reused['mode']}]")
    print(json.dumps(result, sort_keys=True))


if __name__ == "__main__":
    main()
