rom = bytearray([0x00] * 16384) # 16KB

with open ("rom.bin", "wb") as f:
    f.write(rom)
