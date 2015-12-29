(define (square-of-two-largest a b c)
  (cond ((and (< a b) (< a c))
          (+ (* b b) (* c c)))
        ((and (< b a) (< b c))
          (+ (* a a) (* c c)))
        (else
          (+ (* a a) (* b b)))))
(display (square-of-two-largest 3 2 4))
(newline)
