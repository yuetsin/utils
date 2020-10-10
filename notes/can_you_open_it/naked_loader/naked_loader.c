#define _GNU_SOURCE
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
    gid_t egid = getegid();
    setresgid(egid, egid, egid);
    // install_seccomp();
    execvp(argv[1], &argv[1]);
    return 0;
}
