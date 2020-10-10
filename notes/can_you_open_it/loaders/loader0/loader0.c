#define _GNU_SOURCE
#include <unistd.h>

void install_seccomp() {
	;
}

int main(int argc, char **argv) {
	gid_t egid = getegid();
	setresgid(egid, egid, egid);
	install_seccomp();
	execvp(argv[1], &argv[1]);
	return 0;
}

