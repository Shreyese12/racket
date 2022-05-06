#lang racket

(define (EncryptLowercase i seed str)
    (if (< i (string-length str))
        (if (and (>= (char->integer (string-ref str i)) 97) (<= (char->integer (string-ref str i)) 122) (>= (- (char->integer (string-ref str i)) seed) 97))
            (begin
                (string-set! str i (integer->char (- (char->integer (string-ref str i)) seed)))
                (EncryptLowercase (+ i 1) seed str)
            )
            (if (and (>= (char->integer (string-ref str i)) 97) (<= (char->integer (string-ref str i)) 122))
                (begin
                    (string-set! str i (integer->char (- (+ (char->integer (string-ref str i)) 26) seed)))
                    (EncryptLowercase (+ i 1) seed str)
                )
                (void)
            )
        )
        (void)
    )
)

(define (EncryptUppercase i seed str)
    (if (< i (string-length str))
        (if (and (>= (char->integer (string-ref str i)) 65) (<= (char->integer (string-ref str i)) 90) (>= (- (char->integer (string-ref str i)) seed) 65))
            (begin
                (string-set! str i (integer->char (- (char->integer (string-ref str i)) seed)))
                (EncryptUppercase (+ i 1) seed str)
            )
            (if (and (>= (char->integer (string-ref str i)) 65) (<= (char->integer (string-ref str i)) 90))
                (begin
                    (string-set! str i (integer->char (- (+ (char->integer (string-ref str i)) 26) seed)))
                    (EncryptUppercase (+ i 1) seed str)
                )
                (begin
                    (EncryptLowercase i seed str)
                    (EncryptUppercase (+ i 1) seed str)
                )
            )
        )
        (void)
    )
)

(define (Main)
    (define str 0)
    (define seed 0)

    (printf "Please enter a string to decrypt: ")
    (set! str (read-line))

    (printf "Please enter a seed to decrypt: ") 
    (set! seed (read))

    (EncryptUppercase 0 seed str)
    (printf "This is the decrypt string: ~a\n" str)
)

(Main)
