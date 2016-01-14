(define available-coins (list 50 25 10 5 1))

(define (count-change amount coins)
  (define hard-limits (map (lambda (coin) (/ amount coin)) coins))
  (count-linear-combinations 0 amount coins hard-limits (list 0 0 0 0 0)))

(define (count-linear-combinations counter total coefic limits last-combination)
  (define linear-combination (get-next-combination last-combination limits))
  (cond ((list-all-zeros? linear-combination)
          counter)
        ((= total (totalize-combination 0 linear-combination coefic))
          (count-linear-combinations (+ counter 1) total coefic limits linear-combination))
        (else
          (count-linear-combinations counter total coefic limits linear-combination))))

(define (totalize-combination acc combination coefic)
  (cond ((and (null? combination) (null? coefic)) acc)
        (else (totalize-combination (+ acc (* (car combination) (car coefic))) (cdr combination) (cdr coefic)))))

(define (get-next-combination last-combination limits)
  (cond ((null? last-combination) (list))
        ((= (car last-combination) (car limits))
          (cons 0 (get-next-combination (cdr last-combination) (cdr limits))))
        (else (cons (+ (car last-combination) 1) (cdr last-combination)))))

(define (list-all-zeros? the-list)
  (cond ((null? the-list) #t)
        ((= (car the-list) 0) (list-all-zeros? (cdr the-list)))
        (else #f)))

(display (count-change 150 available-coins))
(newline)

