(define (inc x) (+ x 1))
(define (dec x) (- x 1))

(define (sum1 a b)
  (if (= a 0)
      b
      (inc (sum1 (dec a) b))))

(display (sum1 4 3))
(newline)

;The generated process evolves as follows:
;(sum1 4 3)
;(inc (sum1 (dec 4) 3))
;(inc (sum1 3 3))
;(inc (inc (sum1 (dec 3) 3)))
;(inc (inc (sum1 2 3)))
;(inc (inc (inc (sum1 (dec 2) 3))))
;(inc (inc (inc (sum1 1 3))))
;(inc (inc (inc (inc (sum1 (dec 1) 3)))))
;(inc (inc (inc (inc (sum1 0 3)))))
;(inc (inc (inc (inc 3))))
;(inc (inc (inc 4)))
;(inc (inc 5))
;(inc 6)
;7
;So it's a recursive process

(define (sum2 a b)
  (if (= a 0)
      b
      (sum2 (dec a) (inc b))))

(display (sum2 4 3))
(newline)

;The generated process evolves as follows:
;(sum2 3 4)
;(sum2 (dec 3) (inc 4))
;(sum2 2 5)
;(sum2 (dec 2) (inc 5))
;(sum2 1 6)
;(sum2 (dec 1) (inc 6))
;(sum2 0 7)
;7
;So it's a iterative process
