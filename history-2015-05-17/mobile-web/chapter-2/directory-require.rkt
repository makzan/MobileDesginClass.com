#lang racket
(define author "Makzan")

(provide (all-defined-out))

(require pollen/tag)
(define headline (make-default-tag-function 'h1))
(define list (make-default-tag-function 'ul))
(define item (make-default-tag-function 'li))
(define sidenote (make-default-tag-function 'aside))
(define (section anchor text) `(h2 [[id, anchor]] (a [[href, (string-append "#" anchor)]], text)))
(define (link url text) `(a [[href, url]], text))

(define (figure url text) `(figure (img [[src, url] [alt, text]]) (figurecaption [], text) ) )

(define steps (make-default-tag-function 'ol))
(define (step . content) `(li,@ content))

(define toclist (make-default-tag-function 'ol))
(define (tocitem url text) `(li  (a [[href, url]], text) ) )

(define (objc . text) `(pre (code [[class, "language-objectivec"]],@ text)))
(define (swift . text) `(pre (code [[class, "language-swift"]],@ text)))
; (define objc (make-default-tag-function 'pre))
; (define swift (make-default-tag-function 'pre))
(define (ioscode code1 code2) `(div (div (a [[data-lang, "objc"]], "Obj-C") (a [[data-lang, "swift"]], "Swift")), code1 , code2) )



(require pollen/decode txexpr)
(register-block-tag 'code)
(define (root . elements)
   (make-txexpr 'root null (decode-elements elements
     #:txexpr-elements-proc detect-paragraphs
     #:string-proc (compose smart-quotes smart-dashes))))