#!/usr/bin/env python3

from answers import results
from pwn import *

r = remote('111.186.57.85', 30666)

for i in range(1, 51):
    if not i in results:
        break

    # r.recvuntil("Level:", drop=False)
    r.recvrepeat(timeout=0.5)
    r.sendline("%d" % i)
    print("select problem %d" % i)

    r.recvrepeat(timeout=0.2)
    r.sendline(repr(results[i]))
    print("answer problem %d with %s" % (i, repr(results[i])))

r.interactive()
