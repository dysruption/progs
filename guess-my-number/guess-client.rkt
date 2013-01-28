#lang class/1
(require class/universe)
(require 2htdp/image)

(define-class guess-world%
  (fields status)
  
  (define (on-receive m)
    (new guess-world% m))
 
  
  (define (to-draw)
    (overlay (text (this . status)
                   40
                   "red")
             (empty-scene 300 100)))
  
  (define (on-key k)
    (local [(define n (string->number k))]
      (if true #;(number? n)
          (make-package this n)
          this)))
  
  (define (on-disconnect)
    (new guess-world% "I'm done"))
  
  (define (register) LOCALHOST))

(launch-many-worlds
 (big-bang (new guess-world% "i'm the picker"))
 (big-bang (new guess-world% "guess a number")))