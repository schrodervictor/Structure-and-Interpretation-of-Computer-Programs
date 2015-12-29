(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y) (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (* guess guess) x)) 0.001))

(define (sqrt x) (sqrt-iter 1.0 x))

(display (sqrt 0.000004))
(newline)

;This will show .03129261341049664 as answer, which is a terrible
;approximation for the real answer (0.002)

(display (sqrt 300000000000000000000))
(newline)

;For a number like this, the test seems to never succeed, due to precision
;limitations.
