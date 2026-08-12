import re, json, sys, os

SP = os.path.dirname(os.path.abspath(__file__))

def _need(path, what):
    import sys, os
    if not os.path.exists(path):
        sys.exit(f"missing {what}: {path}\n"
                 "The suite is not vendored here (it belongs in test/r7rs/; see README.md). Fetch it:\n"
                 "  curl -sLO https://raw.githubusercontent.com/ashinn/chibi-scheme/master/tests/r7rs-tests.scm\n"
                 "Expected sha256 of the revision measured:\n"
                 "  9b10cac782ef9c52c4cb0a3a489f01415b1262785d7eb14c70fa88ab859cf950\n"
                 "See README.md.")

_need(os.path.join(SP, "r7rs-tests.scm"), "the vendored suite")

src=open(os.path.join(SP, "r7rs-tests.scm")).read()
# paren-balanced top-level form reader that understands strings, chars, comments
forms=[]; i=0; n=len(src); line=1
def skip_ws(i,line):
    while i<n:
        c=src[i]
        if c=='\n': line+=1; i+=1
        elif c in ' \t\r': i+=1
        elif c==';':
            while i<n and src[i]!='\n': i+=1
        elif src.startswith('#|',i):
            d=1; i+=2
            while i<n and d:
                if src.startswith('#|',i): d+=1; i+=2
                elif src.startswith('|#',i): d-=1; i+=2
                else:
                    if src[i]=='\n': line+=1
                    i+=1
        elif src.startswith('#;',i):
            i+=2; i,line=skip_ws(i,line); i,line,_=read_form(i,line)
        else: break
    return i,line
def read_form(i,line):
    start=i; startline=line; depth=0
    while i<n:
        c=src[i]
        if c=='\\' and depth==0 and False: pass
        if src.startswith('#\\',i):
            i+=2
            while i<n and (src[i].isalnum() or src[i] in '-'): i+=1
            if depth==0: break
            continue
        if c=='"':
            i+=1
            while i<n and src[i]!='"':
                if src[i]=='\\': i+=1
                if src[i]=='\n': line+=1
                i+=1
            i+=1
            if depth==0: break
            continue
        if c==';':
            while i<n and src[i]!='\n': i+=1
            continue
        if src.startswith('#|',i):
            d=1; i+=2
            while i<n and d:
                if src.startswith('#|',i): d+=1; i+=2
                elif src.startswith('|#',i): d-=1; i+=2
                else:
                    if src[i]=='\n': line+=1
                    i+=1
            continue
        if c=='(': depth+=1; i+=1; continue
        if c==')':
            depth-=1; i+=1
            if depth==0: break
            continue
        if c=='\n': line+=1
        if c in ' \t\r' and depth==0 and i>start: break
        i+=1
    return i,line,(startline,src[start:i])

i,line=skip_ws(0,1)
while i<n:
    i,line,(sl,txt)=read_form(i,line)
    if txt.strip(): forms.append({"line":sl,"text":txt})
    i,line=skip_ws(i,line)
print(f"{len(forms)} top-level forms", file=sys.stderr)
json.dump(forms,open(os.path.join(SP, "forms.json"), "w"))
# sanity: paren balance of each
bad=[f for f in forms if f["text"].count("(")!=f["text"].count(")")]
print(f"{len(bad)} forms with unbalanced paren counts (strings/chars may explain)", file=sys.stderr)
