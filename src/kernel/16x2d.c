#include "../include/16x2d.h"
#include "../include/io.h"

void init_display(void)
{ 
  iowrt(PORT_R, 0x00);
  iowrt(PORT_A, 0x80);
}
