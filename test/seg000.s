; --------------------------------------------------

; --------------------------------------------------
; Global scoped constants

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

reset_b:
  ld B, 0

loop:
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


  ld A, 0x00
  out (PORT_C), A
  ld A, "0"
  add A, B
  out (PORT_A), A
  ld A, 0b11000000
  out (PORT_C), A
  
  ld A, 0x00
  out (PORT_C), A

  inc B
  ld A, B
  cp 0x0A
  jp Z, reset_b
  jp loop

