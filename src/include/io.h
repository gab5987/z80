#ifndef IO_H
#define IO_H

#define PORT_A 0x0000
#define PORT_B 0x0001
#define PORT_C 0x0002
#define PORT_R 0x0003

void iowrt(int port, int value);
int iord(int port);

#endif // !IO_H

