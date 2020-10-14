#include <stdio.h>

char *ptrs[16];

int main(int argc, const char **argv, const char **envp)
{
	int flag; // eax

	setbuf(stdout, 0LL);
	puts("Start our heap journey from old-school style!");
	puts("How many ways can you exploit this?");
	while ( 1 )
	{
		while ( 1 )
		{
			puts("1. Add");
			puts("2. Delete");
			puts("3. Edit");
			puts("4. Show");
			puts("Choice:");
			flag = read_int();
			if ( flag != 2 )
				break;
			delete();
		}
		if ( flag > 2 )
		{
			if ( flag == 3 )
			{
				edit();
			}
			else if ( flag == 4 )
			{
				show();
			}
			else
			{
invalid:
				puts("Invalid");
			}
		}
		else
		{
			if ( flag != 1 )
				goto invalid;
			add();
		}
	}
}