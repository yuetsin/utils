int winning()
{
    puts("Stage4");
    if (!f1 || !f2 || !f3)
    {
        puts("alter flags through stages.");
        exit(-1);
    }
    return system("/bin/sh");
}