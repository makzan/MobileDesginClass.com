#lang racket
(define author "Makzan")

(require pollen/decode txexpr)
(define (root . elements)
   (make-txexpr 'root null (decode-elements elements
     #:txexpr-elements-proc detect-paragraphs
     #:string-proc (compose smart-quotes smart-dashes))))
(provide author root)