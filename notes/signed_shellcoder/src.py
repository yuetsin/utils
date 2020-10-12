#!/usr/bin/env python3

import binascii
import hashlib
import pathlib
import secrets
import signal
import sys
from ctypes import CDLL, CFUNCTYPE, c_int, c_int64, c_uint64, c_void_p

from pwnlib.asm import asm, disasm
from pwnlib.constants import (MAP_ANONYMOUS, MAP_PRIVATE,  # pylint: disable=no-name-in-module
                              PROT_EXEC, PROT_READ, PROT_WRITE)
from pwnlib.context import context
from pwnlib.util.packing import u64

DEFINITE = True

SOURCE = pathlib.Path(__file__).read_text(encoding='utf-8')

if DEFINITE:
    SECRET_KEY = secrets.token_bytes(49)  # pylint: disable=W1638
else:
    SECRET_KEY = secrets.token_bytes(secrets.choice(
        range(32, 64)))  # pylint: disable=W1638
BKEY = secrets.choice(range(16))  # pylint: disable=range-builtin-not-iterating
GLOBAL_ALARM_TIME = 120
SHELLCODE_ALARM_TIME = 1
ALLOWED_REGS = {'rax', 'rbx', 'rcx', 'rdx', 'rsi', 'rdi', 'r8',
                'r9', 'r10', 'r11', 'r12', 'r13', 'r14', 'r15'}
context.os = 'linux'  # pylint: disable=assigning-non-slot
context.arch = 'amd64'  # pylint: disable=assigning-non-slot
libc = CDLL(None)
libc.mmap.argtypes = [c_void_p, c_uint64, c_int, c_int, c_int, c_int64]
libc.mmap.restype = c_void_p
libc.munmap.argtypes = [c_void_p, c_uint64]
libc.munmap.restype = c_int
libc.memcpy.argtypes = [c_void_p, c_void_p, c_uint64]
libc.memcpy.restype = c_int64
shellcode_functype = CFUNCTYPE(c_int64)
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

log = open('loggggg', 'w')


def exec_shellcode(shellcode):

    with open('f', 'wb') as f:
        f.write(shellcode)
    log.write('%s %s' % ("I'm going to execute shellcode\n", shellcode))
    print(disasm(shellcode))

    length = len(shellcode)
    addr = libc.mmap(0, length, PROT_READ | PROT_WRITE | PROT_EXEC,
                     MAP_PRIVATE | MAP_ANONYMOUS, -1, 0)
    if addr == 2 ** 64 - 1:
        sys.exit('mmap failed')
    libc.memcpy(addr, shellcode, length)
    func = shellcode_functype(addr)
    ret = func()
    if libc.munmap(addr, length) < 0:
        sys.exit('munmap failed')

    print("It's a good day! secret len = %d" % len(SECRET_KEY))
    return ret


def hash_data(data):
    digest = hashlib.sha256(SECRET_KEY + data).digest()
    return digest[:-1] + bytes([digest[-1] ^ BKEY])


SIGNATURE_LENGTH = len(hash_data(b''))


def sign_data(data):
    return binascii.hexlify(data + hash_data(data)).decode()


def verify_data(data):
    try:
        data = binascii.unhexlify(data)
    except ValueError:
        return None
    if len(data) < SIGNATURE_LENGTH:
        return None
    signature = data[-SIGNATURE_LENGTH:]
    data = data[:-SIGNATURE_LENGTH]
    if not secrets.compare_digest(hash_data(data), signature):
        return None
    return data


def sign_shellcode():
    msg = input('Give me your favorite message: ').strip().encode()  # nosec
    if len(msg) < 6 or len(msg) > 24:
        msg = b'Hello from shellcode'
    reg = input('Give me your favorite register: ').strip().lower()  # nosec
    if reg not in ALLOWED_REGS:
        reg = 'rcx'
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

    with open('shellcode', 'w') as f:
        f.write(sign_data(asm(asm_code)))
    print(f'Your signed shellcode is: {sign_data(asm(asm_code))}')


def execute_signed_shellcode():
    shellcode = input('Give me your signed shellcode: ').strip()  # nosec
    shellcode = verify_data(shellcode)
    if shellcode is None:
        print('Invalid format or signature')
        return
    if len(shellcode) > 256:
        print('Shellcode too long')
        return
    print('Signature valid, executing your shellcode...')
    # signal.alarm(SHELLCODE_ALARM_TIME)
    exec_shellcode(prologue + shellcode + epilogue)
    signal.alarm(GLOBAL_ALARM_TIME)


def main():
    signal.alarm(GLOBAL_ALARM_TIME)
    print('Signed Shellcoder')
    while True:
        print('+------------------------------+')
        print('| 1. Generate Signed Shellcode |')
        print('| 2. Execute Signed Shellcode  |')
        print('| 3. View Source Code          |')
        print('| 4. Exit                      |')
        print('+------------------------------+')
        option = input('Your option: ').strip()  # nosec
        if option == '1':
            signal.alarm(GLOBAL_ALARM_TIME)
            sign_shellcode()
        elif option == '2':
            signal.alarm(GLOBAL_ALARM_TIME)
            execute_signed_shellcode()
        elif option == '3':
            print(SOURCE, end='')
        elif option == '4':
            print('Bye!')
            break


if __name__ == '__main__':
    main()
