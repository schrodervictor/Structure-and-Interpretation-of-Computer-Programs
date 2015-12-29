(define (a-plus-abs-b a b)
  ((if (< b 0) - +) a b))

(display (a-plus-abs-b 2 -5))
(newline)
(display (a-plus-abs-b 2 5))
(newline)
