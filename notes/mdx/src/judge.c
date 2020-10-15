signed __int64 __fastcall sub_400907(int a1, __int64 ptr)
{
	int v2; // ST0C_4
	signed __int64 result; // rax

	v2 = a1;
	*(_BYTE *)ptr = a1;
	*(_WORD *)(ptr + 1) = *(_WORD *)((char *)&v2 + 1);
	result = ptr + 3;
	*(_BYTE *)(ptr + 3) = HIBYTE(a1);
	return result;
}

int __fastcall sub_4009A3(const void *str)
{
	char s[32];
	memset(&s, 0, 0x20uLL);

	v3 = 1732584193;
	v4 = -271733879;
	v5 = -1732584194;
	v6 = 271733878;

	int i = 56;

	char *dest = malloc(64);

	memcpy(dest, str, 19);

	dest[19] = -128;
	for ( j = 20LL; j < 56; ++j )
		dest[j] = 0;

	sub_400907(152LL, &dest[i]);
	sub_400907(0LL, &dest[i + 4]);


	for ( l = 0; l < 16; ++l )
		v19[l] = sub_400956(&dest[4 * l]);
	v9 = v3;
	v10 = v4;
	v11 = v5;
	v12 = v6;
	for ( int m = 0; m <= 0x3F; ++m )
	{
		if ( m > 0xF )
		{
			if ( m > 0x1F )
			{
				if ( m > 0x2F )
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
	
	free(dest);
	sub_400907(v3, &s);
	sub_400907(v4, &s + 4);
	sub_400907(v5, &s + 8);
	sub_400907(v6, &s + 12);
	return memcmp(&s, &unk_602650, 0x10uLL);
}