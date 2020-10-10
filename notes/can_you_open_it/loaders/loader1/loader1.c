#define _GNU_SOURCE
#include <unistd.h>
#include <linux/seccomp.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/prctl.h>

void install_seccomp() {
  static unsigned char filter[] = {32,0,0,0,4,0,0,0,21,0,0,4,62,0,0,192,32,0,0,0,0,0,0,0,53,0,2,0,0,0,0,64,21,0,1,0,2,0,0,0,6,0,0,0,0,0,255,127,6,0,0,0,0,0,0,0};
  struct prog {
    unsigned short len;
    unsigned char *filter;
  } rule = {
    .len = sizeof(filter) >> 3,
    .filter = filter
  };
  if(prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0) < 0) { perror("prctl(PR_SET_NO_NEW_PRIVS)"); exit(2); }
  if(prctl(PR_SET_SECCOMP, SECCOMP_MODE_FILTER, &rule) < 0) { perror("prctl(PR_SET_SECCOMP)"); exit(2); }
}

int main(int argc, char **argv) {
	gid_t egid = getegid();
	setresgid(egid, egid, egid);
	install_seccomp();
	execvp(argv[1], &argv[1]);
	return 0;
}

