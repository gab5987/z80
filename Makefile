CC = vasmz80_oldstyle
C_FLAGS := -dotdir

FILES := main.s \
	kernel/display/display.s 

OBJECTS := $(FILES:.s=.o)

all: firm.bin

firm.bin: $(OBJECTS)
	ld -o $@ $^

%.o: %.s
	$(CC) $(C_FLAGS) $< -o $@

clean:
	rm -f *.bin *.o
