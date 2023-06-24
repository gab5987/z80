#include "../include/io.h"

extern void wrio_a(void);

void iowrt(int port, int value)
{
  switch(port)
  {
    case PORT_A:
      *(int*)(PORT_A) = value;
      wrio_a();
      break;
    default:break;
  }
}
