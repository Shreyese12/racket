#lang racket

(define (Main)
    (define list1 (list 1 2 3 4))    
    (printf "~a\n" list1)
    (printf "car: ~a \n" (car list1))
    (printf "cdr: ~a \n" (cdr list1))
)

(Main)
