#lang racket

(define (FindSpace i str flag)
  (if (< i (string-length str))
      (if (char=? (string-ref str i) #\ )
          (set! flag 0)
          (FindSpace (+ i 1) str 1)
      )
      flag
      )
)

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

  (printf "Please enter a palindrome word")
  (set! input (read-line))
 
  (if (= (FindSpace 0 input 1) 0)
      (begin
        (print "We need a word\n")
        (newline)
        (Main)
      )
      (display (Palindrome 0 (- (string-length input) 1) input 1))
      
))

(Main)