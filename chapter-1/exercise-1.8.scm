(define (cbrt x)
  (define (cbrt-iter guess last-guess)
    (if (good-enough? guess last-guess)
        guess
        (cbrt-iter (improve guess) guess)))

  (define (improve guess)
    (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

  (define (good-enough? guess last-guess)
    (< (abs (/ (- guess last-guess) last-guess)) 0.001))

  (cbrt-iter 1.0 0.9))

(display (cbrt 8000))
(newline)

(display (cbrt 0.000008))
(newline)

(display (cbrt 300000000000000000000))
(newline)
