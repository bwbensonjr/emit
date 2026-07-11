; CC spike experiments -- plain untagged i64 (tagging is orthogonal to the
; calling-convention question).  The loop bodies carry `noinline optnone` (#0)
; so the recursive calls are actually emitted (no closed-form folding) while
; `musttail` is still honored -- this measures real per-call CC overhead.
;
; The loop computes acc = number of iterations (acc += 1 each step), so a run of
; N returns N and confirms correctness; completing at N = 100e6 confirms the
; tail calls are guaranteed (bounded stack) under each candidate's prototype.

; ---- Candidate 0: fixed max-arity (K = 2), today's convention. a0 = n, a1 = acc.
define tailcc i64 @loop0(i64 %self, i64 %n, i64 %acc) #0 {
entry:
  %z = icmp eq i64 %n, 0
  br i1 %z, label %done, label %rec
done:
  ret i64 %acc
rec:
  %n1 = sub i64 %n, 1
  %a1 = add i64 %acc, 1
  %r = musttail call tailcc i64 @loop0(i64 0, i64 %n1, i64 %a1)
  ret i64 %r
}
define i64 @run0(i64 %n) {
  %r = call tailcc i64 @loop0(i64 0, i64 %n, i64 0)
  ret i64 %r
}

; ---- Candidate 2: argc + overflow spill.  Uniform prototype adds %argc and a
; %ov pointer (args beyond K), threaded through EVERY call but unused on the hot
; path.  This is the measured question: does threading 2 extra i64 args cost?
define tailcc i64 @loop2(i64 %self, i64 %argc, i64 %n, i64 %acc, ptr %ov) #0 {
entry:
  %z = icmp eq i64 %n, 0
  br i1 %z, label %done, label %rec
done:
  ret i64 %acc
rec:
  %n1 = sub i64 %n, 1
  %a1 = add i64 %acc, 1
  %r = musttail call tailcc i64 @loop2(i64 0, i64 2, i64 %n1, i64 %a1, ptr null)
  ret i64 %r
}
define i64 @run2(i64 %n) {
  %r = call tailcc i64 @loop2(i64 0, i64 2, i64 %n, i64 0, ptr null)
  ret i64 %r
}

; ---- Candidate 3: single arg-vector.  Each call allocates a 2-slot {n,acc}
; vector via spike_alloc and passes the pointer.  Measures alloc-per-call cost.
declare ptr @spike_alloc(i64)
define tailcc i64 @loop3(i64 %self, i64 %argc, ptr %args) #0 {
entry:
  %n = load i64, ptr %args
  %z = icmp eq i64 %n, 0
  br i1 %z, label %done, label %rec
done:
  %ap = getelementptr i64, ptr %args, i64 1
  %acc = load i64, ptr %ap
  ret i64 %acc
rec:
  %ap2 = getelementptr i64, ptr %args, i64 1
  %acc0 = load i64, ptr %ap2
  %n1 = sub i64 %n, 1
  %a1 = add i64 %acc0, 1
  %v = call ptr @spike_alloc(i64 2)
  store i64 %n1, ptr %v
  %s1 = getelementptr i64, ptr %v, i64 1
  store i64 %a1, ptr %s1
  %r = musttail call tailcc i64 @loop3(i64 0, i64 2, ptr %v)
  ret i64 %r
}
define i64 @run3(i64 %n) {
  %v = call ptr @spike_alloc(i64 2)
  store i64 %n, ptr %v
  %s1 = getelementptr i64, ptr %v, i64 1
  store i64 0, ptr %s1
  %r = call tailcc i64 @loop3(i64 0, i64 2, ptr %v)
  ret i64 %r
}

; ---- Candidate 2 feasibility: variadic + apply.
; sumv sums argc real args: positional a0,a1 (first min(argc,2)) plus (argc-2)
; overflow args from %ov[0..].  A null/short overflow with large argc is illegal;
; the driver supplies a matching overflow.  Proves rest-collection AND unbounded
; apply (the overflow list can be any length) under the uniform prototype.
define i64 @sumv(i64 %argc, i64 %a0, i64 %a1, ptr %ov) {
entry:
  %ge1 = icmp sge i64 %argc, 1
  %p0  = select i1 %ge1, i64 %a0, i64 0
  %ge2 = icmp sge i64 %argc, 2
  %p1  = select i1 %ge2, i64 %a1, i64 0
  %accp = add i64 %p0, %p1
  %ovn0 = sub i64 %argc, 2
  %ovpos = icmp sgt i64 %ovn0, 0
  %ovn = select i1 %ovpos, i64 %ovn0, i64 0
  br label %loop
loop:
  %i = phi i64 [ 0, %entry ], [ %i1, %body ]
  %acc = phi i64 [ %accp, %entry ], [ %acc2, %body ]
  %more = icmp slt i64 %i, %ovn
  br i1 %more, label %body, label %end
body:
  %ep = getelementptr i64, ptr %ov, i64 %i
  %ev = load i64, ptr %ep
  %acc2 = add i64 %acc, %ev
  %i1 = add i64 %i, 1
  br label %loop
end:
  ret i64 %acc
}

attributes #0 = { noinline optnone }
