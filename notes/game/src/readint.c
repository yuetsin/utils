int read_int()
{
    char buf[0x20]; // [rsp+0h] [rbp-20h]
    read(0, &buf, 0x10uLL);
    return atoi(buf);
}