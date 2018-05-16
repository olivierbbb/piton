#! /usr/bin/env racket
#lang racket/base

(require "parser.rkt"
         "typechecker.rkt"
         "call-simplifier.rkt"
         "compiler.rkt"
         "mips-optimiser.rkt"
         "mips-printer.rkt")

(define argv (current-command-line-arguments))
(when (not (equal? (vector-length argv) 1))
  (eprintf "usage: racket piton.rkt <source.py>\n")
  (exit 1))

(define in (open-input-file (vector-ref argv 0)))
(port-count-lines! in)
(define ast (parse in))
(close-input-port in)


(define typechecked-ast (typecheck ast))
(define simplified-ast (simplify-calls typechecked-ast))
(define mips (compile simplified-ast))
(define optimised-mips (optimise-mips mips))
(define out (open-output-file "out.s" #:exists 'replace))
(print-mips optimised-mips out)
(close-output-port out)

(exit 0)
