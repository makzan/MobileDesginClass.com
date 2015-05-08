#lang racket
(define author "Makzan")

(provide (all-defined-out))

(require pollen/decode txexpr)
(define (root . elements)
   (make-txexpr 'root null (decode-elements elements
     #:txexpr-elements-proc detect-paragraphs
     #:string-proc (compose smart-quotes smart-dashes))))

(require pollen/tag)
(define headline (make-default-tag-function 'h1))
(define list (make-default-tag-function 'ul))
(define item (make-default-tag-function 'li))
(define (section anchor text) `(h2 [[id, anchor]], text))
(define (link url text) `(a [[href, url]], text))
(define (figure url text) `(figure (img [[src, url] [alt, text]]) (figurecaption [], text) ) )
