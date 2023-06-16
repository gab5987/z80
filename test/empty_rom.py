
teste = [
    0x00, 0x00, 0x00,
    0xc3, 0x00, 0x00
]

rom = bytearray(teste + [0x00] * (2047-len(teste))) # 16KB

with open ("rom.bin", "wb") as f:
    f.write(rom)
