; --------------------------------------------------

; --------------------------------------------------
; Global scoped constants

; ROM0 = 0x0000 - 0x03FF
; ROM1 = 0x0400 - 0x07FF
; RAM  = 0x0800 - 0x0BFF

;_rom_sec_base = 0b000010000000000 ; 0x0400 => ROM2 chip address
;_io_base = 0b100000000000000      ; 0x4000 => I/O chip address
PORT_A = 0x00
PORT_B = 0x01
PORT_C = 0x02
PORT_R = 0x03

DISPLAY_RS = 0b10000000
DISPLAY_E  = 0b01000000
; Continous run



_main:
  ; setup
  ld A, 0x80
  out (PORT_R), A
  ld A, 0x01
_looping:
  ld A, 0x01
  out (PORT_A), A
  ld A, 0x00
  out (PORT_A), A
  jp _looping

  ld A, 0x00
  out (PORT_C), A
  ld A, 0b00111000
  out (PORT_A), A
  ld A, DISPLAY_E
  out (PORT_C), A

  ld A, 0x00
  out (PORT_C), A
  ld A, 0b00001110
  out (PORT_A), A
  ld A, DISPLAY_E
  out (PORT_C), A

  ld A, 0x00
  out (PORT_C), A
  ld A, 0b00000001
  out (PORT_A), A
  ld A, DISPLAY_E
  out (PORT_C), A

  ld A, 0x00
  out (PORT_C), A
  ld A, 0b00000110
  out (PORT_A), A
  ld A, DISPLAY_E
  out (PORT_C), A

  ld HL, string

  ld HL, mem_addr
  ld A, 0x64
  ld (HL), A

;  ld HL, string

loop:
  ld A, 0x00
  out (PORT_C), A

  ld A, (HL)
  or A
  jp Z, _halt_system
  out (PORT_A), A

  ld A, 0b11000000
  out (PORT_C), A
  inc HL
  halt
  jp loop

string:
  db "> Settings", 0x00

_halt_system: 
  jp _halt_system

mem_addr:
  dw 0x0800

