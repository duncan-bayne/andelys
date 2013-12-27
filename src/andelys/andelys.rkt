#lang racket
(require net/url
         racket/gui/base
         racket/sandbox)

(define (menu-file-exit-click item control)
  (exit 0))

(define (get-page url)
  (port->string
   (get-pure-port (string->url url))))

(define (navigate)
  (send contents-text set-value "loading ...")
  (send contents-text set-value (get-page (send address-text get-value))))

(define (address-text-changed field event)
    (cond [(eq? (send event get-event-type) 'text-field-enter) (navigate)]))

(define (menu-navigate-go-click item control)
  (navigate))

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
  (new text-field% [parent frame] [label "Address:"] [init-value "http://andelys.org"] [callback address-text-changed]))

(define contents-text
  (new text-field% [parent frame] [label ""] [init-value ""] [style '(multiple)]))

(send frame show #t)