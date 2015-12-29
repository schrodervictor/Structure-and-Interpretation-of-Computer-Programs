(define (sqrt x)

  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))

  (define (improve guess)
    (average guess (/ x guess)))

  (define (average y) (/ (+ x y) 2))

  (define (good-enough? guess)
    (< (abs (- (* guess guess) x)) 0.001))

 (sqrt-iter 1.0))

(display (sqrt 10))
(newline)
