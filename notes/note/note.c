//
// This file was generated by the Retargetable Decompiler
// Website: https://retdec.com
// Copyright (c) Retargetable Decompiler <info@retdec.com>
//

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

// ------------------------ Structures ------------------------

struct _IO_FILE {
    int32_t e0;
};

// ------------------- Function Prototypes --------------------

int64_t add(void);
int64_t delete(void);
int64_t edit(void);
int64_t read_int(void);
int64_t show(void);

// --------------------- Global Variables ---------------------

struct _IO_FILE * g1 = NULL; // 0x601080
int64_t g2 = 0; // 0x6010a0
int32_t g3;

// ------------------------ Functions -------------------------

// Address range: 0x400736 - 0x400795
int64_t read_int(void) {
    int64_t v1 = __readfsqword(40); // 0x40073e
    int64_t buf = 0; // bp-40, 0x40074d
    read(0, &buf, 16);
    int64_t str_as_i = atoi((char *)&buf); // 0x40078c
    if (v1 != __readfsqword(40)) {
        // 0x40078e
        __stack_chk_fail();
        str_as_i = &g3;
    }
    // 0x400793
    return str_as_i;
}

// Address range: 0x400795 - 0x4007eb
int64_t add(void) {
    // 0x400795
    puts("Index:");
    int64_t v1 = read_int(); // 0x4007ac
    puts("Size:");
    int64_t * mem = malloc((int32_t)read_int()); // 0x4007d3
    int64_t v2 = 0x100000000 * v1;
    *(int64_t *)(v2 / 0x20000000 + (int64_t)&g2) = (int64_t)mem;
    return v2 / 0x100000000;
}

// Address range: 0x4007eb - 0x400822
int64_t delete(void) {
    // 0x4007eb
    puts("Index:");
    int64_t v1 = read_int(); // 0x400802
    int64_t v2 = *(int64_t *)(0x100000000 * v1 / 0x20000000 + (int64_t)&g2); // 0x40080f
    free((int64_t *)v2);
    return &g3;
}

// Address range: 0x400822 - 0x400885
int64_t edit(void) {
    // 0x400822
    puts("Index:");
    int64_t v1 = read_int(); // 0x400839
    puts("Len:");
    int64_t nbyte = read_int(); // 0x400850
    puts("Input:");
    int64_t buf = *(int64_t *)(0x100000000 * v1 / 0x20000000 + (int64_t)&g2); // 0x40086d
    return read(0, (int64_t *)buf, (int32_t)nbyte);
}

// Address range: 0x400885 - 0x4008bc
int64_t show(void) {
    // 0x400885
    puts("Index:");
    int64_t v1 = read_int(); // 0x40089c
    int64_t str = *(int64_t *)(0x100000000 * v1 / 0x20000000 + (int64_t)&g2); // 0x4008a9
    return puts((char *)str);
}

// Address range: 0x4008bc - 0x40098b
int main(int argc, char ** argv) {
    // 0x4008bc
    setbuf(g1, NULL);
    puts("Start our heap journey from old-school style!");
    puts("How many ways can you exploit this?");
    while (true) {
      lab_0x4008ec:
        // 0x4008ec
        puts("1. Add");
        puts("2. Delete");
        puts("3. Edit");
        puts("4. Show");
        puts("Choice:");
        int32_t v1 = read_int(); // 0x40092e
        if (v1 == 2) {
            // 0x400957
            delete();
            goto lab_0x4008ec;
        } else {
            if (v1 > 2) {
                switch (v1) {
                    case 3: {
                        // 0x400963
                        edit();
                        goto lab_0x4008ec;
                    }
                    case 4: {
                        // 0x40096f
                        show();
                        goto lab_0x4008ec;
                    }
                    default: {
                        // 0x40097b
                        puts("Invalid");
                        goto lab_0x4008ec;
                    }
                }
            } else {
                if (v1 == 1) {
                    // 0x40094b
                    add();
                    goto lab_0x4008ec;
                } else {
                    // 0x40097b
                    puts("Invalid");
                    goto lab_0x4008ec;
                }
            }
        }
    }
}

// --------------- Dynamically Linked Functions ---------------

// void __stack_chk_fail(void);
// int atoi(const char * nptr);
// void free(void * ptr);
// void * malloc(size_t size);
// int puts(const char * s);
// ssize_t read(int fd, void * buf, size_t nbytes);
// void setbuf(FILE * restrict stream, char * restrict buf);

// --------------------- Meta-Information ---------------------

// Detected compiler/packer: gcc (5.4.0)
// Detected functions: 6
