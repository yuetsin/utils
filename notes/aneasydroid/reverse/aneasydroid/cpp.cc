unsigned __int64 __fastcall Java_com_test_test1_MainActivity_stringFromJNI(_JNIEnv *a1)
{
  const char *v1; // rsi
  unsigned __int64 result; // rax
  __int64 v3; // [rsp+8h] [rbp-58h]
  char v4; // [rsp+40h] [rbp-20h]
  unsigned __int64 v5; // [rsp+58h] [rbp-8h]

  v5 = __readfsqword(0x28u);
  sub_F3D0(&v4, "Hello from C++");
  v1 = (const char *)sub_F460(&v4);
  v3 = _JNIEnv::NewStringUTF(a1, v1);
  std::__ndk1::basic_string<char,std::__ndk1::char_traits<char>,std::__ndk1::allocator<char>>::~basic_string(&v4, v1);
  result = v5;
  if ( __readfsqword(0x28u) == v5 )
    result = v3;
  return result;
}

char byte_3A010[] =  { 41, 42, 43, 44, 45, 46, 47, 48, 49, 4A, 4B
.data:000000000003A010                 db 4Ch, 4Dh, 4Eh, 4Fh, 50h, 51h, 52h, 53h, 54h, 55h, 56h
.data:000000000003A010                 db 57h, 58h, 59h, 5Ah, 61h, 62h, 63h, 64h, 65h, 66h, 67h
.data:000000000003A010                 db 68h, 69h, 6Ah, 6Bh, 6Ch, 6Dh, 6Eh, 6Fh, 70h, 71h, 72h
.data:000000000003A010                 db 73h, 74h, 75h, 76h, 77h, 78h, 79h, 7Ah, 30h, 31h, 32h
.data:000000000003A010                 db 33h, 34h, 35h, 36h, 37h, 38h, 39h, 2Bh, 2Fh

__int64 __fastcall sub_F4E0(char * a1, unsigned int strlength, char * a3)
{
  unsigned int v3; // eax
  unsigned int v4; // eax
  unsigned int v5; // eax
  unsigned int v6; // eax
  unsigned int v7; // ST1C_4
  unsigned int v8; // eax
  unsigned int v9; // eax
  unsigned __int8 v11; // [rsp+1Ah] [rbp-26h]
  unsigned __int8 cur_char; // [rsp+1Bh] [rbp-25h]
  unsigned int v13; // [rsp+1Ch] [rbp-24h]
  unsigned int i; // [rsp+20h] [rbp-20h]
  signed int v15; // [rsp+24h] [rbp-1Ch]

  v15 = 0;
  v11 = 0;
  v13 = 0;
  for ( i = 0; i < strlength; ++i )
  {
    cur_char = *(_BYTE *)(a1 + i);
    if ( v15 )
    {
      if ( v15 == 1 )
      {
        v15 = 2;
        v4 = v13++;
        *(_BYTE *)(a3 + v4) = byte_3A010[((signed int)cur_char >> 4) & 0xF | 16 * (v11 & 3)];
      }
      else if ( v15 == 2 )
      {
        v15 = 0;
        *(_BYTE *)(a3 + v13) = byte_3A010[((signed int)cur_char >> 6) & 3 | 4 * (v11 & 0xF)];
        v5 = v13 + 1;
        v13 += 2;
        *(_BYTE *)(a3 + v5) = byte_3A010[cur_char & 0x3F];
      }
    }
    else
    {
      v15 = 1;
      v3 = v13++;
      *(_BYTE *)(a3 + v3) = byte_3A010[((signed int)cur_char >> 2) & 0x3F];
    }
    v11 = cur_char;
  }
  if ( v15 == 1 )
  {
    v6 = v13;
    v7 = v13 + 1;
    *(_BYTE *)(a3 + v6) = byte_3A010[16 * (v11 & 3)];
    *(_BYTE *)(a3 + v7) = 61;
    v8 = v7 + 1;
    v13 = v7 + 2;
    *(_BYTE *)(a3 + v8) = 61;
  }
  else if ( v15 == 2 )
  {
    *(_BYTE *)(a3 + v13) = byte_3A010[4 * (v11 & 0xF)];
    v9 = v13 + 1;
    v13 += 2;
    *(_BYTE *)(a3 + v9) = 61;
  }
  *(_BYTE *)(a3 + v13) = 0;
  return v13;
}

_BOOL8 __fastcall Java_com_test_test1_MainActivity_checkflag2(__int64 a1, __int64 strlength, __int64 a3)
{
  char *v3; // ST20_8
  void *s; // ST18_8
  unsigned int v5; // eax

  v3 = (char *)(_JNIEnv::GetStringUTFChars(a1, a3, 0LL) + 13);
  sub_F950();
  s = malloc(0x100uLL);
  memset(s, 0, 0x100uLL);
  v5 = strlen(v3);
  sub_F4E0(v3, v5, s);
  return strcmp((const char *)s, "CGQGVM1cCMzSqpNxqI0WVwuMoM3rq9V8VKoco9qXC9C=") == 0;
}