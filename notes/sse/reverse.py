#!/usr/bin/env python3

from pwn import *
from pwnlib.gdb import *
from pwnlib.util.packing import u64, p64, u32, p32


def byte_xor(ba1, ba2):
    return bytes([_a ^ _b for _a, _b in zip(ba1, ba2)])


keybox_1 = b"\xef\x5d\x33\x73\xb4\x4d\x04\x58\xef\x5d\x33\x73\xb4\x4d\x14\x58"
keybox_2 = b"\x00\x00\x00\x00\x00\x00\x08\x40\x00\x00\x00\x00\x00\x00\x10\x40"
keybox_3 = b"\xaa\xb1\xc2\xa2\x81\x48\x85\x77\xa4\x5e\xcb\xec\x9c\x51\x93\x77"
keybox_4 = b"\x6f\x5e\x35\x36\x3e\x1e\x5f\x6a\x6d\x6f\x5d\x01\x14\x30\x66\x0a"

flags = b'0ops{Ah_Y0u_KnOw' + b'_1EEE_754_(^_^)}'

assert(len(flags) == 32)

mul_1 = int.from_bytes(flags[:8] + flags[:8],
                       byteorder='little') * int.from_bytes(keybox_1, byteorder='little')
mul_2 = int.from_bytes(flags[8:16] + flags[8:16],
                       byteorder='little') * int.from_bytes(keybox_2, byteorder='little')

buf = (mul_1 + mul_2) ^ int.from_bytes(keybox_3, byteorder='little')

print(buf)

if buf % 2**128 != 0 or flags[0] != 48 or flags[8] != 89:
    print("Fail~ sum mismatch")
    exit(-1)

xorr = int.from_bytes(
    flags[:16], byteorder='little') ^ int.from_bytes(flags[16:32], byteorder='little')

if xorr != int.from_bytes(keybox_4, byteorder='little'):
    print("Fail~ xor mismatch")
    exit(-2)

print("Right!")
print("I'm pretty sure it's the right flag: \n%s" % flags)
exit(0)
