#!/usr/bin/env python3

f = open('./bin/mdx', 'rb')

file_bin = bytearray(f.read())

xor_table = file_bin[0x2660:]


for i in range(0, 0x225):
    file_bin[0x9a3 + i] = xor_table[i] ^ 0xaa

with open('modified', 'wb') as f:
    f.write(file_bin)
