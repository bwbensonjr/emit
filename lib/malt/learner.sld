;;; Malt learner facade. See LICENSE and PROVENANCE.md.
(define-library (malt learner)
  (import
    (scheme base)
    (malt learner tensors)
    (malt learner autodiff)
    (prefix (malt learner operations) m:)
    (malt learner diagnostics)
    (malt learner hyperparameters)
    (malt learner random)
    (malt learner recording)
    (prefix (malt learner training) train:))
  (export
    (rename m:!=-1 !=-1) (rename m:* *) (rename m:*-0-0 *-0-0) (rename m:*-2-1 *-2-1)
    (rename m:*-2-1-primal *-2-1-primal) (rename m:*-primal *-primal) (rename m:+ +)
    (rename m:+-0-0 +-0-0) (rename m:+-primal +-primal) (rename m:- -)
    (rename m:--0-0 --0-0) (rename m:--primal --primal) (rename m:/ /)
    (rename m:/-0-0 /-0-0) (rename m:/-primal /-primal) (rename m:<-0-0 <-0-0)
    (rename m:<-1 <-1) (rename m:<=-0-0 <=-0-0) (rename m:<=-1 <=-1)
    (rename m:=-0-0 =-0-0) (rename m:=-1 =-1) (rename m:>-0-0 >-0-0) (rename m:>-1 >-1)
    (rename m:>=-0-0 >=-0-0) (rename m:>=-1 >=-1) (rename m:abs abs)
    (rename m:abs-0 abs-0) (rename m:abs-primal abs-primal)
    (rename train:accuracy accuracy)
    (rename train:adam-gradient-descent adam-gradient-descent) alpha
    (rename m:argmax argmax) (rename m:argmax-1 argmax-1)
    (rename m:argmax-primal argmax-primal) backprop batch-size beta
    (rename train:block block) (rename train:block-fn block-fn)
    (rename train:block-ls block-ls) build-tensor check-dual-equal?
    check-primal-gradient (rename m:concat concat) (rename m:concat-1-1 concat-1-1)
    (rename m:concat-n concat-n) (rename m:concat-primal concat-primal)
    (rename train:corr corr) (rename m:correlate correlate)
    (rename m:correlate-primal correlate-primal)
    (rename train:cross-entropy-loss cross-entropy-loss) current-random-source
    current-record-handler declare-hyper declare-hypers
    (rename train:dot-product dot-product)
    (rename train:dot-product-2-1 dot-product-2-1) dual dual?
    (rename train:epsilon epsilon) (rename m:exp exp) (rename m:exp-0 exp-0)
    (rename m:exp-primal exp-primal) (rename m:expt expt) (rename m:expt-0-0 expt-0-0)
    (rename m:expt-primal expt-primal) ext1 ext1-primal ext2 ext2-primal
    (rename m:flatten flatten) (rename m:flatten-2 flatten-2)
    (rename m:flatten-primal flatten-primal) gradient
    (rename train:gradient-descent gradient-descent) gradient-of gradient1 grid-search
    init-shape init-theta (rename train:k-recu k-recu) (rename train:k-relu k-relu)
    (rename train:kl-loss kl-loss) (rename train:l2-loss l2-loss) len
    (rename train:line line) (rename train:linear linear)
    (rename train:linear-1-1 linear-1-1) list->tensor tensor->vector (rename m:log log)
    (rename m:log-0 log-0) (rename m:log-primal log-primal) make-printable map*
    (rename m:max max) (rename m:max-1 max-1) (rename m:max-primal max-primal)
    max-tensor-print-length (rename train:model model) mu
    (rename train:naked-gradient-descent naked-gradient-descent)
    (rename train:plane plane) prim1 prim2 primal (rename train:quad quad) random-normal
    random-standard-normal random-tensor rank record (rename m:rectify rectify)
    (rename m:rectify-0 rectify-0) (rename m:rectify-primal rectify-primal)
    (rename train:recu recu) ref refr (rename train:relu relu) reshape
    (rename train:revise revise) revs
    (rename train:rms-gradient-descent rms-gradient-descent)
    (rename train:samples samples) (rename train:sampling-obj sampling-obj) scalar?
    shape (rename train:signal-avg signal-avg) (rename train:smooth smooth)
    (rename train:softmax softmax) (rename m:sqr sqr) (rename m:sqr-primal sqr-primal)
    (rename m:sqrt sqrt) (rename m:sqrt-0 sqrt-0) (rename m:sqrt-primal sqrt-primal)
    (rename train:stack-blocks stack-blocks) (rename m:sum sum) (rename m:sum-1 sum-1)
    (rename m:sum-cols sum-cols) (rename m:sum-cols-primal sum-cols-primal)
    (rename m:sum-primal sum-primal) tensor tensor? tlen tmap tolerance trace-print tref
    trefs (rename train:velocity-gradient-descent velocity-gradient-descent) with-hyper
    with-hypers with-recording zero-tensor (rename train:zeroes zeroes)
    (rename m:zeroes-primal zeroes-primal)
    ;; Preserve canonical declaration order when adding alternate spellings.
    (rename lambda λ) (rename primal ρ) (rename backprop κ) (rename gradient ∇)
    (rename gradient1 ∇¹) (rename check-primal-gradient check-ρ-∇)
    (rename ext1-primal ext1-ρ) (rename ext2-primal ext2-ρ) (rename m:+-primal +-ρ)
    (rename m:--primal --ρ) (rename m:*-primal *-ρ) (rename m:/-primal /-ρ)
    (rename m:exp-primal exp-ρ) (rename m:log-primal log-ρ)
    (rename m:expt-primal expt-ρ) (rename m:sqrt-primal sqrt-ρ)
    (rename m:sqr-primal sqr-ρ) (rename m:zeroes-primal zeroes-ρ)
    (rename m:sum-primal sum-ρ) (rename m:abs-primal abs-ρ)
    (rename m:*-2-1-primal *-2-1-ρ) (rename m:argmax-primal argmax-ρ)
    (rename m:max-primal max-ρ) (rename m:sum-cols-primal sum-cols-ρ)
    (rename m:correlate-primal correlate-ρ) (rename m:rectify-primal rectify-ρ)
    (rename m:flatten-primal flatten-ρ) (rename m:concat-primal concat-ρ)))
