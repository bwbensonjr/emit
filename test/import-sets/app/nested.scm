;;; nested.scm -- a top-level include whose file includes again from INSIDE a body: the
;;; inner filename resolves beside sub/a.scm, not beside this file. => 7
(include "sub/a.scm")
(fa)
