signed __int64 __fastcall sub_400907(int a1, __int64 a2)
{
    int v2;                // ST0C_4
    signed __int64 result; // rax

    v2 = a1;
    *(_BYTE *)a2 = a1;
    *(_WORD *)(a2 + 1) = *(_WORD *)((char *)&v2 + 1);
    result = a2 + 3;
    *(_BYTE *)(a2 + 3) = HIBYTE(a1);
    return result;
}