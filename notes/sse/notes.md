# SSE

> Pseudo Code

读读伪代码吧…

```c
void __fastcall __noreturn main(__int64 a1, char **a2, char **a3)
{
  __m128d v3; // STE0_16
  __m128d s1; // [rsp+1B0h] [rbp-D0h]
  char v5; // [rsp+1C0h] [rbp-C0h]
  char s; // [rsp+240h] [rbp-40h]
  unsigned __int64 v7; // [rsp+248h] [rbp-38h]
  __m128d v8; // [rsp+250h] [rbp-30h]
  unsigned __int64 v9; // [rsp+278h] [rbp-8h]

  v9 = __readfsqword(0x28u);
  memset(&s, 0, 0x32uLL);
  scanf("%32s", &s);
  s1 = _mm_cmpeq_pd(
         _mm_add_pd(
           _mm_mul_pd(_mm_unpckl_pd((__m128d)*(unsigned __int64 *)&s, (__m128d)*(unsigned __int64 *)&s), unk_201010),
           _mm_mul_pd(_mm_unpckl_pd((__m128d)v7, (__m128d)v7), unk_201020)),
         unk_201030);
  if ( memcmp(&s1, &unk_BA0, 0x10uLL) || s != 48 || (_BYTE)v7 != 89 )
  {
    puts("Fail~");
    exit(0);
  }
  v3 = _mm_xor_pd(*(__m128d *)&s, v8);
  memset(&v5, 0, 0x80uLL);
  *(__m128d *)&v5 = v3;
  if ( memcmp(&v5, &unk_201040, 0x10uLL) )
  {
    puts("Fail~");
    exit(0);
  }
  puts("Right!");
  exit(0);
}
```

还是 Python 仿写：

