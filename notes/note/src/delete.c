void delete()
{
    puts("Index:");
    int index = read_int();
    free(ptrs[index]);
}