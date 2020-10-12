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

from crack import *

libc = CDLL(None)
libc.mmap.argtypes = [c_void_p, c_uint64, c_int, c_int, c_int, c_int64]
libc.mmap.restype = c_void_p
libc.munmap.argtypes = [c_void_p, c_uint64]
libc.munmap.restype = c_int
libc.memcpy.argtypes = [c_void_p, c_void_p, c_uint64]
libc.memcpy.restype = c_int64
shellcode_functype = CFUNCTYPE(c_int64)

context.os = 'linux'  # pylint: disable=assigning-non-slot
context.arch = 'amd64'  # pylint: disable=assigning-non-slot


def exec_shellcode(shellcode):
    print("I'm going to execute shellcode", shellcode)
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
    return ret


# to_exec = get_real_payload()
to_exec = binascii.hexlify(prologue).decode(
) + generate_append_payload() + binascii.hexlify(epilogue).decode(
)

SHELLCODE_ALARM_TIME = 1

signal.alarm(SHELLCODE_ALARM_TIME)
exec_shellcode(binascii.unhexlify(to_exec))
