#include <stdio.h>

char *ptrs[16];

int main(int argc, const char **argv, const char **envp)
{
	int flag;

	setbuf(stdout, 0LL);
	puts("Start our heap journey from old-school style!");
	puts("How many ways can you exploit this?");
	while ( 1 )
	{
		flag = read_int();
		switch (flag)
		{
		case 1:
			add();
			break;
		case 2:
			delete();
			break;
		case 3:
			edit();
			break;
		case 4:
			show();
			break;
		default:
			puts("Invalid");
			break;
		}
	}
}