#!/usr/bin/env python3

from pwn import *
from pwnlib.asm import asm
from pwnlib.context import context
from wrapper import init_dataset

context.os = 'linux'
context.arch = 'amd64'

allowed_gadgets = init_dataset()

for gadget in list(allowed_gadgets):
    for digit in b'123456789':
        if digit in gadget:
            print(gadget)
            break
