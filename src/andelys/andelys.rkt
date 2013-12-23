#lang racket
(require racket/gui/base)

(define (menu-file-exit-click item control)
  (exit 0))

(define (menu-navigate-go-click item control)
  (message-box "Navigate" (send address-text get-value)))
  
(define (menu-help-about-click item control)
  (message-box 
   "About Andelys" 
   "Andelys 0.1.\nCopyright © 2013 Duncan Bayne.\nAndelys is Free Software, released under the GNU LGPL 2.1."))
    
(define frame 
  (new frame% [label "Andelys"] [height 480] [width 640]))
(define menu 
  (new menu-bar% [parent frame]))

(define menu-file 
  (new menu% [parent menu] [label "&File"]))
(define menu-file-exit 
  (new menu-item% [parent menu-file] [label "E&xit"] [callback menu-file-exit-click]))

(define menu-navigate
  (new menu% [parent menu] [label "&Navigate"]))
(define navigate-menu-go
  (new menu-item% [parent menu-navigate] [label "&Go"] [callback menu-navigate-go-click]))

(define menu-help
  (new menu% [parent menu] [label "&Help"]))
(define menu-help-about
  (new menu-item% [parent menu-help] [label "&About"] [callback menu-help-about-click]))

(define (address-changed item control)
  (message-box "address" item))

(define address-text
  (new text-field% [parent frame] [label "Address:"] [init-value "http://"]))

(send frame show #t)