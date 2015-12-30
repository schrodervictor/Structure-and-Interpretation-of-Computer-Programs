(define (factorial n)
  (factorial-iterative 1 1 n))

(define (factorial-iterative product counter max-count)
  (if (> counter max-count)
      product
      (factorial-iterative (* counter product)
                           (+ counter 1)
                           max-count)))

(display (factorial 6))
(newline)
