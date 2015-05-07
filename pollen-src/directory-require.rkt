#lang racket
(define author "Makzan")

(provide (all-defined-out))

(require pollen/decode txexpr)
(define (root . elements)
   (make-txexpr 'root null (decode-elements elements
     #:txexpr-elements-proc detect-paragraphs
     #:string-proc (compose smart-quotes smart-dashes))))

(require pollen/tag)
(define (link url text) `(a [[href ,url]] ,text))
(define (figure url text) `(img [[src, url] [alt, text]]))
