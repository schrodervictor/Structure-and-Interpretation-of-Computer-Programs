(define (pascal-row n)
  (if (= n 0) (list 1)
      (pascal-sum (pascal-row (- n 1)))))

(define (pascal-sum pascal-list)
  (define pascal-list-1 (cons 0 pascal-list))
  (sum-parallel pascal-list pascal-list-1 (list)))

(define (sum-parallel list-1 list-2 new-list)
  (cond ((and (null? list-1) (null? list-2)) new-list)
        ((null? list-1) (sum-parallel list-1 (cdr list-2) (cons (car list-2) new-list)))
        ((null? list-2) (sum-parallel (cdr list-1) list-2 (cons (car list-1) new-list)))
        (else (sum-parallel (cdr list-1) (cdr list-2) (cons (+ (car list-1) (car list-2)) new-list)))))

(display (pascal-row 40))
(newline)
