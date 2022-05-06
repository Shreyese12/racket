#lang racket

(define (DeleteChar i v char)
    (if (< i (- (vector-length v) 1))
        (begin
            (vector-set! v i (vector-ref v (+ i 1)))
            (DeleteChar (+ i 1) v char)
        )
        (vector-set! v i #\space)
	)
)

(define (FindChar i v char)
    (if (< i (vector-length v))
        (if (= (char->integer (vector-ref v i)) (char->integer char))
            (begin
                (DeleteChar i v char)
                (FindChar (+ i 1) v char)
            )
            (FindChar (+ i 1) v char)
        )
        (void)
	)
)

(define (CharRep i str v1 v2)
   (if (< i (vector-length v1))
      (if (= (char->integer (vector-ref v1 i)) (char->integer (string-ref str i)))
         (begin
            (FindChar (+ i 1) v1 (vector-ref v1 i))
         )
         (CharRep (+ i 1) str v1 v2)
      )
      (void)
   )
)

(define (CharCont i v str char n)
   (if (< i (vector-length v))
      (if (char=? (string-ref str i) char)
         (begin
            (set! n (+ n 1))
            (CharCont (+ i 1) v str char n)
         )
         (CharCont (+ i 1) v str char n)
      )
      n
   )
)

(define (SettingV2 i v2 str)
   (if (< i (vector-length v2))
      (begin
         (vector-set! v2 i (CharCont 0 v2 str (string-ref str i) 0))
         (SettingV2 (+ i 1) v2 str)
      )
      (void)
   )
)

(define (SetingTex i i2 str v1 v2)
   (if (< i (string-length str))
      (begin
         (vector-set! v1 i (string-ref str i))
         (SetingTex (+ i 1) i2 str v1 v2)
      )
      (if (< i2 (vector-length v1))
         (begin
            (CharRep i2 str v1 v2)
            (SetingTex i (+ i2 1) str v1 v2)
         )
         (void)
      )
   )
)

(define (Main)
	(define str 0)

	(printf "Please enter a text: ")
	(set! str (read))

	(define v1 (make-vector (string-length str)))
	(define v2 (make-vector (string-length str)))

   (SetingTex 0 0 str v1 v2)
   (SettingV2 0 v2 str)

	(printf "Str = ~a\n" str)
	(printf "V1 = ~a\n" v1)
	(printf "V2 = ~a\n" v2)
)

(Main)
