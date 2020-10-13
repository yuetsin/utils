int stage2()
{
    int result; // eax
    int v1;     // [rsp+Ch] [rbp-4h]

    result = puts("Stage2");
    if (v1 != 305419896)
    {
        puts("stage2 failed.");
        exit(-1);
    }
    f3 = 1;
    return result;
}