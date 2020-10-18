#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int keybox_1[] = {0xD76AA478, 0xE8C7B756, 0x242070DB, 0xC1BDCEEE, 0xF57C0FAF,
            0x4787C62A, 0x0A8304613, 0x0FD469501, 0x698098D8, 0x8B44F7AF,
            0x0FFFF5BB1, 0x895CD7BE, 0x6B901122, 0x0FD987193, 0x0A679438E,
            0x49B40821, 0x0F61E2562, 0x0C040B340, 0x265E5A51, 0x0E9B6C7AA,
            0x0D62F105D, 0x2441453, 0x0D8A1E681, 0x0E7D3FBC8, 0x21E1CDE6,
            0x0C33707D6, 0x0F4D50D87, 0x455A14ED, 0x0A9E3E905, 0x0FCEFA3F8,
            0x676F02D9, 0x8D2A4C8A, 0x0FFFA3942, 0x8771F681, 0x6D9D6122,
            0x0FDE5380C, 0x0A4BEEA44, 0x4BDECFA9, 0x0F6BB4B60, 0x0BEBFBC70,
            0x289B7EC6, 0x0EAA127FA, 0x0D4EF3085, 0x4881D05, 0x0D9D4D039,
            0x0E6DB99E5, 0x1FA27CF8, 0x0C4AC5665, 0x0F4292244, 0x432AFF97,
            0x0AB9423A7, 0x0FC93A039, 0x655B59C3, 0x8F0CCC92, 0x0FFEFF47D,
            0x85845DD1, 0x6FA87E4F, 0x0FE2CE6E0, 0x0A3014314, 0x4E0811A1,
            0x0F7537E82, 0x0BD3AF235, 0x2AD7D2BB, 0x0EB86D391};

int keybox_2[] = {0x7, 0xC, 0x11, 0x16, 0x7, 0xC, 0x11, 0x16, 0x7, 0xC, 0x11, 0x16,
            0x7, 0xC, 0x11, 0x16, 0x5, 0x9, 0xE, 0x14, 0x5, 0x9, 0xE, 0x14, 0x5,
            0x9, 0xE, 0x14, 0x5, 0x9, 0xE, 0x14, 0x4, 0xB, 0x10, 0x17, 0x4, 0xB,
            0x10, 0x17, 0x4, 0xB, 0x10, 0x17, 4, 0xB, 0x10, 0x17, 0x6, 0xA,
            0xF, 0x15, 0x6, 0xA, 0xF, 0x15, 0x6, 0xA, 0xF, 0x15, 0x6, 0xA,
            0xF, 0x15};

void sub_400907(int a1, void * addr)
{
    *(int*)addr = a1;
}

unsigned long long sub_400956(unsigned long long *a1)
{
  return *a1;
}


int sub_4009A3(const void *a1)
{
    puts("4009a3 called\n");
  unsigned int v1; // ST3C_4
  unsigned int v3; // [rsp+10h] [rbp-D0h]
  unsigned int v4; // [rsp+14h] [rbp-CCh]
  unsigned int v5; // [rsp+18h] [rbp-C8h]
  unsigned int v6; // [rsp+1Ch] [rbp-C4h]
  unsigned int l; // [rsp+20h] [rbp-C0h]
  unsigned int m; // [rsp+20h] [rbp-C0h]
  unsigned int v9; // [rsp+24h] [rbp-BCh]
  unsigned int v10; // [rsp+28h] [rbp-B8h]
  unsigned int v11; // [rsp+2Ch] [rbp-B4h]
  unsigned int v12; // [rsp+30h] [rbp-B0h]
  int v13; // [rsp+34h] [rbp-ACh]
  int v14; // [rsp+38h] [rbp-A8h]
  char *dest = malloc(0x100); // [rsp+58h] [rbp-88h]
  unsigned long i; // [rsp+60h] [rbp-80h]
  unsigned long j; // [rsp+68h] [rbp-78h]
  unsigned long k; // [rsp+68h] [rbp-78h]
  int v19[16]; // [rsp+70h] [rbp-70h]
  char *s = calloc(0x20, 0); // [rsp+B0h] [rbp-30h]

  v3 = 1732584193;
  v4 = -271733879;
  v5 = -1732584194;
  v6 = 271733878;
  for ( i = 20LL; (i & 0x3F) != 56; ++i )
    ;
  dest = malloc(i + 8);
  memcpy(dest, a1, 0x13uLL);
  dest[19] = -128;
  for ( j = 20LL; i > j; ++j )
    dest[j] = 0;
  sub_400907(152LL, &dest[i]);
  sub_400907(0LL, &dest[i + 4]);
  for ( k = 0LL; i > k; k += 64LL )
  {
    for ( l = 0; l <= 0xF; ++l )
      v19[l] = sub_400956(&dest[4 * l + k]);
    v9 = v3;
    v10 = v4;
    v11 = v5;
    v12 = v6;
    for ( m = 0; m <= 0x3F; ++m )
    {
      if ( m > 0xF )
      {
        if ( m > 0x1F )
        {
          if ( m > 0x2F )
          {
            v13 = v11 ^ (v10 | ~v12);
            v14 = 7 * (char)m & 0xF;
          }
          else
          {
            v13 = v12 ^ v11 ^ v10;
            v14 = (3 * (char)m + 5) & 0xF;
          }
        }
        else
        {
          v13 = v12 & v10 | v11 & ~v12;
          v14 = (5 * (char)m + 1) & 0xF;
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
      v10 += (v9 + v13 + keybox_1[m] + v19[v14]) << keybox_2[m];
      v9 = v1;
    }
    v3 += v9;
    v4 += v10;
    v5 += v11;
    v6 += v12;
  }
  free(dest);
  sub_400907(v3, s);
  sub_400907(v4, s + 4);
  sub_400907(v5, s + 8);
  sub_400907(v6, s + 12);
  printf("%x\n%x\n%x\n%x\n", v3, v4, v5, v6);
  return 1;
}

int main()
{
  char* s = calloc(0x32, 1); // [rsp+0h] [rbp-40h]

//   alarm(0x3Cu);
  puts("Your flag:");
  read(0, s, 0x13uLL);
  int v3 = (strlen(s) == 19) && (!sub_4009A3(s));
  if ( v3 )
    puts("Right!");
  else
    puts("Wrong~");
  return 0LL;
}