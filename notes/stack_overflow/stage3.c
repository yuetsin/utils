int __fastcall stage3(int a1, int a2)
{
    int result; // eax

    result = puts("Stage3");
    if (a1 != -889275714 || a2 != -559038737)
    {
        puts("stage3 failed.");
        exit(-1);
    }
    f2 = 1;
    return result;
}