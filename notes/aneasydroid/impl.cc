#include <iostream>
#include <cstdlib>
#include <cstring>

static int keybox[] = { 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 43, 47 };

int base64(const char * a1, unsigned int strlength, char * a3)
{
  unsigned int v3; // eax
  unsigned int v4; // eax
  unsigned int v5; // eax
  unsigned int v6; // eax
  unsigned int v7; // ST1C_4
  unsigned int v8; // eax
  unsigned int v9; // eax
  unsigned char v11; // [rsp+1Ah] [rbp-26h]
  unsigned char cur_char; // [rsp+1Bh] [rbp-25h]
  unsigned int v13; // [rsp+1Ch] [rbp-24h]
  unsigned int i; // [rsp+20h] [rbp-20h]
  signed int v15; // [rsp+24h] [rbp-1Ch]

  v15 = 0;
  v11 = 0;
  v13 = 0;
  for ( i = 0; i < strlength; ++i )
  {
    cur_char = *(char *)(a1 + i);
    if ( v15 )
    {
      if ( v15 == 1 )
      {
        v15 = 2;
        v4 = v13++;
        *(char *)(a3 + v4) = keybox[((signed int)cur_char >> 4) & 0xF | 16 * (v11 & 3)];
      }
      else if ( v15 == 2 )
      {
        v15 = 0;
        *(char *)(a3 + v13) = keybox[((signed int)cur_char >> 6) & 3 | 4 * (v11 & 0xF)];
        v5 = v13 + 1;
        v13 += 2;
        *(char *)(a3 + v5) = keybox[cur_char & 0x3F];
      }
    }
    else
    {
      v15 = 1;
      v3 = v13++;
      *(char *)(a3 + v3) = keybox[((signed int)cur_char >> 2) & 0x3F];
    }
    v11 = cur_char;
  }
  if ( v15 == 1 )
  {
    v6 = v13;
    v7 = v13 + 1;
    *(char *)(a3 + v6) = keybox[16 * (v11 & 3)];
    *(char *)(a3 + v7) = 61;
    v8 = v7 + 1;
    v13 = v7 + 2;
    *(char *)(a3 + v8) = 61;
  }
  else if ( v15 == 2 )
  {
    *(char *)(a3 + v13) = keybox[4 * (v11 & 0xF)];
    v9 = v13 + 1;
    v13 += 2;
    *(char *)(a3 + v9) = 61;
  }
  *(char *)(a3 + v13) = 0;
  return v13;
}

void modify_keybox() {

  int v0; // ST08_4
  int v1; // eax
  signed int i; // [rsp+Ch] [rbp-4h]

  srand(0);
  for ( i = 0; i < 100; ++i )
  {
    // swap keybox[v0] and keybox[v1]
    v0 = rand() % 64;
    v1 = rand() % 64;
    keybox[v0] += keybox[v1];
    keybox[v1] = keybox[v0] - keybox[v1];
    keybox[v0] -= keybox[v1];
  }

    printf("after modify, keybox is: \n");
  for (size_t i = 0; i < 64; i++)
  {
      printf("%d,", keybox[i]);
  }
}

int main(int argc, char** argv) {

    char buf[100];

    modify_keybox();

    base64(argv[1], strlen(argv[1]), &buf[0]);

    printf("%s\n", buf);
}

