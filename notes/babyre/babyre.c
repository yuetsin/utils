//
// This file was generated by the Retargetable Decompiler
// Website: https://retdec.com
// Copyright (c) Retargetable Decompiler <info@retdec.com>
//

#include <stdint.h>
#include <stdio.h>
#include <string.h>

// ------------------------ Structures ------------------------

struct _IO_FILE
{
    int32_t e0;
};

// ------------------- Function Prototypes --------------------

int64_t entry_point(void);
int64_t function_1000(void);
int64_t function_1003(void);
int64_t function_1090(int64_t a1);
void function_1093(int64_t *d);
int64_t printf(char *a1);
int32_t function_10a3(char *s);
int64_t function_10b0(int64_t *a1);
int32_t function_10b3(char *s);
int64_t function_10c0(void);
void __stack_chk_fail(void);
int64_t printf(char *a1);
int32_t printf(char *format, ...);
int64_t function_10e0(int64_t *a1, int64_t *a2, int64_t a3);
int32_t function_10e3(int64_t *s1, int64_t *s2, int32_t n);
int64_t function_10f0(int64_t *a1, int64_t a2, int64_t a3);
char *function_10f3(char *s, int32_t n, struct _IO_FILE *stream);
int64_t function_1103(int64_t a1, int64_t a2, int64_t a3, int64_t a4);
int64_t function_1160(void);
int64_t function_11a3(void);
int64_t function_11e0(void);
int64_t function_11e3(void);
int64_t function_11ec(void);
int64_t function_12f3(int64_t a1, int64_t a2, int64_t a3);
int64_t function_1363(void);
int64_t function_136b(void);

// --------------------- Global Variables ---------------------

int64_t g1 = 0x11e0;             // 0x3d90
int64_t g2 = 0x11a0;             // 0x3d98
int64_t g3 = 0x76758188807d7c3d; // 0x4020
int64_t g4 = 0;                  // 0x4040
char g5 = 0;                     // 0x4048
int32_t g6;

// ------------------------ Functions -------------------------

// Address range: 0x1000 - 0x1001
int64_t function_1000(void)
{
    // 0x1000
    int64_t result; // 0x1000
    return result;
}

// Address range: 0x1003 - 0x101b
int64_t function_1003(void)
{
    int64_t result = 0; // 0x1012
    if (*(int64_t *)0x3fe8 != 0)
    {
        // 0x1014
        __gmon_start__();
        result = &g6;
    }
    // 0x1016
    return result;
}

// Address range: 0x1090 - 0x1091
int64_t function_1090(int64_t a1)
{
    // 0x1090
    int64_t result; // 0x1090
    return result;
}

// Address range: 0x1093 - 0x109b
void function_1093(int64_t *d)
{
    // 0x1093
    __cxa_finalize(d);
}

// Address range: 0x10a0 - 0x10a1
int64_t printf(char *a1)
{
    // 0x10a0
    int64_t result; // 0x10a0
    return result;
}

// Address range: 0x10a3 - 0x10ab
int32_t function_10a3(char *s)
{
    // 0x10a3
    return puts(s);
}

// Address range: 0x10b0 - 0x10b1
int64_t function_10b0(int64_t *a1)
{
    // 0x10b0
    int64_t result; // 0x10b0
    return result;
}

// Address range: 0x10b3 - 0x10bb
int32_t function_10b3(char *s)
{
    // 0x10b3
    return strlen(s);
}

// Address range: 0x10c0 - 0x10c1
int64_t function_10c0(void)
{
    // 0x10c0
    int64_t result; // 0x10c0
    return result;
}

// Address range: 0x10d0 - 0x10d1
int64_t printf(char *a1)
{
    // 0x10d0
    int64_t result; // 0x10d0
    return result;
}

// Address range: 0x10d3 - 0x10db
int32_t printf(char *format, ...)
{
    // 0x10d3
    return printf(format);
}

// Address range: 0x10e0 - 0x10e1
int64_t function_10e0(int64_t *a1, int64_t *a2, int64_t a3)
{
    // 0x10e0
    int64_t result; // 0x10e0
    return result;
}

// Address range: 0x10e3 - 0x10eb
int32_t function_10e3(int64_t *s1, int64_t *s2, int32_t n)
{
    // 0x10e3
    return memcmp(s1, s2, n);
}

// Address range: 0x10f0 - 0x10f1
int64_t function_10f0(int64_t *a1, int64_t a2, int64_t a3)
{
    // 0x10f0
    int64_t result; // 0x10f0
    return result;
}

// Address range: 0x10f3 - 0x10fb
char *function_10f3(char *s, int32_t n, struct _IO_FILE *stream)
{
    // 0x10f3
    return fgets(s, n, stream);
}

// Address range: 0x1100 - 0x1101
int64_t entry_point(void)
{
    // 0x1100
    int64_t result; // 0x1100
    return result;
}

// Address range: 0x1103 - 0x1159
int64_t function_1103(int64_t a1, int64_t a2, int64_t a3, int64_t a4)
{
    // 0x1103
    int64_t v1; // 0x1103
    __libc_start_main(0x11e9, (int32_t)a4, (char **)&v1, (void (*)())0x12f0, (void (*)())0x1360, (void (*)())a3);
    __asm_hlt();
    return &g4;
}

// Address range: 0x1160 - 0x1199
int64_t function_1160(void)
{
    // 0x1160
    return 0;
}

// Address range: 0x11a3 - 0x11d9
int64_t function_11a3(void)
{
    // 0x11a3
    if (g5 != 0)
    {
        // 0x11d8
        int64_t result; // 0x11a3
        return result;
    }
    // 0x11ad
    int64_t result2; // 0x11a3
    if (*(int64_t *)0x3ff8 != 0)
    {
        // 0x11bb
        result2 = function_1090(*(int64_t *)0x4008);
    }
    // 0x11c7
    g5 = 1;
    return result2;
}

// Address range: 0x11e0 - 0x11e1
int64_t function_11e0(void)
{
    // 0x11e0
    int64_t result; // 0x11e0
    return result;
}

// Address range: 0x11e3 - 0x11e9
int64_t function_11e3(void)
{
    // 0x11e3
    return function_1160();
}

// Address range: 0x11ec - 0x12e8
int main(void)
{
    printf("Input flag: ");
    int64_t v2; // bp-88, 0x11ec
    function_10f0(&v2, 64, g4);
    int32_t v3 = function_10b0(&v2); // 0x1239
    if (v3 < 1)
    {
        // 0x12c1
        printf("Error");
        goto lab_0x12d2;
    }
    else
    {
        int32_t v4 = v3 - 1;                   // 0x1245
        int64_t v5;                            // bp-8, 0x11ec
        int64_t v6 = (int64_t)&v5 - 80;        // 0x124a
        char *v7 = (char *)(v6 + (int64_t)v4); // 0x124a
        int32_t v8 = v3;                       // 0x1251
        if (*v7 == 10)
        {
            // 0x1253
            *v7 = 0;
            v8 = v4;
        }
        int64_t v9 = 0; // 0x1265
        if (v8 != 32)
        {
            // 0x12c1
            printf("Error");
            goto lab_0x12d2;
        }
        else
        {
            char *buf = (char *)(v9 + v6); // 0x1275
            *buf += 13;
            v9 += 1

            // Python 乱入
            for ch in buf:
                *buf += 13
            while (v11 != 32)
            {
                // 0x1270
                buf = (char *)(v9 + v6);
                *buf += 13;
                v11 = v9 + 1;
                v9 = v11;
            }
            // 0x1292
            if ((int32_t)memcmp(&v2, &g3, 32) != 0)
            {
                // 0x12c1
                printf("Error");
                goto lab_0x12d2;
            }
            else
            {
                // 0x12ae
                printf("Correct");
                goto lab_0x12d2;
            }
        }
    }

    return 0;
}

// Address range: 0x12f3 - 0x1355
int64_t function_12f3(int64_t a1, int64_t a2, int64_t a3)
{
    int64_t result = function_1000(); // 0x131c
    if ((int64_t)&g2 - (int64_t)&g1 >> 3 == 0)
    {
        // 0x1346
        return result;
    }
    int64_t v1 = 0; // 0x1325
    while (v1 + 1 != (int64_t)&g2 - (int64_t)&g1 >> 3)
    {
        // 0x1330
        v1++;
    }
    // 0x1346
    return result;
}

// Address range: 0x1363 - 0x1365
int64_t function_1363(void)
{
    // 0x1363
    int64_t result; // 0x1363
    return result;
}

// Address range: 0x136b - 0x1375
int64_t function_136b(void)
{
    // 0x136b
    int64_t result; // 0x136b
    return result;
}

// --------------- Dynamically Linked Functions ---------------

// void __cxa_finalize(void * d);
// void __gmon_start__(void);
// int __libc_start_main(int *(main)(int, char **, char **), int argc, char ** ubp_av, void(* init)(void), void(* fini)(void), void(* rtld_fini)(void), void(* stack_end));
// void __stack_chk_fail(void);
// char * fgets(char * restrict s, int n, FILE * restrict stream);
// int memcmp(const void * s1, const void * s2, size_t n);
// int printf(const char * restrict format, ...);
// int puts(const char * s);
// size_t strlen(const char * s);

// --------------------- Meta-Information ---------------------

// Detected compiler/packer: gcc (9.3.0)
// Detected functions: 26