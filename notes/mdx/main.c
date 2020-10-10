__int64 __fastcall main(__int64 a1, char **a2, char **a3)
{
    bool v3;             // al
    char s;              // [rsp+0h] [rbp-40h]
    unsigned __int64 v6; // [rsp+38h] [rbp-8h]

    v6 = __readfsqword(0x28u);
    setvbuf(stdout, 0LL, 2, 0LL);
    setvbuf(stdin, 0LL, 1, 0LL);
    setvbuf(stderr, 0LL, 2, 0LL);
    alarm(0x3Cu);
    memset(&s, 0, 0x32uLL);
    puts("Your flag:");
    read(0, &s, 0x13uLL);
    v3 = strlen(&s) == 19 && !(unsigned int)sub_4009A3(&s, &s);
    if (v3)
        puts("Right!");
    else
        puts("Wrong~");
    return 0LL;
}