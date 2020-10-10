int __fastcall sub_4009A3(const void *a1)
{
    unsigned int v1;      // ST3C_4
    unsigned int v3;      // [rsp+10h] [rbp-D0h]
    unsigned int v4;      // [rsp+14h] [rbp-CCh]
    unsigned int v5;      // [rsp+18h] [rbp-C8h]
    unsigned int v6;      // [rsp+1Ch] [rbp-C4h]
    unsigned int l;       // [rsp+20h] [rbp-C0h]
    unsigned int m;       // [rsp+20h] [rbp-C0h]
    unsigned int v9;      // [rsp+24h] [rbp-BCh]
    unsigned int v10;     // [rsp+28h] [rbp-B8h]
    unsigned int v11;     // [rsp+2Ch] [rbp-B4h]
    unsigned int v12;     // [rsp+30h] [rbp-B0h]
    int v13;              // [rsp+34h] [rbp-ACh]
    int v14;              // [rsp+38h] [rbp-A8h]
    _BYTE *dest;          // [rsp+58h] [rbp-88h]
    unsigned __int64 i;   // [rsp+60h] [rbp-80h]
    unsigned __int64 j;   // [rsp+68h] [rbp-78h]
    unsigned __int64 k;   // [rsp+68h] [rbp-78h]
    int v19[16];          // [rsp+70h] [rbp-70h]
    char s;               // [rsp+B0h] [rbp-30h]
    int v21;              // [rsp+B4h] [rbp-2Ch]
    __int64 v22;          // [rsp+B8h] [rbp-28h]
    unsigned __int64 v23; // [rsp+D8h] [rbp-8h]

    v23 = __readfsqword(0x28u);
    memset(&s, 0, 0x20uLL);
    v3 = 1732584193;
    v4 = -271733879;
    v5 = -1732584194;
    v6 = 271733878;
    for (i = 20LL; (i & 0x3F) != 56; ++i)
        ;
    dest = malloc(i + 8);
    memcpy(dest, a1, 0x13uLL);
    dest[19] = -128;
    for (j = 20LL; i > j; ++j)
        dest[j] = 0;
    sub_400907(152LL, &dest[i]);
    sub_400907(0LL, &dest[i + 4]);
    for (k = 0LL; i > k; k += 64LL)
    {
        for (l = 0; l <= 0xF; ++l)
            v19[l] = sub_400956(&dest[4 * l + k]);
        v9 = v3;
        v10 = v4;
        v11 = v5;
        v12 = v6;
        for (m = 0; m <= 0x3F; ++m)
        {
            if (m > 0xF)
            {
                if (m > 0x1F)
                {
                    if (m > 0x2F)
                    {
                        v13 = v11 ^ (v10 | ~v12);
                        v14 = 7 * (_BYTE)m & 0xF;
                    }
                    else
                    {
                        v13 = v12 ^ v11 ^ v10;
                        v14 = (3 * (_BYTE)m + 5) & 0xF;
                    }
                }
                else
                {
                    v13 = v12 & v10 | v11 & ~v12;
                    v14 = (5 * (_BYTE)m + 1) & 0xF;
                }
            }
            else
            {
                v13 = v11 & v10 | v12 & ~v10;
                v14 = m;
            }
            v1 = v12;
            v12 = v11;
            v11 = v10;
            v10 += __ROL4__(v9 + v13 + dword_401280[m] + v19[v14], dword_401380[m]);
            v9 = v1;
        }
        v3 += v9;
        v4 += v10;
        v5 += v11;
        v6 += v12;
    }
    free(dest);
    sub_400907(v3, &s);
    sub_400907(v4, &v21);
    sub_400907(v5, &v22);
    sub_400907(v6, (char *)&v22 + 4);
    return memcmp(&s, &unk_602650, 0x10uLL);
}