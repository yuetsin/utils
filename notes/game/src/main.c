#include <stdint.h>
#include <stdio.h>

struct Person {
    int64_t power;
    char name[0x20];
}

struct Person** persons;
int hero_counter;

int main(int argc, const char** argv, const char** envp)
{
    setbuf(stdout, 0LL);

    srand(time(NULL));

    persons[0] = (struct Person *)malloc(40);

    persons[0].power = 9999999999999LL;
    
    strncpy(persons[0].name, "BOSS", 4);

    int flag; // [rsp+Ch] [rbp-4h]
    while (1) {
        switch (flag)
        {
        case 1:
            add();
            break;
        case 2:
            fight();
            break;
        }
    }
    return 0;
}