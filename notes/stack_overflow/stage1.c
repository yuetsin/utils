ssize_t stage1()
{
    ssize_t result; // rax
    __int64 buf;    // [rsp+0h] [rbp-30h]
    __int64 v2;     // [rsp+8h] [rbp-28h]
    __int64 v3;     // [rsp+10h] [rbp-20h]
    __int64 v4;     // [rsp+18h] [rbp-18h]
    int v5;         // [rsp+2Ch] [rbp-4h]

    v5 = 0;
    buf = 0LL;
    v2 = 0LL;
    v3 = 0LL;
    v4 = 0LL;
    puts("Stage1");
    result = read(0, &buf, 0x100uLL);
    if (v5 != -2023406815)
    {
        puts("stage1 failed.");
        exit(-1);
    }
    f1 = 1;
    return result;
}