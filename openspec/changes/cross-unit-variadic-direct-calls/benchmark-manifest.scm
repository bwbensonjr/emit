((library (emit internal)
   (source "../../../lib/emit/internal.sld"))
 (library (scheme base)
   (source "../../../lib/scheme/base.sld"))
 (program p9-number-to-string
   (source "number-to-string-benchmark.scm")))
