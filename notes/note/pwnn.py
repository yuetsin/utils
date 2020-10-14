#!/usr/bin/env python3

from pwn import *
from pwnlib.gdb import *
from binascii import *
from pwnlib.util.packing import u64, p64, u32, p32
from LibcSearcher import *
from time import sleep
# context.log_level = 'debug'
context.os = 'linux'
context.arch = 'amd64'
context.bits = 64
