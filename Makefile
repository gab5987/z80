ARCH := z80
CODE_LOCATION := 0x0000
DATA_LOCATION := 0x0100

CC := sdcc
AS := sdas$(ARCH)

SRC_DIR := src
BUILD_DIR := build

C_SRC := $(wildcard $(SRC_DIR)/*.c)
S_SRC := $(wildcard $(SRC_DIR)/*.s)

C_OBJECTS := $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.c.rel,$(C_SRC))
ASM_OBJECTS := $(patsubst $(SRC_DIR)/%.s,$(BUILD_DIR)/%.rel,$(S_SRC))

S_FLAGS := -xlos -g

C_FLAGS := 	-c --std-c11 -mz80 --debug \
						--nostdinc --no-std-crt0 --nostdinc --nostdlib

L_FLAGS := -mz80 -Wl -y --code-loc $(CODE_LOCATION) --data-loc $(DATA_LOCATION) \
						--std-c11 -mz80 --debug \
						--no-std-crt0 --nostdinc --nostdlib \
						$(C_OBJECTS) $(ASM_OBJECTS)

all: $(C_OBJECTS) $(ASM_OBJECTS)
	@echo $(C_SRC)
	@echo $(C_OBJECTS)
	$(CC) -o $(BUILD_DIR)/main.ihx $(L_FLAGS)
	sdobjcopy -I ihex -O binary $(BUILD_DIR)/main.ihx os.bin

$(C_OBJECTS):
	for file in $(C_SRC); do \
		echo basename $$file; \
		$(CC) -o $(BUILD_DIR)/$$(basename $$file).rel $(C_FLAGS) $$file; \
	done

$(ASM_OBJECTS):
	for file in $(S_SRC); do \
		cp $$file $(BUILD_DIR)/$$(basename $$file); \
		$(AS) $(S_FLAGS) $(BUILD_DIR)/$$(basename $$file); \
	done
	
crt0.rel:
	cp $(SRC_DIR)/kernel/arch/$(ARCH)/crt0.s $(BUILD_DIR)/crt0.s
	$(AS) $(S_FLAGS) $(BUILD_DIR)/crt0.s

