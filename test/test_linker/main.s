  .include "bank.i"

  .bank 0 slot 0
  .orga 0x0000
  .include "test.s"
_start:
  jp _external_nop
  halt
