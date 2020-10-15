#include <stdio.h>
#include <stdlib.h>

char keybox_1[] = "\xef\x5d\x33\x73\xb4\x4d\x04\x58\xef\x5d\x33\x73\xb4\x4d\x14\x58";
char keybox_2[] = "\x00\x00\x00\x00\x00\x00\x08\x40\x00\x00\x00\x00\x00\x00\x10\x40";
char keybox_3[] = "\xaa\xb1\xc2\xa2\x81\x48\x85\x77\xa4\x5e\xcb\xec\x9c\x51\x93\x77";
char keybox_4[] = "\x6f\x5e\x35\x36\x3e\x1e\x5f\x6a\x6d\x6f\x5d\x01\x14\x30\x66\x0a";

char target[] = "\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"
int main(int argc, char** argv) {
    char s[128];

    scanf("%32s", s);

    uint128_t v7;
    uint128_t v8;

    char *buf = _mm_cmpeq_pd(
         _mm_add_pd(
           _mm_mul_pd(_mm_unpckl_pd((__m128d)*(unsigned __int64 *)&s, (__m128d)*(unsigned __int64 *)&s), keybox_1),
           _mm_mul_pd(_mm_unpckl_pd(v7, v7), keybox_2)),
         keybox_3);

 if ( memcmp(&s1, &unk_BA0, 0x10uLL) || s != 48 || (_BYTE)v7 != 89 )
  {
    puts("Fail~");
    exit(0);
  }
}