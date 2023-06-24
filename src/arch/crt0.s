  .include "mem_map.inc"
  .module crt0
  .area _HEADER (ABS)
;; Reset vector
  .org ROM_START ;; Start from address &0000
  jp init

  .org 0x000a
init:
;; Stack at the top of memory.
  ld sp, #RAM_END
;; Initialise global variables
  call gsinit
  call _start
  jp _exit
  ;; Ordering of segments for the linker.
  .area _HOME
  .area _CODE
  .area _GSINIT
  .area _GSFINAL
  .area _DATA
  .area _BSS
  .area _HEAP
  .area _CODE
__clock::
  ret
_exit::
  ret
  .area _GSINIT
gsinit::  
.area _GSFINAL
  ret
