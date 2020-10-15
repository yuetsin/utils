int main(int a1, char **a2, char **a3)
{
    char s[64];

    alarm(60);
    memset(&s, 0, 50);
    puts("Your flag:");
    read(0, &s, 19);

    if ( strlen(&s) == 19 && !(unsigned int)judge(&s, &s) )
        puts("Right!");
    else
        puts("Wrong~");
    return 0LL;
}