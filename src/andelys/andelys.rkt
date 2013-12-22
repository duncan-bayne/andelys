#lang racket
(require racket/gui/base)

(define (menu-file-exit-click item control)
  (exit 0))

(define (menu-help-about-click item control)
  (define (close-button-click item control) (send about-dialog show #f))
  (define about-dialog   
    (new dialog% [label "About Andelys"]))
  (define about-text     
    (new message% [parent about-dialog] [label "Andelys 0.1."]))
  (define copyright-text 
    (new message% [parent about-dialog] [label "Copyright © 2013 Duncan Bayne."]))
  (define licence-text   
    (new message% 
         [parent about-dialog] 
         [label "Andelys is Free Software, released under the GNU LGPL 2.1."]))
  (define close-button   
    (new button% [label "&Ok"] [parent about-dialog] [callback close-button-click]))
  (send about-dialog show #t))
    
(define frame 
  (new frame% [label "Andelys"] [height 480] [width 640]))
(define menu 
  (new menu-bar% [parent frame]))

(define menu-file 
  (new menu% [parent menu] [label "&File"]))
(define menu-file-exit 
  (new menu-item% [parent menu-file] [label "E&xit"] [callback menu-file-exit-click]))

(define menu-help
  (new menu% [parent menu] [label "&Help"]))
(define menu-help-about
  (new menu-item% [parent menu-help] [label "&About"] [callback menu-help-about-click]))

(send frame show #t)

