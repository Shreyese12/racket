#lang racket

(define (Palindrome i counter str flag)
    (if (< i (string-length str))
        (if (char=? (string-ref str i) (string-ref str counter))
            (Palindrome (+ i 1) (- counter 1) str 1)
            (set! flag 0)
        )
        (void)
    )
    flag
)
  
(define (Main)
    (define input 0)

    (printf "Please enter a palindrome word: ")
    (set! input (read-line))
 
    (if (= (Palindrome 0 (- (string-length input) 1) input 1) 1)
        (printf "That word is Palindrome.\n")
        (printf "That word isn't Palindrome.\n")
    )
)

(Main)
