#!/usr/bin/env python3

import re
import os
import string
import base64
import itertools
from pwn import *

r = remote('111.186.57.85', 30211)

line = r.recvline(keepends=False).decode()

_, key, sha256enc = re.split(r'sha256\(XXXX\+|\) \=\= ', line)
print('gotcha level 0!')

code = ''
strlist = itertools.product(string.ascii_letters + string.digits, repeat=4)

for i in strlist:
    code = i[0] + i[1] + i[2] + i[3]
    encinfo = hashlib.sha256((code + key).encode()).hexdigest()
    if encinfo == sha256enc:
        # print("get", code)
        r.sendline(code)
        break


r.recvuntil(b'Give me XXXX: \n')
print('solved level 0 with %s' % code)
r.recvuntil(b'[0/3]\n')

print('waiting for level 1')
_ = r.recvline(keepends=False)
# print("l1:", _)

_ = r.recvline(keepends=False)
# print("l2", _)

tok = r.recvline(keepends=False)

with open('phase2_elf', 'wb') as f:
    f.write(base64.b64decode(tok))
print('gotcha level 1!')
r.interactive()
