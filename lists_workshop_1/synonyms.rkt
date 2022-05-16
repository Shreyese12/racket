#lang racket

(define (ListLength i l)
    (if (null? l)
        i
        (ListLength (+ i 1) (cdr l))
    )
)

(define (ShowSynonyms i len dictionary word)
    (if (< i len)
        (if (string-ci=? word (car (car dictionary)))
            (printf "Some synonyms of that word are: \n-~a\n-~a\n-~a\n" (car (cdr (car dictionary))) (car (cdr (cdr (car dictionary)))) (car (cdr (cdr (cdr (car dictionary))))))
            (ShowSynonyms (+ i 1) len (cdr dictionary) word)
        )
        (if (= i len)
            (printf "For now we do not have that word in the dictionary\n")
            (void)
        )
    )
)

(define (Main)
    (define word 0)
    (define dictionary
        (list
            (list "abundante" "mucho" "númeroso" "incontable")
            (list "acabar" "terminar" "concluir" "finalizar")
            (list "advertir" "notar" "percibir" "notificar")
            (list "alterado" "irritado" "trastornado" "tergiversado")
            (list "altura" "superior" "excelente" "nivel")
            (list "angustia" "dolor" "aflicción" "zozobra")
        )
    )

    (printf "Please ente a word (Use double quotation marks): ")
    (set! word (read))

    (if (string? word)
        (ShowSynonyms 0 (ListLength 0 dictionary) dictionary word)
        (begin
            (printf "Invalid Word.\n")
            (newline)
            (Main)
        )
    )
)

(Main)