
CC = vasmz80_oldstyle
C_FLAGS = -Fbin -dotdir

all: firm.bin

firm.bin: seg000.asm
	$(CC) $(C_FLAGS) -o $@ $<
