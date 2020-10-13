int __cdecl main(int argc, const char **argv, const char **envp)
{
    setbuf(stdin, 0LL);
    setbuf(stdout, 0LL);
    setbuf(stderr, 0LL);
    puts("Stack Overflooooow");
    stage1();
    return 0;
}