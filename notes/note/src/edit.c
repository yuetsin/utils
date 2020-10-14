size_t edit()
{
    puts("Index:");
    int index = read_int();
    puts("Len:");
    int len = read_int();
    puts("Input:");
    return read(0, ptrs[index], len);
}