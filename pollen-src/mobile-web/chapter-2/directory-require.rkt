#lang racket
(define author "Makzan")

(provide (all-defined-out))

(require pollen/tag)
(define headline (make-default-tag-function 'h1))
(define list (make-default-tag-function 'ul))
(define item (make-default-tag-function 'li))
(define sidenote (make-default-tag-function 'aside))

(define (section [anchor '()] [text '()])
  (if (empty? text)
    `(h2 [[id, (string-downcase (string-replace anchor " " "-"))]] (a [[href, (string-append "#" (string-downcase (string-replace anchor " " "-")))]], anchor))
    `(h2 [[id, anchor]] (a [[href, (string-append "#" anchor)]], text))
  )
)

(define (term text1 . content) `(li (strong, text1) " " ,@ content) )

(define (btw . content) `(div (h2 [[id, "by-the-way"]] (a [[href, "#by-the-way"]] "By the way")),@ content ))

(define (link url text) `(a [[href, url]], text))

(define (figure url text) `(figure (img [[src, url] [alt, text]]) (figcaption [], text) ) )

(define (compare figure1 figure2) `(div [[class, "block-grid-2"]], figure1, figure2))

(define (iframe url) `(iframe [[seamless, "seamless"] [src, url]]))

(define (time-for-action text) `(h2 [[id, "time-for-action"]] (a [[href, "#time-for-action"]] (string-append "Time for Action—", text))))


(define steps (make-default-tag-function 'ol))
(define (step . content) `(li,@ content))

(define toclist (make-default-tag-function 'ol))
(define (tocitem url text) `(li  (a [[href, url]], text) ) )

(define (objc . text) `(pre (code [[class, "language-objectivec"]],@ text)))
(define (swift . text) `(pre (code [[class, "language-swift"]],@ text)))
(define (markup . text) `(pre (code [[class, "language-markup"]],@ text)))
(define (css . text) `(pre (code [[class, "language-css"]],@ text)))

(define (ioscode code1 code2) `(div (div (a [[data-lang, "objc"]], "Obj-C") (a [[data-lang, "swift"]], "Swift")), code1 , code2) )



(require pollen/decode txexpr)

(define (root . items)
  (decode (make-txexpr 'root '() items)
    #:txexpr-elements-proc detect-paragraphs
    #:exclude-tags '(style script pre code)))