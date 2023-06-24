CC := sdcc
CC_FLAGS := -–mz80 -–nostdinc -–nostdlib -–no-std-crt0
OUT := main.ihx

all: $(OUT)

$(OUT): main.c
	$(CC) $(CC_FLAGS) $<

