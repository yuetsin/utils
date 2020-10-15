int fight()
{
    puts("Choose your hero");
    int index = read_int();
    if ( index <= 0 || index > 5 )
        return puts("No no no.");
    if ( persons[0]->life >= persons[index]->life || strcmp(persons[0]->name, "BOSS") )
        return puts("Your hero failed our expect.");
    puts("How did you achieve this?! You are our true hero!\nEnjoy your fruit!");
    return system("/bin/sh");
}