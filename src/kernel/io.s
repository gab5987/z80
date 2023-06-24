  .include "../arch/mem_map.inc"
  .globl wrio_a
wrio_a:
  ld A, (PORT_A_BFF)
  out (PORT_A), A

