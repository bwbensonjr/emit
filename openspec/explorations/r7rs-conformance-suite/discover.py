import json, subprocess, os, re
from concurrent.futures import ProcessPoolExecutor
SP=os.path.dirname(os.path.abspath(__file__))
REPO=os.path.abspath(os.path.join(SP, "..", "..", ".."))
EMIT=f"{REPO}/build/emit"

def _need(path, what):
    import sys, os
    if not os.path.exists(path):
        sys.exit(f"missing {what}: {path}\n"
                 "The suite is not vendored here (it belongs in test/r7rs/; see README.md). Fetch it:\n"
                 "  curl -sLO https://raw.githubusercontent.com/ashinn/chibi-scheme/master/tests/r7rs-tests.scm\n"
                 "Expected sha256 of the revision measured:\n"
                 "  9b10cac782ef9c52c4cb0a3a489f01415b1262785d7eb14c70fa88ab859cf950\n"
                 "See README.md.")

_need(f"{SP}/forms.json", "the form index (run split.py first)")
harness=open(f"{SP}/harness.scm").read()
forms=json.load(open(f"{SP}/forms.json"))

# assign each form to its section (innermost top-level test-begin, skipping "R7RS")
sections=[]; cur=None
for f in forms:
    m=re.match(r'\(test-begin\s+"([^"]*)"', f["text"].strip())
    if m and m.group(1)!="R7RS":
        cur=m.group(1); sections.append((cur,[])); continue
    if re.match(r'\(test-(begin|end)\b', f["text"].strip()): continue
    if re.match(r'\(import\b', f["text"].strip()): continue
    if cur is None: continue
    sections[-1][1].append(f)

def run(sel, wid):
    path=f"{SP}/probe-{wid}.scm"
    with open(path,"w") as fh:
        fh.write(harness)
        for fm in sel: fh.write("\n"+fm["text"]+"\n")
        fh.write("\n(test-summary)\n")
    try:
        p=subprocess.run([EMIT,"run",path],capture_output=True,text=True,timeout=180,cwd=REPO)
    except subprocess.TimeoutExpired:
        return False,"","TIMEOUT"
    return ("pass=" in p.stdout), p.stdout, p.stderr

def errline(out,err):
    ls=[l for l in err.strip().splitlines() if l.strip() and "resolve manifest" not in l]
    if ls: return ls[-1], ("compile" if ls[-1].startswith("emit:") else "runtime")
    ls=[l for l in out.strip().splitlines() if l.strip()]
    return (ls[-1] if ls else "<no output>"), "runtime"

def do_section(arg):
    idx,(name,fs)=arg
    wid=idx
    good=[]; rejected=[]; p=0; step=16; compiles=0
    N=len(fs)
    while p<N:
        step=min(step,N-p)
        ok,out,err=run(good+fs[p:p+step],wid); compiles+=1
        if ok:
            good.extend(fs[p:p+step]); p+=step; step=min(step*2,32)
        elif step==1:
            msg,kind=errline(out,err)
            rejected.append({"line":fs[p]["line"],"text":fs[p]["text"][:300],"err":msg,"kind":kind})
            p+=1
        else:
            step=max(1,step//2)
    ok,out,err=run(good,wid)
    fails=[l for l in out.splitlines() if l.startswith("FAIL")]
    m=re.search(r"pass=(\d+) fail=(\d+)",out)
    return {"section":name,"forms":N,"accepted":len(good),"rejected":rejected,
            "pass":int(m.group(1)) if m else 0,"fail":int(m.group(2)) if m else -1,
            "failures":fails,"compiles":compiles}

if __name__=="__main__":
    print(f"{len(sections)} sections, {sum(len(s[1]) for s in sections)} forms")
    with ProcessPoolExecutor(max_workers=8) as ex:
        res=list(ex.map(do_section, list(enumerate(sections))))
    json.dump(res,open(f"{SP}/results.json","w"),indent=1)
    tp=sum(r["pass"] for r in res); tf=sum(r["fail"] for r in res)
    tr=sum(len(r["rejected"]) for r in res)
    print(f"\n{'section':38} {'forms':>5} {'ok':>4} {'rej':>4} {'pass':>5} {'fail':>5}")
    for r in res:
        print(f"{r['section'][:38]:38} {r['forms']:5} {r['accepted']:4} {len(r['rejected']):4} {r['pass']:5} {r['fail']:5}")
    print(f"\nTOTALS: pass={tp} fail={tf} rejected-forms={tr} compiles={sum(r['compiles'] for r in res)}")
