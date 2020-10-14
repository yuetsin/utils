size_t add()
{
    if ( hero_counter > 5 )
    {
        puts("Person are full! Restart the game.");
        for ( int i = 5; i >= 0; --i )
            free((void *)persons[i]);
        hero_counter = 1;
    }

    persons[hero_counter] = (struct Person *)malloc(0x28);
    persons[hero_counter].power = rand() % 10000000;
    puts("Give your hero a name!");
    int ret = read(0, persons[hero_counter].name, 0x20);
    ++hero_counter;
    return ret;
}