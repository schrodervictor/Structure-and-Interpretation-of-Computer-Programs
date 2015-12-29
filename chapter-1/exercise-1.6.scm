(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y) (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (* guess guess) x)) 0.001))

(define (sqrt x) (sqrt-iter 1.0 x))

(display (sqrt 10))
(newline)

;Actually the code above will cause an infinite loop because the new-if
;is not a special form, but an ordinary function that immediately evaluates
;the else-clause (because of the applicative order of execution).

;The error message for mit-scheme looks like this:
;  ;Aborting!: maximum recursion depth exceeded
