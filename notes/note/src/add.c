int add()
{
    puts("Index:");
    int index = read_int();
    puts("Size:");
    int size = read_int();
    char *buf = (char *)malloc(size);
    result = index;
    ptrs[index] = buf;
    return result;
}