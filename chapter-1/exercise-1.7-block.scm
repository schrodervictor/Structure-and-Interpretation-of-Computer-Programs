(define (sqrt x)
  (define (sqrt-iter guess last-guess)
    (if (good-enough? guess last-guess)
        guess
        (sqrt-iter (improve guess) guess)))

  (define (improve guess)
    (average guess (/ x guess)))

  (define (average a b) (/ (+ a b) 2))

  (define (good-enough? guess last-guess)
    (< (abs (/ (- guess last-guess) last-guess)) 0.001))

  (sqrt-iter 1.0 0.9))

(display (sqrt 0.000004))
(newline)

;Yields 2.0000003065983023e-3 as the result, which is very much better than
;the .03129261341049664 given by the previous implementation

(display (sqrt 300000000000000000000))
(newline)

;Yields 17320512514.851337 as the result. May not be a fantastic approximation
;but at least it converges (and fast!) to an answer and is inside the
;requested precision range for this huge number
